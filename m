Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB754078E9
	for <lists+dri-devel@lfdr.de>; Sat, 11 Sep 2021 16:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639916EB9A;
	Sat, 11 Sep 2021 14:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B337E6EB94;
 Sat, 11 Sep 2021 14:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=unTPfwHBZlZOUPSO8D/NNaeS9agkTpE/gWHmpmgPDKA=; b=eFDyO2r2gTPxx93OEXTYx8SKrS
 suoZS3iADbDBCIG6UXPyd5hYze10Wnl30zba55/Ta+xbgF1dmThDIBg2tsrEKOa0WnJsf4m4oEJGY
 GRBg6QFhnXsi1fOn+XAZE8qwFWssWpf76sQ62kjjraAw1Wrf5H/oISB9/v/gbE+eIW7a03/I/TX6o
 AA16XFl/QV9acgswK+jLqj+aT5NCGBKCswVJFVv6bpJnyied3KOpJldGsq+x3ikCsKUt55N0p6rJN
 Qx8PKF80Cv4ulW/9E2HJIMx6OlVeLRU18yaxmxt4XR1IhiEJDmg70Pz2XviGEpmfogPY+g7e93dlT
 txL1wg4w==;
Received: from [2601:1c0:6280:3f0:e65e:37ff:febd:ee53]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mP4Fm-00F7ky-N2; Sat, 11 Sep 2021 14:45:14 +0000
Subject: Re: Intel UHD resolutions
To: o1bigtenor <o1bigtenor@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <d7487c6a-43c9-3940-4f42-b8fa31704e2e@infradead.org>
 <CAPpdf59v2OyidgF_=Hpz9xY4=my9FFs_aDJgfh=scq2nec0QXw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ba9a2708-3238-b6ae-ccae-548e5674e60f@infradead.org>
Date: Sat, 11 Sep 2021 07:45:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPpdf59v2OyidgF_=Hpz9xY4=my9FFs_aDJgfh=scq2nec0QXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 9/11/21 4:37 AM, o1bigtenor wrote:
> 
> 
> On Fri, Sep 10, 2021 at 9:50 PM Randy Dunlap <rdunlap@infradead.org <mailto:rdunlap@infradead.org>> wrote:
> 
>     Hi,
> 
>     I would like to use QHD resolution (2560x1440) with my shiny new
>     computer and display. That resolution works if I boot Windows 10
>     (cough).
> 
>     What do I need to do to use that resolution in Linux?
> 
> 
> Dunno if I can 'help' get everything going - - - - but I do have some
> ideas (having had to fight a lot to get my graphics sub-system working).
> 
> Start up a terminal as your user and run $ xrandr --verbose and then if
> you would paste the lines up to the end of the EDID blob here. (Need
> more info that what you provided. )

Here is that output:

Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 16384 x 16384
DP-1 disconnected (normal left inverted right x axis y axis)
	Identifier: 0x42
	Timestamp:  42703
	Subpixel:   unknown
	Clones:
	CRTCs:      0 1 2
	Transform:  1.000000 0.000000 0.000000
	            0.000000 1.000000 0.000000
	            0.000000 0.000000 1.000000
	           filter:
	HDCP Content Type: HDCP Type0
		supported: HDCP Type0, HDCP Type1
	Content Protection: Undesired
		supported: Undesired, Desired, Enabled
	Colorspace: Default
		supported: Default, RGB_Wide_Gamut_Fixed_Point, RGB_Wide_Gamut_Floating_Point, opRGB, DCI-P3_RGB_D65, BT2020_RGB, BT601_YCC, BT709_YCC, XVYCC_601, XVYCC_709, SYCC_601, opYCC_601, BT2020_CYCC, BT2020_YCC
	max bpc: 12
		range: (6, 12)
	Broadcast RGB: Automatic
		supported: Automatic, Full, Limited 16:235
	audio: auto
		supported: force-dvi, off, auto, on
	link-status: Good
		supported: Good, Bad
	CONNECTOR_ID: 167
		supported: 167
	non-desktop: 0
		range: (0, 1)
