Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1312C3B93
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 10:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6226E853;
	Wed, 25 Nov 2020 09:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979FD6E853
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 09:07:29 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id v202so2049368oia.9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 01:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mQNgYP+rVNkPkQi7Z2wu5AM4qHCsoqpr2RjqGaZz5Bw=;
 b=ZG5F2Yp4z17/bFuCKVrB0eWd+7S/abCXjTKbDODX70w/MP+Kad00qTVT+KYdhUdJAR
 L8QQV/ztX2JG3zrEkOnhUyNti4NtawXNOmchE9EfV++NB/m/GzxkhzUg4b9Lx2SkVhMY
 FJJIP6hwkGVJJg3ZqvoSAXbjoF/1zfzB9Upfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mQNgYP+rVNkPkQi7Z2wu5AM4qHCsoqpr2RjqGaZz5Bw=;
 b=KdHEugi2Fwn4uFiKG6O9fQOpA1AuldhLbr9ASeJ0pq9ZuNEo5dPtFu1dHW7nuQNVSr
 MtrQRJM91Qge8NGgYtpqu3QPZwoOxVS9DwZONPva9f+uAUkPvMWzhZbShzGgnLbmqFH9
 9k4kywf0yTj4/AXiksPFl/++oEx6COWHaoS4D1sRWt6PjLPtbxs0fnENfWXbY4EypMUV
 TKhmBgCD9he5AcnoKrhrUawH9KW2A0WgRBLQoUJlbI+HJs3tDy1JKM70y6lMqIrUSQ1s
 OQPy85y5HbT/Jaj/ZUEAN3UnFzqx3OrB4lIPeIy7SiaJ0tr+PbqIK9wQJIQLz0TdAhyT
 n8mg==
X-Gm-Message-State: AOAM530elDefR8AaH1tbopdrl4JKUi0JUWXWnfOWaeOmFk3tzT9CAVqm
 siJ+4C0Yny+Mb8qrDPRt3hJxt63WD+wMT3OImJmG6A==
X-Google-Smtp-Source: ABdhPJwf+Tz43RuAZxcUhaDs+RvyzXjAV7DoMunaaq8Zx65mxbPKMFTXGnJlFPTi6gXo5xiDhIRJqrR+HFVMzZ4pMiU=
X-Received: by 2002:aca:7506:: with SMTP id q6mr1589730oic.128.1606295248810; 
 Wed, 25 Nov 2020 01:07:28 -0800 (PST)
MIME-Version: 1.0
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
 <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
 <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
