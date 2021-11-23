Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4056245AD25
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 21:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D032F6E105;
	Tue, 23 Nov 2021 20:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E646E105
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 20:14:30 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso589101otf.12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 12:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JZEkcVIlbsb6isQBsKnwp7kiruODQsm+vYMLOiz0hfg=;
 b=aE9et+g6101u7A6GnH65EulcFMXzUzRJQr7e0+9oF1hgiQG1F9bcJy1YV0ZYPoCcUO
 hio1m3BodGnm1M3meG0gTEY0GCrzLNnUAjfRtxww5qU4271Wh3FJNpn1mmCY6hMUmv+8
 /igSqLcdqritmFHfaEUmxipBA6pLaemUAICKcbEQnKrXqtax/jRgYrWrX4sIgxWPY0b3
 sdMHiID+rx0OscaFM/ZluzunEvTY37Jx3W9w34z0IcVAFbHX+61Yh6K4x536GA3he7p5
 dD6BhBRo2D8ggZkstXwkqVXvmiWIqb3E6ZlmWxr7DG3XYLBIXIE2IBAlaQc2XjcueDGa
 /HvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZEkcVIlbsb6isQBsKnwp7kiruODQsm+vYMLOiz0hfg=;
 b=mO6JCNbzVS4sSqOQqKdCgDsHU4RIg+wvWDWS3K3+1zLSdwIbFxJPu0Yr6K4wHUQwTs
 vW2gZ66bOmiyizqsUnkBjWTFd9VbNUBR3BEf9ro5ytpN4XE72E849HOSh6zlGq5bWbN8
 NeJM4WuPzZ9aygFMwrg09n5olNYxWQfuaRHXiA40uDmeO2bZDVdXpajHEfoTyc9xyngR
 lJ0REo28wOuiCptcF8qWEI8sdyUFsYR58C7cmfdeBKwMF5RlpC1uAf4KHRGAfR7FeyWL
 ad2wgkUoZEluN1xv/SPw45Pl4+7tD4t+gmT99nYIu+/KAF/QMrq50nuc7lmdeeKJiDWm
 DSJA==
X-Gm-Message-State: AOAM530XTXvHVcdPhKBWhfHcRJ6Jh6qVDbMOfQgJMdAUt8ogZ2u4VVrP
 0pfYkURmR1kwOSXExeRvaPJo4zu86vdU6Yju/PA=
X-Google-Smtp-Source: ABdhPJyAgcG+p/1svYU5Ot7IVwjEC4gc1TvyTb15ZCvB169RzS8KEhzhfLqT1fMkRSxl54FvDQwC6kqB5t/GD0hksGU=
X-Received: by 2002:a05:6830:1bcf:: with SMTP id
 v15mr7313488ota.200.1637698469911; 
 Tue, 23 Nov 2021 12:14:29 -0800 (PST)
