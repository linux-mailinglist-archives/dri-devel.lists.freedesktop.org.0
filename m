Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F51878474
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 17:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D5B10FE65;
	Mon, 11 Mar 2024 16:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRwk/PVQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8B710F575;
 Mon, 11 Mar 2024 16:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710172965; x=1741708965;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5frtH6KwV0MLG/CVZHd26mVKmC/oUcux+Jv2xGYGPGU=;
 b=hRwk/PVQMt2diC9pbtfUsI91RD3guNS8fLTM69b2xiJFKUg+nWgaZRWM
 aMBSMArokhb7BCRB8NUK5D+MLaBM20SEvtpCDsTKC7yJ6O6iZZvfNNsAg
 XCEoxarUSI9cFNeDKsgSjnA1nSjLDjrfujg5ZmqyJtQuOp4lGX0rUXOTa
 knN9n/gspPJ3NGDNCZh0cH2bGBZ0oEWjfcEBcl2FX24gTujAGAtSvFmwc
 G90QMxJSZ9brt4C6TtyGPctYXL0DJzmN2+yU9daz7qHWHMWpugQ0EjIvq
 BQJ8/PMHNPQrKmiIXlXZxR2J8PVnetdRCEnNlL4gYQqudnDIcVtnBf48y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15575914"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15575914"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:02:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="15854223"
Received: from tbeaumon-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.24])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:02:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Saarinen, Jani" <jani.saarinen@intel.com>, Linux regressions mailing
 list <regressions@lists.linux.dev>, "Deak, Imre" <imre.deak@intel.com>
Cc: Chris Bainbridge <chris.bainbridge@gmail.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, ML dri-devel <dri-devel@lists.freedesktop.org>
Subject: RE: [REGRESSION] Divide-by-zero on DisplayPort MST unplug with nouveau
In-Reply-To: <DM8PR11MB56555E5992E299F1EA4BEE98E0242@DM8PR11MB5655.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ZeoAPFIF6NClUl4P@debian.local>
 <ee2e74d2-1a7a-4e24-8502-80cf2ffad59d@leemhuis.info>
 <DM8PR11MB56555E5992E299F1EA4BEE98E0242@DM8PR11MB5655.namprd11.prod.outlook.com>
Date: Mon, 11 Mar 2024 18:02:38 +0200
Message-ID: <87v85ssqn5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 11 Mar 2024, "Saarinen, Jani" <jani.saarinen@intel.com> wrote:
> Hi, 
>
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Linux
>> regression tracking (Thorsten Leemhuis)
>> Sent: Monday, 11 March 2024 17.53
>> To: Deak, Imre <imre.deak@intel.com>
>> Cc: regressions@lists.linux.dev; Chris Bainbridge
>> <chris.bainbridge@gmail.com>; intel-gfx <intel-gfx@lists.freedesktop.org>;
>> David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; ML dri-devel
>> <dri-devel@lists.freedesktop.org>
>> Subject: Re: [REGRESSION] Divide-by-zero on DisplayPort MST unplug with
>> nouveau
>> 
>> On 07.03.24 18:58, Chris Bainbridge wrote:
>> > ----- Forwarded message from Chris Bainbridge
>> > <chris.bainbridge@gmail.com> -----
>> >
>> > Date: Sat, 10 Feb 2024 21:24:59 +0000
>> 
>> Hmm, it looks like nobody is looking into this regression. Is there a good
>> reason?
>> 
>> Imre, or did you maybe just miss that Chris' regression seems to be caused by
>> a commit of yours? He initally proposed a fix (the forwarded mail that is
>> quoted here) more a month ago already here:
>> https://lore.kernel.org/all/ZcfpqwnkSoiJxeT9@debian.local/
>> 
>> Chris recently filed a ticket, too:
>> https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/36
> Please file https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html 

Well, please don't. It's *not* an i915 bug.

BR,
Jani.

