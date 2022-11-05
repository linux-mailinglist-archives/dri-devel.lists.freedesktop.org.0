Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB1861DF34
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 23:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505E610E178;
	Sat,  5 Nov 2022 22:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E5D10E178
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Nov 2022 22:55:04 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id q127so7508473vsa.7
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Nov 2022 15:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ausil.us; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=21A4QRXLRQBgJ6yNfM3JMOswDtZhyZG4otH4qiGzB0k=;
 b=Ko3AA2xDrD/h6jspqyl+bHR+XX8XSXm8lgs6j4GcujuxER7OUUgWcGWNGwKeny0MsL
 OOE5LrW44NHW/3TGW2UBpIePF54uhWTeBUDyw6gZF25e3TCU8iu+JvW5y0sdeOSGyAbo
 /EXM4evBKEm6npv/PB+1cz+SK7yMiZSE6o+4hUYbh3F9ce2hXlmEpG3ICaDjjeyynHI9
 U4COrWotoAoZ1iq3iS+N5HNuhtcbwBNyp6NgrgzQpGrsCqkMeKeYOzP/XUTi7aZlrc8E
 +jYXTF4LB8z4D51lupOqws7PovEI6okslNm4ISD+2OvbvXvM6NcOlf8SMDRMz4uEfm47
 MGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=21A4QRXLRQBgJ6yNfM3JMOswDtZhyZG4otH4qiGzB0k=;
 b=z695VcP2aYBL4XpZN5F+hs2rtTR28bPmTiEPGjZklwqOA0KQ5YzUxgMT/EQYvfQwHO
 9F1cq6Ue5v7HlVcqJ6lJ2k5DBOfwQChIf388XzEPvV+el04rq50DfWkI/oErJvMgKnM/
 H/voH8wBTiA6SbPjrDsPy2oMeOYO1DBs/QChrBctS5/92WrRu6Rl31yig8e8prTe71ke
 Mrvsi5AvIawLHaahEKNuFP7+8yzK6DtPADvCGJmMyBmov5J9iKJfp0VRI8174M3d3S2F
 2/Y/McSlvjVpHmnMwrIzkAI7bqpawKOFVNnih8RWYbfNl1Iol4I3lOCjP/LQgM5JTK30
 FLZA==
X-Gm-Message-State: ACrzQf1HhY8aEOnaHCrehJZNtxxsg0FoM1nBo9o42ehq09MQxUujvv8a
 fy5BrBo4HUCs1EpioYc1AYnqUBkciafxns/pApFt5BlUOXvCM/3LHck=
X-Google-Smtp-Source: AMsMyM6Prkc50n9UvDdcIpRVzvafbKuPdhuzfv/tsYRLR+2rREL/0O9gurwwINFZIYSMgs+Ok3XZ83fEtMZXxnS7bOA=
X-Received: by 2002:a05:6102:7a7:b0:3ac:fcc6:1b06 with SMTP id
 x7-20020a05610207a700b003acfcc61b06mr17048924vsg.55.1667688902396; Sat, 05
 Nov 2022 15:55:02 -0700 (PDT)
MIME-Version: 1.0
From: Dennis Gilmore <dennis@ausil.us>
Date: Sat, 5 Nov 2022 17:54:51 -0500
Message-ID: <CAABkxwtEi_8=QsBYqiNU5KHrF8pf6nPzX54v2KB9x7LvWYs2sQ@mail.gmail.com>
Subject: bug report with amdgpu drm-next-6.2
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

I have an Ampere Altra machine that I have put a Radeon 6500 XT card
on seeing the pull request for drm-next-6.2
https://lore.kernel.org/dri-devel/20221104205827.6008-1-alexander.deucher@amd.com/
I grabbed the tree and built it.  On boot I am getting

