Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E778387E4E
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 19:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177EF6EC48;
	Tue, 18 May 2021 17:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A756EC48
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 17:18:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8EE8C611CE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 17:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621358333;
 bh=GuEmwwDpqZ/eI5uI6zUjJplOx3YogVIGkVfhtLuCSQQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fvqeu3PS199leZMmI5yknTUQVVjxB52IzPoM0nEbHGmYTj/diwNuvnaO9siqoH6+I
 GryzlvJxKyZSSwzLhGS/YlfuUfzCk26cyCyWmaV5S8khPxHCDcHW6s7YB04ZPohtym
 /HIpZyVr4ApQLTHUUwnRNzv2QXpHvleBazQ7d2K+/z4yXZCf4kMHeqNlJiLJjxNhtf
 xVIZC5tMTjINRoDPoCCXkuWqE2SCGN2aFb/0j58rxZ56fJTyWOyrgifuZB/KuWVX4C
 eIo+9WrlGqCqEpLpeRrUzOYf0FSXGL3oA5ys7LHfFplWJZhMDRxUanpdycBTKNTjfr
 jx77NYU0m/BRg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 88F91611F2; Tue, 18 May 2021 17:18:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 18 May 2021 17:18:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-0ySFgLhTnL@https.bugzilla.kernel.org/>
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

--- Comment #22 from kolAflash (kolAflash@kolahilft.de) ---
@James
What do you mean by video acceleration?
Is this about 3D / DRI acceleration like in video games?
Or do you mean just "video" playback (movie, mp4, webm, h264, vp8, ...)
acceleration?

And I don't completely understand what ip_block_mask=3D0x0ff is supposed to=
 do.
I just rebootet with that kernel parameter added and 3D acceleration (DRI) =
is
still working.


----


I'm planing to run these kernels in the next days:

1. Current Debian testing Linux-5.10.0-6 with ip_block_mask=3D0x0ff, Xorg a=
nd 3D
acceleration in daily use.

2. amd-drm-next-5.14-2021-05-12* without ip_block_mask=3D0x0ff, with Xorg a=
nd
with 3D acceleration in daily use.

3. amd-drm-next-5.14-2021-05-12* without ip_block_mask=3D0x0ff, with Xorg, =
but
without 3D acceleration** in daily use.

4. amd-drm-next-5.14-2021-05-12* without ip_block_mask=3D0x0ff and without =
Xorg,
doing some standby cycles for testing.

If I encounter any crash I'll post the whole dmesg starting with the boot
output.


----


*
amd-drm-next-5.14-2021-05-12
https://gitlab.freedesktop.org/agd5f/linux/-/tree/amd-drm-next-5.14-2021-05=
-12
ae30d41eb


**
Is there something special I should do to turn off acceleration?
Or should I just don't start any application doing 3D / DRI acceleration?
(the latter one might be difficult - I got to keep an eye on every applicat=
ion
like Firefox, Atom, VLC, KWin/KDE window manager, ... not to use DRI)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
