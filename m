Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0747A43CB2D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 15:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA5A890EB;
	Wed, 27 Oct 2021 13:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB425890EB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 13:50:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C0CD960F5A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635342646;
 bh=OAiONdkhDTQaa0UVicXRXj6oB9x5H4jrvS3VNdgJNgc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WdMUaWcq2mn58xppVLEeimR+Qdho9xipeU3k0KA+yKuCM29Dsjm0lrPteGTsbtL5K
 VLTMSFueD+UAjViCd8HjFgDUrQggaIWLMbFgQaVeUAeygx4aMkM6IKGti8ZV+fItYx
 jN8HYKsQv9kjwhd8LePsP0PpvQeYPzgYfqDth0xLbY5j0Vl4VQRHHhTU6kEpkbDfjM
 iL1wTAHja94AuDgJsWjVHLE7Zn4wR8jGAK0yCQnU9Bg5ftdiG1SCNjIqy2OZb0l+zo
 5PLEl4FFfRmHH52bWV/0qiStaCiueVac336YVt43hQ68thvKBTTmFKd5VI3wBcCwz6
 sNpBMEgTYF4Pg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BE19161100; Wed, 27 Oct 2021 13:50:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Wed, 27 Oct 2021 13:50:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214621-2300-pYPKPscKIU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214621-2300@https.bugzilla.kernel.org/>
References: <bug-214621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214621

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Lang Yu from comment #3)
> Could you please reproduce it on a ubuntu 20.04 system? I didn't reproduce
> it on ubuntu 20.04.
Not on this machine unfortunately. I need it 24/7 as a fileserver and audio
server. Building vanilla or -rc kernels and running these on Gentoo is fine=
 but
installing another distro, getting configs equal and running Ubuntu instead=
 for
testing purposes is too much effort, sorry.

> And could you please get outputs of following command before rebooting?
> Thanks!
>=20
> $ cat /sys/kernel/debug/dma_buf/bufinfo
Current kernel is v5.14.14, built with clang 12.0.1 (-Os).

 # cat /sys/kernel/debug/dma_buf/bufinfo

Dma-buf Objects:
size            flags           mode            count           exp_name=20=
=20=20=20=20=20=20
ino=20=20=20=20=20
03047424        00000002        00080007        00000003        drm=20=20=
=20=20
00415409=20=20=20=20=20=20=20=20
        Shared fence: drm_sched gfx signalled
        Attached Devices:
Total 0 devices attached

03047424        00000002        00080007        00000003        drm=20=20=
=20=20
00414559=20=20=20=20=20=20=20=20
        Shared fence: drm_sched gfx signalled
        Attached Devices:
Total 0 devices attached

00004096        00000002        00080007        00000003        drm=20=20=
=20=20
00414537=20=20=20=20=20=20=20=20
        Attached Devices:
Total 0 devices attached

00004096        00000002        00080007        00000003        drm=20=20=
=20=20
00415280=20=20=20=20=20=20=20=20
        Shared fence: drm_sched gfx signalled
        Attached Devices:
Total 0 devices attached

07864320        00000002        00080007        00000003        drm=20=20=
=20=20
00244896=20=20=20=20=20=20=20=20
        Shared fence: drm_sched gfx signalled
        Attached Devices:
Total 0 devices attached

07864320        00000002        00080007        00000003        drm=20=20=
=20=20
00242446=20=20=20=20=20=20=20=20
        Shared fence: drm_sched gfx signalled
        Attached Devices:
Total 0 devices attached

00065536        00000002        00080007        00000003        drm=20=20=
=20=20
00058778=20=20=20=20=20=20=20=20
        Attached Devices:
Total 0 devices attached

08355840        00000002        00080007        00000004        drm=20=20=
=20=20
00058661=20=20=20=20=20=20=20=20
        Attached Devices:
Total 0 devices attached

08355840        00000002        00080007        00000002        drm=20=20=
=20=20
00003715=20=20=20=20=20=20=20=20
        Shared fence: drm_sched gfx signalled
        Attached Devices:
Total 0 devices attached


Total 9 objects, 38608896 bytes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
