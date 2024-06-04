Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378958FACFF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 10:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3361410E435;
	Tue,  4 Jun 2024 08:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZrVNt91a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E65510E43B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 08:00:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E6C036124D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 08:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9F42C4AF08
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717488029;
 bh=g/aqNUBFwUXMUZ8xWAxIH3pjJbME0+LJnmgWAghkT3A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZrVNt91a3n2or3tBeEh48fxIKO+nZQvJtaz1UQojI+w8Dmn4FZyity7m0Vso3NPaT
 hYCFByCt6qsgzW6FzslalGzLR8kY2VvRtyQyy0PtxoThi7TEk4Yl+pVHuxRCyYYOPT
 mzScJqjuUEkzw3RYH0bz9IgjdgYwbZXKrdSsaMHYiY7Z75On8+8n7UeV0lm5kKhZIF
 3wQ80MbHwO3FBtdkyQPJUGEn9aFNZJx6tyZb7eWxdaVThXDFutROQyQvpxPjbIczxj
 Q6r2tkutbyaYrtzvykHND3Se9AuHbv30sf3Mxbxk/vtb88D3XlDoEIQoLqymj2M37U
 bMojS9P6bHzmw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B27F9C53B73; Tue,  4 Jun 2024 08:00:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Tue, 04 Jun 2024 08:00:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mastercatz@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-FdyreAbJFG@https.bugzilla.kernel.org/>
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

