Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A02B8482AAD
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jan 2022 10:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B00899F0;
	Sun,  2 Jan 2022 09:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAAB899F0
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jan 2022 09:37:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6D7F60E04
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jan 2022 09:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5F98C36AF4
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jan 2022 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641116247;
 bh=kqqUNzeMMbd40ugqdVqf8w2o6zl+DaVnnm9ZXEHSciw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SEmkICb60+iaMgeknqWnEdi252E+ymJyOkyQ7mlz1ws+wq0FM9zwwg6gwAnN04XJP
 Y+Yr0Z4CC9Vlqam7YwyZ/OcI+Gp8fRkY9Rx4xbUQvv0OcrDcMDTFWLEHaU+4poEfaR
 4PjtEO89dsFiBdB0vfMOgeSHYKX8mjqJJ/yXFoHwGr6UC/93/htmWd0N9mK/4Lq9i3
 IO4U7A9ly66PNvm85tVJXrhzhAut05jBtD4maYDj4xuYAYpebcQ2O0Eihxp/ah1QyP
 NcH3vEZ3JFhKF43jOnlD9YiTLR5247uImBRzi/3+/ICVa2dHW/XIRwlchzNC0HyNpe
 48Do+i+kc9MtA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A5D6CC05FC8; Sun,  2 Jan 2022 09:37:27 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sun, 02 Jan 2022 09:37:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andreas.polnas93@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-mb69AkjQDX@https.bugzilla.kernel.org/>
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

Andreas Polnas (andreas.polnas93@hotmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andreas.polnas93@hotmail.co
                   |                            |m

--- Comment #31 from Andreas Polnas (andreas.polnas93@hotmail.com) ---
(In reply to Jesper Jensen from comment #14)
> I'm now seeing this bug again. This time it happening while launching dot=
a2.
>=20
> Hardware:
>  RX 5700 XT
>  Ryzen 3800X
>=20

Same here, happens with dota2 for me as well.=20
With dual monitors this can happen occasionally, I can either turn one of t=
he
monitors off, or as I have done lately is to modify the Launch options of t=
he
game on steam to use -phased_window_create.=20
I have no idea why this works. I will run with the setup and report back if=
 it
continues to solve the issue or if I have just been lucky.

Hardware:
 Motherboard:Z97-S02 (MS-7821)
 GPU: Radeon RX 5500/5500M
 CPU: i7-4770K

Software:
 Mesa 21.3.3=20
 Kernel 5.10.89-1-MANJARO

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
