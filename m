Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E715BC18F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 04:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CFB10E4EC;
	Mon, 19 Sep 2022 02:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ipmail04.adl3.internode.on.net (ipmail04.adl3.internode.on.net
 [150.101.137.10])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D4F310E4EC;
 Mon, 19 Sep 2022 02:53:37 +0000 (UTC)
X-SMTP-MATCH: 1
IronPort-Data: =?us-ascii?q?A9a23=3Af24oZaAsWxIhxhVW/5Xiw5YqxClBgxIJ4kV8j?=
 =?us-ascii?q?S/XYbTApDN33jdRxzcXXD/TOPiCMTfzKtAia4zlpBtQ65TWmoVhQVE5pXw8F?=
 =?us-ascii?q?3hD9cPPWdqTJxiqY3zCd5eeHEg7tZ4SMYDpIZFvRBcwhD/0YuC79yUUOYJk5?=
 =?us-ascii?q?1bE5V2t1hlZHWeIdQ944f5ds75h6mJXqYDR7zOl4bsekuWHULOX82cc3lE8s?=
 =?us-ascii?q?8pvnChSUMHa41v0iLCficdj5zcyn1FNZH4WyDrYw3HQGuG4FcbiLwrPIS3Qw?=
 =?us-ascii?q?4/Xw/stIovNfrcXnKEIaueOe1LI0yMKHfL/2HCupQRruko/HPMGdUdKkXOMl?=
 =?us-ascii?q?spqyP1Ms4C9UwEuMqCKn+JbVRREe817FfcZpuabfyjj7KR/yGWdKyC8ma8/Z?=
 =?us-ascii?q?K0sBqUR4Pp3HHsI8PUCMzAlbxafiviwx762DO5qwMIuMKHDNYIFvnBtwRndD?=
 =?us-ascii?q?PA7UdbCTs3i7NtVzDs9m8tOEOz2aM8QaD4pZxPFCzVGP1tSB5wutOOpnWXkN?=
 =?us-ascii?q?TNCpV+ZqLE0/2/Ligtr39DFPMDUP9CHW8hRtkKZvX7duWrjDxwWOcec1T2dt?=
 =?us-ascii?q?HW2iYfnkjn2VYQcE7qQ668wxlCOrkQjCRsWSFr9mfC/oke7V5RULEl80iMqo?=
 =?us-ascii?q?Lg78kCmVJ/xUgCzoHOelhcZV5xbFOhSwAiQ0KPe4gCVAS4cTzpFYd0Ovco6A?=
 =?us-ascii?q?zct0zehlNPzBCdzsbSTD3Ga+7GVohu7PCRTJmgHDQcLUAAF/t+lq4E+iDrGS?=
 =?us-ascii?q?9olG6mw5vX1EDTiynaPpSgwgLIBpccO2+Ow+lWvqzatoIXZCw04/APaWkq74?=
 =?us-ascii?q?Q5jIo2ofYql7R7c9/koBJ2UR1+ZtWUAs8Oe9ucLDIyI0iuXT40w8BuB867Qa?=
 =?us-ascii?q?HuElQc6R9954274ozj+JdgI9GorfAE0JplRQiTldBaL7FsVvIs70GCCdbdvO?=
 =?us-ascii?q?t70UYFzlPSlT4m/EPnYap9HeoQ0bA6duSt0bFXLhSbxiEdqkKcjNI2ddsqhS?=
 =?us-ascii?q?3EcT6Jq0FKLqy4m+edD7kgDKan7HPgXFyia7Ic=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AsIQnsKAdszVrsSflHem755DYdb4zR+YMi2?=
 =?us-ascii?q?TDGXocdfUzSL39qynAppomPHPP4gr5HUtQ+uxoW5PwJE80i6QV3WB5B97LNz?=
 =?us-ascii?q?UO+lHYTr2KhrGM/9SPIUDDH5ZmtZtdTw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2DqEgAn2CdjZPxyAg5aHAEBATwBAQQ?=
 =?us-ascii?q?EAQECAQEHAQEegUYCgToCAQEBAYMOAQGWDZBpjiYLASMwBAEBhQUChGsmNwY?=
 =?us-ascii?q?OAQIEFQEBBgEBAQEBBwQFagEshXWGQwIBA3kQC0ZXgxYBgyCsXIEBiB2BZYE?=
 =?us-ascii?q?7AwEBAQEBimyFMjeBVUSBFAGDKj6BU4I1PIY8BJUChDQDCQQHBUlBAwsfDRY?=
 =?us-ascii?q?0GAMUAwUkBwMZDyMNDQQWBwwDAwUlAwICGwcCAgMCBhMFAgI1GDgIBAgEKyQ?=
 =?us-ascii?q?PBQIHLwUELwIeBAUGEQgCFgIGBAQEBBUCEAgCCCYXBxMzGQEFWRAJIRwOGg0?=
 =?us-ascii?q?FBhMDChZvBQc+DygyaysdGwqBDCooFQMEBAMCBhMDAyICECoxFAQpExItByt?=
 =?us-ascii?q?zCQIDIgRjBQMDBCosAwkhHwcoJjwHWDoBBAMDECI9BgMJAwIkW3g4FBQFAw0?=
 =?us-ascii?q?ZJggFIxYdBAg8AgUGmXhSDhNSbEsrCl+BEZIKN4J0iyqCEotCkmc0B4NZgUE?=
 =?us-ascii?q?GDJ5GTBGDZZM1kVmXCqF9DREHDRuHEoF/MxougWMJgUFQKI4sFo4+gSACBgs?=
 =?us-ascii?q?BAQMJin0BAQ?=
