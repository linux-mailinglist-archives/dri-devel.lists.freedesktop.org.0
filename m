Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A523EBBB3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 19:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D716E8B9;
	Fri, 13 Aug 2021 17:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AEA6E8B9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 17:50:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DEB99610E9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 17:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628877029;
 bh=wLSIBeqn8mYsILOmBkINtrpBFFGxm/J2r6jMLXYPdh8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Q5A8MM4CKaFRzwBGPaCuA0Zdi2JnsGnOSgJ1QcB6Fx7f+KT+FzqIhYDHPSYyPTACP
 z0/isDoHF88IKRDxzFlnnazqnifunfMRhLi0p3jIYbzr5p+3HNDokOYbmCw50/hOD3
 OzWhM/j+qeIL3+3jPLv2WEaLQJoupiB9B44w9aThhgBUwrKwibkmpjXj/4BSoPps0h
 m6DIIxU9gSqI433JHJY3MvFZ/s8hEF6JJaDn2q+z8kYejn6ihw5TpuDjMVNsQjEoyO
 nL4KZAjvojgi8WFDG3KexqhZ7aMxWURnnkPOvRmWO1oB8Bq2elvmtCdxImdnpG0juU
 Nmq7z0EygHybg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D708460EFE; Fri, 13 Aug 2021 17:50:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214001] [bisected][regression] After commit "drm/ttm:
 Initialize debugfs from ttm_global_init()" kernels without debugfs explicitly
 set to 'allow all' fail to boot
Date: Fri, 13 Aug 2021 17:50:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 1i5t5.duncan@cox.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214001-2300-rNF8khOcOr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214001-2300@https.bugzilla.kernel.org/>
References: <bug-214001-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214001

Duncan (1i5t5.duncan@cox.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |1i5t5.duncan@cox.net

--- Comment #2 from Duncan (1i5t5.duncan@cox.net) ---
This has been reported (by someone else) on the dri-devel list (with the ma=
in
kernel list and the devs CCed) as well, with me confirming it there.  No an=
swer
from the devs there either.  The reporter and I followed reporting instruct=
ions
to take it to the list, and no hint it was even seen, despite the release
getting closer and closer.

So I was going to try bugzilla (despite instructions to take it to the list=
),
to see if I could raise the profile a bit, and find this bug.

Anyway, it's on both channels now.  FWIW:

https://lore.kernel.org/dri-devel/?q=3D5.14.0-rc4+broke+drm%2Fttm

Tho FWIW your symptoms are a bit different than those of the OP there and I=
.=20
We were able to boot, but only to legacy low-res VGA mode.  He has a
boot-splash enabled and the screen blanked from early boot when the
drm-framebuffer would normally take over until the login prompt, which appe=
ared
in vga mode.  I prefer to see the boot messages so no splash, and didn't ha=
ve
it blank, the screen just never left the legacy vga mode it normally uses f=
or
early boot.  We're both on Radeons; he's on the old radeon driver while I'm=
 on
amdgpu (polaris-11, rx460).

I wonder if you don't have the legacy vgacon (CONFIG_VGA_CONSOLE) enabled a=
s a
fall-back, as that would explain an apparent hang due to no valid graphics =
(tho
the system may have booted, just without graphics).  Alternatively, I don't
know what the behavior of non-radeon/amdgpu drm-framebuffer drivers is, may=
be
whatever you're running either does hang or simply doesn't fall back to vga=
con
as our radeon and amdgpu drivers did?

But in both his case and mine it bisected to the same commit, 69de4421bb, a=
nd
reverting it against current gave both of us working systems again, so it's=
 the
same bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