>> 
>> Mostly silence there as well. :-/
>> 
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>> 
>> P.S: Chris, sorry, I had missed that you initially proposed the fix a month ago; if
>> I had noticed this earlier I had sent a mail like this one earlier.
>> --
>> Everything you wanna know about Linux kernel regression tracking:
>> https://linux-regtracking.leemhuis.info/about/#tldr
>> If I did something stupid, please tell me, as explained on that page.
>> 
>> > From: Chris Bainbridge <chris.bainbridge@gmail.com>
>> > To: dri-devel@lists.freedesktop.org
>> > Cc: lyude@redhat.com, ville.syrjala@linux.intel.com,
>> stanislav.lisovskiy@intel.com,
>> > 	mripard@kernel.org, imre.deak@intel.com
>> > Subject: [PATCH] Fix divide-by-zero on DP unplug with nouveau
>> >
>> > The following trace occurs when using nouveau and unplugging a DP MST
>> > adaptor:
>> >>  divide error: 0000 [#1] PREEMPT SMP PTI
>> >  CPU: 7 PID: 2962 Comm: Xorg Not tainted 6.8.0-rc3+ #744  Hardware
>> > name: Razer Blade/DANA_MB, BIOS 01.01 08/31/2018
>> >  RIP: 0010:drm_dp_bw_overhead+0xb4/0x110 [drm_display_helper]
>> >  Code: c6 b8 01 00 00 00 75 61 01 c6 41 0f af f3 41 0f af f1 c1 e1 04
>> > 48 63 c7 31 d2 89 ff 48 8b 5d f8 c9 48 0f af f1 48 8d 44 06 ff <48> f7
>> > f7 31 d2 31 c9 31 f6 31 ff 45 31 c0 45 31 c9 45 31 d2 45 31
>> >  RSP: 0018:ffffb2c5c211fa30 EFLAGS: 00010206
>> >  RAX: ffffffffffffffff RBX: 0000000000000000 RCX: 0000000000f59b00
>> >  RDX: 0000000000000000 RSI: 0000000000000000 RDI:
>> 0000000000000000
>> >  RBP: ffffb2c5c211fa48 R08: 0000000000000001 R09:
>> 0000000000000020
>> >  R10: 0000000000000004 R11: 0000000000000000 R12:
>> 0000000000023b4a
>> >  R13: ffff91d37d165800 R14: ffff91d36fac6d80 R15: ffff91d34a764010
>> >  FS:  00007f4a1ca3fa80(0000) GS:ffff91d6edbc0000(0000)
>> > knlGS:0000000000000000
>> >  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> >  CR2: 0000559491d49000 CR3: 000000011d180002 CR4:
>> 00000000003706f0
>> > Call Trace:
>> >   <TASK>
>> >   ? show_regs+0x6d/0x80
>> >   ? die+0x37/0xa0
>> >   ? do_trap+0xd4/0xf0
>> >   ? do_error_trap+0x71/0xb0
>> >   ? drm_dp_bw_overhead+0xb4/0x110 [drm_display_helper]
>> >   ? exc_divide_error+0x3a/0x70
>> >   ? drm_dp_bw_overhead+0xb4/0x110 [drm_display_helper]
>> >   ? asm_exc_divide_error+0x1b/0x20
>> >   ? drm_dp_bw_overhead+0xb4/0x110 [drm_display_helper]
>> >   ? drm_dp_calc_pbn_mode+0x2e/0x70 [drm_display_helper]
>> >   nv50_msto_atomic_check+0xda/0x120 [nouveau]
>> >   drm_atomic_helper_check_modeset+0xa87/0xdf0 [drm_kms_helper]
>> >   drm_atomic_helper_check+0x19/0xa0 [drm_kms_helper]
>> >   nv50_disp_atomic_check+0x13f/0x2f0 [nouveau]
>> >   drm_atomic_check_only+0x668/0xb20 [drm]
>> >   ? drm_connector_list_iter_next+0x86/0xc0 [drm]
>> >   drm_atomic_commit+0x58/0xd0 [drm]
>> >   ? __pfx___drm_printfn_info+0x10/0x10 [drm]
>> >   drm_atomic_connector_commit_dpms+0xd7/0x100 [drm]
>> >   drm_mode_obj_set_property_ioctl+0x1c5/0x450 [drm]
>> >   ? __pfx_drm_connector_property_set_ioctl+0x10/0x10 [drm]
>> >   drm_connector_property_set_ioctl+0x3b/0x60 [drm]
>> >   drm_ioctl_kernel+0xb9/0x120 [drm]
>> >   drm_ioctl+0x2d0/0x550 [drm]
>> >   ? __pfx_drm_connector_property_set_ioctl+0x10/0x10 [drm]
>> >   nouveau_drm_ioctl+0x61/0xc0 [nouveau]
>> >   __x64_sys_ioctl+0xa0/0xf0
>> >   do_syscall_64+0x76/0x140
>> >   ? do_syscall_64+0x85/0x140
>> >   ? do_syscall_64+0x85/0x140
>> >   entry_SYSCALL_64_after_hwframe+0x6e/0x76
>> >  RIP: 0033:0x7f4a1cd1a94f
>> >  Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48
>> > 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89
>> > c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
>> >  RSP: 002b:00007ffd2f1df520 EFLAGS: 00000246 ORIG_RAX:
>> > 0000000000000010
>> >  RAX: ffffffffffffffda RBX: 00007ffd2f1df5b0 RCX: 00007f4a1cd1a94f
>> >  RDX: 00007ffd2f1df5b0 RSI: 00000000c01064ab RDI: 000000000000000f
>> >  RBP: 00000000c01064ab R08: 000056347932deb8 R09:
>> 000056347a7d99c0
>> >  R10: 0000000000000000 R11: 0000000000000246 R12:
>> 000056347938a220
>> >  R13: 000000000000000f R14: 0000563479d9f3f0 R15:
>> 0000000000000000
>> >   </TASK>
>> >  Modules linked in: rfcomm xt_conntrack nft_chain_nat xt_MASQUERADE
>> nf_nat nf_conntrack_netlink nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
>> xfrm_user xfrm_algo xt_addrtype nft_compat nf_tables nfnetlink br_netfilter
>> bridge stp llc ccm cmac algif_hash overlay algif_skcipher af_alg bnep
>> binfmt_misc snd_sof_pci_intel_cnl snd_sof_intel_hda_common
>> snd_soc_hdac_hda snd_sof_pci snd_sof_xtensa_dsp snd_sof_intel_hda
>> snd_sof snd_sof_utils snd_soc_acpi_intel_match snd_soc_acpi snd_soc_core
>> snd_compress snd_sof_intel_hda_mlink snd_hda_ext_core iwlmvm
>> intel_rapl_msr intel_rapl_common intel_tcc_cooling x86_pkg_temp_thermal
>> intel_powerclamp mac80211 coretemp kvm_intel snd_hda_codec_hdmi kvm
>> snd_hda_codec_realtek snd_hda_codec_generic uvcvideo libarc4
>> snd_hda_intel snd_intel_dspcfg snd_hda_codec iwlwifi videobuf2_vmalloc
>> videobuf2_memops uvc irqbypass btusb videobuf2_v4l2 snd_seq_midi
>> crct10dif_pclmul hid_multitouch crc32_pclmul snd_seq_midi_event btrtl
>> snd_hwdep videodev polyval_clmulni polyval_generic snd_rawmidi
>> >   ghash_clmulni_intel aesni_intel btintel crypto_simd snd_hda_core
>> > cryptd snd_seq btbcm ee1004 8250_dw videobuf2_common btmtk rapl
>> > nls_iso8859_1 mei_hdcp thunderbolt bluetooth intel_cstate wmi_bmof
>> > intel_wmi_thunderbolt cfg80211 snd_pcm mc snd_seq_device i2c_i801
>> > r8169 ecdh_generic snd_timer i2c_smbus ecc snd mei_me intel_lpss_pci
>> > mei ahci intel_lpss soundcore realtek libahci idma64 intel_pch_thermal
>> > i2c_hid_acpi i2c_hid acpi_pad sch_fq_codel msr parport_pc ppdev lp
>> > parport efi_pstore ip_tables x_tables autofs4 dm_crypt raid10 raid456
>> > libcrc32c async_raid6_recov async_memcpy async_pq async_xor xor
>> > async_tx raid6_pq raid1 raid0 joydev input_leds hid_generic usbhid hid
>> > nouveau i915 drm_ttm_helper gpu_sched drm_gpuvm drm_exec
>> i2c_algo_bit
>> > drm_buddy ttm drm_display_helper drm_kms_helper cec rc_core drm nvme
>> > nvme_core mxm_wmi xhci_pci xhci_pci_renesas video wmi
>> > pinctrl_cannonlake mac_hid  ---[ end trace 0000000000000000 ]---
>> >
>> > Fix this by avoiding the divide if bpp is 0.
>> >
>> > Fixes: c1d6a22b7219 ("drm/dp: Add helpers to calculate the link BW
>> > overhead")
>> > Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
>> > ---
>> >  drivers/gpu/drm/display/drm_dp_helper.c | 3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c
>> > b/drivers/gpu/drm/display/drm_dp_helper.c
>> > index b1ca3a1100da..bb8794c8f99c 100644
>> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
>> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
>> > @@ -4024,6 +4024,9 @@ int drm_dp_bw_overhead(int lane_count, int
>> hactive,
>> >  							  bpp_x16,
>> symbol_size,
>> >  							  is_mst);
>> >
>> > +	/* Avoid potential divide by zero in DIV_ROUND_UP_ULL */
>> > +	if (bpp_x16 == 0)
>> > +		return 0;
>> >  	return DIV_ROUND_UP_ULL(mul_u32_u32(symbol_cycles *
>> symbol_size * lane_count,
>> >  					    overhead * 16),
>> >  				hactive * bpp_x16);
>> 
>> P. P.S.:
>> 
>> #regzbot duplicate:
>> https://lore.kernel.org/all/ZcfpqwnkSoiJxeT9@debian.local/
>> #regzbot poke

-- 
Jani Nikula, Intel