Received: from ppp14-2-114-252.adl-apt-pir-bras32.tpg.internode.on.net (HELO
 localhost) ([14.2.114.252])
 by ipmail04.adl3.internode.on.net with ESMTP; 19 Sep 2022 12:23:33 +0930
Received: from amarsh04 by localhost with local (Exim 4.96)
 (envelope-from <arthur.marsh@internode.on.net>) id 1oa6ua-00017S-19;
 Mon, 19 Sep 2022 12:23:32 +0930
From: Arthur Marsh <arthur.marsh@internode.on.net>
To: arthur.marsh@internode.on.net
Subject: Re: drm/amdgpu: use dirty framebuffer helper
Date: Mon, 19 Sep 2022 12:23:32 +0930
Message-Id: <20220919025332.4295-1-user@am64>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220918120926.10322-1-user@am64>
References: <20220918120926.10322-1-user@am64>
MIME-Version: 1.0
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
Cc: guchun.chen@amd.com, airlied@linux.ie, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 aurabindo.pillai@amd.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, greenfoo@u92.eu, hamza.mahfooz@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have done a delayed load of amdgpu with the 6.0-rc6 kernel using:

modprobe amdgpu si_support=3D1

and saved the dmesg output:

[  455.424263] udevd[414]: specified group 'sgx' unknown
[  455.514818] ACPI: bus type drm_connector registered
[  457.759316] [drm] amdgpu kernel modesetting enabled.
[  457.759491] amdgpu 0000:01:00.0: vgaarb: deactivate vga console
[  457.760459] Console: switching to colour dummy device 80x25
[  457.760689] [drm] initializing kernel modesetting (VERDE 0x1002:0x682B 0=
x1458:0x22CA 0x87).
[  457.760717] [drm] register mmio base: 0xFE8C0000
[  457.760720] [drm] register mmio size: 262144
[  457.760872] [drm] add ip block number 0 <si_common>
[  457.760887] [drm] add ip block number 1 <gmc_v6_0>
[  457.760890] [drm] add ip block number 2 <si_ih>
[  457.760893] [drm] add ip block number 3 <gfx_v6_0>
[  457.760896] [drm] add ip block number 4 <si_dma>
[  457.760898] [drm] add ip block number 5 <si_dpm>
[  457.760901] [drm] add ip block number 6 <dce_v6_0>
[  457.760903] [drm] add ip block number 7 <uvd_v3_1>
[  457.804366] [drm] BIOS signature incorrect 20 7
[  457.804376] resource sanity check: requesting [mem 0x000c0000-0x000dffff=
], which spans more than PCI Bus 0000:00 [mem 0x000d0000-0x000dffff window]
[  457.804383] caller pci_map_rom+0x68/0x1b0 mapping multiple BARs
[  457.804398] amdgpu 0000:01:00.0: No more image in the PCI ROM
[  457.805746] amdgpu 0000:01:00.0: amdgpu: Fetched VBIOS from ROM BAR
[  457.805752] amdgpu: ATOM BIOS: xxx-xxx-xxx
[  457.805775] amdgpu 0000:01:00.0: amdgpu: Trusted Memory Zone (TMZ) featu=
re not supported
[  457.805781] amdgpu 0000:01:00.0: amdgpu: PCIE atomic ops is not supported
[  457.806204] [drm] PCIE gen 2 link speeds already enabled
[  457.806632] [drm] vm size is 64 GB, 2 levels, block size is 10-bit, frag=
ment size is 9-bit
[  457.869590] amdgpu 0000:01:00.0: amdgpu: VRAM: 2048M 0x000000F400000000 =
- 0x000000F47FFFFFFF (2048M used)
[  457.869605] amdgpu 0000:01:00.0: amdgpu: GART: 1024M 0x000000FF00000000 =
- 0x000000FF3FFFFFFF
[  457.869622] [drm] Detected VRAM RAM=3D2048M, BAR=3D256M
[  457.869625] [drm] RAM width 128bits DDR3
[  457.869706] [drm] amdgpu: 2048M of VRAM memory ready
[  457.869710] [drm] amdgpu: 3979M of GTT memory ready.
[  457.869734] [drm] GART: num cpu pages 262144, num gpu pages 262144
[  457.870061] amdgpu 0000:01:00.0: amdgpu: PCIE GART of 1024M enabled (tab=
le at 0x000000F400A00000).
[  457.908024] [drm] Internal thermal controller with fan control
[  457.908045] [drm] amdgpu: dpm initialized
[  457.908126] [drm] AMDGPU Display Connectors
[  457.908128] [drm] Connector 0:
[  457.908131] [drm]   HDMI-A-1
[  457.908133] [drm]   HPD1
[  457.908135] [drm]   DDC: 0x194c 0x194c 0x194d 0x194d 0x194e 0x194e 0x194=
f 0x194f
[  457.908139] [drm]   Encoders:
[  457.908141] [drm]     DFP1: INTERNAL_UNIPHY
[  457.908144] [drm] Connector 1:
[  457.908145] [drm]   DVI-D-1
[  457.908147] [drm]   HPD2
[  457.908149] [drm]   DDC: 0x1950 0x1950 0x1951 0x1951 0x1952 0x1952 0x195=
3 0x1953
[  457.908153] [drm]   Encoders:
[  457.908155] [drm]     DFP2: INTERNAL_UNIPHY
[  457.908157] [drm] Connector 2:
[  457.908159] [drm]   VGA-1
[  457.908160] [drm]   DDC: 0x1970 0x1970 0x1971 0x1971 0x1972 0x1972 0x197=
3 0x1973
[  457.908164] [drm]   Encoders:
[  457.908166] [drm]     CRT1: INTERNAL_KLDSCP_DAC1
[  457.959506] [drm] Found UVD firmware Version: 64.0 Family ID: 13
[  458.497761] [drm] UVD initialized successfully.
[  458.498549] amdgpu 0000:01:00.0: amdgpu: SE 1, SH per SE 2, CU per SH 5,=
 active_cu_number 8
