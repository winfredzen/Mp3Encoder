//
//  ViewController.m
//  AduioEncoder
//
//  Created by 王振 on 2018/3/10.
//  Copyright © 2018年 wangzhen. All rights reserved.
//

#import "ViewController.h"
#import "mp3_encoder.h"

@interface ViewController ()

- (IBAction)startEncode:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startEncode:(id)sender {
    
    NSString *pcmPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"vocal.pcm"];
    
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *mp3Path = [documentsDirectory stringByAppendingPathComponent:@"vocal.mp3"];
    
    NSLog(@"mp3Path = %@", mp3Path);
    
    Mp3Encoder *encoder = new Mp3Encoder();
    int sampleRate = 44100;
    int channels = 2;
    int bitRate = 128 * 1024;
    
    encoder->Init([pcmPath cStringUsingEncoding:NSUTF8StringEncoding],
                  [mp3Path cStringUsingEncoding:NSUTF8StringEncoding],
                  sampleRate,
                  channels,
                  bitRate);
    
    encoder->Encode();
    encoder->Destory();
    
    delete encoder;
    
    NSLog(@"encode success");
    
}
@end
