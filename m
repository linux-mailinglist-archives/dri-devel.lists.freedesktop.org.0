Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE7A6004C3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 03:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0F410EBD3;
	Mon, 17 Oct 2022 01:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ipmail05.adl3.internode.on.net (ipmail05.adl3.internode.on.net
 [150.101.137.13])
 by gabe.freedesktop.org (Postfix) with ESMTP id F40FF10EBD3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 01:14:12 +0000 (UTC)
X-SMTP-MATCH: 1
IronPort-Data: =?us-ascii?q?A9a23=3AEDGTE6rlybu8v7krUJvkXjruTPVeBmIFZBIvg?=
 =?us-ascii?q?KrLsJaIsI4StFCztgarIBmDbqmMZGukLop1Pdjj80JX6JOAyoQwHgQ//CE2F?=
 =?us-ascii?q?34R9JeUCdqTIxz8Y3POc8eTHR865JpANIOQd85uEHWGqk31G7Ww9nMUOYOgH?=
 =?us-ascii?q?+qkUrSYUsxSqa6IcMqS4P5as7ZRbrNA2LBVPSvd4bsenOWHULOV82Yc3lM8s?=
 =?us-ascii?q?8pvmjs21BjBkGtwUmgFWBx+lAS2e0/5rX4oDfrZw3PQGuG4FwMhLgrJ5OnRE?=
 =?us-ascii?q?mjxp3/BBj45+4sXfHHmQpaKVeSPokkPAffk2l4a4HUHuko5HKNaMBsIzWzQx?=
 =?us-ascii?q?pYgoDlOncXYpQMBN7fQmPkHFRxRCTp+FaxA5LLdJ3+zvIqUyQvAfmeEL/BGU?=
 =?us-ascii?q?BtqY9REpbkuaY1J3aZDdmhlggq4r+u32ra6R+VEicEqLc2tN4Qa0llLzSvYF?=
 =?us-ascii?q?uonSJaFYKLH495X9D41ioZFGvO2T+MDdDx3dh3eYhsJAl4RBZ8kp+qsmHD6W?=
 =?us-ascii?q?zRdpBSeoq9fy0HXwRx41rTgKpz5d8GBRchPtk+dqiTN+GGRKh0TMt2SzXyb/?=
 =?us-ascii?q?26wi/Xnky3kXIZUH73Q3vJwgRify3IeDDUSVECnur+3kEOzV99EKFAT4mwpt?=
 =?us-ascii?q?6da3EiqSMTtGh61uniJujYCVNdKVe438geAzuzT+QnxLnQDVCBIbNA9nMs3Q?=
 =?us-ascii?q?yE6k1GOgtXlDCBut7vTTmiSnop4BxumYX1QdDdEPTtdGFNDu8259dl1302UF?=
 =?us-ascii?q?cI4Rfbz08mqTAn6xyTT9H1mw+0H5SIQ//z9pAyYxWv1/96YJjPZLz7/BgqNh?=
 =?us-ascii?q?j6Vrqb8D2Bw1WXm0A=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A6+ptRqOfeBwZYcBcTs2jsMiBIKoaSvp037?=
 =?us-ascii?q?Eqv3ocdfUzSL39qynOpoV/6faasl0ssR0b8+xofZPgfZq+z+8W3WByB8bAYO?=
 =?us-ascii?q?COggLBEGgh1+vfKlbbdBEWmNQx6U4tScZDNOE=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DKAQCyq0xjAAlvkwENTR4BAQsSDEA?=
 =?us-ascii?q?JhkSEToJijjQDiy6FP44qCwFTBAEBhQUChG0mOBMBAgQVAQEGAQEBAQEHBBA?=
 =?us-ascii?q?BOVKFOwaGdgEBAQEDI1YQCw0HAQMCAiYCAiE2Bg4Fgn2CbgOpe3qBMhpnhyk?=
 =?us-ascii?q?NaIFlgREsgWaFIIRvFIQqN4FVRIEUAScPDYJnPoIgggIBAQMdJgaDKziCLgS?=
 =?us-ascii?q?DepBegh6DZzgDGSsdQAMLOzQDFQMUAwUhBwMZDyMNDQQWBwwDAwUlAwICGwc?=
 =?us-ascii?q?CAgMCBhMFAgJNNAgECAQrJA8FAgcvBQQvAh4EBQYRCAIWAgYEBAQEFQIQCAI?=
 =?us-ascii?q?IJhcHExgbGQEFWQ4JIRwOGg0FBhMDIG8FCjgPKC9pKxwbB4EMKigVAwQEAwI?=
 =?us-ascii?q?GEwMgAg0pMRQEKRMPLQcjcQkCAyJlBQMDBCgsAwlAByUkPAdYOgEEAwIQIjw?=
 =?us-ascii?q?GAwkDAiRXdS8RFQUDDRclCAU3GwQIPAIFBlISAgoRAxIPBidID0o+ORYGJ0U?=
 =?us-ascii?q?BNg8OnFQsASUNAQQPUihEGzAIIwpACBcwKQseDwWSBg8HI44og0aKEJJUOjQ?=
 =?us-ascii?q?Hg2OBRAYMmGWGCi6DdoxRhksDGItshG2BCZRAglYgkQmQYg0RBw0MDQIMC4Z?=
 =?us-ascii?q?+gX4zGi5vAYI8UYUeiTYWjkFiAjkCBgEKAQEDCYZMgT2Bal0BAQ?=
