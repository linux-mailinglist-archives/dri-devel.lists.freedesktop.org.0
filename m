Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2BBABFB67
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 18:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3ED10E9F8;
	Wed, 21 May 2025 16:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UPVTEJ9e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B0511A753;
 Wed, 21 May 2025 16:40:37 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-601a8b6c133so4178184eaf.1; 
 Wed, 21 May 2025 09:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747845636; x=1748450436; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QbKXb/kp3YLXJYoIi/689hXGBZs3zu8VOmGvJyjvrIg=;
 b=UPVTEJ9e5D35Tx09jiqVF1XV4gX6BIPibgaz+Ku/ufM0asgIUN91eG71vaheXdWf+s
 YgufCquj+atp8X+by4ElMThoO7mO4f4hK9O1FCvvu+9RQeNn9ojZQIKm3J1Bt3py1m0y
 DiT66R2LrnoFrgytkw7DHcm8jQhC66JOqYWB02/9BD6AW0TMlad9Pjv0s8d/gx0ikHDH
 2As62VyLeJgJIc+T4HKqviF2vw/RAsHBdHdkQZafL0PKn9vUpJKDWzlsPcjnRfKgXzW9
 jMD1yrorgKfEofVmkg+WtlZyzgL1+0TfB4a/XVVVDE1XShNvY09Vl9QujHjp7uy4aVLH
 sFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747845636; x=1748450436;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QbKXb/kp3YLXJYoIi/689hXGBZs3zu8VOmGvJyjvrIg=;
 b=TBHb381ghQZYwSKnT2cqYo+1+haPQ63jTzZvFoq7c5v+m4ciKeyRTcN9d1JbRCj8CV
 Qtm2MdGfcJWWHNvEjMRfDfhG6jenboxgPnyhVaweHbrQkRqxgCyuM7ec0HzxJUXg6jcb
 tX6+XtDUMzuvE21+wg6hJV3RNbnVhiwKncHJDAGpkigGm37ikeTE6JKPyMnFkmKAEys3
 DeeulU0aj+PWLvwvB28PdDTrGQnzXYz+uP1xY71jCYQ880OqbkHcVRg/KQJAkGo5WM7w
 +b5BxAiv1fAkyIQlFi82uo0Zsop9RkwwC9EcYGkkDg6uA/U4LgdbZrTx5ldWkhkCTH5A
 RFkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6pDRsO/0OiF/6C2vSw+l5XEo9zirI0eDalVl+T68HWgx8WKjWQa2me8OhQ3r2owKcCpYP2jaE@lists.freedesktop.org,
 AJvYcCWKDb8YqB75+cyWpOkrsBtWDez2xzQPiSgB0aTsKyAz7GxTHtvPwpJ5JpVJ5PZUKtcYSJgfVHgj1OD7@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+gtyFsFNUbcxo/JKSfIOQY/4Piq88E1oJRPI/p2A6D4Zr3jzx
 yIuAO6zAT9RHlMaTEChMd7l/JZ1WPTeZMPs1zShvlbnZEz92wO1N6cF1rY+js6dUK+obdMWFmzm
 lSDvRbzNvWu97apURQqiSSp8Er6LY5Us=
X-Gm-Gg: ASbGncs+RUCv3R1o2BE6uL2Y+o4o2MDYfv2mr9+05Z51s4CKUlYnEQINeWSCWAnyPOu
 NbNdlDRbkIc/SkzvWPtNQ4EnASeSPx4mTAuXaLg8UDnmfp9fCjNgvzgBGhNvgZ0q+uRTYUzaKdH
 /1APMuoGHbOyQ1NVUgVwPLxL6V3fpD7lo8pQ==
X-Google-Smtp-Source: AGHT+IHRzqYtPxSRPnFk2+3DUAgyMi453aULIFTaFyWd4/OQ62pgXMsAQz4aLm5vDHuUiu6i/M949FaN1jbgvx+0LzI=
X-Received: by 2002:a05:6871:2317:b0:2d5:f8f:56eb with SMTP id
 586e51a60fabf-2e3c274eff6mr12085787fac.2.1747845636323; Wed, 21 May 2025
 09:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsPLAs+rCktbM_ao3bP3VZuaLqXSMpXZt1m-B9nqf91EQw@mail.gmail.com>
 <CH0PR12MB52845B90BB3D7B94473B6FDA8B9FA@CH0PR12MB5284.namprd12.prod.outlook.com>
 <CABXGCsNmsQgvNZL0_pHxnHLKNZS=k_yzmMNoGgfGQqsimTWucQ@mail.gmail.com>
In-Reply-To: <CABXGCsNmsQgvNZL0_pHxnHLKNZS=k_yzmMNoGgfGQqsimTWucQ@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 21 May 2025 21:40:24 +0500
X-Gm-Features: AX0GCFtFYjMJi9YPXvSgdqYaH5RROiQZ_pBJ31Id_wrVLR1st4fss_KHTUWYW-0
Message-ID: <CABXGCsMgEnrtHjJvPPmrXDFkmMkU5TN57bU_396PuF_D02oQSQ@mail.gmail.com>
Subject: Re: 6.15-rc6/regression/bisected - after commit f1c6be3999d2 error
 appeared: *ERROR* dc_dmub_srv_log_diagnostic_data: DMCUB error
