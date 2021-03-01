Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A4B328725
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 18:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309466E853;
	Mon,  1 Mar 2021 17:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636D56E851;
 Mon,  1 Mar 2021 17:21:03 +0000 (UTC)
IronPort-SDR: f+LNeHWYJDsUqBVlXplUGhmUG7YxjFkUjFQpo7JFVv9clR9Akwq8afrtICf2M2KCFAJilWWb0R
 ZhKYs0AlIIaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="184097487"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="184097487"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 09:21:02 -0800
IronPort-SDR: CSFQEh/hHABydoWfjhWlG1LrToElQDvmj/w9NmimxqgE/eWBNnplByhbdhuL/YWcr/1eRs9HVp
 N1hyE5h1hUAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="444367905"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 01 Mar 2021 09:20:59 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 01 Mar 2021 19:20:59 +0200
Date: Mon, 1 Mar 2021 19:20:59 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [WARNING] v5.12-rc1 in intel_pipe_disable tracepoint
Message-ID: <YD0ie6qcKBgGgcNW@intel.com>
References: <20210301115946.295279c1@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301115946.295279c1@gandalf.local.home>
X-Patchwork-Hint: comment
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 11:59:46AM -0500, Steven Rostedt wrote:
> =

> On my test box with latest v5.12-rc1, running with all trace events
> enabled, I consistently trigger this warning.
> =

> It appears to get triggered by the trace_intel_pipe_disable() code.
> =

> -- Steve
> =

>  ------------[ cut here ]------------
>  i915 0000:00:02.0: drm_WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev))
>  WARNING: CPU: 7 PID: 1258 at drivers/gpu/drm/drm_vblank.c:728 drm_crtc_v=
blank_helper_get_vblank_timestamp_internal+0x319/0x330 [drm]
>  Modules linked in: ebtable_filter ebtables bridge stp llc vsock vmw_vmci=
 ipt_REJECT nf_reject_ipv4 iptable_filter ip6t_REJECT nf_reject_ipv6 xt_sta=
te xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip6table_filter =
ip6_tables snd_hda_codec_hdmi snd_h
> ek snd_hda_codec_generic ledtrig_audio snd_hda_intel snd_intel_dspcfg snd=
_hda_codec joydev snd_hwdep intel_rapl_msr snd_hda_core hp_wmi i915 iTCO_wd=
t snd_seq intel_rapl_common iTCO_vendor_support wmi_bmof sparse_keymap snd_=
seq_device rfkill snd_pcm x86_pkg_t
> d_timer i2c_algo_bit drm_kms_helper mei_me intel_powerclamp snd mei sound=
core i2c_i801 drm coretemp lpc_ich e1000e kvm_intel i2c_smbus kvm irqbypass=
 crct10dif_pclmul crc32_pclmul crc32c_intel serio_raw ghash_clmulni_intel v=
ideo tpm_infineon wmi ip_tables
>  CPU: 7 PID: 1258 Comm: Xorg Tainted: G        W         5.12.0-rc1-test+=
 #12
>  Hardware name: Hewlett-Packard HP Compaq Pro 6300 SFF/339A, BIOS K01 v03=
.03 07/14/2016
>  RIP: 0010:drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x319/0x3=
30 [drm]
>  Code: 4c 8b 6f 50 4d 85 ed 75 03 4c 8b 2f e8 60 92 45 c2 48 c7 c1 28 a5 =
3c c0 4c 89 ea 48 c7 c7 15 5a 3c c0 48 89 c6 e8 1f e7 7b c2 <0f> 0b e9 e2 f=
e ff ff e8 fb 6c 81 c2 66 66 2e 0f 1f 84 00 00 00 00
>  RSP: 0018:ffffb77580ea7920 EFLAGS: 00010082
>  RAX: 0000000000000000 RBX: ffff8afe500c0000 RCX: 0000000000000000
>  RDX: 0000000000000004 RSI: ffffffff833c86b8 RDI: 0000000000000001
>  RBP: ffffb77580ea7990 R08: 000000700c782173 R09: 0000000000000000
>  R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000000
>  R13: ffff8afe41c7eff0 R14: ffffffffc05e0410 R15: ffff8afe456a2bf8
>  FS:  00007f8f91869f00(0000) GS:ffff8afe5aa00000(0000) knlGS:000000000000=
0000
>  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  CR2: 00007f9523a6cad0 CR3: 0000000001b78002 CR4: 00000000001706e0
>  Call Trace:
>   drm_get_last_vbltimestamp+0xaa/0xc0 [drm]
>   drm_update_vblank_count+0x90/0x2d0 [drm]
>   drm_crtc_accurate_vblank_count+0x3e/0xc0 [drm]
>   intel_crtc_get_vblank_counter+0x43/0x50 [i915]
>   trace_event_raw_event_intel_pipe_disable+0x87/0x110 [i915]
>   intel_disable_pipe+0x1a8/0x210 [i915]

Hmm. Yeah we do vblank_off() before pipe_disable() which wants
to still grab the frame counter in the tracepoint. I think we
could reorder those two without causing any problems. Either
that or we put the tracepoint before vblank_off().

>   ilk_crtc_disable+0x85/0x390 [i915]

But this part is confusing me. intel_crtc_get_vblank_counter() is
only supposed to do drm_crtc_accurate_vblank_count() fallback when
the hardware lacks a working frame counter, and that should only
be the case for ancient gen2 or semi-ancient i965gm TV output,
ilk_crtc_disable() is not the function we should be calling in
either of those cases.

What hardware do you have?

>   intel_old_crtc_state_disables.isra.0+0x5c/0x110 [i915]
>   intel_atomic_commit_tail+0xf5d/0x1460 [i915]
>   ? complete+0x18/0x40
>   intel_atomic_commit+0x345/0x3c0 [i915]
>   drm_atomic_connector_commit_dpms+0xd7/0x100 [drm]
>   set_property_atomic+0xcc/0x160 [drm]
>   drm_mode_obj_set_property_ioctl+0xbd/0x100 [drm]
>   ? drm_connector_set_obj_prop+0x90/0x90 [drm]
>   drm_connector_property_set_ioctl+0x39/0x60 [drm]
>   drm_ioctl_kernel+0xad/0x100 [drm]
>   drm_ioctl+0x1ec/0x390 [drm]
>   ? drm_connector_set_obj_prop+0x90/0x90 [drm]
>   ? sched_clock_cpu+0x10/0xd0
>   ? lock_release+0x155/0x410
>   __x64_sys_ioctl+0x83/0xb0
>   do_syscall_64+0x33/0x40
>   entry_SYSCALL_64_after_hwframe+0x44/0xae
>  RIP: 0033:0x7f8f91ce535b
>  Code: 0f 1e fa 48 8b 05 2d 9b 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff =
ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 f=
f ff 73 01 c3 48 8b 0d fd 9a 0c 00 f7 d8 64 89 01 48
>  RSP: 002b:00007ffcb4603378 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>  RAX: ffffffffffffffda RBX: 00007ffcb46033b0 RCX: 00007f8f91ce535b
>  RDX: 00007ffcb46033b0 RSI: 00000000c01064ab RDI: 000000000000000e
>  RBP: 00000000c01064ab R08: 000055d68f44ba60 R09: 0000000000000000
>  R10: 000055d68f44ba60 R11: 0000000000000246 R12: 000055d68f5e0010
>  R13: 000000000000000e R14: 0000000000000000 R15: 000055d68e2275c0
>  ---[ end trace d18216ba28a2f0e8 ]---
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
