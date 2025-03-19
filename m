Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757E9A6819D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 01:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AE010E113;
	Wed, 19 Mar 2025 00:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Fa43c89C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03B910E113
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 00:38:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 83DD75C4B01
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 00:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D011CC4CEDD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 00:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742344731;
 bh=iJmDIXywmYNsrp8kdg74c0ZypbUYln+MVWNARsZ/miQ=;
 h=From:To:Subject:Date:From;
 b=Fa43c89Ct0VE2erqQLxbAjKIFAUoWU+tFoxyZw//lZNa1EVwOd1Ksa4PV9T+N5Et+
 /bW0QmBFDns7otCd97gSCVLf+IvOytL0kGHA/f7eulIjxhx01TSN/iIMIQiy5v6p93
 S+LJgYRmYNJUvaH9sfeCZujuGbQzimq3jpV9lXmiM4vlN81vpDQp+Ap4apsQy+/kGF
 Cm4dy8bu3VWWF7/s9Vvg+AqVyjr7Dfq3TKBGDEiPtzc4HyNaAE2HMJnrXoP2gKpc3J
 Z0j0PnavqpdqS483h1OQWBkb7lobYHvfEqYslI1aRz+U7I1h8Eph/u6V0/HZHUc4VQ
 ZkWbNobdwnAzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BC560C41612; Wed, 19 Mar 2025 00:38:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219895] New: amdgpu spamming log [drm] scheduler comp_1.0.1 is
 not ready, skipping and becoming slow
Date: Wed, 19 Mar 2025 00:38:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kontakt@sandberg-consult.dk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219895-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219895

            Bug ID: 219895
           Summary: amdgpu spamming log [drm] scheduler comp_1.0.1 is not
                    ready, skipping and becoming slow
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kontakt@sandberg-consult.dk
        Regression: No

somewhere between 6.9.8 and 6.12.9 (also impacts 6.12.12, 6.12.19) it began
spamming the kernel messages like this:

[267433.487654] [drm] scheduler comp_1.0.5 is not ready, skipping
[267433.487786] [drm] scheduler comp_1.0.1 is not ready, skipping
[267433.487789] [drm] scheduler comp_1.0.5 is not ready, skipping
[267433.487968] [drm] scheduler comp_1.0.1 is not ready, skipping
[267433.487972] [drm] scheduler comp_1.0.5 is not ready, skipping
[267433.488084] [drm] scheduler comp_1.0.1 is not ready, skipping
[267433.488087] [drm] scheduler comp_1.0.5 is not ready, skipping
[267433.497154] [drm] scheduler comp_1.0.1 is not ready, skipping
[267433.497161] [drm] scheduler comp_1.0.5 is not ready, skipping


(and many many more).

sometimes it also spews this:
[267875.110412] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.1 test failed (-110)
[267875.362692] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.2 test failed (-110)
[267875.614312] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.5 test failed (-110)
[267875.735280] [drm] UVD and UVD ENC initialized successfully.
[267875.836243] [drm] VCE initialized successfully.
[267945.115839] [drm] PCIE GART of 256M enabled (table at 0x000000F40030000=
0).
[267945.433091] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.1 test failed (-110)
[267945.685998] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.2 test failed (-110)
[267945.939166] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.5 test failed (-110)
[267946.059710] [drm] UVD and UVD ENC initialized successfully.
[267946.160672] [drm] VCE initialized successfully.
[268008.569244] [drm] PCIE GART of 256M enabled (table at 0x000000F40030000=
0).
[268008.882686] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.1 test failed (-110)
[268009.134521] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.2 test failed (-110)
[268009.387366] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.5 test failed (-110)
[268009.508038] [drm] UVD and UVD ENC initialized successfully.
[268009.609004] [drm] VCE initialized successfully.
[268060.742711] [drm] PCIE GART of 256M enabled (table at 0x000000F40030000=
0).
[268061.059056] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.1 test failed (-110)
[268061.309970] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.2 test failed (-110)
[268061.562294] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.5 test failed (-110)
[268061.682610] [drm] UVD and UVD ENC initialized successfully.
[268061.783565] [drm] VCE initialized successfully.
[268462.577338] [drm] PCIE GART of 256M enabled (table at 0x000000F40030000=
0).
[268462.894749] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.1 test failed (-110)
[268463.148701] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.2 test failed (-110)
[268463.402591] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.5 test failed (-110)
[268463.523318] [drm] UVD and UVD ENC initialized successfully.
[268463.624279] [drm] VCE initialized successfully.
[268546.092832] [drm] PCIE GART of 256M enabled (table at 0x000000F40030000=
0).
[268546.409437] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.1 test failed (-110)
[268546.662004] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.2 test failed (-110)
[268546.912911] amdgpu 0000:07:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring comp_1.0.5 test failed (-110)
[268547.033655] [drm] UVD and UVD ENC initialized successfully.


allthough thats far from all the time.

old installation used linux-firmware-20240909 with kernel 6.9.8, and newer
where it fails tried with linux-firmware-20250109 and linux-firmware-202502=
11
on 6.12.9+6.12.12+6.12.19.

the system has two gpus, one:
07:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Baffin [Radeon RX 550 640SP / RX 560/560X] (rev cf)

which is the offending, and is a 560, and another (in case its relevant,
non-offending):
0a:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] N=
avi
22 [Radeon RX 6700/6700 XT/6750 XT / 6800M/6850M XT] (rev c1)

it seems to mostly be triggered when a monitor powers off, but once thats
happened, it seems to keep spamming quite regularly, sometimes stopping,
sometimes not.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
