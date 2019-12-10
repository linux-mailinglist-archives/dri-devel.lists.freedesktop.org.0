Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93C2118F1D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 18:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3D76E901;
	Tue, 10 Dec 2019 17:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970EC6E901
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 17:34:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205827] New: drm:drm_atomic_helper_wait_for_dependencies -
 drm_kms_helper - flip_done timed out
Date: Tue, 10 Dec 2019 17:34:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-205827-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=205827

            Bug ID: 205827
           Summary: drm:drm_atomic_helper_wait_for_dependencies -
                    drm_kms_helper - flip_done timed out
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.3.13-vanilla
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ionut_n2001@yahoo.com
        Regression: No

Created attachment 286245
  --> https://bugzilla.kernel.org/attachment.cgi?id=286245&action=edit
inspect dmesg logs for drm error

Hi,

I compiled new kernel on my machine, this version 5.3.13.
And wait 2-3 days for inspect error with dmesg and appear error with drm.

[105790.812641] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:38:crtc-0] flip_done timed out
[105801.052698] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:34:plane-0] flip_done timed out
[157144.794587] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:38:crtc-0] flip_done timed out
[157155.034746] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:34:plane-0] flip_done timed out
[178642.290388] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:38:crtc-0] flip_done timed out
[178652.530562] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:34:plane-0] flip_done timed out
[215497.863723] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:38:crtc-0] flip_done timed out
[215508.103790] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:34:plane-0] flip_done timed out
[275188.513449] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:38:crtc-0] flip_done timed out
[275198.753543] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:34:plane-0] flip_done timed out

I use VMware ESXi for hypervisor.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
