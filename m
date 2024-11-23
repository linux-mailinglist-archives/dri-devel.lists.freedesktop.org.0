Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEFD9D6723
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 02:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4917810E452;
	Sat, 23 Nov 2024 01:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D3VZzrfu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A5D10E1A9;
 Sat, 23 Nov 2024 01:56:45 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-460dce6fff9so18565681cf.1; 
 Fri, 22 Nov 2024 17:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732327004; x=1732931804; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SbWHakUX9ZtEgnqPU/NswGuac0NLhWtUUtku6WlLLAk=;
 b=D3VZzrfulSxhgjchzZRP61c84IxKm5gxIgXqWskwyADH269I6jgc5HqFl1jRwWDMSy
 Cpzzih35SmHqagaYypF6RPzUy4xP7A5NFYyln1ige1nTYDzN3kCiX/xmt96zV2RGrE4H
 Nincjd9/J09QtD5pSkMw6MVSGCbgrsi9wtBtAbjop6CFVbPd1uM4nF38VphrPnWnAWNT
 KTIsQEenLYR8rpvg/RO6fZReoU30/wNSDKBKAibqdqWKcFYLphs1vc06nOZHSmuYyjwA
 6080hc7TspjlEi4xPGbIGEC9Q6hsENU3nVHPOltVCONqjL2mORVGni3cTsiObsJRJWZN
 E9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732327004; x=1732931804;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SbWHakUX9ZtEgnqPU/NswGuac0NLhWtUUtku6WlLLAk=;
 b=BIWjRAFX7VdzdA6linZ9I4+D4WvR+py5RDrdA36u0mxX6vnEosS++6Ec4kAcp0p+fL
 d5JKHcB8ewtYZkbfhSvUXxM1nYqLy10Wa+PjR5KxyuuMBSqwEtZm/4Qto8UwZvXR5Nhf
 khJ6olcIgEzBO6B/pKNBoTe8DASRjv+jHdpA9A3NyMF9TyGza3ergcaSVnMgImjet92W
 WAyGWr1UXsc4MR3Jyg6ESGkOuM/jNA8wqNxd3fh51DfYsx5gnevcFNxJAggelrySveKG
 9bfMyIHaebTCrxOmIVoXX0jJZPcU/TjyVv4vL/DXG+2jmRnKo9hggRKJLK90n5vi0BWk
 C3rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ16V8ncIvCvcij39dlXP3t5UhfuSV8gy5HIgHsN+qjO5Yx8Zd6fkvGxlZBR+5SWUFVmFvH+QbPQk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCEoSUGABMbTcjjh8Nnt0u/JwRYVPG7T5KjXHSd3StfkR3xNBE
 lG+Qv6cWyqZkolnCNsHZh2rk5RLWy/NBwhCRQuzeoxJn66c6IwEP61geh+tCmJ5B2++LOjgIGEG
 5ff9bEPq7k3vJktCPLRpt46t59Kx6iu7/
X-Gm-Gg: ASbGncvxEpa+w0JpS29TFAnpujzCbGVul3uaCpod3k90UYoXT3TcHBY6UrClH8e0qPI
 xOOwO8DAAuUbHo1/suy6K5OLsPuzeJkg=
X-Google-Smtp-Source: AGHT+IH5Fr+sZz4ivcPBKChPrt0U8V00z85wYBlkns1ZmbO0KyN5E4Wne4c9VY5F9GW5Ke0M2gnvhqdoh+YlxAUf+h4=
MIME-Version: 1.0
X-Received: by 2002:a05:622a:10e:b0:462:aac9:56bd with SMTP id
 d75a77b69052e-4653d5222c6mr77267211cf.4.1732327004147; Fri, 22 Nov 2024
 17:56:44 -0800 (PST)
Received: from 377903785069 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Nov 2024 20:56:43 -0500
From: Forest Crossman <cyrozap@gmail.com>
Date: Fri, 22 Nov 2024 20:56:43 -0500
Message-ID: <CAO3ALPyC20qhCV4J93gxsiaovgXY_DWh7D2=mVK-YKAV=9sXQA@mail.gmail.com>
Subject: Kernel warning in dcn30_dpp.c; short freezing, crashes in KWin
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, all. I have a laptop with an AMD Radeon 780M, and I'm getting a
warning message shortly after boot (see the end of this email for the
message). I noticed the message while investigating some issues that I
began to experience after performing some software updates.

