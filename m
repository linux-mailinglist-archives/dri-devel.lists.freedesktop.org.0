Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795BA457FFA
	for <lists+dri-devel@lfdr.de>; Sat, 20 Nov 2021 19:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CA26E0C9;
	Sat, 20 Nov 2021 18:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4FC6E0C9
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Nov 2021 18:09:07 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id c4so12159340pfj.2
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Nov 2021 10:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=BoD3BEenoPkPjf5CB5ZXWZxH5FufecUr5l0tXtf9hOQ=;
 b=NaX8yTU6W7b5/3+AgSfVqfiZltZyupFAyd3TT2vK4oXesCS4qNzYTwM1L4fbid5g8o
 MLXgAbiLj72lpqN53hDwdhFnG1pxmN4BrRjf46NBGOefcHj92vvRBdC7yuSNuCGrQgp9
 y5tYxrctHNJi8yL6xy9plNBECCyJFoE+003oCfufzIP1yRo9ErtxKsv2e9NBkDU/00aH
 eiRglAsjWZHz4KVMVrdDmtjRcuzwKRnxoZs3IV+SOekeLrfXmh+Koau2WaiSFSyjmFHE
 nBvWS0luD9NIXrpVH+3juU82/Cr1K4UDFpkkjAUQvJJSeHJNjlyhbkJa1JvhqNbikiQU
 ksbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BoD3BEenoPkPjf5CB5ZXWZxH5FufecUr5l0tXtf9hOQ=;
 b=Vi7xMX8eflk8+orB1HDYJhAG/IlU0QfVyF8HkbCbv0DXGNYngLL9Bep5mfSUHH1bxi
 8pjbmhpMpQUWew6N9qbjYS9v8ci573l56O++kSZ/D5FAFi/lNqJ4CfgdzyzLsMA9LlAr
 sFmqCGmOU1vQxOvtoSmafiI/36DDPxh0VcGqIuUffDLM4Poif0zhIy2VkIdjI5rqjs1d
 MgX6ji2YHbwEaAE4v0c6qKfTXjINabk1oG7pxxb09jPeVU5kzhrIk2Vo07yq30DrWkOY
 7mAfNZ7m1xTcfxW72AsnkKtulObms2GWrlYIOcVJEluYGNilj7X9xmKaa8QCcTY9Nlv5
 neQQ==
X-Gm-Message-State: AOAM5313kGcN1KHnUIqa6z9U4QDyskuZRNiePBeD5TGsrPvHgLmMTvoD
 Ria5pK1lPKl4ONVENIBcnNStUCC6UIwtmb7O77Y//YF0PZg=
X-Google-Smtp-Source: ABdhPJwNjxsPa1RYcqgrHhwhFb6rfqrXtD9bnLCYmaPL7KXWDgnMkoHM/PbfEtjmFrrMIurIsYib6ySBqugy/xmL9o8=
X-Received: by 2002:a65:648b:: with SMTP id e11mr23966330pgv.138.1637431746570; 
 Sat, 20 Nov 2021 10:09:06 -0800 (PST)
MIME-Version: 1.0
From: Chris Rankin <rankincj@gmail.com>
Date: Sat, 20 Nov 2021 18:08:54 +0000
Message-ID: <CAK2bqVJDOXuagWbVEEzNUCkjuzp5icYbroRCpEhS6NH01UePfA@mail.gmail.com>
Subject: WARN with AMDGPU driver with all 5.14.x kernels
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

Hi.

I've already tried reporting this on the linux kernel list, without effect:

