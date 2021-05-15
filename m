Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 192DE381A45
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 19:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC2A6E427;
	Sat, 15 May 2021 17:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D478936B
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 17:48:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6D267613D1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621100895;
 bh=Ad3i1XYJiAJGbIHIEQDbxKCrugbN5tBadvAPcYr/iXU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=m0HKljDEv6xjpaasY+e5lYyWiSZOcAnFrIj3gOhNgdIMbgW2JYueTX8DTvMDXxdwt
 K6yk2PiMhG0mRHjyMH2iCY1/OjQ76p/KZCApOBvVafk06BF+hK9QfC7pK3Z52M8YZc
 4Ymfi/ZM3qMKRPF0UTA0boDPzwNGMDqzhdkledRUhOmsYxgTzPMtq0n84NykgPZzvC
 Y7xVD/UiMk/H2nsOY34WJR+DXXCKdV53yNgPyjm1j2Yf8Lzyy204KYXiN+EFBCXmEh
 PLrs9YP7Nvg6jRcmbzAePKSX9xFPkaAhBOwhiqNKYg2IplC169VXMsTpS8JRDzO2nT
 2KJgLmp8psD7g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 61C13610A4; Sat, 15 May 2021 17:48:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Sat, 15 May 2021 17:48:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: marius.andreiana@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209457-2300-MIHamsNRNT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209457

Marius (marius.andreiana@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |marius.andreiana@gmail.com

--- Comment #22 from Marius (marius.andreiana@gmail.com) ---
With 5.12.3, monitor remains blank after resume.
Relevant log:

```
May 15 20:21:37 fedora kernel: amdgpu 0000:04:00.0: amdgpu: failed to write=
 reg
28b4 wait reg 28c6
May 15 20:21:37 fedora kernel: amdgpu 0000:04:00.0: amdgpu: failed to write=
 reg
1a6f4 wait reg 1a706
May 15 20:21:37 fedora kernel: amdgpu 0000:04:00.0: amdgpu: SMU is resuming=
...
May 15 20:21:37 fedora kernel: amdgpu 0000:04:00.0: amdgpu: dpm has been
disabled
May 15 20:21:37 fedora kernel: amdgpu 0000:04:00.0: amdgpu: SMU is resumed
successfully!
May 15 20:21:37 fedora kernel: amdgpu 0000:04:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring sdma0 test failed (-110)
May 15 20:21:37 fedora kernel: [drm:amdgpu_device_ip_resume_phase2 [amdgpu]]
*ERROR* resume of IP block <sdma_v4_0> failed -110
May 15 20:21:37 fedora kernel: amdgpu 0000:04:00.0: amdgpu:
amdgpu_device_ip_resume failed (-110).
May 15 20:21:37 fedora kernel: amdgpu 0000:04:00.0: PM: failed to resume as=
ync:
error -110
May 15 20:21:37 fedora kernel: amdgpu 0000:04:00.0: amdgpu: couldn't schedu=
le
ib on ring <sdma0>
May 15 20:21:37 fedora kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
scheduling IBs (-22)
May 15 20:21:37 fedora kernel: amdgpu 0000:04:00.0: amdgpu: couldn't schedu=
le
ib on ring <sdma0>
May 15 20:21:37 fedora kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
scheduling IBs (-22)
May 15 20:21:47 fedora kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* r=
ing
gfx timeout, signaled seq=3D139973, emitted seq=3D139977
May 15 20:21:47 fedora kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process gnome-shell pid 1895 thread gnome-shel:cs0 pid
1926
May 15 20:21:47 fedora kernel: amdgpu 0000:04:00.0: amdgpu: GPU reset begin!
May 15 20:21:47 fedora kernel: amdgpu 0000:04:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed
(-110)
May 15 20:21:47 fedora kernel: amdgpu 0000:04:00.0: amdgpu: MODE2 reset
May 15 20:21:47 fedora kernel: amdgpu 0000:04:00.0: amdgpu: GPU reset
succeeded, trying to resume
May 15 20:21:48 fedora kernel: amdgpu 0000:04:00.0: amdgpu: RAS: optional r=
as
ta ucode is not available
May 15 20:21:48 fedora kernel: amdgpu 0000:04:00.0: amdgpu: RAP: optional r=
ap
ta ucode is not available
May 15 20:21:48 fedora kernel: amdgpu 0000:04:00.0: amdgpu: SECUREDISPLAY:
securedisplay ta ucode is not available
May 15 20:21:48 fedora kernel: amdgpu 0000:04:00.0: amdgpu: SMU is resuming=
...
May 15 20:21:48 fedora kernel: amdgpu 0000:04:00.0: amdgpu: dpm has been
disabled
May 15 20:21:48 fedora kernel: amdgpu 0000:04:00.0: amdgpu: SMU is resumed
successfully!
May 15 20:21:48 fedora kernel: amdgpu 0000:04:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring sdma0 test failed (-110)
May 15 20:21:48 fedora kernel: [drm:amdgpu_device_ip_resume_phase2 [amdgpu]]
*ERROR* resume of IP block <sdma_v4_0> failed -110
May 15 20:21:48 fedora kernel: amdgpu 0000:04:00.0: amdgpu: GPU reset(2) fa=
iled
May 15 20:21:48 fedora kernel: amdgpu 0000:04:00.0: amdgpu: GPU reset end w=
ith
ret =3D -110
May 15 20:21:58 fedora kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* r=
ing
gfx timeout, but soft recovered
May 15 20:22:08 fedora kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* r=
ing
gfx timeout, but soft recovered
May 15 20:22:12 fedora kernel: amdgpu 0000:04:00.0: amdgpu: couldn't schedu=
le
ib on ring <sdma0>
May 15 20:22:12 fedora kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
scheduling IBs (-22)
May 15 20:22:12 fedora kernel: amdgpu 0000:04:00.0: amdgpu: couldn't schedu=
le
ib on ring <sdma0>
```

AMD Ryzen 7 4700U with Radeon Graphics, Lenovo Ideapad 5.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
