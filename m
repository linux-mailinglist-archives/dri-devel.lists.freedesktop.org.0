Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A923B5EB9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 15:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AAE6E0DC;
	Mon, 28 Jun 2021 13:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185E06E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 13:09:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B63A4619BE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 13:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624885784;
 bh=6xvADQauUB1SCIzb3+FJJI1jkw41QEgaW3DZJZbkhPU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gqKlZsGp1dJWTgHc7e/Pjf22+Iy7Lky1qtNlA1reZ2DtAEVJs4IEEHyBeNKAgg3+c
 avvr4YbRW/Wh+rNnxpqLz2C6Qld0A2qkHKOqG9wc9oh9Kr3d3gUGGzIZQmjpnTLJZ9
 zYu7BFsOVOzG6TwSLF9fr3ZcNS+qnMNTsogWb/eAaZ7m3zhihqWZLjwj8ZkDHIMDL4
 wdUFiWH5pzfoyHcbuhrxE2npPY+jPEgqOPhK/bK3s7/H6IJShqzKVY9TB2R/efPRvu
 e+ualHCcCBa1fPgLAouepmDkigEKukOcmo6r5oZbinGjsGiNl8Q0s8MWiOJISUoZkG
 hrDKAKarfZDtg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AFB3B61277; Mon, 28 Jun 2021 13:09:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213569] Amdgpu temperature reaching dangerous levels
Date: Mon, 28 Jun 2021 13:09:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: martin.tk@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213569-2300-p3GqKxlGwP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213569-2300@https.bugzilla.kernel.org/>
References: <bug-213569-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213569

--- Comment #5 from Martin (martin.tk@gmx.com) ---
(In reply to James from comment #3)
> This is a legitimate bug which is present starting 5.12.13 and the issue =
was
> said to have been fixed starting 5.13-rc8. I wanted to comment out of
> reassurance that 70=C2=B0C edge temperature for that GPU cannot damage it=
. Notice
> "crit =3D +97.0=C2=B0C" which is the throttle temperature.
>=20
> The computer should shut down at the "emerg" temperature which is not
> present in your sensors output, but should be +5.0=C2=B0C over "crit" for=
 your
> GPU.

Thank you for explanation. I've never seen 70=C2=B0C on my gpu before so to=
 me it
looked scary.

Before those changes landed in 5.11 the usual temperature on my gpu would be
around 40=C2=B0C. The fan would be around 1000rpm which on my gpu doesn't p=
roduce
any  perceivable sound.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
