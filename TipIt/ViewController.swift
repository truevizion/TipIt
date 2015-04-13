//
//  ViewController.swift
//  TipIt
//
//  Created by admin on 3/27/15.
//  Copyright (c) 2015 truevisionz. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var split: UITextField!
    
    @IBOutlet weak var splitTotal: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalBillLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        splitTotal.text = "$0.00"
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func splitBill(sender: AnyObject) {
        
        var splitNumber = NSString(string: split.text).doubleValue
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * 0.2
        var total = billAmount + tip
        
        var splitTot = total/splitNumber
        splitTotal.text = "$\(splitTotal)"
        
        splitTotal.text = String(format: "$%.2f",total/splitNumber)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.tipLabel.alpha = 0.3
            self.tipControl.alpha = 0.3
        })
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
       println("User editing bill")
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing (true)
        
        println(brandNewString("frank"))
    }
   
    func brandNewString(name: String) -> String {
        return "jdjjfdj: \(name)"
    }
}

