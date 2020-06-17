Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 494901FC359
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 03:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993B96EA47;
	Wed, 17 Jun 2020 01:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1036EA47
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 01:28:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208209] [amdgpu] driver crash -- enable_link_dp -- RX 570
Date: Wed, 17 Jun 2020 01:28:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: max.bruce12@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208209-2300-WYEaak5Jtv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208209-2300@https.bugzilla.kernel.org/>
References: <bug-208209-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=208209

--- Comment #2 from max.bruce12@gmail.com ---
I am using X, there aren't any interesting logs within the prior 12 hours or
since.
[901953.262] (II) AMDGPU(0): EDID vendor "SAM", prod id 3427
[901953.262] (II) AMDGPU(0): Using hsync ranges from config file
[901953.262] (II) AMDGPU(0): Using vrefresh ranges from config file
[901953.262] (II) AMDGPU(0): Printing DDC gathered Modelines:
[901953.262] (II) AMDGPU(0): Modeline "3840x2160"x0.0  533.25  3840 3888 3920
4000  2160 2163 2168 2222 +hsync -vsync (133.3 kHz eP)
[901953.262] (II) AMDGPU(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "2560x1440"x0.0  241.50  2560 2608 2640
2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024 
600 601 603 625 +hsync +vsync (35.2 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "640x480"x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "640x480"x0.0   31.50  640 664 704 832 
480 489 492 520 -hsync -vsync (37.9 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "640x480"x0.0   30.24  640 704 768 864 
480 483 486 525 -hsync -vsync (35.0 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "640x480"x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "720x400"x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184
1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152 
624 625 628 667 -hsync -vsync (49.7 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040 
600 637 643 666 +hsync +vsync (48.1 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "1280x800"x0.0   83.50  1280 1352 1480
1680  800 803 809 831 -hsync +vsync (49.7 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "1280x720"x60.0   74.48  1280 1336 1472
1664  720 721 724 746 -hsync +vsync (44.8 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "1600x900"x60.0  119.00  1600 1696 1864
2128  900 901 904 932 -hsync +vsync (55.9 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "1680x1050"x0.0  146.25  1680 1784 1960
2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz e)
[901953.262] (II) AMDGPU(0): Modeline "1440x900"x0.0  106.50  1440 1520 1672
1904  900 903 909 934 -hsync +vsync (55.9 kHz e)
[901953.813] (II) AMDGPU(0): EDID vendor "SAM", prod id 3427
[901953.813] (II) AMDGPU(0): Using hsync ranges from config file
[901953.813] (II) AMDGPU(0): Using vrefresh ranges from config file
[901953.813] (II) AMDGPU(0): Printing DDC gathered Modelines:
[901953.813] (II) AMDGPU(0): Modeline "3840x2160"x0.0  533.25  3840 3888 3920
4000  2160 2163 2168 2222 +hsync -vsync (133.3 kHz eP)
[901953.813] (II) AMDGPU(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz e)
[901953.813] (II) AMDGPU(0): Modeline "2560x1440"x0.0  241.50  2560 2608 2640
2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz e)
[901953.813] (II) AMDGPU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz e)
[901953.813] (II) AMDGPU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024 
600 601 603 625 +hsync +vsync (35.2 kHz e)
[901953.813] (II) AMDGPU(0): Modeline "640x480"x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[901953.813] (II) AMDGPU(0): Modeline "640x480"x0.0   31.50  640 664 704 832 
480 489 492 520 -hsync -vsync (37.9 kHz e)
[901953.813] (II) AMDGPU(0): Modeline "640x480"x0.0   30.24  640 704 768 864 
480 483 486 525 -hsync -vsync (35.0 kHz e)
[901953.813] (II) AMDGPU(0): Modeline "640x480"x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[901953.813] (II) AMDGPU(0): Modeline "720x400"x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[901953.813] (II) AMDGPU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[901953.813] (II) AMDGPU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[901953.813] (II) AMDGPU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184
1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[901953.814] (II) AMDGPU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[901953.814] (II) AMDGPU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152 
624 625 628 667 -hsync -vsync (49.7 kHz e)
[901953.814] (II) AMDGPU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz e)
[901953.814] (II) AMDGPU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040 
600 637 643 666 +hsync +vsync (48.1 kHz e)
[901953.814] (II) AMDGPU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[901953.814] (II) AMDGPU(0): Modeline "1280x800"x0.0   83.50  1280 1352 1480
1680  800 803 809 831 -hsync +vsync (49.7 kHz e)
[901953.814] (II) AMDGPU(0): Modeline "1280x720"x60.0   74.48  1280 1336 1472
1664  720 721 724 746 -hsync +vsync (44.8 kHz e)
[901953.814] (II) AMDGPU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[901953.814] (II) AMDGPU(0): Modeline "1600x900"x60.0  119.00  1600 1696 1864
2128  900 901 904 932 -hsync +vsync (55.9 kHz e)
[901953.814] (II) AMDGPU(0): Modeline "1680x1050"x0.0  146.25  1680 1784 1960
2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz e)
[901953.814] (II) AMDGPU(0): Modeline "1440x900"x0.0  106.50  1440 1520 1672
1904  900 903 909 934 -hsync +vsync (55.9 kHz e)


This repeats every so often.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
