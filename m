Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BA25B4324
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 01:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB4C10E1BA;
	Fri,  9 Sep 2022 23:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A28A10E184;
 Fri,  9 Sep 2022 23:43:23 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id f76so1500637vkf.7;
 Fri, 09 Sep 2022 16:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=yM/kvhJdsI8NBo5uNMFm8JlRP3HNMGQbZs8fTKlnEQM=;
 b=TS4swxQjHiLEbHAj3vKqdkMS1ch47fEWIsqb2o3dZdeDVdjCQyiQsRifCw0sWVOuXo
 x40vLFFVCjzDimP/9hUK/X98obdnxxdbKibUweQAeRGndm91NxkxvdcMBAgwchLbw8D8
 svly7WfSSESy4mWTg8k65fzYcIaQij+HSNhVFrkZ0R2CiRA9Ak3aOI1WSza2CdXKht9U
 x4MupFXFIQ7cs5jRSTDBf9Yjc5VTT/uZhHupLi2Xchv3e0D0ZPSWzJrgvMD0IMuYsiWf
 NnocaNi6QRN08Bu1qGQuRHzqamNKxC3n+xsOY2Al30rx60Nho4l65S300AWLZtNvXOK/
 hKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=yM/kvhJdsI8NBo5uNMFm8JlRP3HNMGQbZs8fTKlnEQM=;
 b=G2+9tURno8YLintjfCa5c1c1+bjk/8CtYbXz16lBgYVsUhnwXpf4fHZ0ZE8VOxqYtJ
 yQdJ1t0KyJNXJJblWNnshRGS6PmuUhFeYJGrCgSEuF3MZo4VxBLO/rGLFJE/1o5+0yYw
 dnUNNqTnXwXlYs9pTvSqoxc03zived4xOQvqIo/xRInoDgPveotL+3rP2HT+vRxFNti+
 yKTukovirGpmmfLBtZ2YIxmAsstzHGklgUXLIdyEv4MxBQyJxwDvvM9yYhMK2Dy8W7Uh
 B8vVaAdhxuF3h6r0jmpiElvbCRtBc3XTQplFJ03qcl6c4IHu/t2Yw7B8tXFX1oaBSwJR
 K3aw==
X-Gm-Message-State: ACgBeo1iOzBYEuA+putIZ1rIprpdmFMcdmw3S34Q2MIuZy3xHBqIzlYj
 xqBBOmZcjs27NpUD12CE9HXP1T53oArW3AO69IlZffnuH53Fvw==
X-Google-Smtp-Source: AA6agR7LGX14G3rAUr9BzeWCa0Er0i9E3ZBlG/vg0BrB9buV8rSqHWfvPInCBO6KJneE9thG9epmo6YcJmkLknluQBY=
X-Received: by 2002:a1f:2ad4:0:b0:38c:5a9c:2d98 with SMTP id
 q203-20020a1f2ad4000000b0038c5a9c2d98mr5862449vkq.24.1662767002164; Fri, 09
 Sep 2022 16:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220904214134.408619-1-jim.cromie@gmail.com>
 <20220904214134.408619-29-jim.cromie@gmail.com>
 <Yxg86v7UsB8jtyYi@phenom.ffwll.local>
In-Reply-To: <Yxg86v7UsB8jtyYi@phenom.ffwll.local>
From: jim.cromie@gmail.com
Date: Fri, 9 Sep 2022 17:42:55 -0600
Message-ID: <CAJfuBxx_MnNbC=HDypKvG-aLxRu_k_jcPCwWqAwC+ghqjb9NmQ@mail.gmail.com>
Subject: Re: [PATCH v6 28/57] drm_print: refine drm_debug_enabled for
 jump-label
To: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>, 
 Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Sean Paul <seanpaul@chromium.org>, robdclark@gmail.com, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Joe Perches <joe@perches.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 7, 2022 at 12:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sun, Sep 04, 2022 at 03:41:05PM -0600, Jim Cromie wrote:
