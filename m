Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6661A34EE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 15:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903D46E0A1;
	Thu,  9 Apr 2020 13:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AFB6E0A1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 13:33:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207171] New: [regression][bisected] Ryzen PRO 2400G, firefox
 screen corruption in X
Date: Thu, 09 Apr 2020 13:33:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: florian.ziegler@posteo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-207171-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207171

            Bug ID: 207171
           Summary: [regression][bisected] Ryzen PRO 2400G, firefox screen
                    corruption in X
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.6.3
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: florian.ziegler@posteo.de
        Regression: No

Created attachment 288297
  --> https://bugzilla.kernel.org/attachment.cgi?id=288297&action=edit
dmesg

Hello,

I have a Ryzen PRO 2400G (HP EliteDesk 705 G4)

with kernel 5.6 I am experiencing screen corruption in firefox under X.
Symptoms are:
- black and white horizontal lines over the whole width of the firefox window
- displaced/duplicated renderings all over the screen
- black bars over the width of a moving object (sroll-over effect)

Only the firefox window is affected.
But when I move the window while there are corruptions, the whole screen is
affected for 1(?) frame.
Windows decorations are not affected.

Symptoms vary form website to website, playing video or sites that heavily
rerender when scrolling or clicking buttons seems to trigger or increase the
symptoms.

The symptoms do not appear with weston and firefox.
The symptoms do not appear with chromium under X

Output of git bisect:

# first bad commit: [7af2a5771e0918cdadb1614c1f81dd67a58e00aa] drm/amdgpu:
attempt to enable gfxoff on more raven1 boards (v2)

If you need pictures or further information, I can provide them.

The bug looks similar to this one:
https://bugzilla.kernel.org/show_bug.cgi?id=207005
But the reporter claimed that it never worked.
My bug report is about a regression.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
