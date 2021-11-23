Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE50D45A6C7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 16:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B25F6E053;
	Tue, 23 Nov 2021 15:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF646E053
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 15:48:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8876660E95
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 15:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637682518;
 bh=KxsInVBmad2jr4fBBnRCSix2M4CIoDZiMgMgrjhOdVg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Z3y7r2d9cPHXl0+AhxQhmd4bbJ68pIXj8ZuYjA81hIuTOLXtC9Dvi4wB21Sp+LlqN
 r1b8WRYbJcVqj+Lbx/d16C+faeEreKu/CB4NwgGB8mCz2cs2y+k3Af/7On3LUvXW1I
 Tmb8tZGE+EI9zVvKj1fD2FT3MUKK9P+s2n8jLjf7Q2QH53+ILOuyCM9ff/6yScPnCE
 IcTiQZZpjglYSjMorn2EIx0o4LZiHAi8GGAcNQVN8ZR2cefMfFo/BvW84uTTTi1gQT
 1KM+8YnkjFvGOIjfLn+ZyMfc9ViFxRhcxty1caXTsbQuyouJTwBiJxcINeCS6/hr3v
 /L7mhUNbd3Wxg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8569D60F4D; Tue, 23 Nov 2021 15:48:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Tue, 23 Nov 2021 15:48:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: zwerg12@mail.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211807-2300-c7XpOclIb4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

--- Comment #16 from zwerg12@mail.de ---
(In reply to Alex Deucher from comment #13)
> (In reply to zwerg12 from comment #12)
> > As mentioned before, I get the same error with a monitor connected with=
 DP
> > to a Lenovo ThinkPad USB-C Dock Gen2. My Laptop has an Intel i7 10510U =
no
> > additional graphics card. I am using Debian testing with the provided
> kernel.
> >=20
> >=20
> > During this my notebook monitor is blinking.
> > This setup worked for around four weeks when suddenly these errors
> occurred.
>=20
>=20
> Can you bisect?

I have never done it yet. But as soon as I am at home I can try.

(In reply to Michel D=C3=A4nzer from comment #15)
> (In reply to Daan from comment #14)
> > I also had this in my logs yesterday, right before my system locked
> > completely (had to do a hard reset).
>=20
> That's probably coincidence. I get these messages on a regular basis,
> without any bad behaviour.

Sometimes when I get this message there is no bad behavior but sometimes I =
also
have to do a hard reset. Without the docking station I never had to make a =
hard
reset.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
