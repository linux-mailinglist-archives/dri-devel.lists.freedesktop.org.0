Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F685775C2
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 12:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BE414A9E9;
	Sun, 17 Jul 2022 10:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14E614AA36
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 10:28:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A9CB361149
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 10:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B79E9C341F4
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 10:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658053692;
 bh=eZe9vGxCo2bvKxLBgxKMQUsbtxrLH/Fxx+9Z3jvBKh4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Hm99PDmtK3rB+YvLNMtRx0PrMeMLWMFKyL9T+0Nod/z6xvqQSGMP/f2kj+YrxMkgE
 QnBFlot0XPBjuIGkx2uGuQtDSOG58RID2Ki3nL/xUttBWYmteQAE2KWrIYwxMfSTux
 Iz7XDWrrk4bYgwB8OKAjKTMkYjQ8b90gr7rNqyeFJ1NwoA69FmMBXq8bvIwe6m3B9C
 gMqc+owK6LxGq/doj0RN00DKgs4zorYTM+Uo/nX195t3BjwYo65CIjGSsj+IJuxwsX
 V3Kk+J+HswicCfTZM4SB1ZYkrPV1UIq8BS2xpddc62my6GzJ6tvQwnCHLZl3/03AOv
 rEsL4oY5BFMeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A7949CC13BA; Sun, 17 Jul 2022 10:28:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sun, 17 Jul 2022 10:28:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: s48gs.w@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-FShrCUN7M4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

--- Comment #82 from Danil (s48gs.w@gmail.com) ---
Afteer using this PC for few days with AMD Vega 8 (integrated) as main GPU I
see no freezes at all. (before in 2021 it was freeze every 10-20 mins so I =
had
to use Nvidia as main GPU)
(works with and without listed above kernel boot option)

I use OpenSuse kernel 5.18.4-1-default (not going to update for some time,
because it works)

Maybe it just fixed for "my motherboard+CPU combination", my hardware:
Ryzen3 3200 CPU (Vega8 integrated) on A320M-DVS R4.0 motherboard.=20
microcode: CPU: patch_level=3D0x08108109
microcode: Microcode Update Driver: v2.2.

Wayland and x11 works, with Nvidia as second GPU.
Wayland slowdown(to like 1-2FPS whole UI performance) once after few hours =
of
using, but it fixed just by switching to system-terminal(ctrl+alt+f1) and b=
ack,
nothing crash video apps and graphic keep working.

integrated GPU performance still goes down(in few hours, randomly in 2-6 ho=
urs
of PC use) and never go back, but its fine(since I have Nvidia second GPU f=
or
complex graphic), Vega 8 performance go down only in "complex shaders" FPS =
drop
from 60 fullscreen(1080p) to 10-20 on complex raymarching shaders, but for
system UI (Wayland/x11 Gnome 42) this is not noticeable, and video play on
60fps as expected. (Sleep mode also works, not every time(because Nvidia) b=
ut
most of the time, same as when used Nvidia as main GPU)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
