Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 698356650FE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 02:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C95810E6B3;
	Wed, 11 Jan 2023 01:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC61010E6B3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 01:13:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2DD27619EF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 01:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C50DC4339C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 01:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673399592;
 bh=JLL4hapOcayfu3bA/kmqj4feOJq0OmwjUFMx6U80yRM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PE2KaMMAJJO4U5TiaMjKAM2myNOsyMrISNjljAhsruNrcWC60tun0iHNqylCXdrLE
 Ip/wNsPj2N7AauoivM6b9dYtwCPqQtvKFYY8oH3eX1BkgQDnPbUhswKYepMYl9mDAN
 tKmiS3qYhyYpLy1rTanlixNJlORdL4X/4d9eo7C37TBFt4cxlxJW8IjWZHpg+B9ArI
 +WxSKIOIJm30Ku4nq3U0YoTii4ktt68JySzuHTxfIzZtOUFvj4Le7OWZbbVYFFqj8R
 +oigrA8fyQxFmdFoq9cmrw9xyPGV4VQ8mg9VT9XtYDxZtTO63EU9xjkcQejnic9kf+
 Vrc4ZuilJbj4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1BC7AC43142; Wed, 11 Jan 2023 01:13:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Wed, 11 Jan 2023 01:13:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: hcarter1112@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-8nnSic3wZ0@https.bugzilla.kernel.org/>
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

