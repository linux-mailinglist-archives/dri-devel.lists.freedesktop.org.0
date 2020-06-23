Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF38205831
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 19:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16206E43C;
	Tue, 23 Jun 2020 17:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBCF6E43C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 17:04:15 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id g18so12285303wrm.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 10:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=L5fFBdU/xElidZoFCiGurv+f6yejjTqnHOKQFNezkTI=;
 b=K84hCkUInUV+mfxAxNY2tA3sv2WE64yRNevBfvQpSyxMERLEQMpdnV4of09/bZPkuM
 LT2czQ2NIWw44G/uwHYMSvFTtF6/XQU2YZmpQv1ZY9M0N664CrsqIbtto9kQSuhB/0mH
 aJUCzfOAioaZqoBZ/9rAzGX/9JGJ4YKssocqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=L5fFBdU/xElidZoFCiGurv+f6yejjTqnHOKQFNezkTI=;
 b=unIZJ3kba5zZqgdA/U+ksk5yj+ZHbaP8hJtXDv0pKsrhzT9ypCos/kgJ2tJTPMcLOG
 T9qr3A4bxpf2RP5d7CkKDD/o/zKMecnPLmPji7o+0e1BL7tVBA+WvS69jIid3OVuhAia
 a6pE8sEW4NP673Y967OvmEftCNcTqb9U0TUMGZJyCA1PGgvskLYq3kIwzRXmFaWE++Dn
 TTuC+oGTRDApafPoUPLO7rAWBKwUTZpboQMl/gnH3L79r7kdM2PQOBZYFJBH9glUPBsA
 d2PvCEoPCbUPPM7/zhVltPwV9Elx+RDXiBPbJX6XgOOOjH8aspQ+MMhVnJPpDlDSliBa
 fHNw==
X-Gm-Message-State: AOAM530nvDIiF6eNaydzec6U0Phq0CAEN2bTgbI6A1H6dwkoweOGC64C
 PVvWK8eu9tS57pHzHpXZaxN8aQ==
X-Google-Smtp-Source: ABdhPJwxs+jSvQXM2yELu4tJNDAitcvKrsNagY/8yyz51Y9OKGQxgzQeKKzEcioqAiD38fSSgfZzmA==
X-Received: by 2002:adf:8b5a:: with SMTP id v26mr25995548wra.165.1592931854276; 
 Tue, 23 Jun 2020 10:04:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r1sm15336537wrt.73.2020.06.23.10.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 10:04:13 -0700 (PDT)
Date: Tue, 23 Jun 2020 19:04:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RFC v5 02/10] drm/vblank: Add vblank works
Message-ID: <20200623170411.GO20149@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Tejun Heo <tj@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20200622200730.120716-1-lyude@redhat.com>
 <20200622200730.120716-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622200730.120716-3-lyude@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 22, 2020 at 04:07:22PM -0400, Lyude Paul wrote:
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

> [based off patches from Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>,
> change below to signoff later]
> =

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
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Ok, I think this melted my brain a bit, but I tried to review this
carefully. Bunch of suggestions to simplify the flow, but might also
simply be that I missed something and my suggestions dont work at all.

Thanks for doing all this!

Cheers, Daniel

> ---
>  drivers/gpu/drm/drm_vblank.c | 266 +++++++++++++++++++++++++++++++++++
>  include/drm/drm_vblank.h     |  49 +++++++
>  2 files changed, 315 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index ce5c1e1d29963..4d76eb2fed5e9 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -25,7 +25,9 @@
>   */
>  =

>  #include <linux/export.h>
> +#include <linux/kthread.h>
>  #include <linux/moduleparam.h>
> +#include <uapi/linux/sched/types.h>
>  =

>  #include <drm/drm_crtc.h>
>  #include <drm/drm_drv.h>
> @@ -155,6 +157,8 @@
>  static bool
>  drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
>  			  ktime_t *tvblank, bool in_vblank_irq);
> +static int drm_vblank_get(struct drm_device *dev, unsigned int pipe);
> +static void drm_vblank_put(struct drm_device *dev, unsigned int pipe);
>  =

>  static unsigned int drm_timestamp_precision =3D 20;  /* Default to 20 us=
ecs. */
>  =

> @@ -490,6 +494,35 @@ static void vblank_disable_fn(struct timer_list *t)
>  	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
>  }
>  =

