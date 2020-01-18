Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A10D14178D
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 13:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946DE6E05F;
	Sat, 18 Jan 2020 12:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B706E05F
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 12:51:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206247] 5.4.x: WARNING: CPU: 1 PID: 561 at
 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1464
 dcn_bw_update_from_pplib+0xa5/0x2e0 [amdgpu]
Date: Sat, 18 Jan 2020 12:51:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: udovdh@xs4all.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206247-2300-EPRabkPq9I@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206247-2300@https.bugzilla.kernel.org/>
References: <bug-206247-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206247

--- Comment #1 from udo (udovdh@xs4all.nl) ---
Some context:

[   33.608142] Console: switching to colour dummy device 80x25
[   33.641766] [drm] initializing kernel modesetting (RAVEN 0x1002:0x15D8
0x1002:0x15D8 0xC8).
[   33.691838] [drm] register mmio base: 0xFCD00000
[   33.691842] [drm] register mmio size: 524288
[   33.691868] [drm] add ip block number 0 <soc15_common>
[   33.775887] [drm] add ip block number 1 <gmc_v9_0>
[   33.775887] [drm] add ip block number 2 <vega10_ih>
[   33.775888] [drm] add ip block number 3 <psp>
[   33.775888] [drm] add ip block number 4 <gfx_v9_0>
[   33.775889] [drm] add ip block number 5 <sdma_v4_0>
[   33.775889] [drm] add ip block number 6 <powerplay>
[   33.775890] [drm] add ip block number 7 <dm>
[   33.775890] [drm] add ip block number 8 <vcn_v1_0>
[   33.815135] [drm] BIOS signature incorrect 5b 7
[   34.028500] ATOM BIOS: 113-PICASSO-115
[   34.028523] [drm] VCN decode is enabled in VM mode
[   34.028524] [drm] VCN encode is enabled in VM mode
[   34.028524] [drm] VCN jpeg decode is enabled in VM mode
[   34.028557] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit,
fragment size is 9-bit
[   34.028564] amdgpu 0000:0a:00.0: VRAM: 2048M 0x000000F400000000 -
0x000000F47FFFFFFF (2048M used)
[   34.028565] amdgpu 0000:0a:00.0: GART: 1024M 0x0000000000000000 -
0x000000003FFFFFFF
[   34.028566] amdgpu 0000:0a:00.0: AGP: 267419648M 0x000000F800000000 -
0x0000FFFFFFFFFFFF
[   34.028569] [drm] Detected VRAM RAM=2048M, BAR=2048M
[   34.028569] [drm] RAM width 128bits DDR4
[   34.028915] [TTM] Zone  kernel: Available graphics memory: 7190102 KiB
[   34.291895] md: md127: resync done.
[   34.339191] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[   34.491530] [TTM] Initializing pool allocator
[   34.491538] [TTM] Initializing DMA pool allocator
[   34.491594] [drm] amdgpu: 2048M of VRAM memory ready
[   34.575594] [drm] amdgpu: 8192M of GTT memory ready.
[   34.575608] [drm] GART: num cpu pages 262144, num gpu pages 262144
[   34.643124] [drm] PCIE GART of 1024M enabled (table at 0x000000F400900000).
[   34.686767] [drm] use_doorbell being set to: [true]
[   34.716100] amdgpu: [powerplay] hwmgr_sw_init smu backed is smu10_smu
[   34.754769] [drm] Found VCN firmware Version: 1.73 Family ID: 18
[   34.790801] [drm] PSP loading VCN firmware
[   34.836051] [drm] reserve 0x400000 from 0xf47f800000 for PSP TMR
[   35.108064] [drm] DM_PPLIB: values for F clock
[   35.134706] [drm] DM_PPLIB:   0 in kHz, 3099 in mV
[   35.162883] [drm] DM_PPLIB:   0 in kHz, 3099 in mV
[   35.191055] [drm] DM_PPLIB:   0 in kHz, 3099 in mV
[   35.219246] [drm] DM_PPLIB:   1600000 in kHz, 4399 in mV
[   35.250541] ------------[ cut here ]------------
[   35.278240] WARNING: CPU: 1 PID: 561 at
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1464
dcn_bw_update_from_pplib+0xa5/0x2e0 [amdgpu]

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
