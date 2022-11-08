Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3A6204A0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 01:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B25710E35B;
	Tue,  8 Nov 2022 00:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C255710E35B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 00:21:46 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id x20so4407669ual.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 16:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ausil.us; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ny/atnosEII39r+yEseZh0dAACOoKjw+FT2mZ7rZ+7I=;
 b=S0OWr6pIqsIB/SibiFpvtrYpsm10TgKF+cGnA9R50j8GWIoNWS92ekxagu5sjQIsE/
 yfQ69uZ1NokwNoTYmuPiFqkqXYkIAYY6V0nPK8PGg0gSIAHLtvdHmudII6IerK7a9I6b
 L3VcOSjL7qzgIJsDHWgWKB+VkQsz2oTRvjfocDdyZpMptJA7t269f3O8sDU2POGSZpYu
 hmrUbiS2WFr88qhZTAUqEFDVFlgoLohs7FJknGBhS31KTMXu7IwXPvCCp4aSqUMGl/bd
 VNa9rRCkEom2z6dFkRAiwDeOoZh5EbA5u7PuGTae9fI6kHfQohnY+hkoauZuNnK2byra
 RPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ny/atnosEII39r+yEseZh0dAACOoKjw+FT2mZ7rZ+7I=;
 b=gngvaRx+b1RvwFiFTjVzXms9R7b4N/yH7QhH0Iaa7+S+R26yldt1XCN82XrpfEMSo1
 +xtypbByHTDIwQRL7ZIP+KmspB6Z96ehrIlY1qThgKcBjZOw6FdDOahc1FLEZSuojYgP
 iavbRRD2BA/tnVGA9C6QMDz9mN05PY++92hJ+Tcmyxya/S5fnkgM/iPK1clG1u2FtS3h
 sWcT5v//jq3Gauo1N/pOdoaQc9g/OuDaEQ1Gr1Q0T+4FaD6MHxbWcYGaTJdV4E2s8tmO
 kfj+DGoOxvp3TTmloivi54ipJIZdT/LKrk/4NhevrcWzAnRRAEsd6pXrgZBQ6/UKvWlH
 e/+Q==
X-Gm-Message-State: ACrzQf16hxfqHyf0wbJx4EfbVq7jBid1PMUcTwtgAcmLfaeXLPP9wWNJ
 uE4pmeVl/QeGoTnYyw5YAeOHR4wXNlzgodFUi/j2B64x1ux4dOxshsY=
X-Google-Smtp-Source: AMsMyM535g0G8IiC+nrfdthAk7JLw0/RwfT03ir7+4/uIN4VmUHmgG3uEa/lB6eOixM3AYbiXIwhyMVAJFFIoU1ChNA=
X-Received: by 2002:ab0:b8e:0:b0:39f:96a1:63d3 with SMTP id
 c14-20020ab00b8e000000b0039f96a163d3mr15934077uak.108.1667866902960; Mon, 07
 Nov 2022 16:21:42 -0800 (PST)
MIME-Version: 1.0
References: <CAABkxwtEi_8=QsBYqiNU5KHrF8pf6nPzX54v2KB9x7LvWYs2sQ@mail.gmail.com>
In-Reply-To: <CAABkxwtEi_8=QsBYqiNU5KHrF8pf6nPzX54v2KB9x7LvWYs2sQ@mail.gmail.com>
From: Dennis Gilmore <dennis@ausil.us>
Date: Mon, 7 Nov 2022 18:21:31 -0600
Message-ID: <CAABkxwvWZhuLQgD67aUYfsWqFMemcYZM1-NEj7PZa=7tLXyuFA@mail.gmail.com>
Subject: Re: bug report with amdgpu drm-next-6.2
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

appending amdgpu.runpm=0 to the bootargs, it was a suggestion as I
have to append pcie_aspm=off. I get further, and despite a lot of
noise X starts