In-Reply-To: <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 25 Nov 2020 10:07:17 +0100
Message-ID: <CAKMK7uEAaNhr__aYxWpNmUb1jTruf0FMoPwgn8_so9mGV=yAOQ@mail.gmail.com>
Subject: Re: [REGRESSION] omapdrm/N900 display broken
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 25, 2020 at 3:16 PM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> Hi Laurent,
>
> On 23/08/2020 19:26, Aaro Koskinen wrote:
> > Hi,
> >
> > On Tue, Aug 04, 2020 at 03:39:37PM +0300, Tomi Valkeinen wrote:
> >> On 04/08/2020 15:13, Tomi Valkeinen wrote:
> >
> >>> Can you try to pinpoint a bit where the hang happens? Maybe add
> >>> DRM/omapdrm debug prints, or perhaps sysrq works and it shows a lock
> >>> that's in deadlock.
> >>
> >> Also, one data point would be to disable venc, e.g. set venc status to
> >> "disabled" in dts.
> >
> > Disabling venc makes no difference.
> >
> > The hang happens in drm_fb_helper_initial_config(). I followed the
> > "HANG DEBUGGING" tips in the function comment text and enabled
> > fb.lockless_register_fb=1 to get more (serial) console output.
> >
> > Now I get this:
> >
> > [    6.514739] omapdss_dss 48050000.dss: supply vdda_video not found, using dummy regulator
> > [    6.566375] DSS: OMAP DSS rev 2.0
> > [    6.571807] omapdss_dss 48050000.dss: bound 48050400.dispc (ops dispc_component_ops)
> > [    6.580749] omapdrm omapdrm.0: DMM not available, disable DMM support
> > [    6.587982] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> > [    6.626617] ------------[ cut here ]------------
> > [    6.631774] WARNING: CPU: 0 PID: 18 at drivers/gpu/drm/drm_bridge.c:708 drm_atomic_helper_commit_modeset_enables+0x134/0x268
> > [    6.643768] Modules linked in:
> > [    6.647033] CPU: 0 PID: 18 Comm: kworker/0:1 Tainted: G     U            5.8.0-omap3-los_16068+-00004-g2e7d4a7efefd-dirty #2
> > [    6.658966] Hardware name: Nokia RX-51 board
> > [    6.663635] Workqueue: events deferred_probe_work_func
> > [    6.669097] [<c010bf18>] (unwind_backtrace) from [<c010a0f4>] (show_stack+0x10/0x14)
> > [    6.677429] [<c010a0f4>] (show_stack) from [<c0124f18>] (__warn+0xbc/0xd4)
> > [    6.684844] [<c0124f18>] (__warn) from [<c0124f90>] (warn_slowpath_fmt+0x60/0xb8)
> > [    6.692901] [<c0124f90>] (warn_slowpath_fmt) from [<c040c0e8>] (drm_atomic_helper_commit_modeset_enables+0x134/0x268)
> > [    6.704254] [<c040c0e8>] (drm_atomic_helper_commit_modeset_enables) from [<c045442c>] (omap_atomic_commit_tail+0xb4/0xc0)
> > [    6.715972] [<c045442c>] (omap_atomic_commit_tail) from [<c040d1b4>] (commit_tail+0x9c/0x1a8)
> > [    6.725128] [<c040d1b4>] (commit_tail) from [<c040de70>] (drm_atomic_helper_commit+0x134/0x158)
> > [    6.734466] [<c040de70>] (drm_atomic_helper_commit) from [<c043b204>] (drm_client_modeset_commit_atomic+0x16c/0x208)
> > [    6.745727] [<c043b204>] (drm_client_modeset_commit_atomic) from [<c043b2f8>] (drm_client_modeset_commit_locked+0x58/0x184)
> > [    6.757629] [<c043b2f8>] (drm_client_modeset_commit_locked) from [<c043b448>] (drm_client_modeset_commit+0x24/0x40)
> > [    6.768798] [<c043b448>] (drm_client_modeset_commit) from [<c0412778>] (__drm_fb_helper_restore_fbdev_mode_unlocked+0xa0/0xc8)
> > [    6.780975] [<c0412778>] (__drm_fb_helper_restore_fbdev_mode_unlocked) from [<c0412808>] (drm_fb_helper_set_par+0x38/0x64)
> > [    6.792785] [<c0412808>] (drm_fb_helper_set_par) from [<c03a9b24>] (fbcon_init+0x3d4/0x568)
> > [    6.801757] [<c03a9b24>] (fbcon_init) from [<c03eaab0>] (visual_init+0xb8/0xfc)
> > [    6.809631] [<c03eaab0>] (visual_init) from [<c03ec070>] (do_bind_con_driver+0x1e0/0x3bc)
> > [    6.818267] [<c03ec070>] (do_bind_con_driver) from [<c03ec59c>] (do_take_over_console+0x138/0x1d8)
> > [    6.827880] [<c03ec59c>] (do_take_over_console) from [<c03a856c>] (do_fbcon_takeover+0x74/0xd4)
> > [    6.837219] [<c03a856c>] (do_fbcon_takeover) from [<c03a22e0>] (register_framebuffer+0x204/0x2d8)
> > [    6.846740] [<c03a22e0>] (register_framebuffer) from [<c0412228>] (__drm_fb_helper_initial_config_and_unlock+0x3a4/0x554)
> > [    6.858459] [<c0412228>] (__drm_fb_helper_initial_config_and_unlock) from [<c045c230>] (omap_fbdev_init+0x84/0xbc)
> > [    6.869537] [<c045c230>] (omap_fbdev_init) from [<c04549b8>] (pdev_probe+0x580/0x7d8)
> > [    6.877807] [<c04549b8>] (pdev_probe) from [<c04669b4>] (platform_drv_probe+0x48/0x98)
>
> Laurent, does this ring any bells? The WARN comes in drm_atomic_bridge_chain_enable() when
> drm_atomic_get_old_bridge_state() returns null for (presumably) sdi bridge.
>
> I'm not sure why the bridge state would not be there.

Lack of state on first modeset usually means your
drm_mode_config_reset didn't create one. Or whatever it is you're
using. I didn't look whether you're wiring this up correctly or not.
We might even want to add a ->reset function to
drm_private_state_funcs to make this work for everyone.
-Daniel

> Aaro, you can probably debug easier if you disable CONFIG_FRAMEBUFFER_CONSOLE, or even
> CONFIG_DRM_FBDEV_EMULATION.
>
>  Tomi
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
