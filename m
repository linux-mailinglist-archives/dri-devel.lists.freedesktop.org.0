Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F7020BB46
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 23:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED296E4D7;
	Fri, 26 Jun 2020 21:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104CF6E4BB
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 21:18:34 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g75so10002593wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 14:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=VYlXwrA6E7biz1psC96VOL2rQEV/RFyzRPEP3+ZW04A=;
 b=gWymAjsiQF3YhRwGXKgPRtYKq54T6Z4bmQ0F535mHoJsYl2QyMXBvvd0lrs8wB1FSI
 /znF6/AeSWCW0KI4YjzW/HuyEp4/cgJOdDY4fJfZZ38MePqQ+94zP2FJQGnB2DEacVHs
 DnXKYifsOZzgQNKtt6sNquQgFeVQIi5dnyM4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=VYlXwrA6E7biz1psC96VOL2rQEV/RFyzRPEP3+ZW04A=;
 b=Y6a8WnkAxQxtcvZsUq3AKbOmvy7/MPyAbHBI9UKH6QwxBPS8Aim87ueYv/FxtnfesT
 Kt17kkBI2mrpAq6gdmmnzCL7vMQxCdKVWNjB59M+WNDYHHi1vivVswl/uzssPpqRZ2b+
 tuJ/TcZhk6L8WoUevwAfs77Kj0AI7zYvjWwEu8uev5GlIHzrH7OZYyNtuZHUdQBqXiKH
 mU1HbiZTSqwKHram64l7vzEYqjLPtugShM73XqKhavjHx38quyGm1qnT4pzIzva2VVAu
 rsLuDLO+yj+UGrdA4ktjtu0edQgzE1dFbyp1Zj5ItOBlZa9cgAXWN951TwuztVSYJ+FM
 xwIg==
X-Gm-Message-State: AOAM531wrPxAjFE9ZY1rhprmssaKcgETj+FVQjt2I4XFDDTaObjl/sjz
 cf+HF0i06XsB6yUn8lnaQYiEWQ==
X-Google-Smtp-Source: ABdhPJwDaK85mN5gO+Q6s+HR8GMoJHBwLbavPfW+QgHBDKqYYtu3h/ygcbiIQtgB33qTGz2CHi3DIg==
X-Received: by 2002:a1c:9650:: with SMTP id y77mr1626679wmd.101.1593206312492; 
 Fri, 26 Jun 2020 14:18:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 40sm15625264wrc.27.2020.06.26.14.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 14:18:31 -0700 (PDT)
Date: Fri, 26 Jun 2020 23:18:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RFC v7 03/11] drm/vblank: Add vblank works
Message-ID: <20200626211829.GH3278063@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Tejun Heo <tj@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200624230318.126256-1-lyude@redhat.com>
 <20200624230318.126256-4-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624230318.126256-4-lyude@redhat.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 07:03:10PM -0400, Lyude Paul wrote:
> Add some kind of vblank workers. The interface is similar to regular
> delayed works, and is mostly based off kthread_work. It allows for
> scheduling delayed works that execute once a particular vblank sequence
> has passed. It also allows for accurate flushing of scheduled vblank
> works - in that flushing waits for both the vblank sequence and job
> execution to complete, or for the work to get cancelled - whichever
> comes first.
> =

> Whatever hardware programming we do in the work must be fast (must at
> least complete during the vblank or scanout period, sometimes during the
> first few scanlines of the vblank). As such we use a high-priority
> per-CRTC thread to accomplish this.
> =