MasterCATZ (mastercatz@hotmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mastercatz@hotmail.com

--- Comment #100 from MasterCATZ (mastercatz@hotmail.com) ---
I am pretty sure I have amdgpu.mcbp=3D0 set=20



and after doing Ubuntu 24.04 LTS , just doing just about anything crashes t=
he
GPU=20

open web browser =3D crash  , then I have to ssh in and restart desktop ses=
sion

GL_VENDOR:     AMD
    GL_RENDERER:   AMD Radeon RX 6800 XT (radeonsi, navi21, LLVM 15.0.7, DRM
3.57, 6.8.0-31-generic)
    GL_VERSION:    4.6 (Compatibility Profile) Mesa
24.2~git2406010600.71d455~oibaf~j (git-71d455b 2024-06-01 jammy-oi

6.8.0-31-generic




[   26.417827] [drm] amdgpu kernel modesetting enabled.
[   26.431708] amdgpu: Virtual CRAT table created for CPU
[   26.431727] amdgpu: Topology: Add CPU node
[   26.431934] [drm] initializing kernel modesetting (SIENNA_CICHLID
0x1002:0x73BF 0x1043:0x04F0 0xC1).
[   26.431949] [drm] register mmio base: 0xFC900000
[   26.431951] [drm] register mmio size: 1048576
[   26.435975] [drm] add ip block number 0 <nv_common>
[   26.435978] [drm] add ip block number 1 <gmc_v10_0>
[   26.435980] [drm] add ip block number 2 <navi10_ih>
[   26.435982] [drm] add ip block number 3 <psp>
[   26.435983] [drm] add ip block number 4 <smu>
[   26.435985] [drm] add ip block number 5 <dm>
[   26.435986] [drm] add ip block number 6 <gfx_v10_0>
[   26.435988] [drm] add ip block number 7 <sdma_v5_2>
[   26.435990] [drm] add ip block number 8 <vcn_v3_0>
[   26.435996] [drm] add ip block number 9 <jpeg_v3_0>
[   26.436013] amdgpu 0000:0e:00.0: No more image in the PCI ROM
[   26.436028] amdgpu 0000:0e:00.0: amdgpu: Fetched VBIOS from ROM BAR
[   26.436031] amdgpu: ATOM BIOS: 115-D412BS0-101
[   26.473962] [drm] VCN(0) decode is enabled in VM mode
[   26.473965] [drm] VCN(1) decode is enabled in VM mode
[   26.473967] [drm] VCN(0) encode is enabled in VM mode
[   26.473968] [drm] VCN(1) encode is enabled in VM mode
[   26.477565] [drm] JPEG decode is enabled in VM mode
[   26.477596] amdgpu 0000:0e:00.0: vgaarb: deactivate vga console
[   26.478479] Console: switching to colour dummy device 80x25
[   26.478490] amdgpu 0000:0e:00.0: amdgpu: Trusted Memory Zone (TMZ) featu=
re
disabled as experimental (default)
[   26.478548] amdgpu 0000:0e:00.0: amdgpu: MEM ECC is not presented.
[   26.478550] amdgpu 0000:0e:00.0: amdgpu: SRAM ECC is not presented.
[   26.478570] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit,
fragment size is 9-bit
[   26.478577] amdgpu 0000:0e:00.0: amdgpu: VRAM: 16368M 0x0000008000000000=
 -
0x00000083FEFFFFFF (16368M used)
[   26.478580] amdgpu 0000:0e:00.0: amdgpu: GART: 512M 0x0000000000000000 -
0x000000001FFFFFFF
[   26.478588] [drm] Detected VRAM RAM=3D16368M, BAR=3D256M
[   26.478589] [drm] RAM width 256bits GDDR6
[   26.478734] [drm] amdgpu: 16368M of VRAM memory ready
[   26.478739] [drm] amdgpu: 64363M of GTT memory ready.
[   26.478768] [drm] GART: num cpu pages 131072, num gpu pages 131072
[   26.478919] [drm] PCIE GART of 512M enabled (table at 0x0000008000900000=
).
[   27.968739] amdgpu 0000:0e:00.0: amdgpu: STB initialized to 2048 entries
[   27.969354] [drm] Loading DMUB firmware via PSP: version=3D0x02020020
[   27.969777] [drm] use_doorbell being set to: [true]
[   27.969791] [drm] use_doorbell being set to: [true]
[   27.969803] [drm] use_doorbell being set to: [true]
[   27.969815] [drm] use_doorbell being set to: [true]
[   27.969830] [drm] Found VCN firmware Version ENC: 1.30 DEC: 3 VEP: 0
Revision: 4
[   27.969842] amdgpu 0000:0e:00.0: amdgpu: Will use PSP to load VCN firmwa=
re
[   28.036225] [drm] reserve 0xa00000 from 0x83fd000000 for PSP TMR
[   28.184762] amdgpu 0000:0e:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[   28.184784] amdgpu 0000:0e:00.0: amdgpu: smu driver if version =3D 0x000=
00040,
smu fw if version =3D 0x00000041, smu fw program =3D 0, version =3D 0x003a5=
900
(58.89.0)
[   28.184788] amdgpu 0000:0e:00.0: amdgpu: SMU driver if version not match=
ed
[   28.184816] amdgpu 0000:0e:00.0: amdgpu: use vbios provided pptable
[   28.257551] amdgpu 0000:0e:00.0: amdgpu: SMU is initialized successfully!
[   28.257835] [drm] Display Core v3.2.266 initialized on DCN 3.0
[   28.257837] [drm] DP-HDMI FRL PCON supported
[   28.259090] [drm] DMUB hardware initialized: version=3D0x02020020
[   28.261811] snd_hda_intel 0000:0e:00.1: bound 0000:0e:00.0 (ops
amdgpu_dm_audio_component_bind_ops [amdgpu])
[   28.390798] [drm] kiq ring mec 2 pipe 1 q 0
[   28.398526] [drm] VCN decode and encode initialized successfully(under D=
PG
Mode).
[   28.398700] [drm] JPEG decode initialized successfully.
[   28.471332] amdgpu: HMM registered 16368MB device memory
[   28.473409] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[   28.473425] kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
[   28.473606] amdgpu: Virtual CRAT table created for GPU
[   28.474183] amdgpu: Topology: Add dGPU node [0x73bf:0x1002]
[   28.474186] kfd kfd: amdgpu: added device 1002:73bf
[   28.474214] amdgpu 0000:0e:00.0: amdgpu: SE 4, SH per SE 2, CU per SH 10,
active_cu_number 72

[   28.474238] amdgpu 0000:0e:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on
hub=20
[   28.475274] amdgpu 0000:0e:00.0: amdgpu: Using BACO for runtime pm
[   28.476312] [drm] Initialized amdgpu 3.57.0 20150101 for 0000:0e:00.0 on
minor 0
[   28.495327] fbcon: amdgpudrmfb (fb0) is primary device





[ 1823.317612] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[ 1823.317622] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x000080010e57a000 from client 0x1b (UTCL2)
[ 1823.317626] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00701031
[ 1823.317628] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: TCP
(0x8)
[ 1823.317631] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x1
[ 1823.317633] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 1823.317635] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[ 1823.317637] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 1823.317639] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[ 1823.317644] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[ 1823.317648] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x000080010e569000 from client 0x1b (UTCL2)
[ 1823.317651] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00701031
[ 1823.317653] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: TCP
(0x8)
[ 1823.317655] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x1
[ 1823.317657] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 1823.317659] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[ 1823.317661] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 1823.317663] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[ 1823.317668] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[ 1823.317672] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x000080010e568000 from client 0x1b (UTCL2)
[ 1823.317674] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00701031
[ 1823.317676] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: TCP
(0x8)
[ 1823.317679] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x1
[ 1823.317681] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 1823.317683] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[ 1823.317685] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 1823.317687] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[ 1823.317692] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[ 1823.317695] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x000080010e578000 from client 0x1b (UTCL2)
[ 1823.317697] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00701031
[ 1823.317700] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: TCP
(0x8)
[ 1823.317702] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x1
[ 1823.317704] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 1823.317706] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[ 1823.317708] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 1823.317710] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[ 1823.317715] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[ 1823.317718] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x000080010e56d000 from client 0x1b (UTCL2)
[ 1823.317721] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[ 1823.317723] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: CB=
/DB
(0x0)
[ 1823.317725] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x0
[ 1823.317727] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 1823.317729] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[ 1823.317731] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 1823.317733] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[ 1823.317738] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[ 1823.317742] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x000080010e57c000 from client 0x1b (UTCL2)
[ 1823.317744] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[ 1823.317746] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: CB=
/DB
(0x0)
[ 1823.317748] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x0
[ 1823.317750] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 1823.317752] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[ 1823.317754] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 1823.317756] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[ 1823.317761] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[ 1823.317765] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x000080010e579000 from client 0x1b (UTCL2)
[ 1823.317767] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[ 1823.317769] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: CB=
/DB
(0x0)
[ 1823.317771] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x0
[ 1823.317773] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 1823.317775] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[ 1823.317777] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 1823.317779] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[ 1823.317784] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[ 1823.317788] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x000080010e56a000 from client 0x1b (UTCL2)
[ 1823.317790] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[ 1823.317792] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: CB=
/DB
(0x0)
[ 1823.317794] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x0
[ 1823.317796] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 1823.317799] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[ 1823.317801] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 1823.317803] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[ 1823.317809] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[ 1823.317812] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x000080010e595000 from client 0x1b (UTCL2)
[ 1823.317814] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[ 1823.317816] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: CB=
/DB
(0x0)

