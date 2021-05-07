Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C5A3762ED
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 11:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F25E6EE0A;
	Fri,  7 May 2021 09:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6292C6EE0A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 09:34:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 230BB61468
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 09:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620380057;
 bh=lTN/RjoqfgWxW8IIz40WbzEtz4ehjvDx+qwIYVn2If8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SOD0BmubbYcB1QX1J9GbMeSLa7VGrFLPKjrairJWepNh533UO/5d/UT/h/mLY03um
 XIs5kZ4WWA0eUW6f6UcT3iSCqmJOb2oRyal6IOn8PvrdtnG6XyAVJdm/z9akrjFReG
 g2Izf/ezTsb76h7lC/Gc6j0/mJ+MXkNnz3iddGxdbTYVE3G3HKOMWQgVH6oyMhiC3S
 8IPyvLY7tlT3jkdCWlNdeIZbM/YKP82bgPDB3fJfCiWWZ2t9rOU/vrQddSjR/Hg0wr
 kV/Hll9Yumuq7ZUuyN+ZK9y01suDgq8MkFhrGYZwxJu+LSz1XuzKF0I9NHK3o78TjV
 zJvxIlrhLxk3w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1E75260F25; Fri,  7 May 2021 09:34:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 51381] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 5secs aborting, when disabled via vgaswitcheroo
Date: Fri, 07 May 2021 09:34:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luca.trombin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-51381-2300-kQI4171jpX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-51381-2300@https.bugzilla.kernel.org/>
References: <bug-51381-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D51381

--- Comment #54 from Luca T. (luca.trombin@gmail.com) ---
(In reply to Luca T. from comment #53)
> Dear all,
> I'm using Linux Mint, before I used Arch Linux and also Red Hat, but my
> laptop suffer of the same problem because of this kernel bug where Radeon
> gets stuck in a loop:
>=20
> Feb 06 17:57:17 oldlaptop kernel: [drm:atom_op_jump [radeon]] ERROR atomb=
ios
> stuck in loop for more than 5secs aborting
> Feb 06 17:57:17 oldlaptop kernel: [drm:atom_execute_table_locked [radeon]]
> ERROR atombios stuck executing CB56 (len 62, WS 0, PS 0) @ 0xCB72
> Feb 06 17:57:17 oldlaptop kernel: [drm:atom_execute_table_locked [radeon]]
> ERROR atombios stuck executing B716 (len 236, WS 4, PS 0) @ 0xB7E3
> Feb 06 17:57:17 oldlaptop kernel: [drm:atom_execute_table_locked [radeon]]
> ERROR atombios stuck executing B674 (len 74, WS 0, PS 8) @ 0xB67C
> Feb 06 17:57:17 oldlaptop kernel: [drm:si_dpm_enable [radeon]] ERROR
> si_init_smc_table failed
> Feb 06 17:57:17 oldlaptop kernel: [drm:radeon_pm_resume [radeon]] ERROR
> radeon: dpm resume failed
>=20
> This is happening every time I'm switching from a VT to another or any ti=
me
> I need to login.
>=20
> Is there any progress or resolution of this issue?
>=20
> Thanks,
>=20
> Luca

Ok sorry, I found myself that adding the flag "radeon.runpm=3D0" to the ker=
nel
parameters resolve the issue.

Thanks anyway,

Luca

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
