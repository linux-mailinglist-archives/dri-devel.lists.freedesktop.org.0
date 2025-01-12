Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B500DA0AC19
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 23:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53F910E081;
	Sun, 12 Jan 2025 22:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LieQ042L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A3610E081
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 22:04:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 579325C4333
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 22:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E72D2C4CEDF
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 22:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736719441;
 bh=x2cVYp6nxPW3WujzLvPST6wVpo/KAwM3rNezbeptjmI=;
 h=From:To:Subject:Date:From;
 b=LieQ042LF5GqSPPHvf242DCzoGPYXiup9me9CPIzpK9w/kYnxlqv7bLvzTWSq99Eq
 OZRY3hQaq03XPBnyXEBB0RQuOfAuepdRBt9YIvk32Uioq8nKJsGjSZ7Br3O3qwN4JZ
 u16EFwTJxTp0dQpnwH3g8EsBCOW0fZ3C0OpdN8XiDdZ/i8evLn7PDauduc9pRoXxNu
 smEfbk6nE/xBRidiQn4EML2OxTZuWAaJJP+MYu23EU7hUZ4ZtaSKgOf8dSEziaCNI9
 31CKDa3NJZh/49TwdJDzmxxf/jRoJhg9REs+kkZRWbRw9lkqmWEM5pV83E3fjqAC/g
 eHos8QGMX13Yg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D7842C41612; Sun, 12 Jan 2025 22:04:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219689] New: Kernel Logs Reveal Multiple AMD Driver Issues
Date: Sun, 12 Jan 2025 22:04:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: dacia.mountable282@aleeas.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219689-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219689

            Bug ID: 219689
           Summary: Kernel Logs Reveal Multiple AMD Driver Issues
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: dacia.mountable282@aleeas.com
        Regression: No

=E2=94=94=E2=94=80[$] <> vainfo
Trying display: wayland
libva info: VA-API version 1.22.0
libva info: Trying to open /usr/lib64/dri/radeonsi_drv_video.so
libva info: Found init function __vaDriverInit_1_22
libva info: va_openDriver() returns 0
vainfo: VA-API version: 1.22 (libva 2.22.0)
vainfo: Driver version: Mesa Gallium driver 24.3.3 for AMD Radeon Vega 8
Graphics (radeonsi, raven, LLVM 19.1.6, DRM 3.59, 6.12.8-2-default)
vainfo: Supported profile and entrypoints
      VAProfileMPEG2Simple            : VAEntrypointVLD
      VAProfileMPEG2Main              : VAEntrypointVLD
      VAProfileJPEGBaseline           : VAEntrypointVLD
      VAProfileVP9Profile0            : VAEntrypointVLD
      VAProfileVP9Profile2            : VAEntrypointVLD
      VAProfileNone                   : VAEntrypointVideoProc

Kernel Logs Reveal Multiple AMD Driver Issues:

1. PSP (Platform Security Processor) Failures:
- Failed PSP commands: `LOAD_TA` and `INVOKE_CMD`
- Secure display generic failure
- PSP-related command responses returning error status

2. Missing Critical GPU Functionalities:
- RAS (Reliability, Availability, and Serviceability) Trusted Application
unavailable
- RAP Trusted Application not available

3. Power Management Limitations:
- Runtime Power Management (PM) not available


=E2=94=94=E2=94=80[$] sudo journalctl -b -1 -g amdgpu
Jan 12 23:24:31 tumbleweed-msi kernel: [drm] amdgpu kernel modesetting enab=
led.
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu: Virtual CRAT table created f=
or
CPU
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu: Topology: Add CPU node
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: enabling device
(0006 -> 0007)
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: Fetched
VBIOS from VFCT
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu: ATOM BIOS: 113-PICASSO-118
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: vgaarb: deactiv=
ate
vga console
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: Trusted
Memory Zone (TMZ) feature enabled
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: VRAM: 2=
048M
0x000000F400000000 - 0x000000F47FFFFFFF (2048M used)
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: GART: 1=
024M
0x0000000000000000 - 0x000000003FFFFFFF
Jan 12 23:24:31 tumbleweed-msi kernel: [drm] amdgpu: 2048M of VRAM memory r=
eady
Jan 12 23:24:31 tumbleweed-msi kernel: [drm] amdgpu: 6950M of GTT memory re=
ady.
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu: hwmgr_sw_init smu backed is
smu10_smu
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: reserve
0x400000 from 0xf47fc00000 for PSP TMR
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: RAS:
optional ras ta ucode is not available
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: RAP:
optional rap ta ucode is not available
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: psp gfx
command LOAD_TA(0x1) failed and response status is (0x7)
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: psp gfx
command INVOKE_CMD(0x3) failed and response status is (0x4)
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: Secure
display: Generic Failure.
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu:
SECUREDISPLAY: query securedisplay TA failed. ret 0x0
Jan 12 23:24:31 tumbleweed-msi kernel: kfd kfd: amdgpu: Allocated 3969056 b=
ytes
on gart
Jan 12 23:24:31 tumbleweed-msi kernel: kfd kfd: amdgpu: Total number of KFD
nodes to be created: 1
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu: Virtual CRAT table created f=
or
GPU
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu: Topology: Add dGPU node
[0x15d8:0x1002]
Jan 12 23:24:31 tumbleweed-msi kernel: kfd kfd: amdgpu: added device 1002:1=
5d8
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: SE 1, SH
per SE 1, CU per SH 11, active_cu_number 8
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: ring gfx
uses VM inv eng 0 on hub 0
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: ring
comp_1.0.0 uses VM inv eng 1 on hub 0
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: ring
comp_1.1.0 uses VM inv eng 4 on hub 0
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: ring
comp_1.2.0 uses VM inv eng 5 on hub 0
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: ring
comp_1.3.0 uses VM inv eng 6 on hub 0
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: ring
comp_1.0.1 uses VM inv eng 7 on hub 0
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: ring
comp_1.1.1 uses VM inv eng 8 on hub 0
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: ring
comp_1.2.1 uses VM inv eng 9 on hub 0
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: ring
comp_1.3.1 uses VM inv eng 10 on hub 0
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: ring
kiq_0.2.1.0 uses VM inv eng 11 on hub 0
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: ring sd=
ma0
uses VM inv eng 0 on hub 8
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: ring
vcn_dec uses VM inv eng 1 on hub 8
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: ring
vcn_enc0 uses VM inv eng 4 on hub 8
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: ring
vcn_enc1 uses VM inv eng 5 on hub 8
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: ring
jpeg_dec uses VM inv eng 6 on hub 8
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu: pp_dpm_get_sclk_od was not
implemented.
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu: pp_dpm_get_mclk_od was not
implemented.
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: amdgpu: Runtime=
 PM
not available
Jan 12 23:24:31 tumbleweed-msi kernel: [drm] Initialized amdgpu 3.59.0 for
0000:30:00.0 on minor 1
Jan 12 23:24:31 tumbleweed-msi kernel: fbcon: amdgpudrmfb (fb0) is primary
device
Jan 12 23:24:31 tumbleweed-msi kernel: amdgpu 0000:30:00.0: [drm] fb0:
amdgpudrmfb frame buffer device
Jan 12 23:24:47 tumbleweed-msi kernel: snd_hda_intel 0000:30:00.1: bound
0000:30:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
