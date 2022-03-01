Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E63074C8D75
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2271210E17B;
	Tue,  1 Mar 2022 14:14:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D47A10E17B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:14:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FE9C614CD
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2E24C340F2
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646144064;
 bh=v6N7todfME5nzrRftPcI+kxGCcbYJ7nNeMeMtUEWoCY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cZWa5RRiWySI3Q7PI7QakGT8apnFeE+FFDrh2p23dqek2krE7EdVE6v2gF9QW29AG
 rTktsJjZDmP5fRcnYeJw87p+yraqchk3nwdMN1KpTRYyFAV9DP6Jm4SRKk4seWVH/E
 rNRm8+ZO5TxgE03GfNxfMTwx231Fj8DXK31dPbJngZDc8W8A9RhchOJq2k4cK4YXsF
 EP0W6zYEeiI5kJWJWOleQYzNVI0CP3EaQt1SqCdfzN3fE1VlCpU4cYEBdo8R1GL4+9
 XaGxL7HwozBQ8zfSyoIrTYR8Fi5JgS9KfoRUsTo2rgIV4l8oBrrQ47i5Yygn9U0FZW
 XMPYHhNqi/YDg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9DC2CCAC6E2; Tue,  1 Mar 2022 14:14:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215511] Dual monitor with amd 5700 causes system to hang at
 startup.
Date: Tue, 01 Mar 2022 14:14:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215511-2300-BLyWcYqe6H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215511-2300@https.bugzilla.kernel.org/>
References: <bug-215511-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215511

--- Comment #8 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Philipp Riederer from comment #7)
> Hi!
>=20
> My Lenovo T14s (AMD) crashes with a panic (https://imgur.com/a/P6Twvov) w=
hen
> I unplug/replug any monitor. This also happens when waking from DPMS.
>=20
> I have bisected the issue to the same
> 0f591d17e36e08313b0c440b99b0e57b47e01a9a as Jose. The patch (that is alre=
ady
> mainlined, if I see that correctly) does not help.
>=20
> I have tried all kernel up to 5.15.24 -- I cannot try 5.16 as I use zfs as
> root device the and zfs module is not (yet) compatible with 5.16.
>=20
> Is there anything you would like me to try or should my issue be fixed in
> 5.16+?

Please open a new ticket as this is a different issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
