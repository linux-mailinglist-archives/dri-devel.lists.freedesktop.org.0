Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AB420CE15
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 13:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5D389D7B;
	Mon, 29 Jun 2020 11:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBCA89D7B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 11:08:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208373] New: drm:drm_atomic_helper_wait_for_dependencies -
 drm_kms_helper - flip_done timed out
Date: Mon, 29 Jun 2020 11:08:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208373-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208373

            Bug ID: 208373
           Summary: drm:drm_atomic_helper_wait_for_dependencies -
                    drm_kms_helper - flip_done timed out
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.7.2
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ionut_n2001@yahoo.com
        Regression: No

Hi Kernel Team,

With 5.7.2, observe this issue:
[1263266.374115] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:38:crtc-0] flip_done timed out
[1263276.614099] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:34:plane-0] flip_done timed out
[1266457.945569] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:38:crtc-0] flip_done timed out
[1266468.185524] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:34:plane-0] flip_done timed out
[1268050.016722] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:38:crtc-0] flip_done timed out
[1268060.256836] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:34:plane-0] flip_done timed out
[1270654.054668] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:38:crtc-0] flip_done timed out
[1270664.294675] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:34:plane-0] flip_done timed out
[1271127.144282] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:38:crtc-0] flip_done timed out
[1271137.384328] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:34:plane-0] flip_done timed out
[1274245.495567] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:38:crtc-0] flip_done timed out
[1274255.735657] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:34:plane-0] flip_done timed out
[1279238.818759] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [CRTC:38:crtc-0] flip_done timed out
[1279249.058822] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]]
*ERROR* [PLANE:34:plane-0] flip_done timed out



dmesg | grep drm
[    2.598899] [drm] DMA map mode: Caching DMA mappings.
[    2.599179] [drm] Capabilities:
[    2.599297] [drm]   Rect copy.
[    2.599369] [drm]   Cursor.
[    2.599412] [drm]   Cursor bypass.
[    2.599461] [drm]   Cursor bypass 2.
[    2.599510] [drm]   8bit emulation.
[    2.599558] [drm]   Alpha cursor.
[    2.599605] [drm]   Extended Fifo.
[    2.599653] [drm]   Multimon.
[    2.599696] [drm]   Pitchlock.
[    2.599740] [drm]   Irq mask.
[    2.599784] [drm]   Display Topology.
[    2.599834] [drm]   GMR.
[    2.599873] [drm]   Traces.
[    2.599915] [drm]   GMR2.
[    2.599955] [drm]   Screen Object 2.
[    2.600005] [drm]   Command Buffers.
[    2.600054] [drm]   Command Buffers 2.
[    2.600105] [drm]   Guest Backed Resources.
[    2.600160] [drm]   DX Features.
[    2.600476] [drm]   HP Command Queue.
[    2.600527] [drm] Capabilities2:
[    2.600573] [drm]   Grow oTable.
[    2.600620] [drm]   IntraSurface copy.
[    2.600671] [drm] Max GMR ids is 64
[    2.600721] [drm] Max number of GMR pages is 65536
[    2.600782] [drm] Max dedicated hypervisor surface memory is 0 kiB
[    2.600857] [drm] Maximum display memory size is 16384 kiB
[    2.600925] [drm] VRAM at 0xe8000000 size is 4096 kiB
[    2.600990] [drm] MMIO at 0xfe000000 size is 256 kiB
[    2.601616] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    2.601785] [drm] Screen Target Display device initialized
[    2.601890] [drm] width 640
[    2.601938] [drm] height 480
[    2.601986] [drm] bpp 32
[    2.621888] [drm] Fifo max 0x00040000 min 0x00001000 cap 0x0000077f
[    2.625498] [drm] Using command buffers with DMA pool.
[    2.625580] [drm] Atomic: yes.
[    2.630205] fbcon: svgadrmfb (fb0) is primary device
[    2.642217] [drm] Initialized vmwgfx 2.18.0 20200114 for 0000:00:0f.0 on
minor 0

cat /proc/cmdline
BOOT_IMAGE=/boot/vmlinuz-5.7.2-vanilla
root=UUID=27e2847b-d1ad-427c-97ed-b0b65028d30a ro video=SVIDEO-1:d

lspci | grep 00:0f.0
00:0f.0 VGA compatible controller: VMware SVGA II Adapter

lspci -s 00:0f.0 -vvvvv
00:0f.0 VGA compatible controller: VMware SVGA II Adapter (prog-if 00 [VGA
controller])
        Subsystem: VMware SVGA II Adapter
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64, Cache Line Size: 32 bytes
        Interrupt: pin A routed to IRQ 16
        Region 0: I/O ports at 1070 [size=16]
        Region 1: Memory at e8000000 (32-bit, prefetchable) [size=128M]
        Region 2: Memory at fe000000 (32-bit, non-prefetchable) [size=8M]
        [virtual] Expansion ROM at 000c0000 [disabled] [size=128K]
        Capabilities: [40] Vendor Specific Information: Len=00 <?>
        Capabilities: [44] PCI Advanced Features
                AFCap: TP+ FLR+
                AFCtrl: FLR-
                AFStatus: TP-
        Kernel driver in use: vmwgfx
        Kernel modules: vmwgfx

with 5.7.0, this issue not observe or not appear.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
