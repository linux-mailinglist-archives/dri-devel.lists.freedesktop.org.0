Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21C1AB201A
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 00:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEE010E05C;
	Fri,  9 May 2025 22:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uko+6BW6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6FA10E04D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 22:50:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 846204AA2B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 22:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67B9AC4CEF0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 22:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746831001;
 bh=rN98vIBQotWZzRixssxIxOxDaeltW7p64VjFfV8YjWA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uko+6BW68m8sfXWJ+5ejAR/KppN41K7lctMA8/q3Ig92nqNaAMhOam7VmzwNMrdnP
 TJuaOuqsJBIGVkosV/qPebhCzdC6GImWILfgHrnCNuDcXo5yi1oFuhxyQIOYWP7dbd
 BSVfnXXaOezVWUiPYNUsvaQrgH0Rmj0IcmEpLUQqiMQe3PhG6ZQujSvFb+A7w5snFO
 whlNwfynxzx4SoVlbpKCkcfPOKMGVI8SjReOqECDcRriIGPPympAy2lIFPvLYj8BET
 0gPJHSXGFdmCtXSW07Dkm6uflrj6cpDZ3r8P7/igjyLzY1ORznuhkwtFJvJcgs0vRC
 eBa7xR+8opOsg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 62FD3C53BC5; Fri,  9 May 2025 22:50:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Fri, 09 May 2025 22:50:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: konoha02@yahoo.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-sKeaztdJx9@https.bugzilla.kernel.org/>
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

Nelson G (konoha02@yahoo.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |konoha02@yahoo.com

--- Comment #63 from Nelson G (konoha02@yahoo.com) ---
6.1.135 (debian 12), ryzen 3500u, xfce4 (xfwm4 with vblank=3Dxpresent)
was using libreoffice and atril both tiled to each side of the screen,  i w=
as
scrolling through the pdf then this happened (first time ever it happens im=
e):

may 09 19:14:12 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
timeout, signaled seq=3D2363974, emitted seq=3D2363976
may 09 19:14:12 kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process Xorg pid 1891 thread Xorg:cs0 pid 1936
may 09 19:14:12 kernel: amdgpu 0000:04:00.0: amdgpu: GPU reset begin!
may 09 19:14:12 kernel: amdgpu 0000:04:00.0: amdgpu: free PSP TMR buffer
may 09 19:14:12 kernel: amdgpu 0000:04:00.0: amdgpu: MODE2 reset
may 09 19:14:12 kernel: amdgpu 0000:04:00.0: amdgpu: GPU reset succeeded,
trying to resume
may 09 19:14:12 kernel: [drm] PCIE GART of 1024M enabled.
may 09 19:14:12 kernel: [drm] PTB located at 0x000000F400A00000
may 09 19:14:12 kernel: [drm] VRAM is lost due to GPU reset!
may 09 19:14:12 kernel: [drm] PSP is resuming...
may 09 19:14:12 kernel: [drm] reserve 0x400000 from 0xf47fc00000 for PSP TMR
may 09 19:14:12 kernel: amdgpu 0000:04:00.0: amdgpu: RAS: optional ras ta u=
code
is not available
may 09 19:14:12 kernel: amdgpu 0000:04:00.0: amdgpu: RAP: optional rap ta u=
code
is not available
may 09 19:14:13 kernel: [drm] kiq ring mec 2 pipe 1 q 0
may 09 19:14:13 kernel: [drm] VCN decode and encode initialized
successfully(under SPG Mode).
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: ring gfx uses VM inv e=
ng 0
on hub 0
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.0.0 uses VM
inv eng 1 on hub 0
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.1.0 uses VM
inv eng 4 on hub 0
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.2.0 uses VM
inv eng 5 on hub 0
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.3.0 uses VM
inv eng 6 on hub 0
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.0.1 uses VM
inv eng 7 on hub 0
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.1.1 uses VM
inv eng 8 on hub 0
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.2.1 uses VM
inv eng 9 on hub 0
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: ring comp_1.3.1 uses VM
inv eng 10 on hub 0
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: ring kiq_2.1.0 uses VM=
 inv
eng 11 on hub 0
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: ring sdma0 uses VM inv=
 eng
0 on hub 1
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: ring vcn_dec uses VM i=
nv
eng 1 on hub 1
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: ring vcn_enc0 uses VM =
inv
eng 4 on hub 1
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: ring vcn_enc1 uses VM =
inv
eng 5 on hub 1
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: ring jpeg_dec uses VM =
inv
eng 6 on hub 1
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: recover vram bo from
shadow start
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: recover vram bo from
shadow done
may 09 19:14:13 kernel: amdgpu 0000:04:00.0: amdgpu: GPU reset(2) succeeded!
may 09 19:14:13 kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
initialize parser -125!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
