Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A663851E498
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 08:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BC511272B;
	Sat,  7 May 2022 06:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9740A112527
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 06:28:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8052560DC9
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 06:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B551C385B9
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 06:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651904927;
 bh=dCyB0lRD/hJWIt2PgSGrIrllTIqHGKlP297chmoASxo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VLQPL7UNullRwIykPIwt1PjdN/1LS3bOENkAPuHRrcQWURQlAlgMv18zlkV2WhwRY
 JzKxpENV/10zMlCaMX/xBax6FgkO34hovkMzVcuM1AP2khbNfPoQFI4hpva9GoEYdZ
 5JaT+Bc9N9GtbTAx4OEFFLmHSThF2kw6drTC9S20e8PcU+BUNrJvE02bnRjag75ILC
 GdGkI2zfKTL8tpQgdCdpH0nN+8Rqz13ZNEIsgDFkzupX/BZg365DMGJx9tekS5RTzu
 bAIbK73M7F2EsOLnU5QA0K82+BRFuJmPkq4XDA+42u4E8mHW/+EWNLJq/sF4iKwzZ8
 6wMcnomp03rag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6A267CC13B1; Sat,  7 May 2022 06:28:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sat, 07 May 2022 06:28:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mastercatz@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-56atboArZi@https.bugzilla.kernel.org/>
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

--- Comment #38 from MasterCATZ (mastercatz@hotmail.com) ---
amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize parser -125

AMD Radeon R9 200 Series (hawaii, LLVM 14.0.0, DRM 3.42,
5.15.34-051534-generic)
OpenGL version string: 4.6 (Compatibility Profile) Mesa 22.2.0-devel
(git-6983c85 2022-05-07 impish-oibaf-ppa)
Ubuntu 22.04 LTS

Kernel command line: BOOT_IMAGE=3D/vmlinuz-5.15.34-051534-generic
root=3D/dev/mapper/Raid6LVM-lvUbuntu ro rootflags=3Dsubvol=3D@ amdgpu.gpu_r=
ecovery=3D1
amd_iommu=3Don iommu=3Dpt delayacct acpi_enforce_resources=3Dlax
usbcore.autosuspend=3D-1 apparmor=3D0 amdgpu.dc=3D1 amdgpu.dpm=3D1
amdgpu.ppfeaturemask=3D0xfffd7fff amdgpu.dcfeaturemask=3D2 amdgpu.si_suppor=
t=3D1
amdgpu.cik_support=3D1 radeon.si_support=3D0


I could not find my dmesg logs containing the crash and neither did=20

journalctl -k --since "2 hours ago"

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
