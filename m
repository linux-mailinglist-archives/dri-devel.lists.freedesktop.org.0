Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13658392FF7
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 15:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0196F3AA;
	Thu, 27 May 2021 13:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940B26F3AA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 13:43:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 46FC5613AC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 13:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622122985;
 bh=edoxr6EnAOpkTYRbH7T2ipOzf8KoD5xIM2k6wqKKOV8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nD6cDH1uMVWeZOtb+4pfK513l+Oez2Fdpu470BfEIsBUMfyKPlZ3EO8wV7eycjJQ+
 4NuZQqjtjaaNnCSRpm9eq4BN6a6as89pb5hAcGL9aeE53QcUA0qiZ0jv6S6TwdPmRf
 QgcxdtvMk9BczwQrCW1GPkuibIoYEzTwcSK5TAMkdUSbvrwhGvn+hIR3tL+s4wpwSz
 R7B8DeyvgDemGHwRqhXZD4WFm81pDuqaATZaLzt2+UR9KgQzyCTkS9kY49UpipZC11
 Ka5NPl+zROkNlwEDXJDVDkCYzmnmcGj78X1lqgayg1Zv05Xud7pXi2zvxx7arUalNi
 fBYDQcI56RKGw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3629461210; Thu, 27 May 2021 13:43:05 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Thu, 27 May 2021 13:43:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: meep@binary-kitchen.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213145-2300-GF2udV7c7S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

meep@binary-kitchen.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |meep@binary-kitchen.de

--- Comment #3 from meep@binary-kitchen.de ---
We have some crashes probably related to this at
https://gitlab.freedesktop.org/drm/amd/-/issues/1591=20=20

I have the exact the same kernel log, however missing the very first line.

I can trigger this bug reproducibly by just opening a lot of xterm windows =
if
truetype fonts enabled.

My Machine is brand new. So I dont have any last-working-setup/date.
Thinkpad T14s. AMD U4750 (no dedicated GFX).
Archlinux updated from 19.5.2021 till 27.5.2021 for sure has this bug in it.

Tried various kernel down/grades from 5.10.1 to 5.12.6, all crashed.
Tried a lot of different linux-firmwares too.

Complete Archlinux Rollback to 1/March/2021 stopped crashing.
I chose this date randomly so some days later everything might be fine too.

Not experienced in that whole Graphics-System and how packages/components
interconnect.

Willing to help pinpointing the problem, testing fixes/solutions.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