The first issue I noticed was that the screen will have very short
freezes--like it's failing to refresh--when the mouse isn't moving,
which is immediately noticeable when typing. I've been able to work
around this issue by dropping my displays refresh rate from its native
120 Hz to 60 Hz (which according to the EDID isn't actually changing the
refresh rate of the screen so much as increasing the blanking period so
the screen only gets updated 60 times per second), but I still
experience the issue when entering my password at the login screen
(SDDM), which I think is still running the display at its native 120 Hz.

Coincidentally (or perhaps not), I've also been getting very consistent
crashes in KWin (Wayland) whenever I run a Vulkan game (specifically,
Baldur's Gate 3 version 4.1.1.6072089). KWin doesn't crash if I instead
run the game in DirectX 11 mode, with Wine performing the translation to
OpenGL. Using DXVK to translate the DirectX calls to Vulkan causes the
same crash in KWin.

If you need any more information from me to find the source of these
warning messages, freezing, and crashes, or if you have any suggestions
as to how I can troubleshoot further, please let me know.

My system information and the warning message itself can be found at the
end of this message.

Regards,
Forest

---

System information:

Operating System: Arch Linux
KDE Plasma Version: 6.2.3
KDE Frameworks Version: 6.8.0
Qt Version: 6.8.0
Kernel Version: 6.11.9-arch1-1 (64-bit)
Graphics Platform: Wayland
Processors: 16 =C3=97 AMD Ryzen 7 PRO 8840HS w/ Radeon 780M Graphics
Memory: 58.5 GiB of RAM
Graphics Processor: AMD Radeon Graphics
Manufacturer: LENOVO
Product Name: 21ME001MUS
System Version: ThinkPad P14s Gen 5 AMD

Display: 2880x1800 120 Hz HDR OLED (eDP), set to 60 Hz with HDR enabled

---

Kernel warning message:

[   22.335551] ------------[ cut here ]------------
[   22.335557] WARNING: CPU: 8 PID: 537 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dpp/dcn30/dcn30_dpp.c:534
dpp3_deferred_update+0x101/0x330 [amdgpu]
[   22.335904] Modules linked in: snd_seq_dummy rfcomm snd_hrtimer
snd_seq snd_seq_device wireguard curve25519_x86_64 libchacha20poly1305
chacha_x86_64 poly1305_x86_64 libcurve25519_generic libchacha
ip6_udp_tunnel udp_tunnel nft_masq nft_reject_ipv4 nf_nat_tftp
nf_conntrack_tftp bridge stp llc nft_fib_inet nft_fib_ipv4
nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6
nft_reject nft_ct nft_chain_nat ip6table_nat ip6table_mangle
ip6table_raw ip6table_security iptable_nat nf_nat nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw
iptable_security nf_tables libcrc32c ip6table_filter ip6_tables
iptable_filter cmac algif_hash algif_skcipher af_alg bnep qrtr_mhi
vfat fat amd_atl intel_rapl_msr intel_rapl_common amdgpu
snd_soc_ps_mach snd_soc_dmic snd_ps_pdm_dma snd_sof_amd_acp63
snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_amd_renoir joydev
snd_sof_amd_acp mousedev snd_sof_pci snd_sof_xtensa_dsp qrtr snd_sof
snd_sof_utils ath11k_pci btusb snd_pci_ps btrtl snd_amd_sdw_acpi
btintel ath11k
[   22.335963]  uvcvideo soundwire_amd btbcm
soundwire_generic_allocation videobuf2_vmalloc snd_hda_codec_realtek
btmtk uvc soundwire_bus qmi_helpers snd_hda_codec_generic
videobuf2_memops snd_hda_scodec_component snd_hda_codec_hdmi
videobuf2_v4l2 amdxcp snd_soc_core drm_exec mac80211 gpu_sched
videodev snd_compress snd_hda_intel drm_buddy ac97_bus hid_multitouch
snd_intel_dspcfg i2c_algo_bit snd_pcm_dmaengine videobuf2_common
snd_intel_sdw_acpi snd_rpl_pci_acp6x think_lmi kvm_amd spd5118
hid_generic drm_suballoc_helper libarc4 bluetooth mc wmi_bmof
firmware_attributes_class snd_hda_codec snd_ctl_led snd_acp_pci
drm_ttm_helper snd_acp_legacy_common snd_hda_core ttm kvm
snd_pci_acp6x snd_hwdep cfg80211 snd_pcm drm_display_helper
thinkpad_acpi snd_pci_acp5x r8169 snd_rn_pci_acp3x snd_timer
sparse_keymap sp5100_tco cec ucsi_acpi snd_acp_config realtek rapl snd
typec_ucsi video i2c_piix4 snd_soc_acpi rfkill mdio_devres psmouse
typec pcspkr amd_pmf thunderbolt snd_pci_acp3x soundcore mhi i2c_smbus
k10temp libphy roles amdtee
[   22.336033]  wmi i2c_hid_acpi amd_sfh i2c_hid platform_profile
amd_pmc mac_hid usbip_host usbip_core i2c_dev sg crypto_user loop
nfnetlink ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2
dm_crypt cbc encrypted_keys trusted asn1_encoder tee dm_mod
crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni
polyval_generic ghash_clmulni_intel serio_raw sha512_ssse3 atkbd
sha256_ssse3 libps2 sha1_ssse3 vivaldi_fmap aesni_intel nvme gf128mul
crypto_simd nvme_core cryptd xhci_pci i8042 ccp xhci_pci_renesas
nvme_auth serio
[   22.336077] CPU: 8 UID: 0 PID: 537 Comm: kworker/u64:9 Not tainted
6.11.9-arch1-1 #1 1400000003000000474e55001d863d1de79e869f
[   22.336081] Hardware name: LENOVO 21ME001MUS/21ME001MUS, BIOS
R2LET29W (1.10 ) 09/25/2024
[   22.336083] Workqueue: events_unbound commit_work
[   22.336089] RIP: 0010:dpp3_deferred_update+0x101/0x330 [amdgpu]
[   22.336242] Code: 83 78 e1 00 00 0f b6 90 a8 02 00 00 48 8b 83 70
e1 00 00 8b b0 78 04 00 00 e8 bb bf 11 00 8b 74 24 04 85 f6 0f 84 5d
01 00 00 <0f> 0b 0f b6 83 48 96 00 00 83 e0 f7 88 83 48 96 00 00 a8 01
0f 84
[   22.336244] RSP: 0018:ffff9e9800ce3ba0 EFLAGS: 00010202
[   22.336246] RAX: 0000000000000066 RBX: ffff8b3230d60000 RCX: 00000000000=
00004
[   22.336247] RDX: 0000000000000000 RSI: 0000000000000002 RDI: ffff8b323de=
00000
[   22.336248] RBP: ffff8b3252d80000 R08: ffff9e9800ce3ba4 R09: ffff9e9800c=
e3bd0
[   22.336249] R10: ffff9e9800ce3b48 R11: 0000000000000000 R12: 00000000000=
00000
[   22.336250] R13: ffff8b3252d840a8 R14: ffff8b3252d85f78 R15: ffff8b323f4=
ab800
[   22.336251] FS:  0000000000000000(0000) GS:ffff8b4061e00000(0000)
knlGS:0000000000000000
[   22.336252] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   22.336253] CR2: 000075470cd2ff80 CR3: 0000000dd0822000 CR4: 0000000000f=
50ef0
[   22.336254] PKRU: 55555554
[   22.336255] Call Trace:
[   22.336259]  <TASK>
[   22.336261]  ? dpp3_deferred_update+0x101/0x330 [amdgpu
1400000003000000474e5500c4a6d1c766d8f3ae]
[   22.336383]  ? __warn.cold+0x8e/0xe8
[   22.336387]  ? dpp3_deferred_update+0x101/0x330 [amdgpu
1400000003000000474e5500c4a6d1c766d8f3ae]
[   22.336539]  ? report_bug+0xff/0x140
[   22.336542]  ? handle_bug+0x58/0x90
[   22.336545]  ? exc_invalid_op+0x17/0x70
[   22.336546]  ? asm_exc_invalid_op+0x1a/0x20
[   22.336551]  ? dpp3_deferred_update+0x101/0x330 [amdgpu
1400000003000000474e5500c4a6d1c766d8f3ae]
[   22.336667]  dc_post_update_surfaces_to_stream+0x1b1/0x2b0 [amdgpu
1400000003000000474e5500c4a6d1c766d8f3ae]
[   22.336799]  amdgpu_dm_atomic_commit_tail+0x2c9b/0x3a50 [amdgpu
1400000003000000474e5500c4a6d1c766d8f3ae]
[   22.336959]  commit_tail+0x91/0x130
[   22.336963]  process_one_work+0x17b/0x330
[   22.336968]  worker_thread+0x2ce/0x3f0
[   22.336970]  ? __pfx_worker_thread+0x10/0x10
[   22.336972]  kthread+0xcf/0x100
[   22.336975]  ? __pfx_kthread+0x10/0x10
[   22.336978]  ret_from_fork+0x31/0x50
[   22.336981]  ? __pfx_kthread+0x10/0x10
[   22.336983]  ret_from_fork_asm+0x1a/0x30
[   22.336989]  </TASK>
[   22.336989] ---[ end trace 0000000000000000 ]---
