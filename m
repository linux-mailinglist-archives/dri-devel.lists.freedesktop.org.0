Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E1644FC76
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 00:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38F089C9D;
	Sun, 14 Nov 2021 23:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188D689C9D
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 23:33:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D465D61106
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 23:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636932825;
 bh=osusaCZ0vWwlBRwkPa//BSyT9g03rq8G/7hnwn52ISQ=;
 h=From:To:Subject:Date:From;
 b=bAvr3tJ/KJNP21ign740dduen68aa3W4NV6fLMZorv/qeTqmg9fAdX/gdzjCVTwE8
 /z3YWRkfmFTixfhWYCoMyF+BmVKtTNRVtPt/D+OKh/TgNkV61eSSw1wLeCTU6v8SXX
 HDPVt6vo2JyOMXmXEJcyCUUSuiSTVJuesr3IZEDxKCjFnIjkX3rf28subSPqupvchH
 95Z5sNbkuUN9vKIGd8nJj5ePHWuoc9Se/PxCsS8yaS15kQYRGvlmTVw87ET2dlAJfy
 fTa9WisOzqCBtRrf53hsva8qJJS2JBPNTbrelonrOFrje864ihefFqYwj4eL4wjtJt
 JDxy+TLZk4xqA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C887B60EE0; Sun, 14 Nov 2021 23:33:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215025] New: [amdgpu] Thinkpad A275 hangs on shutdown / screen
 does not turn on after reboot
Date: Sun, 14 Nov 2021 23:33:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjo@nord-west.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215025-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D215025

            Bug ID: 215025
           Summary: [amdgpu] Thinkpad A275 hangs on shutdown / screen does
                    not turn on after reboot
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.2
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: bjo@nord-west.org
        Regression: No

My Thinkpad A275 hangs while going into suspend. The screen turned off, but=
 it
does not really enter suspend mode (according to journalctl it started
suspending). Even after reboots the screen does not turn on again, I have to
power off the Thinkpad and then power it on again. The issue did not exist =
with
5.14.x.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
