Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437FD87DA0E
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 13:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F6910EA56;
	Sat, 16 Mar 2024 12:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fa84jbcg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E776910EA56;
 Sat, 16 Mar 2024 12:06:08 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a46ad9ef033so3726266b.2; 
 Sat, 16 Mar 2024 05:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710590767; x=1711195567; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=97HmF8lidrpgg/isaO6eDlrakSLROqwF/ipoeCHfbX8=;
 b=Fa84jbcggPCvZ7fQXzxa/w+YGjDR0qNiwh30XFvmY54QDaO4XzXXlVKT5/2ueyI8zv
 iDKT9UUZGNjMNdxQNIw4rZ4FjU+fSTVh1sHG5vxlEvtWEylYZObJHmCheh++NyWhiKt0
 FoceFb5mTSnrVVwrhelTnZdc9tIJ0kIRrYqcULuZBzdKJTMhHgC3325I3Sbv4Y0UYa7I
 LiuMFWrQTZXg0QmGrGWvZrgzkCVeLfmCyK8xo8eudQZk4CSh/vzUTjEDLU/MMSP2tvzC
 7Fi4e2l1Ijdhtab6AB4EFfpouviYXRqzfb+ez1lBrByh9/w++NX6iS7bwOOwjEHZgBjT
 S5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710590767; x=1711195567;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=97HmF8lidrpgg/isaO6eDlrakSLROqwF/ipoeCHfbX8=;
 b=w5P7KoNr9RAWMj3Xug1QsLdqMhA5WYIGoiX7Lt47fjrGpD5uc7NlC0PE4mvfRX22RY
 A+VThOGBoSkUoSbHTKb4/Nam7JKI+twz/v43/Z5rRPAHkLKO3b1kef4PUAdOtiuxjoRy
 U5lpEUy1lwqxhjDIU8tNlwa4rro8kNoMVn75gkz4A7F6VjRW3OXWvXvY5JjBPokF6AFp
 Yj1El3zUfXEVkpTYnI/B2D946dQEdoagVN1AwJ7ylUDgXEc1ajIu8C2H5IOGZpu2gzc1
 rollDSLu3mGkCWgJG32JOxSQtO1Iz3px/zaJw/LEWJGmZWwoxjuQTffFknbcoJkTweX9
 JMRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi4+zm83wLJtGdHdB4DdP9ShvDdTUgl+uuqNzXcWg2tOZGMunTOukPUwY/7pknnRUgbs719sXMEixMNnwuac4bOEVMJpv2WK5K4W2NSvO9Jn96yHxwrzCDKFxFVego5IvPqE/6WOEAPjf39/Lclb9B
X-Gm-Message-State: AOJu0Yx3CjZmEA/DsoQYdXWyTBlZfJnzmqgHQMy8odp77HGglglJLqHM
 o/tkXZUthCmTfAajCqUwlGpVg6NdGksY0Czr7TzcUk1LaBNfEJzA
X-Google-Smtp-Source: AGHT+IFN8m0rIgEiRPaNegKZS2mhjUsEyr40S0JazMdm7ZI+LnKFOEhgxQWQZXPbjb862wEusaJ4bA==
X-Received: by 2002:a17:906:c147:b0:a46:a432:8f10 with SMTP id
 dp7-20020a170906c14700b00a46a4328f10mr1017991ejc.4.1710590766736; 
 Sat, 16 Mar 2024 05:06:06 -0700 (PDT)
Received: from debian.local (80-44-66-160.dynamic.dsl.as9105.com.
 [80.44.66.160]) by smtp.gmail.com with ESMTPSA id
 dk4-20020a170907940400b00a46ab207f68sm314576ejc.134.2024.03.16.05.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Mar 2024 05:06:06 -0700 (PDT)
Date: Sat, 16 Mar 2024 12:05:59 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Imre Deak <imre.deak@intel.com>
Cc: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 lyude@redhat.com, ville.syrjala@linux.intel.com,
 stanislav.lisovskiy@intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com
