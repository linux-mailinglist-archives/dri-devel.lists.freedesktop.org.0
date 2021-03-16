Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 451FC33D166
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 11:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081C189F27;
	Tue, 16 Mar 2021 10:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E374589F0A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 10:09:21 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo1091378wmq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 03:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cLKg4TrzRkg5ELSUoyN8Ji0E3RVeFnPKqZ4lQqjZqow=;
 b=VbRtDjyx8erEmDQeRBft+/Lmzp3Vt4aCX3aam7xjqv1wfEaiDtff+HNbubL65MdXWn
 YhOV+gIsKft64RiF5PGr78d/F0H1p/pCNXy7IGTNmU66qRO5FY3lu2HxR5SrK/p6A33e
 Jn6ct/JD0nyNRoH+BF+kAA/0dZrPct9An+RBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cLKg4TrzRkg5ELSUoyN8Ji0E3RVeFnPKqZ4lQqjZqow=;
 b=TmqGBhTLk9T2ezBOwEK7227wy5lbXyH33l69kPfeCzRpQKMV9Zko3kSw+qwFPC4WGC
 iWmJ8e+5GkmxBLC344nFoVT/XERohkeLIPFCmQuZGj7G8VVKnPuif0OOdeFffxwQWR8g
 xZT9Lf/dtU27Jj3vl5W8Df7MksOBk50s3IwTeZR+SdDq3gCvef9N1sGE+kj/cHzWK4PE
 8z6p8UBoxo8C1n5uAH+fKTfKGjsaUBZpctq6vsFpCoBl6eHAh8XH9swg9CLgjywGJG0M
 msidwmiySXO00ItZN3AE7qJsQfF1qX1HxpoFjJotMr7K1Y94p2u/6rdQt17RZwO3dXcS
 V2MQ==
X-Gm-Message-State: AOAM5316lbgpdYQWA90xo4zM0KqjYGy7UyZr3vBicTLhwTubZ/o5cMqt
 /pmwOVA9QWgY84RyKvY6A8kG4w==
X-Google-Smtp-Source: ABdhPJyEmAvjErQPjw1n8miGS26T+bK6g/PH4ddiuedsbDd5Fs5IbKSEtQS8Zq/P1DkHZgJUtHdS7w==
X-Received: by 2002:a1c:21c3:: with SMTP id h186mr3814710wmh.32.1615889360498; 
 Tue, 16 Mar 2021 03:09:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j26sm21304351wrh.57.2021.03.16.03.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 03:09:19 -0700 (PDT)
Date: Tue, 16 Mar 2021 11:09:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC 4/6] drm/i915: Allow userspace to configure the watchdog
Message-ID: <YFCDzjRv3Z0vIT1I@phenom.ffwll.local>
References: <20210312154622.1767865-1-tvrtko.ursulin@linux.intel.com>
 <20210312154622.1767865-5-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312154622.1767865-5-tvrtko.ursulin@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 12, 2021 at 03:46:20PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Idea here is to make the watchdog mechanism more useful than for just
> default request/fence expiry.
> 
> To this effect a new context param I915_CONTEXT_PARAM_WATCHDOG is added
> where the value fields allows passing in a timeout in micro-seconds.
> 
> This allows userspace to set a limit to how long they expect their batches
> to take, or otherwise they will be cancelled, and userspace notified via
> one of the available mechanisms.
> 
> Main attractiveness of adding uapi here is perhaps to extend the proposal
> by passing in a structure instead of a single value, like for illustration
> only:
> 
> struct drm_i915_gem_context_watchdog {
> 	__u64 flags;
>  #define I915_CONTEXT_WATCHDOG_WALL_TIME	BIT(0)
>  #define I915_CONTEXT_WATCHDOG_GPU_TIME		BIT(1)
>  #define I915_CONTEXT_WATCHDOG_FROM_SUBMIT	BIT(2)
>  #define I915_CONTEXT_WATCHDOG_FROM_RUNNABLE	BIT(3)
> 	__64 timeout_us;
> };
> 
> Point being to prepare the uapi for different semantics from the start.
> Given how not a single one makes complete sense for all use cases. And
> also perhaps satisfy the long wanted media watchdog feature request.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

I think what's been discussed forever is a gpu time watchdog for media.
Otherwise I don't think userspace should be allowed to configure anything
here, and even the watch really should only allow to fail faster.

Now for the workloads that we do break with the next patch (and those
exist), the real solution is the preempt-ctx dma_fence that amdkfd does,
and which we're also working on. But unfortunately that's a lot more work
than a quick simple patch.

