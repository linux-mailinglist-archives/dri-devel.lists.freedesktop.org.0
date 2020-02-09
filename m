Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15041156C6A
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2020 21:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE7B6E87F;
	Sun,  9 Feb 2020 20:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10C86E87F
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2020 20:36:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206475] New: amdgpu under load drop signal to monitor until
 hard reset
Date: Sun, 09 Feb 2020 20:36:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rodomar705@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206475-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206475

            Bug ID: 206475
           Summary: amdgpu under load drop signal to monitor until hard
                    reset
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.5.2
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: rodomar705@protonmail.com
        Regression: No

Created attachment 287265
  --> https://bugzilla.kernel.org/attachment.cgi?id=287265&action=edit
dmesg for the amdgpu hardware freeze

While gaming the monitor goes blank randomly, only with this error in the logs
of the system

kernel: amdgpu: [powerplay] last message was failed ret is 65535
kernel: amdgpu: [powerplay] failed to send message 200 ret is 65535 
kernel: amdgpu: [powerplay] last message was failed ret is 65535
kernel: amdgpu: [powerplay] failed to send message 282 ret is 65535 
kernel: amdgpu: [powerplay] last message was failed ret is 65535
kernel: amdgpu: [powerplay] failed to send message 201 ret is 65535

with the occasional
kernel: [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:47:crtc-0] flip_done timed out
kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, signaled
seq=5275264, emitted seq=5275266
kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process
Hand of Fate 2. pid 682062 thread Hand of Fa:cs0 pid 682064
kernel: amdgpu 0000:06:00.0: GPU reset begin!

over and over again. If I reset the system no video output is seen until the
system is fully shut off.

B450 chipset + Ryzen 5 2600 + Radeon RX580 GPU

Full log is attached to this post.

Can anyone at AMD give me some pointers to what the problem is?

Thanks,

Marco.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
