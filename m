Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2FD41E371
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 23:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24E06EC91;
	Thu, 30 Sep 2021 21:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6076EC91
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 21:36:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1996F613A0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633037819;
 bh=eI4tdoheR3+X3TsgTn2d8QEk6fhypLGxydnazFxdCck=;
 h=From:To:Subject:Date:From;
 b=u9z0s0TR9x7Cz3cFMhd2e1a5LInottW2c4bEsT1gN9MAdbN712J6+H3unRlgRk9lm
 pNwasmP6x4QHfFy9myZ9/VP9R3l66FFQR/sXIaZQkU2438OfIyBiO5ofOdSigvMpIA
 N4O+U5GVG6sC5fDT5P/TAr+7sPB0ijimIp2fqWHAP+cA58fpKWlGRC7/35Nih769+A
 zLGOwtNSW/ZiHOVuvSC7v/UDTw5yXPwyuwL+jX9OLT05udTkeDwA4lLdEZ6TGPcVvC
 Yo9JNS+1v0iNWkhYTXeQkhcWPRMnVGVwlI/tYqscou6um8djMUmLZKGjMpFRN0CkZh
 4/xxdnR9MZoVw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0F8F160C4C; Thu, 30 Sep 2021 21:36:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214587] New: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
 gfx timeout, signaled seq=5900910, emitted seq=5900912
Date: Thu, 30 Sep 2021 21:36:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214587-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214587

            Bug ID: 214587
           Summary: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
                    timeout, signaled seq=3D5900910, emitted seq=3D5900912
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14.7-arch1-1
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: samy@lahfa.xyz
        Regression: No

Hi,

I've just recently hit this issue on ArchLinux kernel 5.14.7-arch1-1,
linux-firmware 20210919.d526e04-1 with a Thinkpad T495 AMD Ryzen 7 3700U al=
ong
a Vega Radeon RX 10 while using hashcat to brute-force hashes, hashcat was
using OpenCL in order to use the GPU and then the computer just froze, and a
GPU reset happened see the following logs.

Logs from dmesg:
[87507.678904] [drm] Fence fallback timer expired on ring gfx
[87512.691933] [drm] Fence fallback timer expired on ring gfx
[87517.572033] [drm] Fence fallback timer expired on ring gfx
[87523.012214] [drm] Fence fallback timer expired on ring gfx
[87533.129069] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D5900910, emitted seq=3D5900912
[87533.129518] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process Xorg pid 2937 thread Xorg:cs0 pid 3143
[87533.129957] amdgpu 0000:06:00.0: amdgpu: GPU reset begin!
[87533.138994] amdgpu 0000:06:00.0: amdgpu: Guilty job already signaled,
skipping HW reset
[87533.139056] amdgpu 0000:06:00.0: amdgpu: GPU reset(2) succeeded!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
