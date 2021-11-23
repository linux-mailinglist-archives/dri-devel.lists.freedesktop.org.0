Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C422345AD84
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 21:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA4C6E3FC;
	Tue, 23 Nov 2021 20:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6265A6E3FC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 20:44:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 24A5B60FE8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 20:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637700246;
 bh=9a+LvLfEZlW9Flfwy6n7+plGXkwzQpvg0609NccOs64=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Jz6qyC8Y4xFeZ5Q7B8H5DlR2PGGR/KkwJuWc255EJumVVtTQNxOrYFvtpczRnGHtu
 6W5wSvAPCoOewY3lq/hSMDxGqAk2kJIkoWaUSA9M5wRyWH55ivZGHxUCn14jdvFRPs
 EFt56tFHu8ezm9lNcxYpMHBU94o/1546lJflXB/HLa1ThBD3/03nhy0sxb+mLq3lvU
 EaVti2nk31n3VpxG1fsrLwKYcAx/1V0RGoiCBNJUn0W17D82Fr83j6nTUlRF9Vi3Dx
 8DJ/JYLd03vesBpr9cZq/tz7gNaGuGSV02bYtjOP+EZ7yElDFZDfA5v+h7JPAZnvwT
 exfmCRmEdeGgw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2152A60F6E; Tue, 23 Nov 2021 20:44:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 23 Nov 2021 20:44:05 +0000
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
Message-ID: <bug-211277-2300-tU3Rbzqyzt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #76 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to James Zhu from comment #75)
> (In reply to kolAflash from comment #74)
> > @James Zhu
> >=20
> > Tested 5.15.2 for over a week and more than 50 standby-wakeups.
> > No problems!
> > Thanks :-)
> >=20
> > I would be happy about a patch for the 5.10 longterm kernel.
> > The bug became a problem with v5.10-rc3 (see comment 14), just before
> Debian
> > made 5.10-longterm the Debian-11 kernel. So it would be great if I and
> > probably other Debian-11 users could finally use that AMD GPU without
> > workarounds.
>=20
> Hi @Alex Deucher, Can you help on this request? thanks! James

I cc'ed stable with the patches so they should show up in 5.10 assuming they
apply cleanly.  If not, can you look at what it would take to backport them?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
