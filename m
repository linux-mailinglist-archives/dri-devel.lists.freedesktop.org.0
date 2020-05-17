Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C32AE1D6690
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 10:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A466E027;
	Sun, 17 May 2020 08:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EF26E027
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 08:29:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207763] New: Noisy Screen in Linux with kernel 5
Date: Sun, 17 May 2020 08:29:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: xunilarium@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-207763-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207763

            Bug ID: 207763
           Summary: Noisy Screen in Linux with kernel 5
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.0.0-23-generic
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: xunilarium@gmail.com
        Regression: No

Created attachment 289165
  --> https://bugzilla.kernel.org/attachment.cgi?id=289165&action=edit
My Noisy Screen

As linux kernel was updated to version 5 my laptop screen become noisy, I have
same problem with all linux distros with kernel 5 and above. The problem is
available both in graphic and text mode. windows works fine so my graphic card
is OK.

Ubunut 18.04.02:
--------------------------------------------------------------------------------

Kernel Ver: 4.18.0-15-generic

VGA Driver: 01:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
[AMD/ATI] RV620/M82 [Mobility Radeon HD 3450/3470]

Subsystem: Sony Corporation RV620/M82 [Mobility Radeon HD 3450/3470]

Kernel driver in use: radeon

Kernel modules: radeon

Screen Status: OK

________________________________________________________________________________

Ubuntu 18.04.03:
--------------------------------------------------------------------------------

Kernel Ver: 5.0.0-23-generic

VGA Driver: 01:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
[AMD/ATI] RV620/M82 [Mobility Radeon HD 3450/3470]

Subsystem: Sony Corporation RV620/M82 [Mobility Radeon HD 3450/3470]

Kernel driver in use: radeon

Kernel modules: radeon

Screen Status: Noisy

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