[   23.877255] [drm] amdgpu kernel modesetting enabled.
[   23.883774] amdgpu: CRAT table disabled by module option
[   23.889530] amdgpu: IO link not available for non x86 platforms
[   23.890039] ixgbe 0005:01:00.1 enP5p1s0f1: renamed from eth1
[   23.895485] amdgpu: Virtual CRAT table created for CPU
[   23.907170] amdgpu: Topology: Add CPU node
[   23.913989] amdgpu 000d:03:00.0: Adding to iommu group 23
[   23.923394] [drm] initializing kernel modesetting (BEIGE_GOBY
0x1002:0x743F 0x1EAE:0x6401 0xC1).
[   23.932333] [drm] register mmio base: 0x50000000
[   23.937023] [drm] register mmio size: 1048576
[   23.948575] [drm] add ip block number 0 <nv_common>
[   23.953520] [drm] add ip block number 1 <gmc_v10_0>
[   23.958431] [drm] add ip block number 2 <navi10_ih>
[   23.963367] [drm] add ip block number 3 <psp>
[   23.967754] [drm] add ip block number 4 <smu>
[   23.972142] [drm] add ip block number 5 <dm>
[   23.976462] [drm] add ip block number 6 <gfx_v10_0>
[   23.981373] [drm] add ip block number 7 <sdma_v5_2>
[   23.986302] [drm] add ip block number 8 <vcn_v3_0>
[   23.991265] amdgpu 000d:03:00.0: amdgpu: Fetched VBIOS from VFCT
[   23.997342] amdgpu: ATOM BIOS: 113-24X46SHB1-D02
[   24.002011] [drm] VCN(0) decode is enabled in VM mode
[   24.007118] amdgpu 000d:03:00.0: amdgpu: Trusted Memory Zone (TMZ)
feature disabled as experimental (default)
[   24.017125] amdgpu 000d:03:00.0: amdgpu: PCIE atomic ops is not supported
[   24.026314] [drm] vm size is 262144 GB, 4 levels, block size is
9-bit, fragment size is 9-bit
[   24.034973] amdgpu 000d:03:00.0: BAR 2: releasing [mem
0x340010000000-0x3400101fffff 64bit pref]
[   24.043843] amdgpu 000d:03:00.0: BAR 0: releasing [mem
0x340000000000-0x34000fffffff 64bit pref]
[   24.054541] pcieport 000d:02:00.0: BAR 15: releasing [mem
0x340000000000-0x340017ffffff 64bit pref]
[   24.063994] pcieport 000d:01:00.0: BAR 15: releasing [mem
0x340000000000-0x340017ffffff 64bit pref]
[   24.073130] pcieport 000d:00:01.0: BAR 15: releasing [mem
0x340000000000-0x340017ffffff 64bit pref]
[   24.082245] pcieport 000d:00:01.0: bridge window [io
0x1000-0x0fff] to [bus 01-03] add_size 1000
[   24.091333] pcieport 000d:00:01.0: BAR 15: assigned [mem
0x340000000000-0x34017fffffff 64bit pref]
[   24.100395] pcieport 000d:00:01.0: BAR 13: no space for [io  size 0x1000]
[   24.107255] pcieport 000d:00:01.0: BAR 13: failed to assign [io  size 0x1000]
[   24.114472] pcieport 000d:00:01.0: BAR 13: no space for [io  size 0x1000]
[   24.121308] pcieport 000d:00:01.0: BAR 13: failed to assign [io  size 0x1000]
[   24.128523] pcieport 000d:01:00.0: BAR 15: assigned [mem
0x340000000000-0x34017fffffff 64bit pref]
[   24.137599] pcieport 000d:02:00.0: BAR 15: assigned [mem
0x340000000000-0x34017fffffff 64bit pref]
[   24.146660] amdgpu 000d:03:00.0: BAR 0: assigned [mem
0x340000000000-0x3400ffffffff 64bit pref]
[   24.155457] amdgpu 000d:03:00.0: BAR 2: assigned [mem
0x340100000000-0x3401001fffff 64bit pref]
[   24.164244] pcieport 000d:00:01.0: PCI bridge to [bus 01-03]
[   24.169950] pcieport 000d:00:01.0:   bridge window [mem
0x50000000-0x502fffff]
[   24.177242] pcieport 000d:00:01.0:   bridge window [mem
0x340000000000-0x34017fffffff 64bit pref]
[   24.187449] pcieport 000d:01:00.0: PCI bridge to [bus 02-03]
[   24.194289] pcieport 000d:01:00.0:   bridge window [mem
0x50000000-0x501fffff]
[   24.204225] pcieport 000d:01:00.0:   bridge window [mem
0x340000000000-0x34017fffffff 64bit pref]
[   24.214216] pcieport 000d:02:00.0: PCI bridge to [bus 03]
[   24.220666] pcieport 000d:02:00.0:   bridge window [mem
0x50000000-0x501fffff]
[   24.228944] pcieport 000d:02:00.0:   bridge window [mem
0x340000000000-0x34017fffffff 64bit pref]
[   24.238884] amdgpu 000d:03:00.0: amdgpu: VRAM: 4080M
0x0000008000000000 - 0x00000080FEFFFFFF (4080M used)
[   24.249475] amdgpu 000d:03:00.0: amdgpu: GART: 512M
0x0000000000000000 - 0x000000001FFFFFFF
[   24.258839] amdgpu 000d:03:00.0: amdgpu: AGP: 267894784M
0x0000008400000000 - 0x0000FFFFFFFFFFFF
[   24.268646] [drm] Detected VRAM RAM=4080M, BAR=4096M
[   24.274620] [drm] RAM width 64bits GDDR6
[   24.326191] [drm] amdgpu: 4080M of VRAM memory ready
[   24.332137] [drm] amdgpu: 31878M of GTT memory ready.
[   24.338485] [drm] GART: num cpu pages 131072, num gpu pages 131072
[   24.346101] [drm] PCIE GART of 512M enabled (table at 0x0000008000300000).
[   24.431009] amdgpu 000d:03:00.0: amdgpu: PSP runtime database doesn't exist
[   24.439084] amdgpu 000d:03:00.0: amdgpu: PSP runtime database doesn't exist
[   24.681141] ixgbe 0005:01:00.0: registered PHC device on enP5p1s0f0
[   24.888758] ixgbe 0005:01:00.0 enP5p1s0f0: detected SFP+: 5
[   25.042801] ixgbe 0005:01:00.0 enP5p1s0f0: NIC Link is Up 10 Gbps,
Flow Control: RX/TX
[   25.516179] ixgbe 0005:01:00.1: registered PHC device on enP5p1s0f1
[   25.718747] ixgbe 0005:01:00.1 enP5p1s0f1: detected SFP+: 6
[   25.872810] ixgbe 0005:01:00.1 enP5p1s0f1: NIC Link is Up 10 Gbps,
Flow Control: RX/TX
[   26.422200] IPv6: ADDRCONF(NETDEV_CHANGE): enP5p1s0f0: link becomes ready
[   26.501022] IPv6: ADDRCONF(NETDEV_CHANGE): enP5p1s0f1: link becomes ready
[   26.554181] br0: port 1(enP5p1s0f1) entered blocking state
[   26.560834] br0: port 1(enP5p1s0f1) entered disabled state
[   26.561733] amdgpu 000d:03:00.0: amdgpu: STB initialized to 2048 entries
[   26.580331] device enP5p1s0f1 entered promiscuous mode
[   26.586637] audit: type=1700 audit(1667665332.890:21):
dev=enP5p1s0f1 prom=256 old_prom=0 auid=4294967295 uid=0 gid=0
ses=4294967295
[   26.590559] br0: port 1(enP5p1s0f1) entered blocking state
[   26.606149] br0: port 1(enP5p1s0f1) entered listening state
[   26.623013] audit: type=1300 audit(1667665332.890:21):
arch=c00000b7 syscall=211 success=yes exit=40 a0=d a1=fffff4030ef0
a2=0 a3=0 items=0 ppid=1 pid=1022 auid=4294967295 uid=0 gid=0 euid=0
suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295
comm="NetworkManager" exe="/usr/sbin/NetworkManager" subj=kernel
key=(null)
[   26.634704] [drm] Loading DMUB firmware via PSP: version=0x02020013
[   26.652070] audit: type=1327 audit(1667665332.890:21):
proctitle=2F7573722F7362696E2F
4E6574776F726B4D616E6167657200
2D2D6465627567
[   26.787231] [drm] use_doorbell being set to: [true]
[   26.874022] [drm] Found VCN firmware Version ENC: 1.24 DEC: 2 VEP:
0 Revision: 0
[   26.882692] amdgpu 000d:03:00.0: amdgpu: Will use PSP to load VCN firmware
[   27.005497] [drm] reserve 0xa00000 from 0x8001000000 for PSP TMR
[   27.166769] amdgpu 000d:03:00.0: amdgpu: RAS: optional ras ta ucode
is not available
[   27.213836] amdgpu 000d:03:00.0: amdgpu: SECUREDISPLAY:
securedisplay ta ucode is not available
[   27.223838] amdgpu 000d:03:00.0: amdgpu: smu driver if version =
0x0000000d, smu fw if version = 0x0000000f, smu fw program = 0,
version = 0x00491c00 (73.28.0)
[   27.239284] amdgpu 000d:03:00.0: amdgpu: SMU driver if version not matched
[   27.247346] amdgpu 000d:03:00.0: amdgpu: use vbios provided pptable
[   27.306402] amdgpu 000d:03:00.0: amdgpu: SMU is initialized successfully!
[   27.316825] [drm] Display Core initialized with v3.2.207!
[   27.324625] [drm] DMUB hardware initialized: version=0x02020013
[   27.751598] [drm] kiq ring mec 2 pipe 1 q 0
[   28.087911] amdgpu 000d:03:00.0: [drm:amdgpu_ring_test_helper
[amdgpu]] *ERROR* ring kiq_2.1.0 test failed (-110)
[   28.099959] [drm:amdgpu_gfx_enable_kcq [amdgpu]] *ERROR* KCQ enable failed
[   28.108490] [drm:amdgpu_device_ip_init [amdgpu]] *ERROR* hw_init of
IP block <gfx_v10_0> failed -110
[   28.119290] amdgpu 000d:03:00.0: amdgpu: amdgpu_device_ip_init failed
[   28.126875] amdgpu 000d:03:00.0: amdgpu: Fatal error during GPU init
[   28.134482] amdgpu 000d:03:00.0: amdgpu: amdgpu: finishing device.
[   28.144167] [drm] DSC precompute is not needed.
[   28.203259] amdgpu 000d:03:00.0: amdgpu: free PSP TMR buffer
[   29.522686] amdgpu: probe of 000d:03:00.0 failed with error -110
[   29.533000] INFO: trying to register non-static key.
[   29.539074] The code is fine but needs lockdep annotation, or maybe
[   29.546370] you didn't initialize this object before use?
[   29.552748] turning off the locking correctness validator.
[   29.559182] CPU: 27 PID: 926 Comm: systemd-udevd Not tainted
6.1.0-0.rc1.20221018gitbb1a1146467a.16.fc38.aarch64 #1
[   29.570673] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   29.584253] Call trace:
[   29.587659]  dump_backtrace+0xe8/0x140
[   29.592382]  show_stack+0x20/0x50
[   29.596699]  dump_stack_lvl+0x88/0xb4
[   29.601332]  dump_stack+0x18/0x34
[   29.605588]  register_lock_class+0x470/0x4a0
[   29.610800]  __lock_acquire+0x68/0x9c0
[   29.615509]  lock_acquire.part.0+0xe0/0x214
[   29.620674]  lock_acquire+0xa8/0x20c
[   29.625190]  _raw_spin_lock+0x60/0xc4
[   29.629761]  drm_sched_fini+0x94/0xc0 [gpu_sched]
[   29.635387]  amdgpu_fence_driver_sw_fini+0x120/0x124 [amdgpu]
[   29.642652]  amdgpu_device_fini_sw+0x28/0x230 [amdgpu]
[   29.649262]  amdgpu_driver_release_kms+0x24/0x40 [amdgpu]
[   29.656079]  drm_dev_put.part.0+0x88/0xc0
[   29.661004]  devm_drm_dev_init_release+0x1c/0x30
[   29.666601]  devm_action_release+0x1c/0x2c
[   29.671629]  devres_release_all+0xb0/0x110
[   29.676632]  device_unbind_cleanup+0x20/0x70
[   29.681798]  really_probe+0x208/0x3e0
[   29.686416]  __driver_probe_device+0x84/0x190
[   29.691718]  driver_probe_device+0x44/0x120
[   29.696839]  __driver_attach+0x104/0x200
[   29.701640]  bus_for_each_dev+0x6c/0xac
[   29.706336]  driver_attach+0x2c/0x40
[   29.710863]  bus_add_driver+0x184/0x240
[   29.715612]  driver_register+0x80/0x13c
[   29.720365]  __pci_register_driver+0x68/0x80
[   29.725501]  amdgpu_init+0x78/0x1000 [amdgpu]
[   29.731239]  do_one_initcall+0x94/0x45c
[   29.736003]  do_init_module+0x50/0x204
[   29.740657]  load_module+0x9b8/0xb20
[   29.745092]  __do_sys_init_module+0x128/0x144
[   29.750270]  __arm64_sys_init_module+0x24/0x30
[   29.755550]  invoke_syscall+0x78/0x100
[   29.760137]  el0_svc_common.constprop.0+0x104/0x124
[   29.765827]  do_el0_svc+0x34/0x4c
[   29.769887]  el0_svc+0x50/0x140
[   29.773762]  el0t_64_sync_handler+0xf4/0x120
[   29.778757]  el0t_64_sync+0x190/0x194
[   29.783216] Unable to handle kernel NULL pointer dereference at
virtual address 00000000000000d0
[   29.792821] Mem abort info:
[   29.796349]   ESR = 0x0000000096000044
[   29.800819]   EC = 0x25: DABT (current EL), IL = 32 bits
[   29.806926]   SET = 0, FnV = 0
[   29.810724]   EA = 0, S1PTW = 0
[   29.814598]   FSC = 0x04: level 0 translation fault
[   29.820167] Data abort info:
[   29.823735]   ISV = 0, ISS = 0x00000044
[   29.828251]   CM = 0, WnR = 1
[   29.831909] user pgtable: 4k pages, 48-bit VAs, pgdp=000008002bb15000
[   29.839085] [00000000000000d0] pgd=0000000000000000, p4d=0000000000000000
[   29.846578] Internal error: Oops: 0000000096000044 [#1] SMP
[   29.852825] Modules linked in: amdgpu(+) bridge raid1 stp llc video
gpu_sched drm_buddy crct10dif_ce polyval_ce polyval_generic ghash_ce
sbsa_gwdt drm_display_helper cec nvme ixgbe nvme_core igb ast
nvme_common drm_vram_helper drm_ttm_helper mdio ttm xgene_hwmon
gpio_dwapb onboard_usb_hub scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   29.887379] CPU: 27 PID: 926 Comm: systemd-udevd Not tainted
6.1.0-0.rc1.20221018gitbb1a1146467a.16.fc38.aarch64 #1
[   29.898528] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   29.911770] pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   29.919454] pc : drm_sched_fini+0xa0/0xc0 [gpu_sched]
[   29.925225] lr : drm_sched_fini+0x94/0xc0 [gpu_sched]
[   29.930979] sp : ffff80000cfc36c0
[   29.934981] x29: ffff80000cfc36c0 x28: 0000000000000000 x27: 0000000000000000
[   29.942812] x26: ffff80000cfc3c20 x25: 0000000000000000 x24: ffff07ffbb108258
[   29.950635] x23: ffff07ffbb10c5f0 x22: ffff07ffbb10c740 x21: ffff07ffbb10c5e8
[   29.958455] x20: 0000000000000001 x19: ffff07ffbb10c790 x18: 0000000000000002
[   29.966263] x17: 0000000000000001 x16: 0000000000000004 x15: 0000000000000000
[   29.974052] x14: 0000000000000000 x13: 0000000000000020 x12: 0000000000000000
[   29.981825] x11: 00000000ffffbfff x10: ffff080f77ed9580 x9 : ffffd6c28065447c
[   29.989600] x8 : ffff07ffbb10c758 x7 : c0000000ffffbfff x6 : 000000000015ffa8
[   29.997381] x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffffd6c282744008
[   30.005171] x2 : ffff314cb1337000 x1 : 0000000000000000 x0 : 0000000000000000
[   30.005175] Call trace:
[   30.005177]  drm_sched_fini+0xa0/0xc0 [gpu_sched]
[   30.005189]  amdgpu_fence_driver_sw_fini+0x120/0x124 [amdgpu]
[   30.032331]  amdgpu_device_fini_sw+0x28/0x230 [amdgpu]
[   30.040987]  amdgpu_driver_release_kms+0x24/0x40 [amdgpu]
[   30.047567]  drm_dev_put.part.0+0x88/0xc0
[   30.052257]  devm_drm_dev_init_release+0x1c/0x30
[   30.057552]  devm_action_release+0x1c/0x2c
[   30.062322]  devres_release_all+0xb0/0x110
[   30.067089]  device_unbind_cleanup+0x20/0x70
[   30.072027]  really_probe+0x208/0x3e0
[   30.076358]  __driver_probe_device+0x84/0x190
[   30.081383]  driver_probe_device+0x44/0x120
[   30.086235]  __driver_attach+0x104/0x200
[   30.090825]  bus_for_each_dev+0x6c/0xac
[   30.095329]  driver_attach+0x2c/0x40
[   30.099569]  bus_add_driver+0x184/0x240
[   30.104071]  driver_register+0x80/0x13c
[   30.108570]  __pci_register_driver+0x68/0x80
[   30.113508]  amdgpu_init+0x78/0x1000 [amdgpu]
[   30.119042]  do_one_initcall+0x94/0x45c
[   30.123548]  do_init_module+0x50/0x204
[   30.127967]  load_module+0x9b8/0xb20
[   30.132208]  __do_sys_init_module+0x128/0x144
[   30.137230]  __arm64_sys_init_module+0x24/0x30
[   30.142341]  invoke_syscall+0x78/0x100
[   30.146755]  el0_svc_common.constprop.0+0x104/0x124
[   30.152301]  do_el0_svc+0x34/0x4c
[   30.156283]  el0_svc+0x50/0x140
[   30.160091]  el0t_64_sync_handler+0xf4/0x120
[   30.165028]  el0t_64_sync+0x190/0x194
[   30.169353] Code: 94000de1 f9400261 eb13003f 540000a0 (39034034)
[   30.176117] ---[ end trace 0000000000000000 ]---
