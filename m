Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BEA18DAAF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 23:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89366EB70;
	Fri, 20 Mar 2020 22:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F1E6EB70
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 22:03:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206575] [amdgpu] [drm] No video signal on resume from suspend,
 R9 380
Date: Fri, 20 Mar 2020 22:03:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: kernel_bugzilla@joeramsey.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206575-2300-5OaB9R67nN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206575-2300@https.bugzilla.kernel.org/>
References: <bug-206575-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206575

--- Comment #16 from Joe Ramsey (kernel_bugzilla@joeramsey.com) ---
(In reply to Alex Deucher from comment #15)
> (In reply to Joe Ramsey from comment #14)
> > Looks like this has been corrected in 5.6... is there any intent to include
> > the fix in any 5.5 kernel or will we just have to wait for 5.6?
> 
> Can you identify the fix?

If I understood Noel Maersk's and Thomas Frank's posts reverting
1ea8751bd28d1ec2b36a56ec6bc1ac28903d09b4 resolves the issue.  The Reddit thread
that was referenced
(https://www.reddit.com/r/archlinux/comments/f7oti1/issue_with_resume_from_suspend_black_backlit/)
seems to indicate that it's resolved in 5.6.  Was wondering if whatever fix was
applied to 5.6 would also be applied to 5.5.  Could be I've completely
misunderstood things.

I'm running Slackware and have been using the -current kernel packages
(currently at 5.4.25), but the kernel modules for virtualbox don't seem to be
compiling under that kernel for some reason.  I tried several of the recent 5.5
releases (5.5.8-5.5.10), and can get the virtualbox kernel modules to compile
under them, but they all seem to have this bug.  Was hoping to get one kernel
that would allow my laptop to suspend and also compile the virtualbox modules. 
:^)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
