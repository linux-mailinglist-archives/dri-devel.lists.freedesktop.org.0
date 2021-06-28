Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1114D3B5ACB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 11:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4326E08C;
	Mon, 28 Jun 2021 09:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBF06E08C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 09:01:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 105836198D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 09:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624870871;
 bh=heSeye1fLdizI66i3XgC+OYLKj0+/zAlo1IEq1WTnMA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OJSGqwYowOQHptropmtjTJRWZ6NFYtRwbeqaw+8p7+GOvIN7/n2Pky6bnoajObuGC
 LrT7j6z9mI/hztiMvwKyfUSwQtF5faDekgO4kOBtpsSWbRwY2pLuwZhlQQjIQsygUL
 591pgFAjTWvovBbj0y0pR4oF/a0AaMNLiToV5a5K+Pe8IWWCIMgVJGjbHM5X+XJ9OT
 KHndEYlEmUwebeCvNOOOsz1vW2bZ5ZWB5Av0fARY3KUbtcFVEFJloAWcGe+cRLoqq1
 7OPsCpcMGunpU1hv1Y8ocq7cM+sBcXFT6lZyN+IgoGP8WFUb5jzfjh2F3CHnZX64v+
 c+YTnY3e0TuPA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0D0A26121E; Mon, 28 Jun 2021 09:01:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Mon, 28 Jun 2021 09:01:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jeromec.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-BtCjBmMoKa@https.bugzilla.kernel.org/>
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

--- Comment #34 from Jerome C (me@jeromec.com) ---
Using 5.13.0 now and the issue is still here

(In reply to kolAflash from comment #32)
> Created attachment 296901 [details]
> dmesg via SSH, running amd-drm-next-5.14-2021-05-12 without
> ip_block_mask=3D0x0ff and with Xorg
>=20
> (In reply to Jerome C from comment #31)
> > [...]
> > hiya, you may not know this but use in "amdgpu.ip_block_mask=3D0x0ff" a=
nd not
> > "ip_block_mask=3D0x0ff"
> > [...]
> > I can see in your kernel logs that VCN is still enabled
>=20
> Ooops you're right.
> I know someone wrote that before. But it seems I somehow missed it while
> editing my Grub parameters.
>=20
> I'll give it another try!
>=20
>=20
> ----
>=20
>=20
> In the meanwhile I performed test number 2.
>=20
> > 2. amd-drm-next-5.14-2021-05-12* without ip_block_mask=3D0x0ff, with Xo=
rg
> [...]
>=20
> This time the crash was very different!
>=20
> After some minutes (about 3) the graphical screen actually turned back on.
> I'm pretty sure that didn't happen with the other kernels I tested.
> (never tested amd-drm-next-5.14-2021-05-12 before)
>=20
> Nevertheless everything graphical is lagging extremely. If I move the mou=
se
> or do anything else it takes more than 10 seconds until something happens=
 on
> the screen.
>=20
> On the other hand SSH access is smoothly possible. And I was able to save
> the dmesg output. (see attachment)
> Unlocking the screen via SSH (loginctl) or starting graphical programs
> (DISPLAY=3D:0 xterm) works, but is extremely slow too. (> 10 seconds wait=
ing)

You have any updates since you corrected the kernel parameter?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
