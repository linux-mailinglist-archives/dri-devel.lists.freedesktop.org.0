Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0299581A149
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 15:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B2810E5A7;
	Wed, 20 Dec 2023 14:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C04810E5A7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 14:41:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 97BFF61659
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 14:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45E98C433C8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703083283;
 bh=ihtx5sShVAGKVO7WCu5qUOB6U3nux8/iM5G0twyZnmc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=elfxc9Cdx9FiHI+vnoxhFdRwGXmHG8aTV3br1c4CLe0svxOusEtRft4AKFn5qu0iR
 9G7l+iwEFTTx+Z/WqPFzj/ncLtUvsPBQorrFAmlIo7mtqKfyka4uFrkuLjjQhYD/dx
 H30DVgkFzkrydOcmKnqYz8O/gd2idfqAEo8MXNMRzrDz+Cyh4ri6vQEH+YQiWfkGJo
 WFirPnx5lCfkVe/qWYgbT+eKo3iOYeJ916XoX4bnucRIW0iBCzgJAp8+l2FDIi80Ss
 e1Im5encSZibAW1CNMl+ibkRTwUdDPPkxDWa+/TL3NMTnfNFZEAv90F0EV3yBGwIro
 3ZgApAlgrzU6w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 36692C53BCD; Wed, 20 Dec 2023 14:41:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218292] Built in Screen (Laptop) won't wake up from sleep (AMD
 Graphics)
Date: Wed, 20 Dec 2023 14:41:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mail@bewi.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218292-2300-TlSuXNCJiD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218292-2300@https.bugzilla.kernel.org/>
References: <bug-218292-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218292

--- Comment #4 from mail@bewi.at ---
(In reply to Bagas Sanjaya from comment #1)
> (In reply to mail from comment #0)
> > Hello all!
> >=20
> > I=E2=80=99ve a problem with the wake up from screen sleep (not whole co=
mputer
> sleeo,
> > only display) and latest kernels. When the computer screen goes to slee=
p it
> > won=E2=80=99t wake up anymore. No mouse cursor nor i can change to tty =
(Strg + Alt
> +
> > F1 =E2=80=A6). The journals logs are also empty and only a hard reset h=
elps. I=E2=80=99ve
> > tested it with the lastest Linux Kernel 6.6.6 and 6.6.7. Funnily if the
> > whole computer goes to sleep (for example Sleep, Hybrid Sleep or
> Hibernate),
> > and i disable Screen Sleep before, the screen wakes up. The problem exi=
sts
> > only when the screen goes to sleep. With older kernels (i don't know the
> > exact version, i think before 6.6.x) it does work. I've tested the same
> > behaviour on OpenSUSE Tumbleweed and Arch Linux. Also i changed to Wayl=
and,
> > but the same problem.
> >=20
>=20
> Does waking up from sleep work on v6.5.y? v6.1.y? Also, can you attach
> full dmesg (from both v6.6.y and working kernel)?

First of all thank you for the reply. I've attached the logs. I hope i made=
 it
correctly.

>=20
> > Info for my System:
> >=20
> > Graphics Platform: X11
> > Processors: 16 =C3=97 AMD Ryzen 7 PRO 7840U w/ Radeon 780M Graphics
> > Memory: 30,1 GiB of RAM
> > Graphics Processor: AMD Radeon Graphics
>=20
> What amdgpu model?
>=20
> > Manufacturer: LENOVO
> > Product Name: 21F80041GE
> > System Version: ThinkPad T14s Gen 4
> >=20
>=20
> Confused...

I'm also confused. ;-) Did you mean this?


[root@xyz user]# lspci -k | grep -EA2 'VGA|3D'
pcilib: Error reading /sys/bus/pci/devices/0000:00:08.3/label: Operation not
permitted
c3:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Phoenix1 (rev dd)
        Subsystem: Lenovo Phoenix1
        Kernel driver in use: amdgpu

Thanks again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