[   19.501645] [drm] amdgpu kernel modesetting enabled.
[   19.515932] amdgpu: CRAT table disabled by module option
[   19.522205] amdgpu: IO link not available for non x86 platforms
[   19.528970] amdgpu: Virtual CRAT table created for CPU
[   19.535049] amdgpu: Topology: Add CPU node
[   19.540687] amdgpu 000d:03:00.0: Adding to iommu group 23
[   19.547913] [drm] initializing kernel modesetting (BEIGE_GOBY
0x1002:0x743F 0x1EAE:0x6401 0xC1).
[   19.557672] [drm] register mmio base: 0x50000000
[   19.563139] [drm] register mmio size: 1048576
[   19.570124] [drm] add ip block number 0 <nv_common>
[   19.575836] [drm] add ip block number 1 <gmc_v10_0>
[   19.581510] [drm] add ip block number 2 <navi10_ih>
[   19.586184] ixgbe 0005:01:00.0 enP5p1s0f0: NIC Link is Up 10 Gbps,
Flow Control: RX/TX
[   19.586383] [drm] add ip block number 3 <psp>
[   19.595028] IPv6: ADDRCONF(NETDEV_CHANGE): enP5p1s0f0: link becomes ready
[   19.598635] [drm] add ip block number 4 <smu>
[   19.613779] [drm] add ip block number 5 <dm>
[   19.618939] [drm] add ip block number 6 <gfx_v10_0>
[   19.624622] [drm] add ip block number 7 <sdma_v5_2>
[   19.630292] [drm] add ip block number 8 <vcn_v3_0>
[   19.635887] amdgpu 000d:03:00.0: amdgpu: Fetched VBIOS from VFCT
[   19.642653] amdgpu: ATOM BIOS: 113-24X46SHB1-D02
[   19.648005] [drm] VCN(0) decode is enabled in VM mode
[   19.653811] amdgpu 000d:03:00.0: amdgpu: Trusted Memory Zone (TMZ)
feature disabled as experimental (default)
[   19.664520] amdgpu 000d:03:00.0: amdgpu: PCIE atomic ops is not supported
[   19.672121] [drm] vm size is 262144 GB, 4 levels, block size is
9-bit, fragment size is 9-bit
[   19.681487] amdgpu 000d:03:00.0: BAR 2: releasing [mem
0x340010000000-0x3400101fffff 64bit pref]
[   19.691081] amdgpu 000d:03:00.0: BAR 0: releasing [mem
0x340000000000-0x34000fffffff 64bit pref]
[   19.700731] pcieport 000d:02:00.0: BAR 15: releasing [mem
0x340000000000-0x340017ffffff 64bit pref]
[   19.710586] pcieport 000d:01:00.0: BAR 15: releasing [mem
0x340000000000-0x340017ffffff 64bit pref]
[   19.720388] pcieport 000d:00:01.0: BAR 15: releasing [mem
0x340000000000-0x340017ffffff 64bit pref]
[   19.730217] pcieport 000d:00:01.0: bridge window [io
0x1000-0x0fff] to [bus 01-03] add_size 1000
[   19.739849] pcieport 000d:00:01.0: BAR 15: assigned [mem
0x340000000000-0x34017fffffff 64bit pref]
[   19.749572] pcieport 000d:00:01.0: BAR 13: no space for [io  size 0x1000]
[   19.757117] pcieport 000d:00:01.0: BAR 13: failed to assign [io  size 0x1000]
[   19.764984] pcieport 000d:00:01.0: BAR 13: no space for [io  size 0x1000]
[   19.772511] pcieport 000d:00:01.0: BAR 13: failed to assign [io  size 0x1000]
[   19.780396] pcieport 000d:01:00.0: BAR 15: assigned [mem
0x340000000000-0x34017fffffff 64bit pref]
[   19.790109] pcieport 000d:02:00.0: BAR 15: assigned [mem
0x340000000000-0x34017fffffff 64bit pref]
[   19.799826] amdgpu 000d:03:00.0: BAR 0: assigned [mem
0x340000000000-0x3400ffffffff 64bit pref]
[   19.809289] amdgpu 000d:03:00.0: BAR 2: assigned [mem
0x340100000000-0x3401001fffff 64bit pref]
[   19.818742] pcieport 000d:00:01.0: PCI bridge to [bus 01-03]
[   19.825097] pcieport 000d:00:01.0:   bridge window [mem
0x50000000-0x502fffff]
[   19.833055] pcieport 000d:00:01.0:   bridge window [mem
0x340000000000-0x34017fffffff 64bit pref]
[   19.842649] pcieport 000d:01:00.0: PCI bridge to [bus 02-03]
[   19.849028] pcieport 000d:01:00.0:   bridge window [mem
0x50000000-0x501fffff]
[   19.856970] pcieport 000d:01:00.0:   bridge window [mem
0x340000000000-0x34017fffffff 64bit pref]
[   19.866567] pcieport 000d:02:00.0: PCI bridge to [bus 03]
[   19.872667] pcieport 000d:02:00.0:   bridge window [mem
0x50000000-0x501fffff]
[   19.880613] pcieport 000d:02:00.0:   bridge window [mem
0x340000000000-0x34017fffffff 64bit pref]
[   19.890238] amdgpu 000d:03:00.0: amdgpu: VRAM: 4080M
0x0000008000000000 - 0x00000080FEFFFFFF (4080M used)
[   19.900544] amdgpu 000d:03:00.0: amdgpu: GART: 512M
0x0000000000000000 - 0x000000001FFFFFFF
[   19.909620] amdgpu 000d:03:00.0: amdgpu: AGP: 267894784M
0x0000008400000000 - 0x0000FFFFFFFFFFFF
[   19.919143] [drm] Detected VRAM RAM=4080M, BAR=4096M
[   19.924802] [drm] RAM width 64bits GDDR6
[   19.929508] [drm] amdgpu: 4080M of VRAM memory ready
[   19.935186] [drm] amdgpu: 31947M of GTT memory ready.
[   19.940974] [drm] GART: num cpu pages 131072, num gpu pages 131072
[   19.948004] [drm] PCIE GART of 512M enabled (table at 0x0000008000300000).
[   19.965796] amdgpu 000d:03:00.0: amdgpu: PSP runtime database doesn't exist
[   19.973538] amdgpu 000d:03:00.0: amdgpu: PSP runtime database doesn't exist
[   21.665671] amdgpu 000d:03:00.0: amdgpu: STB initialized to 2048 entries
[   21.706368] [drm] Loading DMUB firmware via PSP: version=0x02020013
[   21.766108] [drm] use_doorbell being set to: [true]
[   21.836500] [drm] Found VCN firmware Version ENC: 1.24 DEC: 2 VEP:
0 Revision: 0
[   21.844612] amdgpu 000d:03:00.0: amdgpu: Will use PSP to load VCN firmware
[   21.944588] [drm] reserve 0xa00000 from 0x8001000000 for PSP TMR
[   22.058282] amdgpu 000d:03:00.0: amdgpu: RAS: optional ras ta ucode
is not available
[   22.100965] amdgpu 000d:03:00.0: amdgpu: SECUREDISPLAY:
securedisplay ta ucode is not available
[   22.110397] amdgpu 000d:03:00.0: amdgpu: smu driver if version =
0x0000000d, smu fw if version = 0x0000000f, smu fw program = 0,
version = 0x00491c00 (73.28.0)
[   22.125350] amdgpu 000d:03:00.0: amdgpu: SMU driver if version not matched
[   22.125383] amdgpu 000d:03:00.0: amdgpu: use vbios provided pptable
[   22.186792] amdgpu 000d:03:00.0: amdgpu: SMU is initialized successfully!
[   22.194422] [drm] Display Core initialized with v3.2.210!
[   22.201566] [drm] DMUB hardware initialized: version=0x02020013
[   22.591385] [drm] kiq ring mec 2 pipe 1 q 0
[   22.623200] [drm] VCN decode and encode initialized
successfully(under DPG Mode).
[   22.659553] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[   22.690920] amdgpu: sdma_bitmap: ff
[   22.745686] ------------[ cut here ]------------
[   22.751051] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   22.760187] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   22.794669] CPU: 0 PID: 452 Comm: kworker/0:5 Not tainted 6.1.0-rc1 #5
[   22.801972] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   22.815286] Workqueue: events work_for_cpu_fn
[   22.820444] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   22.828207] pc : vmemmap_populate+0x44/0x194
[   22.833278] lr : __populate_section_memmap+0x1a4/0x1d8
[   22.839208] sp : ffff80000b14b8c0
[   22.843302] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07c00
[   22.851218] x26: ffff07ffb985c380 x25: fffffc0000000000 x24: fffffffffa200000
[   22.859125] x23: 0000000000000000 x22: fffffffffa200000 x21: 0000000000000000
[   22.867037] x20: 0000000ffff00000 x19: fffffffffa000000 x18: 0000000000000002
[   22.874939] x17: 0000000000000001 x16: ffffdf31f7f30704 x15: 0000000000000000
[   22.882848] x14: 0000000000000000 x13: 0000000000001c49 x12: 071c71c71c71c71c
[   22.890764] x11: 0000000000000019 x10: 0000000000001d70 x9 : ffffdf31f7f2cf38
[   22.898672] x8 : ffff07ffb985c400 x7 : 0000000000000000 x6 : 0000000000000000
[   22.906576] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   22.914478] x2 : 0000000000000000 x1 : fffffffffa200000 x0 : fffffe0000000000
[   22.922381] Call trace:
[   22.925592]  vmemmap_populate+0x44/0x194
[   22.930282]  __populate_section_memmap+0x1a4/0x1d8
[   22.935838]  sparse_add_section+0x138/0x1f4
[   22.940790]  __add_pages+0xd8/0x180
[   22.945036]  pagemap_range+0x324/0x41c
[   22.949546]  memremap_pages+0x184/0x2b4
[   22.954133]  devm_memremap_pages+0x30/0x7c
[   22.958979]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   22.964991]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   22.971292]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   22.978113]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   22.984578]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   22.990775]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   22.997230]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   23.003249]  local_pci_probe+0x48/0xa0
[   23.007731]  work_for_cpu_fn+0x24/0x40
[   23.012210]  process_one_work+0x1ec/0x470
[   23.016944]  worker_thread+0x200/0x410
[   23.021409]  kthread+0xec/0x100
[   23.025266]  ret_from_fork+0x10/0x20
[   23.029555] ---[ end trace 0000000000000000 ]---
[   23.035003] ------------[ cut here ]------------
[   23.040344] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   23.049511] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   23.084032] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   23.092824] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   23.106147] Workqueue: events work_for_cpu_fn
[   23.111309] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   23.119077] pc : vmemmap_populate+0x44/0x194
[   23.124155] lr : __populate_section_memmap+0x1a4/0x1d8
[   23.124159] sp : ffff80000b14b8c0
[   23.124160] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07c20
[   23.124164] x26: ffff07ffb985ce00 x25: fffffc0000000000 x24: fffffffffa400000
[   23.124167] x23: 0000000000000000 x22: fffffffffa400000 x21: 0000000000000000
[   23.124170] x20: 0000000ffff08000 x19: fffffffffa200000 x18: 0000000000000002
[   23.160095] x17: 0000000000000001 x16: ffffdf31f7f30704 x15: 0000000000000000
[   23.160098] x14: 0000000000000000 x13: 0000000000001c49 x12: ffff080f77fecca8
[   23.160101] x11: ffff080f77fecc88 x10: 0000000000000000 x9 : ffffdf31f7f2cf38
[   23.160104] x8 : ffff07ffb985ce80 x7 : 0000000000000000 x6 : 0000000000000000
[   23.160107] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   23.160110] x2 : 0000000000000000 x1 : fffffffffa400000 x0 : fffffe0000000000
[   23.160113] Call trace:
[   23.160114]  vmemmap_populate+0x44/0x194
[   23.160118]  __populate_section_memmap+0x1a4/0x1d8
[   23.160122]  sparse_add_section+0x138/0x1f4
[   23.160125]  __add_pages+0xd8/0x180
[   23.160128]  pagemap_range+0x324/0x41c
[   23.160131]  memremap_pages+0x184/0x2b4
[   23.160132]  devm_memremap_pages+0x30/0x7c
[   23.160134]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   23.256189]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   23.256692]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   23.257181]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   23.275306]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   23.281386]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   23.287715]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   23.293605]  local_pci_probe+0x48/0xa0
[   23.297966]  work_for_cpu_fn+0x24/0x40
[   23.302328]  process_one_work+0x1ec/0x470
[   23.306947]  worker_thread+0x200/0x410
[   23.311302]  kthread+0xec/0x100
[   23.315049]  ret_from_fork+0x10/0x20
[   23.319226] ---[ end trace 0000000000000000 ]---
[   23.324568] ------------[ cut here ]------------
[   23.332460] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   23.341514] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   23.375812] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   23.384496] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   23.397713] Workqueue: events work_for_cpu_fn
[   23.402776] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   23.410454] pc : vmemmap_populate+0x44/0x194
[   23.415441] lr : __populate_section_memmap+0x1a4/0x1d8
[   23.421299] sp : ffff80000b14b8c0
[   23.425330] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07c40
[   23.433186] x26: ffff080f31618000 x25: fffffc0000000000 x24: fffffffffa600000
[   23.441043] x23: 0000000000000000 x22: fffffffffa600000 x21: 0000000000000000
[   23.448900] x20: 0000000ffff10000 x19: fffffffffa400000 x18: 0000000000000002
[   23.456757] x17: 0000000000000001 x16: ffffdf31f7f30704 x15: ffffdf31a00e8af8
[   23.464616] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa724c x12: ffffdf31f6fa3204
[   23.472475] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   23.480336] x8 : ffff080f31618028 x7 : 0000000000000000 x6 : 0000000000000000
[   23.488199] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   23.496065] x2 : 0000000000000000 x1 : fffffffffa600000 x0 : fffffe0000000000
[   23.503932] Call trace:
[   23.507108]  vmemmap_populate+0x44/0x194
[   23.511767]  __populate_section_memmap+0x1a4/0x1d8
[   23.517294]  sparse_add_section+0x138/0x1f4
[   23.522208]  __add_pages+0xd8/0x180
[   23.526401]  pagemap_range+0x324/0x41c
[   23.530818]  memremap_pages+0x184/0x2b4
[   23.535305]  devm_memremap_pages+0x30/0x7c
[   23.540047]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   23.545887]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   23.552061]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   23.558751]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   23.565087]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   23.571159]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   23.577488]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   23.583381]  local_pci_probe+0x48/0xa0
[   23.587740]  work_for_cpu_fn+0x24/0x40
[   23.592098]  process_one_work+0x1ec/0x470
[   23.596714]  worker_thread+0x200/0x410
[   23.601066]  kthread+0xec/0x100
[   23.604810]  ret_from_fork+0x10/0x20
[   23.608985] ---[ end trace 0000000000000000 ]---
[   23.614337] ------------[ cut here ]------------
[   23.622222] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   23.631280] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   23.665578] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   23.665581] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   23.665583] Workqueue: events work_for_cpu_fn
[   23.665589] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   23.665592] pc : vmemmap_populate+0x44/0x194
[   23.665595] lr : __populate_section_memmap+0x1a4/0x1d8
[   23.665599] sp : ffff80000b14b8c0
[   23.665600] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07c60
[   23.665603] x26: ffff080f3161af80 x25: fffffc0000000000 x24: fffffffffa800000
[   23.665606] x23: 0000000000000000 x22: fffffffffa800000 x21: 0000000000000000
[   23.665609] x20: 0000000ffff18000 x19: fffffffffa600000 x18: 0000000000000002
[   23.665612] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   23.665615] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffffdf31f7737078
[   23.665618] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   23.665621] x8 : ffff080f3161afa8 x7 : 0000000000000000 x6 : 0000000000000000
[   23.665624] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   23.665626] x2 : 0000000000000000 x1 : fffffffffa800000 x0 : fffffe0000000000
[   23.665629] Call trace:
[   23.665630]  vmemmap_populate+0x44/0x194
[   23.665633]  __populate_section_memmap+0x1a4/0x1d8
[   23.665637]  sparse_add_section+0x138/0x1f4
[   23.665640]  __add_pages+0xd8/0x180
[   23.665643]  pagemap_range+0x324/0x41c
[   23.665645]  memremap_pages+0x184/0x2b4
[   23.665647]  devm_memremap_pages+0x30/0x7c
[   23.830204]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   23.830709]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   23.831199]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   23.848739]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   23.855063]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   23.861117]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   23.867428]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   23.873301]  local_pci_probe+0x48/0xa0
[   23.877645]  work_for_cpu_fn+0x24/0x40
[   23.881988]  process_one_work+0x1ec/0x470
[   23.886588]  worker_thread+0x200/0x410
[   23.890923]  kthread+0xec/0x100
[   23.894647]  ret_from_fork+0x10/0x20
[   23.898802] ---[ end trace 0000000000000000 ]---
[   23.904115] ------------[ cut here ]------------
[   23.911991] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   23.921024] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   23.955278] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   23.963941] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   23.977139] Workqueue: events work_for_cpu_fn
[   23.982183] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   23.989839] pc : vmemmap_populate+0x44/0x194
[   23.994806] lr : __populate_section_memmap+0x1a4/0x1d8
[   24.000644] sp : ffff80000b14b8c0
[   24.004653] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07c80
[   24.012488] x26: ffff080f3161cf80 x25: fffffc0000000000 x24: fffffffffaa00000
[   24.020326] x23: 0000000000000000 x22: fffffffffaa00000 x21: 0000000000000000
[   24.028166] x20: 0000000ffff20000 x19: fffffffffa800000 x18: 0000000000000002
[   24.036005] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   24.043845] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa724c x12: ffffdf31f6fa3204
[   24.051685] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   24.059526] x8 : ffff080f3161cfa8 x7 : 0000000000000000 x6 : 0000000000000000
[   24.067371] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   24.075218] x2 : 0000000000000000 x1 : fffffffffaa00000 x0 : fffffe0000000000
[   24.083065] Call trace:
[   24.086221]  vmemmap_populate+0x44/0x194
[   24.090860]  __populate_section_memmap+0x1a4/0x1d8
[   24.096370]  sparse_add_section+0x138/0x1f4
[   24.101267]  __add_pages+0xd8/0x180
[   24.105441]  pagemap_range+0x324/0x41c
[   24.109840]  memremap_pages+0x184/0x2b4
[   24.114317]  devm_memremap_pages+0x30/0x7c
[   24.119033]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   24.124867]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   24.133512]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   24.140212]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   24.146552]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   24.152629]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   24.158966]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   24.164866]  local_pci_probe+0x48/0xa0
[   24.169239]  work_for_cpu_fn+0x24/0x40
[   24.173609]  process_one_work+0x1ec/0x470
[   24.178235]  worker_thread+0x200/0x410
[   24.182601]  kthread+0xec/0x100
[   24.186354]  ret_from_fork+0x10/0x20
[   24.190539] ---[ end trace 0000000000000000 ]---
[   24.195899] ------------[ cut here ]------------
[   24.203795] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   24.212863] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   24.247191] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   24.255890] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   24.269125] Workqueue: events work_for_cpu_fn
[   24.274205] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   24.281895] pc : vmemmap_populate+0x44/0x194
[   24.286897] lr : __populate_section_memmap+0x1a4/0x1d8
[   24.292766] sp : ffff80000b14b8c0
[   24.296807] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07ca0
[   24.304676] x26: ffff080f31622f80 x25: fffffc0000000000 x24: fffffffffac00000
[   24.312546] x23: 0000000000000000 x22: fffffffffac00000 x21: 0000000000000000
[   24.320418] x20: 0000000ffff28000 x19: fffffffffaa00000 x18: 0000000000000002
[   24.328288] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   24.336161] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffffdf31f7737078
[   24.344034] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   24.351908] x8 : ffff080f31622fa8 x7 : 0000000000000000 x6 : 0000000000000000
[   24.359786] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   24.367667] x2 : 0000000000000000 x1 : fffffffffac00000 x0 : fffffe0000000000
[   24.375549] Call trace:
[   24.378739]  vmemmap_populate+0x44/0x194
[   24.383410]  __populate_section_memmap+0x1a4/0x1d8
[   24.388951]  sparse_add_section+0x138/0x1f4
[   24.393876]  __add_pages+0xd8/0x180
[   24.398077]  pagemap_range+0x324/0x41c
[   24.402506]  memremap_pages+0x184/0x2b4
[   24.407007]  devm_memremap_pages+0x30/0x7c
[   24.411753]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   24.417605]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   24.423790]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   24.430492]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   24.436841]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   24.442926]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   24.449268]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   24.455174]  local_pci_probe+0x48/0xa0
[   24.459548]  work_for_cpu_fn+0x24/0x40
[   24.463923]  process_one_work+0x1ec/0x470
[   24.468553]  worker_thread+0x200/0x410
[   24.472920]  kthread+0xec/0x100
[   24.476679]  ret_from_fork+0x10/0x20
[   24.480867] ---[ end trace 0000000000000000 ]---
[   24.486228] ------------[ cut here ]------------
[   24.494123] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   24.503188] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   24.537505] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   24.546200] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   24.559431] Workqueue: events work_for_cpu_fn
[   24.564507] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   24.572196] pc : vmemmap_populate+0x44/0x194
[   24.577194] lr : __populate_section_memmap+0x1a4/0x1d8
[   24.583056] sp : ffff80000b14b8c0
[   24.587084] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07cc0
[   24.594942] x26: ffff080f31626f80 x25: fffffc0000000000 x24: fffffffffae00000
[   24.602800] x23: 0000000000000000 x22: fffffffffae00000 x21: 0000000000000000
[   24.610661] x20: 0000000ffff30000 x19: fffffffffac00000 x18: 0000000000000002
[   24.618519] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   24.626382] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffffdf31f7737078
[   24.626386] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   24.626389] x8 : ffff080f31626fa8 x7 : 0000000000000000 x6 : 0000000000000000
[   24.642113] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   24.642115] x2 : 0000000000000000 x1 : fffffffffae00000 x0 : fffffe0000000000
[   24.642119] Call trace:
[   24.642120]  vmemmap_populate+0x44/0x194
[   24.642124]  __populate_section_memmap+0x1a4/0x1d8
[   24.642128]  sparse_add_section+0x138/0x1f4
[   24.642131]  __add_pages+0xd8/0x180
[   24.642134]  pagemap_range+0x324/0x41c
[   24.642136]  memremap_pages+0x184/0x2b4
[   24.642138]  devm_memremap_pages+0x30/0x7c
[   24.642140]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   24.707939]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   24.708442]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   24.708929]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   24.727087]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   24.733170]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   24.739502]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   24.745397]  local_pci_probe+0x48/0xa0
[   24.749762]  work_for_cpu_fn+0x24/0x40
[   24.754129]  process_one_work+0x1ec/0x470
[   24.758751]  worker_thread+0x200/0x410
[   24.763109]  kthread+0xec/0x100
[   24.766859]  ret_from_fork+0x10/0x20
[   24.771037] ---[ end trace 0000000000000000 ]---
[   24.776375] ------------[ cut here ]------------
[   24.784273] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   24.793329] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   24.827634] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   24.836321] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   24.849542] Workqueue: events work_for_cpu_fn
[   24.854609] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   24.862289] pc : vmemmap_populate+0x44/0x194
[   24.867277] lr : __populate_section_memmap+0x1a4/0x1d8
[   24.873136] sp : ffff80000b14b8c0
[   24.877169] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07ce0
[   24.885027] x26: ffff07ffb985c600 x25: fffffc0000000000 x24: fffffffffb000000
[   24.892887] x23: 0000000000000000 x22: fffffffffb000000 x21: 0000000000000000
[   24.900748] x20: 0000000ffff38000 x19: fffffffffae00000 x18: 0000000000000002
[   24.908610] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   24.916472] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffff080f77fecca8
[   24.924336] x11: ffff080f77fecc88 x10: 0000000000000000 x9 : ffffdf31f7f2cf38
[   24.932202] x8 : ffff07ffb985c680 x7 : 0000000000000000 x6 : 0000000000000000
[   24.940069] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   24.947939] x2 : 0000000000000000 x1 : fffffffffb000000 x0 : fffffe0000000000
[   24.955809] Call trace:
[   24.958988]  vmemmap_populate+0x44/0x194
[   24.963648]  __populate_section_memmap+0x1a4/0x1d8
[   24.969179]  sparse_add_section+0x138/0x1f4
[   24.974096]  __add_pages+0xd8/0x180
[   24.978291]  pagemap_range+0x324/0x41c
[   24.982711]  memremap_pages+0x184/0x2b4
[   24.987202]  devm_memremap_pages+0x30/0x7c
[   24.991944]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   24.997787]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   25.003961]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   25.010653]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   25.016990]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   25.023067]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   25.029400]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   25.035295]  local_pci_probe+0x48/0xa0
[   25.039657]  work_for_cpu_fn+0x24/0x40
[   25.044021]  process_one_work+0x1ec/0x470
[   25.048640]  worker_thread+0x200/0x410
[   25.052995]  kthread+0xec/0x100
[   25.056740]  ret_from_fork+0x10/0x20
[   25.060915] ---[ end trace 0000000000000000 ]---
[   25.066263] ------------[ cut here ]------------
[   25.074147] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   25.083201] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   25.117500] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   25.126190] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   25.126192] Workqueue: events work_for_cpu_fn
[   25.144484] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   25.144487] pc : vmemmap_populate+0x44/0x194
[   25.144491] lr : __populate_section_memmap+0x1a4/0x1d8
[   25.144495] sp : ffff80000b14b8c0
[   25.144496] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07d00
[   25.144499] x26: ffff080f3162ef80 x25: fffffc0000000000 x24: fffffffffb200000
[   25.144502] x23: 0000000000000000 x22: fffffffffb200000 x21: 0000000000000000
[   25.144505] x20: 0000000ffff40000 x19: fffffffffb000000 x18: 0000000000000002
[   25.144508] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   25.144511] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffffdf31f7737078
[   25.144514] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   25.144517] x8 : ffff080f3162efa8 x7 : 0000000000000000 x6 : 0000000000000000
[   25.144520] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   25.144522] x2 : 0000000000000000 x1 : fffffffffb200000 x0 : fffffe0000000000
[   25.144525] Call trace:
[   25.144526]  vmemmap_populate+0x44/0x194
[   25.144529]  __populate_section_memmap+0x1a4/0x1d8
[   25.144533]  sparse_add_section+0x138/0x1f4
[   25.144536]  __add_pages+0xd8/0x180
[   25.144539]  pagemap_range+0x324/0x41c
[   25.144541]  memremap_pages+0x184/0x2b4
[   25.144543]  devm_memremap_pages+0x30/0x7c
[   25.144545]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   25.287718]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   25.288220]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   25.288707]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   25.306771]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   25.312845]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   25.319168]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   25.325056]  local_pci_probe+0x48/0xa0
[   25.329412]  work_for_cpu_fn+0x24/0x40
[   25.333769]  process_one_work+0x1ec/0x470
[   25.338381]  worker_thread+0x200/0x410
[   25.342730]  kthread+0xec/0x100
[   25.346468]  ret_from_fork+0x10/0x20
[   25.350634] ---[ end trace 0000000000000000 ]---
[   25.355958] ------------[ cut here ]------------
[   25.363848] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   25.372894] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   25.407177] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   25.415853] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   25.429064] Workqueue: events work_for_cpu_fn
[   25.434119] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   25.441789] pc : vmemmap_populate+0x44/0x194
[   25.446770] lr : __populate_section_memmap+0x1a4/0x1d8
[   25.452620] sp : ffff80000b14b8c0
[   25.456642] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07d20
[   25.464490] x26: ffff080f31632000 x25: fffffc0000000000 x24: fffffffffb400000
[   25.472339] x23: 0000000000000000 x22: fffffffffb400000 x21: 0000000000000000
[   25.480190] x20: 0000000ffff48000 x19: fffffffffb200000 x18: 0000000000000002
[   25.488038] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   25.495891] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffffdf31f7737078
[   25.503744] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   25.511596] x8 : ffff080f31632028 x7 : 0000000000000000 x6 : 0000000000000000
[   25.519453] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   25.527312] x2 : 0000000000000000 x1 : fffffffffb400000 x0 : fffffe0000000000
[   25.535171] Call trace:
[   25.538341]  vmemmap_populate+0x44/0x194
[   25.542990]  __populate_section_memmap+0x1a4/0x1d8
[   25.548509]  sparse_add_section+0x138/0x1f4
[   25.553415]  __add_pages+0xd8/0x180
[   25.557598]  pagemap_range+0x324/0x41c
[   25.562008]  memremap_pages+0x184/0x2b4
[   25.566487]  devm_memremap_pages+0x30/0x7c
[   25.571221]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   25.577053]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   25.583215]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   25.589899]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   25.596230]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   25.602295]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   25.608619]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   25.614508]  local_pci_probe+0x48/0xa0
[   25.618870]  work_for_cpu_fn+0x24/0x40
[   25.623231]  process_one_work+0x1ec/0x470
[   25.623234]  worker_thread+0x200/0x410
[   25.623236]  kthread+0xec/0x100
[   25.638261]  ret_from_fork+0x10/0x20
[   25.638265] ---[ end trace 0000000000000000 ]---
[   25.638392] ------------[ cut here ]------------
[   25.655112] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   25.655118] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   25.664207] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   25.664210] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   25.664212] Workqueue: events work_for_cpu_fn
[   25.664217] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   25.664220] pc : vmemmap_populate+0x44/0x194
[   25.664223] lr : __populate_section_memmap+0x1a4/0x1d8
[   25.664226] sp : ffff80000b14b8c0
[   25.664227] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07d40
[   25.664231] x26: ffff080f31636000 x25: fffffc0000000000 x24: fffffffffb600000
[   25.664234] x23: 0000000000000000 x22: fffffffffb600000 x21: 0000000000000000
[   25.664237] x20: 0000000ffff50000 x19: fffffffffb400000 x18: 0000000000000002
[   25.664240] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   25.664243] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffffdf31f7737078
[   25.664246] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   25.664248] x8 : ffff080f31636028 x7 : 0000000000000000 x6 : 0000000000000000
[   25.664251] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   25.664254] x2 : 0000000000000000 x1 : fffffffffb600000 x0 : fffffe0000000000
[   25.664258] Call trace:
[   25.664258]  vmemmap_populate+0x44/0x194
[   25.664261]  __populate_section_memmap+0x1a4/0x1d8
[   25.664265]  sparse_add_section+0x138/0x1f4
[   25.664268]  __add_pages+0xd8/0x180
[   25.664271]  pagemap_range+0x324/0x41c
[   25.664273]  memremap_pages+0x184/0x2b4
[   25.664275]  devm_memremap_pages+0x30/0x7c
[   25.664277]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   25.664782]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   25.875517]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   25.882226]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   25.888572]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   25.894656]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   25.900995]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   25.906900]  local_pci_probe+0x48/0xa0
[   25.911273]  work_for_cpu_fn+0x24/0x40
[   25.915647]  process_one_work+0x1ec/0x470
[   25.920278]  worker_thread+0x200/0x410
[   25.924645]  kthread+0xec/0x100
[   25.928407]  ret_from_fork+0x10/0x20
[   25.932595] ---[ end trace 0000000000000000 ]---
[   25.937943] ------------[ cut here ]------------
[   25.945857] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   25.954919] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   25.989229] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   25.997922] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   26.011151] Workqueue: events work_for_cpu_fn
[   26.016225] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   26.023911] pc : vmemmap_populate+0x44/0x194
[   26.028909] lr : __populate_section_memmap+0x1a4/0x1d8
[   26.034776] sp : ffff80000b14b8c0
[   26.038814] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07d60
[   26.046681] x26: ffff080f3163a000 x25: fffffc0000000000 x24: fffffffffb800000
[   26.054548] x23: 0000000000000000 x22: fffffffffb800000 x21: 0000000000000000
[   26.062418] x20: 0000000ffff58000 x19: fffffffffb600000 x18: 0000000000000002
[   26.070286] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   26.078155] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffffdf31f7737078
[   26.086024] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   26.093895] x8 : ffff080f3163a028 x7 : 0000000000000000 x6 : 0000000000000000
[   26.101770] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   26.109647] x2 : 0000000000000000 x1 : fffffffffb800000 x0 : fffffe0000000000
[   26.117519] Call trace:
[   26.120694]  vmemmap_populate+0x44/0x194
[   26.125353]  __populate_section_memmap+0x1a4/0x1d8
[   26.125358]  sparse_add_section+0x138/0x1f4
[   26.125361]  __add_pages+0xd8/0x180
[   26.125364]  pagemap_range+0x324/0x41c
[   26.125367]  memremap_pages+0x184/0x2b4
[   26.151030]  devm_memremap_pages+0x30/0x7c
[   26.151034]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   26.160616]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   26.161112]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   26.173765]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   26.180130]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   26.186213]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   26.192553]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   26.198457]  local_pci_probe+0x48/0xa0
[   26.202826]  work_for_cpu_fn+0x24/0x40
[   26.207198]  process_one_work+0x1ec/0x470
[   26.211826]  worker_thread+0x200/0x410
[   26.216192]  kthread+0xec/0x100
[   26.219949]  ret_from_fork+0x10/0x20
[   26.224135] ---[ end trace 0000000000000000 ]---
[   26.229493] ------------[ cut here ]------------
[   26.237397] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   26.246462] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   26.280791] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   26.289489] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   26.302720] Workqueue: events work_for_cpu_fn
[   26.307797] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   26.315488] pc : vmemmap_populate+0x44/0x194
[   26.320488] lr : __populate_section_memmap+0x1a4/0x1d8
[   26.326360] sp : ffff80000b14b8c0
[   26.330402] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07d80
[   26.338274] x26: ffff080f31640f80 x25: fffffc0000000000 x24: fffffffffba00000
[   26.346147] x23: 0000000000000000 x22: fffffffffba00000 x21: 0000000000000000
[   26.354021] x20: 0000000ffff60000 x19: fffffffffb800000 x18: 0000000000000002
[   26.361894] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   26.369769] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa724c x12: ffffdf31f6fa3204
[   26.377645] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   26.385522] x8 : ffff080f31640fa8 x7 : 0000000000000000 x6 : 0000000000000000
[   26.393403] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   26.401287] x2 : 0000000000000000 x1 : fffffffffba00000 x0 : fffffe0000000000
[   26.409172] Call trace:
[   26.412363]  vmemmap_populate+0x44/0x194
[   26.417036]  __populate_section_memmap+0x1a4/0x1d8
[   26.422582]  sparse_add_section+0x138/0x1f4
[   26.427513]  __add_pages+0xd8/0x180
[   26.431723]  pagemap_range+0x324/0x41c
[   26.436156]  memremap_pages+0x184/0x2b4
[   26.440660]  devm_memremap_pages+0x30/0x7c
[   26.445416]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   26.451271]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   26.457456]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   26.464160]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   26.470510]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   26.476593]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   26.482938]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   26.488844]  local_pci_probe+0x48/0xa0
[   26.493220]  work_for_cpu_fn+0x24/0x40
[   26.497596]  process_one_work+0x1ec/0x470
[   26.502229]  worker_thread+0x200/0x410
[   26.506598]  kthread+0xec/0x100
[   26.510362]  ret_from_fork+0x10/0x20
[   26.514553] ---[ end trace 0000000000000000 ]---
[   26.519919] ------------[ cut here ]------------
[   26.527817] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   26.536883] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   26.571204] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   26.579902] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   26.593137] Workqueue: events work_for_cpu_fn
[   26.598218] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   26.605903] pc : vmemmap_populate+0x44/0x194
[   26.610895] lr : __populate_section_memmap+0x1a4/0x1d8
[   26.616756] sp : ffff80000b14b8c0
[   26.620787] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07da0
[   26.628649] x26: ffff080f31644f80 x25: fffffc0000000000 x24: fffffffffbc00000
[   26.628653] x23: 0000000000000000 x22: fffffffffbc00000 x21: 0000000000000000
[   26.628656] x20: 0000000ffff68000 x19: fffffffffba00000 x18: 0000000000000002
[   26.628659] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   26.628662] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa724c x12: ffffdf31f6fa3204
[   26.662292] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   26.662295] x8 : ffff080f31644fa8 x7 : 0000000000000000 x6 : 0000000000000000
[   26.662298] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   26.662301] x2 : 0000000000000000 x1 : fffffffffbc00000 x0 : fffffe0000000000
[   26.662304] Call trace:
[   26.662305]  vmemmap_populate+0x44/0x194
[   26.662310]  __populate_section_memmap+0x1a4/0x1d8
[   26.662313]  sparse_add_section+0x138/0x1f4
[   26.662317]  __add_pages+0xd8/0x180
[   26.662319]  pagemap_range+0x324/0x41c
[   26.662322]  memremap_pages+0x184/0x2b4
[   26.662324]  devm_memremap_pages+0x30/0x7c
[   26.662326]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   26.742513]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   26.743015]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   26.743502]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   26.761636]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   26.767719]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   26.774052]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   26.779950]  local_pci_probe+0x48/0xa0
[   26.784314]  work_for_cpu_fn+0x24/0x40
[   26.788682]  process_one_work+0x1ec/0x470
[   26.793303]  worker_thread+0x200/0x410
[   26.797659]  kthread+0xec/0x100
[   26.801409]  ret_from_fork+0x10/0x20
[   26.805585] ---[ end trace 0000000000000000 ]---
[   26.810932] ------------[ cut here ]------------
[   26.818823] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   26.827879] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   26.862181] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   26.870867] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   26.884087] Workqueue: events work_for_cpu_fn
[   26.889153] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   26.896832] pc : vmemmap_populate+0x44/0x194
[   26.901820] lr : __populate_section_memmap+0x1a4/0x1d8
[   26.907679] sp : ffff80000b14b8c0
[   26.911711] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07dc0
[   26.919568] x26: ffff07ffb985c680 x25: fffffc0000000000 x24: fffffffffbe00000
[   26.927427] x23: 0000000000000000 x22: fffffffffbe00000 x21: 0000000000000000
[   26.935288] x20: 0000000ffff70000 x19: fffffffffbc00000 x18: 0000000000000002
[   26.943146] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   26.951007] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa724c x12: ffff080f77fecd10
[   26.958869] x11: ffff080f77feccf0 x10: 0000000000000000 x9 : ffffdf31f7f2cf38
[   26.966734] x8 : ffff07ffb985c700 x7 : 0000000000000000 x6 : 0000000000000000
[   26.974600] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   26.982472] x2 : 0000000000000000 x1 : fffffffffbe00000 x0 : fffffe0000000000
[   26.990341] Call trace:
[   26.993519]  vmemmap_populate+0x44/0x194
[   26.998177]  __populate_section_memmap+0x1a4/0x1d8
[   27.003708]  sparse_add_section+0x138/0x1f4
[   27.008625]  __add_pages+0xd8/0x180
[   27.012819]  pagemap_range+0x324/0x41c
[   27.017239]  memremap_pages+0x184/0x2b4
[   27.021729]  devm_memremap_pages+0x30/0x7c
[   27.026472]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   27.032312]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   27.038484]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   27.045174]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   27.051509]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   27.057581]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   27.063911]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   27.069805]  local_pci_probe+0x48/0xa0
[   27.074167]  work_for_cpu_fn+0x24/0x40
[   27.078529]  process_one_work+0x1ec/0x470
[   27.083147]  worker_thread+0x200/0x410
[   27.087502]  kthread+0xec/0x100
[   27.091246]  ret_from_fork+0x10/0x20
[   27.095421] ---[ end trace 0000000000000000 ]---
[   27.100764] ------------[ cut here ]------------
[   27.108644] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   27.117700] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   27.152000] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   27.152003] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   27.152005] Workqueue: events work_for_cpu_fn
[   27.152011] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   27.152014] pc : vmemmap_populate+0x44/0x194
[   27.193886] lr : __populate_section_memmap+0x1a4/0x1d8
[   27.193891] sp : ffff80000b14b8c0
[   27.193892] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07de0
[   27.193895] x26: ffff07ffb985c200 x25: fffffc0000000000 x24: fffffffffc000000
[   27.193898] x23: 0000000000000000 x22: fffffffffc000000 x21: 0000000000000000
[   27.193901] x20: 0000000ffff78000 x19: fffffffffbe00000 x18: 0000000000000002
[   27.193904] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   27.193907] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa724c x12: ffff080f77fecd10
[   27.193910] x11: ffff080f77feccf0 x10: 0000000000000000 x9 : ffffdf31f7f2cf38
[   27.193913] x8 : ffff07ffb985c280 x7 : 0000000000000000 x6 : 0000000000000000
[   27.193916] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   27.193918] x2 : 0000000000000000 x1 : fffffffffc000000 x0 : fffffe0000000000
[   27.193921] Call trace:
[   27.193922]  vmemmap_populate+0x44/0x194
[   27.193926]  __populate_section_memmap+0x1a4/0x1d8
[   27.193929]  sparse_add_section+0x138/0x1f4
[   27.193932]  __add_pages+0xd8/0x180
[   27.193935]  pagemap_range+0x324/0x41c
[   27.193937]  memremap_pages+0x184/0x2b4
[   27.193939]  devm_memremap_pages+0x30/0x7c
[   27.193941]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   27.323267]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   27.323769]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   27.324256]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   27.342354]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   27.348438]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   27.354771]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   27.360667]  local_pci_probe+0x48/0xa0
[   27.365031]  work_for_cpu_fn+0x24/0x40
[   27.369396]  process_one_work+0x1ec/0x470
[   27.374016]  worker_thread+0x200/0x410
[   27.378372]  kthread+0xec/0x100
[   27.382116]  ret_from_fork+0x10/0x20
[   27.386291] ---[ end trace 0000000000000000 ]---
[   27.391624] ------------[ cut here ]------------
[   27.399519] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   27.408571] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   27.442868] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   27.451551] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   27.464768] Workqueue: events work_for_cpu_fn
[   27.469830] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   27.477507] pc : vmemmap_populate+0x44/0x194
[   27.482493] lr : __populate_section_memmap+0x1a4/0x1d8
[   27.488350] sp : ffff80000b14b8c0
[   27.492379] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07e00
[   27.500233] x26: ffff07ffb985cb00 x25: fffffc0000000000 x24: fffffffffc200000
[   27.508089] x23: 0000000000000000 x22: fffffffffc200000 x21: 0000000000000000
[   27.515946] x20: 0000000ffff80000 x19: fffffffffc000000 x18: 0000000000000002
[   27.523801] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   27.531661] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa724c x12: ffff080f77fecd10
[   27.539522] x11: ffff080f77feccf0 x10: 0000000000000000 x9 : ffffdf31f7f2cf38
[   27.547384] x8 : ffff07ffb985cb80 x7 : 0000000000000000 x6 : 0000000000000000
[   27.555250] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   27.563117] x2 : 0000000000000000 x1 : fffffffffc200000 x0 : fffffe0000000000
[   27.570984] Call trace:
[   27.574161]  vmemmap_populate+0x44/0x194
[   27.578819]  __populate_section_memmap+0x1a4/0x1d8
[   27.584346]  sparse_add_section+0x138/0x1f4
[   27.589261]  __add_pages+0xd8/0x180
[   27.593454]  pagemap_range+0x324/0x41c
[   27.597870]  memremap_pages+0x184/0x2b4
[   27.602357]  devm_memremap_pages+0x30/0x7c
[   27.607100]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   27.612939]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   27.619110]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   27.625801]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   27.634618]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   27.640695]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   27.647032]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   27.652933]  local_pci_probe+0x48/0xa0
[   27.657306]  work_for_cpu_fn+0x24/0x40
[   27.661676]  process_one_work+0x1ec/0x470
[   27.666302]  worker_thread+0x200/0x410
[   27.670664]  kthread+0xec/0x100
[   27.674418]  ret_from_fork+0x10/0x20
[   27.678603] ---[ end trace 0000000000000000 ]---
[   27.683948] ------------[ cut here ]------------
[   27.691853] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   27.700920] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   27.735248] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   27.743949] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   27.757182] Workqueue: events work_for_cpu_fn
[   27.762263] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   27.769956] pc : vmemmap_populate+0x44/0x194
[   27.774958] lr : __populate_section_memmap+0x1a4/0x1d8
[   27.780830] sp : ffff80000b14b8c0
[   27.784870] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07e20
[   27.792739] x26: ffff080f31654f80 x25: fffffc0000000000 x24: fffffffffc400000
[   27.800609] x23: 0000000000000000 x22: fffffffffc400000 x21: 0000000000000000
[   27.808482] x20: 0000000ffff88000 x19: fffffffffc200000 x18: 0000000000000002
[   27.816353] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   27.824225] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa724c x12: ffffdf31f6fa3204
[   27.832100] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   27.839973] x8 : ffff080f31654fa8 x7 : 0000000000000000 x6 : 0000000000000000
[   27.847854] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   27.855736] x2 : 0000000000000000 x1 : fffffffffc400000 x0 : fffffe0000000000
[   27.863619] Call trace:
[   27.866811]  vmemmap_populate+0x44/0x194
[   27.871484]  __populate_section_memmap+0x1a4/0x1d8
[   27.877027]  sparse_add_section+0x138/0x1f4
[   27.881953]  __add_pages+0xd8/0x180
[   27.886155]  pagemap_range+0x324/0x41c
[   27.890586]  memremap_pages+0x184/0x2b4
[   27.895089]  devm_memremap_pages+0x30/0x7c
[   27.899837]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   27.905691]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   27.911879]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   27.918585]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   27.924934]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   27.931019]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   27.937362]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   27.943271]  local_pci_probe+0x48/0xa0
[   27.947648]  work_for_cpu_fn+0x24/0x40
[   27.952026]  process_one_work+0x1ec/0x470
[   27.956658]  worker_thread+0x200/0x410
[   27.961028]  kthread+0xec/0x100
[   27.964786]  ret_from_fork+0x10/0x20
[   27.968976] ---[ end trace 0000000000000000 ]---
[   27.974329] ------------[ cut here ]------------
[   27.982240] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   27.991306] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   28.025621] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   28.034318] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   28.047551] Workqueue: events work_for_cpu_fn
[   28.052628] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   28.060316] pc : vmemmap_populate+0x44/0x194
[   28.065315] lr : __populate_section_memmap+0x1a4/0x1d8
[   28.071185] sp : ffff80000b14b8c0
[   28.075225] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07e40
[   28.083089] x26: ffff080f31656000 x25: fffffc0000000000 x24: fffffffffc600000
[   28.090949] x23: 0000000000000000 x22: fffffffffc600000 x21: 0000000000000000
[   28.098808] x20: 0000000ffff90000 x19: fffffffffc400000 x18: 0000000000000002
[   28.106667] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   28.114528] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffffdf31f7737078
[   28.122392] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   28.122395] x8 : ffff080f31656028 x7 : 0000000000000000 x6 : 0000000000000000
[   28.122398] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   28.122401] x2 : 0000000000000000 x1 : fffffffffc600000 x0 : fffffe0000000000
[   28.122404] Call trace:
[   28.122405]  vmemmap_populate+0x44/0x194
[   28.163888]  __populate_section_memmap+0x1a4/0x1d8
[   28.163893]  sparse_add_section+0x138/0x1f4
[   28.163896]  __add_pages+0xd8/0x180
[   28.163899]  pagemap_range+0x324/0x41c
[   28.163902]  memremap_pages+0x184/0x2b4
[   28.163904]  devm_memremap_pages+0x30/0x7c
[   28.163906]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   28.197032]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   28.197533]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   28.198019]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   28.216194]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   28.222288]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   28.228632]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   28.234536]  local_pci_probe+0x48/0xa0
[   28.238910]  work_for_cpu_fn+0x24/0x40
[   28.243287]  process_one_work+0x1ec/0x470
[   28.247918]  worker_thread+0x200/0x410
[   28.252284]  kthread+0xec/0x100
[   28.256043]  ret_from_fork+0x10/0x20
[   28.260228] ---[ end trace 0000000000000000 ]---
[   28.265578] ------------[ cut here ]------------
[   28.273487] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   28.282551] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   28.316872] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   28.325567] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   28.338797] Workqueue: events work_for_cpu_fn
[   28.343871] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   28.351562] pc : vmemmap_populate+0x44/0x194
[   28.356561] lr : __populate_section_memmap+0x1a4/0x1d8
[   28.362431] sp : ffff80000b14b8c0
[   28.366469] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07e60
[   28.374336] x26: ffff080f3165a000 x25: fffffc0000000000 x24: fffffffffc800000
[   28.382205] x23: 0000000000000000 x22: fffffffffc800000 x21: 0000000000000000
[   28.390072] x20: 0000000ffff98000 x19: fffffffffc600000 x18: 0000000000000002
[   28.397941] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   28.405811] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffffdf31f7737078
[   28.413682] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   28.421553] x8 : ffff080f3165a028 x7 : 0000000000000000 x6 : 0000000000000000
[   28.429427] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   28.437305] x2 : 0000000000000000 x1 : fffffffffc800000 x0 : fffffe0000000000
[   28.445183] Call trace:
[   28.448369]  vmemmap_populate+0x44/0x194
[   28.453039]  __populate_section_memmap+0x1a4/0x1d8
[   28.458578]  sparse_add_section+0x138/0x1f4
[   28.463504]  __add_pages+0xd8/0x180
[   28.467708]  pagemap_range+0x324/0x41c
[   28.472137]  memremap_pages+0x184/0x2b4
[   28.476636]  devm_memremap_pages+0x30/0x7c
[   28.481389]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   28.487237]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   28.493420]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   28.500119]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   28.506461]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   28.512540]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   28.518878]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   28.524778]  local_pci_probe+0x48/0xa0
[   28.529151]  work_for_cpu_fn+0x24/0x40
[   28.533523]  process_one_work+0x1ec/0x470
[   28.538151]  worker_thread+0x200/0x410
[   28.542517]  kthread+0xec/0x100
[   28.546274]  ret_from_fork+0x10/0x20
[   28.550460] ---[ end trace 0000000000000000 ]---
[   28.555810] ------------[ cut here ]------------
[   28.563717] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   28.572781] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   28.607082] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   28.615769] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   28.628995] Workqueue: events work_for_cpu_fn
[   28.629001] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   28.629003] pc : vmemmap_populate+0x44/0x194
[   28.629007] lr : __populate_section_memmap+0x1a4/0x1d8
[   28.654809] sp : ffff80000b14b8c0
[   28.654811] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07e80
[   28.654814] x26: ffff07ff8205f580 x25: fffffc0000000000 x24: fffffffffca00000
[   28.654817] x23: 0000000000000000 x22: fffffffffca00000 x21: 0000000000000000
[   28.654820] x20: 0000000ffffa0000 x19: fffffffffc800000 x18: 0000000000000002
[   28.654823] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   28.654826] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffff080f77fecd10
[   28.654829] x11: ffff080f77feccf0 x10: 0000000000000000 x9 : ffffdf31f7f2cf38
[   28.654832] x8 : ffff07ff8205f600 x7 : 0000000000000000 x6 : 0000000000000000
[   28.654834] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   28.654837] x2 : 0000000000000000 x1 : fffffffffca00000 x0 : fffffe0000000000
[   28.654840] Call trace:
[   28.654841]  vmemmap_populate+0x44/0x194
[   28.654846]  __populate_section_memmap+0x1a4/0x1d8
[   28.654850]  sparse_add_section+0x138/0x1f4
[   28.654853]  __add_pages+0xd8/0x180
[   28.654856]  pagemap_range+0x324/0x41c
[   28.654859]  memremap_pages+0x184/0x2b4
[   28.654861]  devm_memremap_pages+0x30/0x7c
[   28.654862]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   28.778351]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   28.778855]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   28.779343]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   28.797495]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   28.803581]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   28.809917]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   28.815814]  local_pci_probe+0x48/0xa0
[   28.820179]  work_for_cpu_fn+0x24/0x40
[   28.824545]  process_one_work+0x1ec/0x470
[   28.829167]  worker_thread+0x200/0x410
[   28.833526]  kthread+0xec/0x100
[   28.837275]  ret_from_fork+0x10/0x20
[   28.841453] ---[ end trace 0000000000000000 ]---
[   28.846789] ------------[ cut here ]------------
[   28.854689] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   28.863745] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   28.898046] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   28.906732] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   28.919953] Workqueue: events work_for_cpu_fn
[   28.925018] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   28.932697] pc : vmemmap_populate+0x44/0x194
[   28.937688] lr : __populate_section_memmap+0x1a4/0x1d8
[   28.943547] sp : ffff80000b14b8c0
[   28.947578] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07ea0
[   28.955437] x26: ffff080f31662000 x25: fffffc0000000000 x24: fffffffffcc00000
[   28.963295] x23: 0000000000000000 x22: fffffffffcc00000 x21: 0000000000000000
[   28.971155] x20: 0000000ffffa8000 x19: fffffffffca00000 x18: 0000000000000002
[   28.979012] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   28.986874] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffffdf31f7737078
[   28.994736] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   29.002597] x8 : ffff080f31662028 x7 : 0000000000000000 x6 : 0000000000000000
[   29.010465] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   29.018334] x2 : 0000000000000000 x1 : fffffffffcc00000 x0 : fffffe0000000000
[   29.026204] Call trace:
[   29.029382]  vmemmap_populate+0x44/0x194
[   29.034042]  __populate_section_memmap+0x1a4/0x1d8
[   29.039574]  sparse_add_section+0x138/0x1f4
[   29.044489]  __add_pages+0xd8/0x180
[   29.048685]  pagemap_range+0x324/0x41c
[   29.053102]  memremap_pages+0x184/0x2b4
[   29.057592]  devm_memremap_pages+0x30/0x7c
[   29.062336]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   29.068176]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   29.074347]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   29.081037]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   29.087369]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   29.093434]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   29.099759]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   29.105648]  local_pci_probe+0x48/0xa0
[   29.110012]  work_for_cpu_fn+0x24/0x40
[   29.114370]  process_one_work+0x1ec/0x470
[   29.118986]  worker_thread+0x200/0x410
[   29.123340]  kthread+0xec/0x100
[   29.123345]  ret_from_fork+0x10/0x20
[   29.123348] ---[ end trace 0000000000000000 ]---
[   29.138938] ------------[ cut here ]------------
[   29.146832] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   29.155902] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   29.190233] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   29.198934] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   29.212169] Workqueue: events work_for_cpu_fn
[   29.217250] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   29.224943] pc : vmemmap_populate+0x44/0x194
[   29.229945] lr : __populate_section_memmap+0x1a4/0x1d8
[   29.235817] sp : ffff80000b14b8c0
[   29.239857] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07ec0
[   29.247728] x26: ffff080f31666f80 x25: fffffc0000000000 x24: fffffffffce00000
[   29.255600] x23: 0000000000000000 x22: fffffffffce00000 x21: 0000000000000000
[   29.263473] x20: 0000000ffffb0000 x19: fffffffffcc00000 x18: 0000000000000002
[   29.271344] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   29.279216] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffffdf31f7737078
[   29.287091] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   29.294966] x8 : ffff080f31666fa8 x7 : 0000000000000000 x6 : 0000000000000000
[   29.302844] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   29.310726] x2 : 0000000000000000 x1 : fffffffffce00000 x0 : fffffe0000000000
[   29.318609] Call trace:
[   29.321800]  vmemmap_populate+0x44/0x194
[   29.326473]  __populate_section_memmap+0x1a4/0x1d8
[   29.332015]  sparse_add_section+0x138/0x1f4
[   29.336942]  __add_pages+0xd8/0x180
[   29.341145]  pagemap_range+0x324/0x41c
[   29.345578]  memremap_pages+0x184/0x2b4
[   29.350082]  devm_memremap_pages+0x30/0x7c
[   29.354831]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   29.360686]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   29.366876]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   29.373583]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   29.379935]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   29.386023]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   29.392371]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   29.398280]  local_pci_probe+0x48/0xa0
[   29.402657]  work_for_cpu_fn+0x24/0x40
[   29.407035]  process_one_work+0x1ec/0x470
[   29.411668]  worker_thread+0x200/0x410
[   29.416038]  kthread+0xec/0x100
[   29.419800]  ret_from_fork+0x10/0x20
[   29.423989] ---[ end trace 0000000000000000 ]---
[   29.429335] ------------[ cut here ]------------
[   29.437248] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   29.446315] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   29.480633] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   29.489332] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   29.502567] Workqueue: events work_for_cpu_fn
[   29.507645] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   29.515335] pc : vmemmap_populate+0x44/0x194
[   29.520336] lr : __populate_section_memmap+0x1a4/0x1d8
[   29.526208] sp : ffff80000b14b8c0
[   29.530250] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07ee0
[   29.538120] x26: ffff080f31668f80 x25: fffffc0000000000 x24: fffffffffd000000
[   29.545991] x23: 0000000000000000 x22: fffffffffd000000 x21: 0000000000000000
[   29.553865] x20: 0000000ffffb8000 x19: fffffffffce00000 x18: 0000000000000002
[   29.561736] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   29.569611] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa724c x12: ffffdf31f6fa3204
[   29.577486] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   29.585361] x8 : ffff080f31668fa8 x7 : 0000000000000000 x6 : 0000000000000000
[   29.593243] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   29.601125] x2 : 0000000000000000 x1 : fffffffffd000000 x0 : fffffe0000000000
[   29.609008] Call trace:
[   29.612201]  vmemmap_populate+0x44/0x194
[   29.616869]  __populate_section_memmap+0x1a4/0x1d8
[   29.622402]  sparse_add_section+0x138/0x1f4
[   29.622406]  __add_pages+0xd8/0x180
[   29.622409]  pagemap_range+0x324/0x41c
[   29.622412]  memremap_pages+0x184/0x2b4
[   29.622413]  devm_memremap_pages+0x30/0x7c
[   29.622416]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   29.652672]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   29.658879]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   29.665585]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   29.671937]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   29.678023]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   29.684368]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   29.690276]  local_pci_probe+0x48/0xa0
[   29.694652]  work_for_cpu_fn+0x24/0x40
[   29.699027]  process_one_work+0x1ec/0x470
[   29.703657]  worker_thread+0x200/0x410
[   29.708024]  kthread+0xec/0x100
[   29.711784]  ret_from_fork+0x10/0x20
[   29.715972] ---[ end trace 0000000000000000 ]---
[   29.721306] ------------[ cut here ]------------
[   29.729229] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   29.738295] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   29.772619] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   29.781316] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   29.794547] Workqueue: events work_for_cpu_fn
[   29.799623] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   29.807310] pc : vmemmap_populate+0x44/0x194
[   29.812308] lr : __populate_section_memmap+0x1a4/0x1d8
[   29.818176] sp : ffff80000b14b8c0
[   29.822216] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07f00
[   29.830085] x26: ffff07ffc06fba80 x25: fffffc0000000000 x24: fffffffffd200000
[   29.837954] x23: 0000000000000000 x22: fffffffffd200000 x21: 0000000000000000
[   29.845827] x20: 0000000ffffc0000 x19: fffffffffd000000 x18: 0000000000000002
[   29.853697] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   29.861569] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa724c x12: ffff080f77fecd10
[   29.869442] x11: ffff080f77feccf0 x10: 0000000000000000 x9 : ffffdf31f7f2cf38
[   29.877319] x8 : ffff07ffc06fbb00 x7 : 0000000000000000 x6 : 0000000000000000
[   29.885197] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   29.893078] x2 : 0000000000000000 x1 : fffffffffd200000 x0 : fffffe0000000000
[   29.900961] Call trace:
[   29.904152]  vmemmap_populate+0x44/0x194
[   29.908823]  __populate_section_memmap+0x1a4/0x1d8
[   29.914364]  sparse_add_section+0x138/0x1f4
[   29.919290]  __add_pages+0xd8/0x180
[   29.923491]  pagemap_range+0x324/0x41c
[   29.927924]  memremap_pages+0x184/0x2b4
[   29.932429]  devm_memremap_pages+0x30/0x7c
[   29.937177]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   29.943030]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   29.949216]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   29.955920]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   29.962270]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   29.968355]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   29.974698]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   29.980605]  local_pci_probe+0x48/0xa0
[   29.984982]  work_for_cpu_fn+0x24/0x40
[   29.989359]  process_one_work+0x1ec/0x470
[   29.993990]  worker_thread+0x200/0x410
[   29.998358]  kthread+0xec/0x100
[   30.002119]  ret_from_fork+0x10/0x20
[   30.006310] ---[ end trace 0000000000000000 ]---
[   30.011666] ------------[ cut here ]------------
[   30.019575] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   30.028639] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   30.062956] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   30.071653] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   30.084885] Workqueue: events work_for_cpu_fn
[   30.089963] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   30.097653] pc : vmemmap_populate+0x44/0x194
[   30.102655] lr : __populate_section_memmap+0x1a4/0x1d8
[   30.108522] sp : ffff80000b14b8c0
[   30.112553] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07f20
[   30.120413] x26: ffff080f3166cf80 x25: fffffc0000000000 x24: fffffffffd400000
[   30.128277] x23: 0000000000000000 x22: fffffffffd400000 x21: 0000000000000000
[   30.128281] x20: 0000000ffffc8000 x19: fffffffffd200000 x18: 0000000000000002
[   30.128284] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   30.128287] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa724c x12: ffffdf31f6fa3204
[   30.128290] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   30.161922] x8 : ffff080f3166cfa8 x7 : 0000000000000000 x6 : 0000000000000000
[   30.161925] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   30.161928] x2 : 0000000000000000 x1 : fffffffffd400000 x0 : fffffe0000000000
[   30.161931] Call trace:
[   30.161932]  vmemmap_populate+0x44/0x194
[   30.161937]  __populate_section_memmap+0x1a4/0x1d8
[   30.161941]  sparse_add_section+0x138/0x1f4
[   30.161944]  __add_pages+0xd8/0x180
[   30.161947]  pagemap_range+0x324/0x41c
[   30.161950]  memremap_pages+0x184/0x2b4
[   30.161952]  devm_memremap_pages+0x30/0x7c
[   30.161954]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   30.234300]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   30.234801]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   30.235288]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   30.253390]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   30.259474]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   30.265808]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   30.271705]  local_pci_probe+0x48/0xa0
[   30.276069]  work_for_cpu_fn+0x24/0x40
[   30.280437]  process_one_work+0x1ec/0x470
[   30.285061]  worker_thread+0x200/0x410
[   30.289418]  kthread+0xec/0x100
[   30.293165]  ret_from_fork+0x10/0x20
[   30.297342] ---[ end trace 0000000000000000 ]---
[   30.302690] ------------[ cut here ]------------
[   30.310586] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   30.319643] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   30.353944] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   30.362629] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   30.375849] Workqueue: events work_for_cpu_fn
[   30.380915] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   30.388594] pc : vmemmap_populate+0x44/0x194
[   30.393583] lr : __populate_section_memmap+0x1a4/0x1d8
[   30.399443] sp : ffff80000b14b8c0
[   30.403474] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07f40
[   30.411333] x26: ffff080f31672000 x25: fffffc0000000000 x24: fffffffffd600000
[   30.419191] x23: 0000000000000000 x22: fffffffffd600000 x21: 0000000000000000
[   30.427052] x20: 0000000ffffd0000 x19: fffffffffd400000 x18: 0000000000000002
[   30.434911] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   30.442772] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffffdf31f7737078
[   30.450635] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   30.458499] x8 : ffff080f31672028 x7 : 0000000000000000 x6 : 0000000000000000
[   30.466364] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   30.474234] x2 : 0000000000000000 x1 : fffffffffd600000 x0 : fffffe0000000000
[   30.482104] Call trace:
[   30.485281]  vmemmap_populate+0x44/0x194
[   30.489939]  __populate_section_memmap+0x1a4/0x1d8
[   30.495469]  sparse_add_section+0x138/0x1f4
[   30.500384]  __add_pages+0xd8/0x180
[   30.504577]  pagemap_range+0x324/0x41c
[   30.508995]  memremap_pages+0x184/0x2b4
[   30.513484]  devm_memremap_pages+0x30/0x7c
[   30.518226]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   30.524063]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   30.530234]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   30.536921]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   30.543255]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   30.549322]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   30.555648]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   30.561538]  local_pci_probe+0x48/0xa0
[   30.565897]  work_for_cpu_fn+0x24/0x40
[   30.570259]  process_one_work+0x1ec/0x470
[   30.574876]  worker_thread+0x200/0x410
[   30.579229]  kthread+0xec/0x100
[   30.582971]  ret_from_fork+0x10/0x20
[   30.587146] ---[ end trace 0000000000000000 ]---
[   30.592500] ------------[ cut here ]------------
[   30.600376] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   30.609430] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   30.643728] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   30.643731] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   30.643733] Workqueue: events work_for_cpu_fn
[   30.643738] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   30.643742] pc : vmemmap_populate+0x44/0x194
[   30.685609] lr : __populate_section_memmap+0x1a4/0x1d8
[   30.685614] sp : ffff80000b14b8c0
[   30.685615] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07f60
[   30.685618] x26: ffff080f31674f80 x25: fffffc0000000000 x24: fffffffffd800000
[   30.685621] x23: 0000000000000000 x22: fffffffffd800000 x21: 0000000000000000
[   30.685625] x20: 0000000ffffd8000 x19: fffffffffd600000 x18: 0000000000000002
[   30.685627] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   30.685630] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa724c x12: ffffdf31f6fa3204
[   30.685634] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   30.685637] x8 : ffff080f31674fa8 x7 : 0000000000000000 x6 : 0000000000000000
[   30.685640] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   30.685642] x2 : 0000000000000000 x1 : fffffffffd800000 x0 : fffffe0000000000
[   30.685646] Call trace:
[   30.685647]  vmemmap_populate+0x44/0x194
[   30.685650]  __populate_section_memmap+0x1a4/0x1d8
[   30.685653]  sparse_add_section+0x138/0x1f4
[   30.685656]  __add_pages+0xd8/0x180
[   30.685659]  pagemap_range+0x324/0x41c
[   30.685661]  memremap_pages+0x184/0x2b4
[   30.685663]  devm_memremap_pages+0x30/0x7c
[   30.685665]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   30.814973]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   30.815474]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   30.815961]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   30.834099]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   30.840178]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   30.846510]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   30.852404]  local_pci_probe+0x48/0xa0
[   30.856765]  work_for_cpu_fn+0x24/0x40
[   30.861129]  process_one_work+0x1ec/0x470
[   30.865749]  worker_thread+0x200/0x410
[   30.870105]  kthread+0xec/0x100
[   30.873852]  ret_from_fork+0x10/0x20
[   30.878027] ---[ end trace 0000000000000000 ]---
[   30.883356] ------------[ cut here ]------------
[   30.891258] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   30.900310] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   30.934607] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   30.943292] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   30.956510] Workqueue: events work_for_cpu_fn
[   30.961573] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   30.969252] pc : vmemmap_populate+0x44/0x194
[   30.974240] lr : __populate_section_memmap+0x1a4/0x1d8
[   30.980098] sp : ffff80000b14b8c0
[   30.984126] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07f80
[   30.991982] x26: ffff080f31676000 x25: fffffc0000000000 x24: fffffffffda00000
[   30.999839] x23: 0000000000000000 x22: fffffffffda00000 x21: 0000000000000000
[   31.007698] x20: 0000000ffffe0000 x19: fffffffffd800000 x18: 0000000000000002
[   31.015555] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   31.023416] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffffdf31f7737078
[   31.031276] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   31.039138] x8 : ffff080f31676028 x7 : 0000000000000000 x6 : 0000000000000000
[   31.047003] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   31.054869] x2 : 0000000000000000 x1 : fffffffffda00000 x0 : fffffe0000000000
[   31.062736] Call trace:
[   31.065913]  vmemmap_populate+0x44/0x194
[   31.070573]  __populate_section_memmap+0x1a4/0x1d8
[   31.076102]  sparse_add_section+0x138/0x1f4
[   31.081016]  __add_pages+0xd8/0x180
[   31.085209]  pagemap_range+0x324/0x41c
[   31.089627]  memremap_pages+0x184/0x2b4
[   31.094114]  devm_memremap_pages+0x30/0x7c
[   31.098856]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   31.104696]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   31.110864]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   31.117554]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   31.123887]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   31.132442]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   31.138780]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   31.144682]  local_pci_probe+0x48/0xa0
[   31.149057]  work_for_cpu_fn+0x24/0x40
[   31.153429]  process_one_work+0x1ec/0x470
[   31.158057]  worker_thread+0x200/0x410
[   31.162424]  kthread+0xec/0x100
[   31.166180]  ret_from_fork+0x10/0x20
[   31.170368] ---[ end trace 0000000000000000 ]---
[   31.175737] ------------[ cut here ]------------
[   31.183622] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   31.192691] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   31.227022] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   31.235723] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   31.248959] Workqueue: events work_for_cpu_fn
[   31.254039] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   31.261734] pc : vmemmap_populate+0x44/0x194
[   31.266737] lr : __populate_section_memmap+0x1a4/0x1d8
[   31.272609] sp : ffff80000b14b8c0
[   31.276653] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07fa0
[   31.284524] x26: ffff07ffc06fb100 x25: fffffc0000000000 x24: fffffffffdc00000
[   31.292396] x23: 0000000000000000 x22: fffffffffdc00000 x21: 0000000000000000
[   31.300271] x20: 0000000ffffe8000 x19: fffffffffda00000 x18: 0000000000000002
[   31.308143] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   31.316018] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffff080f77fecd10
[   31.323895] x11: ffff080f77feccf0 x10: 0000000000000000 x9 : ffffdf31f7f2cf38
[   31.331774] x8 : ffff07ffc06fb180 x7 : 0000000000000000 x6 : 0000000000000000
[   31.339655] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   31.347539] x2 : 0000000000000000 x1 : fffffffffdc00000 x0 : fffffe0000000000
[   31.355424] Call trace:
[   31.358618]  vmemmap_populate+0x44/0x194
[   31.363292]  __populate_section_memmap+0x1a4/0x1d8
[   31.368837]  sparse_add_section+0x138/0x1f4
[   31.373766]  __add_pages+0xd8/0x180
[   31.377970]  pagemap_range+0x324/0x41c
[   31.382403]  memremap_pages+0x184/0x2b4
[   31.386907]  devm_memremap_pages+0x30/0x7c
[   31.391658]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   31.397513]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   31.403703]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   31.410409]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   31.416761]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   31.422851]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   31.429197]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   31.435107]  local_pci_probe+0x48/0xa0
[   31.439486]  work_for_cpu_fn+0x24/0x40
[   31.443865]  process_one_work+0x1ec/0x470
[   31.448500]  worker_thread+0x200/0x410
[   31.452870]  kthread+0xec/0x100
[   31.456634]  ret_from_fork+0x10/0x20
[   31.460827] ---[ end trace 0000000000000000 ]---
[   31.466173] ------------[ cut here ]------------
[   31.474091] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   31.483157] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   31.517480] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   31.526179] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   31.539413] Workqueue: events work_for_cpu_fn
[   31.544493] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   31.552185] pc : vmemmap_populate+0x44/0x194
[   31.557186] lr : __populate_section_memmap+0x1a4/0x1d8
[   31.563060] sp : ffff80000b14b8c0
[   31.567104] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07fc0
[   31.574976] x26: ffff080f3167af80 x25: fffffc0000000000 x24: fffffffffde00000
[   31.582842] x23: 0000000000000000 x22: fffffffffde00000 x21: 0000000000000000
[   31.590706] x20: 0000000fffff0000 x19: fffffffffdc00000 x18: 0000000000000002
[   31.598567] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   31.606431] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffffdf31f7737078
[   31.614295] x11: ffffdf31f6ef72a4 x10: ffffdf31f6fb0bbc x9 : ffffdf31f7f2cf38
[   31.622160] x8 : ffff080f3167afa8 x7 : 0000000000000000 x6 : 0000000000000000
[   31.630031] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   31.630035] x2 : 0000000000000000 x1 : fffffffffde00000 x0 : fffffe0000000000
[   31.630038] Call trace:
[   31.630039]  vmemmap_populate+0x44/0x194
[   31.630044]  __populate_section_memmap+0x1a4/0x1d8
[   31.661326]  sparse_add_section+0x138/0x1f4
[   31.661330]  __add_pages+0xd8/0x180
[   31.661334]  pagemap_range+0x324/0x41c
[   31.661336]  memremap_pages+0x184/0x2b4
[   31.661338]  devm_memremap_pages+0x30/0x7c
[   31.661340]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   31.688944]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   31.689445]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   31.689930]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   31.708096]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   31.714193]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   31.720539]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   31.726449]  local_pci_probe+0x48/0xa0
[   31.730827]  work_for_cpu_fn+0x24/0x40
[   31.735207]  process_one_work+0x1ec/0x470
[   31.739840]  worker_thread+0x200/0x410
[   31.744210]  kthread+0xec/0x100
[   31.747969]  ret_from_fork+0x10/0x20
[   31.752158] ---[ end trace 0000000000000000 ]---
[   31.757495] ------------[ cut here ]------------
[   31.765415] WARNING: CPU: 0 PID: 452 at arch/arm64/mm/mmu.c:1197
vmemmap_populate+0x44/0x194
[   31.774481] Modules linked in: amdgpu(+) onboard_usb_hub bridge stp
llc raid1 ixgbe video gpu_sched crct10dif_ce polyval_ce drm_buddy nvme
polyval_generic ast drm_display_helper igb ghash_ce nvme_core
sbsa_gwdt drm_vram_helper cec drm_ttm_helper ttm nvme_common mdio
xgene_hwmon gpio_dwapb scsi_dh_rdac scsi_dh_emc scsi_dh_alua
ip6_tables ip_tables dm_multipath i2c_dev fuse
[   31.808805] CPU: 0 PID: 452 Comm: kworker/0:5 Tainted: G        W
       6.1.0-rc1 #5
