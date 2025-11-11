Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64F4C4C798
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 09:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C521F10E50F;
	Tue, 11 Nov 2025 08:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="inMmgRei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F162210E50E;
 Tue, 11 Nov 2025 08:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762851225; x=1794387225;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jGP/sxMGR7sf/72AqOyYmMGknYlpEmOtOgdqpI7v2dc=;
 b=inMmgReiLqa7JRB38+V94mPMflY039hj6snBpknCjyUOVrqQL/oZc9tR
 F5jXBH/dkZx+3I4wNPglhG5tTnM4Wwf5TFepei5X24JZSPC+WEyM/ubb7
 9xS+V8EhyHa/t8elXVqBtI1Lt2OnGyRYeThyT15kR9JGVFCUy83NsPDC2
 9r31miGIa896iMzS0HLGl9QQWE8sVHlpmhg7jYFSFMIx/uBxIvz7zA715
 hBOuIT0LIW4VIff/9Sdg7B3Siu0bsTeXHYttgtheO38P5/OCH9cfyjRAL
 pCJgPjPRN/00SN8kgN3bKZ4U4YoTGkTiqnfuzJxf9zjIlaI0zRjdkMrqu Q==;
X-CSE-ConnectionGUID: G8/sgJUVRJis05gQNWXzjQ==
X-CSE-MsgGUID: x8wroiTZQ96YRmit9c+Nug==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64613399"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64613399"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:53:44 -0800
X-CSE-ConnectionGUID: bN0dqx0JQ0G8+UcjXm4UfA==
X-CSE-MsgGUID: Bt51NFT5Qa2M7ePs09eIRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="219630720"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:53:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 07/24] drm/vblank: pass vlank to
 drm_vblank_get()/_put()/_count()
In-Reply-To: <6845f801-2105-4500-b088-3f53bbab63ba@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1762791343.git.jani.nikula@intel.com>
 <0bc4fa981f31122651abc13e5b6b8d92bbc9585a.1762791343.git.jani.nikula@intel.com>
 <6845f801-2105-4500-b088-3f53bbab63ba@suse.de>
Date: Tue, 11 Nov 2025 10:53:39 +0200
Message-ID: <bb68557c6c473d96cb93681a5eb731ff1dfa9437@intel.com>
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

On Tue, 11 Nov 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> s/vlank/vblank in the commit headline
>
> Am 10.11.25 um 17:17 schrieb Jani Nikula:
>> Pass struct drm_vblank_crtc * to drm_vblank_get(), drm_vblank_put(), and
>> drm_vblank_count(). They'll figure out the vblank pointer as the first
>> thing anyway, so it's handy to pass it when available. We can also rely
>> on vblank having a valid pipe, and can reduce the number of checks we
>> do.
>
> I do agree that drm_vblank_crtc should be out go-to structure for these 
> interfaces with wrappers around that do the lookup if necessary.
>
>>
>> Add underscore prefixed helpers for using dev/pipe until we've converted
>> all users to pass in the vblank. Directly convert the call sites that
>> already have the vblank pointer available.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/drm_internal.h    |  6 +--
>>   drivers/gpu/drm/drm_vblank.c      | 77 ++++++++++++++++++-------------
>>   drivers/gpu/drm/drm_vblank_work.c | 12 ++---
>>   3 files changed, 55 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>> index 5a3bed48ab1f..e9c85c3681f1 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -101,9 +101,9 @@ static inline bool drm_vblank_passed(u64 seq, u64 ref)
>>   }
>>   
>>   void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe);
>> -int drm_vblank_get(struct drm_device *dev, unsigned int pipe);
>> -void drm_vblank_put(struct drm_device *dev, unsigned int pipe);
>> -u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe);
>> +int drm_vblank_get(struct drm_vblank_crtc *vblank);
>> +void drm_vblank_put(struct drm_vblank_crtc *vblank);
>> +u64 drm_vblank_count(struct drm_vblank_crtc *vblank);
>
> Why no call these helpers drm_vblank_crtc_<func>() ? That would avoid 
> the underscored helper and have clear naming guidelines for later such 
> functions.