[ 1823.317841] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x0
[ 1823.317843] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 1823.317845] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[ 1823.317847] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 1823.317849] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[ 1833.613761] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, but soft recovered
[ 1946.888252] kauditd_printk_skb: 113 callbacks suppressed
[ 1946.888257] audit: type=3D1326 audit(1717405290.252:120): auid=3D1000 ui=
d=3D1000
gid=3D1000 ses=3D2 pid=3D145934 comm=3D"firefox"
exe=3D"/snap/firefox/1075/usr/lib/firefox/firefox" sig=3D0 arch=3Dc000003e
syscall=3D314 compat=3D0 ip=3D0x74c6a555489d code=3D0x50000


[ 3461.404320] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[ 3461.404337] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x000080011516d000 from client 0x1b (UTCL2)
[ 3461.404344] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00701031
[ 3461.404350] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: TCP
(0x8)
[ 3461.404354] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x1
[ 3461.404359] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 3461.404363] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[ 3461.404368] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 3461.404372] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[ 3461.404381] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)

[41374.040191] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x0000800101561000 from client 0x1b (UTCL2)
[41374.040199] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00701031
[41374.040204] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: TCP
(0x8)
[41374.040208] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x1
[41374.040213] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[41374.040217] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[41374.040220] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[41374.040224] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[41374.040232] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[41374.040239] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x0000800101563000 from client 0x1b (UTCL2)
[41374.040244] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00701031
[41374.040249] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: TCP
(0x8)
[41374.040253] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x1
[41374.040258] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[41374.040262] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[41374.040266] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[41374.040269] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[41374.040277] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[41374.040283] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x0000800101563000 from client 0x1b (UTCL2)
[41374.040288] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00701031
[41374.040292] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: TCP
(0x8)
[41374.040296] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x1
[41374.040300] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[41374.040304] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[41374.040308] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[41374.040311] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[41374.040320] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[41374.040326] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x000080010159d000 from client 0x1b (UTCL2)
[41374.040331] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[41374.040335] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: CB=
/DB
(0x0)
[41374.040339] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x0
[41374.040343] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[41374.040347] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[41374.040351] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[41374.040355] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[41374.040362] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[41374.040368] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x000080010159c000 from client 0x1b (UTCL2)
[41374.040373] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[41374.040378] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: CB=
/DB
(0x0)
[41374.040382] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x0
[41374.040386] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[41374.040390] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[41374.040394] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[41374.040397] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[41374.040405] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[41374.040411] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x000080010159d000 from client 0x1b (UTCL2)
[41374.040416] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[41374.040420] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: CB=
/DB
(0x0)
[41374.040424] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x0
[41374.040427] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[41374.040431] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[41374.040435] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[41374.040440] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[41374.040447] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[41374.040454] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x0000800101565000 from client 0x1b (UTCL2)
[41374.040458] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[41374.040462] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: CB=
/DB
(0x0)
[41374.040466] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x0
[41374.040470] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[41374.040474] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[41374.040478] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[41374.040481] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[41374.040489] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[41374.040495] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x000080010159c000 from client 0x1b (UTCL2)
[41374.040501] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[41374.040505] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: CB=
/DB
(0x0)
[41374.040509] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x0
[41374.040513] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[41374.040517] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[41374.040520] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[41374.040524] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[41374.040531] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[41374.040538] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x000080010159e000 from client 0x1b (UTCL2)
[41374.040542] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[41374.040546] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: CB=
/DB
(0x0)
[41374.040550] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x0
[41374.040554] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[41374.040558] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[41374.040563] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[41374.040567] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[41374.040574] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:7 pasid:32781, for process opera pid 137805 thread opera:cs0 p=
id
137824)
[41374.040580] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x00008001015ce000 from client 0x1b (UTCL2)
[41374.040585] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[41374.040589] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: CB=
/DB
(0x0)
[41374.040593] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x0
[41374.040596] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[41374.040600] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[41374.040604] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[41374.040608] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[41384.250697] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, but soft recovered
[41389.531399] show_signal_msg: 117 callbacks suppressed
[41389.531402] GpuWatchdog[137840]: segfault at 0 ip 000055f397dc977a sp
00007e1c3ddff490 error 6 in opera[55f393dee000+663c000] likely on CPU 8 (co=
re
10, socket 0)
[41389.531415] Code: 3d c9 52 63 fb be 01 00 00 00 ba 07 00 00 00 e8 ec 1f =
b5
fe 48 8d 3d 1f 62 64 fb be 01 00 00 00 ba 03 00 00 00 e8 d6 1f b5 fe <c7> 0=
4 25
00 00 00 00 37 13 00 00 c6 05 e4 3b e3 02 01 80 bd 7f ff
[41394.500673] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, signaled seq=3D22350749, emitted seq=3D22350752
[41394.501241] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[41394.501783] amdgpu 0000:0e:00.0: amdgpu: GPU reset begin!
[41394.831305] amdgpu 0000:0e:00.0: amdgpu: MODE1 reset
[41394.831316] amdgpu 0000:0e:00.0: amdgpu: GPU mode1 reset
[41394.831409] amdgpu 0000:0e:00.0: amdgpu: GPU smu mode1 reset
[41395.338820] amdgpu 0000:0e:00.0: amdgpu: GPU reset succeeded, trying to
resume
[41395.339691] [drm] PCIE GART of 512M enabled (table at 0x0000008000900000=
).
[41395.339815] [drm] VRAM is lost due to GPU reset!
[41395.339818] [drm] PSP is resuming...
[41395.419395] [drm] reserve 0xa00000 from 0x83fd000000 for PSP TMR
[41395.560285] amdgpu 0000:0e:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[41395.560296] amdgpu 0000:0e:00.0: amdgpu: SMU is resuming...
[41395.560303] amdgpu 0000:0e:00.0: amdgpu: smu driver if version =3D 0x000=
00040,
smu fw if version =3D 0x00000041, smu fw program =3D 0, version =3D 0x003a5=
900
(58.89.0)
[41395.560310] amdgpu 0000:0e:00.0: amdgpu: SMU driver if version not match=
ed
[41395.560342] amdgpu 0000:0e:00.0: amdgpu: use vbios provided pptable
[41395.637776] amdgpu 0000:0e:00.0: amdgpu: SMU is resumed successfully!
[41395.639052] [drm] DMUB hardware initialized: version=3D0x02020020
[41395.988694] [drm] kiq ring mec 2 pipe 1 q 0
[41395.995849] [drm] VCN decode and encode initialized successfully(under D=
PG
Mode).
[41395.996030] [drm] JPEG decode initialized successfully.
[41395.996047] amdgpu 0000:0e:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng =
0 on
hub 0
[41395.996053] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng=
 1
