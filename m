Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1827815652
	for <lists+dri-devel@lfdr.de>; Sat, 16 Dec 2023 03:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9915E10E047;
	Sat, 16 Dec 2023 02:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF8E10E047
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 02:17:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C0B6662857
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 02:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39611C433C7
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 02:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702693070;
 bh=iz9nxGhIciC0UdgGWFyMsF7/bIjn0Fqh6TQQF61u91s=;
 h=From:To:Subject:Date:From;
 b=MLbHhXg5N+ZemJ0zXOro5v+YE9mwuJOxTPsLilMDeoq1JbZN6mfsf8t0DKLJAsqpR
 PzF7GsnVBRhCugiUGJcLGHqb4/k6PuREGMY6M6anewSA29Vq6V8tT3lCKqWFKJ0peZ
 haq5Qz/QT2t32DPx8ujB3f8V/Hz/zrJX1VphJ/W3ksWk+hND+EcIDyjr0Ik+kqltv9
 MAHHW9xDF2Sv0nGSh6c/k8NlqV3v6tHtl1yv4XRC8llbCwvyD7jNN5LJI5fA+tcrUu
 d8veS+E0d0/QqC6brTw7mwN8eFowvd/ULZAGhGaE5I+eO2ByFnLhss2Pil8Nv295HS
 /8pLybekH8tfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 219F2C53BCD; Sat, 16 Dec 2023 02:17:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218274] New: AMD r9 m380, 2015,27 imac - amdgpu wont work
Date: Sat, 16 Dec 2023 02:17:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pukurasa@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218274-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218274

            Bug ID: 218274
           Summary: AMD r9 m380, 2015,27 imac - amdgpu wont work
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: pukurasa@gmail.com
        Regression: No

