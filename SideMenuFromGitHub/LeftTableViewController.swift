//
//  LeftTableViewController.swift
//  SideMenuFromGitHub
//
//  Created by Nirvana on 5/5/15.
//  Copyright (c) 2015 Nirvana. All rights reserved.
//

import UIKit

class LeftTableViewController: UITableViewController {

    var dataSource = [String]()
    
    var LeftStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    var userInfoViewControllerNV: UINavigationController?
    var contentsOneViewControllerNV: UINavigationController?
    var contentsTwoViewControllerNV: UINavigationController?
    var contentsThreeViewControllerNV: UINavigationController?
    var contentsFourViewControllerNV: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = ["UserInfo","One","Two","Three","Four"]
        
        var userInfoViewController = LeftStoryboard.instantiateViewControllerWithIdentifier("UserInfoViewController") as! UserInfoViewController
        userInfoViewController.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        userInfoViewController.addRightBarButtonWithImage(UIImage(named:"ic_notifications_black_24dp")!)
        self.userInfoViewControllerNV = UINavigationController(rootViewController: userInfoViewController)
        
        var contentsOneViewController = LeftStoryboard.instantiateViewControllerWithIdentifier("ContentsOneViewController") as! ContentsOneViewController
        contentsOneViewController.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        contentsOneViewController.addRightBarButtonWithImage(UIImage(named:"ic_notifications_black_24dp")!)
        self.contentsOneViewControllerNV = UINavigationController(rootViewController: contentsOneViewController)
        
        var contentsTwoViewController = LeftStoryboard.instantiateViewControllerWithIdentifier("ContentsTwoViewController") as! ContentsTwoViewController
        contentsTwoViewController.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        contentsTwoViewController.addRightBarButtonWithImage(UIImage(named:"ic_notifications_black_24dp")!)
        self.contentsTwoViewControllerNV = UINavigationController(rootViewController: contentsTwoViewController)
        
        var contentsThreeViewController = LeftStoryboard.instantiateViewControllerWithIdentifier("ContentsThreeViewController") as! ContentsThreeViewController
        contentsThreeViewController.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        contentsThreeViewController.addRightBarButtonWithImage(UIImage(named:"ic_notifications_black_24dp")!)
        self.contentsThreeViewControllerNV = UINavigationController(rootViewController: contentsThreeViewController)
        
        var contentsFourViewController = LeftStoryboard.instantiateViewControllerWithIdentifier("ContentsFourViewController") as! ContentsFourViewController
        contentsFourViewController.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        contentsFourViewController.addRightBarButtonWithImage(UIImage(named:"ic_notifications_black_24dp")!)
        self.contentsFourViewControllerNV = UINavigationController(rootViewController: contentsFourViewController)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return dataSource.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("UserInfoTableViewCell", forIndexPath: indexPath) as! UserInfoTableViewCell
            
            //StoryBoard中已配置好
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("MenuTableViewCell", forIndexPath: indexPath) as! MenuTableViewCell
            
            cell.MenuLabel.text = dataSource[indexPath.row]
            
            self.tableView.separatorStyle = .None
            
            return cell
        }
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    
        if indexPath.row == 0 {
            return 140
        }

        return 60
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        changViewController(indexPath.row)
    }
    
    func changViewController(row: Int) {
        
        switch row {
        case 0:
            self.slideMenuController()?.changeMainViewController(userInfoViewControllerNV!, close: true)
        case 1:
            self.slideMenuController()?.changeMainViewController(contentsOneViewControllerNV!, close: true)
        case 2:
            self.slideMenuController()?.changeMainViewController(contentsTwoViewControllerNV!, close: true)
        case 3:
            self.slideMenuController()?.changeMainViewController(contentsThreeViewControllerNV!, close: true)
        case 4:
            self.slideMenuController()?.changeMainViewController(contentsFourViewControllerNV!, close: true)
        default:
            break
        }
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
