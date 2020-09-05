Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4127D25E6EC
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 12:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B087F6ED38;
	Sat,  5 Sep 2020 10:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B716ED38
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Sep 2020 10:19:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209159] New: AMD Vega 20 framebuffer switch fails on 5.9rc2+
Date: Sat, 05 Sep 2020 10:19:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ryan@testtoast.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-209159-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209159

            Bug ID: 209159
           Summary: AMD Vega 20 framebuffer switch fails on 5.9rc2+
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9-rc2/3
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ryan@testtoast.com
        Regression: No

Created attachment 292349
  --> https://bugzilla.kernel.org/attachment.cgi?id=292349&action=edit
lspci

Vega 20 (Radeon VII) on X99 platform - boot freezes during FB switch. Booting
without quiet and with earlyprintk=efi,keep shows a stall immediately after

...
[    1.941238] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    1.941239] AMD-Vi: AMD IOMMUv2 functionality not available on this system
[    1.948454] nvme nvme0: 20/0/0 default/read/poll queues
[    1.953176]  nvme0n1: p1 p2 p3 p4 p5 p6 p7
[    1.956313] usb 1-14: new full-speed USB device number 5 using xhci_hcd
[    1.989790] [drm] amdgpu kernel modesetting enabled.
[    1.989849] CRAT table not found
[    1.989850] Virtual CRAT table created for CPU
[    1.989857] amdgpu: Topology: Add CPU node
[    2.006244] checking generic (c0000000 300000) vs hw (c0000000 10000000)
[    2.006246] fb0: switching to amdgpudrmfb from EFI VGA


On -rc1 boot continues normally with
...
[    2.006315] amdgpu 0000:67:00.0: vgaarb: deactivate vga console
[    2.006345] amdgpu 0000:67:00.0: enabling device (0106 -> 0107)
[    2.006408] [drm] initializing kernel modesetting (VEGA20 0x1002:0x66AF
0x1002:0x081E 0xC1).
...

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