I`v tried adding amdgpu.cik_support=3D1 params to kernel, tried blacklisting
radeon drivers, tried using nobara linux patched kernel to enable amdgpu for
si/cik cards.

All of those methods end up PC being stuck on boot, it will throw some artf=
acts
on black screen and will not load into KDE


LOGS from journalctl that seem related to gpu:

dec 16 02:05:27 fedora kernel: PCI: Using ACPI for IRQ routing
dec 16 02:05:27 fedora kernel: PCI: pci_cache_line_size set to 64 bytes
dec 16 02:05:27 fedora kernel: e820: reserve RAM buffer [mem
0x00058000-0x0005ffff]
dec 16 02:05:27 fedora kernel: e820: reserve RAM buffer [mem
0x0009e000-0x0009ffff]
dec 16 02:05:27 fedora kernel: e820: reserve RAM buffer [mem
0x7de65018-0x7fffffff]
dec 16 02:05:27 fedora kernel: e820: reserve RAM buffer [mem
0x7de77018-0x7fffffff]
dec 16 02:05:27 fedora kernel: e820: reserve RAM buffer [mem
0x83e01000-0x83ffffff]
dec 16 02:05:27 fedora kernel: e820: reserve RAM buffer [mem
0x84e48000-0x87ffffff]
dec 16 02:05:27 fedora kernel: e820: reserve RAM buffer [mem
0x8507e000-0x87ffffff]
dec 16 02:05:27 fedora kernel: e820: reserve RAM buffer [mem
0x8ac7f000-0x8bffffff]
dec 16 02:05:27 fedora kernel: e820: reserve RAM buffer [mem
0x8b000000-0x8bffffff]
dec 16 02:05:27 fedora kernel: e820: reserve RAM buffer [mem
0x66f000000-0x66fffffff]
dec 16 02:05:27 fedora kernel: pci 0000:01:00.0: vgaarb: setting as boot VGA
device
dec 16 02:05:27 fedora kernel: pci 0000:01:00.0: vgaarb: bridge control
possible
dec 16 02:05:27 fedora kernel: pci 0000:01:00.0: vgaarb: VGA device added:
decodes=3Dio+mem,owns=3Dnone,locks=3Dnone
dec 16 02:05:27 fedora kernel: vgaarb: loaded
---------------------------------------------------
dec 16 02:05:27 fedora kernel: ACPI: video: [Firmware Bug]: ACPI(GFX0) defi=
nes
_DOD but not _DOS
dec 16 02:05:27 fedora kernel: ACPI: video: Video Device [GFX0] (multi-head:
yes  rom: no  post: no)
dec 16 02:05:27 fedora kernel: input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:01/LNXVIDEO:00/input/inp=
ut8
dec 16 02:05:27 fedora systemd[1]: Mounted sys-kernel-config.mount - Kernel
Configuration File System.
dec 16 02:05:27 fedora systemd[1]: Reached target sysinit.target - System
Initialization.
----------------------------------------------------
dec 16 02:05:27 fedora kernel: tg3 0000:03:00.0 enp3s0f0: renamed from eth0
dec 16 02:05:27 fedora kernel: [drm] radeon kernel modesetting enabled.
dec 16 02:05:27 fedora kernel: radeon 0000:01:00.0: CIK support disabled by
module param
dec 16 02:05:28 fedora kernel: BTRFS: device label fedora devid 1 transid 1=
9386
/dev/sda6 scanned by (udev-worker) (384)
dec 16 02:05:28 fedora systemd[1]: Found device
dev-disk-by\x2duuid-0f85a4ef\x2d0d63\x2d4701\x2dace8\x2d7b12e7af2d68.device=
 -
APPLE_HDD_ST1000DM003 fedora.
dec 16 02:05:28 fedora systemd[1]: Reached target initrd-root-device.target=
 -
Initrd Root Device.
dec 16 02:05:30 fedora kernel: [drm] amdgpu kernel modesetting enabled.
dec 16 02:05:30 fedora kernel: amdgpu: Virtual CRAT table created for CPU
dec 16 02:05:30 fedora kernel: amdgpu: Topology: Add CPU node
dec 16 02:05:30 fedora kernel: [drm] initializing kernel modesetting (BONAI=
RE
0x1002:0x6640 0x106B:0x014B 0x80).
dec 16 02:05:30 fedora kernel: [drm] register mmio base: 0x92500000
dec 16 02:05:30 fedora kernel: [drm] register mmio size: 262144
dec 16 02:05:30 fedora kernel: [drm] add ip block number 0 <cik_common>
dec 16 02:05:30 fedora kernel: [drm] add ip block number 1 <gmc_v7_0>
dec 16 02:05:30 fedora kernel: [drm] add ip block number 2 <cik_ih>
dec 16 02:05:30 fedora kernel: [drm] add ip block number 3 <gfx_v7_0>
dec 16 02:05:30 fedora kernel: [drm] add ip block number 4 <cik_sdma>
dec 16 02:05:30 fedora kernel: [drm] add ip block number 5 <powerplay>
dec 16 02:05:30 fedora kernel: [drm] add ip block number 6 <dce_v8_0>
dec 16 02:05:30 fedora kernel: [drm] add ip block number 7 <uvd_v4_2>
dec 16 02:05:30 fedora kernel: [drm] add ip block number 8 <vce_v2_0>
dec 16 02:05:30 fedora kernel: amdgpu 0000:01:00.0: amdgpu: Fetched VBIOS f=
rom
VFCT
dec 16 02:05:30 fedora kernel: amdgpu: ATOM BIOS: 113-C6005T-009
dec 16 02:05:30 fedora kernel: kfd kfd: amdgpu: BONAIRE  not supported in k=
fd
dec 16 02:05:30 fedora kernel: amdgpu 0000:01:00.0: vgaarb: deactivate vga
console
dec 16 02:05:30 fedora kernel: amdgpu 0000:01:00.0: amdgpu: Trusted Memory =
Zone
(TMZ) feature not supported
dec 16 02:05:30 fedora kernel: [drm] PCIE gen 3 link speeds already enabled
dec 16 02:05:30 fedora kernel: [drm] vm size is 128 GB, 2 levels, block siz=
e is
10-bit, fragment size is 9-bit
dec 16 02:05:30 fedora kernel: amdgpu 0000:01:00.0: amdgpu: VRAM: 2048M
0x000000F400000000 - 0x000000F47FFFFFFF (2048M used)
dec 16 02:05:30 fedora kernel: amdgpu 0000:01:00.0: amdgpu: GART: 1024M
0x000000FF00000000 - 0x000000FF3FFFFFFF
dec 16 02:05:30 fedora kernel: [drm] Detected VRAM RAM=3D2048M, BAR=3D256M
dec 16 02:05:30 fedora kernel: [drm] RAM width 128bits GDDR5
dec 16 02:05:30 fedora kernel: [drm] amdgpu: 2048M of VRAM memory ready
dec 16 02:05:30 fedora kernel: [drm] amdgpu: 11963M of GTT memory ready.
dec 16 02:05:30 fedora kernel: [drm] GART: num cpu pages 262144, num gpu pa=
ges
262144
dec 16 02:05:30 fedora kernel: [drm] PCIE GART of 1024M enabled (table at
0x000000F402000000).
dec 16 02:05:30 fedora kernel: amdgpu: hwmgr_sw_init smu backed is ci_smu
dec 16 02:05:30 fedora kernel: acpi device:02: registered as cooling_device4
dec 16 02:05:30 fedora kernel: [drm] AMDGPU Display Connectors
dec 16 02:05:30 fedora kernel: [drm] Connector 0:
dec 16 02:05:30 fedora kernel: [drm]   eDP-1
dec 16 02:05:30 fedora kernel: [drm]   HPD2
dec 16 02:05:30 fedora kernel: [drm]   DDC: 0x1958 0x1958 0x1959 0x1959 0x1=
95a
0x195a 0x195b 0x195b
dec 16 02:05:30 fedora kernel: [drm]   Encoders:
dec 16 02:05:30 fedora kernel: [drm]     LCD1: INTERNAL_UNIPHY2
dec 16 02:05:30 fedora kernel: [drm] Connector 1:
dec 16 02:05:30 fedora kernel: [drm]   DP-1
dec 16 02:05:30 fedora kernel: [drm]   HPD1
dec 16 02:05:30 fedora kernel: [drm]   DDC: 0x1954 0x1954 0x1955 0x1955 0x1=
956
0x1956 0x1957 0x1957
dec 16 02:05:30 fedora kernel: [drm]   Encoders:
dec 16 02:05:30 fedora kernel: [drm]     DFP1: INTERNAL_UNIPHY2
dec 16 02:05:30 fedora kernel: [drm] Connector 2:
dec 16 02:05:30 fedora kernel: [drm]   DP-2
dec 16 02:05:30 fedora kernel: [drm]   HPD3
dec 16 02:05:30 fedora kernel: [drm]   DDC: 0x194c 0x194c 0x194d 0x194d 0x1=
94e
0x194e 0x194f 0x194f
dec 16 02:05:30 fedora kernel: [drm]   Encoders:
dec 16 02:05:30 fedora kernel: [drm]     DFP2: INTERNAL_UNIPHY1
dec 16 02:05:30 fedora kernel: [drm] Connector 3:
dec 16 02:05:30 fedora kernel: [drm]   DP-3
dec 16 02:05:30 fedora kernel: [drm]   HPD4
dec 16 02:05:30 fedora kernel: [drm]   DDC: 0x1950 0x1950 0x1951 0x1951 0x1=
952
0x1952 0x1953 0x1953
dec 16 02:05:30 fedora kernel: [drm]   Encoders:
dec 16 02:05:30 fedora kernel: [drm]     DFP3: INTERNAL_UNIPHY
dec 16 02:05:30 fedora kernel: [drm] Found UVD firmware Version: 1.64 Family
ID: 9
dec 16 02:05:30 fedora kernel: [drm] Found VCE firmware Version: 50.10 Bina=
ry
ID: 2
dec 16 02:05:32 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 10a ret is 0
dec 16 02:05:33 fedora kernel: [drm:uvd_v4_2_start [amdgpu]] *ERROR* UVD not
responding, trying to reset the VCPU!!!
dec 16 02:05:34 fedora kernel: [drm:uvd_v4_2_start [amdgpu]] *ERROR* UVD not
responding, trying to reset the VCPU!!!
dec 16 02:05:35 fedora kernel: [drm:uvd_v4_2_start [amdgpu]] *ERROR* UVD not
responding, trying to reset the VCPU!!!
dec 16 02:05:35 fedora kernel: fbcon: Taking over console
dec 16 02:05:36 fedora kernel: [drm:uvd_v4_2_start [amdgpu]] *ERROR* UVD not
responding, trying to reset the VCPU!!!
dec 16 02:05:37 fedora kernel: [drm:uvd_v4_2_start [amdgpu]] *ERROR* UVD not
responding, trying to reset the VCPU!!!
dec 16 02:05:38 fedora kernel: [drm:uvd_v4_2_start [amdgpu]] *ERROR* UVD not
responding, trying to reset the VCPU!!!
dec 16 02:05:39 fedora kernel: [drm:uvd_v4_2_start [amdgpu]] *ERROR* UVD not
responding, trying to reset the VCPU!!!
dec 16 02:05:40 fedora kernel: [drm:uvd_v4_2_start [amdgpu]] *ERROR* UVD not
responding, trying to reset the VCPU!!!
dec 16 02:05:41 fedora kernel: [drm:uvd_v4_2_start [amdgpu]] *ERROR* UVD not
responding, trying to reset the VCPU!!!
dec 16 02:05:42 fedora kernel: [drm:uvd_v4_2_start [amdgpu]] *ERROR* UVD not
responding, trying to reset the VCPU!!!
dec 16 02:05:42 fedora kernel: [drm:uvd_v4_2_start [amdgpu]] *ERROR* UVD not
responding, giving up!!!
dec 16 02:05:42 fedora kernel: [drm:amdgpu_device_ip_set_powergating_state
[amdgpu]] *ERROR* set_powergating_state of IP block <uvd_v4_2> failed -1
dec 16 02:05:44 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 12d ret is 0
dec 16 02:05:46 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 154 ret is 0
dec 16 02:05:46 fedora kernel: amdgpu 0000:01:00.0:
[drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring uvd test failed (-110)
dec 16 02:05:46 fedora kernel: [drm:amdgpu_device_init [amdgpu]] *ERROR*
hw_init of IP block <uvd_v4_2> failed -110
dec 16 02:05:46 fedora kernel: amdgpu 0000:01:00.0: amdgpu:
amdgpu_device_ip_init failed
dec 16 02:05:46 fedora kernel: amdgpu 0000:01:00.0: amdgpu: Fatal error dur=
ing
GPU init
dec 16 02:05:46 fedora kernel: amdgpu 0000:01:00.0: amdgpu: amdgpu: finishi=
ng
device.
dec 16 02:05:46 fedora kernel: ------------[ cut here ]------------
dec 16 02:05:46 fedora kernel: WARNING: CPU: 1 PID: 378 at
drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:615 amdgpu_irq_put+0x46/0x70 [amdgp=
u]
dec 16 02:05:46 fedora kernel: Modules linked in: amdgpu(+) drm_exec amdxcp
drm_buddy gpu_sched radeon crct10dif_pclmul crc32_pclmul crc32c_intel
polyval_clmulni polyval_generic sdhci_pci ghash_clmulni_intel drm_ttm_helper
cqh>
dec 16 02:05:46 fedora kernel: CPU: 1 PID: 378 Comm: (udev-worker) Not tain=
ted
6.6.7-201.fsync.fc39.x86_64 #1
dec 16 02:05:46 fedora kernel: Hardware name: Apple Inc.
iMac17,1/Mac-65CE76090165799A, BIOS 522.0.0.0.0 08/17/2023
dec 16 02:05:46 fedora kernel: RIP: 0010:amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel: Code: c0 74 33 48 8b 4e 10 48 83 39 00 74 29=
 89
d1 48 8d 04 88 8b 08 85 c9 74 11 f0 ff 08 74 07 31 c0 c3 cc cc cc cc e9 5a =
fd
ff ff <0f> 0b b8 ea ff ff ff c3 cc cc cc cc b8 ea ff ff ff c3 cc cc c>
dec 16 02:05:46 fedora kernel: RSP: 0018:ffffc900006dfac0 EFLAGS: 00010246
dec 16 02:05:46 fedora kernel: RAX: ffff88810bfa4c40 RBX: ffff888112a98680 =
RCX:
0000000000000000
dec 16 02:05:46 fedora kernel: RDX: 0000000000000000 RSI: ffff888112aa79f0 =
RDI:
ffff888112a80000
dec 16 02:05:46 fedora kernel: RBP: ffff888112a90188 R08: 0000000000000000 =
R09:
00000000000390a0
dec 16 02:05:46 fedora kernel: R10: ffff8881106d7e00 R11: ffffffffa6346508 =
R12:
ffff888112a90568
dec 16 02:05:46 fedora kernel: R13: ffff888112a80010 R14: ffff888112a80000 =
R15:
ffff888112aa79f0
dec 16 02:05:46 fedora kernel: FS:  00007f340730d980(0000)
GS:ffff888656c80000(0000) knlGS:0000000000000000
dec 16 02:05:46 fedora kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
dec 16 02:05:46 fedora kernel: CR2: 00007f7319f9f000 CR3: 000000010e16a006 =
CR4:
00000000003706e0
dec 16 02:05:46 fedora kernel: DR0: 0000000000000000 DR1: 0000000000000000 =
DR2:
0000000000000000
dec 16 02:05:46 fedora kernel: DR3: 0000000000000000 DR6: 00000000fffe0ff0 =
DR7:
0000000000000400
dec 16 02:05:46 fedora kernel: Call Trace:
dec 16 02:05:46 fedora kernel:  <TASK>
dec 16 02:05:46 fedora kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel:  ? __warn+0x81/0x130
dec 16 02:05:46 fedora kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel:  ? report_bug+0x171/0x1a0
dec 16 02:05:46 fedora kernel:  ? handle_bug+0x3c/0x80
dec 16 02:05:46 fedora kernel:  ? exc_invalid_op+0x17/0x70
dec 16 02:05:46 fedora kernel:  ? asm_exc_invalid_op+0x1a/0x20
dec 16 02:05:46 fedora kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel:  amdgpu_fence_driver_hw_fini+0xfe/0x130 [amd=
gpu]
dec 16 02:05:46 fedora kernel:  amdgpu_device_fini_hw+0xa6/0x330 [amdgpu]
dec 16 02:05:46 fedora kernel:  ? blocking_notifier_chain_unregister+0x36/0=
x50
dec 16 02:05:46 fedora kernel:  amdgpu_driver_load_kms+0xec/0x190 [amdgpu]
dec 16 02:05:46 fedora kernel:  amdgpu_pci_probe+0x150/0x450 [amdgpu]
dec 16 02:05:46 fedora kernel:  local_pci_probe+0x42/0xa0
dec 16 02:05:46 fedora kernel:  pci_device_probe+0xc7/0x240
dec 16 02:05:46 fedora kernel:  really_probe+0x19b/0x3e0
dec 16 02:05:46 fedora kernel:  ? __pfx___driver_attach+0x10/0x10
dec 16 02:05:46 fedora kernel:  __driver_probe_device+0x78/0x160
dec 16 02:05:46 fedora kernel:  driver_probe_device+0x1f/0x90
dec 16 02:05:46 fedora kernel:  __driver_attach+0xd2/0x1c0
dec 16 02:05:46 fedora kernel:  bus_for_each_dev+0x85/0xd0
dec 16 02:05:46 fedora kernel:  bus_add_driver+0x116/0x220
dec 16 02:05:46 fedora kernel:  driver_register+0x59/0x100
dec 16 02:05:46 fedora kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
dec 16 02:05:46 fedora kernel:  do_one_initcall+0x5a/0x320
dec 16 02:05:46 fedora kernel:  do_init_module+0x60/0x240
dec 16 02:05:46 fedora kernel:  __do_sys_init_module+0x17f/0x1b0
dec 16 02:05:46 fedora kernel:  ? __seccomp_filter+0x32c/0x510
dec 16 02:05:46 fedora kernel:  do_syscall_64+0x5d/0x90
dec 16 02:05:46 fedora kernel:  ? __count_memcg_events+0x42/0x90
dec 16 02:05:46 fedora kernel:  ? count_memcg_events.constprop.0+0x1a/0x30
dec 16 02:05:46 fedora kernel:  ? handle_mm_fault+0xa2/0x360
dec 16 02:05:46 fedora kernel:  ? do_user_addr_fault+0x30f/0x660
dec 16 02:05:46 fedora kernel:  ? exc_page_fault+0x7f/0x180
dec 16 02:05:46 fedora kernel:  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
dec 16 02:05:46 fedora kernel: RIP: 0033:0x7f3407cf883e
dec 16 02:05:46 fedora kernel: Code: 48 8b 0d f5 15 0c 00 f7 d8 64 89 01 48=
 83
c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 =
00
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c2 15 0c 00 f7 d8 64 89 0>
dec 16 02:05:46 fedora kernel: RSP: 002b:00007ffc38d5feb8 EFLAGS: 00000246
ORIG_RAX: 00000000000000af
dec 16 02:05:46 fedora kernel: RAX: ffffffffffffffda RBX: 000055f363361a50 =
RCX:
00007f3407cf883e
dec 16 02:05:46 fedora kernel: RDX: 00007f3407dfe07d RSI: 000000000180f306 =
RDI:
00007f3404974010
dec 16 02:05:46 fedora kernel: RBP: 00007ffc38d5ff70 R08: 000055f36332d010 =
R09:
0000000000000007
dec 16 02:05:46 fedora kernel: R10: 0000000000000004 R11: 0000000000000246 =
R12:
00007f3407dfe07d
dec 16 02:05:46 fedora kernel: R13: 0000000000020000 R14: 000055f36335a0c0 =
R15:
000055f36335bb00
dec 16 02:05:46 fedora kernel:  </TASK>
dec 16 02:05:46 fedora kernel: ---[ end trace 0000000000000000 ]---
dec 16 02:05:46 fedora kernel: ------------[ cut here ]------------
dec 16 02:05:46 fedora kernel: WARNING: CPU: 1 PID: 378 at
drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:615 amdgpu_irq_put+0x46/0x70 [amdgp=
u]
dec 16 02:05:46 fedora kernel: Modules linked in: amdgpu(+) drm_exec amdxcp
drm_buddy gpu_sched radeon crct10dif_pclmul crc32_pclmul crc32c_intel
polyval_clmulni polyval_generic sdhci_pci ghash_clmulni_intel drm_ttm_helper
cqh>
dec 16 02:05:46 fedora kernel: CPU: 1 PID: 378 Comm: (udev-worker) Tainted:=
 G=20=20
     W          6.6.7-201.fsync.fc39.x86_64 #1
dec 16 02:05:46 fedora kernel: Hardware name: Apple Inc.
iMac17,1/Mac-65CE76090165799A, BIOS 522.0.0.0.0 08/17/2023
dec 16 02:05:46 fedora kernel: RIP: 0010:amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel: Code: c0 74 33 48 8b 4e 10 48 83 39 00 74 29=
 89
d1 48 8d 04 88 8b 08 85 c9 74 11 f0 ff 08 74 07 31 c0 c3 cc cc cc cc e9 5a =
fd
ff ff <0f> 0b b8 ea ff ff ff c3 cc cc cc cc b8 ea ff ff ff c3 cc cc c>
dec 16 02:05:46 fedora kernel: RSP: 0018:ffffc900006dfac0 EFLAGS: 00010246
dec 16 02:05:46 fedora kernel: RAX: ffff88810bfa4c48 RBX: ffff888112a98de8 =
RCX:
0000000000000000
dec 16 02:05:46 fedora kernel: RDX: 0000000000000002 RSI: ffff888112aa79f0 =
RDI:
ffff888112a80000
dec 16 02:05:46 fedora kernel: RBP: ffff888112a90190 R08: 0000000000000000 =
R09:
00000000000390a0
dec 16 02:05:46 fedora kernel: R10: ffff8881106d7e00 R11: ffffffffa6346508 =
R12:
ffff888112a90568
dec 16 02:05:46 fedora kernel: R13: ffff888112a80010 R14: ffff888112a80000 =
R15:
ffff888112aa79f0
dec 16 02:05:46 fedora kernel: FS:  00007f340730d980(0000)
GS:ffff888656c80000(0000) knlGS:0000000000000000
dec 16 02:05:46 fedora kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
dec 16 02:05:46 fedora kernel: CR2: 00007f7319f9f000 CR3: 000000010e16a006 =
CR4:
00000000003706e0
dec 16 02:05:46 fedora kernel: DR0: 0000000000000000 DR1: 0000000000000000 =
DR2:
0000000000000000
dec 16 02:05:46 fedora kernel: DR3: 0000000000000000 DR6: 00000000fffe0ff0 =
DR7:
0000000000000400
dec 16 02:05:46 fedora kernel: Call Trace:
dec 16 02:05:46 fedora kernel:  <TASK>
dec 16 02:05:46 fedora kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel:  ? __warn+0x81/0x130
dec 16 02:05:46 fedora kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel:  ? report_bug+0x171/0x1a0
dec 16 02:05:46 fedora kernel:  ? handle_bug+0x3c/0x80
dec 16 02:05:46 fedora kernel:  ? exc_invalid_op+0x17/0x70
dec 16 02:05:46 fedora kernel:  ? asm_exc_invalid_op+0x1a/0x20
dec 16 02:05:46 fedora kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel:  amdgpu_fence_driver_hw_fini+0xfe/0x130 [amd=
gpu]
dec 16 02:05:46 fedora kernel:  amdgpu_device_fini_hw+0xa6/0x330 [amdgpu]
dec 16 02:05:46 fedora kernel:  ? blocking_notifier_chain_unregister+0x36/0=
x50
dec 16 02:05:46 fedora kernel:  amdgpu_driver_load_kms+0xec/0x190 [amdgpu]
dec 16 02:05:46 fedora kernel:  amdgpu_pci_probe+0x150/0x450 [amdgpu]
dec 16 02:05:46 fedora kernel:  local_pci_probe+0x42/0xa0
dec 16 02:05:46 fedora kernel:  pci_device_probe+0xc7/0x240
dec 16 02:05:46 fedora kernel:  really_probe+0x19b/0x3e0
dec 16 02:05:46 fedora kernel:  ? __pfx___driver_attach+0x10/0x10
dec 16 02:05:46 fedora kernel:  __driver_probe_device+0x78/0x160
dec 16 02:05:46 fedora kernel:  driver_probe_device+0x1f/0x90
dec 16 02:05:46 fedora kernel:  __driver_attach+0xd2/0x1c0
dec 16 02:05:46 fedora kernel:  bus_for_each_dev+0x85/0xd0
dec 16 02:05:46 fedora kernel:  bus_add_driver+0x116/0x220
dec 16 02:05:46 fedora kernel:  driver_register+0x59/0x100
dec 16 02:05:46 fedora kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
dec 16 02:05:46 fedora kernel:  do_one_initcall+0x5a/0x320
dec 16 02:05:46 fedora kernel:  do_init_module+0x60/0x240
dec 16 02:05:46 fedora kernel:  __do_sys_init_module+0x17f/0x1b0
dec 16 02:05:46 fedora kernel:  ? __seccomp_filter+0x32c/0x510
dec 16 02:05:46 fedora kernel:  do_syscall_64+0x5d/0x90
dec 16 02:05:46 fedora kernel:  ? __count_memcg_events+0x42/0x90
dec 16 02:05:46 fedora kernel:  ? count_memcg_events.constprop.0+0x1a/0x30
dec 16 02:05:46 fedora kernel:  ? handle_mm_fault+0xa2/0x360
dec 16 02:05:46 fedora kernel:  ? do_user_addr_fault+0x30f/0x660
dec 16 02:05:46 fedora kernel:  ? exc_page_fault+0x7f/0x180
dec 16 02:05:46 fedora kernel:  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
dec 16 02:05:46 fedora kernel: RIP: 0033:0x7f3407cf883e
dec 16 02:05:46 fedora kernel: Code: 48 8b 0d f5 15 0c 00 f7 d8 64 89 01 48=
 83
c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 =
00
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c2 15 0c 00 f7 d8 64 89 0>
dec 16 02:05:46 fedora kernel: RSP: 002b:00007ffc38d5feb8 EFLAGS: 00000246
ORIG_RAX: 00000000000000af
dec 16 02:05:46 fedora kernel: RAX: ffffffffffffffda RBX: 000055f363361a50 =
RCX:
00007f3407cf883e
dec 16 02:05:46 fedora kernel: RDX: 00007f3407dfe07d RSI: 000000000180f306 =
RDI:
00007f3404974010
dec 16 02:05:46 fedora kernel: RBP: 00007ffc38d5ff70 R08: 000055f36332d010 =
R09:
0000000000000007
dec 16 02:05:46 fedora kernel: R10: 0000000000000004 R11: 0000000000000246 =
R12:
00007f3407dfe07d
dec 16 02:05:46 fedora kernel: R13: 0000000000020000 R14: 000055f36335a0c0 =
R15:
000055f36335bb00
dec 16 02:05:46 fedora kernel:  </TASK>
dec 16 02:05:46 fedora kernel: ---[ end trace 0000000000000000 ]---
dec 16 02:05:46 fedora kernel: ------------[ cut here ]------------
dec 16 02:05:46 fedora kernel: WARNING: CPU: 1 PID: 378 at
drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:615 amdgpu_irq_put+0x46/0x70 [amdgp=
u]
dec 16 02:05:46 fedora kernel: Modules linked in: amdgpu(+) drm_exec amdxcp
drm_buddy gpu_sched radeon crct10dif_pclmul crc32_pclmul crc32c_intel
polyval_clmulni polyval_generic sdhci_pci ghash_clmulni_intel drm_ttm_helper
cqh>
dec 16 02:05:46 fedora kernel: CPU: 1 PID: 378 Comm: (udev-worker) Tainted:=
 G=20=20
     W          6.6.7-201.fsync.fc39.x86_64 #1
dec 16 02:05:46 fedora kernel: Hardware name: Apple Inc.
iMac17,1/Mac-65CE76090165799A, BIOS 522.0.0.0.0 08/17/2023
dec 16 02:05:46 fedora kernel: RIP: 0010:amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel: Code: c0 74 33 48 8b 4e 10 48 83 39 00 74 29=
 89
d1 48 8d 04 88 8b 08 85 c9 74 11 f0 ff 08 74 07 31 c0 c3 cc cc cc cc e9 5a =
fd
ff ff <0f> 0b b8 ea ff ff ff c3 cc cc cc cc b8 ea ff ff ff c3 cc cc c>
dec 16 02:05:46 fedora kernel: RSP: 0018:ffffc900006dfac0 EFLAGS: 00010246
dec 16 02:05:46 fedora kernel: RAX: ffff88810bfa4c48 RBX: ffff888112a99198 =
RCX:
0000000000000000
dec 16 02:05:46 fedora kernel: RDX: 0000000000000002 RSI: ffff888112aa79f0 =
RDI:
ffff888112a80000
dec 16 02:05:46 fedora kernel: RBP: ffff888112a90198 R08: 0000000000000000 =
R09:
00000000000390a0
dec 16 02:05:46 fedora kernel: R10: ffff8881106d7e00 R11: ffffffffa6346508 =
R12:
ffff888112a90568
dec 16 02:05:46 fedora kernel: R13: ffff888112a80010 R14: ffff888112a80000 =
R15:
ffff888112aa79f0
dec 16 02:05:46 fedora kernel: FS:  00007f340730d980(0000)
GS:ffff888656c80000(0000) knlGS:0000000000000000
dec 16 02:05:46 fedora kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
dec 16 02:05:46 fedora kernel: CR2: 00007f7319f9f000 CR3: 000000010e16a006 =
CR4:
00000000003706e0
dec 16 02:05:46 fedora kernel: DR0: 0000000000000000 DR1: 0000000000000000 =
DR2:
0000000000000000
dec 16 02:05:46 fedora kernel: DR3: 0000000000000000 DR6: 00000000fffe0ff0 =
DR7:
0000000000000400
dec 16 02:05:46 fedora kernel: Call Trace:
dec 16 02:05:46 fedora kernel:  <TASK>
dec 16 02:05:46 fedora kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel:  ? __warn+0x81/0x130
dec 16 02:05:46 fedora kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel:  ? report_bug+0x171/0x1a0
dec 16 02:05:46 fedora kernel:  ? handle_bug+0x3c/0x80
dec 16 02:05:46 fedora kernel:  ? exc_invalid_op+0x17/0x70
dec 16 02:05:46 fedora kernel:  ? asm_exc_invalid_op+0x1a/0x20
dec 16 02:05:46 fedora kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel:  amdgpu_fence_driver_hw_fini+0xfe/0x130 [amd=
gpu]
dec 16 02:05:46 fedora kernel:  amdgpu_device_fini_hw+0xa6/0x330 [amdgpu]
dec 16 02:05:46 fedora kernel:  ? blocking_notifier_chain_unregister+0x36/0=
x50
dec 16 02:05:46 fedora kernel:  amdgpu_driver_load_kms+0xec/0x190 [amdgpu]
dec 16 02:05:46 fedora kernel:  amdgpu_pci_probe+0x150/0x450 [amdgpu]
dec 16 02:05:46 fedora kernel:  local_pci_probe+0x42/0xa0
dec 16 02:05:46 fedora kernel:  pci_device_probe+0xc7/0x240
dec 16 02:05:46 fedora kernel:  really_probe+0x19b/0x3e0
dec 16 02:05:46 fedora kernel:  ? __pfx___driver_attach+0x10/0x10
dec 16 02:05:46 fedora kernel:  __driver_probe_device+0x78/0x160
dec 16 02:05:46 fedora kernel:  driver_probe_device+0x1f/0x90
dec 16 02:05:46 fedora kernel:  __driver_attach+0xd2/0x1c0
dec 16 02:05:46 fedora kernel:  bus_for_each_dev+0x85/0xd0
dec 16 02:05:46 fedora kernel:  bus_add_driver+0x116/0x220
dec 16 02:05:46 fedora kernel:  driver_register+0x59/0x100
dec 16 02:05:46 fedora kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
dec 16 02:05:46 fedora kernel:  do_one_initcall+0x5a/0x320
dec 16 02:05:46 fedora kernel:  do_init_module+0x60/0x240
dec 16 02:05:46 fedora kernel:  __do_sys_init_module+0x17f/0x1b0
dec 16 02:05:46 fedora kernel:  ? __seccomp_filter+0x32c/0x510
dec 16 02:05:46 fedora kernel:  do_syscall_64+0x5d/0x90
dec 16 02:05:46 fedora kernel:  ? __count_memcg_events+0x42/0x90
dec 16 02:05:46 fedora kernel:  ? count_memcg_events.constprop.0+0x1a/0x30
dec 16 02:05:46 fedora kernel:  ? handle_mm_fault+0xa2/0x360
dec 16 02:05:46 fedora kernel:  ? do_user_addr_fault+0x30f/0x660
dec 16 02:05:46 fedora kernel:  ? exc_page_fault+0x7f/0x180
dec 16 02:05:46 fedora kernel:  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
dec 16 02:05:46 fedora kernel: RIP: 0033:0x7f3407cf883e
dec 16 02:05:46 fedora kernel: Code: 48 8b 0d f5 15 0c 00 f7 d8 64 89 01 48=
 83
c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 =
00
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c2 15 0c 00 f7 d8 64 89 0>
dec 16 02:05:46 fedora kernel: RSP: 002b:00007ffc38d5feb8 EFLAGS: 00000246
ORIG_RAX: 00000000000000af
dec 16 02:05:46 fedora kernel: RAX: ffffffffffffffda RBX: 000055f363361a50 =
RCX:
00007f3407cf883e
dec 16 02:05:46 fedora kernel: RDX: 00007f3407dfe07d RSI: 000000000180f306 =
RDI:
00007f3404974010
dec 16 02:05:46 fedora kernel: RBP: 00007ffc38d5ff70 R08: 000055f36332d010 =
R09:
0000000000000007
dec 16 02:05:46 fedora kernel: R10: 0000000000000004 R11: 0000000000000246 =
R12:
00007f3407dfe07d
dec 16 02:05:46 fedora kernel: R13: 0000000000020000 R14: 000055f36335a0c0 =
R15:
000055f36335bb00
dec 16 02:05:46 fedora kernel:  </TASK>
dec 16 02:05:46 fedora kernel: ---[ end trace 0000000000000000 ]---
dec 16 02:05:46 fedora kernel: ------------[ cut here ]------------
dec 16 02:05:46 fedora kernel: WARNING: CPU: 1 PID: 378 at
drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:615 amdgpu_irq_put+0x46/0x70 [amdgp=
u]
dec 16 02:05:46 fedora kernel: Modules linked in: amdgpu(+) drm_exec amdxcp
drm_buddy gpu_sched radeon crct10dif_pclmul crc32_pclmul crc32c_intel
polyval_clmulni polyval_generic sdhci_pci ghash_clmulni_intel drm_ttm_helper
cqh>
dec 16 02:05:46 fedora kernel: CPU: 1 PID: 378 Comm: (udev-worker) Tainted:=
 G=20=20
     W          6.6.7-201.fsync.fc39.x86_64 #1
dec 16 02:05:46 fedora kernel: Hardware name: Apple Inc.
iMac17,1/Mac-65CE76090165799A, BIOS 522.0.0.0.0 08/17/2023
dec 16 02:05:46 fedora kernel: RIP: 0010:amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel: Code: c0 74 33 48 8b 4e 10 48 83 39 00 74 29=
 89
d1 48 8d 04 88 8b 08 85 c9 74 11 f0 ff 08 74 07 31 c0 c3 cc cc cc cc e9 5a =
fd
ff ff <0f> 0b b8 ea ff ff ff c3 cc cc cc cc b8 ea ff ff ff c3 cc cc c>
dec 16 02:05:46 fedora kernel: RSP: 0018:ffffc900006dfac0 EFLAGS: 00010246
dec 16 02:05:46 fedora kernel: RAX: ffff88810bfa4c48 RBX: ffff888112a99548 =
RCX:
0000000000000000
dec 16 02:05:46 fedora kernel: RDX: 0000000000000002 RSI: ffff888112aa79f0 =
RDI:
ffff888112a80000
dec 16 02:05:46 fedora kernel: RBP: ffff888112a901a0 R08: 0000000000000000 =
R09:
00000000000390a0
dec 16 02:05:46 fedora kernel: R10: ffff8881106d7e00 R11: ffffffffa6346508 =
R12:
ffff888112a90568
dec 16 02:05:46 fedora kernel: R13: ffff888112a80010 R14: ffff888112a80000 =
R15:
ffff888112aa79f0
dec 16 02:05:46 fedora kernel: FS:  00007f340730d980(0000)
GS:ffff888656c80000(0000) knlGS:0000000000000000
dec 16 02:05:46 fedora kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
dec 16 02:05:46 fedora kernel: CR2: 00007f7319f9f000 CR3: 000000010e16a006 =
CR4:
00000000003706e0
dec 16 02:05:46 fedora kernel: DR0: 0000000000000000 DR1: 0000000000000000 =
DR2:
0000000000000000
dec 16 02:05:46 fedora kernel: DR3: 0000000000000000 DR6: 00000000fffe0ff0 =
DR7:
0000000000000400
dec 16 02:05:46 fedora kernel: Call Trace:
dec 16 02:05:46 fedora kernel:  <TASK>
dec 16 02:05:46 fedora kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel:  ? __warn+0x81/0x130
dec 16 02:05:46 fedora kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel:  ? report_bug+0x171/0x1a0
dec 16 02:05:46 fedora kernel:  ? handle_bug+0x3c/0x80
dec 16 02:05:46 fedora kernel:  ? exc_invalid_op+0x17/0x70
dec 16 02:05:46 fedora kernel:  ? asm_exc_invalid_op+0x1a/0x20
dec 16 02:05:46 fedora kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel:  amdgpu_fence_driver_hw_fini+0xfe/0x130 [amd=
gpu]
dec 16 02:05:46 fedora kernel:  amdgpu_device_fini_hw+0xa6/0x330 [amdgpu]
dec 16 02:05:46 fedora kernel:  ? blocking_notifier_chain_unregister+0x36/0=
x50
dec 16 02:05:46 fedora kernel:  amdgpu_driver_load_kms+0xec/0x190 [amdgpu]
dec 16 02:05:46 fedora kernel:  amdgpu_pci_probe+0x150/0x450 [amdgpu]
dec 16 02:05:46 fedora kernel:  local_pci_probe+0x42/0xa0
dec 16 02:05:46 fedora kernel:  pci_device_probe+0xc7/0x240
dec 16 02:05:46 fedora kernel:  really_probe+0x19b/0x3e0
dec 16 02:05:46 fedora kernel:  ? __pfx___driver_attach+0x10/0x10
dec 16 02:05:46 fedora kernel:  __driver_probe_device+0x78/0x160
dec 16 02:05:46 fedora kernel:  driver_probe_device+0x1f/0x90
dec 16 02:05:46 fedora kernel:  __driver_attach+0xd2/0x1c0
dec 16 02:05:46 fedora kernel:  bus_for_each_dev+0x85/0xd0
dec 16 02:05:46 fedora kernel:  bus_add_driver+0x116/0x220
dec 16 02:05:46 fedora kernel:  driver_register+0x59/0x100
dec 16 02:05:46 fedora kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
dec 16 02:05:46 fedora kernel:  do_one_initcall+0x5a/0x320
dec 16 02:05:46 fedora kernel:  do_init_module+0x60/0x240
dec 16 02:05:46 fedora kernel:  __do_sys_init_module+0x17f/0x1b0
dec 16 02:05:46 fedora kernel:  ? __seccomp_filter+0x32c/0x510
dec 16 02:05:46 fedora kernel:  do_syscall_64+0x5d/0x90
dec 16 02:05:46 fedora kernel:  ? __count_memcg_events+0x42/0x90
dec 16 02:05:46 fedora kernel:  ? count_memcg_events.constprop.0+0x1a/0x30
dec 16 02:05:46 fedora kernel:  ? handle_mm_fault+0xa2/0x360
dec 16 02:05:46 fedora kernel:  ? do_user_addr_fault+0x30f/0x660
dec 16 02:05:46 fedora kernel:  ? exc_page_fault+0x7f/0x180
dec 16 02:05:46 fedora kernel:  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
dec 16 02:05:46 fedora kernel: RIP: 0033:0x7f3407cf883e
dec 16 02:05:46 fedora kernel: Code: 48 8b 0d f5 15 0c 00 f7 d8 64 89 01 48=
 83
c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 =
00
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c2 15 0c 00 f7 d8 64 89 0>
dec 16 02:05:46 fedora kernel: RSP: 002b:00007ffc38d5feb8 EFLAGS: 00000246
ORIG_RAX: 00000000000000af
dec 16 02:05:46 fedora kernel: RAX: ffffffffffffffda RBX: 000055f363361a50 =
RCX:
00007f3407cf883e
dec 16 02:05:46 fedora kernel: RDX: 00007f3407dfe07d RSI: 000000000180f306 =
RDI:
00007f3404974010
dec 16 02:05:46 fedora kernel: RBP: 00007ffc38d5ff70 R08: 000055f36332d010 =
R09:
0000000000000007
dec 16 02:05:46 fedora kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel:  amdgpu_fence_driver_hw_fini+0xfe/0x130 [amd=
gpu]
dec 16 02:05:46 fedora kernel:  amdgpu_device_fini_hw+0xa6/0x330 [amdgpu]
dec 16 02:05:46 fedora kernel:  ? blocking_notifier_chain_unregister+0x36/0=
x50
dec 16 02:05:46 fedora kernel:  amdgpu_driver_load_kms+0xec/0x190 [amdgpu]
dec 16 02:05:46 fedora kernel:  amdgpu_pci_probe+0x150/0x450 [amdgpu]
dec 16 02:05:46 fedora kernel:  local_pci_probe+0x42/0xa0
dec 16 02:05:46 fedora kernel:  pci_device_probe+0xc7/0x240
dec 16 02:05:46 fedora kernel:  really_probe+0x19b/0x3e0
dec 16 02:05:46 fedora kernel:  ? __pfx___driver_attach+0x10/0x10
dec 16 02:05:46 fedora kernel:  __driver_probe_device+0x78/0x160
dec 16 02:05:46 fedora kernel:  driver_probe_device+0x1f/0x90
dec 16 02:05:46 fedora kernel:  __driver_attach+0xd2/0x1c0
dec 16 02:05:46 fedora kernel:  bus_for_each_dev+0x85/0xd0
dec 16 02:05:46 fedora kernel:  bus_add_driver+0x116/0x220
dec 16 02:05:46 fedora kernel:  driver_register+0x59/0x100
dec 16 02:05:46 fedora kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
dec 16 02:05:46 fedora kernel:  do_one_initcall+0x5a/0x320
dec 16 02:05:46 fedora kernel:  do_init_module+0x60/0x240
dec 16 02:05:46 fedora kernel:  __do_sys_init_module+0x17f/0x1b0
dec 16 02:05:46 fedora kernel:  ? __seccomp_filter+0x32c/0x510
dec 16 02:05:46 fedora kernel:  do_syscall_64+0x5d/0x90
dec 16 02:05:46 fedora kernel:  ? __count_memcg_events+0x42/0x90
dec 16 02:05:46 fedora kernel:  ? count_memcg_events.constprop.0+0x1a/0x30
dec 16 02:05:46 fedora kernel:  ? handle_mm_fault+0xa2/0x360
dec 16 02:05:46 fedora kernel:  ? do_user_addr_fault+0x30f/0x660
dec 16 02:05:46 fedora kernel:  ? exc_page_fault+0x7f/0x180
dec 16 02:05:46 fedora kernel:  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
dec 16 02:05:46 fedora kernel: RIP: 0033:0x7f3407cf883e
dec 16 02:05:46 fedora kernel: Code: 48 8b 0d f5 15 0c 00 f7 d8 64 89 01 48=
 83
c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 =
00
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c2 15 0c 00 f7 d8 64 89 0>
dec 16 02:05:46 fedora kernel: RSP: 002b:00007ffc38d5feb8 EFLAGS: 00000246
ORIG_RAX: 00000000000000af
dec 16 02:05:46 fedora kernel: RAX: ffffffffffffffda RBX: 000055f363361a50 =
RCX:
00007f3407cf883e
dec 16 02:05:46 fedora kernel: RDX: 00007f3407dfe07d RSI: 000000000180f306 =
RDI:
00007f3404974010
dec 16 02:05:46 fedora kernel: RBP: 00007ffc38d5ff70 R08: 000055f36332d010 =
R09:
0000000000000007
dec 16 02:05:46 fedora kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel:  amdgpu_fence_driver_hw_fini+0xfe/0x130 [amd=
gpu]
dec 16 02:05:46 fedora kernel:  amdgpu_device_fini_hw+0xa6/0x330 [amdgpu]
dec 16 02:05:46 fedora kernel:  ? blocking_notifier_chain_unregister+0x36/0=
x50
dec 16 02:05:46 fedora kernel:  amdgpu_driver_load_kms+0xec/0x190 [amdgpu]
dec 16 02:05:46 fedora kernel:  amdgpu_pci_probe+0x150/0x450 [amdgpu]
dec 16 02:05:46 fedora kernel:  local_pci_probe+0x42/0xa0
dec 16 02:05:46 fedora kernel:  pci_device_probe+0xc7/0x240
dec 16 02:05:46 fedora kernel:  really_probe+0x19b/0x3e0
dec 16 02:05:46 fedora kernel:  ? __pfx___driver_attach+0x10/0x10
dec 16 02:05:46 fedora kernel:  __driver_probe_device+0x78/0x160
dec 16 02:05:46 fedora kernel:  driver_probe_device+0x1f/0x90
dec 16 02:05:46 fedora kernel:  __driver_attach+0xd2/0x1c0
dec 16 02:05:46 fedora kernel:  bus_for_each_dev+0x85/0xd0
dec 16 02:05:46 fedora kernel:  bus_add_driver+0x116/0x220
dec 16 02:05:46 fedora kernel:  driver_register+0x59/0x100
dec 16 02:05:46 fedora kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
dec 16 02:05:46 fedora kernel:  do_one_initcall+0x5a/0x320
dec 16 02:05:46 fedora kernel:  do_init_module+0x60/0x240
dec 16 02:05:46 fedora kernel:  __do_sys_init_module+0x17f/0x1b0
dec 16 02:05:46 fedora kernel:  ? __seccomp_filter+0x32c/0x510
dec 16 02:05:46 fedora kernel:  do_syscall_64+0x5d/0x90
dec 16 02:05:46 fedora kernel:  ? __count_memcg_events+0x42/0x90
dec 16 02:05:46 fedora kernel:  ? count_memcg_events.constprop.0+0x1a/0x30
dec 16 02:05:46 fedora kernel:  ? handle_mm_fault+0xa2/0x360
dec 16 02:05:46 fedora kernel:  ? do_user_addr_fault+0x30f/0x660
dec 16 02:05:46 fedora kernel:  ? exc_page_fault+0x7f/0x180
dec 16 02:05:46 fedora kernel:  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
dec 16 02:05:46 fedora kernel: RIP: 0033:0x7f3407cf883e
dec 16 02:05:46 fedora kernel: Code: 48 8b 0d f5 15 0c 00 f7 d8 64 89 01 48=
 83
c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 =
00
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c2 15 0c 00 f7 d8 64 89 0>
dec 16 02:05:46 fedora kernel: RSP: 002b:00007ffc38d5feb8 EFLAGS: 00000246
ORIG_RAX: 00000000000000af
dec 16 02:05:46 fedora kernel: RAX: ffffffffffffffda RBX: 000055f363361a50 =
RCX:
00007f3407cf883e
dec 16 02:05:46 fedora kernel: RDX: 00007f3407dfe07d RSI: 000000000180f306 =
RDI:
00007f3404974010
dec 16 02:05:46 fedora kernel: RBP: 00007ffc38d5ff70 R08: 000055f36332d010 =
R09:
0000000000000007
dec 16 02:05:46 fedora kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:05:46 fedora kernel:  amdgpu_fence_driver_hw_fini+0xfe/0x130 [amd=
gpu]
dec 16 02:05:46 fedora kernel:  amdgpu_device_fini_hw+0xa6/0x330 [amdgpu]
dec 16 02:05:46 fedora kernel:  ? blocking_notifier_chain_unregister+0x36/0=
x50
dec 16 02:05:46 fedora kernel:  amdgpu_driver_load_kms+0xec/0x190 [amdgpu]
dec 16 02:05:46 fedora kernel:  amdgpu_pci_probe+0x150/0x450 [amdgpu]
dec 16 02:05:46 fedora kernel:  local_pci_probe+0x42/0xa0
dec 16 02:05:46 fedora kernel:  pci_device_probe+0xc7/0x240
dec 16 02:05:46 fedora kernel:  really_probe+0x19b/0x3e0
dec 16 02:05:46 fedora kernel:  ? __pfx___driver_attach+0x10/0x10
dec 16 02:05:46 fedora kernel:  __driver_probe_device+0x78/0x160
dec 16 02:05:46 fedora kernel:  driver_probe_device+0x1f/0x90
dec 16 02:05:46 fedora kernel:  __driver_attach+0xd2/0x1c0
dec 16 02:05:46 fedora kernel:  bus_for_each_dev+0x85/0xd0
dec 16 02:05:46 fedora kernel:  bus_add_driver+0x116/0x220
dec 16 02:05:46 fedora kernel:  driver_register+0x59/0x100
dec 16 02:05:46 fedora kernel:  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
dec 16 02:05:46 fedora kernel:  do_one_initcall+0x5a/0x320
dec 16 02:05:46 fedora kernel:  do_init_module+0x60/0x240
dec 16 02:05:46 fedora kernel:  __do_sys_init_module+0x17f/0x1b0
dec 16 02:05:46 fedora kernel:  ? __seccomp_filter+0x32c/0x510
dec 16 02:05:46 fedora kernel:  do_syscall_64+0x5d/0x90
dec 16 02:05:46 fedora kernel:  ? __count_memcg_events+0x42/0x90
dec 16 02:05:46 fedora kernel:  ? count_memcg_events.constprop.0+0x1a/0x30
dec 16 02:05:46 fedora kernel:  ? handle_mm_fault+0xa2/0x360
dec 16 02:05:46 fedora kernel:  ? do_user_addr_fault+0x30f/0x660
dec 16 02:05:46 fedora kernel:  ? exc_page_fault+0x7f/0x180
dec 16 02:05:46 fedora kernel:  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
dec 16 02:05:46 fedora kernel: RIP: 0033:0x7f3407cf883e
dec 16 02:05:46 fedora kernel: Code: 48 8b 0d f5 15 0c 00 f7 d8 64 89 01 48=
 83
c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 =
00
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c2 15 0c 00 f7 d8 64 89 0>
dec 16 02:05:46 fedora kernel: RSP: 002b:00007ffc38d5feb8 EFLAGS: 00000246
ORIG_RAX: 00000000000000af
dec 16 02:05:46 fedora kernel: RAX: ffffffffffffffda RBX: 000055f363361a50 =
RCX:
00007f3407cf883e
dec 16 02:05:46 fedora kernel: RDX: 00007f3407dfe07d RSI: 000000000180f306 =
RDI:
00007f3404974010
dec 16 02:05:46 fedora kernel: RBP: 00007ffc38d5ff70 R08: 000055f36332d010 =
R09:
0000000000000007
------------------------------------------------------------
dec 16 02:05:46 fedora kernel: RSP: 002b:00007ffc38d5feb8 EFLAGS: 00000246
ORIG_RAX: 00000000000000af
dec 16 02:05:46 fedora kernel: RAX: ffffffffffffffda RBX: 000055f363361a50 =
RCX:
00007f3407cf883e
dec 16 02:05:46 fedora kernel: RDX: 00007f3407dfe07d RSI: 000000000180f306 =
RDI:
00007f3404974010
dec 16 02:05:46 fedora kernel: RBP: 00007ffc38d5ff70 R08: 000055f36332d010 =
R09:
0000000000000007
dec 16 02:05:46 fedora kernel: R10: 0000000000000004 R11: 0000000000000246 =
R12:
00007f3407dfe07d
dec 16 02:05:46 fedora kernel: R13: 0000000000020000 R14: 000055f36335a0c0 =
R15:
000055f36335bb00
dec 16 02:05:46 fedora kernel:  </TASK>
dec 16 02:05:46 fedora kernel: ---[ end trace 0000000000000000 ]---
dec 16 02:05:47 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 133 ret is 0
dec 16 02:05:49 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 145 ret is 0
dec 16 02:05:51 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 155 ret is 0
dec 16 02:05:52 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 146 ret is 0
dec 16 02:05:54 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 16a ret is 0
dec 16 02:05:56 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 186 ret is 0
dec 16 02:05:57 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 54 ret is 0
dec 16 02:05:59 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 14f ret is 0
dec 16 02:06:01 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 151 ret is 0
dec 16 02:06:02 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 135 ret is 0
dec 16 02:06:04 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 190 ret is 0
dec 16 02:06:06 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 63 ret is 0
dec 16 02:06:07 fedora kernel: amdgpu 0000:01:00.0: amdgpu: failed to send
message 84 ret is 0
dec 16 02:06:07 fedora kernel: ------------[ cut here ]------------
dec 16 02:06:07 fedora kernel: WARNING: CPU: 0 PID: 378 at
drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:615 amdgpu_irq_put+0x46/0x70 [amdgp=
u]
dec 16 02:06:07 fedora kernel: Modules linked in: amdgpu(+) drm_exec amdxcp
drm_buddy gpu_sched radeon crct10dif_pclmul crc32_pclmul crc32c_intel
polyval_clmulni polyval_generic sdhci_pci ghash_clmulni_intel drm_ttm_helper
cqh>
dec 16 02:06:07 fedora kernel: CPU: 0 PID: 378 Comm: (udev-worker) Tainted:=
 G=20=20
     W          6.6.7-201.fsync.fc39.x86_64 #1
dec 16 02:06:07 fedora kernel: Hardware name: Apple Inc.
iMac17,1/Mac-65CE76090165799A, BIOS 522.0.0.0.0 08/17/2023
dec 16 02:06:07 fedora kernel: RIP: 0010:amdgpu_irq_put+0x46/0x70 [amdgpu]
dec 16 02:06:07 fedora kernel: Code: c0 74 33 48 8b 4e 10 48 83 39 00 74 29=
 89
d1 48 8d 04 88 8b 08 85 c9 74 11 f0 ff 08 74 07 31 c0 c3 cc cc cc cc e9 5a =
fd
ff ff <0f> 0b b8 ea ff ff ff c3 cc cc cc cc b8 ea ff ff ff c3 cc cc c>
dec 16 02:06:07 fedora kernel: RSP: 0018:ffffc900006dfad0 EFLAGS: 00010246
dec 16 02:06:07 fedora kernel: RAX: ffff888116fbbe24 RBX: ffff888112a80000 =
RCX:
0000000000000000
dec 16 02:06:07 fedora kernel: RDX: 0000000000000001 RSI: ffff888112a90130 =
RDI:
ffff888112a80000
dec 16 02:06:07 fedora kernel: RBP: ffff888112a1a000 R08: ffff888112a80280 =
R09:
0000000000039140
dec 16 02:06:07 fedora kernel: R10: ffff888100e77f00 R11: ffffffffa6346508 =
R12:
ffff888112a90130
dec 16 02:06:07 fedora kernel: R13: ffff888112ac1552 R14: 0000000000010005 =
R15:
00000000ffffff00

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
