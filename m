Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FBD4F0C3C
	for <lists+dri-devel@lfdr.de>; Sun,  3 Apr 2022 20:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845E510E17C;
	Sun,  3 Apr 2022 18:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956F410E17C
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Apr 2022 18:54:13 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id k15so767682ils.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Apr 2022 11:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=0tyOst0Xb8yCpPce9JraB8zLncAUG3RYUT1BHLUotzY=;
 b=llDHghUEvq4enh/oOtTMjoKuZmI8sK1CzVBKb3WRQOApkGBH24pZTIHlXx7xwmbO+R
 kydeoVVoH116tNsoZ1FSlS8nuQDepFzp/rjTWIN8V0v2TyoH6BLl7ItP6mSPVIeyscz/
 bcTcQSV9g7AQ4Eq56o2BrpEznBnYFePBkCwD+TDnFvr2+LoapYl4fDsdmcARJ9WBbFEd
 xmZt36U13n16RqxrCSm/iyxZBAlhHGTvrMvk7Cm9EioOdnchJBr7jgeWFB0lZkLBqOn3
 icrNJerXqgzlgRM9LKoEPOiU32jMIhHOQphSrGjvOauFzbipY0dYH5tvDU04Gfkc9vwJ
 7yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0tyOst0Xb8yCpPce9JraB8zLncAUG3RYUT1BHLUotzY=;
 b=y77C/CEBpr/Ksz9PMDHtI0JvWzUrppCnAfndqFe+RGlh8m1ew4IDZlOWtRYDBPbkl/
 O8ytRShBFW3yrbqlMrGeU1Txm9so/kdZnPW+BiQ9gxk8L5iIXe+LxoGkpGgLKU12YNbp
 NUd6eq7b4ZfpMwY+6kWUAP3xWwr2EsvZ6q7srTz2shIkYM7Xxs/LSq3QGszH+eUbmKzx
 62Awnzi1FqzeF4ZmjQaq4WXuhwPF5ZHJrblCa+T6KoE/K+k9kdGjA0f/MbvZwB0Z8JGa
 vqTPkGSvZg3K1FBQiGF1pxX1pZ8pIVb7W6ium/bGlbv4j+RKxrA0xixf1ZPpmTT2RbuD
 YwSQ==
X-Gm-Message-State: AOAM532BVQR5ZDq3DAs4nZDBm2V8NKyObaYWLabdKsglifK8dFl8kzda
 cZrwwEJoaVha8nGVRtUvqrVvTg7GdtzIdAbZobD17wPLP34=
X-Google-Smtp-Source: ABdhPJx7ka+XmgtgQ5rnyVELpfx1L4GPeDA7YZMYykFWRy0+jNq5bbpB6Y4TIb0/2e3C8qoz0PL6LeFgzYKFMQdBAu0=
X-Received: by 2002:a92:cbc3:0:b0:2c6:78fa:41e9 with SMTP id
 s3-20020a92cbc3000000b002c678fa41e9mr3844532ilq.112.1649012052418; Sun, 03
 Apr 2022 11:54:12 -0700 (PDT)
MIME-Version: 1.0
From: Chris Rankin <rankincj@gmail.com>
Date: Sun, 3 Apr 2022 19:54:01 +0100
Message-ID: <CAK2bqVJ+doVhoWRN9KKW2JfX-jG7GQ_-a4gzZ8V5SGE901OfXQ@mail.gmail.com>
Subject: [WARNING] [AMDGPU] Linux 5.16.18 warning about ttm_bo_release with R7
 360
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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

Hi,

I have resurrected my old AMD R7 360 card (Bonnaire?) for a machine
that needed an upgrade, and now notice this warning in the dmesg log,
soon after logging into X. (In fact, this warning looks rather
familiar. I suspect I was already reporting it up until I removed this
R7 360 from my own machine.)

This is with a Fedora 5.16.18-200.fc35.x86_64 kernel. Kernel trace follows.

Cheers,
Chris