> Changes since v6:
> * Get rid of ->pending and seqcounts, and implement flushing through
>   simpler means - danvet
> * Get rid of work_lock, just use drm_device->event_lock
> * Move drm_vblank_work item cleanup into drm_crtc_vblank_off() so that
>   we ensure that all vblank work has finished before disabling vblanks
> * Add checks into drm_crtc_vblank_reset() so we yell if it gets called
>   while there's vblank workers active
> * Grab event_lock in both drm_crtc_vblank_on()/drm_crtc_vblank_off(),
>   the main reason for this is so that other threads calling
>   drm_vblank_work_schedule() are blocked from attempting to schedule
>   while we're in the middle of enabling/disabling vblanks.
> * Move drm_handle_vblank_works() call below drm_handle_vblank_events()
> * Simplify drm_vblank_work_cancel_sync()
> * Fix drm_vblank_work_cancel_sync() documentation
> * Move wake_up_all() calls out of spinlock where we can. The only one I
>   left was the call to wake_up_all() in drm_vblank_handle_works() as
>   this seemed like it made more sense just living in that function
>   (which is all technically under lock)
> * Move drm_vblank_work related functions into their own source files
> * Add drm_vblank_internal.h so we can export some functions we don't
>   want drivers using, but that we do need to use in drm_vblank_work.c
> * Add a bunch of documentation
> Changes since v4:
> * Get rid of kthread interfaces we tried adding and move all of the
>   locking into drm_vblank.c. For implementing drm_vblank_work_flush(),
>   we now use a wait_queue and sequence counters in order to
>   differentiate between multiple work item executions.
> * Get rid of drm_vblank_work_cancel() - this would have been pretty
>   difficult to actually reimplement and it occurred to me that neither
>   nouveau or i915 are even planning to use this function. Since there's
>   also no async cancel function for most of the work interfaces in the
>   kernel, it seems a bit unnecessary anyway.
> * Get rid of to_drm_vblank_work() since we now are also able to just
>   pass the struct drm_vblank_work to work item callbacks anyway
> Changes since v3:
> * Use our own spinlocks, don't integrate so tightly with kthread_works
> Changes since v2:
> * Use kthread_workers instead of reinventing the wheel.
> =

> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Co-developed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

I found a bunch of tiny details below, but overall looks great and thanks
for polishing the kerneldoc.

With the details addressed one way or another:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But feel free to resend and poke me again if you want me to recheck the
details that needed changing.

Cheers, Daniel


> ---
>  Documentation/gpu/drm-kms.rst              |  15 ++
>  drivers/gpu/drm/Makefile                   |   2 +-
>  drivers/gpu/drm/drm_vblank.c               |  55 +++--
>  drivers/gpu/drm/drm_vblank_internal.h      |  19 ++
>  drivers/gpu/drm/drm_vblank_work.c          | 259 +++++++++++++++++++++
>  drivers/gpu/drm/drm_vblank_work_internal.h |  24 ++
>  include/drm/drm_vblank.h                   |  20 ++
>  include/drm/drm_vblank_work.h              |  71 ++++++
>  8 files changed, 447 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_vblank_internal.h
>  create mode 100644 drivers/gpu/drm/drm_vblank_work.c
>  create mode 100644 drivers/gpu/drm/drm_vblank_work_internal.h
>  create mode 100644 include/drm/drm_vblank_work.h
> =

> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 975cfeb8a3532..3c5ae4f6dfd23 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -543,3 +543,18 @@ Vertical Blanking and Interrupt Handling Functions R=
eference
>  =

>  .. kernel-doc:: drivers/gpu/drm/drm_vblank.c
>     :export:
> +
> +Vertical Blank Work
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_vblank_work.c
> +   :doc: vblank works
> +
> +Vertical Blank Work Functions Reference
> +---------------------------------------
> +
> +.. kernel-doc:: include/drm/drm_vblank_work.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_vblank_work.c
> +   :export:
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 2c0e5a7e59536..02ee5faf1a925 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -18,7 +18,7 @@ drm-y       :=3D	drm_auth.o drm_cache.o \
>  		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
>  		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
>  		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
> -		drm_managed.o
> +		drm_managed.o drm_vblank_work.o
>  =

>  drm-$(CONFIG_DRM_LEGACY) +=3D drm_legacy_misc.o drm_bufs.o drm_context.o=
 drm_dma.o drm_scatter.o drm_lock.o
>  drm-$(CONFIG_DRM_LIB_RANDOM) +=3D lib/drm_random.o
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index e895f5331fdb4..b353bc8328414 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -25,6 +25,7 @@
>   */
>  =

>  #include <linux/export.h>
> +#include <linux/kthread.h>
>  #include <linux/moduleparam.h>
>  =

>  #include <drm/drm_crtc.h>
> @@ -37,6 +38,8 @@
>  =

>  #include "drm_internal.h"
>  #include "drm_trace.h"
> +#include "drm_vblank_internal.h"
> +#include "drm_vblank_work_internal.h"

Feels mild overkill to have these files with 1-2 functions each, I'd stuff
them all into drm_internal.h. We do have other vblank stuff in there
already.

>  =

