Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A665C5E74CD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 09:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BD710E450;
	Fri, 23 Sep 2022 07:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B73910E450
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:23:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3858B826C3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8881EC433C1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 07:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663917830;
 bh=CMJw1QmmTRfQkA3cubqtR+wnzuBq7ltIaAsYzjVPaL8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NykmgQE8WEHMYRWKK8O2pjDZl3xTXQXZaMIlym1YLChctdW7bGZxzYfvPk76u34cw
 bkKyP3HKPian+Z3LJjVLDEagij5rDlnJxaJnl0VyWZSUraSDWtSeTO3P5VywpyryYJ
 GXWtMJJGK9G27TyDqkO07I+9smEMQg4uCV2xZ58MbedHPwjbK0643zgB50Xm/4EnKG
 Xx45TVhNeHsrzlW/xoUXhvcyuPpT4iRsKGkSo2clHNxTY2zOO3dy9pi/6OZihfkhsQ
 Yslj9tdCEc7rC9zwtIPAXcVry1x7p8USOsPjgwqq8U+ZfI19hZi5/LCnnNCBQP2MS7
 ta0HRgtQbvyPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 700AEC433E7; Fri, 23 Sep 2022 07:23:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date: Fri, 23 Sep 2022 07:23:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216516-2300-9DYxJ1Cxpo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-2300@https.bugzilla.kernel.org/>
References: <bug-216516-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com,
                   |                            |regressions@leemhuis.info

--- Comment #2 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Mario, what's your opinion on this?=20

@kolAflash, FWIW, this in not my area of expertise, but this one AFAICS is
tricky, as 7123d39dc24d is a fix for a regression; one that iirc bothered a=
 few
people. So we can't simply revert it, as that would cause a regressions for
other people. And I wonder if the real problem here is the firmware, maybe =
its
s2ram codepaths are the root of the problem here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
