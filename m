Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F68E421ACB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 01:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFE06EABB;
	Mon,  4 Oct 2021 23:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB956EABB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 23:41:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 44A0E6139E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 23:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633390867;
 bh=LOJEjCIq9qptGNyKNp/4W3sA9Rj4Guks8/jPyoF+mIk=;
 h=From:To:Subject:Date:From;
 b=hNHxzX9Y1bnVnmtYbsL+NrIrJrhiOb4lG12Sw+oGeU9rhgIm0j6vKZ/FsEzh8qV8f
 u+KPfJrk0Ulp569yxclzb1TDx7TwMamyUSiUEFuWgW1tdlgHbg0i41sKoimRbJChMs
 ghp7LgkJsj8juyTBHjdFe16qd113iwCDPPPg2/mDJFMI92w0QUXgmsN76ViUxdVtk+
 HNJVHRleUcv+e5WhMd9gWJefaQmXW995AxIIeB4gDV1n/AQuj2/8vfiBt141JqBh9I
 mhXGufmdbHcEf+Gcz+/T5zm1eecmvWAC4JDcmGXB/FiwJ02k7/BYM/9MBluyrgQVCT
 iVJ0Ai5kNdDiw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3930560F00; Mon,  4 Oct 2021 23:41:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] New: WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Mon, 04 Oct 2021 23:41:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-214621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214621

            Bug ID: 214621
           Summary: WARNING: CPU: 3 PID: 521 at
                    drivers/gpu/drm/ttm/ttm_bo.c:409
                    ttm_bo_release+0xb64/0xe40 [ttm]
           Product: Drivers
           Version: 2.5
    Kernel Version: 5,15-rc4
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
                CC: ray.huang@amd.com
        Regression: No

Created attachment 299097
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299097&action=3Dedit
kernel dmesg (5.15-rc4, AMD PRO A10-8750B)

Happened during reboot. Machine was able to reboot succesfully however.

[...]
------------[ cut here ]------------
WARNING: CPU: 3 PID: 521 at drivers/gpu/drm/ttm/ttm_bo.c:409
ttm_bo_release+0xb64/0xe40 [ttm]
Modules linked in: rfcomm cmac bnep btusb btrtl btbcm btintel bluetooth
jitterentropy_rng sha512_ssse3 sha512_generic drbg ansi_cprng ecdh_generic =
ecc
rfkill dm_crypt nhpoly1305_sse2 nhpoly1305 chacha_generic chacha_x86_64
libchacha adiantum libpoly1305 algif_skcipher input_leds led_class joydev
dm_mod hid_generic usbhid hid f2fs evdev crc32_generic lz4hc_compress raid4=
56
async_raid6_recov async_memcpy lz4_compress async_pq async_xor lz4_decompre=
ss
async_tx crc32_pclmul ohci_pci md_mod aesni_intel libaes crypto_simd cryptd
amdgpu ext4 crc16 fam15h_power k10temp snd_hda_codec_hdmi mbcache ohci_hcd
ehci_pci jbd2 ehci_hcd i2c_piix4 snd_hda_intel drm_ttm_helper ttm
snd_intel_dspcfg mfd_core snd_hda_codec gpu_sched i2c_algo_bit xhci_pci
snd_hwdep snd_hda_core xhci_hcd drm_kms_helper snd_pcm usbcore snd_timer
usb_common syscopyarea sysfillrect snd sysimgblt fb_sys_fops soundcore
acpi_cpufreq video button processor zram zsmalloc nct6775 hwmon_vid hwmon n=
fsd
auth_rpcgss lockd grace
 drm fuse drm_panel_orientation_quirks backlight configfs sunrpc efivarfs