Received: from unknown (HELO [127.0.0.1]) ([1.147.111.9])
 by ipmail05.adl3.internode.on.net with ESMTP; 17 Oct 2022 11:44:06 +1030
Date: Mon, 17 Oct 2022 11:43:53 +1030
From: Arthur Marsh <arthur.marsh@internode.on.net>
To: Dave Airlie <airlied@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [git pull] drm fixes for 6.1-rc1
User-Agent: K-9 Mail for Android
In-Reply-To: <CAPM=9txsBf5HJ97tAMOQ8PdiPciK-zqngERUm7hGJO8Zyyqb+w@mail.gmail.com>
References: <CAPM=9ty3DGWa8vnfumgSrpSgWnixWjikb6C0Zk_5bW+deKLVQw@mail.gmail.com>
 <20221016080833.5503-1-user@am64>
 <CAPM=9txsBf5HJ97tAMOQ8PdiPciK-zqngERUm7hGJO8Zyyqb+w@mail.gmail.com>
Message-ID: <C98B32CF-86B0-438D-BC8D-10FA255B3B4F@internode.on.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: daniel.vetter@ffwll.ch, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Dave, I reverted patch 312b4dc11d4f74bfe03ea25ffe04c1f2fdd13cb9 agai=
nst 6=2E1-rc1 and the resulting kernel loaded amdgpu fine on my pc with Cap=
e Verde GPU=2E

Regards,

Arthur=2E=20

