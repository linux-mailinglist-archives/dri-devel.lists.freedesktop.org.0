Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABBF2FB54F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 11:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B546E83D;
	Tue, 19 Jan 2021 10:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23ABD6E09F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 10:25:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D891C2312D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 10:25:30 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id CF8D382AAE; Tue, 19 Jan 2021 10:25:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] New: sometimes crash at s2ram-wake (Ryzen 3500U):
 amdgpu, drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 19 Jan 2021 10:25:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211277

            Bug ID: 211277
           Summary: sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
                    drm, commit_tail, amdgpu_dm_atomic_commit_tail
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.4
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kolAflash@kolahilft.de
        Regression: No

I'm currently on Debian-11-Testing (Bullseye). And since a few weeks the system
sometimes (not always) doesn't wake up from suspend.
Most of the time suspend works. But about 1 in 10 times it crashes.

I attached /var/log/kern.log which holds plenty of information about the crash.
Looks like the crash happened in amdgpu_dm.c:7273
(amdgpu_dm_atomic_commit_tail, Linux-5.10.4).


I'm pretty sure this behavior didn't appeared a few month before. So I guess a
recent change is causing it. This may either be:


1. an updated package by Debian-Testing

Indeed I'm pretty sure the problem didn't appeared before Linux-5.9. So maybe
this is being caused by a change between Linux-5.8 and Linux-5.9.
I'll try to test going back to Linux-5.8 in the next days.


2. a BIOS update
In November 2020 I installed the BIOS update sp110770.exe.
Before I was using sp107599.exe.
You can find the BIOS history attached.
I'll also see if I can test a BIOS downgrade in the next days.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