Subject: [PATCH v4] Fix divide-by-zero regression on DP MST unplug with nouveau
Message-ID: <ZfWLJwYikw2K7B6c@debian.local>
References: <ZcfpqwnkSoiJxeT9@debian.local>
 <Ze8suV5ox+43/wAC@ideak-desk.fi.intel.com>
 <Ze8vVffBaWY9f/Mu@ideak-desk.fi.intel.com>
 <Ze-Pf1_E-p4G8o0l@debian.local>
 <ZfBX0rrIpWMZbmRp@ideak-desk.fi.intel.com>
 <ZfIjZt_pn0dE9xyh@debian.local>
 <ZfLbNkKev+aYDEr/@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZfLbNkKev+aYDEr/@ideak-desk.fi.intel.com>
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

Fix a regression when using nouveau and unplugging a StarTech MSTDP122DP
DisplayPort 1.2 MST hub (the same regression does not appear when using
a Cable Matters DisplayPort 1.4 MST hub). Trace:

 divide error: 0000 [#1] PREEMPT SMP PTI
 CPU: 7 PID: 2962 Comm: Xorg Not tainted 6.8.0-rc3+ #744
 Hardware name: Razer Blade/DANA_MB, BIOS 01.01 08/31/2018
 RIP: 0010:drm_dp_bw_overhead+0xb4/0x110 [drm_display_helper]
 Code: c6 b8 01 00 00 00 75 61 01 c6 41 0f af f3 41 0f af f1 c1 e1 04 48 63=
 c7 31 d2 89 ff 48 8b 5d f8 c9 48 0f af f1 48 8d 44 06 ff <48> f7 f7 31 d2 =
31 c9 31 f6 31 ff 45 31 c0 45 31 c9 45 31 d2 45 31
 RSP: 0018:ffffb2c5c211fa30 EFLAGS: 00010206
 RAX: ffffffffffffffff RBX: 0000000000000000 RCX: 0000000000f59b00
 RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
 RBP: ffffb2c5c211fa48 R08: 0000000000000001 R09: 0000000000000020
 R10: 0000000000000004 R11: 0000000000000000 R12: 0000000000023b4a
 R13: ffff91d37d165800 R14: ffff91d36fac6d80 R15: ffff91d34a764010
 FS:  00007f4a1ca3fa80(0000) GS:ffff91d6edbc0000(0000) knlGS:00000000000000=
00
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 0000559491d49000 CR3: 000000011d180002 CR4: 00000000003706f0
 Call Trace:
  <TASK>
  ? show_regs+0x6d/0x80
  ? die+0x37/0xa0
  ? do_trap+0xd4/0xf0
  ? do_error_trap+0x71/0xb0
  ? drm_dp_bw_overhead+0xb4/0x110 [drm_display_helper]
  ? exc_divide_error+0x3a/0x70
  ? drm_dp_bw_overhead+0xb4/0x110 [drm_display_helper]
  ? asm_exc_divide_error+0x1b/0x20
  ? drm_dp_bw_overhead+0xb4/0x110 [drm_display_helper]
  ? drm_dp_calc_pbn_mode+0x2e/0x70 [drm_display_helper]
  nv50_msto_atomic_check+0xda/0x120 [nouveau]
  drm_atomic_helper_check_modeset+0xa87/0xdf0 [drm_kms_helper]
  drm_atomic_helper_check+0x19/0xa0 [drm_kms_helper]
  nv50_disp_atomic_check+0x13f/0x2f0 [nouveau]
  drm_atomic_check_only+0x668/0xb20 [drm]
  ? drm_connector_list_iter_next+0x86/0xc0 [drm]
  drm_atomic_commit+0x58/0xd0 [drm]
  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
  drm_atomic_connector_commit_dpms+0xd7/0x100 [drm]
  drm_mode_obj_set_property_ioctl+0x1c5/0x450 [drm]
  ? __pfx_drm_connector_property_set_ioctl+0x10/0x10 [drm]
  drm_connector_property_set_ioctl+0x3b/0x60 [drm]
  drm_ioctl_kernel+0xb9/0x120 [drm]
  drm_ioctl+0x2d0/0x550 [drm]
  ? __pfx_drm_connector_property_set_ioctl+0x10/0x10 [drm]
  nouveau_drm_ioctl+0x61/0xc0 [nouveau]
  __x64_sys_ioctl+0xa0/0xf0
  do_syscall_64+0x76/0x140
  ? do_syscall_64+0x85/0x140
  ? do_syscall_64+0x85/0x140
  entry_SYSCALL_64_after_hwframe+0x6e/0x76
 RIP: 0033:0x7f4a1cd1a94f
 Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44=
 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 =
f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
 RSP: 002b:00007ffd2f1df520 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
 RAX: ffffffffffffffda RBX: 00007ffd2f1df5b0 RCX: 00007f4a1cd1a94f
 RDX: 00007ffd2f1df5b0 RSI: 00000000c01064ab RDI: 000000000000000f
 RBP: 00000000c01064ab R08: 000056347932deb8 R09: 000056347a7d99c0
 R10: 0000000000000000 R11: 0000000000000246 R12: 000056347938a220
 R13: 000000000000000f R14: 0000563479d9f3f0 R15: 0000000000000000
  </TASK>
 Modules linked in: rfcomm xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat =
nf_conntrack_netlink nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 xfrm_user x=
frm_algo xt_addrtype nft_compat nf_tables nfnetlink br_netfilter bridge stp=
 llc ccm cmac algif_hash overlay algif_skcipher af_alg bnep binfmt_misc snd=
_sof_pci_intel_cnl snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_pci sn=
d_sof_xtensa_dsp snd_sof_intel_hda snd_sof snd_sof_utils snd_soc_acpi_intel=
_match snd_soc_acpi snd_soc_core snd_compress snd_sof_intel_hda_mlink snd_h=
da_ext_core iwlmvm intel_rapl_msr intel_rapl_common intel_tcc_cooling x86_p=
kg_temp_thermal intel_powerclamp mac80211 coretemp kvm_intel snd_hda_codec_=
hdmi kvm snd_hda_codec_realtek snd_hda_codec_generic uvcvideo libarc4 snd_h=
da_intel snd_intel_dspcfg snd_hda_codec iwlwifi videobuf2_vmalloc videobuf2=
_memops uvc irqbypass btusb videobuf2_v4l2 snd_seq_midi crct10dif_pclmul hi=
d_multitouch crc32_pclmul snd_seq_midi_event btrtl snd_hwdep videodev polyv=
al_clmulni polyval_generic snd_rawmidi
  ghash_clmulni_intel aesni_intel btintel crypto_simd snd_hda_core cryptd s=
nd_seq btbcm ee1004 8250_dw videobuf2_common btmtk rapl nls_iso8859_1 mei_h=
dcp thunderbolt bluetooth intel_cstate wmi_bmof intel_wmi_thunderbolt cfg80=
211 snd_pcm mc snd_seq_device i2c_i801 r8169 ecdh_generic snd_timer i2c_smb=
us ecc snd mei_me intel_lpss_pci mei ahci intel_lpss soundcore realtek liba=
hci idma64 intel_pch_thermal i2c_hid_acpi i2c_hid acpi_pad sch_fq_codel msr=
 parport_pc ppdev lp parport efi_pstore ip_tables x_tables autofs4 dm_crypt=
 raid10 raid456 libcrc32c async_raid6_recov async_memcpy async_pq async_xor=
 xor async_tx raid6_pq raid1 raid0 joydev input_leds hid_generic usbhid hid=
 nouveau i915 drm_ttm_helper gpu_sched drm_gpuvm drm_exec i2c_algo_bit drm_=
buddy ttm drm_display_helper drm_kms_helper cec rc_core drm nvme nvme_core =
mxm_wmi xhci_pci xhci_pci_renesas video wmi pinctrl_cannonlake mac_hid
 ---[ end trace 0000000000000000 ]---

Fix this by avoiding the divide if bpp is 0.

Fixes: c1d6a22b7219 ("drm/dp: Add helpers to calculate the link BW overhead=
")
Cc: stable@vger.kernel.org
Acked-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/disp=
lay/drm_dp_helper.c
index b1ca3a1100da..26c188ce5f1c 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3982,6 +3982,13 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
 	u32 overhead =3D 1000000;
 	int symbol_cycles;
=20
+	if (lane_count =3D=3D 0 || hactive =3D=3D 0 || bpp_x16 =3D=3D 0) {
+		DRM_DEBUG_KMS("Invalid BW overhead params: lane_count %d, hactive %d, bp=
p_x16 %d.%04d\n",
+			      lane_count, hactive,
+			      bpp_x16 >> 4, (bpp_x16 & 0xf) * 625);
+		return 0;
+	}
+
 	/*
 	 * DP Standard v2.1 2.6.4.1
 	 * SSC downspread and ref clock variation margin:
--=20
2.39.2

