Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B242C7ADE
	for <lists+dri-devel@lfdr.de>; Sun, 29 Nov 2020 20:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093976E235;
	Sun, 29 Nov 2020 19:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353A16E235
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Nov 2020 19:12:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210415] New: [amdgpu] constant GPU hangs followed by kernel
 "BUG" and following kernel oops
Date: Sun, 29 Nov 2020 19:12:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david.alejandro.rubio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-210415-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210415

            Bug ID: 210415
           Summary: [amdgpu] constant GPU hangs followed by kernel "BUG"
                    and following kernel oops
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.11
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: david.alejandro.rubio@gmail.com
        Regression: No

Created attachment 293863
  --> https://bugzilla.kernel.org/attachment.cgi?id=293863&action=edit
dmesg output

I have an RX 480. Every few hours after kernel 5.4 (!) I've been getting random
GPU hangs, and after kernel 5.9, they became not only more frequent, but
afterwards the kernel sent messages like 

Nov 29 15:44:31 reimu kernel: [drm] Bailing on TDR for s_job:34a, as another
already in progress
Nov 29 15:44:31 reimu kernel: BUG: kernel NULL pointer dereference, address:
0000000000000020
Nov 29 15:44:31 reimu kernel: #PF: supervisor write access in kernel mode
Nov 29 15:44:31 reimu kernel: #PF: error_code(0x0002) - not-present page

And an Oops right afterwards
Oops: 0002 [#2] PREEMPT SMP NOPTI

The full dmesg is attached. Kernel is compiled with Archlinux kernel
preferences, but using a kernel directly from kernel.org and compiled with the
modules I need give me the same error.

Attached error.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