HDMI-1 connected 1920x1080+0+0 (0x47) normal (normal left inverted right x axis y axis) 527mm x 296mm
	Identifier: 0x43
	Timestamp:  42703
	Subpixel:   unknown
	Gamma:      1.0:1.0:1.0
	Brightness: 1.0
	Clones:
	CRTC:       0
	CRTCs:      0 1 2
	Transform:  1.000000 0.000000 0.000000
	            0.000000 1.000000 0.000000
	            0.000000 0.000000 1.000000
	           filter:
	EDID:
		00ffffffffffff0009d11b8045540000
		321e010380351e78260cd5a9554ca125
		0d5054a56b80818081c08100a9c0b300
		d1c001010101565e00a0a0a029503020
		35000f282100001a000000ff0039434c
		30353035323031390a20000000fd0032
		4c1e591b000a202020202020000000fc
		0042656e51204c43440a20202020014b
		020322f14f901f051404130312071615
		01061102230907078301000065030c00
		1000023a801871382d40582c45005650
		2100001f011d8018711c1620582c2500
		56502100009f011d007251d01e206e28
		550056502100001e8c0ad08a20e02d10
		103e9600565021000018000000000000
		00000000000000000000000000000047
	HDCP Content Type: HDCP Type0
		supported: HDCP Type0, HDCP Type1
	Content Protection: Undesired
		supported: Undesired, Desired, Enabled
	max bpc: 12
		range: (8, 12)
	content type: No Data
		supported: No Data, Graphics, Photo, Cinema, Game
	Colorspace: Default
		supported: Default, SMPTE_170M_YCC, BT709_YCC, XVYCC_601, XVYCC_709, SYCC_601, opYCC_601, opRGB, BT2020_CYCC, BT2020_RGB, BT2020_YCC, DCI-P3_RGB_D65, DCI-P3_RGB_Theater
	aspect ratio: Automatic
		supported: Automatic, 4:3, 16:9
	Broadcast RGB: Automatic
		supported: Automatic, Full, Limited 16:235
	audio: auto
		supported: force-dvi, off, auto, on
	link-status: Good
		supported: Good, Bad
	CONNECTOR_ID: 178
		supported: 178
	non-desktop: 0
		range: (0, 1)
   1920x1080 (0x47) 148.500MHz +HSync +VSync *current
         h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  67.50KHz
         v: height 1080 start 1084 end 1089 total 1125           clock  60.00Hz
   1920x1080 (0x48) 148.500MHz +HSync +VSync
         h: width  1920 start 2448 end 2492 total 2640 skew    0 clock  56.25KHz
         v: height 1080 start 1084 end 1089 total 1125           clock  50.00Hz
   1920x1080 (0x49) 148.352MHz +HSync +VSync
         h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  67.43KHz
         v: height 1080 start 1084 end 1089 total 1125           clock  59.94Hz
   1920x1080i (0x4a) 74.250MHz +HSync +VSync Interlace
         h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  33.75KHz
         v: height 1080 start 1084 end 1094 total 1125           clock  60.00Hz
   1920x1080i (0x4b) 74.250MHz +HSync +VSync Interlace
         h: width  1920 start 2448 end 2492 total 2640 skew    0 clock  28.12KHz
         v: height 1080 start 1084 end 1094 total 1125           clock  50.00Hz
   1920x1080i (0x4c) 74.176MHz +HSync +VSync Interlace
         h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  33.72KHz
         v: height 1080 start 1084 end 1094 total 1125           clock  59.94Hz
   1680x1050 (0x4d) 119.000MHz +HSync -VSync
         h: width  1680 start 1728 end 1760 total 1840 skew    0 clock  64.67KHz
         v: height 1050 start 1053 end 1059 total 1080           clock  59.88Hz
   1600x900 (0x4e) 108.000MHz +HSync +VSync
         h: width  1600 start 1624 end 1704 total 1800 skew    0 clock  60.00KHz
         v: height  900 start  901 end  904 total 1000           clock  60.00Hz
   1280x1024 (0x4f) 135.000MHz +HSync +VSync
         h: width  1280 start 1296 end 1440 total 1688 skew    0 clock  79.98KHz
         v: height 1024 start 1025 end 1028 total 1066           clock  75.02Hz
   1280x1024 (0x50) 108.000MHz +HSync +VSync
         h: width  1280 start 1328 end 1440 total 1688 skew    0 clock  63.98KHz
         v: height 1024 start 1025 end 1028 total 1066           clock  60.02Hz
   1280x800 (0x51) 71.000MHz +HSync -VSync
         h: width  1280 start 1328 end 1360 total 1440 skew    0 clock  49.31KHz
         v: height  800 start  803 end  809 total  823           clock  59.91Hz
   1152x864 (0x52) 108.000MHz +HSync +VSync
         h: width  1152 start 1216 end 1344 total 1600 skew    0 clock  67.50KHz
         v: height  864 start  865 end  868 total  900           clock  75.00Hz
   1280x720 (0x53) 74.250MHz +HSync +VSync
         h: width  1280 start 1390 end 1430 total 1650 skew    0 clock  45.00KHz
         v: height  720 start  725 end  730 total  750           clock  60.00Hz
   1280x720 (0x54) 74.250MHz +HSync +VSync
         h: width  1280 start 1720 end 1760 total 1980 skew    0 clock  37.50KHz
         v: height  720 start  725 end  730 total  750           clock  50.00Hz
   1280x720 (0x55) 74.176MHz +HSync +VSync
         h: width  1280 start 1390 end 1430 total 1650 skew    0 clock  44.96KHz
         v: height  720 start  725 end  730 total  750           clock  59.94Hz
   1024x768 (0x56) 78.750MHz +HSync +VSync
         h: width  1024 start 1040 end 1136 total 1312 skew    0 clock  60.02KHz
         v: height  768 start  769 end  772 total  800           clock  75.03Hz
   1024x768 (0x57) 65.000MHz -HSync -VSync
         h: width  1024 start 1048 end 1184 total 1344 skew    0 clock  48.36KHz
         v: height  768 start  771 end  777 total  806           clock  60.00Hz
   832x624 (0x58) 57.284MHz -HSync -VSync
         h: width   832 start  864 end  928 total 1152 skew    0 clock  49.73KHz
         v: height  624 start  625 end  628 total  667           clock  74.55Hz
   800x600 (0x59) 49.500MHz +HSync +VSync
         h: width   800 start  816 end  896 total 1056 skew    0 clock  46.88KHz
         v: height  600 start  601 end  604 total  625           clock  75.00Hz
   800x600 (0x5a) 40.000MHz +HSync +VSync
         h: width   800 start  840 end  968 total 1056 skew    0 clock  37.88KHz
         v: height  600 start  601 end  605 total  628           clock  60.32Hz
   720x576 (0x5b) 27.000MHz -HSync -VSync
         h: width   720 start  732 end  796 total  864 skew    0 clock  31.25KHz
         v: height  576 start  581 end  586 total  625           clock  50.00Hz
   720x576i (0x5c) 13.500MHz -HSync -VSync Interlace
         h: width   720 start  732 end  795 total  864 skew    0 clock  15.62KHz
         v: height  576 start  580 end  586 total  625           clock  50.00Hz
   720x480 (0x5d) 27.027MHz -HSync -VSync
         h: width   720 start  736 end  798 total  858 skew    0 clock  31.50KHz
         v: height  480 start  489 end  495 total  525           clock  60.00Hz
   720x480 (0x5e) 27.000MHz -HSync -VSync
         h: width   720 start  736 end  798 total  858 skew    0 clock  31.47KHz
         v: height  480 start  489 end  495 total  525           clock  59.94Hz
   720x480i (0x5f) 13.514MHz -HSync -VSync Interlace
         h: width   720 start  739 end  801 total  858 skew    0 clock  15.75KHz
         v: height  480 start  488 end  494 total  525           clock  60.00Hz
   720x480i (0x60) 13.500MHz -HSync -VSync Interlace
         h: width   720 start  739 end  801 total  858 skew    0 clock  15.73KHz
         v: height  480 start  488 end  494 total  525           clock  59.94Hz
   640x480 (0x61) 31.500MHz -HSync -VSync
         h: width   640 start  656 end  720 total  840 skew    0 clock  37.50KHz
         v: height  480 start  481 end  484 total  500           clock  75.00Hz
   640x480 (0x62) 25.200MHz -HSync -VSync
         h: width   640 start  656 end  752 total  800 skew    0 clock  31.50KHz
         v: height  480 start  490 end  492 total  525           clock  60.00Hz
   640x480 (0x63) 25.175MHz -HSync -VSync
         h: width   640 start  656 end  752 total  800 skew    0 clock  31.47KHz
         v: height  480 start  490 end  492 total  525           clock  59.94Hz
   720x400 (0x64) 28.320MHz -HSync +VSync
         h: width   720 start  738 end  846 total  900 skew    0 clock  31.47KHz
         v: height  400 start  412 end  414 total  449           clock  70.08Hz