>  /**
>   * DOC: vblank handling
> @@ -363,7 +366,7 @@ static void drm_update_vblank_count(struct drm_device=
 *dev, unsigned int pipe,
>  	store_vblank(dev, pipe, diff, t_vblank, cur_vblank);
>  }
>  =

> -static u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
> +u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
>  	u64 count;
> @@ -497,6 +500,7 @@ static void drm_vblank_init_release(struct drm_device=
 *dev, void *ptr)
>  	drm_WARN_ON(dev, READ_ONCE(vblank->enabled) &&
>  		    drm_core_check_feature(dev, DRIVER_MODESET));
>  =

> +	drm_vblank_destroy_worker(vblank);
>  	del_timer_sync(&vblank->disable_timer);
>  }
>  =

> @@ -539,6 +543,10 @@ int drm_vblank_init(struct drm_device *dev, unsigned=
 int num_crtcs)
>  					       vblank);
>  		if (ret)
>  			return ret;
> +
> +		ret =3D drm_vblank_worker_init(vblank);
> +		if (ret)
> +			return ret;
>  	}
>  =

>  	return 0;
> @@ -1135,7 +1143,7 @@ static int drm_vblank_enable(struct drm_device *dev=
, unsigned int pipe)
>  	return ret;
>  }
>  =

> -static int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
> +int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
>  	unsigned long irqflags;
> @@ -1178,7 +1186,7 @@ int drm_crtc_vblank_get(struct drm_crtc *crtc)
>  }
>  EXPORT_SYMBOL(drm_crtc_vblank_get);
>  =

> -static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
> +void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
>  =

> @@ -1281,13 +1289,16 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>  	unsigned int pipe =3D drm_crtc_index(crtc);
>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
>  	struct drm_pending_vblank_event *e, *t;
> -
>  	ktime_t now;
>  	u64 seq;
>  =

>  	if (drm_WARN_ON(dev, pipe >=3D dev->num_crtcs))
>  		return;
>  =

> +	/*
> +	 * Grab event_lock early to prevent vblank work from being scheduled
> +	 * while we're in the middle of shutting down vblank interrupts
> +	 */
>  	spin_lock_irq(&dev->event_lock);
>  =

>  	spin_lock(&dev->vbl_lock);
> @@ -1324,11 +1335,18 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>  		drm_vblank_put(dev, pipe);
>  		send_vblank_event(dev, e, seq, now);
>  	}
> +
> +	/* Cancel any leftover pending vblank work */
> +	drm_vblank_cancel_pending_works(vblank);
> +
>  	spin_unlock_irq(&dev->event_lock);
>  =

>  	/* Will be reset by the modeset helpers when re-enabling the crtc by
>  	 * calling drm_calc_timestamping_constants(). */
>  	vblank->hwmode.crtc_clock =3D 0;
> +
> +	/* Wait for any vblank work that's still executing to finish */
> +	drm_vblank_flush_worker(vblank);
>  }
>  EXPORT_SYMBOL(drm_crtc_vblank_off);
>  =

> @@ -1363,6 +1381,7 @@ void drm_crtc_vblank_reset(struct drm_crtc *crtc)
>  	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
>  =

>  	drm_WARN_ON(dev, !list_empty(&dev->vblank_event_list));
> +	drm_WARN_ON(dev, !list_empty(&vblank->pending_work));
>  }
>  EXPORT_SYMBOL(drm_crtc_vblank_reset);
>  =

> @@ -1417,7 +1436,10 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
>  	if (drm_WARN_ON(dev, pipe >=3D dev->num_crtcs))
>  		return;
>  =

> -	spin_lock_irqsave(&dev->vbl_lock, irqflags);
> +	/* So vblank works can't be scheduled until we've finished */
> +	spin_lock_irqsave(&dev->event_lock, irqflags);

This smells fishy, why do we need this? drm_enable_vblank takes the
->vblank_time_lock spinlock, which is the first thing drm_handle_vblank
takes, so there's absolute no way for a vblank event or worker to get
ahead of this here.

Except if I'm missing something this isn't needed.

> +
> +	spin_lock(&dev->vbl_lock);
>  	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
>  		    pipe, vblank->enabled, vblank->inmodeset);
>  =

> @@ -1435,7 +1457,9 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
>  	 */
>  	if (atomic_read(&vblank->refcount) !=3D 0 || drm_vblank_offdelay =3D=3D=
 0)
>  		drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
> -	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
> +
> +	spin_unlock(&dev->vbl_lock);
> +	spin_unlock_irqrestore(&dev->event_lock, irqflags);
>  }
>  EXPORT_SYMBOL(drm_crtc_vblank_on);
>  =

