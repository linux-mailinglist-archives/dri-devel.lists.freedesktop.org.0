Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE06554A60
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 14:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3740310E385;
	Wed, 22 Jun 2022 12:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE5C10E385
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 12:56:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 77D49619FA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 12:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3ADE4C341C7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 12:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655902600;
 bh=2Jod6vcJ5qzSfP8dUFeVxqic2811F/zoYt7Kv4StLmA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LQdAalVzi1ELpdU/z8Qh0+OURwNITwgwUUxKdLa4Bo+Dy2AdopVUbpdmcONS3Mr8f
 dcfP500qbOULPUOQhb5iaW0dixWcX1Vyxn+DZ9OR0n09SlNcvkjHmCwfuYK3AfCAf2
 m7cBmpuqrM7XtDx+BypDKWqfR2HhpUidNFKY5rrUVP7mpeSfh6eV9QcNWLuapAlICL
 h3pZANcIbTiLEFPYNCtegYs9heKKs8SPpWozgRfIzUUnJ4+YYdJMY8QNm/DG3LqwdC
 exig5akLGGTQLIqVgN/1GB4Ta6CNu38pftfGPHZocvDTQYedbtpRRL+ue54gCihd8d
 rBQqF6KENdGHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2A20CCC13B4; Wed, 22 Jun 2022 12:56:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Wed, 22 Jun 2022 12:56:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: martin.von.wittich@iserv.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-jhhV2qOrbk@https.bugzilla.kernel.org/>
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

--- Comment #74 from Martin von Wittich (martin.von.wittich@iserv.eu) ---
> Did you try with the latest Linux Kernel? I had a lot of gpu lockups like=
 this. Also try these kernel parameters : "amdgpu.ppfeaturemask=3D0xffffbff=
b  amdgpu.noretry=3D0 amdgpu.lockup_timeout=3D0 amdgpu.gpu_recovery=3D1 amd=
gpu.audio=3D0 amdgpu.deep_color=3D1 amd_iommu=3Don iommu=3Dpt"" ( you might=
 also try with amdgpu.ppfeaturemask=3D0xfffd7fff or amdgpu.ppfeaturemask=3D=
0xffffffff )

I can confirm that at least on the current Ubuntu linux-image-oem-20.04d
kernel, these options do not resolve the issue:

```
martin@martin ~ % uname -a
Linux martin 5.14.0-1042-oem #47-Ubuntu SMP Fri Jun 3 18:17:11 UTC 2022 x86=
_64
x86_64 x86_64 GNU/Linux
martin@martin ~ % cat /proc/cmdline=20
BOOT_IMAGE=3D/vmlinuz-5.14.0-1042-oem
root=3DUUID=3D1bd000ac-1487-4457-be1a-5ea901ded9e9 ro
amdgpu.ppfeaturemask=3D0xffffbffb amdgpu.noretry=3D0 amdgpu.lockup_timeout=
=3D0
amdgpu.gpu_recovery=3D1 amdgpu.audio=3D0 amdgpu.deep_color=3D1 amd_iommu=3D=
on iommu=3Dpt
quiet
martin@martin ~ % dmesg -T | grep 'ring gfx timeout'
[Mi Jun 22 14:48:07 2022] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring g=
fx
timeout, signaled seq=3D1820983, emitted seq=3D1820985
[Mi Jun 22 14:48:18 2022] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring g=
fx
timeout, signaled seq=3D1820987, emitted seq=3D1820990
```

I had enabled these options on 2022-06-20 14:14 UTC+2, this is the first cr=
ash
I've encountered since then.

I have no idea how to build the latest kernel and therefore haven't tested =
that
yet.

I'll now revert back to amdgpu.dpm=3D0.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