> +static void drm_vblank_work_release(struct drm_vblank_crtc *vblank)
> +{
> +	struct kthread_worker *worker =3D vblank->worker;
> +	struct drm_vblank_work *work, *tmp;
> +	bool wake =3D false;
> +
> +	if (!worker)
> +		return;
> +
> +	spin_lock_irq(&vblank->work_lock);
> +	vblank->worker =3D NULL;
> +
> +	list_for_each_entry_safe(work, tmp, &vblank->pending_work, node) {
> +		drm_vblank_put(vblank->dev, vblank->pipe);
> +		list_del(&work->node);
> +
> +		if (!--work->pending) {
> +			write_seqcount_invalidate(&work->seqcount);
> +			wake =3D true;
> +		}
> +	}
> +
> +	spin_unlock_irq(&vblank->work_lock);
> +
> +	if (wake)
> +		wake_up_all(&vblank->work_wait_queue);

So drmm_ is for cleaning up software stuff, but the above is for cleaning
up vblank callbacks and things. Those should all be cleaned up and stop
after the hardware is gone.

If you look at drm_crtc_vblank_off, that already has code to send out any
pending vblank events. I think that's also where we should clean up any
leaked vblank worker things, to make sure they don't get re-queued. Once
the vblank is off it shouldn't be possible to have new stuff enqueued.

In vblank_off we probably want an additional kthrea_flush_worker() to make
sure nothing spills out.

> +	kthread_destroy_worker(worker);

This one looks good here I think, but maybe just inline it since it's
just one line after you moved the cleanup.

> +}
> +
>  static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
>  {
>  	struct drm_vblank_crtc *vblank =3D ptr;
> @@ -497,9 +530,66 @@ static void drm_vblank_init_release(struct drm_devic=
e *dev, void *ptr)
>  	drm_WARN_ON(dev, READ_ONCE(vblank->enabled) &&
>  		    drm_core_check_feature(dev, DRIVER_MODESET));
>  =

> +	drm_vblank_work_release(vblank);
>  	del_timer_sync(&vblank->disable_timer);
>  }
>  =

