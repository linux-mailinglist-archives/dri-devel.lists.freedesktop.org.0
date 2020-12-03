Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 876E02CDBAF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 18:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D696E037;
	Thu,  3 Dec 2020 17:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F416E037
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 17:03:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210479] New: amdgpu: Monitor connected to RX 6800XT loses
 signal when module is loaded
Date: Thu, 03 Dec 2020 17:03:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alapshin@fastmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-210479-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210479

            Bug ID: 210479
           Summary: amdgpu: Monitor connected to RX 6800XT loses signal
                    when module is loaded
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.0-rc6
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: alapshin@fastmail.com
        Regression: No

Created attachment 293923
  --> https://bugzilla.kernel.org/attachment.cgi?id=293923&action=edit
Journalctl output

When monitor is connected to RX 6800XT gpu it loses its signal as soon as
amgdpu module is loaded from initrd.

However system itself is working, I can enter LUKS password and connect via
ssh.
Adding nomodeset kernel parameter allows to see boot progress but Xserver can't
be started and user is redirected to console login prompt.

Additional info
1. This monitor works fine with same setup (hardware/OS) with Nvidia GPU and
modesetting driver.
2. This situation occurs regardless how monitor is connected (DisplayPort or
HDMI)
3. This situation also occurs with different monitor as well.
4. This GPU seems to work fine under Windows installed on same hardware.

lspci -nvv output:

2d:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Device [1002:73bf] (rev c1) (prog-if 00 [VGA controller])
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Device [1002:0e3a]
        Flags: bus master, fast devsel, latency 0, IRQ 43, IOMMU group 2
        Memory at 7800000000 (64-bit, prefetchable) [size=16G]
        Memory at 7c00000000 (64-bit, prefetchable) [size=256M]
        I/O ports at e000 [size=256]
        Memory at fc700000 (32-bit, non-prefetchable) [size=1M]
        Expansion ROM at fc800000 [disabled] [size=128K]
        Capabilities: <access denied>
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
