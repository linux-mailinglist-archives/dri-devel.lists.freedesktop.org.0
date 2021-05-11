Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F036A37A438
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 12:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198176E49B;
	Tue, 11 May 2021 10:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184DE6E49B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:03:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BED7B61939
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620727424;
 bh=d9lBGZlkxeqjucWqLT4vB388P5e+Br+Ds0sNt26TA2s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CyGV+zgG2M+0E/QqP/NinTnPzZmMbeB8PWOc8+l/82K0UrB1jutquQ+buPgZil3fy
 sN/Nxj8bWI6N7zM20p5A3v+0D7K6C8P3UHW5T6+QFCXqbpsJY4xO2lE634l3eAs9Tf
 +R2YL7x9zHCx2SppmpKZhit5vmoWYB68weThEIwHKyA8YaaVPtrf2iiIBXAJTpXTOd
 1kjGt5raNB0qsbnsQ9x2ZClgaRA/8bbm8oribrvTLXqKl84smfAMYbEySBlg6LBp2W
 4bsjoEVc65un8Zl5yNmS7tLLoRT6M5n2W4/tSo4HQsObW0f57kajV5bgLah+Ny+TQu
 mK4eoTiYxpSYw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BB0F761264; Tue, 11 May 2021 10:03:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 51381] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 5secs aborting, when disabled via vgaswitcheroo
Date: Tue, 11 May 2021 10:03:44 +0000
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
Message-ID: <bug-51381-2300-FCqiQjzP3p@https.bugzilla.kernel.org/>
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

--- Comment #60 from Luca T. (luca.trombin@gmail.com) ---
(In reply to luminoso from comment #57)
> For users still facing this issue, I workaround it with this:
> https://github.com/aelveborn/vgaswitcheroo-systemd
>=20
> Basically before suspending it restores the GPU powerstate and resumes it
> once coming from a suspend state.
>=20
> Never had problems again.

Hi Luminoso,

I have a problem with my graphic card: it happens frequently that my card d=
oes
not refresh the screen (especially when I'm performing "switch user").

Is it happening to you too?

Thanks,

Luca

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
