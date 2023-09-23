Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510277ABD3A
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 03:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C98310E097;
	Sat, 23 Sep 2023 01:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C2C10E097
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 01:52:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8D426623DA
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 01:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDC24C433CD
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 01:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695433970;
 bh=EB0znOIva9sorLYQCtA5RfxVkuWHCBa+E2hqw1tpmVw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fnf98JTlenPlxMu02ERWToFtsZyRv/0Bc+jgcpt1nFzlqxLEbCy2PS3R/+cuVCfQ4
 iWEf/ghoAsKErs07V7ukkBEuDnRIGskzISGainh2fj3nFIOiV9pC9Vqjw2FSuAhnDv
 RgGvnGteIKgUg2eq/tfb2K/yL/23TlyfCoFjDiP+q9O4V+NljEiXMlSgItoqUtWTUM
 MekQ27XQHADN33PuynZLUjIJ76jz7WpwVteaxusiI+Xi4YLBsmU3di2f/sllYbDZA4
 wJo6Q6AgbHls79yNFvJrd1QJfghoqLUKClKIiqmjqm+evsRpFV/smdJEEKhiax/tKM
 uVkOtMBtVS/Dg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BE608C4332E; Sat, 23 Sep 2023 01:52:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Sat, 23 Sep 2023 01:52:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: kcohar@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-ngvlWI7Q4R@https.bugzilla.kernel.org/>
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

KC (kcohar@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kcohar@gmail.com

--- Comment #91 from KC (kcohar@gmail.com) ---
I can confirm this bug

Experiencing it on an AMD Ryzen 5 3500U (Vega 8), Fedora 39 beta, kernel 6.=
5.2.
Also on Arch (kernel 6.5.2).
No problems on Fedora 38 (kernel 6.2.x).

In my case it happens frequently with normal desktop use on Fedora and Arch.

Sep 23 03:39:34 jackdaw kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
gfx_low timeout, signaled seq=3D10067, emitted seq=3D10069
Sep 23 03:39:34 jackdaw kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process nautilus pid 5981 thread nautilus:cs0 pid 6173
Sep 23 03:39:34 jackdaw kernel: amdgpu 0000:05:00.0: amdgpu: GPU reset begi=
n!
Sep 23 03:39:34 jackdaw kernel: amdgpu 0000:05:00.0: amdgpu: MODE2 reset
Sep 23 03:39:34 jackdaw kernel: amdgpu 0000:05:00.0: amdgpu: GPU reset
succeeded, trying to resume
Sep 23 03:39:34 jackdaw kernel: [drm] PCIE GART of 1024M enabled.
Sep 23 03:39:34 jackdaw kernel: [drm] PTB located at 0x000000F400A00000
Sep 23 03:39:34 jackdaw kernel: [drm] PSP is resuming...
Sep 23 03:39:34 jackdaw kernel: [drm] reserve 0x400000 from 0xf47fc00000 for
PSP TMR
Sep 23 03:39:34 jackdaw kernel: amdgpu 0000:05:00.0: amdgpu: RAS: optional =
ras
ta ucode is not available
Sep 23 03:39:34 jackdaw kernel: amdgpu 0000:05:00.0: amdgpu: RAP: optional =
rap
ta ucode is not available
Sep 23 03:39:34 jackdaw kernel: [drm] kiq ring mec 2 pipe 1 q 0
Sep 23 03:39:35 jackdaw kernel: amdgpu 0000:05:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring gfx test failed (-110)
Sep 23 03:39:35 jackdaw kernel: [drm:amdgpu_device_ip_resume_phase2 [amdgpu=
]]
*ERROR* resume of IP block <gfx_v9_0> failed -110
Sep 23 03:39:35 jackdaw kernel: amdgpu 0000:05:00.0: amdgpu: GPU reset(2)
failed
Sep 23 03:39:35 jackdaw kernel: amdgpu 0000:05:00.0: amdgpu: GPU reset end =
with
ret =3D -110
Sep 23 03:39:35 jackdaw kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
GPU
Recovery Failed: -110
Sep 23 03:39:35 jackdaw kernel: [drm] Skip scheduling IBs!
Sep 23 03:39:45 jackdaw kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* =
ring
gfx_high timeout, signaled seq=3D9114, emitted seq=3D9116
Sep 23 03:39:45 jackdaw kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process gnome-shell pid 2206 thread gnome-shel:cs0 pid
2258
Sep 23 03:39:45 jackdaw kernel: amdgpu 0000:05:00.0: amdgpu: GPU reset begi=
n!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
