Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3873135570
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 10:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F361F6E8EA;
	Thu,  9 Jan 2020 09:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37FF6E8EA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 09:18:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206141] New: VCE UVD ring test failed -110
Date: Thu, 09 Jan 2020 09:18:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: janpieter.sollie@dommel.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206141-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206141

            Bug ID: 206141
           Summary: VCE UVD ring test failed -110
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.6
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: janpieter.sollie@dommel.be
        Regression: No

Created attachment 286705
  --> https://bugzilla.kernel.org/attachment.cgi?id=286705&action=edit
part of DMESG that looks relevant

while booting my PC, amdgpu complains it cannot execute UVD and VCE ring tests
on Fiji GPU (R9 Nano).
The error code -110 points to a timeout.
Maybe R9 Nano needs more time to initialize the UVD decoder in UEFI mode?
-------------------
[    7.270335] amdgpu 0000:0a:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] *ERROR*
IB test failed on uvd (-110).
[    8.063987] Generic FE-GE Realtek PHY r8169-500:00: attached PHY driver
[Generic FE-GE Realtek PHY] (mii_bus:phy_addr=r8169-500:00, irq=IGNORE)
[    8.211306] r8169 0000:05:00.0 eth0: Link is Down
[    8.400079] amdgpu 0000:0a:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] *ERROR*
IB test failed on vce0 (-110).
[    8.400084] [drm:process_one_work] *ERROR* ib ring test failed (-110).
--------------------
Please note that this is not critical to me at all: I only use this card to
perform OpenCL calculations via RoCm, so couldn't care less, but I still think
it's worth to have a look at.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
