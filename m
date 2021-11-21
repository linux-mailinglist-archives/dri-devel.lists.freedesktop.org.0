Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10984458576
	for <lists+dri-devel@lfdr.de>; Sun, 21 Nov 2021 18:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C555F6ECBE;
	Sun, 21 Nov 2021 17:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C646ECBC
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 17:30:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6039360F41
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637515814;
 bh=LkTWKJkuYp3K43IZbGc5zuZfqfv+t0r4EkL4pXqxytM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=okC5hvUaUO+sx0/C7BQC66FQrIOMwzAEoJAt0t8b2Ycp1j6BdJ+aWkYu90X1caN55
 d3ViQQEQ3HujU8gB6UrC1z5PIzoNTTW8u0/d7LI5ISvUFjho+kHYYJuMbTEM1vr0u/
 dgtHtTNADkr4SBjmC7/SxEJ6ILo4I2hAFUOt7qAYGj9oxQnoJ2D0h6cbEh2R6VppOp
 +oOiE4MK65kFu6UBcA9bpcJ1btVZaVJ4LqcESZIjskd8pPOrvtqpy/VAwjs4mzrS7T
 a3NUQ1qQ8xs3cE0y7rjuVxWfAplhBj9uKNpHxHqv6DapaLgE5/C5LFYveAqQPuLW/S
 MDjc+njslMO2Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5D18A60ED3; Sun, 21 Nov 2021 17:30:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sun, 21 Nov 2021 17:30:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel-bugs@hristos.co
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-KUhQ1EXCYt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

Hristos (kernel-bugs@hristos.co) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kernel-bugs@hristos.co

--- Comment #25 from Hristos (kernel-bugs@hristos.co) ---
Kernel: 5.15.3
Mesa: 21.2.5
Xorg: 7.6

I see this when running OpenMW and a lot of mods
(https://modding-openmw.com/lists/total-overhaul/). OpenMW with no mods or a
smaller mod list seems to run fine.

When the program starts rendering the actual game scene (after loading data
files and etc) it will hang, and then crash with "Failed to initialize pars=
er
-125" messages in the console.=20

It only happens with Mesa 21.2.X, though. When I downgraded to Mesa 21.1.7
everything ran as expected.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
