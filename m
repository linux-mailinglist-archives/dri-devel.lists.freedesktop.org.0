Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F0F81ACDB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 04:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92AA10E047;
	Thu, 21 Dec 2023 03:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8E210E047
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 03:03:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 28081617AB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 03:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE274C433C8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 03:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703127798;
 bh=PXcKElTCJnT5zvyDs9EzMx9rSOPibySZzpZreSfGXd0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ANlCrxjb4TL1zoYkqP0ZMsZaR3yx7PHHyZ5UHj4cZvYiv4uDxHbpG6pXhVRL2SXZe
 JQSxLRL9biTdwRUlWe0Iqnw3CcN/vcScMzKC9GuXsZEUyVX2rjWy2m1r6yzw3dITE8
 KA9HDvVonTKeq8ZBaMuKeRyfoAeSsj56WhhqE41UvI/HQ9qY2TTJyMEuYEI6BBs06n
 5QsRUd0gPU2kaE4/iZk9rTRhvtpUYjxz3Ev+9cIMaBOc4vL9UnHha6+tLzplA7wKil
 cq/l21SwZzSm4trA5NgratovyE0ZoOmsYBjyT9IJqCZD1f6OAQjksK2+5ZC5TVu6KR
 FHsrTxaXXeoUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A56B0C53BD1; Thu, 21 Dec 2023 03:03:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218292] Built in Screen (Laptop) won't wake up from sleep (AMD
 Graphics)
Date: Thu, 21 Dec 2023 03:03:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bagasdotme@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218292-2300-M9oqoEtOGQ@https.bugzilla.kernel.org/>
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

--- Comment #6 from Bagas Sanjaya (bagasdotme@gmail.com) ---
(In reply to mail from comment #4)
> >=20
> > > Info for my System:
> > >=20
> > > Graphics Platform: X11
> > > Processors: 16 =C3=97 AMD Ryzen 7 PRO 7840U w/ Radeon 780M Graphics
> > > Memory: 30,1 GiB of RAM
> > > Graphics Processor: AMD Radeon Graphics
> >=20
> > What amdgpu model?
> >=20
> > > Manufacturer: LENOVO
> > > Product Name: 21F80041GE
> > > System Version: ThinkPad T14s Gen 4
> > >=20
> >=20
> > Confused...
>=20
> I'm also confused. ;-) Did you mean this?
>=20
>=20
> [root@xyz user]# lspci -k | grep -EA2 'VGA|3D'
> pcilib: Error reading /sys/bus/pci/devices/0000:00:08.3/label: Operation =
not
> permitted
> c3:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
> Phoenix1 (rev dd)
>         Subsystem: Lenovo Phoenix1
>         Kernel driver in use: amdgpu
>=20

I mean I'd like to know what gpu chipset is (hint: see laptop specification=
).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
