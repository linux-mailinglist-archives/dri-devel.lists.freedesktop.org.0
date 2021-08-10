Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A96483E85BB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 23:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47B38973E;
	Tue, 10 Aug 2021 21:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124A98973E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 21:54:41 +0000 (UTC)
Date: Tue, 10 Aug 2021 23:54:31 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [Letux-kernel] [PATCH 8/8] drm/ingenic: Attach bridge chain to
 encoders
To: Paul Boddie <paul@boddie.org.uk>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, David Airlie
 <airlied@linux.ie>, linux-mips <linux-mips@vger.kernel.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 list@opendingux.net, Sam Ravnborg <sam@ravnborg.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Message-Id: <VU8NXQ.G9EDMFM6NILW@crapouillou.net>
In-Reply-To: <1766447.FbDIzoYTkO@jason>
References: <20210808134526.119198-1-paul@crapouillou.net>
 <2242071.3D3ZAXhqrE@jason> <OV5MXQ.C3JR71EBG5P51@crapouillou.net>
 <1766447.FbDIzoYTkO@jason>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,
[...]

> Encoders:
> id      crtc    type    possible crtcs  possible clones
> 34      32      DPI     0x00000001      0x00000001
> 
> Connectors:
> id      encoder status          name            size (mm)       modes
> encoders
> 35      34      connected       HDMI-A-1        340x270         17    
>   34
>   modes:
>         index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
>   #0 1280x1024 60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000 
> flags:
> phsync, pvsync; type: preferred, driver
>   #1 1280x1024 75.02 1280 1296 1440 1688 1024 1025 1028 1066 135000 
> flags:
> phsync, pvsync; type: driver
>   #2 1280x960 60.00 1280 1376 1488 1800 960 961 964 1000 108000 
> flags: phsync,
> pvsync; type: driver
>   #3 1152x864 75.00 1152 1216 1344 1600 864 865 868 900 108000 flags: 
> phsync,
> pvsync; type: driver
>   #4 1024x768 75.03 1024 1040 1136 1312 768 769 772 800 78750 flags: 
> phsync,
> pvsync; type: driver
>   #5 1024x768 70.07 1024 1048 1184 1328 768 771 777 806 75000 flags: 
> nhsync,
> nvsync; type: driver
>   #6 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000 flags: 
> nhsync,
> nvsync; type: driver
>   #7 832x624 74.55 832 864 928 1152 624 625 628 667 57284 flags: 
> nhsync,
> nvsync; type: driver
>   #8 800x600 75.00 800 816 896 1056 600 601 604 625 49500 flags: 
> phsync,
> pvsync; type: driver
>   #9 800x600 72.19 800 856 976 1040 600 637 643 666 50000 flags: 
> phsync,
> pvsync; type: driver
>   #10 800x600 60.32 800 840 968 1056 600 601 605 628 40000 flags: 
> phsync,
> pvsync; type: driver
>   #11 800x600 56.25 800 824 896 1024 600 601 603 625 36000 flags: 
> phsync,
> pvsync; type: driver
>   #12 640x480 75.00 640 656 720 840 480 481 484 500 31500 flags: 
> nhsync,
> nvsync; type: driver
>   #13 640x480 72.81 640 664 704 832 480 489 492 520 31500 flags: 
> nhsync,
> nvsync; type: driver
>   #14 640x480 66.67 640 704 768 864 480 483 486 525 30240 flags: 
> nhsync,
> nvsync; type: driver
>   #15 640x480 59.94 640 656 752 800 480 490 492 525 25175 flags: 
> nhsync,
> nvsync; type: driver
>   #16 720x400 70.08 720 738 846 900 400 412 414 449 28320 flags: 
> nhsync,
> pvsync; type: driver
>   props:
>         1 EDID:
>                 flags: immutable blob
>                 blobs:
> 
>                 value:
>                         00ffffffffffff00047232ad01010101
>                         2d0e010380221b782aaea5a6544c9926
>                         145054bfef0081808140714f01010101
>                         010101010101302a009851002a403070
>                         1300520e1100001e000000ff00343435
>                         3030353444454330300a000000fc0041
>                         4c313731350a202020202020000000fd
>                         00384c1e520e000a2020202020200051
>         2 DPMS:
>                 flags: enum
>                 enums: On=0 Standby=1 Suspend=2 Off=3
>                 value: 3
>         5 link-status:
>                 flags: enum
>                 enums: Good=0 Bad=1
>                 value: 0
>         6 non-desktop:
>                 flags: immutable range
>                 values: 0 1
>                 value: 0
>         4 TILE:
>                 flags: immutable blob
>                 blobs:
> 
>                 value:
>         20 CRTC_ID:
>                 flags: object
>                 value: 32
> 
> CRTCs:
> id      fb      pos     size
> 32      36      (0,0)   (1280x1024)
>   #0  60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000 flags: 
> phsync,
> pvsync; type:
>   props:
>         22 ACTIVE:
>                 flags: range
>                 values: 0 1
>                 value: 0
>         23 MODE_ID:
>                 flags: blob
>                 blobs:
> 
>                 value:
>                         e0a5010000053005a005980600000004
>                         010404042a0400003c00000005000000
>                         00000000000000000000000000000000
>                         00000000000000000000000000000000
>                         00000000
>         19 OUT_FENCE_PTR:
>                 flags: range
>                 values: 0 18446744073709551615
>                 value: 0
>         24 VRR_ENABLED:
>                 flags: range
>                 values: 0 1
>                 value: 0
>         28 GAMMA_LUT:
>                 flags: blob
>                 blobs:
> 
>                 value:
>         29 GAMMA_LUT_SIZE:
>                 flags: immutable range
>                 values: 0 4294967295
>                 value: 256
> 
> Planes:
> id      crtc    fb      CRTC x,y        x,y     gamma size      
> possible crtcs
> 31      32      36      0,0             0,0     0               
> 0x00000001
>   formats: XR15 RG16 RG24 XR24 XR30
>   props:
>         8 type:
>                 flags: immutable enum
>                 enums: Overlay=0 Primary=1 Cursor=2
>                 value: 1
>         17 FB_ID:
>                 flags: object
>                 value: 36
>         18 IN_FENCE_FD:
>                 flags: signed range
>                 values: -1 2147483647
>                 value: -1
>         20 CRTC_ID:
>                 flags: object
>                 value: 32
>         13 CRTC_X:
>                 flags: signed range
>                 values: -2147483648 2147483647
>                 value: 0
>         14 CRTC_Y:
>                 flags: signed range
>                 values: -2147483648 2147483647
>                 value: 0
>         15 CRTC_W:
>                 flags: range
>                 values: 0 2147483647
>                 value: 1280
>         16 CRTC_H:
>                 flags: range
>                 values: 0 2147483647
>                 value: 1024
>         9 SRC_X:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         10 SRC_Y:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         11 SRC_W:
>                 flags: range
>                 values: 0 4294967295
>                 value: 83886080
>         12 SRC_H:
>                 flags: range
>                 values: 0 4294967295
>                 value: 67108864
> 33      0       0       0,0             0,0     0               
> 0x00000001
>   formats: C8   XR15 RG16 RG24 XR24 XR30
>   props:
>         8 type:
>                 flags: immutable enum
>                 enums: Overlay=0 Primary=1 Cursor=2
>                 value: 0
>         17 FB_ID:
>                 flags: object
>                 value: 0
>         18 IN_FENCE_FD:
>                 flags: signed range
>                 values: -1 2147483647
>                 value: -1
>         20 CRTC_ID:
>                 flags: object
>                 value: 0
>         13 CRTC_X:
>                 flags: signed range
>                 values: -2147483648 2147483647
>                 value: 0
>         14 CRTC_Y:
>                 flags: signed range
>                 values: -2147483648 2147483647
>                 value: 0
>         15 CRTC_W:
>                 flags: range
>                 values: 0 2147483647
>                 value: 0
>         16 CRTC_H:
>                 flags: range
>                 values: 0 2147483647
>                 value: 0
>         9 SRC_X:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         10 SRC_Y:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         11 SRC_W:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
>         12 SRC_H:
>                 flags: range
>                 values: 0 4294967295
>                 value: 0
> 
> Frame buffers:
> id      size    pitch
> 
> Just in case that means anything to anyone.

Everything looks good to me. Maybe add some debug in ingenic-drm to see 
what bus flags and format it ends up choosing.

Cheers,
-Paul


