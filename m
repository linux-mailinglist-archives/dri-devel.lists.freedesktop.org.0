Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A8E8015B2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 22:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A4210E96F;
	Fri,  1 Dec 2023 21:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE6910E96F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 21:46:26 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3332efd75c9so1200871f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 13:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=froggi.es; s=google; t=1701467185; x=1702071985; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EBZwmFOarn8SeItcruYxs1E+cQK+a6TIZiaecZnjWog=;
 b=FdFBoGkmi0qoknhoBi7/sBiVcZOlNtdFRLjT96yrVGta6dsUIha3Z4RIOsd9ssqvuw
 vHF67whRKZ4cfYbA92RzqDrb214AnZnfTCGyTdlRfPDNyvPpbhnRKzX5oKIZi/7S7+el
 4eIk1koY5ruH5ugNcmpQ9FdYmsypTv3yKzFV/qxM7x7E9wdvqAtu/BUp/pvybMUTY0qx
 /xGVCqwD9XhxBTHuhrXw5mmx8vZM3aXLvEGKnxE1wiUcw++gok4OF0jlgDblOM/32Zr7
 XOLqml9GKcFKA1pAbIMm/kR4BhV9YgNhNOtNCMBFFFBnNnwyHwx3C7r2BCFi8jfvTcNj
 5e1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701467185; x=1702071985;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EBZwmFOarn8SeItcruYxs1E+cQK+a6TIZiaecZnjWog=;
 b=bTL5MPHN0omw1Ld1b85QXphjTde0Fgw4OnF+u8MW89yIekMau/Lv/PFRqlfC4eMJXs
 iwHwnOtmccnG45PQiNGwcyevYXj7owqRSP/Wv5Aml0mWL39ZJbgfFHXCQYUHNlXdi9Y4
 hTzE9OcjiZoAphXc5Gb++ZuLVKU4Y/qQEER0ejsr+XLY2ujLlXkWTKeaEbJvSlGkWy6Q
 bS8/ByKjQ1NaHIIr/A33P5+X6EG4bD3oLDl5VDeY9wN7KyO0xLq7hrrwJZwXDu0+SNkA
 bLeoPkpnJXU+/BeYY7pVIL1vU0c7OBVDW2Cv27OP1Ch+5IDHMKqyuIAgWKx/StPQTurR
 XMAA==
X-Gm-Message-State: AOJu0Ywxezy4Xpyqx7e8NigIl45hNQo5HDsn0RQ/T+2C2q1ImdG/UEda
 Wj7TV9DxuhxInSw53+0oC06xPr02m7sNPqIhn/M=
X-Google-Smtp-Source: AGHT+IHB8CCKNEi5fZBfrpIGnNO1TK8e8PkWAaRMtU8CB06nP7wWnPKAPboU3kq2TyJ1gfiIncsz4A==
X-Received: by 2002:a05:6000:1109:b0:333:2fd2:767a with SMTP id
 z9-20020a056000110900b003332fd2767amr609030wrw.107.1701467184677; 
 Fri, 01 Dec 2023 13:46:24 -0800 (PST)
Received: from [192.168.0.89]
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600012d200b00332ff137c29sm5169732wrx.79.2023.12.01.13.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Dec 2023 13:46:24 -0800 (PST)
Message-ID: <7177baf5-0f4f-4b9d-8f3b-35681384c11d@froggi.es>
Date: Fri, 1 Dec 2023 21:46:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: DRI Development <dri-devel@lists.freedesktop.org>
From: Joshua Ashton <joshua@froggi.es>
Subject: epoll + dmabuf + close = Kernel BUG NULL pointer dereference
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hello! I was rewriting the code in our compositor for Steam Deck, 
Gamescope, to use epoll for dmabuf image waits.

I found out that using epoll + dmabufs + close(...) while it is added to 
the epoll causes a NULL pointer dereference BUG in the kernel.

Using epoll_ctl with EPOLL_CTL_DEL before 'close' works fine, but 
close-ing the file descriptor to remove it from the epoll while 
epoll_wait results in the NULL pointer BUG.

I am currently on 6.5.9, but the same happens on 6.1.
I am also using AMDGPU.

Let me know I can get more info on the crash, it also should be easy to 
reproduce using Gamescope at this commit sha:

https://github.com/ValveSoftware/gamescope/commit/9a53b6eb37817ef403c89c104bcb73e617799114

