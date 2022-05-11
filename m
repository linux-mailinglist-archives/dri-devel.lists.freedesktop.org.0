Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFAF522FDF
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 11:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EE410E491;
	Wed, 11 May 2022 09:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9464310E0D8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 09:51:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83DB160DE3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 09:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50E4EC34117
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652262717;
 bh=JAzJS1IcxJVg2j2AQY552uhferDl1oC791HEwcuj+Zs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IxaJAAib/feLJi4QE1APdCIXFr73SbhP82+HgH2ZNITHT2YM1XdooDSeCRbbAlKce
 iHr3YV+kZgyg/lEPP051t3DTIWlLyjxzoDWAodfwBqipgvicUDa7oJVkMZHWR4jKXL
 bvyCTpx5n1zUuTqNt1IcwtKQEKiZmhZRr0AP+bAiGQJEAFcAiFD/Nqkvw0uoKZWTzJ
 GVOOQMXmo1b7JoYIikhTVLkSs4+vwdH0yx9lgdDjrVVZMpWawLIFb/yF09Bu8qdCH/
 Jh44dV/T38gVR2r4uSxEsPFr9wzaidfESU5ZGgTHRJBd/Ew9A8KrRse9QcNdU56JNG
 sKPEOjJlion3g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3EA10C05FD0; Wed, 11 May 2022 09:51:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Wed, 11 May 2022 09:51:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: emlodnaor@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-2jIRtrZ1s9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

emlodnaor@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |emlodnaor@gmail.com

--- Comment #41 from emlodnaor@gmail.com ---
Just wanted to confirm that I also have this problem, however I'm starting =
to
wonder if it's a hardware issue?

Typical situation:
When: Using remote desktop, virtual-box or browser.
What: Screen freezes, but can move mouse around, followed by black screen, =
then
it comes back after a few seconds but screen still frozen, but mouse works.=
 can
move mouse around, and close windows (screen does not update) or open up a
terminal and do a sudo reboot etc (not showing on screen)...

Why I think it might be hardware:
I dual boot windows, and have similar thing happening there, however, the
desktop manager in windows do succeed in unfreezing everything, but widows =
have
totally black content until I drag them around and they are redrawn...=20

AMD 5950x
AMD Radeon 6700XT

So I am considering asking for a new card, but it's random when the fault
happens, and sometimes it will work fine for days, so a bit worried that th=
ey
will look at it quickly and claim it's fine...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
