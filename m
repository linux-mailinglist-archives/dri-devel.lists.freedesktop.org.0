Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A49E32D817
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 17:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECEC6EA22;
	Thu,  4 Mar 2021 16:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A4C6EA22;
 Thu,  4 Mar 2021 16:53:42 +0000 (UTC)
IronPort-SDR: vhkCr4MupO38Q0kKh5I7UyxDc9otib5bFhCwycwtt8xQ0In6oZfmARlNQqxJ45JZzyZ7cp7rVR
 LA5Dk3x5Yuyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="272458890"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; d="scan'208";a="272458890"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 08:53:41 -0800
IronPort-SDR: s5Z30VFK8gVq0YQkVUQ23+yR46psCJF5tzIAwYnqhkLBFxXV9GCNtNfKpRnDgkjmPdcyklVPWT
 chPGT95/3bwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; d="scan'208";a="445795887"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 04 Mar 2021 08:53:38 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Mar 2021 18:53:37 +0200
Date: Thu, 4 Mar 2021 18:53:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [Intel-gfx] [WARNING] v5.12-rc1 in intel_pipe_disable tracepoint
Message-ID: <YEEQkT0DZWyZgvAL@intel.com>
References: <20210301115946.295279c1@gandalf.local.home>
 <YD0ie6qcKBgGgcNW@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YD0ie6qcKBgGgcNW@intel.com>
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 07:20:59PM +0200, Ville Syrj=E4l=E4 wrote:
> On Mon, Mar 01, 2021 at 11:59:46AM -0500, Steven Rostedt wrote:
> > =

> > On my test box with latest v5.12-rc1, running with all trace events
> > enabled, I consistently trigger this warning.
> > =

> > It appears to get triggered by the trace_intel_pipe_disable() code.
> > =

> > -- Steve
> > =

> >  ------------[ cut here ]------------
> >  i915 0000:00:02.0: drm_WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev))
> >  WARNING: CPU: 7 PID: 1258 at drivers/gpu/drm/drm_vblank.c:728 drm_crtc=
_vblank_helper_get_vblank_timestamp_internal+0x319/0x330 [drm]
> >  Modules linked in: ebtable_filter ebtables bridge stp llc vsock vmw_vm=
ci ipt_REJECT nf_reject_ipv4 iptable_filter ip6t_REJECT nf_reject_ipv6 xt_s=
tate xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip6table_filte=
r ip6_tables snd_hda_codec_hdmi snd_h
> > ek snd_hda_codec_generic ledtrig_audio snd_hda_intel snd_intel_dspcfg s=
nd_hda_codec joydev snd_hwdep intel_rapl_msr snd_hda_core hp_wmi i915 iTCO_=
wdt snd_seq intel_rapl_common iTCO_vendor_support wmi_bmof sparse_keymap sn=
d_seq_device rfkill snd_pcm x86_pkg_t
> > d_timer i2c_algo_bit drm_kms_helper mei_me intel_powerclamp snd mei sou=
ndcore i2c_i801 drm coretemp lpc_ich e1000e kvm_intel i2c_smbus kvm irqbypa=
ss crct10dif_pclmul crc32_pclmul crc32c_intel serio_raw ghash_clmulni_intel=
 video tpm_infineon wmi ip_tables
> >  CPU: 7 PID: 1258 Comm: Xorg Tainted: G        W         5.12.0-rc1-tes=
t+ #12
> >  Hardware name: Hewlett-Packard HP Compaq Pro 6300 SFF/339A, BIOS K01 v=
03.03 07/14/2016
> >  RIP: 0010:drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x319/0=
x330 [drm]
> >  Code: 4c 8b 6f 50 4d 85 ed 75 03 4c 8b 2f e8 60 92 45 c2 48 c7 c1 28 a=
5 3c c0 4c 89 ea 48 c7 c7 15 5a 3c c0 48 89 c6 e8 1f e7 7b c2 <0f> 0b e9 e2=
 fe ff ff e8 fb 6c 81 c2 66 66 2e 0f 1f 84 00 00 00 00
> >  RSP: 0018:ffffb77580ea7920 EFLAGS: 00010082
> >  RAX: 0000000000000000 RBX: ffff8afe500c0000 RCX: 0000000000000000
> >  RDX: 0000000000000004 RSI: ffffffff833c86b8 RDI: 0000000000000001
> >  RBP: ffffb77580ea7990 R08: 000000700c782173 R09: 0000000000000000
> >  R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000000
> >  R13: ffff8afe41c7eff0 R14: ffffffffc05e0410 R15: ffff8afe456a2bf8
> >  FS:  00007f8f91869f00(0000) GS:ffff8afe5aa00000(0000) knlGS:0000000000=
000000
> >  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >  CR2: 00007f9523a6cad0 CR3: 0000000001b78002 CR4: 00000000001706e0
> >  Call Trace:
> >   drm_get_last_vbltimestamp+0xaa/0xc0 [drm]
> >   drm_update_vblank_count+0x90/0x2d0 [drm]
> >   drm_crtc_accurate_vblank_count+0x3e/0xc0 [drm]
> >   intel_crtc_get_vblank_counter+0x43/0x50 [i915]
> >   trace_event_raw_event_intel_pipe_disable+0x87/0x110 [i915]
> >   intel_disable_pipe+0x1a8/0x210 [i915]
> =

> Hmm. Yeah we do vblank_off() before pipe_disable() which wants
> to still grab the frame counter in the tracepoint. I think we
> could reorder those two without causing any problems. Either
> that or we put the tracepoint before vblank_off().
> =

> >   ilk_crtc_disable+0x85/0x390 [i915]
> =

> But this part is confusing me. intel_crtc_get_vblank_counter() is
> only supposed to do drm_crtc_accurate_vblank_count() fallback when
> the hardware lacks a working frame counter, and that should only
> be the case for ancient gen2 or semi-ancient i965gm TV output,
> ilk_crtc_disable() is not the function we should be calling in
> either of those cases.

OK, figured this out. It can happen on any platform due to
never initializing .max_vblank_count for pipes that were
disabled at boot. Also spotted some other issues in this
code that needs fixing. I'll mail out some patches...

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
