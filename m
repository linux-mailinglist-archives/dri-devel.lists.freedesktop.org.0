Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FA12FA326
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 15:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1176E2C7;
	Mon, 18 Jan 2021 14:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63D46E2C7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 14:35:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6098A221E7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 14:35:11 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 56A9982AAE; Mon, 18 Jan 2021 14:35:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211263] New: amdgpu: navi (RX 5500 XT) high power consumption
 while idling on 75Hz display
Date: Mon, 18 Jan 2021 14:35:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: contato-myghi63@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-211263-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211263

            Bug ID: 211263
           Summary: amdgpu: navi (RX 5500 XT) high power consumption while
                    idling on 75Hz display
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.7
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: contato-myghi63@protonmail.com
        Regression: No

Created attachment 294731
  --> https://bugzilla.kernel.org/attachment.cgi?id=294731&action=edit
corectrl monitoring at 60hz and 75hz

Overview:

My RX 5500XT (GV-R55XTOC-8GD) consumes about 15W on idle if my monitor
(24MK430) is on 75Hz, and just 3W on 60Hz. This did never happened before 5.10
kernels. Any older kernel consumes 3W even on 75Hz, same hardware, same
configurations.

Steps to reproduce:
Install any distro with 5.10 kernel on a system that have high refresh rate
display and AMD NAVI GPU.

Actual results:
High GPU power consumption while idling, GPU heating and fans spinning up while
doing nothing on the computer.

Expected results:
Low power consumption and low GPU heat.

Operational System:
Arch Linux (latest packages avaliable from the repository)

Additional Information:
Here's my tlp configuration (keep in mind: that same configuration was applied
on kernel 5.9.14 and 5.4.90, both working properly with 3W at 75Hz):

RADEON_POWER_PROFILE_ON_AC=high
RADEON_DPM_PERF_LEVEL_ON_AC=auto
RADEON_DPM_STATE_ON_AC=performance

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
