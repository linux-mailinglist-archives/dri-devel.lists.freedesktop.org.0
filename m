Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8CC9BCA71
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 11:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991C110E426;
	Tue,  5 Nov 2024 10:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QAgJMEcG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545BF10E426
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:28:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6159BA42D81
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18B81C4CECF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730802504;
 bh=2TOMjaOPcCZNpkMYThZTbMqsPu3uSUnadImT+0bSw3k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QAgJMEcGySCzGaNpDYGLATZ56iZyWyYvhp5gRKXCZdAB1tuBc2ioQCjCJD6GM+zmr
 sRJTMIAMayYQ1Fl96fU3p8ZkTYscP6m0azDChF7Fo2cycGzrfwVtfJJtxXRWgtjLu/
 ksa3cI/cg7hQN+RHzstazeWEOgW0R9T5LnFLH71NSnFrFCrxz18omAva7mzgXo97hW
 VgjsYZFlv0Tp/SqebugQ9KbhnqCQtqBymzfmstPaQFuLtt36Qw29f7MIVay9sj+fMy
 RpC9uPnoc+40mL7/oiUtwhZTXYvm2gBtxnti/d8C+JcnD75EHEZosV0+f/B17P1QBA
 SgJI6isKpbpOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0E693C53BC5; Tue,  5 Nov 2024 10:28:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219468] Screen flickering on Radeon 680M - 6.12
Date: Tue, 05 Nov 2024 10:28:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: leejm516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219468-2300-C8VdAfAAXy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219468-2300@https.bugzilla.kernel.org/>
References: <bug-219468-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219468

--- Comment #3 from Joungmin Lee (leejm516@gmail.com) ---
System info from inxi=20

----

System:
  Host: leej-zenbook Kernel: 6.12.0-rc6-1-llvm-241014 arch: x86_64 bits: 64
    compiler: clang v: 19.1.3 clocksource: tsc avail: acpi_pm
    parameters: BOOT_IMAGE=3D/root/boot/vmlinuz-linux-6.12.0-rc6-1-llvm-241=
014
    root=3DUUID=3Dff2c684d-f559-4a51-9ae2-b27098fadb5f rw rootflags=3Dsubvo=
l=3Droot
    loglevel=3D3 quiet splash
  Desktop: KDE Plasma v: 6.2.2 tk: Qt v: N/A wm: kwin_wayland dm: SDDM
    Distro: Arch Linux
Machine:
  Type: Laptop System: ASUSTeK product: Zenbook 15 UM3504DA_UM3504DA v: 1.0
    serial: RBN0CX03S725478
  Mobo: ASUSTeK model: UM3504DA v: 1.0 serial: RB46NBCX002FT6MB
    uuid: dda31f15-6388-bd4b-b4ea-cc1e6f3dd3e9 UEFI: American Megatrends LL=
C.
    v: UM3504DA.312 date: 05/13/2024
CPU:
  Info: model: AMD Ryzen 7 7735U with Radeon Graphics socket: FP7 bits: 64
    type: MT MCP arch: Zen 3+ gen: 3 level: v3 note: check built: 2022
    process: TSMC n6 (7nm) family: 0x19 (25) model-id: 0x44 (68) stepping: 1
    microcode: 0xA404102
  Topology: cpus: 1x dies: 1 clusters: 1 cores: 8 threads: 16 tpc: 2
    smt: enabled cache: L1: 512 KiB desc: d-8x32 KiB; i-8x32 KiB L2: 4 MiB
    desc: 8x512 KiB L3: 16 MiB desc: 1x16 MiB
  Speed (MHz): avg: 400 min/max: 400/4819 boost: enabled
    base/boost: 2700/4800 scaling: driver: amd-pstate-epp governor: powersa=
ve
    volts: 1.2 V ext-clock: 100 MHz cores: 1: 400 2: 400 3: 400 4: 400 5: 4=
00
    6: 400 7: 400 8: 400 9: 400 10: 400 11: 400 12: 400 13: 400 14: 400
    15: 400 16: 400 bogomips: 86261
  Flags: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3 svm
  Vulnerabilities:
  Type: gather_data_sampling status: Not affected
  Type: itlb_multihit status: Not affected
  Type: l1tf status: Not affected
  Type: mds status: Not affected
  Type: meltdown status: Not affected
  Type: mmio_stale_data status: Not affected
  Type: reg_file_data_sampling status: Not affected
  Type: retbleed status: Not affected
  Type: spec_rstack_overflow status: Vulnerable: Safe RET, no microcode
  Type: spec_store_bypass mitigation: Speculative Store Bypass disabled via
    prctl
  Type: spectre_v1 mitigation: usercopy/swapgs barriers and __user pointer
    sanitization
  Type: spectre_v2 mitigation: Retpolines; IBPB: conditional; IBRS_FW;
    STIBP: always-on; RSB filling; PBRSB-eIBRS: Not affected; BHI: Not
    affected
  Type: srbds status: Not affected
  Type: tsx_async_abort status: Not affected
Graphics:
  Device-1: Advanced Micro Devices [AMD/ATI] Rembrandt [Radeon 680M]
    vendor: ASUSTeK driver: amdgpu v: kernel arch: RDNA-2 code: Navi-2x
    process: TSMC n7 (7nm) built: 2020-22 pcie: gen: 4 speed: 16 GT/s
    lanes: 16 ports: active: eDP-1 empty: DP-1, DP-2, DP-3, DP-4, DP-5, DP-=
6,
    HDMI-A-1, Writeback-1 bus-ID: 73:00.0 chip-ID: 1002:1681 class-ID: 0300
    temp: 44.0 C
  Device-2: Shinetech USB2.0 FHD UVC WebCam driver: uvcvideo type: USB
    rev: 2.0 speed: 480 Mb/s lanes: 1 mode: 2.0 bus-ID: 5-1:2 chip-ID:
3277:0033
    class-ID: fe01 serial: 200901010001
  Display: unspecified server: X.Org v: 24.1.4 with: Xwayland v: 24.1.4
    compositor: kwin_wayland driver: X: loaded: amdgpu unloaded: modesetting
    alternate: fbdev,vesa dri: radeonsi gpu: amdgpu display-ID: :1 screens:=
 1
  Screen-1: 0 s-res: 2880x1620 s-dpi: 96 s-size: 762x429mm (30.00x16.89")
    s-diag: 874mm (34.43")
  Monitor-1: eDP-1 model: Samsung 0x4180 built: 2021 res: 2880x1620 hz: 120
    dpi: 213 gamma: 1.2 size: 344x194mm (13.54x7.64") diag: 395mm (15.5")
    ratio: 16:9 modes: max: 2880x1620 min: 640x480
  API: EGL v: 1.5 hw: drv: amd radeonsi platforms: device: 0 drv: radeonsi
    device: 1 drv: swrast gbm: drv: radeonsi surfaceless: drv: radeonsi x11:
    drv: radeonsi inactive: wayland
  API: OpenGL v: 4.6 compat-v: 4.5 vendor: amd mesa v: 24.2.6-arch1.1
    glx-v: 1.4 direct-render: yes renderer: AMD Radeon Graphics (radeonsi
    rembrandt LLVM 18.1.8 DRM 3.59 6.12.0-rc6-1-llvm-241014)
    device-ID: 1002:1681 memory: 500 MiB unified: no
  API: Vulkan v: 1.3.295 layers: N/A device: 0 type: integrated-gpu name: A=
MD
    Radeon Graphics (RADV REMBRANDT) driver: mesa radv v: 24.2.6-arch1.1
    device-ID: 1002:1681 surfaces: xcb,xlib

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