[  568.881348] ------------[ cut here ]------------
[  568.881354] WARNING: CPU: 0 PID: 1 at
drivers/gpu/drm/ttm/ttm_bo.c:411 ttm_bo_release+0x34c/0x370 [ttm]
[  568.881365] Modules linked in: rfcomm hid_logitech_hidpp joydev
hid_logitech_dj nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
nft_chain_nat nf_tables ebtable_nat ebtable_broute ip6table_nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw
iptable_security ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter bnep sunrpc binfmt_misc
btusb btrtl uvcvideo intel_rapl_msr btbcm intel_rapl_common btintel
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common
bluetooth x86_pkg_temp_thermal intel_powerclamp snd_usb_audio
snd_hda_codec_realtek videodev snd_hda_codec_hdmi
snd_hda_codec_generic coretemp snd_usbmidi_lib snd_rawmidi mc
ledtrig_audio snd_hda_intel ecdh_generic snd_intel_dspcfg
snd_intel_sdw_acpi kvm_intel snd_hda_codec kvm snd_hda_core mei_pxp
irqbypass snd_hwdep mei_hdcp snd_seq snd_seq_device
[  568.881405]  rapl snd_pcm eeepc_wmi intel_cstate iTCO_wdt
intel_pmc_bxt snd_timer mei_me iTCO_vendor_support intel_uncore snd
soundcore asus_wmi sparse_keymap platform_profile rfkill at24 ppdev
mei i2c_i801 i2c_smbus lpc_ich parport_pc parport wmi_bmof fuse
ip_tables amdgpu iommu_v2 gpu_sched radeon crct10dif_pclmul
crc32_pclmul crc32c_intel ghash_clmulni_intel i2c_algo_bit
drm_ttm_helper ttm drm_kms_helper cec drm r8169 wmi video ipmi_devintf
ipmi_msghandler
[  568.881431] CPU: 0 PID: 1 Comm: systemd Not tainted
5.16.18-200.fc35.x86_64 #1
[  568.881433] Hardware name: System manufacturer System Product
Name/P8H61-M LE/USB3, BIOS 0803 10/21/2011
[  568.881435] RIP: 0010:ttm_bo_release+0x34c/0x370 [ttm]
[  568.881441] Code: 00 e8 88 64 42 e3 48 8b 43 e8 eb a8 be 03 00 00
00 e8 a8 d2 1f e3 e9 97 fd ff ff e8 4e 42 42 e3 e9 8d fd ff ff 48 89
e8 eb 8a <0f> 0b e9 d7 fc ff ff e8 38 42 42 e3 e9 de fe ff ff be 03 00
00 00
[  568.881443] RSP: 0018:ffffc1e64001fe00 EFLAGS: 00010202
[  568.881446] RAX: 0000000000000001 RBX: ffff9fbcf26cb5b8 RCX: 000000000ce9e000
[  568.881448] RDX: 0000000000000001 RSI: f8c959798f8a2452 RDI: ffff9fbcf26cb5b8
[  568.881449] RBP: ffff9fbdca725280 R08: ffff9fbcf26cb5b8 R09: 00000000802a0028
[  568.881451] R10: ffff9fbdc6386cc8 R11: ffff9fbcf4da3600 R12: ffff9fbcf26cb458
[  568.881452] R13: ffff9fbdc01e3920 R14: ffff9fbcf4c06e40 R15: 0000000000000000
[  568.881454] FS:  00007f869ebe8b40(0000) GS:ffff9fbdfb400000(0000)
knlGS:0000000000000000
[  568.881456] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  568.881458] CR2: 000055a016daa830 CR3: 0000000101c9c004 CR4: 00000000000606f0
[  568.881460] Call Trace:
[  568.881463]  <TASK>
[  568.881465]  ? kfree+0xaa/0x3e0
[  568.881471]  ? kernfs_put.part.0+0xd9/0x1a0
[  568.881476]  amdgpu_bo_unref+0x1a/0x30 [amdgpu]
[  568.881725]  amdgpu_gem_object_free+0x20/0x30 [amdgpu]
[  568.881886]  drm_gem_dmabuf_release+0x36/0x50 [drm]
[  568.881930]  dma_buf_release+0x42/0x90
[  568.881936]  __dentry_kill+0x101/0x180
[  568.881942]  __fput+0xe3/0x250
[  568.881947]  task_work_run+0x5c/0x90
[  568.881952]  exit_to_user_mode_prepare+0x229/0x230
[  568.881958]  syscall_exit_to_user_mode+0x18/0x40
[  568.881963]  do_syscall_64+0x48/0x90
[  568.881968]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  568.881973] RIP: 0033:0x7f869f6d7f1b
[  568.881978] Code: 03 00 00 00 0f 05 48 3d 00 f0 ff ff 77 41 c3 48
83 ec 18 89 7c 24 0c e8 b3 81 f8 ff 8b 7c 24 0c 41 89 c0 b8 03 00 00
00 0f 05 <48> 3d 00 f0 ff ff 77 35 44 89 c7 89 44 24 0c e8 01 82 f8 ff
8b 44
[  568.881981] RSP: 002b:00007fff4d1a6c00 EFLAGS: 00000293 ORIG_RAX:
0000000000000003
[  568.881985] RAX: 0000000000000000 RBX: 00007f869ebe88f0 RCX: 00007f869f6d7f1b
[  568.881988] RDX: 0000000000000000 RSI: 000000055a016ea7 RDI: 0000000000000071
[  568.881990] RBP: 0000000000000071 R08: 0000000000000000 R09: 000000000000007f
[  568.881992] R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000000
[  568.881995] R13: 000055a015029680 R14: 000055a014fe2719 R15: 000055a016dd7910
[  568.881999]  </TASK>
[  568.882001] ---[ end trace bf1924c74ac9a389 ]-
