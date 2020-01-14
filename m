Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A6513B2F8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 20:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA216E043;
	Tue, 14 Jan 2020 19:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A42B6E030
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 19:27:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206141] VCE UVD ring test failed -110
Date: Tue, 14 Jan 2020 19:27:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: thong.thai@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206141-2300-c7EzFpCEoe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206141-2300@https.bugzilla.kernel.org/>
References: <bug-206141-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=206141

Thong Thai (thong.thai@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |thong.thai@amd.com

--- Comment #5 from Thong Thai (thong.thai@amd.com) ---
Hi Janpieter,

I was unsuccessful in trying to recreate your issue. 
- Running Linux stable, 5.4.10, verified the IB tests are running
- Same video card, same VBIOS, same firmware
- Tried with/without a display connected
- Tried with/with rocm-dkms

Trying to see if I'm missing anything else, what motherboard / CPU are using?
and do you have any special kernal parameters you're using?

---

[    4.702561] [drm] initializing kernel modesetting (FIJI 0x1002:0x7300
0x1002:0x0B36 0xCA).
[    4.702569] [drm] register mmio base: 0xFCF00000
[    4.702569] [drm] register mmio size: 262144
[    4.702577] [drm] add ip block number 0 <vi_common>
[    4.702578] [drm] add ip block number 1 <gmc_v8_0>
[    4.702578] [drm] add ip block number 2 <tonga_ih>
[    4.702579] [drm] add ip block number 3 <gfx_v8_0>
[    4.702580] [drm] add ip block number 4 <sdma_v3_0>
[    4.702580] [drm] add ip block number 5 <powerplay>
[    4.702581] [drm] add ip block number 6 <dm>
[    4.702582] [drm] add ip block number 7 <uvd_v6_0>
[    4.702582] [drm] add ip block number 8 <vce_v3_0>
[    4.702758] amdgpu 0000:07:00.0: No more image in the PCI ROM
[    4.702777] ATOM BIOS: 113-C8820200-107
[    4.702789] [drm] UVD is enabled in physical mode
[    4.702789] [drm] VCE enabled in physical mode
[    4.702811] [drm] vm size is 64 GB, 2 levels, block size is 10-bit, fragment
size is 9-bit
[    4.702818] amdgpu 0000:07:00.0: VRAM: 4096M 0x000000F400000000 -
0x000000F4FFFFFFFF (4096M used)
[    4.702819] amdgpu 0000:07:00.0: GART: 1024M 0x000000FF00000000 -
0x000000FF3FFFFFFF
[    4.702823] [drm] Detected VRAM RAM=4096M, BAR=256M
[    4.702824] [drm] RAM width 512bits HBM
[    4.702876] [TTM] Zone  kernel: Available graphics memory: 8201336 KiB
[    4.702877] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[    4.702877] [TTM] Initializing pool allocator
[    4.702880] [TTM] Initializing DMA pool allocator
[    4.702907] [drm] amdgpu: 4096M of VRAM memory ready
[    4.702909] [drm] amdgpu: 4096M of GTT memory ready.
[    4.702925] [drm] GART: num cpu pages 262144, num gpu pages 262144
[    4.702988] [drm] PCIE GART of 1024M enabled (table at 0x000000F4001D5000).
[    4.743132] [drm] Chained IB support enabled!
[    4.764245] amdgpu: [powerplay] hwmgr_sw_init smu backed is fiji_smu
[    4.768880] [drm] Found UVD firmware Version: 1.91 Family ID: 12
[    4.768885] [drm] UVD ENC is disabled
[    4.772092] [drm] Found VCE firmware Version: 55.2 Binary ID: 3
[    4.837386] [drm] dce110_link_encoder_construct: Failed to get
encoder_cap_info from VBIOS with error code 4!
[    4.848088] [drm] Display Core initialized with v3.2.48!
[    4.848823] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    4.848824] [drm] Driver supports precise vblank timestamp query.
[    4.874937] [drm] UVD initialized successfully.
[    4.974949] [drm] VCE initialized successfully.
[    4.976370] [drm] Cannot find any crtc or sizes
[    4.978116] [drm] Initialized amdgpu 3.35.0 20150101 for 0000:07:00.0 on
minor 0

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