[   31.817503] Hardware name: ADLINK AVA Developer Platform/AVA
Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
09/08/2022
[   31.830736] Workqueue: events work_for_cpu_fn
[   31.835817] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   31.843508] pc : vmemmap_populate+0x44/0x194
[   31.848507] lr : __populate_section_memmap+0x1a4/0x1d8
[   31.854377] sp : ffff80000b14b8c0
[   31.858418] x29: ffff80000b14b8c0 x28: ffff07ffd6502000 x27: ffff07ffd2f07fe0
[   31.866287] x26: ffff080eb35b9900 x25: fffffc0000000000 x24: fffffffffe000000
[   31.874156] x23: 0000000000000000 x22: fffffffffe000000 x21: 0000000000000000
[   31.882026] x20: 0000000fffff8000 x19: fffffffffde00000 x18: 0000000000000002
[   31.889898] x17: 0000000000000001 x16: ffffdf31f7cac0e4 x15: ffffdf31a00e8af8
[   31.897770] x14: ffffdf31a00f0f48 x13: ffffdf31f6fa3204 x12: ffff080f77fecd10
[   31.905644] x11: ffff080f77feccf0 x10: 0000000000000000 x9 : ffffdf31f7f2cf38
[   31.913523] x8 : ffff080eb35b9980 x7 : 0000000000000000 x6 : 0000000000000000
[   31.921401] x5 : 0000000000000001 x4 : ffff07ffbbe40aa0 x3 : 0000000000000000
[   31.929282] x2 : 0000000000000000 x1 : fffffffffe000000 x0 : fffffe0000000000
[   31.937162] Call trace:
[   31.940351]  vmemmap_populate+0x44/0x194
[   31.945022]  __populate_section_memmap+0x1a4/0x1d8
[   31.950564]  sparse_add_section+0x138/0x1f4
[   31.955492]  __add_pages+0xd8/0x180
[   31.959701]  pagemap_range+0x324/0x41c
[   31.964132]  memremap_pages+0x184/0x2b4
[   31.968634]  devm_memremap_pages+0x30/0x7c
[   31.973390]  svm_migrate_init+0xd8/0x18c [amdgpu]
[   31.979243]  kgd2kfd_device_init+0x39c/0x5c0 [amdgpu]
[   31.985430]  amdgpu_amdkfd_device_init+0x140/0x1e0 [amdgpu]
[   31.992134]  amdgpu_device_ip_init+0x538/0x588 [amdgpu]
[   31.998485]  amdgpu_device_init+0x830/0xc70 [amdgpu]
[   32.004571]  amdgpu_driver_load_kms+0x28/0x1a0 [amdgpu]
[   32.010915]  amdgpu_pci_probe+0x188/0x3f0 [amdgpu]
[   32.016822]  local_pci_probe+0x48/0xa0
[   32.021195]  work_for_cpu_fn+0x24/0x40
[   32.025570]  process_one_work+0x1ec/0x470
[   32.030200]  worker_thread+0x200/0x410
[   32.034567]  kthread+0xec/0x100
[   32.038325]  ret_from_fork+0x10/0x20
[   32.042513] ---[ end trace 0000000000000000 ]---
[   32.062468] memmap_init_zone_device initialised 1048576 pages in 10ms
[   32.071553] amdgpu: HMM registered 4080MB device memory
[   32.079584] amdgpu: Virtual CRAT table created for GPU
[   32.087603] amdgpu: Topology: Add dGPU node [0x743f:0x1002]
[   32.095752] kfd kfd: amdgpu: added device 1002:743f
[   32.103387] amdgpu 000d:03:00.0: amdgpu: SE 1, SH per SE 2, CU per
SH 8, active_cu_number 16
[   32.114745] amdgpu 000d:03:00.0: amdgpu: ring gfx_0.0.0 uses VM inv
eng 0 on hub 0
[   32.124947] amdgpu 000d:03:00.0: amdgpu: ring comp_1.0.0 uses VM
inv eng 1 on hub 0
[   32.124950] amdgpu 000d:03:00.0: amdgpu: ring comp_1.1.0 uses VM
inv eng 4 on hub 0
[   32.124952] amdgpu 000d:03:00.0: amdgpu: ring comp_1.2.0 uses VM
inv eng 5 on hub 0
[   32.124953] amdgpu 000d:03:00.0: amdgpu: ring comp_1.3.0 uses VM
inv eng 6 on hub 0
[   32.124955] amdgpu 000d:03:00.0: amdgpu: ring comp_1.0.1 uses VM
inv eng 7 on hub 0
[   32.124957] amdgpu 000d:03:00.0: amdgpu: ring comp_1.1.1 uses VM
inv eng 8 on hub 0
[   32.124959] amdgpu 000d:03:00.0: amdgpu: ring comp_1.2.1 uses VM
inv eng 9 on hub 0
[   32.124961] amdgpu 000d:03:00.0: amdgpu: ring comp_1.3.1 uses VM
inv eng 10 on hub 0
[   32.208193] amdgpu 000d:03:00.0: amdgpu: ring kiq_2.1.0 uses VM inv
eng 11 on hub 0
[   32.208196] amdgpu 000d:03:00.0: amdgpu: ring sdma0 uses VM inv eng
12 on hub 0
[   32.208198] amdgpu 000d:03:00.0: amdgpu: ring vcn_dec_0 uses VM inv
eng 0 on hub 1
[   32.234548] [drm] Initialized amdgpu 3.49.0 20150101 for
000d:03:00.0 on minor 1
[   32.298110] amdgpu 000d:03:00.0: [drm] fb1: amdgpudrmfb frame buffer device