I didn't really pay much attention to it. There's a lot of crtc in the
names already, so I guess the convention would then be:

	drm_crtc_vblank_*(struct drm_crtc *crtc, ...)

	drm_vblank_crtc_*(struct drm_vblank_crtc *vblank, ...)

No big deal for me to rename if you think that's a good convention.

The underscored helpers are temporary, and will get removed later in the
series. IMO the series is easier to review that way. Of course cleaner
if we don't have to add them in the first place.

BR,
Jani.

>
>>   
>>   /* drm_vblank_work.c */
>>   static inline void drm_vblank_flush_worker(struct drm_vblank_crtc *vblank)
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>> index 96dbff63f52d..0ae34f848660 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -384,14 +384,10 @@ static void drm_update_vblank_count(struct drm_device *dev, unsigned int pipe,
>>   	store_vblank(dev, pipe, diff, t_vblank, cur_vblank);
>>   }
>>   
>> -u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
>> +u64 drm_vblank_count(struct drm_vblank_crtc *vblank)
>>   {
>> -	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>>   	u64 count;
>>   
>> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>> -		return 0;
>> -
>>   	count = atomic64_read(&vblank->count);
>>   
>>   	/*
>> @@ -406,6 +402,14 @@ u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
>>   	return count;
>>   }
>>   
>> +static u64 _drm_vblank_count(struct drm_device *dev, unsigned int pipe)
>> +{
>> +	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>> +		return 0;
>> +
>> +	return drm_vblank_count(drm_vblank_crtc(dev, pipe));
>> +}
>> +
>>   /**
>>    * drm_crtc_accurate_vblank_count - retrieve the master vblank counter
>>    * @crtc: which counter to retrieve
>> @@ -431,7 +435,7 @@ u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc)
>>   	spin_lock_irqsave(&dev->vblank_time_lock, flags);
>>   
>>   	drm_update_vblank_count(dev, pipe, false);
>> -	vblank = drm_vblank_count(dev, pipe);
>> +	vblank = _drm_vblank_count(dev, pipe);
>>   
>>   	spin_unlock_irqrestore(&dev->vblank_time_lock, flags);
>>   
>> @@ -935,7 +939,7 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
>>    */
>>   u64 drm_crtc_vblank_count(struct drm_crtc *crtc)
>>   {
>> -	return drm_vblank_count(crtc->dev, drm_crtc_index(crtc));
>> +	return _drm_vblank_count(crtc->dev, drm_crtc_index(crtc));
>>   }
>>   EXPORT_SYMBOL(drm_crtc_vblank_count);
>>   
>> @@ -1208,18 +1212,16 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
>>   	return ret;
>>   }
>>   
>> -int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>> +int drm_vblank_get(struct drm_vblank_crtc *vblank)
>>   {
>> -	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>> +	struct drm_device *dev = vblank->dev;
>> +	int pipe = vblank->pipe;
>>   	unsigned long irqflags;
>>   	int ret = 0;
>>   
>>   	if (!drm_dev_has_vblank(dev))
>>   		return -EINVAL;
>>   
>> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>> -		return -EINVAL;
>> -
>>   	spin_lock_irqsave(&dev->vbl_lock, irqflags);
>>   	/* Going from 0->1 means we have to enable interrupts again */
>>   	if (atomic_add_return(1, &vblank->refcount) == 1) {
>> @@ -1235,6 +1237,14 @@ int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>>   	return ret;
>>   }
>>   
>> +static int _drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>> +{
>> +	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>> +		return -EINVAL;
>> +
>> +	return drm_vblank_get(drm_vblank_crtc(dev, pipe));
>> +}
>> +
>>   /**
>>    * drm_crtc_vblank_get - get a reference count on vblank events
>>    * @crtc: which CRTC to own
>> @@ -1247,18 +1257,15 @@ int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>>    */
>>   int drm_crtc_vblank_get(struct drm_crtc *crtc)
>>   {
>> -	return drm_vblank_get(crtc->dev, drm_crtc_index(crtc));
>> +	return _drm_vblank_get(crtc->dev, drm_crtc_index(crtc));
>>   }
>>   EXPORT_SYMBOL(drm_crtc_vblank_get);
>>   
>> -void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>> +void drm_vblank_put(struct drm_vblank_crtc *vblank)
>>   {
>> -	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>> +	struct drm_device *dev = vblank->dev;
>>   	int vblank_offdelay = vblank->config.offdelay_ms;
>>   
>> -	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>> -		return;
>> -
>>   	if (drm_WARN_ON(dev, atomic_read(&vblank->refcount) == 0))
>>   		return;
>>   
>> @@ -1274,6 +1281,14 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>>   	}
>>   }
>>   
>> +static void _drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>> +{
>> +	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>> +		return;
>> +
>> +	drm_vblank_put(drm_vblank_crtc(dev, pipe));
>> +}
>> +
>>   /**
>>    * drm_crtc_vblank_put - give up ownership of vblank events
>>    * @crtc: which counter to give up
>> @@ -1284,7 +1299,7 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>>    */
>>   void drm_crtc_vblank_put(struct drm_crtc *crtc)
>>   {
>> -	drm_vblank_put(crtc->dev, drm_crtc_index(crtc));
>> +	_drm_vblank_put(crtc->dev, drm_crtc_index(crtc));
>>   }
>>   EXPORT_SYMBOL(drm_crtc_vblank_put);
>>   
>> @@ -1306,20 +1321,20 @@ int drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
>>   	int ret;
>>   	u64 last;
>>   
>> -	ret = drm_vblank_get(dev, pipe);
>> +	ret = drm_vblank_get(vblank);
>>   	if (drm_WARN(dev, ret, "vblank not available on crtc %i, ret=%i\n",
>>   		     pipe, ret))
>>   		return ret;
>>   
>> -	last = drm_vblank_count(dev, pipe);
>> +	last = drm_vblank_count(vblank);
>>   
>>   	ret = wait_event_timeout(vblank->queue,
>> -				 last != drm_vblank_count(dev, pipe),
>> +				 last != drm_vblank_count(vblank),
>>   				 msecs_to_jiffies(1000));
>>   
>>   	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
>>   
>> -	drm_vblank_put(dev, pipe);
>> +	drm_vblank_put(vblank);
>>   
>>   	return ret ? 0 : -ETIMEDOUT;
>>   }
>> @@ -1385,7 +1400,7 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>>   			     "wanted %llu, current %llu\n",
>>   			     e->sequence, seq);
>>   		list_del(&e->base.link);
>> -		drm_vblank_put(dev, pipe);
>> +		_drm_vblank_put(dev, pipe);
>>   		send_vblank_event(dev, e, seq, now);
>>   	}
>>   
>> @@ -1661,7 +1676,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
>>   
>>   	e->sequence = req_seq;
>>   	if (drm_vblank_passed(seq, req_seq)) {
>> -		drm_vblank_put(dev, pipe);
>> +		_drm_vblank_put(dev, pipe);
>>   		send_vblank_event(dev, e, seq, now);
>>   		vblwait->reply.sequence = seq;
>>   	} else {
>> @@ -1678,7 +1693,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
>>   	spin_unlock_irq(&dev->event_lock);
>>   	kfree(e);
>>   err_put:
>> -	drm_vblank_put(dev, pipe);
>> +	_drm_vblank_put(dev, pipe);
>>   	return ret;
>>   }
>>   
>> @@ -1796,14 +1811,14 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>>   		return 0;
>>   	}
>>   
>> -	ret = drm_vblank_get(dev, pipe);
>> +	ret = _drm_vblank_get(dev, pipe);
>>   	if (ret) {
>>   		drm_dbg_core(dev,
>>   			     "crtc %d failed to acquire vblank counter, %d\n",
>>   			     pipe, ret);
>>   		return ret;
>>   	}
>> -	seq = drm_vblank_count(dev, pipe);
>> +	seq = _drm_vblank_count(dev, pipe);
>>   
>>   	switch (vblwait->request.type & _DRM_VBLANK_TYPES_MASK) {
>>   	case _DRM_VBLANK_RELATIVE:
>> @@ -1839,7 +1854,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>>   		drm_dbg_core(dev, "waiting on vblank count %llu, crtc %u\n",
>>   			     req_seq, pipe);
>>   		wait = wait_event_interruptible_timeout(vblank->queue,
>> -			drm_vblank_passed(drm_vblank_count(dev, pipe), req_seq) ||
>> +			drm_vblank_passed(_drm_vblank_count(dev, pipe), req_seq) ||
>>   				      !READ_ONCE(vblank->enabled),
>>   			msecs_to_jiffies(3000));
>>   
>> @@ -1869,7 +1884,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>>   	}
>>   
>>   done:
>> -	drm_vblank_put(dev, pipe);
>> +	_drm_vblank_put(dev, pipe);
>>   	return ret;
>>   }
>>   
>> @@ -1895,7 +1910,7 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
>>   			     e->sequence, seq);
>>   
>>   		list_del(&e->base.link);
>> -		drm_vblank_put(dev, pipe);
>> +		_drm_vblank_put(dev, pipe);
>>   		send_vblank_event(dev, e, seq, now);
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
>> index 70f0199251ea..2ef006626d50 100644
>> --- a/drivers/gpu/drm/drm_vblank_work.c
>> +++ b/drivers/gpu/drm/drm_vblank_work.c
>> @@ -58,7 +58,7 @@ void drm_handle_vblank_works(struct drm_vblank_crtc *vblank)
>>   			continue;
>>   
>>   		list_del_init(&work->node);
>> -		drm_vblank_put(vblank->dev, vblank->pipe);
>> +		drm_vblank_put(vblank);
>>   		kthread_queue_work(vblank->worker, &work->base);
>>   		wake = true;
>>   	}
>> @@ -80,7 +80,7 @@ void drm_vblank_cancel_pending_works(struct drm_vblank_crtc *vblank)
>>   
>>   	list_for_each_entry_safe(work, next, &vblank->pending_work, node) {
>>   		list_del_init(&work->node);
>> -		drm_vblank_put(vblank->dev, vblank->pipe);
>> +		drm_vblank_put(vblank);
>>   	}
>>   
>>   	wake_up_all(&vblank->work_wait_queue);
>> @@ -129,7 +129,7 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
>>   		goto out;
>>   
>>   	if (list_empty(&work->node)) {
>> -		ret = drm_vblank_get(dev, vblank->pipe);
>> +		ret = drm_vblank_get(vblank);
>>   		if (ret < 0)
>>   			goto out;
>>   	} else if (work->count == count) {
>> @@ -140,7 +140,7 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
>>   	}
>>   
>>   	work->count = count;
>> -	cur_vbl = drm_vblank_count(dev, vblank->pipe);
>> +	cur_vbl = drm_vblank_count(vblank);
>>   	passed = drm_vblank_passed(cur_vbl, count);
>>   	if (passed)
>>   		drm_dbg_core(dev,
>> @@ -148,7 +148,7 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
>>   			     vblank->pipe, count, cur_vbl);
>>   
>>   	if (!nextonmiss && passed) {
>> -		drm_vblank_put(dev, vblank->pipe);
>> +		drm_vblank_put(vblank);
>>   		ret = kthread_queue_work(vblank->worker, &work->base);
>>   
>>   		if (rescheduling) {
>> @@ -193,7 +193,7 @@ bool drm_vblank_work_cancel_sync(struct drm_vblank_work *work)
>>   	spin_lock_irq(&dev->event_lock);
>>   	if (!list_empty(&work->node)) {
>>   		list_del_init(&work->node);
>> -		drm_vblank_put(vblank->dev, vblank->pipe);
>> +		drm_vblank_put(vblank);
>>   		ret = true;
>>   	}
>>   

-- 
Jani Nikula, Intel
