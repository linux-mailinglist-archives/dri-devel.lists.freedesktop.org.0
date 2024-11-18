Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7363E9D1C0D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDD710E56B;
	Mon, 18 Nov 2024 23:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DL/F6IL0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33E310E56B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 23:52:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0FD3A5C54E4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 23:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4C91C4CECF
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 23:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731973969;
 bh=FZ/3nx6+a0m/JBLUfm1KgG/9JYbIF1hEimk1Hx6Cdwg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DL/F6IL0aDsC9/vMKTD0R6peIMocOhpyKUYTgLVeQPwzP/4efkM9E0S1sC6USFkcY
 90VQ6IvUoWDMeYTv4LfsiiuRuL2/0uMfYE53aLZ0xZm3tD1SxPPMMlOwU0bO/1unBw
 Lzo9IuN67D6lIYwYZI9Xenz4dDsgyuHfxDjRkbHAqfcniQ2ptume01CCt7IOM2bHmU
 pIKtceN2G7YUAeJvl6CMFGbFqbCSrkfpj1It017fspDv9hV3VMJyoRyV/mxGptYl+a
 LHf/HP01mAacFcrfa/TtVHS9WBkKdTuy0rHvHNw1z314zU+OOtanpKdMDZ/1ITIetb
 H8EmDdox5zLqA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BC5F5CAB783; Mon, 18 Nov 2024 23:52:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219507] nouveau: GeForce GT 710: irq 166 handler
 nvkm_intr+0x0/0x1b3 [nouveau] enabled interrupts
Date: Mon, 18 Nov 2024 23:52:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: newchief@king.net.pl
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219507-2300-EhdfP0DGBv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219507-2300@https.bugzilla.kernel.org/>
References: <bug-219507-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219507

--- Comment #5 from Paul Osmialowski (newchief@king.net.pl) ---
I came across this page: https://bugs.mageia.org/show_bug.cgi?id=3D31695 and
tried the workaround presented on it, I've created /etc/X11/xorg.conf as su=
ch:

Section "Device"
    Identifier "device1"
    Driver "nouveau"
    Option "DPMS"
    Option "NoAccel" "true"
EndSection


And the problem is gone.

Of course, this is only workaround, not a solution.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
