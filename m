Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC11E2A2693
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 10:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652DD6E07B;
	Mon,  2 Nov 2020 09:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A08A6E07B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 09:06:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209995] New: amdgpu failed to resume from S3
Date: Mon, 02 Nov 2020 09:06:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: acelan@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-209995-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209995

            Bug ID: 209995
           Summary: amdgpu failed to resume from S3
           Product: Drivers
           Version: 2.5
    Kernel Version: v5.10-rc1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: acelan@gmail.com
        Regression: No

Created attachment 293375
  --> https://bugzilla.kernel.org/attachment.cgi?id=293375&action=edit
dmesg.log

When the system resume from S3, got below error messages.

[  130.221621] amdgpu 0000:02:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring gfx test failed (-110)
[  130.221663] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume of
IP block <gfx_v8_0> failed -110
[  130.221664] amdgpu 0000:02:00.0: amdgpu: amdgpu_device_ip_resume failed
(-110).
[  130.221668] PM: dpm_run_callback(): pci_pm_resume+0x0/0xf0 returns -110
[  130.221671] PM: Device 0000:02:00.0 failed to resume async: error -110

02:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Lexa [Radeon 540X/550X/630 / RX 640 / E9171 MCM] [1002:6987] (rev c1)
(prog-if 00 [VGA c
ontroller])
        Subsystem: Dell Lexa [Radeon 540X/550X/630 / RX 640 / E9171 MCM]
[1028:1713]

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
