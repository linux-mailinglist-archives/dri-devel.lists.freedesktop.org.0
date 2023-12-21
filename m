Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEB681AF47
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 08:19:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F56E10E062;
	Thu, 21 Dec 2023 07:19:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6285F10E062
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 07:19:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 80C7F61853
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 07:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33A44C433C8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 07:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703143176;
 bh=sUKrw/kqXbzmLgsEFpvXF88zidFkG6lZ8Nh7sgWODck=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aqQcelwX7h1HHzXpcf772pNbamvREdykCwpvRQXatweW5yPYAi5jd/qpFmIwLBkZ5
 H7PHnMWuRCsY3MFbFPU70iSVMpqI6G7N6hJi6szq+KXb/m95JXGohwzC/MEDFt+6dt
 foQ/63hezOGHRE4OPlKWKJ+oH2jhfOdB+gDZ7Kf04tV97IZQU/yqmLR9BUboYBpdVO
 +DJD11XOrAyix2H91/gDY53cQ6VKR92UfnBpTA7KGZClCCpKtTlLj58qxY9jMcaSfv
 TmZP+MkeZfe7NuhVeMlK8/q2AVhVu4E81UD4LD89s7in1QvMGmCRNgsGk10q4iOP68
 giXgwSWlRN/qw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1AF79C53BCD; Thu, 21 Dec 2023 07:19:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218292] Built in Screen (Laptop) won't wake up from sleep (AMD
 Graphics)
Date: Thu, 21 Dec 2023 07:19:35 +0000
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
Message-ID: <bug-218292-2300-VnGtbpHUgr@https.bugzilla.kernel.org/>
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

--- Comment #7 from mail@bewi.at ---
(In reply to Bagas Sanjaya from comment #6)
> (In reply to mail from comment #4)
> > >=20
> > > > Info for my System:
> > > >=20
> > > > Graphics Platform: X11
> > > > Processors: 16 =C3=97 AMD Ryzen 7 PRO 7840U w/ Radeon 780M Graphics
> > > > Memory: 30,1 GiB of RAM
> > > > Graphics Processor: AMD Radeon Graphics
> > >=20
> > > What amdgpu model?
> > >=20
> > > > Manufacturer: LENOVO
> > > > Product Name: 21F80041GE
> > > > System Version: ThinkPad T14s Gen 4
> > > >=20
> > >=20
> > > Confused...
> >=20
> > I'm also confused. ;-) Did you mean this?
> >=20
> >=20
> > [root@xyz user]# lspci -k | grep -EA2 'VGA|3D'
> > pcilib: Error reading /sys/bus/pci/devices/0000:00:08.3/label: Operation
> not
> > permitted
> > c3:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/AT=
I]
> > Phoenix1 (rev dd)
> >         Subsystem: Lenovo Phoenix1
> >         Kernel driver in use: amdgpu
> >=20
>=20
> I mean I'd like to know what gpu chipset is (hint: see laptop specificati=
on).

Sorry i mean that i have posted this on the first post.

Here is the data:

CPU: AMD Ryzen 7 PRO 7840U
Graphics: AMD Radeon 780M
Chipset: AMD SoC (System on Chip) platform

https://psref.lenovo.com/syspool/Sys/PDF/ThinkPad/ThinkPad_T14s_Gen_4_AMD/T=
hinkPad_T14s_Gen_4_AMD_Spec.PDF

Thank you for your help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