On Sat, Nov 5, 2022 at 5:54 PM Dennis Gilmore <dennis@ausil.us> wrote:
>
> I have an Ampere Altra machine that I have put a Radeon 6500 XT card
> on seeing the pull request for drm-next-6.2
> https://lore.kernel.org/dri-devel/20221104205827.6008-1-alexander.deucher@amd.com/
> I grabbed the tree and built it.  On boot I am getting
>
> [   23.877255] [drm] amdgpu kernel modesetting enabled.
> [   23.883774] amdgpu: CRAT table disabled by module option
> [   23.889530] amdgpu: IO link not available for non x86 platforms
> [   23.890039] ixgbe 0005:01:00.1 enP5p1s0f1: renamed from eth1
> [   23.895485] amdgpu: Virtual CRAT table created for CPU
> [   23.907170] amdgpu: Topology: Add CPU node
> [   23.913989] amdgpu 000d:03:00.0: Adding to iommu group 23
> [   23.923394] [drm] initializing kernel modesetting (BEIGE_GOBY
> 0x1002:0x743F 0x1EAE:0x6401 0xC1).
> [   23.932333] [drm] register mmio base: 0x50000000
> [   23.937023] [drm] register mmio size: 1048576
> [   23.948575] [drm] add ip block number 0 <nv_common>
> [   23.953520] [drm] add ip block number 1 <gmc_v10_0>
> [   23.958431] [drm] add ip block number 2 <navi10_ih>
> [   23.963367] [drm] add ip block number 3 <psp>
> [   23.967754] [drm] add ip block number 4 <smu>
> [   23.972142] [drm] add ip block number 5 <dm>
> [   23.976462] [drm] add ip block number 6 <gfx_v10_0>
> [   23.981373] [drm] add ip block number 7 <sdma_v5_2>
> [   23.986302] [drm] add ip block number 8 <vcn_v3_0>
> [   23.991265] amdgpu 000d:03:00.0: amdgpu: Fetched VBIOS from VFCT
> [   23.997342] amdgpu: ATOM BIOS: 113-24X46SHB1-D02
> [   24.002011] [drm] VCN(0) decode is enabled in VM mode
> [   24.007118] amdgpu 000d:03:00.0: amdgpu: Trusted Memory Zone (TMZ)
> feature disabled as experimental (default)
> [   24.017125] amdgpu 000d:03:00.0: amdgpu: PCIE atomic ops is not supported
> [   24.026314] [drm] vm size is 262144 GB, 4 levels, block size is
> 9-bit, fragment size is 9-bit
> [   24.034973] amdgpu 000d:03:00.0: BAR 2: releasing [mem
> 0x340010000000-0x3400101fffff 64bit pref]
> [   24.043843] amdgpu 000d:03:00.0: BAR 0: releasing [mem
> 0x340000000000-0x34000fffffff 64bit pref]
> [   24.054541] pcieport 000d:02:00.0: BAR 15: releasing [mem
> 0x340000000000-0x340017ffffff 64bit pref]
> [   24.063994] pcieport 000d:01:00.0: BAR 15: releasing [mem
> 0x340000000000-0x340017ffffff 64bit pref]
> [   24.073130] pcieport 000d:00:01.0: BAR 15: releasing [mem
> 0x340000000000-0x340017ffffff 64bit pref]
> [   24.082245] pcieport 000d:00:01.0: bridge window [io
> 0x1000-0x0fff] to [bus 01-03] add_size 1000
> [   24.091333] pcieport 000d:00:01.0: BAR 15: assigned [mem
> 0x340000000000-0x34017fffffff 64bit pref]
> [   24.100395] pcieport 000d:00:01.0: BAR 13: no space for [io  size 0x1000]
> [   24.107255] pcieport 000d:00:01.0: BAR 13: failed to assign [io  size 0x1000]
> [   24.114472] pcieport 000d:00:01.0: BAR 13: no space for [io  size 0x1000]
> [   24.121308] pcieport 000d:00:01.0: BAR 13: failed to assign [io  size 0x1000]
> [   24.128523] pcieport 000d:01:00.0: BAR 15: assigned [mem
> 0x340000000000-0x34017fffffff 64bit pref]
> [   24.137599] pcieport 000d:02:00.0: BAR 15: assigned [mem
> 0x340000000000-0x34017fffffff 64bit pref]
> [   24.146660] amdgpu 000d:03:00.0: BAR 0: assigned [mem
> 0x340000000000-0x3400ffffffff 64bit pref]
> [   24.155457] amdgpu 000d:03:00.0: BAR 2: assigned [mem
> 0x340100000000-0x3401001fffff 64bit pref]
> [   24.164244] pcieport 000d:00:01.0: PCI bridge to [bus 01-03]
> [   24.169950] pcieport 000d:00:01.0:   bridge window [mem
> 0x50000000-0x502fffff]
> [   24.177242] pcieport 000d:00:01.0:   bridge window [mem
> 0x340000000000-0x34017fffffff 64bit pref]
> [   24.187449] pcieport 000d:01:00.0: PCI bridge to [bus 02-03]
> [   24.194289] pcieport 000d:01:00.0:   bridge window [mem
> 0x50000000-0x501fffff]
> [   24.204225] pcieport 000d:01:00.0:   bridge window [mem
> 0x340000000000-0x34017fffffff 64bit pref]
> [   24.214216] pcieport 000d:02:00.0: PCI bridge to [bus 03]
> [   24.220666] pcieport 000d:02:00.0:   bridge window [mem
> 0x50000000-0x501fffff]
> [   24.228944] pcieport 000d:02:00.0:   bridge window [mem
> 0x340000000000-0x34017fffffff 64bit pref]
> [   24.238884] amdgpu 000d:03:00.0: amdgpu: VRAM: 4080M
> 0x0000008000000000 - 0x00000080FEFFFFFF (4080M used)
> [   24.249475] amdgpu 000d:03:00.0: amdgpu: GART: 512M
> 0x0000000000000000 - 0x000000001FFFFFFF
> [   24.258839] amdgpu 000d:03:00.0: amdgpu: AGP: 267894784M
> 0x0000008400000000 - 0x0000FFFFFFFFFFFF
> [   24.268646] [drm] Detected VRAM RAM=4080M, BAR=4096M
> [   24.274620] [drm] RAM width 64bits GDDR6
> [   24.326191] [drm] amdgpu: 4080M of VRAM memory ready
> [   24.332137] [drm] amdgpu: 31878M of GTT memory ready.
> [   24.338485] [drm] GART: num cpu pages 131072, num gpu pages 131072
> [   24.346101] [drm] PCIE GART of 512M enabled (table at 0x0000008000300000).
> [   24.431009] amdgpu 000d:03:00.0: amdgpu: PSP runtime database doesn't exist
> [   24.439084] amdgpu 000d:03:00.0: amdgpu: PSP runtime database doesn't exist
> [   24.681141] ixgbe 0005:01:00.0: registered PHC device on enP5p1s0f0
> [   24.888758] ixgbe 0005:01:00.0 enP5p1s0f0: detected SFP+: 5
> [   25.042801] ixgbe 0005:01:00.0 enP5p1s0f0: NIC Link is Up 10 Gbps,
> Flow Control: RX/TX
> [   25.516179] ixgbe 0005:01:00.1: registered PHC device on enP5p1s0f1
> [   25.718747] ixgbe 0005:01:00.1 enP5p1s0f1: detected SFP+: 6
> [   25.872810] ixgbe 0005:01:00.1 enP5p1s0f1: NIC Link is Up 10 Gbps,
> Flow Control: RX/TX
> [   26.422200] IPv6: ADDRCONF(NETDEV_CHANGE): enP5p1s0f0: link becomes ready
> [   26.501022] IPv6: ADDRCONF(NETDEV_CHANGE): enP5p1s0f1: link becomes ready
> [   26.554181] br0: port 1(enP5p1s0f1) entered blocking state
> [   26.560834] br0: port 1(enP5p1s0f1) entered disabled state
> [   26.561733] amdgpu 000d:03:00.0: amdgpu: STB initialized to 2048 entries
> [   26.580331] device enP5p1s0f1 entered promiscuous mode
> [   26.586637] audit: type=1700 audit(1667665332.890:21):
> dev=enP5p1s0f1 prom=256 old_prom=0 auid=4294967295 uid=0 gid=0
> ses=4294967295
> [   26.590559] br0: port 1(enP5p1s0f1) entered blocking state
> [   26.606149] br0: port 1(enP5p1s0f1) entered listening state
> [   26.623013] audit: type=1300 audit(1667665332.890:21):
> arch=c00000b7 syscall=211 success=yes exit=40 a0=d a1=fffff4030ef0
> a2=0 a3=0 items=0 ppid=1 pid=1022 auid=4294967295 uid=0 gid=0 euid=0
> suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295
> comm="NetworkManager" exe="/usr/sbin/NetworkManager" subj=kernel
> key=(null)
> [   26.634704] [drm] Loading DMUB firmware via PSP: version=0x02020013
> [   26.652070] audit: type=1327 audit(1667665332.890:21):
> proctitle=2F7573722F7362696E2F
> 4E6574776F726B4D616E6167657200
> 2D2D6465627567
> [   26.787231] [drm] use_doorbell being set to: [true]
> [   26.874022] [drm] Found VCN firmware Version ENC: 1.24 DEC: 2 VEP:
> 0 Revision: 0
> [   26.882692] amdgpu 000d:03:00.0: amdgpu: Will use PSP to load VCN firmware
> [   27.005497] [drm] reserve 0xa00000 from 0x8001000000 for PSP TMR
> [   27.166769] amdgpu 000d:03:00.0: amdgpu: RAS: optional ras ta ucode
> is not available
> [   27.213836] amdgpu 000d:03:00.0: amdgpu: SECUREDISPLAY:
> securedisplay ta ucode is not available
> [   27.223838] amdgpu 000d:03:00.0: amdgpu: smu driver if version =
> 0x0000000d, smu fw if version = 0x0000000f, smu fw program = 0,
> version = 0x00491c00 (73.28.0)
> [   27.239284] amdgpu 000d:03:00.0: amdgpu: SMU driver if version not matched
> [   27.247346] amdgpu 000d:03:00.0: amdgpu: use vbios provided pptable
> [   27.306402] amdgpu 000d:03:00.0: amdgpu: SMU is initialized successfully!
> [   27.316825] [drm] Display Core initialized with v3.2.207!
> [   27.324625] [drm] DMUB hardware initialized: version=0x02020013
> [   27.751598] [drm] kiq ring mec 2 pipe 1 q 0
> [   28.087911] amdgpu 000d:03:00.0: [drm:amdgpu_ring_test_helper
> [amdgpu]] *ERROR* ring kiq_2.1.0 test failed (-110)
> [   28.099959] [drm:amdgpu_gfx_enable_kcq [amdgpu]] *ERROR* KCQ enable failed
> [   28.108490] [drm:amdgpu_device_ip_init [amdgpu]] *ERROR* hw_init of
> IP block <gfx_v10_0> failed -110
> [   28.119290] amdgpu 000d:03:00.0: amdgpu: amdgpu_device_ip_init failed
> [   28.126875] amdgpu 000d:03:00.0: amdgpu: Fatal error during GPU init
> [   28.134482] amdgpu 000d:03:00.0: amdgpu: amdgpu: finishing device.
> [   28.144167] [drm] DSC precompute is not needed.
> [   28.203259] amdgpu 000d:03:00.0: amdgpu: free PSP TMR buffer
> [   29.522686] amdgpu: probe of 000d:03:00.0 failed with error -110
> [   29.533000] INFO: trying to register non-static key.
> [   29.539074] The code is fine but needs lockdep annotation, or maybe
> [   29.546370] you didn't initialize this object before use?
> [   29.552748] turning off the locking correctness validator.
> [   29.559182] CPU: 27 PID: 926 Comm: systemd-udevd Not tainted
> 6.1.0-0.rc1.20221018gitbb1a1146467a.16.fc38.aarch64 #1
> [   29.570673] Hardware name: ADLINK AVA Developer Platform/AVA
> Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
> 09/08/2022
> [   29.584253] Call trace:
> [   29.587659]  dump_backtrace+0xe8/0x140
> [   29.592382]  show_stack+0x20/0x50
> [   29.596699]  dump_stack_lvl+0x88/0xb4
> [   29.601332]  dump_stack+0x18/0x34
> [   29.605588]  register_lock_class+0x470/0x4a0
> [   29.610800]  __lock_acquire+0x68/0x9c0
> [   29.615509]  lock_acquire.part.0+0xe0/0x214
> [   29.620674]  lock_acquire+0xa8/0x20c
> [   29.625190]  _raw_spin_lock+0x60/0xc4
> [   29.629761]  drm_sched_fini+0x94/0xc0 [gpu_sched]
> [   29.635387]  amdgpu_fence_driver_sw_fini+0x120/0x124 [amdgpu]
> [   29.642652]  amdgpu_device_fini_sw+0x28/0x230 [amdgpu]
> [   29.649262]  amdgpu_driver_release_kms+0x24/0x40 [amdgpu]
> [   29.656079]  drm_dev_put.part.0+0x88/0xc0
> [   29.661004]  devm_drm_dev_init_release+0x1c/0x30
> [   29.666601]  devm_action_release+0x1c/0x2c
> [   29.671629]  devres_release_all+0xb0/0x110
> [   29.676632]  device_unbind_cleanup+0x20/0x70
> [   29.681798]  really_probe+0x208/0x3e0
> [   29.686416]  __driver_probe_device+0x84/0x190
> [   29.691718]  driver_probe_device+0x44/0x120
> [   29.696839]  __driver_attach+0x104/0x200
> [   29.701640]  bus_for_each_dev+0x6c/0xac
> [   29.706336]  driver_attach+0x2c/0x40
> [   29.710863]  bus_add_driver+0x184/0x240
> [   29.715612]  driver_register+0x80/0x13c
> [   29.720365]  __pci_register_driver+0x68/0x80
> [   29.725501]  amdgpu_init+0x78/0x1000 [amdgpu]
> [   29.731239]  do_one_initcall+0x94/0x45c
> [   29.736003]  do_init_module+0x50/0x204
> [   29.740657]  load_module+0x9b8/0xb20
> [   29.745092]  __do_sys_init_module+0x128/0x144
> [   29.750270]  __arm64_sys_init_module+0x24/0x30
> [   29.755550]  invoke_syscall+0x78/0x100
> [   29.760137]  el0_svc_common.constprop.0+0x104/0x124
> [   29.765827]  do_el0_svc+0x34/0x4c
> [   29.769887]  el0_svc+0x50/0x140
> [   29.773762]  el0t_64_sync_handler+0xf4/0x120
> [   29.778757]  el0t_64_sync+0x190/0x194
> [   29.783216] Unable to handle kernel NULL pointer dereference at
> virtual address 00000000000000d0
> [   29.792821] Mem abort info:
> [   29.796349]   ESR = 0x0000000096000044
> [   29.800819]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   29.806926]   SET = 0, FnV = 0
> [   29.810724]   EA = 0, S1PTW = 0
> [   29.814598]   FSC = 0x04: level 0 translation fault
> [   29.820167] Data abort info:
> [   29.823735]   ISV = 0, ISS = 0x00000044
> [   29.828251]   CM = 0, WnR = 1
> [   29.831909] user pgtable: 4k pages, 48-bit VAs, pgdp=000008002bb15000
> [   29.839085] [00000000000000d0] pgd=0000000000000000, p4d=0000000000000000
> [   29.846578] Internal error: Oops: 0000000096000044 [#1] SMP
> [   29.852825] Modules linked in: amdgpu(+) bridge raid1 stp llc video
> gpu_sched drm_buddy crct10dif_ce polyval_ce polyval_generic ghash_ce
> sbsa_gwdt drm_display_helper cec nvme ixgbe nvme_core igb ast
> nvme_common drm_vram_helper drm_ttm_helper mdio ttm xgene_hwmon
> gpio_dwapb onboard_usb_hub scsi_dh_rdac scsi_dh_emc scsi_dh_alua
> ip6_tables ip_tables dm_multipath i2c_dev fuse
> [   29.887379] CPU: 27 PID: 926 Comm: systemd-udevd Not tainted
> 6.1.0-0.rc1.20221018gitbb1a1146467a.16.fc38.aarch64 #1
> [   29.898528] Hardware name: ADLINK AVA Developer Platform/AVA
> Developer Platform, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308)
> 09/08/2022
> [   29.911770] pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   29.919454] pc : drm_sched_fini+0xa0/0xc0 [gpu_sched]
> [   29.925225] lr : drm_sched_fini+0x94/0xc0 [gpu_sched]
> [   29.930979] sp : ffff80000cfc36c0
> [   29.934981] x29: ffff80000cfc36c0 x28: 0000000000000000 x27: 0000000000000000
> [   29.942812] x26: ffff80000cfc3c20 x25: 0000000000000000 x24: ffff07ffbb108258
> [   29.950635] x23: ffff07ffbb10c5f0 x22: ffff07ffbb10c740 x21: ffff07ffbb10c5e8
> [   29.958455] x20: 0000000000000001 x19: ffff07ffbb10c790 x18: 0000000000000002
> [   29.966263] x17: 0000000000000001 x16: 0000000000000004 x15: 0000000000000000
> [   29.974052] x14: 0000000000000000 x13: 0000000000000020 x12: 0000000000000000
> [   29.981825] x11: 00000000ffffbfff x10: ffff080f77ed9580 x9 : ffffd6c28065447c
> [   29.989600] x8 : ffff07ffbb10c758 x7 : c0000000ffffbfff x6 : 000000000015ffa8
> [   29.997381] x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffffd6c282744008
> [   30.005171] x2 : ffff314cb1337000 x1 : 0000000000000000 x0 : 0000000000000000
> [   30.005175] Call trace:
> [   30.005177]  drm_sched_fini+0xa0/0xc0 [gpu_sched]
> [   30.005189]  amdgpu_fence_driver_sw_fini+0x120/0x124 [amdgpu]
> [   30.032331]  amdgpu_device_fini_sw+0x28/0x230 [amdgpu]
> [   30.040987]  amdgpu_driver_release_kms+0x24/0x40 [amdgpu]
> [   30.047567]  drm_dev_put.part.0+0x88/0xc0
> [   30.052257]  devm_drm_dev_init_release+0x1c/0x30
> [   30.057552]  devm_action_release+0x1c/0x2c
> [   30.062322]  devres_release_all+0xb0/0x110
> [   30.067089]  device_unbind_cleanup+0x20/0x70
> [   30.072027]  really_probe+0x208/0x3e0
> [   30.076358]  __driver_probe_device+0x84/0x190
> [   30.081383]  driver_probe_device+0x44/0x120
> [   30.086235]  __driver_attach+0x104/0x200
> [   30.090825]  bus_for_each_dev+0x6c/0xac
> [   30.095329]  driver_attach+0x2c/0x40
> [   30.099569]  bus_add_driver+0x184/0x240
> [   30.104071]  driver_register+0x80/0x13c
> [   30.108570]  __pci_register_driver+0x68/0x80
> [   30.113508]  amdgpu_init+0x78/0x1000 [amdgpu]
> [   30.119042]  do_one_initcall+0x94/0x45c
> [   30.123548]  do_init_module+0x50/0x204
> [   30.127967]  load_module+0x9b8/0xb20
> [   30.132208]  __do_sys_init_module+0x128/0x144
> [   30.137230]  __arm64_sys_init_module+0x24/0x30
> [   30.142341]  invoke_syscall+0x78/0x100
> [   30.146755]  el0_svc_common.constprop.0+0x104/0x124
> [   30.152301]  do_el0_svc+0x34/0x4c
> [   30.156283]  el0_svc+0x50/0x140
> [   30.160091]  el0t_64_sync_handler+0xf4/0x120
> [   30.165028]  el0t_64_sync+0x190/0x194
> [   30.169353] Code: 94000de1 f9400261 eb13003f 540000a0 (39034034)
> [   30.176117] ---[ end trace 0000000000000000 ]---