To: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
Cc: "Chung, ChiaHsuan (Tom)" <ChiaHsuan.Chung@amd.com>, "Wu,
 Ray" <Ray.Wu@amd.com>, 
 "Wheeler, Daniel" <Daniel.Wheeler@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 Linux regressions mailing list <regressions@lists.linux.dev>
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

On Tue, May 20, 2025 at 9:22=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> > Could you more details about your setup, and how you were able to repro=
 it ?
> >

Hi,
Were you able to reproduce the issue?

I=E2=80=99ve prepared a step-by-step guide that may help:
1. Set up a system with a Radeon 6900XT and an LG TV connected via HDMI.
2. Install Fedora Rawhide.
3. Build and install kernel 6.15-rc7 using my .config (attached in the
first message).
4. Boot into the custom-built kernel.
5. Set the display resolution to 3840=C3=972160 @ 120=E2=80=AFHz.
(This step is optional but may help trigger the issue faster.)
6. Generate heavy system load. I use an infinite kernel rebuild loop:
<fish shell>
> for i in (seq 1 400000); make clean && make -j32 bzImage && make -j32 mod=
ules; end
</fish shell>

Expected behavior:
System remains stable during heavy load.

Actual behavior:
1. First, the kernel log is filled with repeated messages:
amdgpu 0000:03:00.0: amdgpu: [drm] DP AUX transfer fail:4
2. After a short while under load, more severe errors appear:
amdgpu 0000:03:00.0: [drm] *ERROR* dc_dmub_srv_log_diagnostic_data:
DMCUB error - collecting diagnostic data
3. Finally, the system completely freezes with a hard lockup:
watchdog: CPU28: Watchdog detected hard LOCKUP on cpu 28
Modules linked in: uinput rfcomm snd_seq_dummy snd_hrtimer nft_queue
nfnetlink_queue nf_conntrack_netbios_ns nf_conntrack_broadcast
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables qrtr bnep
sunrpc binfmt_misc amd_atl intel_rapl_msr intel_rapl_common
edac_mce_amd btusb snd_hda_codec_realtek btrtl mt7921e btintel
mt7921_common snd_hda_codec_generic btbcm mt792x_lib btmtk
snd_hda_scodec_component snd_hda_codec_hdmi snd_usb_audio
mt76_connac_lib kvm_amd snd_hda_intel bluetooth mt76 snd_intel_dspcfg
snd_usbmidi_lib snd_intel_sdw_acpi snd_hda_codec mc kvm spd5118
mac80211 snd_ump snd_hda_core snd_rawmidi snd_hwdep vfat irqbypass fat
snd_seq snd_seq_device wmi_bmof libarc4 rapl r8169 pcspkr snd_pcm
cfg80211 i2c_piix4 snd_timer k10temp i2c_smbus realtek snd rfkill
joydev soundcore gpio_amdpt gpio_generic loop nfnetlink zram
lz4hc_compress lz4_compress amdgpu amdxcp
 i2c_algo_bit drm_ttm_helper ttm drm_exec nvme polyval_clmulni