on hub 0
[41395.996057] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng=
 4
on hub 0
[41395.996060] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng=
 5
on hub 0
[41395.996064] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng=
 6
on hub 0
[41395.996067] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng=
 7
on hub 0
[41395.996071] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng=
 8
on hub 0
[41395.996075] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng=
 9
on hub 0
[41395.996079] amdgpu 0000:0e:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng=
 10
on hub 0
[41395.996083] amdgpu 0000:0e:00.0: amdgpu: ring kiq_0.2.1.0 uses VM inv en=
g 11
on hub 0
[41395.996087] amdgpu 0000:0e:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on
hub 0
[41395.996090] amdgpu 0000:0e:00.0: amdgpu: ring sdma1 uses VM inv eng 13 on
hub 0
[41395.996094] amdgpu 0000:0e:00.0: amdgpu: ring sdma2 uses VM inv eng 14 on
hub 0
[41395.996097] amdgpu 0000:0e:00.0: amdgpu: ring sdma3 uses VM inv eng 15 on
hub 0
[41395.996101] amdgpu 0000:0e:00.0: amdgpu: ring vcn_dec_0 uses VM inv eng =
0 on
hub 8
[41395.996104] amdgpu 0000:0e:00.0: amdgpu: ring vcn_enc_0.0 uses VM inv en=
g 1
on hub 8
[41395.996108] amdgpu 0000:0e:00.0: amdgpu: ring vcn_enc_0.1 uses VM inv en=
g 4
on hub 8
[41395.996111] amdgpu 0000:0e:00.0: amdgpu: ring vcn_dec_1 uses VM inv eng =
5 on
hub 8
[41395.996114] amdgpu 0000:0e:00.0: amdgpu: ring vcn_enc_1.0 uses VM inv en=
g 6
on hub 8
[41395.996118] amdgpu 0000:0e:00.0: amdgpu: ring vcn_enc_1.1 uses VM inv en=
g 7
on hub 8
[41395.996121] amdgpu 0000:0e:00.0: amdgpu: ring jpeg_dec uses VM inv eng 8=
 on