[  458.836681] [drm] Initialized amdgpu 3.48.0 20150101 for 0000:01:00.0 on=
 minor 0
[  458.909127] fbcon: amdgpudrmfb (fb0) is primary device
[  458.936086] Console: switching to colour frame buffer device 240x67
[  458.936126] BUG: kernel NULL pointer dereference, address: 0000000000000=
010
[  458.936128] #PF: supervisor read access in kernel mode
[  458.936130] #PF: error_code(0x0000) - not-present page
[  458.936132] PGD 0 P4D 0=20
[  458.936134] Oops: 0000 [#1] PREEMPT SMP NOPTI
[  458.936137] CPU: 3 PID: 81 Comm: kworker/3:1 Not tainted 6.0.0-rc6 #5144
[  458.936140] Hardware name: System manufacturer System Product Name/M3A78=
 PRO, BIOS 1701    01/27/2011
[  458.936141] Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
[  458.936162] RIP: 0010:drm_atomic_helper_dirtyfb+0x13c/0x240 [drm_kms_hel=
per]
[  458.936176] Code: 05 c0 02 00 00 4c 8d 7a f8 48 39 c2 74 58 49 8b 74 24 =
48 4d 8d 77 20 4c 89 f7 e8 0f b5 f5 ff 85 c0 75 4b 49 8b 87 58 02 00 00 <48=
> 39 68 10 75 bf 4c 89 fe 4c 89 e7 e8 23 bf f5 ff 48 3d 00 f0 ff
[  458.936178] RSP: 0018:ffffb75080db3da8 EFLAGS: 00010246
[  458.936180] RAX: 0000000000000000 RBX: ffff9dbae32e2880 RCX: 00000000000=
0003b
[  458.936181] RDX: ffffb75080db3dd8 RSI: ffffb75080db3dd8 RDI: ffff9dbad63=
29c48
[  458.936182] RBP: ffff9dbae9b41100 R08: ffffb75080db3dd8 R09: ffff9dbae33=
e01f8
[  458.936184] R10: ffff9dbadf388028 R11: 0000000000000001 R12: ffff9dbad15=
0e880
[  458.936185] R13: ffff9dbaee0d9980 R14: ffff9dbad6329c20 R15: ffff9dbad63=
29c00
[  458.936186] FS:  0000000000000000(0000) GS:ffff9dbbe7cc0000(0000) knlGS:=
0000000000000000
[  458.936188] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  458.936189] CR2: 0000000000000010 CR3: 000000012337c000 CR4: 00000000000=
006e0
[  458.936190] Call Trace:
[  458.936192]  <TASK>
[  458.936194]  drm_fb_helper_damage_work+0x1a4/0x2d0 [drm_kms_helper]
[  458.936208]  process_one_work+0x1ae/0x370
[  458.936213]  worker_thread+0x4d/0x3b0
[  458.936215]  ? _raw_spin_lock_irqsave+0x22/0x60
[  458.936219]  ? process_one_work+0x370/0x370
[  458.936221]  kthread+0xe3/0x110
[  458.936224]  ? kthread_complete_and_exit+0x20/0x20
[  458.936226]  ret_from_fork+0x22/0x30
[  458.936229]  </TASK>
[  458.936230] Modules linked in: amdgpu(+) gpu_sched drm_buddy drm_ttm_hel=
per ttm drm_display_helper drm_kms_helper drm i2c_algo_bit fb_sys_fops sysc=
opyarea sysfillrect sysimgblt bnep bluetooth jitterentropy_rng sha512_ssse3=
 sha512_generic hmac drbg ansi_cprng ecdh_generic ecc nfc rfkill snd_hrtime=