DP-2 disconnected (normal left inverted right x axis y axis)
	Identifier: 0x44
	Timestamp:  42703
	Subpixel:   unknown
	Clones:     HDMI-2
	CRTCs:      0 1 2
	Transform:  1.000000 0.000000 0.000000
	            0.000000 1.000000 0.000000
	            0.000000 0.000000 1.000000
	           filter:
	HDCP Content Type: HDCP Type0
		supported: HDCP Type0, HDCP Type1
	Content Protection: Undesired
		supported: Undesired, Desired, Enabled
	Colorspace: Default
		supported: Default, RGB_Wide_Gamut_Fixed_Point, RGB_Wide_Gamut_Floating_Point, opRGB, DCI-P3_RGB_D65, BT2020_RGB, BT601_YCC, BT709_YCC, XVYCC_601, XVYCC_709, SYCC_601, opYCC_601, BT2020_CYCC, BT2020_YCC
	max bpc: 12
		range: (6, 12)
	Broadcast RGB: Automatic
		supported: Automatic, Full, Limited 16:235
	audio: auto
		supported: force-dvi, off, auto, on
	link-status: Good
		supported: Good, Bad
	CONNECTOR_ID: 184
		supported: 184
	non-desktop: 0
		range: (0, 1)
HDMI-2 disconnected (normal left inverted right x axis y axis)
	Identifier: 0x45
	Timestamp:  42703
	Subpixel:   unknown
	Clones:     DP-2
	CRTCs:      0 1 2
	Transform:  1.000000 0.000000 0.000000
	            0.000000 1.000000 0.000000
	            0.000000 0.000000 1.000000
	           filter:
	HDCP Content Type: HDCP Type0
		supported: HDCP Type0, HDCP Type1
	Content Protection: Undesired
		supported: Undesired, Desired, Enabled
	max bpc: 12
		range: (8, 12)
	content type: No Data
		supported: No Data, Graphics, Photo, Cinema, Game
	Colorspace: Default
		supported: Default, SMPTE_170M_YCC, BT709_YCC, XVYCC_601, XVYCC_709, SYCC_601, opYCC_601, opRGB, BT2020_CYCC, BT2020_RGB, BT2020_YCC, DCI-P3_RGB_D65, DCI-P3_RGB_Theater
	aspect ratio: Automatic
		supported: Automatic, 4:3, 16:9
	Broadcast RGB: Automatic
		supported: Automatic, Full, Limited 16:235
	audio: auto
		supported: force-dvi, off, auto, on
	link-status: Good
		supported: Good, Bad
	CONNECTOR_ID: 190
		supported: 190
	non-desktop: 0
		range: (0, 1)



Thanks.

-- 
~Randy

