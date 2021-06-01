Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6B5397B25
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 22:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82ED86EB0F;
	Tue,  1 Jun 2021 20:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3AA6EB0B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 20:21:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 14D0261402
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 20:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622578877;
 bh=VJwiRmjaeLfMWRGW0J4UGXm4t9PAXDbfQg1jvVpcvUc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mD3epFV/YKsr5AfxGu9XzlWGJsO9TLO1KByDlRcdy2AvHFlT+Xtyzthu5CjAOnMaX
 yOxn8jMB9+jtdWU0iNEQ3G4LIB84GoihXae/wRQV7vHan9Q4C7vuFucAEvajtnaUXy
 AdWnrJtlAmuCOhBooWaMu96Zrs35ixAkLmdahcy16cJbLgtTeRSeEMYCVxjDJ1kQy8
 7Xx2fRIqRP4rpE7fExxNecj63XGc+Q8/KO+BVYtmLEMIZpC5Wm2I4wtrbzTq4lubrv
 iXv+rzLwaeP82cUN3APBDst+5z74Itdho5YGNqS5/UzPS3yB0/ksf7Er/mv4k8cV5e
 DqnHLCRn+dELw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1219360F56; Tue,  1 Jun 2021 20:21:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Tue, 01 Jun 2021 20:21:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209457-2300-eIW4IQgj6X@https.bugzilla.kernel.org/>
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

--- Comment #24 from Leandro Jacques (lsrzj@yahoo.com) ---
I forgot to mention the kernel version I was using when it crashed. It was
5.10.x

(In reply to Leandro Jacques from comment #23)
> I'm facing exactly the same issue with a Ryzen 7 Vega 10 Graphics integra=
ted
> GPU. I'll put my kernel log below, it began to happen after kernel 5.4, I
> had to downgrade my kernel to 5.4-lts from AUR and it's already 3 days
> without any GPU reset event.=20
>=20
> Kernel crash log in amdgpu driver:
>=20
> mai 26 16:39:14 S145 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* r=
ing
> sdma0 timeout, signaled seq=3D26777, emitted seq=3D26778
> mai 26 16:39:14 S145 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
> Process information: process  pid 0 thread  pid 0
> mai 26 16:39:14 S145 kernel: amdgpu 0000:03:00.0: amdgpu: GPU reset begin!
> mai 26 16:39:14 S145 kernel: amdgpu 0000:03:00.0: amdgpu: MODE2 reset
> mai 26 16:39:14 S145 kernel: amdgpu 0000:03:00.0: amdgpu: GPU reset
> succeeded, trying to resume
> mai 26 16:39:14 S145 kernel: amdgpu 0000:03:00.0: amdgpu: RAS: optional r=
as
> ta ucode is not available
> mai 26 16:39:14 S145 kernel: amdgpu 0000:03:00.0: amdgpu: RAP: optional r=
ap
> ta ucode is not available
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: ring gfx uses VM
> inv eng 0 on hub 0
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.0
> uses VM inv eng 1 on hub 0
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.0
> uses VM inv eng 4 on hub 0
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.0
> uses VM inv eng 5 on hub 0
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.0
> uses VM inv eng 6 on hub 0
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.1
> uses VM inv eng 7 on hub 0
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.1
> uses VM inv eng 8 on hub 0
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.1
> uses VM inv eng 9 on hub 0
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.1
> uses VM inv eng 10 on hub 0
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: ring kiq_2.1.0
> uses VM inv eng 11 on hub 0
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: ring sdma0 uses=
 VM
> inv eng 0 on hub 1
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: ring vcn_dec us=
es
> VM inv eng 1 on hub 1
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: ring vcn_enc0 u=
ses
> VM inv eng 4 on hub 1
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: ring vcn_enc1 u=
ses
> VM inv eng 5 on hub 1
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec u=
ses
> VM inv eng 6 on hub 1
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: recover vram bo
> from shadow start
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: recover vram bo
> from shadow done
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: amdgpu: GPU reset(1)
> succeeded!
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b480b00 flags=3D0x0070]
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b480b40 flags=3D0x0070]
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b480b20 flags=3D0x0070]
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b480b60 flags=3D0x0070]
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b480b80 flags=3D0x0070]
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b480bc0 flags=3D0x0070]
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b480ba0 flags=3D0x0070]
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b480c00 flags=3D0x0070]
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b480be0 flags=3D0x0070]
> mai 26 16:39:15 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b480c40 flags=3D0x0070]
> mai 26 16:39:25 S145 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* r=
ing
> gfx timeout, but soft recovered
> mai 26 16:39:35 S145 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* r=
ing
> gfx timeout, signaled seq=3D2117313, emitted seq=3D2117316
> mai 26 16:39:35 S145 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
> Process information: process plasmashell pid 1137 thread plasmashel:cs0 p=
id
> 1234
> mai 26 16:39:35 S145 kernel: amdgpu 0000:03:00.0: amdgpu: GPU reset begin!
> mai 26 16:39:35 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b485b40 flags=3D0x0070]
> mai 26 16:39:35 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b485b60 flags=3D0x0070]
> mai 26 16:39:35 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b485b80 flags=3D0x0070]
> mai 26 16:39:35 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b485ba0 flags=3D0x0070]
> mai 26 16:39:35 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b485bc0 flags=3D0x0070]
> mai 26 16:39:35 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b485be0 flags=3D0x0070]
> mai 26 16:39:35 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b485c20 flags=3D0x0070]
> mai 26 16:39:35 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b485c00 flags=3D0x0070]
> mai 26 16:39:35 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b485c40 flags=3D0x0070]
> mai 26 16:39:35 S145 kernel: amdgpu 0000:03:00.0: AMD-Vi: Event logged
> [IO_PAGE_FAULT domain=3D0x0000 address=3D0x10b485c60 flags=3D0x0070]
> mai 26 16:39:36 S145 kernel: amdgpu 0000:03:00.0: amdgpu: MODE2 reset
> mai 26 16:39:36 S145 kernel: amdgpu 0000:03:00.0: amdgpu: GPU reset
> succeeded, trying to resume
> mai 26 16:39:36 S145 kernel: amdgpu 0000:03:00.0: amdgpu: RAS: optional r=
as
> ta ucode is not available
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: RAP: optional r=
ap
> ta ucode is not available
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0:
> [drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring sdma0 test failed (-1=
10)
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_device_ip_resume_phase2 [amdgpu]]
> *ERROR* resume of IP block <sdma_v4_0> failed -110
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: GPU reset(4) fa=
iled
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: GPU reset end w=
ith
> ret =3D -110
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:37 S145 kernel: amdgpu 0000:03:00.0: amdgpu: couldn't schedu=
le
> ib on ring <sdma0>
> mai 26 16:39:37 S145 kernel: [drm:amdgpu_job_run [amdgpu]] *ERROR* Error
> scheduling IBs (-22)
> mai 26 16:39:47 S145 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* r=
ing
> gfx timeout, but soft recovered

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