Just run `gamescope -- glxgears` (probably only works properly on AMD, 
just a fyi). You should see either your system reboot or the BUG 
depending on your kernel build.

dmesg log:

[ 2829.171327] BUG: kernel NULL pointer dereference, address: 
0000000000000000
[ 2829.171332] #PF: supervisor read access in kernel mode
[ 2829.171333] #PF: error_code(0x0000) - not-present page
[ 2829.171334] PGD 0 P4D 0
[ 2829.171336] Oops: 0000 [#2] PREEMPT SMP NOPTI
[ 2829.171337] CPU: 11 PID: 14976 Comm: gamescope_img Tainted: G      D 
           6.5.9-273-tkg-linux-tkg #1 
1f8f4cb3cfc2d3f65b6974868e524278dc3e7e95
[ 2829.171339] Hardware name: Gigabyte Technology Co., Ltd. X670 AORUS 
ELITE AX/X670 AORUS ELITE AX, BIOS F7a 11/14/2022
[ 2829.171340] RIP: 0010:__ep_remove+0x8d/0x220
[ 2829.171344] Code: 8d 5e 10 48 89 df e8 f2 b8 a1 00 0f b6 45 3c 83 f0 
01 44 08 e8 0f 84 70 01 00 00 49 8b b6 d0 00 00 00 48 8b 45 50 48 8d 55 
50 <48> 39 16 0f 84 d6 00 00 00 48 8b 55 58 48 89 02 48 85 c0 74 04 48
[ 2829.171345] RSP: 0018:ffffaa25551cbe40 EFLAGS: 00010202
[ 2829.171346] RAX: 0000000000000000 RBX: ffff94b0094c3910 RCX: 
0000000000000000
[ 2829.171347] RDX: ffff94afe23e3f50 RSI: 0000000000000000 RDI: 
ffff94b0094c3910
[ 2829.171347] RBP: ffff94afe23e3f00 R08: ffff94ac88e85200 R09: 
0000000000000000
[ 2829.171348] R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff94ac88e85200
[ 2829.171348] R13: 0000000000000001 R14: ffff94b0094c3900 R15: 
0000000000000000
[ 2829.171349] FS:  00007f1bc502a6c0(0000) GS:ffff94cb7dac0000(0000) 
knlGS:0000000000000000
[ 2829.171349] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2829.171350] CR2: 0000000000000000 CR3: 0000000451010000 CR4: 
0000000000750ee0
[ 2829.171350] PKRU: 55555554
[ 2829.171351] Call Trace:
[ 2829.171352]  <TASK>
[ 2829.171355]  ? __die+0x23/0x70
[ 2829.171358]  ? page_fault_oops+0x171/0x4e0
[ 2829.171361]  ? ep_poll_callback+0x246/0x290
[ 2829.171362]  ? exc_page_fault+0x7f/0x180
[ 2829.171364]  ? asm_exc_page_fault+0x26/0x30
[ 2829.171368]  ? __ep_remove+0x8d/0x220
[ 2829.171369]  eventpoll_release_file+0x5b/0xa0
[ 2829.171370]  __fput+0x223/0x290
[ 2829.171373]  task_work_run+0x5a/0x90
[ 2829.171375]  exit_to_user_mode_prepare+0x123/0x140
[ 2829.171378]  syscall_exit_to_user_mode+0x1b/0x40
[ 2829.171379]  do_syscall_64+0x6c/0x90
[ 2829.171381]  ? do_syscall_64+0x6c/0x90
[ 2829.171382]  ? do_syscall_64+0x6c/0x90
[ 2829.171383]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
[ 2829.171384] RIP: 0033:0x7f1bc5841bf6
[ 2829.171406] Code: 10 89 7c 24 0c 89 4c 24 1c e8 96 81 f7 ff 44 8b 54 
24 1c 8b 54 24 18 41 89 c0 48 8b 74 24 10 8b 7c 24 0c b8 e8 00 00 00 0f 
05 <48> 3d 00 f0 ff ff 77 32 44 89 c7 89 44 24 0c e8 e6 81 f7 ff 8b 44
[ 2829.171407] RSP: 002b:00007f1bc5026a40 EFLAGS: 00000293 ORIG_RAX: 
00000000000000e8
[ 2829.171408] RAX: 0000000000000003 RBX: 000055e4732d55e0 RCX: 
00007f1bc5841bf6
[ 2829.171408] RDX: 0000000000000400 RSI: 00007f1bc5026aa0 RDI: 
0000000000000005
[ 2829.171408] RBP: 00007f1bc5029ab0 R08: 0000000000000000 R09: 
0000000000000000
[ 2829.171409] R10: 00000000ffffffff R11: 0000000000000293 R12: 
fffffffffffffd98
[ 2829.171409] R13: 0000000000000000 R14: 00007ffe4af5e240 R15: 
00007f1bc482a000
[ 2829.171410]  </TASK>
[ 2829.171411] Modules linked in: uinput nf_conntrack_netlink 
xt_addrtype br_netfilter rfcomm snd_seq_dummy snd_hrtimer snd_seq 
xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 
xt_tcpudp nft_compat nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 
nf_defrag_ipv4 bridge stp llc overlay cmac algif_hash algif_skcipher 
af_alg bnep nf_tables joydev mousedev btusb btrtl btbcm btintel btmtk 
bluetooth intel_rapl_msr intel_rapl_common ecdh_generic vfat fat amdgpu 
edac_mce_amd snd_hda_codec_realtek kvm_amd snd_hda_codec_generic 
ledtrig_audio kvm mt7921e snd_hda_codec_hdmi mt7921_common snd_usb_audio 
crct10dif_pclmul mt76_connac_lib snd_hda_intel crc32_pclmul amdxcp 
polyval_clmulni mt76 snd_usbmidi_lib snd_intel_dspcfg snd_ump drm_buddy 
snd_intel_sdw_acpi polyval_generic snd_rawmidi gf128mul snd_hda_codec 
gpu_sched ghash_clmulni_intel snd_seq_device mac80211 snd_hda_core 
i2c_algo_bit sha512_ssse3 mc drm_suballoc_helper snd_hwdep aesni_intel 
drm_ttm_helper snd_pcm r8169 ttm libarc4 ucsi_ccg crypto_simd snd_timer
[ 2829.171440]  drm_display_helper cryptd typec_ucsi realtek sp5100_tco 
mdio_devres cfg80211 usbhid cec rapl gigabyte_wmi wmi_bmof ccp snd typec 
pcspkr k10temp i2c_piix4 rfkill libphy roles video soundcore wmi 
gpio_amdpt gpio_generic mac_hid usbip_host usbip_core pkcs8_key_parser 
i2c_dev sg crypto_user dm_mod fuse loop nfnetlink ip_tables x_tables 
ext4 crc16 mbcache jbd2 nvme crc32c_intel nvme_core xhci_pci 
xhci_pci_renesas nvme_common vfio_pci vfio_pci_core irqbypass 
vfio_iommu_type1 vfio iommufd
[ 2829.171459] CR2: 0000000000000000
[ 2829.171460] ---[ end trace 0000000000000000 ]---
[ 2829.171461] RIP: 0010:__ep_remove+0x8d/0x220
[ 2829.171462] Code: 8d 5e 10 48 89 df e8 f2 b8 a1 00 0f b6 45 3c 83 f0 
01 44 08 e8 0f 84 70 01 00 00 49 8b b6 d0 00 00 00 48 8b 45 50 48 8d 55 
50 <48> 39 16 0f 84 d6 00 00 00 48 8b 55 58 48 89 02 48 85 c0 74 04 48
[ 2829.171463] RSP: 0018:ffffaa2552a9bdb8 EFLAGS: 00010202
[ 2829.171463] RAX: 0000000000000000 RBX: ffff94ae3702e610 RCX: 
0000000000000000
[ 2829.171464] RDX: ffff94aeda255850 RSI: 0000000000000000 RDI: 
ffff94ae3702e610
[ 2829.171464] RBP: ffff94aeda255800 R08: ffff94ae446e4240 R09: 
0000000000000000
[ 2829.171465] R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff94ae446e4240
[ 2829.171465] R13: 0000000000000001 R14: ffff94ae3702e600 R15: 
0000000000000000
[ 2829.171466] FS:  00007f1bc502a6c0(0000) GS:ffff94cb7dac0000(0000) 
knlGS:0000000000000000
[ 2829.171466] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2829.171467] CR2: 0000000000000000 CR3: 0000000451010000 CR4: 
0000000000750ee0
[ 2829.171467] PKRU: 55555554
[ 2829.171467] note: gamescope_img[14976] exited with irqs disabled
[ 2829.171468] note: gamescope_img[14976] exited with preempt_count 1

Thanks!

- Joshie 🐸✨