[   95.796055] ------------[ cut here ]------------
[   95.819648] WARNING: CPU: 3 PID: 1 at
drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0x1c/0x266 [ttm]
[   95.827805] Modules linked in: nf_nat_ftp nf_conntrack_ftp cfg80211
af_packet nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
nft_chain_nat nf_tables ebtable_nat ebtable_broute ip6table_nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle
iptable_raw iptable_security nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter bnep it87 hwmon_vid dm_mod
dax snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio
snd_hda_codec_hdmi snd_hda_intel btusb uvcvideo btbcm btintel
videobuf2_vmalloc bluetooth videobuf2_memops videobuf2_v4l2
videobuf2_common videodev ecdh_generic rfkill ecc snd_usb_audio
snd_usbmidi_lib snd_intel_dspcfg snd_hda_codec mc snd_hwdep coretemp
snd_virtuoso snd_oxygen_lib kvm_intel snd_hda_core input_leds
snd_mpu401_uart kvm snd_rawmidi led_class r8169 snd_seq joydev
irqbypass snd_seq_device snd_pcm
[   95.827905]  snd_hrtimer snd_timer realtek gpio_ich mxm_wmi
iTCO_wdt mdio_devres snd libphy wmi soundcore lpc_ich
tiny_power_button psmouse pcspkr i2c_i801 i2c_smbus button i7core_edac
acpi_cpufreq nfsd auth_rpcgss nfs_acl binfmt_misc lockd grace sunrpc
fuse configfs zram zsmalloc ip_tables x_tables ext4 crc32c_generic
crc16 mbcache jbd2 hid_microsoft usbhid sr_mod cdrom sd_mod amdgpu
uhci_hcd drm_ttm_helper ttm mfd_core gpu_sched i2c_algo_bit
drm_kms_helper cfbfillrect syscopyarea cfbimgblt sysfillrect sysimgblt
fb_sys_fops cfbcopyarea cec xhci_pci rc_core ehci_pci drm ehci_hcd
firewire_ohci pata_jmicron xhci_hcd ahci libahci crc32c_intel
firewire_core libata crc_itu_t serio_raw scsi_mod usbcore usb_common
drm_panel_orientation_quirks ipmi_devintf ipmi_msghandler msr
sha256_ssse3 sha256_generic ipv6 crc_ccitt
[   95.986940] CPU: 7 PID: 1 Comm: systemd Tainted: G          I
5.14.20 #1
[   95.993114] Hardware name: Gigabyte Technology Co., Ltd.
EX58-UD3R/EX58-UD3R, BIOS FB  05/04/2009
[   96.001000] RIP: 0010:ttm_bo_release+0x1c/0x266 [ttm]
[   96.004945] Code: 44 89 e0 5b 5d 41 5c 41 5d 41 5e 41 5f c3 41 56
41 55 41 54 4c 8d a7 90 fe ff ff 55 53 83 7f 4c 00 48 89 fb 48 8b 6f
e8 74 02 <0f> 0b 80 7b 18 00 48 8b 43 88 0f 85 ac 00 00 00 4c 8d 6b 90
49 39
[   96.023154] RSP: 0018:ffffc90000023e00 EFLAGS: 00010202
[   96.027128] RAX: 0000000000000001 RBX: ffff888105ac0dc8 RCX: 0000000000000292
[   96.033077] RDX: 0000000000000420 RSI: ffffffffa03010db RDI: ffff888105ac0dc8
[   96.039021] RBP: ffff88810bd05308 R08: 0000000000000001 R09: 0000000000000003
[   96.045104] R10: ffff8881274e5e00 R11: ffff8881274e5e00 R12: ffff888105ac0c58
[   96.051172] R13: ffff888135fe0ff8 R14: ffff88812693d540 R15: 0000000000000000
[   96.057195] FS:  00007ff7c578cb40(0000) GS:ffff888343dc0000(0000)
knlGS:0000000000000000
[   96.064276] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   96.068851] CR2: 00007f2f9152e948 CR3: 00000001008de000 CR4: 00000000000006e0
[   96.074936] Call Trace:
[   96.076091]  <TASK>
[   96.076903]  amdgpu_bo_unref+0x15/0x1e [amdgpu]
[   96.080419]  amdgpu_gem_object_free+0x2b/0x45 [amdgpu]
[   96.084505]  drm_gem_dmabuf_release+0x11/0x1a [drm]
[   96.088205]  dma_buf_release+0x36/0x7d
[   96.090760]  __dentry_kill+0xf5/0x12f
[   96.093250]  dput+0xfc/0x136
[   96.094913]  __fput+0x16a/0x1bc
[   96.096820]  task_work_run+0x64/0x75
[   96.099202]  exit_to_user_mode_prepare+0x88/0x112
[   96.102679]  syscall_exit_to_user_mode+0x14/0x1f
[   96.105996]  do_syscall_64+0x7a/0x80
[   96.108276]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   96.112030] RIP: 0033:0x7ff7c62c2fdb
[   96.114309] Code: 03 00 00 00 0f 05 48 3d 00 f0 ff ff 77 41 c3 48
83 ec 18 89 7c 24 0c e8 33 81 f8 ff 8b 7c 24 0c 41 89 c0 b8 03 00 00
00 0f 05 <48> 3d 00 f0 ff ff 77 35 44 89 c7 89 44 24 0c e8 81 81 f8 ff
8b 44
[   96.131760] RSP: 002b:00007fff0b56d3f0 EFLAGS: 00000293 ORIG_RAX:
0000000000000003
[   96.138100] RAX: 0000000000000000 RBX: 00007ff7c578c8f0 RCX: 00007ff7c62c2fdb
[   96.143944] RDX: 0000000000000000 RSI: 0000000556cdb0cc RDI: 0000000000000069
[   96.149859] RBP: 0000000000000069 R08: 0000000000000000 R09: 000000000000007f
[   96.155751] R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000000
[   96.161679] R13: 0000556cda037680 R14: 0000556cd9ff0719 R15: 0000556cdb0cb480
[   96.167643]  </TASK>
[   96.168544] ---[ end trace 9ff3687327d73ce2 ]---

Cheers,
Chris