> +static void vblank_work_fn(struct kthread_work *base)
> +{
> +	struct drm_vblank_work *work =3D
> +		container_of(base, struct drm_vblank_work, base);
> +	struct drm_vblank_crtc *vblank =3D work->vblank;
> +
> +	work->func(work);
> +
> +	spin_lock_irq(&vblank->work_lock);
> +	work->pending--;
> +
> +	write_seqcount_invalidate(&work->seqcount);
> +	wake_up_all(&vblank->work_wait_queue);
> +	spin_unlock_irq(&vblank->work_lock);
> +}
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
> +			  void (*func)(struct drm_vblank_work *work))
> +{

Hm I think a WARN_ON(work->func) would be nice here, just for paranoia.
Nothing good happens if we reinit a life work.

Also disappointingly no object debugging support in kthread_work, not sure
whether it's worth the bother to set that up.

> +	kthread_init_work(&work->base, vblank_work_fn);
> +	work->func =3D func;
> +	INIT_LIST_HEAD(&work->node);
> +	seqcount_init(&work->seqcount);
> +	work->vblank =3D &crtc->dev->vblank[drm_crtc_index(crtc)];
> +}
> +EXPORT_SYMBOL(drm_vblank_work_init);
> +
> +static int vblank_worker_init(struct drm_vblank_crtc *vblank)
> +{
> +	struct sched_param param =3D {
> +		.sched_priority =3D MAX_RT_PRIO - 1,
> +	};
> +	struct kthread_worker *worker;
> +
> +	INIT_LIST_HEAD(&vblank->pending_work);
> +	spin_lock_init(&vblank->work_lock);

Do we really need our own spinlock here? If we align vblank work with
vblank events as much as possible I think can fully piggy-pack on top of
vblank->event_lock.

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
> +
>  /**
>   * drm_vblank_init - initialize vblank support
>   * @dev: DRM device
> @@ -539,6 +629,10 @@ int drm_vblank_init(struct drm_device *dev, unsigned=
 int num_crtcs)
>  					       vblank);
>  		if (ret)
>  			return ret;
> +
> +		ret =3D vblank_worker_init(vblank);
> +		if (ret)
> +			return ret;
>  	}
>  =

>  	return 0;
> @@ -1891,6 +1985,24 @@ static void drm_handle_vblank_events(struct drm_de=
vice *dev, unsigned int pipe)
>  	trace_drm_vblank_event(pipe, seq, now, high_prec);
>  }
>  =

> +static void drm_handle_vblank_works(struct drm_vblank_crtc *vblank)
> +{
> +	struct drm_vblank_work *work, *next;
> +	u64 count =3D atomic64_read(&vblank->count);
> +
> +	spin_lock(&vblank->work_lock);
> +	list_for_each_entry_safe(work, next, &vblank->pending_work, node) {
> +		if (!vblank_passed(count, work->count))
> +			continue;
> +
> +		list_del_init(&work->node);
> +		drm_vblank_put(vblank->dev, vblank->pipe);
> +		if (!kthread_queue_work(vblank->worker, &work->base))
> +			work->pending--;
> +	}
> +	spin_unlock(&vblank->work_lock);
> +}
> +
>  /**
>   * drm_handle_vblank - handle a vblank event
>   * @dev: DRM device
> @@ -1932,6 +2044,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsi=
gned int pipe)
>  =

>  	spin_unlock(&dev->vblank_time_lock);
>  =

> +	drm_handle_vblank_works(vblank);

Just for symmetry I'd put that right next to drm_handle_vblank_events.

>  	wake_up(&vblank->queue);
>  =

>  	/* With instant-off, we defer disabling the interrupt until after
> @@ -2146,3 +2259,156 @@ int drm_crtc_queue_sequence_ioctl(struct drm_devi=
ce *dev, void *data,
>  	kfree(e);
>  	return ret;
>  }
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
> +	bool passed, rescheduling =3D false;
> +	int ret =3D 0;
> +
> +	spin_lock_irqsave(&vblank->work_lock, irqflags);
> +	if (!vblank->worker || work->cancelling)
> +		goto out;
> +
> +	if (list_empty(&work->node)) {
> +		ret =3D drm_vblank_get(dev, vblank->pipe);
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
> +	passed =3D vblank_passed(cur_vbl, count);
> +	if (passed)
> +		DRM_ERROR("crtc %d vblank %llu already passed (current %llu)\n",
> +			  vblank->pipe, count, cur_vbl);
> +
> +	if (!nextonmiss && passed) {
> +		drm_vblank_put(dev, vblank->pipe);
> +		work->pending +=3D kthread_queue_work(vblank->worker,
> +						    &work->base);
> +		if (rescheduling) {
> +			list_del_init(&work->node);
> +			work->pending--;
> +		}
> +	} else if (rescheduling) {
> +		list_move_tail(&work->node, &vblank->pending_work);

Not sure this matters, we walk the entire list anyway. Just complicates
the code. The other thing which I think can be simplified is the ->pending
tracking. If I'm reading everything correctly then ->pending is only ever
1 or 0, so changing it to a boolean and setting it here like


	work->pending =3D !ret;

Plus setting it explicitly instead of increments/decrements in all other
places should make this a pile easier to understand I think.

> +	} else {
> +		list_add_tail(&work->node, &vblank->pending_work);
> +		work->pending++;
> +	}
> +
> + out:
> +	spin_unlock_irqrestore(&vblank->work_lock, irqflags);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_vblank_work_schedule);
> +
> +/**
> + * drm_vblank_work_cancel_sync - cancel a vblank work and wait for it to
> + * finish executing
> + * @work: vblank work to cancel
> + *
> + * Cancel an already scheduled vblank work and wait for its
> + * execution to finish.
> + *
> + * On return @work is no longer guaraneed to be executing.

I think this is confusing wording. I think what it should say is that we
guarantee it's not longer running, even when it's self-arming. That's what
the entire _sync suffix is all about.

What you wrote is more like "We'll try cancel it once, but if it's
self-arming it might still be running", so just normal _cancel.

> + *
> + * Returns:
> + * %True if the work was cancelled before it started to execute, %false
> + * otherwise.
> + */
> +bool drm_vblank_work_cancel_sync(struct drm_vblank_work *work)
> +{
> +	struct drm_vblank_crtc *vblank =3D work->vblank;
> +	bool ret =3D false, cancelled, queued;
> +
> +	spin_lock_irq(&vblank->work_lock);
> +
> +	if (!list_empty(&work->node)) {
> +		list_del_init(&work->node);
> +		drm_vblank_put(vblank->dev, vblank->pipe);
> +		work->pending--;
> +		ret =3D true;
> +	}
> +
> +	queued =3D work->pending;
> +	if (queued)

So if I'm reading the code correctly, then we do all the pending tracking
just for this condition here. Given that performance for cancel_sync
doesn't matter, can't we just unconditionally do the full cancelling? It
would simplify the code a bunch.

Or am I missing something.

> +		work->cancelling++;
> +	spin_unlock_irq(&vblank->work_lock);
> +
> +	if (!queued)
> +		return false;
> +
> +	cancelled =3D kthread_cancel_work_sync(&work->base);
> +
> +	spin_lock_irq(&vblank->work_lock);
> +	if (cancelled) {
> +		ret =3D true;
> +		work->pending--;
> +	}
> +
> +	write_seqcount_invalidate(&work->seqcount);
> +	wake_up_all(&vblank->work_wait_queue);
> +
> +	work->cancelling--;
> +	drm_WARN_ON_ONCE(vblank->dev, work->pending);
> +	spin_unlock_irq(&vblank->work_lock);
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
> +	unsigned int seq;
> +
> +	seq =3D read_seqcount_begin(&work->seqcount);
> +	if (!work->pending)
> +		return;
> +
> +	/* Once the sequence counter has changed, our work instance has
> +	 * finished
> +	 */
> +	wait_event(vblank->work_wait_queue,
> +		   read_seqcount_retry(&work->seqcount, seq));

Uh abusing a locking primitive as an event queue ...

So maybe ignore my comment above about removing ->pending completely (we
can still simplify cancel_sync, I think that would help readability), you
can just wait on wait->pending. wake_up and wait_event have all the
required barriers to make this work. So roughly

	wait_event(vblank->work_wait_queue,
		   !READ_ONCE(work->pending)));

Also becaue this all works with barriers and ordering, and not locking,
it's imo much clearer if you pull all the wake_up() calls out from under
the spinlock protection.

> +}
> +EXPORT_SYMBOL(drm_vblank_work_flush);
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index dd9f5b9e56e4e..b1cd6ee9f5b65 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -27,6 +27,7 @@
>  #include <linux/seqlock.h>
>  #include <linux/idr.h>
>  #include <linux/poll.h>
> +#include <linux/kthread.h>
>  =

