Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A397D2EC614
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 23:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203206E245;
	Wed,  6 Jan 2021 22:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9796E245
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 22:16:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D08D62313C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 22:16:39 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id C81B78672C; Wed,  6 Jan 2021 22:16:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211065] New: drm:dm_restore_drm_connector_state [amdgpu]
 *ERROR* Restoring old state failed with -12
Date: Wed, 06 Jan 2021 22:16:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arturbac.ab@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-211065-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211065

            Bug ID: 211065
           Summary: drm:dm_restore_drm_connector_state [amdgpu] *ERROR*
                    Restoring old state failed with -12
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.4, 5.10.5
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: arturbac.ab@gmail.com
        Regression: No

Created attachment 294539
  --> https://bugzilla.kernel.org/attachment.cgi?id=294539&action=edit
kernel boottime dmesg output with error

With kernel 5.10.4, 5.10.5 there is regression with amdgpu driver and 2
monitors.
Only first monitor shows anything under kde plasma and sddm, and console
terminal, the second one doesn't display anything after boot.
Up to 5.10.3 everything was fine and 2 monitors.

CPU: AMD Ryzen 9 3900X 12-Core @ 24x 3.8GHz
GPU: AMD Radeon RX 5700 XT (NAVI10, DRM 3.40.0, 5.10.3, LLVM 11.0.0)

In dmesg I see and error 
drm:dm_restore_drm_connector_state [amdgpu]] *ERROR* Restoring old state failed
with -12

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