gpu_sched polyval_generic ghash_clmulni_intel drm_suballoc_helper
ucsi_ccg nvme_core sha512_ssse3 typec_ucsi drm_panel_backlight_quirks
sha256_ssse3 drm_buddy nvme_keyring typec sha1_ssse3 sp5100_tco
nvme_auth drm_display_helper cec video wmi fuse
irq event stamp: 117172
hardirqs last  enabled at (117171): [<ffffffff9e001566>]
asm_common_interrupt+0x26/0x40
hardirqs last disabled at (117172): [<ffffffffa1c00f97>]
irqentry_enter+0x57/0x60
softirqs last  enabled at (117144): [<ffffffff9e614919>]
handle_softirqs+0x579/0x840
softirqs last disabled at (117137): [<ffffffff9e614d16>]
__irq_exit_rcu+0x126/0x240
CPU: 28 UID: 1000 PID: 1737394 Comm: as Tainted: G        W    L
------  ---  6.15.0-0.rc6.250515g088d13246a46.54.fc43.x86_64+debug #1
PREEMPT(lazy)
Tainted: [W]=3DWARN, [L]=3DSOFTLOCKUP
Hardware name: ASRock B650I Lightning WiFi/B650I Lightning WiFi, BIOS
3.08 09/18/2024
RIP: 0010:delay_halt_mwaitx+0x20/0x50
Code: 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 53 65
48 8b 05 56 13 0d 04 31 d2 48 89 d1 48 05 00 00 ca a5 0f 01 fa <b8> ff
ff ff ff b9 02 00 00 00 48 39 c6 48 0f 47 f0 b8 f0 00 00 00
RSP: 0000:ffffc9003b68f820 EFLAGS: 00000087
RAX: ffff888fda610000 RBX: 000000000000118c RCX: 0000000000000000
RDX: 0000000000000000 RSI: 000000000000118c RDI: 000023b4c02956f6
RBP: 000023b4c02956f6 R08: ffffffffc14b01a9 R09: fffffbfff49570d4
R10: 000000000000001c R11: 0000000000002000 R12: ffffed1040583d43
R13: ffffed1040583d17 R14: 00000000000186a0 R15: ffff888202c1e800
FS:  00007f1da07bcd00(0000) GS:ffff889034970000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1da0a43930 CR3: 00000003e594a000 CR4: 0000000000f50ef0
PKRU: 55555554
Call Trace:
 <TASK>
 delay_halt.part.0+0x33/0x60
 dmub_srv_wait_for_idle+0x12f/0x1d0 [amdgpu]
 dc_dmub_srv_cmd_run_list+0x99/0x2a0 [amdgpu]
 dc_dmub_srv_drr_update_cmd+0x158/0x340 [amdgpu]
 ? __lock_acquire+0x40f/0x1160
 ? __pfx_dc_dmub_srv_drr_update_cmd+0x10/0x10 [amdgpu]
 ? lock_acquire.part.0+0xc8/0x270
 ? local_clock_noinstr+0xf/0x130
 optc1_set_drr+0x18b/0xf20 [amdgpu]
 ? rcu_is_watching+0x15/0xe0
 set_drr_and_clear_adjust_pending+0xa6/0x180 [amdgpu]
 ? __lock_acquire+0x40f/0x1160
 dcn10_set_drr+0x224/0x390 [amdgpu]
 ? __pfx_dcn10_set_drr+0x10/0x10 [amdgpu]
 ? local_clock+0x15/0x30
 ? __lock_release.isra.0+0x1cb/0x340
 ? rcu_is_watching+0x15/0xe0
 dc_stream_adjust_vmin_vmax+0x4d9/0xd60 [amdgpu]
 ? __pfx_dc_stream_adjust_vmin_vmax+0x10/0x10 [amdgpu]
 ? dm_crtc_high_irq+0x4c8/0xb70 [amdgpu]
 ? __raw_spin_lock_irqsave+0x60/0x90
 dm_crtc_high_irq+0x7b5/0xb70 [amdgpu]
 ? amdgpu_dm_irq_handler+0xf3/0x2a0 [amdgpu]
 amdgpu_dm_irq_handler+0x19a/0x2a0 [amdgpu]
 amdgpu_irq_dispatch+0x286/0x670 [amdgpu]
 ? find_held_lock+0x2b/0x80
 ? __pfx_amdgpu_irq_dispatch+0x10/0x10 [amdgpu]
 ? __pfx___drm_dev_dbg+0x10/0x10
 ? do_raw_spin_unlock+0x59/0x230
 ? __wake_up+0x44/0x60
 amdgpu_ih_process+0x1c4/0x3a0 [amdgpu]
 ? __pfx_amdgpu_irq_handler+0x10/0x10 [amdgpu]
 amdgpu_irq_handler+0x27/0xb0 [amdgpu]
 ? __pfx_amdgpu_irq_handler+0x10/0x10 [amdgpu]
 __handle_irq_event_percpu+0x1b5/0x510
 handle_irq_event+0xab/0x1c0
 handle_edge_irq+0x213/0xb50
 __common_interrupt+0xad/0x1d0
 ? irq_enter_rcu+0x26/0x190
 common_interrupt+0x5a/0xe0
 asm_common_interrupt+0x26/0x40
RIP: 0033:0x5639d9e740ee
Code: 45 c8 85 d2 74 04 41 80 08 04 48 83 c4 58 4c 89 c8 5b 41 5c 41
5d 41 5e 41 5f 5d c3 48 8b 57 10 44 8b 15 fd bd 08 00 4c 03 0a <45> 85
d2 0f 84 33 ff ff ff 83 c8 04 4c 89 4f 20 88 07 4c 89 c8 c3
RSP: 002b:00007ffce2334e38 EFLAGS: 00000202
RAX: 0000000000000001 RBX: 00007f1d91572388 RCX: 0000000000000002
RDX: 00007f1d90e9c750 RSI: 0000000000000000 RDI: 00007f1d912e5d20
RBP: 00007ffce2334e40 R08: 00007f1d912e5d20 R09: 000000000000e119
R10: 0000000000000001 R11: 0000000000000002 R12: 00007f1d9157f008
R13: 0000000000000000 R14: 00005639d9e74f90 R15: 00007f1da06fe730
 </TASK>
INFO: NMI handler (perf_event_nmi_handler) took too long to run: 5.441 msec=
s

Environment:
GPU: AMD Radeon 6900XT
Display: LG TV via HDMI
Kernel: 6.15-rc7, built from source using provided config
Distro: Fedora Rawhide
Motherboard: ASRock B650I Lightning WiFi
BIOS: 3.08 (2024-09-18)

Additional diagnostic info:
Full kernel log ending with stack trace from delay_halt_mwaitx()
Series of dc_dmub_srv_drr_update_cmd() and
dc_stream_adjust_vmin_vmax() calls in call trace
System enters unrecoverable lock state after ~few minutes of heavy compilat=
ion

--=20
Best Regards,
Mike Gavrilov.