hub 8
[41396.004859] amdgpu 0000:0e:00.0: amdgpu: recover vram bo from shadow sta=
rt
[41396.040181] amdgpu 0000:0e:00.0: amdgpu: recover vram bo from shadow done
[41396.040221] [drm] Skip scheduling IBs!
[41396.040225] amdgpu 0000:0e:00.0: amdgpu: GPU reset(6) succeeded!

[41396.040387] [drm] Skip scheduling IBs!
...
[41396.043200] [drm] Skip scheduling IBs!
[42183.025204] amdgpu 0000:0e:00.0: amdgpu: [gfxhub] page fault (src_id:0
ring:24 vmid:4 pasid:32775, for process opera pid 2915753 thread opera:cs0 =
pid
2915831)
[42183.025217] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address=20


ring:24 vmid:6 pasid:32775, for process opera pid 2968669 thread opera:cs0 =
pid
2968686)
[81468.642520] amdgpu 0000:0e:00.0: amdgpu:   in page starting at address
0x0000800125f90000 from client 0x1b (UTCL2)
[81468.642525] amdgpu 0000:0e:00.0: amdgpu:
GCVM_L2_PROTECTION_FAULT_STATUS:0x00000000
[81468.642528] amdgpu 0000:0e:00.0: amdgpu:      Faulty UTCL2 client ID: CB=
/DB
(0x0)
[81468.642532] amdgpu 0000:0e:00.0: amdgpu:      MORE_FAULTS: 0x0
[81468.642536] amdgpu 0000:0e:00.0: amdgpu:      WALKER_ERROR: 0x0
[81468.642540] amdgpu 0000:0e:00.0: amdgpu:      PERMISSION_FAULTS: 0x0
[81468.642544] amdgpu 0000:0e:00.0: amdgpu:      MAPPING_ERROR: 0x0
[81468.642547] amdgpu 0000:0e:00.0: amdgpu:      RW: 0x0
[81479.122186] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx_0.0.0
timeout, but soft recovered
[81759.945649] kauditd_printk_skb: 61 callbacks suppressed
[81759.945654] audit: type=3D1326 audit(1717485104.012:384): auid=3D1000 ui=
d=3D1000
gid=3D1000 ses=3D2 pid=3D830708 comm=3D"firefox"
exe=3D"/snap/firefox/1075/usr/lib/firefox/firefox" sig=3D0 arch=3Dc000003e
syscall=3D314 compat=3D0 ip=3D0x79433d64289d code=3D0x50000

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