On 17 October 2022 8:14:18 am ACDT, Dave Airlie <airlied@gmail=2Ecom> wrot=
e:
>On Sun, 16 Oct 2022 at 18:09, Arthur Marsh
><arthur=2Emarsh@internode=2Eon=2Enet> wrote:
>>
>> From: Arthur Marsh <arthur=2Emarsh@internode=2Eon=2Enet>
>>
>> Hi, the "drm fixes for 6=2E1-rc1" commit caused the amdgpu module to fa=
il
>> with my Cape Verde radeonsi card=2E
>>
>> I haven't been able to bisect the problem to an individual commit, but
>> attach a dmesg extract below=2E
>>
>> I'm happy to supply any other configuration information and test patche=
s=2E
>>
>
>Can you try reverting: it's the only think I can spot that might
>affect a card that old since most changes in that request were for
>display hw you don't have=2E
>
>ommit 312b4dc11d4f74bfe03ea25ffe04c1f2fdd13cb9
>Author: Arunpravin Paneer Selvam <Arunpravin=2EPaneerSelvam@amd=2Ecom>
>Date:   Tue Oct 4 07:33:39 2022 -0700
>
>    drm/amdgpu: Fix VRAM BO swap issue
>
>    DRM buddy manager allocates the contiguous memory requests in
>    a single block or multiple blocks=2E So for the ttm move operation
>    (incase of low vram memory) we should consider all the blocks to
>    compute the total memory size which compared with the struct
>    ttm_resource num_pages in order to verify that the blocks are
>    contiguous for the eviction process=2E
>
>    v2: Added a Fixes tag
>    v3: Rewrite the code to save a bit of calculations and
>        variables (Christian)
>
>    Fixes: c9cad937c0c5 ("drm/amdgpu: add drm buddy support to amdgpu")
>    Signed-off-by: Arunpravin Paneer Selvam <Arunpravin=2EPaneerSelvam@am=
d=2Ecom>
>    Reviewed-by: Christian K=C3=B6nig <christian=2Ekoenig@amd=2Ecom>
>    Signed-off-by: Alex Deucher <alexander=2Edeucher@amd=2Ecom>
>
>
>Thanks,
>Dave=2E
>
>> Arthur=2E
>>
>>  Linux version 6=2E0=2E0+ (root@am64) (gcc-12 (Debian 12=2E2=2E0-5) 12=
=2E2=2E0, GNU ld (GNU Binutils for Debian) 2=2E39) #5179 SMP PREEMPT_DYNAMI=
C Fri Oct 14 17:00:40 ACDT 2022
>>  Command line: BOOT_IMAGE=3D/vmlinuz-6=2E0=2E0+ root=3DUUID=3D39706f53-=
7c27-4310-b22a-36c7b042d1a1 ro single amdgpu=2Eaudio=3D1 amdgpu=2Esi_suppor=
t=3D1 radeon=2Esi_support=3D0 page_owner=3Don amdgpu=2Egpu_recovery=3D1
>> =2E=2E=2E
>>
>>  [drm] amdgpu kernel modesetting enabled=2E
>>  amdgpu 0000:01:00=2E0: vgaarb: deactivate vga console
>>  Console: switching to colour dummy device 80x25
>>  [drm] initializing kernel modesetting (VERDE 0x1002:0x682B 0x1458:0x22=
CA 0x87)=2E
>>  [drm] register mmio base: 0xFE8C0000
>>  [drm] register mmio size: 262144
>>  [drm] add ip block number 0 <si_common>
>>  [drm] add ip block number 1 <gmc_v6_0>
>>  [drm] add ip block number 2 <si_ih>
>>  [drm] add ip block number 3 <gfx_v6_0>
>>  [drm] add ip block number 4 <si_dma>
>>  [drm] add ip block number 5 <si_dpm>
>>  [drm] add ip block number 6 <dce_v6_0>
>>  [drm] add ip block number 7 <uvd_v3_1>
>>  [drm] BIOS signature incorrect 5b 7
>>  resource sanity check: requesting [mem 0x000c0000-0x000dffff], which s=
pans more than PCI Bus 0000:00 [mem 0x000d0000-0x000dffff window]
>>  caller pci_map_rom+0x68/0x1b0 mapping multiple BARs
>>  amdgpu 0000:01:00=2E0: No more image in the PCI ROM
>>  amdgpu 0000:01:00=2E0: amdgpu: Fetched VBIOS from ROM BAR
>>  amdgpu: ATOM BIOS: xxx-xxx-xxx
>>  amdgpu 0000:01:00=2E0: amdgpu: Trusted Memory Zone (TMZ) feature not s=
upported
>>  amdgpu 0000:01:00=2E0: amdgpu: PCIE atomic ops is not supported
>>  [drm] PCIE gen 2 link speeds already enabled
>>  [drm] vm size is 64 GB, 2 levels, block size is 10-bit, fragment size =
is 9-bit
>>  RTL8211B Gigabit Ethernet r8169-0-300:00: attached PHY driver (mii_bus=
:phy_addr=3Dr8169-0-300:00, irq=3DMAC)
>>  r8169 0000:03:00=2E0 eth0: Link is Down
>>  amdgpu 0000:01:00=2E0: amdgpu: VRAM: 2048M 0x000000F400000000 - 0x0000=
00F47FFFFFFF (2048M used)
>>  amdgpu 0000:01:00=2E0: amdgpu: GART: 1024M 0x000000FF00000000 - 0x0000=
00FF3FFFFFFF
>>  [drm] Detected VRAM RAM=3D2048M, BAR=3D256M
>>  [drm] RAM width 128bits DDR3
>>  [drm] amdgpu: 2048M of VRAM memory ready
>>  [drm] amdgpu: 3979M of GTT memory ready=2E
>>  [drm] GART: num cpu pages 262144, num gpu pages 262144
>>  amdgpu 0000:01:00=2E0: amdgpu: PCIE GART of 1024M enabled (table at 0x=
000000F400A00000)=2E
>>  [drm] Internal thermal controller with fan control
>>  [drm] amdgpu: dpm initialized
>>  [drm] AMDGPU Display Connectors
>>  [drm] Connector 0:
>>  [drm]   HDMI-A-1
>>  [drm]   HPD1
>>  [drm]   DDC: 0x194c 0x194c 0x194d 0x194d 0x194e 0x194e 0x194f 0x194f
>>  [drm]   Encoders:
>>  [drm]     DFP1: INTERNAL_UNIPHY
>>  [drm] Connector 1:
>>  [drm]   DVI-D-1
>>  [drm]   HPD2
>>  [drm]   DDC: 0x1950 0x1950 0x1951 0x1951 0x1952 0x1952 0x1953 0x1953
>>  [drm]   Encoders:
>>  [drm]     DFP2: INTERNAL_UNIPHY
>>  [drm] Connector 2:
>>  [drm]   VGA-1
>>  [drm]   DDC: 0x1970 0x1970 0x1971 0x1971 0x1972 0x1972 0x1973 0x1973
>>  [drm]   Encoders:
>>  [drm]     CRT1: INTERNAL_KLDSCP_DAC1
>>  [drm] Found UVD firmware Version: 64=2E0 Family ID: 13
>>  amdgpu: Move buffer fallback to memcpy unavailable
>>  [drm:amdgpu_device_init=2Ecold [amdgpu]] *ERROR* sw_init of IP block <=
uvd_v3_1> failed -19
>>  amdgpu 0000:01:00=2E0: amdgpu: amdgpu_device_ip_init failed
>>  amdgpu 0000:01:00=2E0: amdgpu: Fatal error during GPU init
>>  amdgpu 0000:01:00=2E0: amdgpu: amdgpu: finishing device=2E
>>  BUG: kernel NULL pointer dereference, address: 0000000000000090
>>  #PF: supervisor write access in kernel mode
>>  #PF: error_code(0x0002) - not-present page
>>  PGD 0 P4D 0
>>  Oops: 0002 [#1] PREEMPT SMP NOPTI
>>  CPU: 3 PID: 447 Comm: udevd Not tainted 6=2E0=2E0+ #5179
>>  Hardware name: System manufacturer System Product Name/M3A78 PRO, BIOS=
 1701    01/27/2011
>>  RIP: 0010:drm_sched_fini+0x80/0xa0 [gpu_sched]
>>  Code: 76 83 0e c4 c6 85 8c 01 00 00 00 5b 5d 41 5c 41 5d c3 cc cc cc c=
c 4c 8d 63 f0 4c 89 e7 e8 08 99 8e c4 48 8b 03 48 39 d8 74 0f <c6> 80 90 00=
 00 00 01 48 8b 00 48 39 d8 75 f1 4c 89 e7 e8 c9 99 8e
>>  RSP: 0018:ffffbeb3c06bfbb8 EFLAGS: 00010213
>>  RAX: 0000000000000000 RBX: ffff99bae8269a98 RCX: ffff99bab703afc0
>>  RDX: 0000000000000001 RSI: ffff99bab703afe8 RDI: 0000000000000000
>>  RBP: ffff99bae82699f0 R08: ffffffff85cd0bc2 R09: 0000000000000010
>>  R10: 0000000000000035 R11: ffff99bb594806c0 R12: ffff99bae8269a88
>>  R13: ffff99bae82699f8 R14: ffff99bae82665e8 R15: 0000000000000000
>>  FS:  00007fd81fcd9840(0000) GS:ffff99bb67cc0000(0000) knlGS:0000000000=
000000
>>  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>  CR2: 0000000000000090 CR3: 0000000111822000 CR4: 00000000000006e0
>>  Call Trace:
>>   <TASK>
>>   amdgpu_fence_driver_sw_fini+0xc2/0xd0 [amdgpu]
>>   amdgpu_device_fini_sw+0x17/0x3c0 [amdgpu]
>>   amdgpu_driver_release_kms+0x12/0x30 [amdgpu]
>>   devm_drm_dev_init_release+0x4a/0x70 [drm]
>>   release_nodes+0x40/0xb0
>>   devres_release_all+0x89/0xc0
>>   device_unbind_cleanup+0xe/0x70
>>   really_probe+0x245/0x3a0
>>   ? pm_runtime_barrier+0x61/0xb0
>>   __driver_probe_device+0x78/0x170
>>   driver_probe_device+0x2d/0xb0
>>   __driver_attach+0xdc/0x1d0
>>   ? __device_attach_driver+0x100/0x100
>>   bus_for_each_dev+0x69/0xa0
>>   bus_add_driver+0x1d4/0x230
>>   ? _raw_spin_unlock+0x15/0x40
>>   driver_register+0x89/0xe0
>>   ? 0xffffffffc0c3b000
>>   do_one_initcall+0x44/0x200
>>   ? __kmem_cache_alloc_node+0x90/0x360
>>   ? kmalloc_trace+0x38/0xc0
>>   do_init_module+0x4a/0x1e0
>>   __do_sys_finit_module+0xb5/0x130
>>   do_syscall_64+0x3a/0x90
>>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
>>  RIP: 0033:0x7fd81ff5b1b9
>>  Code: 08 44 89 e0 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 48 89 f8 48 8=
9 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0=
 ff ff 73 01 c3 48 8b 0d 27 1c 0d 00 f7 d8 64 89 01 48
>>  RSP: 002b:00007ffc5b37cbb8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>>  RAX: ffffffffffffffda RBX: 000055e5f2f6a140 RCX: 00007fd81ff5b1b9
>>  RDX: 0000000000000000 RSI: 000055e5f2f67e30 RDI: 0000000000000017
>>  RBP: 000055e5f2f67e30 R08: 0000000000000000 R09: 000055e5f2f46700
>>  R10: 0000000000000017 R11: 0000000000000246 R12: 0000000000020000
>>  R13: 0000000000000000 R14: 000055e5f2f65b00 R15: 0000000000000024
>>   </TASK>
>>  Modules linked in: amdgpu(+) snd_emu10k1_synth snd_emux_synth snd_seq_=
midi_emul snd_seq_virmidi snd_seq_midi snd_seq_midi_event snd_seq wmi_bmof =
snd_emu10k1 edac_mce_amd gpu_sched drm_buddy video kvm_amd drm_ttm_helper t=
tm snd_util_mem drm_display_helper snd_ac97_codec ccp drm_kms_helper snd_hd=
a_codec_hdmi rng_core ac97_bus snd_rawmidi snd_hda_intel snd_intel_dspcfg s=
nd_hda_codec snd_hda_core snd_seq_device drm kvm snd_hwdep snd_pcm_oss snd_=
mixer_oss evdev serio_raw snd_pcm irqbypass i2c_algo_bit fb_sys_fops syscop=
yarea sysfillrect emu10k1_gp pcspkr gameport k10temp snd_timer sysimgblt sn=
d acpi_cpufreq wmi soundcore button sp5100_tco asus_atk0110 ext4 crc16 mbca=
che jbd2 btrfs blake2b_generic xor raid6_pq zstd_compress libcrc32c crc32c_=
generic uas usb_storage sg sd_mod hid_generic t10_pi usbhid hid sr_mod cdro=
m crc64_rocksoft crc64 ata_generic ahci pata_atiixp libahci ohci_pci firewi=
re_ohci libata firewire_core crc_itu_t xhci_pci scsi_mod ohci_hcd r8169 ehc=
i_pci xhci_hcd
>>   realtek ehci_hcd mdio_devres i2c_piix4 scsi_common usbcore libphy usb=
_common
>>  CR2: 0000000000000090
>>  ---[ end trace 0000000000000000 ]---
>>  RIP: 0010:drm_sched_fini+0x80/0xa0 [gpu_sched]
>>  Code: 76 83 0e c4 c6 85 8c 01 00 00 00 5b 5d 41 5c 41 5d c3 cc cc cc c=
c 4c 8d 63 f0 4c 89 e7 e8 08 99 8e c4 48 8b 03 48 39 d8 74 0f <c6> 80 90 00=
 00 00 01 48 8b 00 48 39 d8 75 f1 4c 89 e7 e8 c9 99 8e
>>  RSP: 0018:ffffbeb3c06bfbb8 EFLAGS: 00010213
>>  RAX: 0000000000000000 RBX: ffff99bae8269a98 RCX: ffff99bab703afc0
>>  RDX: 0000000000000001 RSI: ffff99bab703afe8 RDI: 0000000000000000
>>  RBP: ffff99bae82699f0 R08: ffffffff85cd0bc2 R09: 0000000000000010
>>  R10: 0000000000000035 R11: ffff99bb594806c0 R12: ffff99bae8269a88
>>  R13: ffff99bae82699f8 R14: ffff99bae82665e8 R15: 0000000000000000
>>  FS:  00007fd81fcd9840(0000) GS:ffff99bb67cc0000(0000) knlGS:0000000000=
000000
>>  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>  CR2: 0000000000000090 CR3: 0000000111822000 CR4: 00000000000006e0
>>  note: udevd[447] exited with preempt_count 1
>>  udevd[433]: worker [447] terminated by signal 9 (Killed)
>>  udevd[433]: worker [447] failed while handling '/devices/pci0000:00/00=
00:00:02=2E0/0000:01:00=2E0'
>>  r8169 0000:03:00=2E0 eth0: Link is Up - 1Gbps/Full - flow control off
>>  IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
>>  Adding 4194300k swap on /dev/sda4=2E  Priority:-2 extents:1 across:419=
4300k FS
>>  EXT4-fs (sda5): re-mounted=2E Quota mode: none=2E
>>  lp: driver loaded but no devices found
>>  ppdev: user-space parallel port driver
>>  it87: Found IT8716F chip at 0xe80, revision 3
>>  ACPI Warning: SystemIO range 0x0000000000000E85-0x0000000000000E86 con=
flicts with OpRegion 0x0000000000000E85-0x0000000000000E86 (\_SB=2EPCI0=2ES=
BRG=2EASOC=2EHWRE) (20220331/utaddress-204)
>>  ACPI: OSL: Resource conflict; ACPI support missing from driver?
>>  BUG: unable to handle page fault for address: 00000000000065c0
>>  #PF: supervisor read access in kernel mode
>>  #PF: error_code(0x0000) - not-present page
>>  PGD 0 P4D 0
>>  Oops: 0000 [#2] PREEMPT SMP NOPTI
>>  CPU: 2 PID: 55 Comm: kworker/2:1 Tainted: G      D            6=2E0=2E=
0+ #5179
>>  Hardware name: System manufacturer System Product Name/M3A78 PRO, BIOS=
 1701    01/27/2011
>>  Workqueue: events output_poll_execute [drm_kms_helper]
>>  RIP: 0010:amdgpu_device_rreg=2Epart=2E0+0x39/0x100 [amdgpu]
>>  Code: 6c 24 08 48 89 fb 4c 89 64 24 10 44 8d 24 b5 00 00 00 00 4c 3b a=
7 88 08 00 00 89 f5 73 70 83 e2 02 74 2f 4c 03 a3 90 08 00 00 <45> 8b 24 24=
 48 8b 43 08 0f b7 70 3e 66 90 44 89 e0 48 8b 1c 24 48
>>  RSP: 0018:ffffbeb3c0717c48 EFLAGS: 00010206
>>  RAX: 0000000000000000 RBX: ffff99bae8260000 RCX: 0000000000000000
>>  RDX: 0000000000000000 RSI: 0000000000001970 RDI: ffff99bae8260000
>>  RBP: 0000000000001970 R08: ffffbeb3c0717e08 R09: 0000000000000000
>>  R10: 0000000000000018 R11: fefefefefefefeff R12: 00000000000065c0
>>  R13: ffffbeb3c0717d70 R14: 0000000000000000 R15: 000000010005e340
>>  FS:  0000000000000000(0000) GS:ffff99bb67c80000(0000) knlGS:0000000000=
000000
>>  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>  CR2: 00000000000065c0 CR3: 000000008980a000 CR4: 00000000000006e0
>>  Call Trace:
>>   <TASK>
>>   amdgpu_i2c_pre_xfer+0x163/0x180 [amdgpu]
>>   bit_xfer+0x36/0x530 [i2c_algo_bit]
>>   __i2c_transfer+0x185/0x550
>>   i2c_transfer+0xa2/0x110
>>   amdgpu_display_ddc_probe+0xbd/0x100 [amdgpu]
>>   amdgpu_connector_vga_detect+0x8e/0x200 [amdgpu]
>>   drm_helper_probe_detect_ctx+0x7b/0xd0 [drm_kms_helper]
>>   output_poll_execute+0x152/0x220 [drm_kms_helper]
>>   process_one_work+0x1ae/0x370
>>   worker_thread+0x4d/0x3b0
>>   ? rescuer_thread+0x380/0x380
>>   kthread+0xe3/0x110
>>   ? kthread_complete_and_exit+0x20/0x20
>>   ret_from_fork+0x22/0x30
>>   </TASK>
>>  Modules linked in: max6650 hwmon_vid parport_pc ppdev lp parport amdgp=
u(+) snd_emu10k1_synth snd_emux_synth snd_seq_midi_emul snd_seq_virmidi snd=
_seq_midi snd_seq_midi_event snd_seq wmi_bmof snd_emu10k1 edac_mce_amd gpu_=
sched drm_buddy video kvm_amd drm_ttm_helper ttm snd_util_mem drm_display_h=
elper snd_ac97_codec ccp drm_kms_helper snd_hda_codec_hdmi rng_core ac97_bu=
s snd_rawmidi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core snd=
_seq_device drm kvm snd_hwdep snd_pcm_oss snd_mixer_oss evdev serio_raw snd=
_pcm irqbypass i2c_algo_bit fb_sys_fops syscopyarea sysfillrect emu10k1_gp =
pcspkr gameport k10temp snd_timer sysimgblt snd acpi_cpufreq wmi soundcore =
button sp5100_tco asus_atk0110 ext4 crc16 mbcache jbd2 btrfs blake2b_generi=
c xor raid6_pq zstd_compress libcrc32c crc32c_generic uas usb_storage sg sd=
_mod hid_generic t10_pi usbhid hid sr_mod cdrom crc64_rocksoft crc64 ata_ge=
neric ahci pata_atiixp libahci ohci_pci firewire_ohci libata firewire_core =
crc_itu_t xhci_pci
>>   scsi_mod ohci_hcd r8169 ehci_pci xhci_hcd realtek ehci_hcd mdio_devre=
s i2c_piix4 scsi_common usbcore libphy usb_common
>>  CR2: 00000000000065c0
>>  ---[ end trace 0000000000000000 ]---
>>  RIP: 0010:drm_sched_fini+0x80/0xa0 [gpu_sched]
>>  Code: 76 83 0e c4 c6 85 8c 01 00 00 00 5b 5d 41 5c 41 5d c3 cc cc cc c=
c 4c 8d 63 f0 4c 89 e7 e8 08 99 8e c4 48 8b 03 48 39 d8 74 0f <c6> 80 90 00=
 00 00 01 48 8b 00 48 39 d8 75 f1 4c 89 e7 e8 c9 99 8e
>>  RSP: 0018:ffffbeb3c06bfbb8 EFLAGS: 00010213
>>  RAX: 0000000000000000 RBX: ffff99bae8269a98 RCX: ffff99bab703afc0
>>  RDX: 0000000000000001 RSI: ffff99bab703afe8 RDI: 0000000000000000
>>  RBP: ffff99bae82699f0 R08: ffffffff85cd0bc2 R09: 0000000000000010
>>  R10: 0000000000000035 R11: ffff99bb594806c0 R12: ffff99bae8269a88
>>  R13: ffff99bae82699f8 R14: ffff99bae82665e8 R15: 0000000000000000
>>  FS:  0000000000000000(0000) GS:ffff99bb67c80000(0000) knlGS:0000000000=
000000
>>  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>  CR2: 00000000000065c0 CR3: 000000008980a000 CR4: 00000000000006e0

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
