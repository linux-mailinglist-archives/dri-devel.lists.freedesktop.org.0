Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09790894969
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 04:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C77C10ED4D;
	Tue,  2 Apr 2024 02:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=verizon.net header.i=@verizon.net header.b="nmfsA5SC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic303-1.consmr.mail.bf2.yahoo.com
 (sonic303-1.consmr.mail.bf2.yahoo.com [74.6.131.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F3D10ED4D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 02:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verizon.net; s=a2048;
 t=1712024927; bh=TDnvEdGD/Wrn/qrgAx47dGnk4iHa+ytZmpfBuM7xJ/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=nmfsA5SCjaHXm4rMLFQUqxVc55cRRVNkEABH8nr+Yc7J/TodYWRsNdLL3e/INlwQULogqYwCtjKEZgoQJ643du6iSGowKXoV9Se8qKR0msDR5NcUcOpuZYf5qCWEfuUpYsEgFPN/ugef3pm2hei6CKGjoik0o62XAm1/OXS4sEV2f9w274dxePNIujn+DZzXD53imf8Nb1w1TSCBAypaKXgKHYDg310N4h16YGfeKena1ZDp6OkiyNFH4v82msd3cidUgshuExxn9CZ9jYtOY7YaCZXtI9y7ziokV1kdaWlJuQq1TfRa6pwymG1aG4LsWEj7aAaJaFwSxxLauxUnsA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1712024927; bh=xPWgSfsPRjBD1MMP4DOj6mDAAk5N+ju+VVQn3wRrc0Q=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=bW5kSCh2f2H5DxUIhe9xDtQlzRRFaLm9CWjP4Rk3LoEqE+De2vjsT0x9wXa4q72PB/GFgu7JV7tP2Fpb2GX/d8UzPo6enIQisz5ENohEKK7aYBG1jb7okbdA0BB+Y18WaTRx/GSpIxv7Z0xmpRjVqBuR823b/VWb9GsbJS+EoBGSX1r23YYnKgjV5nWIuK0iyHlQxqNGCaI/2Jv4UOZvnhej0bqWVmsykxG87qHfhqOXhvIcvrjHxjknLglwWEextOv8DuyQ3oUG4CdWciOp96Uw8R2I0mb/fCRqJykbvbt+nz/tNJ3FQioKcb1L0Eib3pB9qbAyQA9wYfddsp4HCQ==
X-YMail-OSG: _20x9aIVM1mAUrmXP91jrjEUo6lUW.cSiCR9DT7kNdM.BLa7.7WioFC_v8mZ6XK
 2OSDpxTBUcUN8elNZqbeHjV27XY8lMWbTeqk4tJffqyFJiaR3bPvSVpBqFN5_0HTbmC0J7S_qj_J
 sUZrkPQyXrDvzYOaEAypwDsT2yMOtGpqtY_jbF.MjnP9HCjnBMUiU9SUZGW_8UCsU33Wc8yxPRLb
 mBKytdg_CEynykQF5OIopvrVSYelEPBNJRSUNd1elHIIKzwMywS0L115WcP0SbvqYOBtsKmfu8P2
 .GfnwrpzSaxYBx1ICihlsQVdGypTvtwXVNGR03yjhUhWBUPYmJjJahDhgLtiSlqXIZPWicE59A2l
 DlQCGqb24mX_bSStxbDm3vfzcKvfJGfbmXrFixEVbdXxUePDWHUuSU.WKV9zSCE.vQRSEcy7hj.x
 4oLTz9HBp8SNCHEKDq7CY5M67c_DcW.zzWykEtMu5gy2NrfyIgT7k4CDmORMPnhE7VxLLTXrj8Rz
 vqJ9W5BZcLw7njVFuRZaxHA5AOn3y54VPSVykE9BvMdmuGsh1q9T4oolZNkcS9GE9aH6zoJV1j28
 fvgE6_WXL.VSKAGo.769GbBKhCEjPcy8Ktp8N5Gub8wW3OI1CDXK5b7h.TIIdHb6qqFkE6UPa5o8
 d5Fl85AE_DV.bU0MCYBDJS_swULtptDyKpBVMQqtLsffpyJLaVGUnlfMQlF_gvkWtarArrkxLZsJ
 nXtKv25in_Z3EilVJvIjb4INd3Jc1WTftDXrat4hxyWrcvegzJLFaHMR_BHU65u.gi00EAOdKcdo
 9OfVa7tWqsdjRwjGFEWN9Gx5KxhRwhtcTk69m20HsWH0HmITef6TzsfoknChGrwahyuCJ5IBazOt
 glgrvqYwaYrANkNv148q5bY7yA.vuGCP72BxnabS52O72dKLAWN0.7R11nYui_pt3UpvK0MP2NgQ
 nEChyy6ORGjHDcZHqaJ9uJpmpVmdDg8kfy6GXEyUGj718ErUTurJtv8g.p6wOsRWNsjRtMmqURPo
 wgYjF0A3IUik4r1WxKDSEE7s3OMs0iX0ACUQnLVGAmX.rPO.D8fqe4umwKMzuBeJ9_OY_sN0Zbiw
 sCSU0pGXPRHTEYIJfa_2EHz6jBeBckwTelBIid6iSi9BftAD_s0RBgBmh57bNAoS5ugDym7ZRD7L
 .9Mx64vUEfwz3tHv5RAErjd3T9K.KmX.G3WaKMgxZYOis4JReYJlq6VHJkEdJZPJLsutFLIvaXdZ
 H213N2qPN9aB6TyRIzj8hcugH9422VBXrsSxi4QY7205TQp.K5VO5el279Y.JfoMoDvbkY1xO7a5
 VXp0v6USaDvRfPovFKtcqVam99w487XZ5SX6gu_84Ad5CV77O2Q9is2TIdc8niEY8j5BydZvdSgY
 3L5Lj3L1KKuu0.CJZYiMOmthdcjL76Md9rStonTd2jIwZtx6mwQmY5BQrIo7hVUARn23jfgRSYd9
 90jpZh3n52OfhHeMRlE69Tja3iWB0dcPAGWqZxMvwguQZobJYTBU0AIsf8pXMZJVF1zvH8Vtr4Pb
 S2Xso8bsNoS3xl.bQ0cF3Bc8Z8sopiiihHhZrApKBS.RPMzg70m2mN74ntbk1aIzC9GyywIaN1Lg
 ZgzuXaJhRvEgBy8M4OY97fgU4uA.rdOzHLPqQSElASeT7UzxxyqSGlhf6gJ0MgSf9147dDQxTeOZ
 .ZtldHqb991jNW.eeiBg8mc3HFfh4ADdGZq15osOEeTBI5UuBqC2iRZHEgKn7M4zhZVwdoox0Q_j
 5vlSvma4JhXuV.gMQ9qqdvR9XV.Bs5V08b29bpD47wd8vjMEXd5LnzBvCYQmEbdjJKXL9o630L6g
 UZK6JavnVqyw_MO7jZu_FOMNz9iBG5Kt_ARGEk1TzKzYaIUS099qK4hgtrrqJxhHbHBoFD_G2vXO
 LASPDIGgXk.2EY4u4Tc1tBm.gTmaSPqhA9vj4OKxSv5Qzrl7EJ3iB0dx.wyxjLwbkACJDWW2zd4o
 VfuT9QbUb7I.NrXgZgqhjkkN81eKY6zd9u1_Stt9XpuZYKbFfEPXGvlBzdZMm8anqTGogdqwtzkS
 1B1NjNvMQN6SmHyqHQPv0DSVJNXxIu2TETN3doYaM9U_7LS5ieRRn2_VtwZz37Pr4Lq_CpTpMKR3
 J0hj5F1qZ4oVwv0jQY7drIRF__pVQCCJ7yw2uoVteXTABzSQbQkEUlrm74MJd81dqfVprtY.FFrQ
 40AJN5Aj.6xZVYCpmX0BH7hHfmrwOqRL4vmgG_haPgegtqF_JVslPkINp7TkU792nSPERaP0-
X-Sonic-MF: <bluescreen_avenger@verizon.net>
X-Sonic-ID: 3cecf75d-4b96-4abc-9642-1a0edaa24427
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.bf2.yahoo.com with HTTP; Tue, 2 Apr 2024 02:28:47 +0000
Received: by hermes--production-bf1-7d6dbd57c9-lcn2g (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 60f2ee5f4a0b02c3348434e94a761732; 
 Tue, 02 Apr 2024 02:28:44 +0000 (UTC)
From: nerdopolis <bluescreen_avenger@verizon.net>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, noralf@tronnes.org, sui.jingfeng@linux.dev,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: gpiccoli@igalia.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Lukas Wunner <lukas@wunner.de>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v11 1/9] drm/panic: Add drm panic locking
Date: Mon, 01 Apr 2024 22:28:44 -0400
Message-ID: <3342674.44csPzL39Z@nerdopolis2>
In-Reply-To: <20240328120638.468738-2-jfalempe@redhat.com>
References: <20240328120638.468738-1-jfalempe@redhat.com>
 <20240328120638.468738-2-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="nextPart8407979.T7Z3S40VBb"
Content-Transfer-Encoding: 7Bit
X-Mailer: WebService/1.1.22205
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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

This is a multi-part message in MIME format.

--nextPart8407979.T7Z3S40VBb
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="iso-8859-1"

On Thursday, March 28, 2024 8:03:43 AM EDT Jocelyn Falempe wrote:
> From: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Rough sketch for the locking of drm panic printing code. The upshot of
> this approach is that we can pretty much entirely rely on the atomic
> commit flow, with the pair of raw_spin_lock/unlock providing any
> barriers we need, without having to create really big critical
> sections in code.
> 
> This also avoids the need that drivers must explicitly update the
> panic handler state, which they might forget to do, or not do
> consistently, and then we blow up in the worst possible times.
> 
> It is somewhat racy against a concurrent atomic update, and we might
> write into a buffer which the hardware will never display. But there's
> fundamentally no way to avoid that - if we do the panic state update
> explicitly after writing to the hardware, we might instead write to an
> old buffer that the user will barely ever see.
> 
> Note that an rcu protected deference of plane->state would give us the
> the same guarantees, but it has the downside that we then need to
> protect the plane state freeing functions with call_rcu too. Which
> would very widely impact a lot of code and therefore doesn't seem
> worth the complexity compared to a raw spinlock with very tiny
> critical sections. Plus rcu cannot be used to protect access to
> peek/poke registers anyway, so we'd still need it for those cases.
> 
> Peek/poke registers for vram access (or a gart pte reserved just for
> panic code) are also the reason I've gone with a per-device and not
> per-plane spinlock, since usually these things are global for the
> entire display. Going with per-plane locks would mean drivers for such
> hardware would need additional locks, which we don't want, since it
> deviates from the per-console takeoverlocks design.
> 
> Longer term it might be useful if the panic notifiers grow a bit more
> structure than just the absolute bare
> EXPORT_SYMBOL(panic_notifier_list) - somewhat aside, why is that not
> EXPORT_SYMBOL_GPL ... If panic notifiers would be more like console
> drivers with proper register/unregister interfaces we could perhaps
> reuse the very fancy console lock with all it's check and takeover
> semantics that John Ogness is developing to fix the console_lock mess.
> But for the initial cut of a drm panic printing support I don't think
> we need that, because the critical sections are extremely small and
> only happen once per display refresh. So generally just 60 tiny locked
> sections per second, which is nothing compared to a serial console
> running a 115kbaud doing really slow mmio writes for each byte. So for
> now the raw spintrylock in drm panic notifier callback should be good
> enough.
> 
> Another benefit of making panic notifiers more like full blown
> consoles (that are used in panics only) would be that we get the two
> stage design, where first all the safe outputs are used. And then the
> dangerous takeover tricks are deployed (where for display drivers we
> also might try to intercept any in-flight display buffer flips, which
> if we race and misprogram fifos and watermarks can hang the memory
> controller on some hw).
> 
> For context the actual implementation on the drm side is by Jocelyn
> and this patch is meant to be combined with the overall approach in
> v7 (v8 is a bit less flexible, which I think is the wrong direction):
> 
> https://lore.kernel.org/dri-devel/20240104160301.185915-1-jfalempe@redhat.com/
> 
> Note that the locking is very much not correct there, hence this
> separate rfc.
> 
> v2:
> - fix authorship, this was all my typing
> - some typo oopsies
> - link to the drm panic work by Jocelyn for context
> 
> v10:
> - Use spinlock_irqsave/restore (John Ogness)
> 
> v11:
> - Use macro instead of inline functions for drm_panic_lock/unlock (John Ogness)
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: John Ogness <john.ogness@linutronix.de>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |   4 ++
>  drivers/gpu/drm/drm_drv.c           |   1 +
>  include/drm/drm_mode_config.h       |  10 +++
>  include/drm/drm_panic.h             | 100 ++++++++++++++++++++++++++++
>  4 files changed, 115 insertions(+)
>  create mode 100644 include/drm/drm_panic.h
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 39ef0a6addeb..fb97b51b38f1 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -38,6 +38,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_panic.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_self_refresh_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -3016,6 +3017,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>                    bool stall)
>  {
>      int i, ret;
> +    unsigned long flags;
>      struct drm_connector *connector;
>      struct drm_connector_state *old_conn_state, *new_conn_state;
>      struct drm_crtc *crtc;
> @@ -3099,6 +3101,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>          }
>      }
>  
> +    drm_panic_lock(state->dev, flags);
>      for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
>          WARN_ON(plane->state != old_plane_state);
>  
> @@ -3108,6 +3111,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>          state->planes[i].state = old_plane_state;
>          plane->state = new_plane_state;
>      }
> +    drm_panic_unlock(state->dev, flags);
>  
>      for_each_oldnew_private_obj_in_state(state, obj, old_obj_state, new_obj_state, i) {
>          WARN_ON(obj->state != old_obj_state);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 243cacb3575c..c157500b3135 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -638,6 +638,7 @@ static int drm_dev_init(struct drm_device *dev,
>      mutex_init(&dev->filelist_mutex);
>      mutex_init(&dev->clientlist_mutex);
>      mutex_init(&dev->master_mutex);
> +    raw_spin_lock_init(&dev->mode_config.panic_lock);
>  
>      ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
>      if (ret)
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 973119a9176b..e79f1a557a22 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -505,6 +505,16 @@ struct drm_mode_config {
>      */
>      struct list_head plane_list;
>  
> +    /**
> +    * @panic_lock:
> +    *
> +    * Raw spinlock used to protect critical sections of code that access
> +    * the display hardware or modeset software state, which the panic
> +    * printing code must be protected against. See drm_panic_trylock(),
> +    * drm_panic_lock() and drm_panic_unlock().
> +    */
> +    struct raw_spinlock panic_lock;
> +
>      /**
>      * @num_crtc:
>      *
> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> new file mode 100644
> index 000000000000..68f57710d2d1
> --- /dev/null
> +++ b/include/drm/drm_panic.h
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +#ifndef __DRM_PANIC_H__
> +#define __DRM_PANIC_H__
> +
> +#include <drm/drm_device.h>
> +/*
> + * Copyright (c) 2024 Intel
> + */
> +
> +/**
> + * drm_panic_trylock - try to enter the panic printing critical section
> + * @dev: struct drm_device
> + * @flags: unsigned long irq flags you need to pass to the unlock() counterpart
> + *
> + * This function must be called by any panic printing code. The panic printing
> + * attempt must be aborted if the trylock fails.
> + *
> + * Panic printing code can make the following assumptions while holding the
> + * panic lock:
> + *
> + * - Anything protected by drm_panic_lock() and drm_panic_unlock() pairs is safe
> + *   to access.
> + *
> + * - Furthermore the panic printing code only registers in drm_dev_unregister()
> + *   and gets removed in drm_dev_unregister(). This allows the panic code to
> + *   safely access any state which is invariant in between these two function
> + *   calls, like the list of planes drm_mode_config.plane_list or most of the
> + *   struct drm_plane structure.
> + *
> + * Specifically thanks to the protection around plane updates in
> + * drm_atomic_helper_swap_state() the following additional guarantees hold:
> + *
> + * - It is safe to deference the drm_plane.state pointer.
> + *
> + * - Anything in struct drm_plane_state or the driver's subclass thereof which
> + *   stays invariant after the atomic check code has finished is safe to access.
> + *   Specifically this includes the reference counted pointers to framebuffer
> + *   and buffer objects.
> + *
> + * - Anything set up by drm_plane_helper_funcs.fb_prepare and cleaned up
> + *   drm_plane_helper_funcs.fb_cleanup is safe to access, as long as it stays
> + *   invariant between these two calls. This also means that for drivers using
> + *   dynamic buffer management the framebuffer is pinned, and therefer all
> + *   relevant datastructures can be accessed without taking any further locks
> + *   (which would be impossible in panic context anyway).
> + *
> + * - Importantly, software and hardware state set up by
> + *   drm_plane_helper_funcs.begin_fb_access and
> + *   drm_plane_helper_funcs.end_fb_access is not safe to access.
> + *
> + * Drivers must not make any assumptions about the actual state of the hardware,
> + * unless they explicitly protected these hardware access with drm_panic_lock()
> + * and drm_panic_unlock().
> + *
> + * Returns:
> + *
> + * 0 when failing to acquire the raw spinlock, nonzero on success.
> + */
> +#define drm_panic_trylock(dev, flags) \
> +    raw_spin_trylock_irqsave(&dev->mode_config.panic_lock, flags)
> +
> +/**
> + * drm_panic_lock - protect panic printing relevant state
> + * @dev: struct drm_device
> + * @flags: unsigned long irq flags you need to pass to the unlock() counterpart
> + *
> + * This function must be called to protect software and hardware state that the
> + * panic printing code must be able to rely on. The protected sections must be
> + * as small as possible. It uses the irqsave/irqrestore variant, and can be
> + * called from irq handler. Examples include:
> + *
> + * - Access to peek/poke or other similar registers, if that is the way the
> + *   driver prints the pixels into the scanout buffer at panic time.
> + *
> + * - Updates to pointers like drm_plane.state, allowing the panic handler to
> + *   safely deference these. This is done in drm_atomic_helper_swap_state().
> + *
> + * - An state that isn't invariant and that the driver must be able to access
> + *   during panic printing.
> + *
> + * Returns:
> + *
> + * The irqflags needed to call drm_panic_unlock().
> + */
> +
> +#define drm_panic_lock(dev, flags) \
> +    raw_spin_lock_irqsave(&dev->mode_config.panic_lock, flags)
> +
> +/**
> + * drm_panic_unlock - end of the panic printing critical section
> + * @dev: struct drm_device
> + * @flags: irq flags that were returned when acquiring the lock
> + *
> + * Unlocks the raw spinlock acquired by either drm_panic_lock() or
> + * drm_panic_trylock().
> + */
> +#define drm_panic_unlock(dev, flags) \
> +    raw_spin_unlock_irqrestore(&dev->mode_config.panic_lock, flags)
> +
> +#endif /* __DRM_PANIC_H__ */
> 


I can't offer much feedback, except that I have tested this in QEMU with SimpleDRM and it works great
 
Thanks!

--nextPart8407979.T7Z3S40VBb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="iso-8859-1"

<html>
<head>
<meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8">
</head>
<body><p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0=
;"><span style=3D"font-size:0.75em;">On Thursday, March 28, 2024 8:03:43 AM=
 EDT Jocelyn Falempe wrote:</span></p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; From: Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Rough sketch for the locking of drm panic printing code. The upshot of</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; this approach is that we can pretty much entirely rely on the atomic</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; commit flow, with the pair of raw_spin_lock/unlock providing any</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; barriers we need, without having to create really big critical</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; sections in code.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; This also avoids the need that drivers must explicitly update the</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; panic handler state, which they might forget to do, or not do</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; consistently, and then we blow up in the worst possible times.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; It is somewhat racy against a concurrent atomic update, and we might</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; write into a buffer which the hardware will never display. But there's</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; fundamentally no way to avoid that - if we do the panic state update</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; explicitly after writing to the hardware, we might instead write to an</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; old buffer that the user will barely ever see.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Note that an rcu protected deference of plane-&gt;state would give us the=
</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; the same guarantees, but it has the downside that we then need to</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; protect the plane state freeing functions with call_rcu too. Which</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; would very widely impact a lot of code and therefore doesn't seem</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; worth the complexity compared to a raw spinlock with very tiny</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; critical sections. Plus rcu cannot be used to protect access to</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; peek/poke registers anyway, so we'd still need it for those cases.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Peek/poke registers for vram access (or a gart pte reserved just for</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; panic code) are also the reason I've gone with a per-device and not</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; per-plane spinlock, since usually these things are global for the</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; entire display. Going with per-plane locks would mean drivers for such</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; hardware would need additional locks, which we don't want, since it</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; deviates from the per-console takeoverlocks design.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Longer term it might be useful if the panic notifiers grow a bit more</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; structure than just the absolute bare</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; EXPORT_SYMBOL(panic_notifier_list) - somewhat aside, why is that not</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; EXPORT_SYMBOL_GPL ... If panic notifiers would be more like console</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; drivers with proper register/unregister interfaces we could perhaps</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; reuse the very fancy console lock with all it's check and takeover</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; semantics that John Ogness is developing to fix the console_lock mess.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; But for the initial cut of a drm panic printing support I don't think</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; we need that, because the critical sections are extremely small and</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; only happen once per display refresh. So generally just 60 tiny locked</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; sections per second, which is nothing compared to a serial console</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; running a 115kbaud doing really slow mmio writes for each byte. So for</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; now the raw spintrylock in drm panic notifier callback should be good</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; enough.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Another benefit of making panic notifiers more like full blown</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; consoles (that are used in panics only) would be that we get the two</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; stage design, where first all the safe outputs are used. And then the</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; dangerous takeover tricks are deployed (where for display drivers we</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; also might try to intercept any in-flight display buffer flips, which</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; if we race and misprogram fifos and watermarks can hang the memory</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; controller on some hw).</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; For context the actual implementation on the drm side is by Jocelyn</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; and this patch is meant to be combined with the overall approach in</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; v7 (v8 is a bit less flexible, which I think is the wrong direction):</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; https://lore.kernel.org/dri-devel/20240104160301.185915-1-jfalempe@redhat=
=2Ecom/</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Note that the locking is very much not correct there, hence this</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; separate rfc.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; v2:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; - fix authorship, this was all my typing</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; - some typo oopsies</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; - link to the drm panic work by Jocelyn for context</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; v10:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; - Use spinlock_irqsave/restore (John Ogness)</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; v11:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; - Use macro instead of inline functions for drm_panic_lock/unlock (John O=
gness)</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Signed-off-by: Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Cc: Jocelyn Falempe &lt;jfalempe@redhat.com&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Cc: Andrew Morton &lt;akpm@linux-foundation.org&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Cc: &quot;Peter Zijlstra (Intel)&quot; &lt;peterz@infradead.org&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Cc: Lukas Wunner &lt;lukas@wunner.de&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Cc: Petr Mladek &lt;pmladek@suse.com&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Cc: Steven Rostedt &lt;rostedt@goodmis.org&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Cc: John Ogness &lt;john.ogness@linutronix.de&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Cc: Sergey Senozhatsky &lt;senozhatsky@chromium.org&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Cc: Maarten Lankhorst &lt;maarten.lankhorst@linux.intel.com&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Cc: Maxime Ripard &lt;mripard@kernel.org&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Cc: Thomas Zimmermann &lt;tzimmermann@suse.de&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Cc: David Airlie &lt;airlied@gmail.com&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Cc: Daniel Vetter &lt;daniel@ffwll.ch&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; Signed-off-by: Jocelyn Falempe &lt;jfalempe@redhat.com&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; ---</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 drivers/gpu/drm/drm_atomic_helper.c |=A0=A0 4 ++</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 drivers/gpu/drm/drm_drv.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 1 +</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 include/drm/drm_mode_config.h=A0=A0=A0=A0=A0=A0 |=A0 10 +++</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 include/drm/drm_panic.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 100 ++++=
++++++++++++++++++++++++</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 4 files changed, 115 insertions(+)</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 create mode 100644 include/drm/drm_panic.h</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; index 39ef0a6addeb..fb97b51b38f1 100644</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; --- a/drivers/gpu/drm/drm_atomic_helper.c</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +++ b/drivers/gpu/drm/drm_atomic_helper.c</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; @@ -38,6 +38,7 @@</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 #include &lt;drm/drm_drv.h&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 #include &lt;drm/drm_framebuffer.h&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 #include &lt;drm/drm_gem_atomic_helper.h&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +#include &lt;drm/drm_panic.h&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 #include &lt;drm/drm_print.h&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 #include &lt;drm/drm_self_refresh_helper.h&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 #include &lt;drm/drm_vblank.h&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; @@ -3016,6 +3017,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_=
state *state,</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0 bool stall)</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 {</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 int i, ret;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 unsigned long flags;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 struct drm_connector *connector;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 struct drm_connector_state *old_conn_state, *new_conn_state;=
</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 struct drm_crtc *crtc;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; @@ -3099,6 +3101,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_=
state *state,</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 =A0=A0=A0 }</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 }</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 drm_panic_lock(state-&gt;dev, flags);</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 for_each_oldnew_plane_in_state(state, plane, old_plane_state=
, new_plane_state, i) {</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 =A0=A0=A0 WARN_ON(plane-&gt;state !=3D old_plane_state);</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; @@ -3108,6 +3111,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_=
state *state,</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 =A0=A0=A0 state-&gt;planes[i].state =3D old_plane_state;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 =A0=A0=A0 plane-&gt;state =3D new_plane_state;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 }</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 drm_panic_unlock(state-&gt;dev, flags);</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 for_each_oldnew_private_obj_in_state(state, obj, old_obj_sta=
te, new_obj_state, i) {</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 =A0=A0=A0 WARN_ON(obj-&gt;state !=3D old_obj_state);</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; index 243cacb3575c..c157500b3135 100644</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; --- a/drivers/gpu/drm/drm_drv.c</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +++ b/drivers/gpu/drm/drm_drv.c</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; @@ -638,6 +638,7 @@ static int drm_dev_init(struct drm_device *dev,</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 mutex_init(&amp;dev-&gt;filelist_mutex);</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 mutex_init(&amp;dev-&gt;clientlist_mutex);</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 mutex_init(&amp;dev-&gt;master_mutex);</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 raw_spin_lock_init(&amp;dev-&gt;mode_config.panic_lock);</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 ret =3D drmm_add_action_or_reset(dev, drm_dev_init_release, =
NULL);</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 if (ret)</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.=
h</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; index 973119a9176b..e79f1a557a22 100644</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; --- a/include/drm/drm_mode_config.h</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +++ b/include/drm/drm_mode_config.h</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; @@ -505,6 +505,16 @@ struct drm_mode_config {</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 */</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 struct list_head plane_list;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 /**</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 * @panic_lock:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 * Raw spinlock used to protect critical sections of code that =
access</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 * the display hardware or modeset software state, which the pa=
nic</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 * printing code must be protected against. See drm_panic_trylo=
ck(),</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 * drm_panic_lock() and drm_panic_unlock().</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 */</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 struct raw_spinlock panic_lock;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 /**</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 * @num_crtc:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
;=A0 =A0=A0=A0 *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; new file mode 100644</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; index 000000000000..68f57710d2d1</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; --- /dev/null</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +++ b/include/drm/drm_panic.h</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; @@ -0,0 +1,100 @@</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +/* SPDX-License-Identifier: GPL-2.0 or MIT */</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +#ifndef __DRM_PANIC_H__</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +#define __DRM_PANIC_H__</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +#include &lt;drm/drm_device.h&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +/*</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * Copyright (c) 2024 Intel</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + */</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +/**</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * drm_panic_trylock - try to enter the panic printing critical section<=
/p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * @dev: struct drm_device</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * @flags: unsigned long irq flags you need to pass to the unlock() coun=
terpart</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * This function must be called by any panic printing code. The panic pr=
inting</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * attempt must be aborted if the trylock fails.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * Panic printing code can make the following assumptions while holding =
the</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * panic lock:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * - Anything protected by drm_panic_lock() and drm_panic_unlock() pairs=
 is safe</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 to access.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * - Furthermore the panic printing code only registers in drm_dev_unreg=
ister()</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 and gets removed in drm_dev_unregister(). This allows the panic=
 code to</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 safely access any state which is invariant in between these two=
 function</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 calls, like the list of planes drm_mode_config.plane_list or mo=
st of the</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 struct drm_plane structure.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * Specifically thanks to the protection around plane updates in</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * drm_atomic_helper_swap_state() the following additional guarantees ho=
ld:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * - It is safe to deference the drm_plane.state pointer.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * - Anything in struct drm_plane_state or the driver's subclass thereof=
 which</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 stays invariant after the atomic check code has finished is saf=
e to access.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 Specifically this includes the reference counted pointers to fr=
amebuffer</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 and buffer objects.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * - Anything set up by drm_plane_helper_funcs.fb_prepare and cleaned up=
</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 drm_plane_helper_funcs.fb_cleanup is safe to access, as long as=
 it stays</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 invariant between these two calls. This also means that for dri=
vers using</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 dynamic buffer management the framebuffer is pinned, and theref=
er all</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 relevant datastructures can be accessed without taking any furt=
her locks</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 (which would be impossible in panic context anyway).</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * - Importantly, software and hardware state set up by</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 drm_plane_helper_funcs.begin_fb_access and</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 drm_plane_helper_funcs.end_fb_access is not safe to access.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * Drivers must not make any assumptions about the actual state of the h=
ardware,</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * unless they explicitly protected these hardware access with drm_panic=
_lock()</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * and drm_panic_unlock().</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * Returns:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * 0 when failing to acquire the raw spinlock, nonzero on success.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + */</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +#define drm_panic_trylock(dev, flags) \</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 raw_spin_trylock_irqsave(&amp;dev-&gt;mode_config.panic_lock, =
flags)</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +/**</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * drm_panic_lock - protect panic printing relevant state</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * @dev: struct drm_device</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * @flags: unsigned long irq flags you need to pass to the unlock() coun=
terpart</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * This function must be called to protect software and hardware state t=
hat the</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * panic printing code must be able to rely on. The protected sections m=
ust be</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * as small as possible. It uses the irqsave/irqrestore variant, and can=
 be</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * called from irq handler. Examples include:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * - Access to peek/poke or other similar registers, if that is the way =
the</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 driver prints the pixels into the scanout buffer at panic time.=
</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * - Updates to pointers like drm_plane.state, allowing the panic handle=
r to</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 safely deference these. This is done in drm_atomic_helper_swap_=
state().</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * - An state that isn't invariant and that the driver must be able to a=
ccess</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *=A0=A0 during panic printing.</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * Returns:</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * The irqflags needed to call drm_panic_unlock().</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + */</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +#define drm_panic_lock(dev, flags) \</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 raw_spin_lock_irqsave(&amp;dev-&gt;mode_config.panic_lock, fla=
gs)</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +/**</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * drm_panic_unlock - end of the panic printing critical section</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * @dev: struct drm_device</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * @flags: irq flags that were returned when acquiring the lock</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + *</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * Unlocks the raw spinlock acquired by either drm_panic_lock() or</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + * drm_panic_trylock().</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; + */</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +#define drm_panic_unlock(dev, flags) \</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +=A0=A0=A0 raw_spin_unlock_irqrestore(&amp;dev-&gt;mode_config.panic_lock=
, flags)</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; +#endif /* __DRM_PANIC_H__ */</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">&gt=
; </p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;"><br=
 /></p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">I c=
an't offer much feedback, except that I have tested this in QEMU with Simpl=
eDRM and it works great</p>
<p style=3D"margin-top:12;margin-bottom:12;margin-left:0;margin-right:0;">=
=A0</p>
<p style=3D"margin-top:0;margin-bottom:0;margin-left:0;margin-right:0;">Tha=
nks!</p>
</body>
</html>
--nextPart8407979.T7Z3S40VBb--



