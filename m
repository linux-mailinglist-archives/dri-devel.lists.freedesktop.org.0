Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D57652F0AA1
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 01:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F34889C0A;
	Mon, 11 Jan 2021 00:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5B8899DC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 00:39:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 071F822B2C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 00:39:17 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id 0349A816A9; Mon, 11 Jan 2021 00:39:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211033] [bisected][regression] amdgpu: *ERROR* Restoring old
 state failed with -12
Date: Mon, 11 Jan 2021 00:39:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arturbac.ab@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211033-2300-iypzJeTkkr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211033-2300@https.bugzilla.kernel.org/>
References: <bug-211033-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211033

--- Comment #10 from Artur Bac (arturbac.ab@gmail.com) ---
5.10.6 works ok again with 2 monitors and Sapphire Nitro+ Radeon RX 5700 XT

here is dmesg output of drm on 5.10.6

[    3.471791] systemd[1]: Starting Load Kernel Module drm...
[    3.482194] systemd[1]: modprobe@drm.service: Succeeded.
[    3.482336] systemd[1]: Finished Load Kernel Module drm.
[    3.562351] [drm] amdgpu kernel modesetting enabled.
[    3.563495] [drm] initializing kernel modesetting (NAVI10 0x1002:0x731F
0x1DA2:0xE409 0xC1).
[    3.563505] [drm] register mmio base: 0xFCC00000
[    3.563506] [drm] register mmio size: 524288
[    3.564808] [drm] add ip block number 0 <nv_common>
[    3.564810] [drm] add ip block number 1 <gmc_v10_0>
[    3.564811] [drm] add ip block number 2 <navi10_ih>
[    3.564812] [drm] add ip block number 3 <psp>
[    3.564813] [drm] add ip block number 4 <smu>
[    3.564814] [drm] add ip block number 5 <dm>
[    3.564815] [drm] add ip block number 6 <gfx_v10_0>
[    3.564816] [drm] add ip block number 7 <sdma_v5_0>
[    3.564817] [drm] add ip block number 8 <vcn_v2_0>
[    3.564818] [drm] add ip block number 9 <jpeg_v2_0>
[    3.564848] [drm] VCN decode is enabled in VM mode
[    3.564849] [drm] VCN encode is enabled in VM mode
[    3.564850] [drm] JPEG decode is enabled in VM mode
[    3.564865] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit,
fragment size is 9-bit
[    3.564878] [drm] Detected VRAM RAM=8176M, BAR=256M
[    3.564879] [drm] RAM width 256bits GDDR6
[    3.564935] [drm] amdgpu: 8176M of VRAM memory ready
[    3.564937] [drm] amdgpu: 8176M of GTT memory ready.
[    3.564938] [drm] GART: num cpu pages 131072, num gpu pages 131072
[    3.565069] [drm] PCIE GART of 512M enabled (table at 0x0000008000900000).
[    3.588344] [drm] Found VCN firmware Version ENC: 1.10 DEC: 5 VEP: 0
Revision: 13
[    3.588351] [drm] PSP loading VCN firmware
[    4.166778] [drm] reserve 0x900000 from 0x81fe400000 for PSP TMR
[    4.412518] [drm] Display Core initialized with v3.2.104!
[    4.625413] [drm] kiq ring mec 2 pipe 1 q 0
[    4.634394] [drm] VCN decode and encode initialized successfully(under DPG
Mode).
[    4.634532] [drm] JPEG decode initialized successfully.
[    4.639105] [drm] fb mappable at 0xE0B0A000
[    4.639107] [drm] vram apper at 0xE0000000
[    4.639108] [drm] size 33177600
[    4.639110] [drm] fb depth is 24
[    4.639111] [drm]    pitch is 15360
[    4.639171] fbcon: amdgpudrmfb (fb0) is primary device
[    4.791132] amdgpu 0000:0f:00.0: [drm] fb0: amdgpudrmfb frame buffer device
[    4.816294] [drm] Initialized amdgpu 3.40.0 20150101 for 0000:0f:00.0 on
minor 0

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