>  #include <drm/drm_file.h>
>  #include <drm/drm_modes.h>
> @@ -203,8 +204,56 @@ struct drm_vblank_crtc {
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
> +	 * @work_lock: The spinlock that protects @pending_work, along with
> +	 * any modifications to &drm_vblank_work items
> +	 */
> +	spinlock_t work_lock;
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

> +struct drm_vblank_work {

Kerneldoc for this entire thing would be nice, since that's the part
drivers use. On the kerneldoc side of things, I think drm_vblank.c is
already fairly big, and fairly tricky for driver writers to understand.
I'm feeling a bit like doing a separate drm_vblank_work.[hc], with
seperate section for them in the docs plus small intro section would be
great. Or at least add a new separate overview section for vblank work,
with 1-2 sentences or so for main functions and this datastructure here.

Othewise this nice stuff you're creating will be too hard to find for
others I think :-/

> +	struct kthread_work base;
> +	void (*func)(struct drm_vblank_work *work);
> +	struct drm_vblank_crtc *vblank;
> +	u64 count;
> +
> +	int cancelling; /* The number of cancelling calls currently running */
> +	u8 pending; /* How many instances of this work item are pending */
> +
> +	/* Updated every time this work item finishes executing or is
> +	 * cancelled.
> +	 */
> +	seqcount_t seqcount;
> +
> +	struct list_head node;
> +};
> +
> +int drm_vblank_work_schedule(struct drm_vblank_work *work,
> +			     u64 count, bool nextonmiss);
> +void drm_vblank_work_init(struct drm_vblank_work *work, struct drm_crtc =
*crtc,
> +			  void (*func)(struct drm_vblank_work *work));
> +bool drm_vblank_work_cancel_sync(struct drm_vblank_work *work);
> +void drm_vblank_work_flush(struct drm_vblank_work *work);
> +
>  int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs);
>  bool drm_dev_has_vblank(const struct drm_device *dev);
>  u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
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