So please drop this one from the next round. If media wants a fast
gpu timeout then we should roll that in as a separate series, with
userspace and igt and all the usual bells&whistles.
-Daniel

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 57 +++++++++++++++++++
>  .../gpu/drm/i915/gem/i915_gem_context_types.h |  4 ++
>  drivers/gpu/drm/i915/gt/intel_context_param.h | 11 +++-
>  include/uapi/drm/i915_drm.h                   |  5 +-
>  4 files changed, 75 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index ca37d93ef5e7..32b05af4fc8f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -233,6 +233,8 @@ static void intel_context_set_gem(struct intel_context *ce,
>  	if (ctx->sched.priority >= I915_PRIORITY_NORMAL &&
>  	    intel_engine_has_timeslices(ce->engine))
>  		__set_bit(CONTEXT_USE_SEMAPHORES, &ce->flags);
> +
> +	intel_context_set_watchdog_us(ce, ctx->watchdog.timeout_us);
>  }
>  
>  static void __free_engines(struct i915_gem_engines *e, unsigned int count)
> @@ -1397,6 +1399,28 @@ static int set_ringsize(struct i915_gem_context *ctx,
>  				 __intel_context_ring_size(args->value));
>  }
>  
> +static int __apply_watchdog(struct intel_context *ce, void *timeout_us)
> +{
> +	return intel_context_set_watchdog_us(ce, (uintptr_t)timeout_us);
> +}
> +
> +static int set_watchdog(struct i915_gem_context *ctx,
> +			struct drm_i915_gem_context_param *args)
> +{
> +	int ret;
> +
> +	if (args->size)
> +		return -EINVAL;
> +
> +	ret = context_apply_all(ctx, __apply_watchdog,
> +				(void *)(uintptr_t)args->value);
> +
> +	if (!ret)
> +		ctx->watchdog.timeout_us = args->value;
> +
> +	return ret;
> +}
> +
>  static int __get_ringsize(struct intel_context *ce, void *arg)
>  {
>  	long sz;
> @@ -1426,6 +1450,17 @@ static int get_ringsize(struct i915_gem_context *ctx,
>  	return 0;
>  }
>  
> +static int get_watchdog(struct i915_gem_context *ctx,
> +			struct drm_i915_gem_context_param *args)
> +{
> +	if (args->size)
> +		return -EINVAL;
> +
> +	args->value = ctx->watchdog.timeout_us;
> +
> +	return 0;
> +}
> +
>  int
>  i915_gem_user_to_context_sseu(struct intel_gt *gt,
>  			      const struct drm_i915_gem_context_param_sseu *user,
> @@ -2075,6 +2110,10 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
>  		ret = set_ringsize(ctx, args);
>  		break;
>  
> +	case I915_CONTEXT_PARAM_WATCHDOG:
> +		ret = set_watchdog(ctx, args);
> +		break;
> +
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
>  	default:
>  		ret = -EINVAL;
> @@ -2196,6 +2235,19 @@ static int clone_schedattr(struct i915_gem_context *dst,
>  	return 0;
>  }
>  
> +static int clone_watchdog(struct i915_gem_context *dst,
> +			  struct i915_gem_context *src)
> +{
> +	int ret;
> +
> +	ret = context_apply_all(dst, __apply_watchdog,
> +				(void *)(uintptr_t)src->watchdog.timeout_us);
> +	if (!ret)
> +		dst->watchdog = src->watchdog;
> +
> +	return ret;
> +}
> +
>  static int clone_sseu(struct i915_gem_context *dst,
>  		      struct i915_gem_context *src)
>  {
> @@ -2279,6 +2331,7 @@ static int create_clone(struct i915_user_extension __user *ext, void *data)
>  		MAP(SSEU, clone_sseu),
>  		MAP(TIMELINE, clone_timeline),
>  		MAP(VM, clone_vm),
> +		MAP(WATCHDOG, clone_watchdog),
>  #undef MAP
>  	};
>  	struct drm_i915_gem_context_create_ext_clone local;
> @@ -2532,6 +2585,10 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
>  		ret = get_ringsize(ctx, args);
>  		break;
>  
> +	case I915_CONTEXT_PARAM_WATCHDOG:
> +		ret = get_watchdog(ctx, args);
> +		break;
> +
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
>  	default:
>  		ret = -EINVAL;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index d5bc75508048..f17da7e26c43 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -150,6 +150,10 @@ struct i915_gem_context {
>  	 */
>  	atomic_t active_count;
>  
> +	struct {
> +		u64 timeout_us;
> +	} watchdog;
> +
>  	/**
>  	 * @hang_timestamp: The last time(s) this context caused a GPU hang
>  	 */
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_param.h b/drivers/gpu/drm/i915/gt/intel_context_param.h
> index f053d8633fe2..3ecacc675f41 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_param.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_param.h
> @@ -6,9 +6,18 @@
>  #ifndef INTEL_CONTEXT_PARAM_H
>  #define INTEL_CONTEXT_PARAM_H
>  
> -struct intel_context;
> +#include <linux/types.h>
> +
> +#include "intel_context.h"
>  
>  int intel_context_set_ring_size(struct intel_context *ce, long sz);
>  long intel_context_get_ring_size(struct intel_context *ce);
>  
> +static inline int
> +intel_context_set_watchdog_us(struct intel_context *ce, u64 timeout_us)
> +{
> +	ce->watchdog.timeout_us = timeout_us;
> +	return 0;
> +}
> +
>  #endif /* INTEL_CONTEXT_PARAM_H */
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 1987e2ea79a3..a4c65780850c 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1694,6 +1694,8 @@ struct drm_i915_gem_context_param {
>   * Default is 16 KiB.
>   */
>  #define I915_CONTEXT_PARAM_RINGSIZE	0xc
> +
> +#define I915_CONTEXT_PARAM_WATCHDOG	0xd
>  /* Must be kept compact -- no holes and well documented */
>  
>  	__u64 value;
> @@ -1863,7 +1865,8 @@ struct drm_i915_gem_context_create_ext_clone {
>  #define I915_CONTEXT_CLONE_SSEU		(1u << 3)
>  #define I915_CONTEXT_CLONE_TIMELINE	(1u << 4)
>  #define I915_CONTEXT_CLONE_VM		(1u << 5)
> -#define I915_CONTEXT_CLONE_UNKNOWN -(I915_CONTEXT_CLONE_VM << 1)
> +#define I915_CONTEXT_CLONE_WATCHDOG	(1u << 6)
> +#define I915_CONTEXT_CLONE_UNKNOWN -(I915_CONTEXT_CLONE_WATCHDOG << 1)
>  	__u64 rsvd;
>  };
>  
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