CPU: 3 PID: 521 Comm: X Not tainted 5.15.0-rc4-bdver3 #2
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./A88M-G/3.1, BI=
OS
P1.40C 11/21/2016
RIP: 0010:ttm_bo_release+0xb64/0xe40 [ttm]
Code: c1 ea 03 80 3c 02 00 0f 85 77 01 00 00 48 8b bb f0 fe ff ff b9 28 23 =
00
00 31 d2 be 01 00 00 00 e8 81 bc 50 dd e9 d3 fe ff ff <0f> 0b e9 1c f5 ff f=
f 4c
89 e7 e8 4d 4d 50 dd e9 26 fc ff ff be 03
RSP: 0018:ffffc90001a8fbe0 EFLAGS: 00010206
RAX: 0000000000000007 RBX: ffff888106ade698 RCX: 0000000000000009
RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffff888106ade698
RBP: ffff888106ade458 R08: ffffffffc0ba3689 R09: ffff888106ade69b
R10: ffffed1020d5bcd3 R11: 0000000000000001 R12: ffff88814db40010
R13: ffff88814c0ad2f8 R14: ffff88814c0ad340 R15: ffff88816a9fb1c0
FS:  00007f52f84f2dc0(0000) GS:ffff8883d1780000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1fd3d6d078 CR3: 0000000142fda000 CR4: 00000000000506e0
Call Trace:
 ? fsnotify_grab_connector+0xcc/0x190
 ? fsnotify_destroy_marks+0x5f/0x200
 amdgpu_bo_unref+0x2c/0x60 [amdgpu]
 amdgpu_gem_object_free+0x6a/0xa0 [amdgpu]
 ? amdgpu_gem_object_mmap+0xe0/0xe0 [amdgpu]
 ? trace_hardirqs_on+0x1c/0x110
 drm_gem_dmabuf_release+0x82/0xb0 [drm]
 dma_buf_release+0x127/0x230
 __dentry_kill+0x376/0x550
 ? dma_buf_file_release+0x177/0x200
 __fput+0x2c0/0x8c0
 task_work_run+0xc5/0x150
 do_exit+0x799/0x20c0
 ? mm_update_next_owner+0x6d0/0x6d0
 do_group_exit+0xe7/0x290
 __x64_sys_exit_group+0x35/0x40
 do_syscall_64+0x66/0x90
 ? do_syscall_64+0xe/0x90
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f52f7d8c2f9
Code: Unable to access opcode bytes at RIP 0x7f52f7d8c2cf.
RSP: 002b:00007ffc11abca58 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f52f7e74920 RCX: 00007f52f7d8c2f9
RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
RBP: 00007f52f7e74920 R08: fffffffffffffd40 R09: 000055d959e97190
R10: 00007f52f75386b8 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000668 R15: 0000000000000000
irq event stamp: 815615493
hardirqs last  enabled at (815615499): [<ffffffff9d1f7f4c>]
vprintk_emit+0x2dc/0x310
hardirqs last disabled at (815615504): [<ffffffff9d1f7efb>]
vprintk_emit+0x28b/0x310
softirqs last  enabled at (815614376): [<ffffffff9e62766c>]
unix_release_sock+0x23c/0xa70
softirqs last disabled at (815614374): [<ffffffff9e6275f2>]
unix_release_sock+0x1c2/0xa70
---[ end trace 4449f17f76814cfa ]---


 # lspci=20
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Root Complex
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Family 15h (Models 30h-3f=
h)
I/O Memory Management Unit
00:01.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Kaveri [Radeon R7 Graphics] (rev d7)
00:01.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Kaveri HDMI/DP
Audio Controller
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Root Port
00:02.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Kaveri P2P Bridge for
GFX PCIe Port [1:0]
00:03.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Root Port
00:03.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Root Port
00:03.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Root Port
00:04.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Root Port
00:10.0 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB XHCI
Controller (rev 09)
00:10.1 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB XHCI
Controller (rev 09)
00:11.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Contro=
ller
[AHCI mode] (rev 40)
00:12.0 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB OHCI
Controller (rev 11)
00:12.2 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB EHCI
Controller (rev 11)
00:13.0 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB OHCI
Controller (rev 11)
00:13.2 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB EHCI
Controller (rev 11)
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev=
 16)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev =
11)
00:14.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] FCH PCI Bridge (rev =
40)
00:14.5 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB OHCI
Controller (rev 11)
00:15.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] Hudson PCI to PCI br=
idge
(PCIE port 0)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h (Models
30h-3fh) Processor Function 5
01:00.0 USB controller: ASMedia Technology Inc. ASM2142 USB 3.1 Host Contro=
ller
02:00.0 USB controller: ASMedia Technology Inc. ASM1143 USB 3.1 Host Contro=
ller
03:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8=
411
PCI Express Gigabit Ethernet Controller (rev 11)
05:00.0 Non-Volatile memory controller: Sandisk Corp WD Black SN750 / PC SN=
730
NVMe SSD

 # lspci -s 00:01.0 -v
00:01.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Kaveri [Radeon R7 Graphics] (rev d7) (prog-if 00 [VGA controller])
        Subsystem: ASRock Incorporation Kaveri [Radeon R7 Graphics]
        Flags: bus master, fast devsel, latency 0, IRQ 62, IOMMU group 0
        Memory at c0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at d0000000 (64-bit, prefetchable) [size=3D8M]
        I/O ports at f000 [size=3D256]
        Memory at feb00000 (32-bit, non-prefetchable) [size=3D256K]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [58] Express Root Complex Integrated Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [270] Secondary PCI Express
        Capabilities: [2b0] Address Translation Service (ATS)
        Capabilities: [2c0] Page Request Interface (PRI)
        Capabilities: [2d0] Process Address Space ID (PASID)
        Kernel driver in use: amdgpu
        Kernel modules: amdgpu

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
