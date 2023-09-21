Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CF07AA52A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 00:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B29710E023;
	Thu, 21 Sep 2023 22:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5732010E023
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 22:38:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70AAA62127
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 22:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 432ABC43391
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 22:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695335884;
 bh=f96GvyahMMT8QV5ifpzovkrTHmyGKuq14hgCEJCZx1o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hJgOb6njdrKgmip055t0lxdJ0qinyyfm/fRczYcu0szLiE8GMu3G2HN34JoVCNqUM
 brXAAgXIE3qiuwmOMnZR7ER4Sq5arCbhvZ0AHA3+P/Ub7g6yzI5oT0Hvk5ikiCMA3b
 +Y6dHzUNtOzTuVozrQhLx3rJGTIFwvHp/6U6IOmhJThEsvlODJNwdn5D+q+9fqwoFH
 WxIv2AsTngEpebPF7UL/yZKR9dHDwP6ue7wj9cbBaWrJGezhgTOSS5mQ2baG4JaSY0
 tLJgWGDSN48yH1rriaitbg8iamVj0N4ZsG+27dMk0rfj9O80BlwyYoQPA0QbsgaMxC
 lAlZGpcV6a5Kw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 342F1C53BD0; Thu, 21 Sep 2023 22:38:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Thu, 21 Sep 2023 22:38:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: graham.oconnor@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-DenzN76pLf@https.bugzilla.kernel.org/>
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

G OConnor (graham.oconnor@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |graham.oconnor@gmail.com

--- Comment #90 from G OConnor (graham.oconnor@gmail.com) ---
AMD Ryzen 3700U APU (Vega 10)

This issue has recently started happening, mostly when firing up games or
graphically intensive tasks. One case of lockup during normal desktop use.

Worked fine on 6.4.X series (currently running on 6.4.12). However, all ker=
nels
in the 6.5 series cause the following:

[  112.727138] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_low time=
out,
signaled seq=3D9861, emitted seq=3D9863
[  112.728214] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process Xwayland pid 919 thread Xwayland:cs0 pid 928
[  112.729270] amdgpu 0000:04:00.0: amdgpu: GPU reset begin!
[  112.885652] amdgpu 0000:04:00.0: amdgpu: MODE2 reset
[  112.885709] amdgpu 0000:04:00.0: amdgpu: GPU reset succeeded, trying to
resume
[  112.886024] [drm] PCIE GART of 1024M enabled.
[  112.886027] [drm] PTB located at 0x000000F400A00000
[  112.886143] [drm] PSP is resuming...
[  112.906168] [drm] reserve 0x400000 from 0xf47fc00000 for PSP TMR
[  112.985033] amdgpu 0000:04:00.0: amdgpu: RAS: optional ras ta ucode is n=
ot
available
[  112.992320] amdgpu 0000:04:00.0: amdgpu: RAP: optional rap ta ucode is n=
ot
available
[  113.733685] [drm] kiq ring mec 2 pipe 1 q 0
[  113.998619] amdgpu 0000:04:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring gfx test failed (-110)
[  113.999249] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume=
 of
IP block <gfx_v9_0> failed -110
[  113.999957] amdgpu 0000:04:00.0: amdgpu: GPU reset(2) failed
[  114.000006] amdgpu 0000:04:00.0: amdgpu: GPU reset end with ret =3D -110
[  114.000010] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* GPU Recovery Fail=
ed:
-110

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