> > In order to use dynamic-debug's jump-label optimization in drm-debug,
> > its clarifying to refine drm_debug_enabled into 3 uses:
> >
> > 1.   drm_debug_enabled - legacy, public
> > 2. __drm_debug_enabled - optimized for dyndbg jump-label enablement.
> > 3.  _drm_debug_enabled - pr_debug instrumented, observable
> >
> > 1. The legacy version always checks the bits.
> >
> > 2. is privileged, for use by __drm_dbg(), __drm_dev_dbg(), which do an
> > early return unless the category is enabled.  For dyndbg builds, debug
> > callsites are selectively "pre-enabled", so __drm_debug_enabled()
> > short-circuits to true there.  Remaining callers of 1 may be able to
> > use 2, case by case.
> >
> > 3. is 1st wrapped in a macro, with a pr_debug, which reports each
> > usage in /proc/dynamic_debug/control, making it observable in the
> > logs.  The macro lets the pr_debug see the real caller, not an inline
> > function.
> >
> > When plugged into 1, 3 identified ~10 remaining callers of the
> > function, leading to the follow-on cleanup patch, and would allow
> > activating the pr_debugs, estimating the callrate, and the potential
> > savings by using the wrapper macro.  It is unused ATM, but it fills
> > out the picture.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>
> So instead of having 3 here as a "you need to hack it in to see what
> should be converted" I have a bit a different idea: Could we make the
> public version also a dyndbg callsite (like the printing wrappers), but
> instead of a dynamic call we'd have a dynamically fixed value we get out?
> I think that would take care of everything you have here as an open.
>
> Otherwise I'd just drop 3 for the series we're going to merge.
> -Daniel
>

OK - So here it is in use again,  with  modules drm amdgpu i915 loaded + deps

:#> grep todo /proc/dynamic_debug/control
drivers/gpu/drm/drm_edid_load.c:178 [drm]edid_load =_ "todo: maybe
avoid via dyndbg\n"
drivers/gpu/drm/drm_vblank.c:410 [drm]drm_crtc_accurate_vblank_count
=_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/drm_vblank.c:787
[drm]drm_crtc_vblank_helper_get_vblank_timestamp_internal =_ "todo:
maybe avoid via dyndbg\n"
drivers/gpu/drm/drm_vblank.c:1491 [drm]drm_vblank_restore =_ "todo:
maybe avoid via dyndbg\n"
drivers/gpu/drm/drm_vblank.c:1433 [drm]drm_vblank_enable =_ "todo:
maybe avoid via dyndbg\n"
drivers/gpu/drm/drm_plane.c:2168 [drm]drm_mode_setplane =_ "todo:
maybe avoid via dyndbg\n"
drivers/gpu/drm/display/drm_dp_mst_topology.c:1359
[drm_display_helper]drm_dp_mst_wait_tx_reply =_ "todo: maybe avoid via
dyndbg\n"
drivers/gpu/drm/display/drm_dp_mst_topology.c:2864
[drm_display_helper]process_single_tx_qlock =_ "todo: maybe avoid via
dyndbg\n"
drivers/gpu/drm/display/drm_dp_mst_topology.c:2909
[drm_display_helper]drm_dp_queue_down_tx =_ "todo: maybe avoid via
dyndbg\n"
drivers/gpu/drm/display/drm_dp_mst_topology.c:1686
[drm_display_helper]drm_dp_mst_update_slots =_ "todo: maybe avoid via
dyndbg\n"
drivers/gpu/drm/i915/display/intel_dp.c:1111
[i915]intel_dp_print_rates =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/i915/display/intel_backlight.c:5434
[i915]cnp_enable_backlight =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/i915/display/intel_backlight.c:5459
[i915]intel_backlight_device_register =_ "todo: maybe avoid via
dyndbg\n"
drivers/gpu/drm/i915/display/intel_opregion.c:43
[i915]intel_opregion_notify_encoder =_ "todo: maybe avoid via
dyndbg\n"
drivers/gpu/drm/i915/display/intel_opregion.c:53
[i915]asle_set_backlight =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/i915/display/intel_bios.c:1088
[i915]intel_bios_is_dsi_present =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/i915/display/intel_display_debugfs.c:6153
[i915]i915_drrs_ctl_set =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/i915/intel_pcode.c:26 [i915]snb_pcode_read =_ "todo:
maybe avoid via dyndbg\n"
drivers/gpu/drm/i915/i915_getparam.c:785 [i915]i915_getparam_ioctl =_
"todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c:282
[amdgpu]vcn_v2_5_process_interrupt =_ "todo: maybe avoid via dyndbg\n"
drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c:433
[amdgpu]vcn_v2_0_process_interrupt =_ "todo: maybe avoid via dyndbg\n"

w/o actually looking, the vblank debug could be called frequently.
I'll build on my amdgpu box to run on real hardware.

And Im inclined to restore the instrumented version (with the "todo:")
care to suggest a better message than "maybe avoid" ?
