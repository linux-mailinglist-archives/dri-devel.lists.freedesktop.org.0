Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8501E9759
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 13:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76F189F47;
	Sun, 31 May 2020 11:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB8A89F47
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 11:47:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205827] drm:drm_atomic_helper_wait_for_dependencies -
 drm_kms_helper - flip_done timed out
Date: Sun, 31 May 2020 11:47:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205827-2300-rtvuNwK1HZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205827-2300@https.bugzilla.kernel.org/>
References: <bug-205827-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=205827

--- Comment #1 from sander44 (ionut_n2001@yahoo.com) ---
Hi Kernel Team,

I retested with new version kernel, and this issue appear.

dmesg | grep drm
[    4.080480] [drm] DMA map mode: Caching DMA mappings.
[    4.080866] [drm] Capabilities:
[    4.081078] [drm]   Rect copy.
[    4.081389] [drm]   Cursor.
[    4.081671] [drm]   Cursor bypass.
[    4.081673] [drm]   Cursor bypass 2.
[    4.081961] [drm]   8bit emulation.
[    4.081964] [drm]   Alpha cursor.
[    4.082213] [drm]   Extended Fifo.
[    4.082215] [drm]   Multimon.
[    4.082396] [drm]   Pitchlock.
[    4.082398] [drm]   Irq mask.
[    4.082733] [drm]   Display Topology.
[    4.082736] [drm]   GMR.
[    4.082912] [drm]   Traces.
[    4.082914] [drm]   GMR2.
[    4.083205] [drm]   Screen Object 2.
[    4.083207] [drm]   Command Buffers.
[    4.083417] [drm]   Command Buffers 2.
[    4.083419] [drm]   Guest Backed Resources.
[    4.083712] [drm]   DX Features.
[    4.083714] [drm]   HP Command Queue.
[    4.083914] [drm] Capabilities2:
[    4.084070] [drm]   Grow oTable.
[    4.084404] [drm]   IntraSurface copy.
[    4.084406] [drm] Max GMR ids is 64
[    4.084592] [drm] Max number of GMR pages is 65536
[    4.084593] [drm] Max dedicated hypervisor surface memory is 0 kiB
[    4.084888] [drm] Maximum display memory size is 16384 kiB
[    4.084890] [drm] VRAM at 0xe8000000 size is 4096 kiB
[    4.085137] [drm] MMIO at 0xfe000000 size is 256 kiB
[    4.086031] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    4.087545] [drm] No driver support for vblank timestamp query.
[    4.087682] [drm] Screen Target Display device initialized
[    4.087779] [drm] width 640
[    4.087827] [drm] height 480
[    4.087875] [drm] bpp 32
[    4.096688] [drm] Fifo max 0x00040000 min 0x00001000 cap 0x0000077f
[    4.097696] [drm] Using command buffers with DMA pool.
[    4.097772] [drm] DX: no.
[    4.097813] [drm] Atomic: yes.
[    4.098144] [drm] SM4_1: no.
[    4.100942] fbcon: svgadrmfb (fb0) is primary device
[    4.112518] [drm] Initialized vmwgfx 2.17.0 20200114 for 0000:00:0f.0 on
minor 0
[484415.570337] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:38:crtc-0] flip_done timed out
[484425.810398] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:34:plane-0] flip_done timed out

5.6.14-vanilla

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