MIME-Version: 1.0
References: <CAK2bqVJWOj=MOy++zNHzzF8UvmsGcOAtNxvosa60L2NMOAxnGg@mail.gmail.com>
In-Reply-To: <CAK2bqVJWOj=MOy++zNHzzF8UvmsGcOAtNxvosa60L2NMOAxnGg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Nov 2021 15:14:18 -0500
Message-ID: <CADnq5_NP81XJe0J9bBaFFaUL5YB7Y_OObYiJpQ+m9r_5sdBg=w@mail.gmail.com>
Subject: Re: [WARN][AMDGPU] Linux 5.15.4 with AMD Bonaire GPU
To: Chris Rankin <rankincj@gmail.com>
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
Cc: "for 3.8" <stable@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 21, 2021 at 9:47 AM Chris Rankin <rankincj@gmail.com> wrote:
>
> Hi,
>
> i have found this warning in my vanilla 5.15.4 kernel's dmesg log:
>
> [   87.687139] ------------[ cut here ]------------
> [   87.710799] WARNING: CPU: 1 PID: 1 at
> drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0x1c/0x266 [ttm]
> [   87.718965] Modules linked in: nf_nat_ftp nf_conntrack_ftp cfg80211
> af_packet nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
> nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
> nft_chain_nat nf_tables ebtable_nat ebtable_broute ip6table_nat
> ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
> nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle
> iptable_raw iptable_security nfnetlink ebtable_filter ebtables
> ip6table_filter ip6_tables iptable_filter bnep it87 hwmon_vid dm_mod
> dax snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio
> snd_hda_codec_hdmi snd_hda_intel uvcvideo videobuf2_vmalloc
> videobuf2_memops snd_intel_dspcfg snd_hda_codec snd_usb_audio
> snd_usbmidi_lib snd_hwdep videobuf2_v4l2 snd_virtuoso snd_oxygen_lib
> videobuf2_common btusb snd_mpu401_uart input_leds snd_hda_core
> videodev btbcm snd_rawmidi btintel joydev snd_seq mc led_class
> bluetooth ecdh_generic rfkill snd_seq_device ecc snd_pcm r8169
> coretemp snd_hrtimer i2c_i801 psmouse
> [   87.719024]  i2c_smbus pcspkr kvm_intel realtek kvm snd_timer
> gpio_ich mdio_devres iTCO_wdt snd libphy mxm_wmi irqbypass soundcore
> tiny_power_button lpc_ich i7core_edac acpi_cpufreq button wmi nfsd
> auth_rpcgss nfs_acl lockd grace sunrpc binfmt_misc fuse configfs zram
> zsmalloc ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2
> hid_microsoft usbhid sr_mod cdrom sd_mod amdgpu uhci_hcd
> drm_ttm_helper ehci_pci ttm mfd_core ehci_hcd gpu_sched xhci_pci
> xhci_hcd i2c_algo_bit crc32c_intel serio_raw drm_kms_helper
> firewire_ohci ahci libahci pata_jmicron firewire_core libata crc_itu_t
> cfbfillrect syscopyarea cfbimgblt sysfillrect sysimgblt fb_sys_fops
> cfbcopyarea cec rc_core scsi_mod usbcore drm bsg scsi_common
> usb_common drm_panel_orientation_quirks ipmi_devintf ipmi_msghandler
> msr sha256_ssse3 sha256_generic ipv6 crc_ccitt
> [   87.876267] CPU: 1 PID: 1 Comm: systemd Tainted: G          I       5.15.4 #1
> [   87.882109] Hardware name: Gigabyte Technology Co., Ltd.
> EX58-UD3R/EX58-UD3R, BIOS FB  05/04/2009
> [   87.889800] RIP: 0010:ttm_bo_release+0x1c/0x266 [ttm]
> [   87.893615] Code: 44 89 e0 5b 5d 41 5c 41 5d 41 5e 41 5f c3 41 56
> 41 55 41 54 4c 8d a7 90 fe ff ff 55 53 83 7f 4c 00 48 89 fb 48 8b 6f
> e8 74 02 <0f> 0b 80 7b 18 00 48 8b 43 88 0f 85 ac 00 00 00 4c 8d 6b 90
> 49 39
> [   87.911829] RSP: 0018:ffffc90000023e00 EFLAGS: 00010202
> [   87.915886] RAX: 0000000000000001 RBX: ffff888123a449c8 RCX: 000000000000004c
> [   87.921825] RDX: 00000000000001f3 RSI: ffffffffa02ee0e5 RDI: ffff888123a449c8
> [   87.927750] RBP: ffff88810d6652f0 R08: 0000000000000001 R09: 0000000000000003
> [   87.933869] R10: 0000000040000000 R11: ffff888109970600 R12: ffff888123a44858
> [   87.939767] R13: ffff888146e35ad0 R14: ffff888146dad6c0 R15: 0000000000000000
> [   87.945604] FS:  00007f901262ab40(0000) GS:ffff888343c40000(0000)
> knlGS:0000000000000000
> [   87.952390] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   87.956837] CR2: 000055d9edfa8fa0 CR3: 0000000102180000 CR4: 00000000000006e0
> [   87.962704] Call Trace:
> [   87.963876]  <TASK>
> [   87.964742]  amdgpu_bo_unref+0x15/0x1e [amdgpu]
> [   87.968219]  amdgpu_gem_object_free+0x2b/0x45 [amdgpu]
> [   87.972135]  drm_gem_dmabuf_release+0x11/0x1a [drm]
> [   87.975792]  dma_buf_release+0x36/0x7d
> [   87.978363]  __dentry_kill+0xf5/0x12f
> [   87.980749]  dput+0xfc/0x136
> [   87.982386]  __fput+0x17a/0x1cc
> [   87.984234]  task_work_run+0x64/0x75
> [   87.986615]  exit_to_user_mode_prepare+0x88/0x112
> [   87.990111]  syscall_exit_to_user_mode+0x14/0x1f
> [   87.993513]  do_syscall_64+0x7a/0x80
> [   87.995873]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [   87.999798] RIP: 0033:0x7f9013160fdb
> [   88.002129] Code: 03 00 00 00 0f 05 48 3d 00 f0 ff ff 77 41 c3 48
> 83 ec 18 89 7c 24 0c e8 33 81 f8 ff 8b 7c 24 0c 41 89 c0 b8 03 00 00
> 00 0f 05 <48> 3d 00 f0 ff ff 77 35 44 89 c7 89 44 24 0c e8 81 81 f8 ff
> 8b 44
> [   88.020215] RSP: 002b:00007ffda9891d20 EFLAGS: 00000293 ORIG_RAX:
> 0000000000000003
> [   88.026698] RAX: 0000000000000000 RBX: 00007f901262a8f0 RCX: 00007f9013160fdb
> [   88.032789] RDX: 0000000000000000 RSI: 000000055d9edfc6 RDI: 0000000000000069
> [   88.038864] RBP: 0000000000000069 R08: 0000000000000000 R09: 000000000000007f
> [   88.045044] R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000000
> [   88.051033] R13: 000055d9ecadd680 R14: 000055d9eca96719 R15: 000055d9edf412f0
> [   88.056868]  </TASK>
> [   88.057758] ---[ end trace bf3184763fd2083a ]---
>
> I have seen a warning like this one in every dmesg log from 5.14.x
> onwards, and it is clearly still present in the 5.15.x series too.
>
> My GPU is a Radeon R7 360 (Bonaire).

Can you bisect?

Alex