Ralldi (hcarter1112@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hcarter1112@gmail.com

--- Comment #85 from Ralldi (hcarter1112@gmail.com) ---
[67760.805903] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D19820784, emitted seq=3D19820786
[67760.806285] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process valheim.x86_64 pid 464107 thread valheim.x8:cs0 pid 464109
[67760.806667] amdgpu 0000:0d:00.0: amdgpu: GPU reset begin!
[67761.257012] amdgpu 0000:0d:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring kiq_2.1.0 test failed (-110)
[67761.257232] [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KGQ disable failed
[67761.307862] [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:80:crtc-=
1]
hw_done or flip_done timed out
[67761.516374] [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* failed to halt cp g=
fx
[67761.542980] [drm] free PSP TMR buffer
[67761.587266] amdgpu 0000:0d:00.0: amdgpu: MODE1 reset
[67761.587269] amdgpu 0000:0d:00.0: amdgpu: GPU mode1 reset
[67761.587329] amdgpu 0000:0d:00.0: amdgpu: GPU smu mode1 reset
[67762.091974] amdgpu 0000:0d:00.0: amdgpu: GPU reset succeeded, trying to
resume
[67762.092156] [drm] PCIE GART of 512M enabled (table at 0x0000008000300000=
).
[67762.092219] [drm] VRAM is lost due to GPU reset!
[67762.092220] [drm] PSP is resuming...
[67762.168492] [drm] reserve 0xa00000 from 0x8001000000 for PSP TMR
[67762.269801] amdgpu 0000:0d:00.0: amdgpu: RAS: optional ras ta ucode is n=
ot
available
[67762.283510] amdgpu 0000:0d:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[67762.283513] amdgpu 0000:0d:00.0: amdgpu: SMU is resuming...
[67762.283516] amdgpu 0000:0d:00.0: amdgpu: smu driver if version =3D 0x000=
0000e,
smu fw if version =3D 0x00000012, smu fw program =3D 0, version =3D 0x00413=
900
(65.57.0)
[67762.283519] amdgpu 0000:0d:00.0: amdgpu: SMU driver if version not match=
ed
[67762.283549] amdgpu 0000:0d:00.0: amdgpu: use vbios provided pptable
[67762.343739] amdgpu 0000:0d:00.0: amdgpu: SMU is resumed successfully!
[67762.345104] [drm] DMUB hardware initialized: version=3D0x02020017
[67762.615558] [drm] kiq ring mec 2 pipe 1 q 0
[67762.618728] [drm] VCN decode and encode initialized successfully(under D=
PG
Mode).
[67762.618910] [drm] JPEG decode initialized successfully.
[67762.618918] amdgpu 0000:0d:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng =
0 on
hub 0
[67762.618921] amdgpu 0000:0d:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng=
 1
on hub 0
[67762.618922] amdgpu 0000:0d:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng=
 4
on hub 0
[67762.618924] amdgpu 0000:0d:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng=
 5
on hub 0
[67762.618925] amdgpu 0000:0d:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng=
 6
on hub 0
[67762.618926] amdgpu 0000:0d:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng=
 7
on hub 0
[67762.618927] amdgpu 0000:0d:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng=
 8
on hub 0
[67762.618929] amdgpu 0000:0d:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng=
 9
on hub 0
[67762.618930] amdgpu 0000:0d:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng=
 10
on hub 0
[67762.618931] amdgpu 0000:0d:00.0: amdgpu: ring kiq_2.1.0 uses VM inv eng =
11
on hub 0
[67762.618933] amdgpu 0000:0d:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on
hub 0
[67762.618934] amdgpu 0000:0d:00.0: amdgpu: ring sdma1 uses VM inv eng 13 on
hub 0
[67762.618936] amdgpu 0000:0d:00.0: amdgpu: ring vcn_dec_0 uses VM inv eng =
0 on
hub 1
[67762.618937] amdgpu 0000:0d:00.0: amdgpu: ring vcn_enc_0.0 uses VM inv en=
g 1
on hub 1
[67762.618938] amdgpu 0000:0d:00.0: amdgpu: ring vcn_enc_0.1 uses VM inv en=
g 4
on hub 1
[67762.618940] amdgpu 0000:0d:00.0: amdgpu: ring jpeg_dec uses VM inv eng 5=
 on
hub 1
[67762.622875] amdgpu 0000:0d:00.0: amdgpu: recover vram bo from shadow sta=
rt
[67762.622989] amdgpu 0000:0d:00.0: amdgpu: recover vram bo from shadow done
[67762.622991] [drm] Skip scheduling IBs!
[67762.622993] [drm] Skip scheduling IBs!
[67762.623004] amdgpu 0000:0d:00.0: amdgpu: GPU reset(2) succeeded!
[67762.623027] [drm] Skip scheduling IBs!
[67762.623044] [drm] Skip scheduling IBs!
[67762.623052] [drm] Skip scheduling IBs!
[67762.623057] [drm] Skip scheduling IBs!
[67762.623058] [drm] Skip scheduling IBs!
[67762.623064] [drm] Skip scheduling IBs!
[67762.623067] [drm] Skip scheduling IBs!
[67762.623069] [drm] Skip scheduling IBs!
[67762.623071] [drm] Skip scheduling IBs!
[67762.623073] [drm] Skip scheduling IBs!
[67762.623076] [drm] Skip scheduling IBs!
[67762.623076] [drm] Skip scheduling IBs!
[67762.623080] [drm] Skip scheduling IBs!
[67762.623082] [drm] Skip scheduling IBs!
[67762.623083] [drm] Skip scheduling IBs!
[67762.623086] [drm] Skip scheduling IBs!
[67762.623086] [drm] Skip scheduling IBs!
[67762.623090] [drm] Skip scheduling IBs!
[67762.623091] [drm] Skip scheduling IBs!
[67762.623093] [drm] Skip scheduling IBs!
[67762.623096] [drm] Skip scheduling IBs!
[67762.623097] [drm] Skip scheduling IBs!
[67762.623100] [drm] Skip scheduling IBs!
[67762.623101] [drm] Skip scheduling IBs!
[67762.623104] [drm] Skip scheduling IBs!
[67762.623107] [drm] Skip scheduling IBs!
[67762.623107] [drm] Skip scheduling IBs!
[67762.623111] [drm] Skip scheduling IBs!
[67762.623112] [drm] Skip scheduling IBs!
[67762.623114] [drm] Skip scheduling IBs!
[67762.623117] [drm] Skip scheduling IBs!
[67762.623117] [drm] Skip scheduling IBs!
[67762.623121] [drm] Skip scheduling IBs!
[67762.623122] [drm] Skip scheduling IBs!
[67762.623124] [drm] Skip scheduling IBs!
[67762.623127] [drm] Skip scheduling IBs!
[67762.623127] [drm] Skip scheduling IBs!
[67762.623130] [drm] Skip scheduling IBs!
[67762.623132] [drm] Skip scheduling IBs!
[67762.623133] [drm] Skip scheduling IBs!
[67762.623136] [drm] Skip scheduling IBs!
[67762.623139] [drm] Skip scheduling IBs!
[67762.623143] [drm] Skip scheduling IBs!
[67762.623144] [drm] Skip scheduling IBs!
[67762.623148] [drm] Skip scheduling IBs!
[67762.623148] [drm] Skip scheduling IBs!
[67762.623152] [drm] Skip scheduling IBs!
[67762.623153] [drm] Skip scheduling IBs!
[67762.623157] [drm] Skip scheduling IBs!
[67762.623158] [drm] Skip scheduling IBs!
[67762.623161] [drm] Skip scheduling IBs!
[67762.623163] [drm] Skip scheduling IBs!
[67762.623166] [drm] Skip scheduling IBs!
[67762.623168] [drm] Skip scheduling IBs!
[67762.623170] [drm] Skip scheduling IBs!
[67762.623173] [drm] Skip scheduling IBs!
[67762.623174] [drm] Skip scheduling IBs!
[67762.623177] [drm] Skip scheduling IBs!
[67762.623178] [drm] Skip scheduling IBs!
[67762.623182] [drm] Skip scheduling IBs!
[67762.623182] [drm] Skip scheduling IBs!
[67762.623187] [drm] Skip scheduling IBs!
[67762.623187] [drm] Skip scheduling IBs!
[67762.623192] [drm] Skip scheduling IBs!
[67762.623192] [drm] Skip scheduling IBs!
[67762.623197] [drm] Skip scheduling IBs!
[67762.623197] [drm] Skip scheduling IBs!
[67762.623202] [drm] Skip scheduling IBs!
[67762.623202] [drm] Skip scheduling IBs!
[67762.623206] [drm] Skip scheduling IBs!
[67762.623207] [drm] Skip scheduling IBs!
[67762.623210] [drm] Skip scheduling IBs!
[67762.623212] [drm] Skip scheduling IBs!
[67762.623214] [drm] Skip scheduling IBs!
[67762.623216] [drm] Skip scheduling IBs!
[67762.623217] [drm] Skip scheduling IBs!
[67762.623221] [drm] Skip scheduling IBs!
[67762.623221] [drm] Skip scheduling IBs!
[67762.623225] [drm] Skip scheduling IBs!
[67762.623226] [drm] Skip scheduling IBs!
[67762.623230] [drm] Skip scheduling IBs!
[67762.623230] [drm] Skip scheduling IBs!
[67762.623233] [drm] Skip scheduling IBs!
[67762.623234] [drm] Skip scheduling IBs!
[67762.623236] [drm] Skip scheduling IBs!
[67762.623239] [drm] Skip scheduling IBs!
[67762.623243] [drm] Skip scheduling IBs!
[67762.623246] [drm] Skip scheduling IBs!
[67762.623250] [drm] Skip scheduling IBs!
[67762.623254] [drm] Skip scheduling IBs!
[67762.623257] [drm] Skip scheduling IBs!
[67762.623260] [drm] Skip scheduling IBs!
[67762.623263] [drm] Skip scheduling IBs!
[67762.623267] [drm] Skip scheduling IBs!
[67762.623270] [drm] Skip scheduling IBs!
[67762.623273] [drm] Skip scheduling IBs!
[67762.623277] [drm] Skip scheduling IBs!
[67762.623280] [drm] Skip scheduling IBs!
[67762.623284] [drm] Skip scheduling IBs!
[67762.623287] [drm] Skip scheduling IBs!
[67762.623290] [drm] Skip scheduling IBs!
[67762.623293] [drm] Skip scheduling IBs!
[67762.623298] [drm] Skip scheduling IBs!
[67762.623301] [drm] Skip scheduling IBs!
[67762.623305] [drm] Skip scheduling IBs!
[67762.623309] [drm] Skip scheduling IBs!
[67762.623312] [drm] Skip scheduling IBs!
[67762.623316] [drm] Skip scheduling IBs!
[67762.623319] [drm] Skip scheduling IBs!
[67762.623321] [drm] Skip scheduling IBs!
[67762.623324] [drm] Skip scheduling IBs!
[67762.623327] [drm] Skip scheduling IBs!
[67762.623331] [drm] Skip scheduling IBs!
[67762.623334] [drm] Skip scheduling IBs!
[67762.623337] [drm] Skip scheduling IBs!
[67762.623340] [drm] Skip scheduling IBs!
[67762.623343] [drm] Skip scheduling IBs!
[67762.623345] [drm] Skip scheduling IBs!
[67762.623349] [drm] Skip scheduling IBs!
[67762.623353] [drm] Skip scheduling IBs!
[67762.623356] [drm] Skip scheduling IBs!
[67762.623359] [drm] Skip scheduling IBs!
[67762.623362] [drm] Skip scheduling IBs!
[67762.623366] [drm] Skip scheduling IBs!
[67762.623369] [drm] Skip scheduling IBs!
[67762.623373] [drm] Skip scheduling IBs!
[67762.623376] [drm] Skip scheduling IBs!
[67762.623379] [drm] Skip scheduling IBs!
[67762.623382] [drm] Skip scheduling IBs!
[67762.623385] [drm] Skip scheduling IBs!
[67762.623388] [drm] Skip scheduling IBs!
[67762.623392] [drm] Skip scheduling IBs!
[67762.623395] [drm] Skip scheduling IBs!
[67762.623398] [drm] Skip scheduling IBs!
[67762.623401] [drm] Skip scheduling IBs!
[67762.623404] [drm] Skip scheduling IBs!
[67762.623407] [drm] Skip scheduling IBs!
[67762.623411] [drm] Skip scheduling IBs!
[67762.623414] [drm] Skip scheduling IBs!
[67762.623417] [drm] Skip scheduling IBs!
[67762.623420] [drm] Skip scheduling IBs!
[67762.623423] [drm] Skip scheduling IBs!
[67762.623426] [drm] Skip scheduling IBs!
[67762.623429] [drm] Skip scheduling IBs!
[67762.623433] [drm] Skip scheduling IBs!
[67762.623437] [drm] Skip scheduling IBs!
[67762.623440] [drm] Skip scheduling IBs!
[67762.623443] [drm] Skip scheduling IBs!
[67762.623446] [drm] Skip scheduling IBs!
[67762.623450] [drm] Skip scheduling IBs!
[67762.623453] [drm] Skip scheduling IBs!
[67762.623456] [drm] Skip scheduling IBs!
[67762.623460] [drm] Skip scheduling IBs!
[67762.623463] [drm] Skip scheduling IBs!
[67762.623466] [drm] Skip scheduling IBs!
[67762.623469] [drm] Skip scheduling IBs!
[67762.623473] [drm] Skip scheduling IBs!
[67762.623476] [drm] Skip scheduling IBs!
[67762.623479] [drm] Skip scheduling IBs!
[67762.623482] [drm] Skip scheduling IBs!
[67762.623485] [drm] Skip scheduling IBs!
[67762.623489] [drm] Skip scheduling IBs!
[67762.623492] [drm] Skip scheduling IBs!
[67762.623495] [drm] Skip scheduling IBs!
[67762.623498] [drm] Skip scheduling IBs!
[67762.623501] [drm] Skip scheduling IBs!
[67762.623505] [drm] Skip scheduling IBs!
[67762.623508] [drm] Skip scheduling IBs!
[67762.623511] [drm] Skip scheduling IBs!
[67762.623515] [drm] Skip scheduling IBs!
[67762.623518] [drm] Skip scheduling IBs!
[67762.623522] [drm] Skip scheduling IBs!
[67762.623525] [drm] Skip scheduling IBs!
[67762.623529] [drm] Skip scheduling IBs!
[67762.623533] [drm] Skip scheduling IBs!
[67762.623537] [drm] Skip scheduling IBs!
[67762.623541] [drm] Skip scheduling IBs!
[67762.623544] [drm] Skip scheduling IBs!
[67762.623546] amdgpu_cs_ioctl: 7 callbacks suppressed
[67762.623548] [drm] Skip scheduling IBs!
[67762.623553] [drm] Skip scheduling IBs!
[67762.623557] [drm] Skip scheduling IBs!
[67762.623560] [drm] Skip scheduling IBs!
[67762.623565] [drm] Skip scheduling IBs!
[67762.623568] [drm] Skip scheduling IBs!
[67762.623572] [drm] Skip scheduling IBs!
[67762.623575] [drm] Skip scheduling IBs!
[67762.623549] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[67762.636312] traps: xss-lock[2346] trap int3 ip:7f86599e4e51 sp:7ffc0f5bd=
c20
error:0 in libglib-2.0.so.0.7200.3[7f86599a8000+91000]
[67762.645640] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize
parser -125!
[67762.862396] qtile[2274]: segfault at 7fa29b6baae0 ip 00007fa29b6baae0 sp
00007fff9d25d758 error 14 in libgobject-2.0.so.0.7200.3[7fa29b70f000+e000]
[67762.862415] Code: Unable to access opcode bytes at RIP 0x7fa29b6baab6.
[67765.682610] rfkill: input handler disabled
[67766.056883] usb 4-2: current rate 16000 is different from the runtime ra=
te
48000
[67766.120888] usb 4-2: current rate 16000 is different from the runtime ra=
te
48000
[67766.184883] usb 4-2: current rate 16000 is different from the runtime ra=
te
48000
[67774.117179] rfkill: input handler enabled
---------------------------------------------------------------------------=
---------------
I am having this same issue. It is with the following hardware and only whi=
le
gaming. When I am doing anything else besides gaming, everything is fine...=
 I
don't game often but it is commonly on overwatch and valheim. in case that
helps.=20
---------------------------------------------------------------------------=
--------------
OS: Nobara Linux 36 (Thirty Six) x86_64=20
Kernel: 6.0.14-201.fsync.fc36.x86_64=20
CPU: AMD Ryzen 5 3600 (12) @ 3.600GHz=20
GPU: AMD 6700 XT
Memory: 5382MiB / 32002MiB=20
MOBO: Asus Prime MA Wifi II

0d:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] N=
avi
22 [Radeon RX 6700/6700 XT/6750 XT / 6800M] (rev c1) (prog-if 00 [VGA
controller])
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Device 0e36
        Flags: bus master, fast devsel, latency 0, IRQ 104, IOMMU group 18
        Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at e0000000 (64-bit, prefetchable) [size=3D2M]
        I/O ports at e000 [size=3D256]
        Memory at fc900000 (32-bit, non-prefetchable) [size=3D1M]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: <access denied>
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
