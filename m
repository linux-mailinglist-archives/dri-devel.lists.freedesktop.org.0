Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110E248832B
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jan 2022 12:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28FC10EA4D;
	Sat,  8 Jan 2022 11:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EEA10EA4D
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jan 2022 11:16:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40383B80817
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jan 2022 11:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02FF6C36AF3
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jan 2022 11:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641640565;
 bh=JQdPKpqrntcCiRNstSSgiMfGfF/mYdzbYft0DrrZ0Ys=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=g79MBLqVxNkUmTXW2GhimrSv9Ru5U3r8fw+U6b8cDc+EtbmL4JfrZ9Pq+jb5AZLhp
 cEA/t63cE8Y6VKxIr3AjTnQHtQIGIXHJkRLj36g2nnZBCmBG7KHb6o9ADJTe6xo/OQ
 VulPxvCCT7PzxyWkqN2IvUUo9M3Hj9XP1PSHFd0CLF+jkqoplB/rvNkRuk6rNW1OfQ
 +5SQMTr181eFSOCK6dvXgvtsI1RaENL7eh5+Nv05jUWh2qb37gmnb0vNwM5l/0t/GL
 ckqxUC3HqglWkskj6GJh5q7akQPRVUGwRoB6lsXDX98AruKXIiQSnIGAq3+TG1jpwS
 hS4d7fU24kM0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DE321C05FDE; Sat,  8 Jan 2022 11:16:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215001] Regression in 5.15, Firmware-initialized graphics
 console selects FB_VGA16, screen corruption
Date: Sat, 08 Jan 2022 11:16:04 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215001-2300-0rRsKo1snE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215001-2300@https.bugzilla.kernel.org/>
References: <bug-215001-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215001

--- Comment #11 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
(In reply to Kris Karas from comment #10)

> I didn't know whether the regression trackers were a real "bot" sort of
> thing,

Well, I'm working towards a bot that does the heavy lifting ;-)

> or just folks pitching in to try to keep track by hand.  Good to know
> that it's still human-powered.

"Still"? there was none most of the time in the past ten years, expcept whe=
n I
did it in 2017 and since I started again end of October.

> I've got another bug to file now, multiple flavors of OOPSen showing up on
> boot in _kmalloc due to creation/manipulation of network devices (bridges,
> veth), perhaps as a result of the "igb" patches in 5.15 as it seems
> hardware-specific.

Be sure to try the latest version (and give mainline a try, too), there was=
 a
regression that was fixed ten days ago. Good luck!.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