r cpufreq_userspace cpufreq_conservative cpufreq_powersave xt_dscp xt_tcpud=
p nft_compat x_tables binfmt_misc scsi_transport_iscsi nf_tables nfnetlink =
exfat max6650 hwmon_vid parport_pc ppdev lp parport edac_mce_amd snd_emu10k=
1_synth kvm_amd ccp snd_emux_synth rng_core snd_seq_midi_emul snd_seq_virmi=
di snd_seq_midi snd_seq_midi_event snd_seq kvm wmi_bmof snd_hda_codec_hdmi =
snd_emu10k1 irqbypass snd_hda_intel snd_intel_dspcfg snd_util_mem snd_hda_c=
odec snd_ac97_codec snd_hda_core ac97_bus snd_hwdep snd_rawmidi snd_seq_dev=
ice snd_pcm_oss snd_mixer_oss snd_pcm k10temp evdev pcspkr serio_raw emu10k=
1_gp gameport snd_timer snd wmi button asus_atk0110 acpi_cpufreq sp5100_tco=
 soundcore ext4 crc16 mbcache
[  458.936286]  jbd2 btrfs blake2b_generic xor raid6_pq zstd_compress libcr=
c32c crc32c_generic uas usb_storage sg hid_generic sd_mod t10_pi usbhid hid=
 sr_mod crc64_rocksoft crc64 cdrom ata_generic ohci_pci ahci pata_atiixp li=
bahci r8169 libata firewire_ohci xhci_pci firewire_core crc_itu_t realtek o=
hci_hcd ehci_pci mdio_devres xhci_hcd ehci_hcd i2c_piix4 scsi_mod libphy sc=
si_common usbcore usb_common
[  458.936314] CR2: 0000000000000010
[  458.936315] ---[ end trace 0000000000000000 ]---
[  458.936317] RIP: 0010:drm_atomic_helper_dirtyfb+0x13c/0x240 [drm_kms_hel=
per]
[  458.936330] Code: 05 c0 02 00 00 4c 8d 7a f8 48 39 c2 74 58 49 8b 74 24 =
48 4d 8d 77 20 4c 89 f7 e8 0f b5 f5 ff 85 c0 75 4b 49 8b 87 58 02 00 00 <48=
> 39 68 10 75 bf 4c 89 fe 4c 89 e7 e8 23 bf f5 ff 48 3d 00 f0 ff
[  458.936332] RSP: 0018:ffffb75080db3da8 EFLAGS: 00010246
[  458.936333] RAX: 0000000000000000 RBX: ffff9dbae32e2880 RCX: 00000000000=
0003b
[  458.936335] RDX: ffffb75080db3dd8 RSI: ffffb75080db3dd8 RDI: ffff9dbad63=
29c48
[  458.936336] RBP: ffff9dbae9b41100 R08: ffffb75080db3dd8 R09: ffff9dbae33=
e01f8
[  458.936337] R10: ffff9dbadf388028 R11: 0000000000000001 R12: ffff9dbad15=
0e880
[  458.936338] R13: ffff9dbaee0d9980 R14: ffff9dbad6329c20 R15: ffff9dbad63=
29c00
[  458.936339] FS:  0000000000000000(0000) GS:ffff9dbbe7cc0000(0000) knlGS:=
0000000000000000
[  458.936341] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  458.936342] CR2: 0000000000000010 CR3: 000000012337c000 CR4: 00000000000=
006e0
[  458.957983] amdgpu 0000:01:00.0: [drm] fb0: amdgpudrmfb frame buffer dev=
ice

Regards,

Arthur Marsh.
