Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4614D459090
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 15:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88BA89CF6;
	Mon, 22 Nov 2021 14:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1791089CF6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:50:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E737F60F41
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637592620;
 bh=E9Iz1Glf7sDHP3RN/SBXoxaeilVomDnhAEaaDieHTCI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NtRoNpicRHG+tUqY2sn4ppuIfm3Qq0wPIu1t4cA4X8U3wzQdI0DTJBs/ousXW2f5R
 KOd7+2C0515tSYIHC/SLpUtt2tewybfVXzUyYBkrMaYDz1nLgFR03dGU0EASxAyRr9
 NJAAPwOGDAv+FrVrWUdZ8zD7n7YXFE4hTU+ILuyvcWbRVwN5EZstTGYBSMaP0DkyVL
 baUxWZ1DbhgPlB6upeVPqfFimG3uSdeSQBaEX2jSYZ2jnsOj0AlQZvEJaLAQsDW66l
 qPF5rGSuIf93BkiMiVTSdHm5+DzeGkVvNfm01flq+Xr+MtF8JFo1LfjiScFYfKBAsn
 E1EZlOnRCCG8Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E4A8260EBD; Mon, 22 Nov 2021 14:50:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Mon, 22 Nov 2021 14:50:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-M0nbE6B44S@https.bugzilla.kernel.org/>
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

--- Comment #26 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Hristos from comment #25)
> Kernel: 5.15.3
> Mesa: 21.2.5
> Xorg: 7.6
>=20
> I see this when running OpenMW and a lot of mods
> (https://modding-openmw.com/lists/total-overhaul/). OpenMW with no mods o=
r a
> smaller mod list seems to run fine.
>=20
> When the program starts rendering the actual game scene (after loading da=
ta
> files and etc) it will hang, and then crash with "Failed to initialize
> parser -125" messages in the console.=20
>=20
> It only happens with Mesa 21.2.X, though. When I downgraded to Mesa 21.1.7
> everything ran as expected.

This sounds like a mesa issue.  You might want to open a mesa issue:
https://gitlab.freedesktop.org/groups/mesa/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
