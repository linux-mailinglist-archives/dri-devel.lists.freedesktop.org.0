Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2817D129009
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2019 22:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353F46E0AC;
	Sun, 22 Dec 2019 21:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 897 seconds by postgrey-1.36 at gabe;
 Sun, 22 Dec 2019 21:33:57 UTC
Received: from balrog.mythic-beasts.com (balrog.mythic-beasts.com
 [IPv6:2a00:1098:0:82:1000:0:2:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7166E0AC
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2019 21:33:57 +0000 (UTC)
Received: from [195.206.189.73] (port=46094 helo=zirconium.buellnet)
 by balrog.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <alex.buell@munted.eu>) id 1ij8cp-0008Gu-8f
 for dri-devel@lists.freedesktop.org; Sun, 22 Dec 2019 21:18:59 +0000
Received: by zirconium.buellnet (Postfix, from userid 1000)
 id 296F2C00E9; Sun, 22 Dec 2019 21:18:50 +0000 (GMT)
Message-ID: <ee10628bf9a373d4f4f6619de5cd136c4ba61a9a.camel@munted.eu>
Subject: Oops in amdgpu on Kernel 5.4.0
From: Alex Buell <alex.buell@munted.eu>
To: dri-devel <dri-devel@lists.freedesktop.org>
Date: Sun, 22 Dec 2019 21:18:50 +0000
Organization: One very high maintenance cat for company
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
X-BlackCat-Spam-Score: 0
X-Spam-Status: No, score=-0.1
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
Reply-To: alex.buell@munted.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hardware:
X399 Taichi
AMD Threadripper 1920X
Asus Radeon 5700XT
16GB of RAM 

Software:
Gentoo
libdrm 2.4.100
mesa 19.2.7

amdgpudrmfb in use

I'm getting a lot of these OOPS in the log as below. Is there anything
I can do to help fix this?

Thanks,
Alex

Dec 15 10:16:53 titanium kernel: ------------[ cut here ]------------
Dec 15 10:16:53 titanium kernel: WARNING: CPU: 3 PID: 13539 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1829
dcn20_setup_gsl_group_as_lock+0xc8/0x1a3 [amdgpu]
Dec 15 10:16:53 titanium kernel: Modules linked in: nfsd cfg80211
rfkill 8021q ipv6 nf_defrag_ipv6 binfmt_misc snd_hda_codec_realtek
snd_hda_codec_generic ledtrig_audio amdgpu snd_hda_intel snd_intel_nhlt
joydev input_leds snd_hda_codec gpu_sched snd_hda_core drm_kms_helper
kvm_amd snd_hwdep syscopyarea vboxnetadp(O) sysfillrect snd_pcm
sysimgblt fb_sys_fops kvm ttm vboxnetflt(O) irqbypass efivars snd_timer
pcspkr drm snd i2c_piix4 k10temp backlight vboxdrv(O) button
acpi_cpufreq efivarfs xts ecb cbc sha512_generic sha256_generic
libsha256 sha1_generic libiscsi scsi_transport_iscsi ixgb ixgbe tulip
cxgb3 cxgb mdio macvlan tg3 sky2 r8169 libphy pcnet32 mii e1000 bnx2
fuse nfs lockd grace sunrpc multipath linear raid0 dm_snapshot dm_bufio
dm_crypt dm_mirror dm_region_hash dm_log dm_mod dax hid_sunplus
hid_sony hid_samsung hid_pl hid_petalynx hid_monterey hid_microsoft
ff_memless hid_logitech hid_gyration hid_ezkey hid_cypress hid_chicony
hid_cherry hid_belkin hid_apple hid_a4tech sl811_hcd xhci_plat_hcd
ohci_pci
Dec 15 10:16:53 titanium kernel:  ohci_hcd uhci_hcd usb_storage
ehci_pci ehci_hcd aic94xx libsas lpfc crc_t10dif crct10dif_common
qla2xxx megaraid_sas megaraid_mbox megaraid_mm megaraid aacraid sx8
3w_9xxx 3w_xxxx mptsas scsi_transport_sas mptfc scsi_transport_fc
mptspi mptscsih mptbase atp870u dc395x qla1280 imm parport dmx3191d
sym53c8xx gdth initio BusLogic arcmsr aic7xxx aic79xx
scsi_transport_spi sg pdc_adma sata_inic162x sata_mv ata_piix
sata_qstor sata_vsc sata_uli sata_sis sata_sx4 sata_nv sata_via
sata_svw sata_sil24 sata_sil sata_promise pata_sl82c105 pata_via
pata_jmicron pata_marvell pata_sis pata_netcell pata_pdc202xx_old
pata_triflex pata_atiixp pata_opti pata_amd pata_ali pata_it8213
pata_pcmcia pcmcia pcmcia_core pata_ns87415 pata_ns87410
pata_serverworks pata_artop pata_it821x pata_optidma pata_hpt3x2n
pata_hpt3x3 pata_hpt37x pata_hpt366 pata_cmd64x pata_efar pata_rz1000
pata_sil680 pata_radisys pata_pdc2027x pata_mpiix raid456
async_raid6_recov async_memcpy async_pq async_xor xor async_tx
Dec 15 10:16:53 titanium kernel:  raid6_pq raid10 raid1 led_class
usbhid igb xhci_pci ahci i2c_algo_bit xhci_hcd libahci i2c_core usbcore
libata dca usb_common [last unloaded: cpuid]
Dec 15 10:16:53 titanium kernel: CPU: 3 PID: 13539 Comm: kworker/u64:3
Tainted: G           O      5.4.0-gentoo #1
Dec 15 10:16:53 titanium kernel: Hardware name: To Be Filled By O.E.M.
To Be Filled By O.E.M./X399 Taichi, BIOS P3.80 08/27/2019
Dec 15 10:16:53 titanium kernel: Workqueue: events_unbound commit_work
[drm_kms_helper]
Dec 15 10:16:53 titanium kernel: RIP:
0010:dcn20_setup_gsl_group_as_lock+0xc8/0x1a3 [amdgpu]
Dec 15 10:16:53 titanium kernel: Code: eb 31 a8 04 75 24 c6 83 60 02 00
00 03 49 8b 80 10 03 00 00 bd 03 00 00 00 c7 44 24 08 01 00 00 00 80 88
70 02 00 00 04 eb 09 <0f> 0b 0f 0b e9 b4 00 00 00 c7 44 24 0c 01 00 00
00 eb 5e 84 c0 0f
Dec 15 10:16:53 titanium kernel: RSP: 0018:ffff9f5a83fdfac0 EFLAGS:
00010202
Dec 15 10:16:53 titanium kernel: RAX: ffff8cce27ade807 RBX:
ffff8ccccdf00658 RCX: 0000000000000000
Dec 15 10:16:53 titanium kernel: RDX: 0000000000000001 RSI:
ffff9f5a83fdfac0 RDI: ffff9f5a83fdfae8
Dec 15 10:16:53 titanium kernel: RBP: 0000000000000001 R08:
ffff8cce26a40000 R09: 0000000000000001
Dec 15 10:16:53 titanium kernel: R10: ffff9f5a83fdfb28 R11:
0000000000000000 R12: 0000000000000001
Dec 15 10:16:53 titanium kernel: R13: ffff8ccccdf00658 R14:
ffff8ccccdf01d78 R15: ffff8cce26a40000
Dec 15 10:16:53 titanium kernel: FS:  0000000000000000(0000)
GS:ffff8cce3eac0000(0000) knlGS:0000000000000000
Dec 15 10:16:53 titanium kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Dec 15 10:16:53 titanium kernel: CR2: 00007f7f8b069b30 CR3:
0000000466dda000 CR4: 00000000003406e0
Dec 15 10:16:53 titanium kernel: Call Trace:
Dec 15 10:16:53 titanium kernel:  dcn20_pipe_control_lock+0x51/0x9d
[amdgpu]
Dec 15 10:16:53 titanium
kernel:  dc_commit_updates_for_stream+0xbde/0xe0f [amdgpu]
Dec 15 10:16:53 titanium
kernel:  amdgpu_dm_atomic_commit_tail+0x1259/0x1506 [amdgpu]
Dec 15 10:16:53 titanium kernel:  ? update_cfs_rq_load_avg+0xf5/0x114
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x34/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x40/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x34/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x40/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x34/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x40/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x34/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x40/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x34/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x40/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x34/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x40/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x34/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x40/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x34/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x40/0x70
Dec 15 10:16:53 titanium kernel:  ? do_raw_spin_lock+0x2b/0x52
Dec 15 10:16:53 titanium kernel:  ? __wait_for_common+0x35/0x135
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x34/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x40/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x34/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x40/0x70
Dec 15 10:16:53 titanium kernel:  ? __switch_to_asm+0x34/0x70
Dec 15 10:16:53 titanium kernel:  ? commit_tail+0x8b/0xcf
[drm_kms_helper]
Dec 15 10:16:53 titanium kernel:  commit_tail+0x8b/0xcf
[drm_kms_helper]
Dec 15 10:16:53 titanium kernel:  process_one_work+0x198/0x284
Dec 15 10:16:53 titanium kernel:  worker_thread+0x19a/0x23e
Dec 15 10:16:53 titanium kernel:  ? create_worker+0x175/0x175
Dec 15 10:16:53 titanium kernel:  kthread+0xe4/0xe9
Dec 15 10:16:53 titanium kernel:  ?
kthread_delayed_work_timer_fn+0x7e/0x7e
Dec 15 10:16:53 titanium kernel:  ret_from_fork+0x22/0x40
Dec 15 10:16:53 titanium kernel: ---[ end trace 4f20bb86910987dc ]---
Dec 15 10:16:53 titanium kernel: ------------[ cut here ]------------
-- 
Tactical Nuclear Kittens
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