> @@ -1589,11 +1613,6 @@ int drm_legacy_modeset_ctl_ioctl(struct drm_device=
 *dev, void *data,
>  	return 0;
>  }
>  =

> -static inline bool vblank_passed(u64 seq, u64 ref)
> -{
> -	return (seq - ref) <=3D (1 << 23);
> -}
> -
>  static int drm_queue_vblank_event(struct drm_device *dev, unsigned int p=
ipe,
>  				  u64 req_seq,
>  				  union drm_wait_vblank *vblwait,
> @@ -1650,7 +1669,7 @@ static int drm_queue_vblank_event(struct drm_device=
 *dev, unsigned int pipe,
>  	trace_drm_vblank_event_queued(file_priv, pipe, req_seq);
>  =

>  	e->sequence =3D req_seq;
> -	if (vblank_passed(seq, req_seq)) {
> +	if (drm_vblank_passed(seq, req_seq)) {
>  		drm_vblank_put(dev, pipe);
>  		send_vblank_event(dev, e, seq, now);
>  		vblwait->reply.sequence =3D seq;
> @@ -1805,7 +1824,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, v=
oid *data,
>  	}
>  =

>  	if ((flags & _DRM_VBLANK_NEXTONMISS) &&
> -	    vblank_passed(seq, req_seq)) {
> +	    drm_vblank_passed(seq, req_seq)) {
>  		req_seq =3D seq + 1;
>  		vblwait->request.type &=3D ~_DRM_VBLANK_NEXTONMISS;
>  		vblwait->request.sequence =3D req_seq;
> @@ -1824,7 +1843,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, v=
oid *data,
>  		drm_dbg_core(dev, "waiting on vblank count %llu, crtc %u\n",
>  			     req_seq, pipe);
>  		wait =3D wait_event_interruptible_timeout(vblank->queue,
> -			vblank_passed(drm_vblank_count(dev, pipe), req_seq) ||
> +			drm_vblank_passed(drm_vblank_count(dev, pipe), req_seq) ||
>  				      !READ_ONCE(vblank->enabled),
>  			msecs_to_jiffies(3000));
>  =

> @@ -1873,7 +1892,7 @@ static void drm_handle_vblank_events(struct drm_dev=
ice *dev, unsigned int pipe)
>  	list_for_each_entry_safe(e, t, &dev->vblank_event_list, base.link) {
>  		if (e->pipe !=3D pipe)
>  			continue;
> -		if (!vblank_passed(seq, e->sequence))
> +		if (!drm_vblank_passed(seq, e->sequence))
>  			continue;
>  =

>  		drm_dbg_core(dev, "vblank event on %llu, current %llu\n",
> @@ -1943,6 +1962,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsi=
gned int pipe)
>  		       !atomic_read(&vblank->refcount));
>  =

>  	drm_handle_vblank_events(dev, pipe);
> +	drm_handle_vblank_works(vblank);
>  =

>  	spin_unlock_irqrestore(&dev->event_lock, irqflags);
>  =

> @@ -2096,7 +2116,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device=
 *dev, void *data,
>  	if (flags & DRM_CRTC_SEQUENCE_RELATIVE)
>  		req_seq +=3D seq;
>  =

> -	if ((flags & DRM_CRTC_SEQUENCE_NEXT_ON_MISS) && vblank_passed(seq, req_=
seq))
> +	if ((flags & DRM_CRTC_SEQUENCE_NEXT_ON_MISS) && drm_vblank_passed(seq, =
req_seq))
>  		req_seq =3D seq + 1;
>  =

>  	e->pipe =3D pipe;
> @@ -2125,7 +2145,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device=
 *dev, void *data,
>  =

>  	e->sequence =3D req_seq;
>  =

> -	if (vblank_passed(seq, req_seq)) {
> +	if (drm_vblank_passed(seq, req_seq)) {
>  		drm_crtc_vblank_put(crtc);
>  		send_vblank_event(dev, e, seq, now);
>  		queue_seq->sequence =3D seq;
> @@ -2145,3 +2165,4 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device=
 *dev, void *data,
>  	kfree(e);
>  	return ret;
>  }
> +
> diff --git a/drivers/gpu/drm/drm_vblank_internal.h b/drivers/gpu/drm/drm_=
vblank_internal.h
> new file mode 100644
> index 0000000000000..217ae5442ddce
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_vblank_internal.h
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: MIT
> +
> +#ifndef DRM_VBLANK_INTERNAL_H
> +#define DRM_VBLANK_INTERNAL_H
> +
> +#include <linux/types.h>
> +
> +#include <drm/drm_device.h>
> +
> +static inline bool drm_vblank_passed(u64 seq, u64 ref)
> +{
> +	return (seq - ref) <=3D (1 << 23);
> +}
> +
> +int drm_vblank_get(struct drm_device *dev, unsigned int pipe);
> +void drm_vblank_put(struct drm_device *dev, unsigned int pipe);
> +u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe);
> +
> +#endif /* !DRM_VBLANK_INTERNAL_H */
> diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vbla=
nk_work.c
> new file mode 100644
> index 0000000000000..0762ad34cdcc0
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_vblank_work.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: MIT
> +
> +#include <uapi/linux/sched/types.h>
> +
> +#include <drm/drm_print.h>
> +#include <drm/drm_vblank.h>
> +#include <drm/drm_vblank_work.h>
> +#include <drm/drm_crtc.h>
> +
> +#include "drm_vblank_internal.h"
> +#include "drm_vblank_work_internal.h"
> +
> +/**
> + * DOC: vblank works
> + *
> + * Many DRM drivers need to program hardware in a time-sensitive manner,=
 many
> + * times with a deadline of starting and finishing within a certain regi=
on of
> + * the scanout. Most of the time the safest way to accomplish this is to
> + * simply do said time-sensitive programming in the driver's IRQ handler,
> + * which allows drivers to avoid being preempted during these critical
> + * regions. Or even better, the hardware may even handle applying such
> + * time-critical programming independently of the CPU.
> + *
> + * While there's a decent amount of hardware that's designed so that the=
 CPU
> + * doesn't need to be concerned with extremely time-sensitive programmin=
g,
> + * there's a few situations where it can't be helped. Some unforgiving
> + * hardware may require that certain time-sensitive programming be handl=
ed
> + * completely by the CPU, and said programming may even take too long to
> + * handle in an IRQ handler. Another such situation would be where the d=
river
> + * needs to perform a task that needs to complete within a specific scan=
out
> + * period, but might possibly block and thus cannot be handled in an IRQ
> + * context. Both of these situations can't be solved perfectly in Linux =
since
> + * we're not a realtime kernel, and thus the scheduler may cause us to m=
iss
> + * our deadline if it decides to preempt us. But for some drivers, it's =
good
> + * enough if we can lower our chance of being preempted to an absolute
> + * minimum.
> + *
> + * This is where &drm_vblank_work comes in. &drm_vblank_work provides a =
simple
> + * generic delayed work implementation which delays work execution until=
 a
> + * particular vblank has passed, and then executes the work at realtime
> + * priority. This provides the best possible chance at performing
> + * time-sensitive hardware programming on time, even when the system is =
under
> + * heavy load. &drm_vblank_work also supports rescheduling, so that self
> + * re-arming work items can be easily implemented.
> + */
> +
> +void drm_handle_vblank_works(struct drm_vblank_crtc *vblank)
> +{
> +	struct drm_vblank_work *work, *next;
> +	u64 count =3D atomic64_read(&vblank->count);
> +	bool wake =3D false;
> +
> +	assert_spin_locked(&vblank->dev->event_lock);
> +
> +	list_for_each_entry_safe(work, next, &vblank->pending_work, node) {
> +		if (!drm_vblank_passed(count, work->count))
> +			continue;
> +
> +		list_del_init(&work->node);
> +		drm_vblank_put(vblank->dev, vblank->pipe);
> +		kthread_queue_work(vblank->worker, &work->base);
> +		wake =3D true;
> +	}
> +	if (wake)
> +		wake_up_all(&vblank->work_wait_queue);
> +}
> +
> +/* Handle cancelling any pending vblank work items and drop respective v=
blank
> + * references in response to vblank interrupts being disabled.
> + */
> +void drm_vblank_cancel_pending_works(struct drm_vblank_crtc *vblank)
> +{
> +	struct drm_vblank_work *work, *next;
> +
> +	assert_spin_locked(&vblank->dev->event_lock);
> +
> +	list_for_each_entry_safe(work, next, &vblank->pending_work, node) {
> +		list_del_init(&work->node);
> +		drm_vblank_put(vblank->dev, vblank->pipe);
> +	}
> +
> +	wake_up_all(&vblank->work_wait_queue);
> +}
> +
> +/**
> + * drm_vblank_work_schedule - schedule a vblank work
> + * @work: vblank work to schedule
> + * @count: target vblank count
> + * @nextonmiss: defer until the next vblank if target vblank was missed
> + *
> + * Schedule @work for execution once the crtc vblank count reaches @coun=
t.
> + *
> + * If the crtc vblank count has already reached @count and @nextonmiss is
> + * %false the work starts to execute immediately.
> + *
> + * If the crtc vblank count has already reached @count and @nextonmiss is
> + * %true the work is deferred until the next vblank (as if @count has be=
en
> + * specified as crtc vblank count + 1).
> + *
> + * If @work is already scheduled, this function will reschedule said work
> + * using the new @count.

Maybe clarify here that "This can be use for self-rearming work items." or
something like that.

> + *
> + * Returns:
> + * 0 on success, error code on failure.
> + */
> +int drm_vblank_work_schedule(struct drm_vblank_work *work,
> +			     u64 count, bool nextonmiss)
> +{
> +	struct drm_vblank_crtc *vblank =3D work->vblank;
> +	struct drm_device *dev =3D vblank->dev;
> +	u64 cur_vbl;
> +	unsigned long irqflags;
> +	bool passed, rescheduling =3D false, wake =3D false;
> +	int ret =3D 0;
> +
> +	spin_lock_irqsave(&dev->event_lock, irqflags);
> +	if (!vblank->worker || vblank->inmodeset || work->cancelling)

Oh nice catch with ->inmodeset, I totally missed to check re-arming vs
drm_crtc_vblank_off races. Only problem I'm seeing is that we're holding
the wrong spinlock, this needs to be check under ->vbl_lock. But
->cancelling needs the event_lock, so I think you need to split this check
into two, and grab the ->vbl_lock around the ->inmodeset check.

The ->worker check otoh looks fishy, that should never happen. If you feel
like some defensive programming then I think that should be an

	if (WARN_ON(!vblank->worker))
		return;


> +		goto out;
> +
> +	if (list_empty(&work->node)) {
> +		ret =3D drm_vblank_get(dev, vblank->pipe);

Ok that kills the idea of converting the _irqsave to _irq in
drm_vblank_get. I do wonder whether it wouldn't be nicer to have the
vblank_get outside of the spinlock, and unconditional - would allow you to
drop the ->inmodeset check. But the end result in code flow cleanliness is
not any better, so not a good idea I think.

> +		if (ret < 0)
> +			goto out;
> +	} else if (work->count =3D=3D count) {
> +		/* Already scheduled w/ same vbl count */
> +		goto out;
> +	} else {
> +		rescheduling =3D true;
> +	}
> +
> +	work->count =3D count;
> +	cur_vbl =3D drm_vblank_count(dev, vblank->pipe);
> +	passed =3D drm_vblank_passed(cur_vbl, count);
> +	if (passed)
> +		DRM_DEV_ERROR(dev->dev,
> +			      "crtc %d vblank %llu already passed (current %llu)\n",
> +			      vblank->pipe, count, cur_vbl);

This is a bit loud, I think that should be debug out most. You can't
really prevent races. I do wonder though whether we should do something
like 1 indicates that the work item has been scheduled, and 0 that it
hasn't been scheduled (aside from failure, which is negative).

> +
> +	if (!nextonmiss && passed) {
> +		drm_vblank_put(dev, vblank->pipe);
> +		kthread_queue_work(vblank->worker, &work->base);
> +
> +		if (rescheduling) {
> +			list_del_init(&work->node);
> +			wake =3D true;
> +		}
> +	} else if (!rescheduling) {
> +		list_add_tail(&work->node, &vblank->pending_work);
> +	}
> +
> +out:
> +	spin_unlock_irqrestore(&dev->event_lock, irqflags);
> +	if (wake)
> +		wake_up_all(&vblank->work_wait_queue);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_vblank_work_schedule);

I think the above control flow is all correct, but this is the kind of
stuff that's prime material for some selftests. But we don't have enough
ready-made mocking I think, so not going to ask for that. Just an idea.

> +
> +/**
> + * drm_vblank_work_cancel_sync - cancel a vblank work and wait for it to
> + * finish executing
> + * @work: vblank work to cancel
> + *
> + * Cancel an already scheduled vblank work and wait for its
> + * execution to finish.
> + *
> + * On return, @work is guaranteed to no longer be scheduled or running, =
even
> + * if it's self-arming.
> + *
> + * Returns:
> + * %True if the work was cancelled before it started to execute, %false
> + * otherwise.
> + */
> +bool drm_vblank_work_cancel_sync(struct drm_vblank_work *work)
> +{
> +	struct drm_vblank_crtc *vblank =3D work->vblank;
> +	struct drm_device *dev =3D vblank->dev;
> +	bool ret =3D false;
> +
> +	spin_lock_irq(&dev->event_lock);
> +	if (!list_empty(&work->node)) {
> +		list_del_init(&work->node);
> +		drm_vblank_put(vblank->dev, vblank->pipe);
> +		ret =3D true;
> +	}
> +
> +	work->cancelling++;
> +	spin_unlock_irq(&dev->event_lock);
> +
> +	wake_up_all(&vblank->work_wait_queue);
> +
> +	if (kthread_cancel_work_sync(&work->base))
> +		ret =3D true;
> +
> +	spin_lock_irq(&dev->event_lock);
> +	work->cancelling--;
> +	spin_unlock_irq(&dev->event_lock);

lgtm, everything looks ordered correctly to avoid a self-arming work
escaping.

> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_vblank_work_cancel_sync);
> +
> +/**
> + * drm_vblank_work_flush - wait for a scheduled vblank work to finish
> + * executing
> + * @work: vblank work to flush
> + *
> + * Wait until @work has finished executing once.
> + */
> +void drm_vblank_work_flush(struct drm_vblank_work *work)
> +{
> +	struct drm_vblank_crtc *vblank =3D work->vblank;
> +	struct drm_device *dev =3D vblank->dev;
> +
> +	spin_lock_irq(&dev->event_lock);
> +	wait_event_lock_irq(vblank->work_wait_queue, list_empty(&work->node),
> +			    dev->event_lock);
> +	spin_unlock_irq(&dev->event_lock);
> +
> +	kthread_flush_work(&work->base);

So much less magic here, I like.

> +}
> +EXPORT_SYMBOL(drm_vblank_work_flush);
> +
> +/**
> + * drm_vblank_work_init - initialize a vblank work item
> + * @work: vblank work item
> + * @crtc: CRTC whose vblank will trigger the work execution
> + * @func: work function to be executed
> + *
> + * Initialize a vblank work item for a specific crtc.
> + */
> +void drm_vblank_work_init(struct drm_vblank_work *work, struct drm_crtc =
*crtc,
> +			  void (*func)(struct kthread_work *work))
> +{
> +	kthread_init_work(&work->base, func);
> +	INIT_LIST_HEAD(&work->node);
> +	work->vblank =3D &crtc->dev->vblank[drm_crtc_index(crtc)];
> +}
> +EXPORT_SYMBOL(drm_vblank_work_init);
> +
> +int drm_vblank_worker_init(struct drm_vblank_crtc *vblank)
> +{
> +	struct sched_param param =3D {
> +		.sched_priority =3D MAX_RT_PRIO - 1,
> +	};
> +	struct kthread_worker *worker;
> +
> +	INIT_LIST_HEAD(&vblank->pending_work);
> +	init_waitqueue_head(&vblank->work_wait_queue);
> +	worker =3D kthread_create_worker(0, "card%d-crtc%d",
> +				       vblank->dev->primary->index,
> +				       vblank->pipe);
> +	if (IS_ERR(worker))
> +		return PTR_ERR(worker);
> +
> +	vblank->worker =3D worker;
> +
> +	return sched_setscheduler(vblank->worker->task, SCHED_FIFO, &param);
> +}
> diff --git a/drivers/gpu/drm/drm_vblank_work_internal.h b/drivers/gpu/drm=
/drm_vblank_work_internal.h
> new file mode 100644
> index 0000000000000..0a4abbc4ab295
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_vblank_work_internal.h
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: MIT
> +
> +#ifndef _DRM_VBLANK_WORK_INTERNAL_H_
> +#define _DRM_VBLANK_WORK_INTERNAL_H_
> +
> +#include <drm/drm_vblank.h>
> +
> +int drm_vblank_worker_init(struct drm_vblank_crtc *vblank);
> +void drm_vblank_cancel_pending_works(struct drm_vblank_crtc *vblank);
> +void drm_handle_vblank_works(struct drm_vblank_crtc *vblank);
> +
> +static inline void drm_vblank_flush_worker(struct drm_vblank_crtc *vblan=
k)
> +{
> +	if (vblank->worker)

Is this check really required? We should always have a worker I thought?

> +		kthread_flush_worker(vblank->worker);
> +}
> +
> +static inline void drm_vblank_destroy_worker(struct drm_vblank_crtc *vbl=
ank)
> +{
> +	if (vblank->worker)

Same here.

> +		kthread_destroy_worker(vblank->worker);
> +}
> +
> +#endif /* !_DRM_VBLANK_WORK_INTERNAL_H_ */
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index dd9f5b9e56e4e..dd125f8c766cf 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -27,12 +27,14 @@
>  #include <linux/seqlock.h>
>  #include <linux/idr.h>
>  #include <linux/poll.h>
> +#include <linux/kthread.h>
>  =

>  #include <drm/drm_file.h>
>  #include <drm/drm_modes.h>
>  =

>  struct drm_device;
>  struct drm_crtc;
> +struct drm_vblank_work;
>  =

>  /**
>   * struct drm_pending_vblank_event - pending vblank event tracking
> @@ -203,6 +205,24 @@ struct drm_vblank_crtc {
>  	 * disabling functions multiple times.
>  	 */
>  	bool enabled;
> +
> +	/**
> +	 * @worker: The &kthread_worker used for executing vblank works.
> +	 */
> +	struct kthread_worker *worker;
> +
> +	/**
> +	 * @pending_work: A list of scheduled &drm_vblank_work items that are
> +	 * waiting for a future vblank.
> +	 */
> +	struct list_head pending_work;
> +
> +	/**
> +	 * @work_wait_queue: The wait queue used for signaling that a
> +	 * &drm_vblank_work item has either finished executing, or was
> +	 * cancelled.
> +	 */
> +	wait_queue_head_t work_wait_queue;
>  };
>  =

>  int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs);
> diff --git a/include/drm/drm_vblank_work.h b/include/drm/drm_vblank_work.h
> new file mode 100644
> index 0000000000000..f0439c039f7ce
> --- /dev/null
> +++ b/include/drm/drm_vblank_work.h
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: MIT
> +
> +#ifndef _DRM_VBLANK_WORK_H_
> +#define _DRM_VBLANK_WORK_H_
> +
> +#include <linux/kthread.h>
> +
> +struct drm_crtc;
> +
> +/**
> + * struct drm_vblank_work - A delayed work item which delays until a tar=
get
> + * vblank passes, and then executes at realtime priority outside of IRQ
> + * context.
> + *
> + * See also:
> + * drm_vblank_work_schedule()
> + * drm_vblank_work_init()
> + * drm_vblank_work_cancel_sync()
> + * drm_vblank_work_flush()
> + */
> +struct drm_vblank_work {
> +	/**
> +	 * @base: The base &kthread_work item which will be executed by
> +	 * &drm_vblank_crtc.worker. Drivers should not interact with this
> +	 * directly, and instead rely on drm_vblank_work_init() to initialize
> +	 * this.
> +	 */
> +	struct kthread_work base;
> +
> +	/**
> +	 * @vblank: A pointer to &drm_vblank_crtc this work item belongs to.
> +	 */
> +	struct drm_vblank_crtc *vblank;
> +
> +	/**
> +	 * @count: The target vblank this work will execute on. Drivers should
> +	 * not modify this value directly, and instead use
> +	 * drm_vblank_work_schedule()
> +	 */
> +	u64 count;
> +
> +	/**
> +	 * @cancelling: The number of drm_vblank_work_cancel_sync() calls that
> +	 * are currently running. A work item cannot be rescheduled until all
> +	 * calls have finished.
> +	 */
> +	int cancelling;
> +
> +	/**
> +	 * @node: The position of this work item in
> +	 * &drm_vblank_crtc.pending_work.
> +	 */
> +	struct list_head node;
> +};
> +
> +/**
> + * to_drm_vblank_work - Retrieve the respective &drm_vblank_work item fr=
om a
> + * &kthread_work
> + * @_work: The &kthread_work embedded inside a &drm_vblank_work
> + */
> +#define to_drm_vblank_work(_work) \
> +	container_of((_work), struct drm_vblank_work, base)
> +
> +int drm_vblank_work_schedule(struct drm_vblank_work *work,
> +			     u64 count, bool nextonmiss);
> +void drm_vblank_work_init(struct drm_vblank_work *work, struct drm_crtc =
*crtc,
> +			  void (*func)(struct kthread_work *work));
> +bool drm_vblank_work_cancel_sync(struct drm_vblank_work *work);
> +void drm_vblank_work_flush(struct drm_vblank_work *work);
> +
> +#endif /* !_DRM_VBLANK_WORK_H_ */
> -- =

> 2.26.2
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
