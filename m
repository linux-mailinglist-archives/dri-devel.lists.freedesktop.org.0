Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B762C3A12BF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 13:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA326E283;
	Wed,  9 Jun 2021 11:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F214F89E69
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 11:28:51 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id f2so25032527wri.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 04:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DSOZqqxMYrCmbDc/qIrzNxvXXydaoyaAzXzXYYfVSkI=;
 b=GtiYagN/czC8PTFfjxPmJUKVCSxGWrkylH92NM9tchzJdFsIik4YbJy1F/AvmNJSCz
 lFoDYsQSXafApm1hU6pb7YffgLVg1fAYD8XaghweyGJvIpXf6xg6S3TKAE8mzNtJDtJV
 QAC8KuTe8Xp9lVigXcenCOKd7QUAa2ygMp1MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DSOZqqxMYrCmbDc/qIrzNxvXXydaoyaAzXzXYYfVSkI=;
 b=r3NVKmHs7nZ5oFjXcpxk7US3Z6vDeAj0/meAOu0JTcrt+DQnmUJBB2KrINa+kVJEH+
 K5PjjeT+t2diC1CrbrfA3reBs8mqpuACVtkaTU8i2MaShoDBMAD2vMxI0gXcwJEl4kFG
 sPqH7+PeqWvL/lvumRfr/XdbZGWt87w2v+qBadqTzz7t8AUMDb7sjR+OzwHBK0G6MXxx
 bNzNO0EwRv6HIIVrEFd74uIUlJWUCY8bd2YOVKDje3TfJf811sBnPy4IbOseXPL+Tki/
 e15riDt3+gYM5N2iQko/Lfs/hsylkRIc3HqBcIPfCTTzf4JmiZOhyakMyCO6TCcnf5AC
 tyxg==
X-Gm-Message-State: AOAM530u19+jxdydJHysFIeENEiC4bpvyBlc6unmMKuKS5WUEKrmadsM
 Sid72LrkiM95XDCRxjPboK/v0aTz6/NZ3w==
X-Google-Smtp-Source: ABdhPJxT/s/1sBRMDUBT6+hf5GKAjdvysChJlnsfCae73xE8svX36sZUjJKTHXEbzZ3j/B5Sy5wQXA==
X-Received: by 2002:a05:6000:1a8f:: with SMTP id
 f15mr19554050wry.260.1623238130403; 
 Wed, 09 Jun 2021 04:28:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q3sm23307019wrr.43.2021.06.09.04.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 04:28:49 -0700 (PDT)
Date: Wed, 9 Jun 2021 13:28:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 16/31] drm/i915/gem: Add an intermediate
 proto_context struct (v4)
Message-ID: <YMCl71qtWsp3bQ3A@phenom.ffwll.local>
References: <20210609043613.102962-1-jason@jlekstrand.net>
 <20210609043613.102962-17-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609043613.102962-17-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 08, 2021 at 11:35:58PM -0500, Jason Ekstrand wrote:
> The current context uAPI allows for two methods of setting context
> parameters: SET_CONTEXT_PARAM and CONTEXT_CREATE_EXT_SETPARAM.  The
> former is allowed to be called at any time while the later happens as
> part of GEM_CONTEXT_CREATE.  Currently, everything settable via one is
> settable via the other.  While some params are fairly simple and setting
> them on a live context is harmless such the context priority, others are
> far trickier such as the VM or the set of engines.  In order to swap out
> the VM, for instance, we have to delay until all current in-flight work
> is complete, swap in the new VM, and then continue.  This leads to a
> plethora of potential race conditions we'd really rather avoid.
> 
> Unfortunately, both methods of setting the VM and the engine set are in
> active use today so we can't simply disallow setting the VM or engine
> set vial SET_CONTEXT_PARAM.  In order to work around this wart, this
> commit adds a proto-context struct which contains all the context create
> parameters.
> 
> v2 (Daniel Vetter):
>  - Better commit message
>  - Use __set/clear_bit instead of set/clear_bit because there's no race
>    and we don't need the atomics
> 
> v3 (Daniel Vetter):
>  - Use manual bitops and BIT() instead of __set_bit
> 
> v4 (Daniel Vetter):
>  - Add a changelog to the commit message
>  - Better hyperlinking in docs
>  - Create the default PPGTT in i915_gem_create_context
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 124 +++++++++++++++---
>  .../gpu/drm/i915/gem/i915_gem_context_types.h |  22 ++++
>  .../gpu/drm/i915/gem/selftests/mock_context.c |  16 ++-
>  3 files changed, 145 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index f9a6eac78c0ae..b5d8c1ff5d7b3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -191,6 +191,83 @@ static int validate_priority(struct drm_i915_private *i915,
>  	return 0;
>  }
>  
> +static void proto_context_close(struct i915_gem_proto_context *pc)
> +{
> +	if (pc->vm)
> +		i915_vm_put(pc->vm);
> +	kfree(pc);
> +}
> +
> +static int proto_context_set_persistence(struct drm_i915_private *i915,
> +					 struct i915_gem_proto_context *pc,
> +					 bool persist)
> +{
> +	if (persist) {
> +		/*
> +		 * Only contexts that are short-lived [that will expire or be
> +		 * reset] are allowed to survive past termination. We require
> +		 * hangcheck to ensure that the persistent requests are healthy.
> +		 */
> +		if (!i915->params.enable_hangcheck)
> +			return -EINVAL;
> +
> +		pc->user_flags |= BIT(UCONTEXT_PERSISTENCE);
> +	} else {
> +		/* To cancel a context we use "preempt-to-idle" */
> +		if (!(i915->caps.scheduler & I915_SCHEDULER_CAP_PREEMPTION))
> +			return -ENODEV;
> +
> +		/*
> +		 * If the cancel fails, we then need to reset, cleanly!
> +		 *
> +		 * If the per-engine reset fails, all hope is lost! We resort
> +		 * to a full GPU reset in that unlikely case, but realistically
> +		 * if the engine could not reset, the full reset does not fare
> +		 * much better. The damage has been done.
> +		 *
> +		 * However, if we cannot reset an engine by itself, we cannot
> +		 * cleanup a hanging persistent context without causing
> +		 * colateral damage, and we should not pretend we can by
> +		 * exposing the interface.
> +		 */
> +		if (!intel_has_reset_engine(&i915->gt))
> +			return -ENODEV;
> +
> +		pc->user_flags &= ~BIT(UCONTEXT_PERSISTENCE);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct i915_gem_proto_context *
> +proto_context_create(struct drm_i915_private *i915, unsigned int flags)
> +{
> +	struct i915_gem_proto_context *pc, *err;
> +
> +	pc = kzalloc(sizeof(*pc), GFP_KERNEL);
> +	if (!pc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pc->user_flags = BIT(UCONTEXT_BANNABLE) |
> +			 BIT(UCONTEXT_RECOVERABLE);
> +	proto_context_set_persistence(i915, pc, true);

I think we're down to the bikeshed here that I think should be open-coded
for clarity of what exactly is going on. But maybe better in a distinct
patch.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +	pc->sched.priority = I915_PRIORITY_NORMAL;
> +
> +	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
> +		if (!HAS_EXECLISTS(i915)) {
> +			err = ERR_PTR(-EINVAL);
> +			goto proto_close;
> +		}
> +		pc->single_timeline = true;
> +	}
> +
> +	return pc;
> +
> +proto_close:
> +	proto_context_close(pc);
> +	return err;
> +}
> +
>  static struct i915_address_space *
>  context_get_vm_rcu(struct i915_gem_context *ctx)
>  {
> @@ -660,7 +737,8 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
>  }
>  
>  static struct i915_gem_context *
> -__create_context(struct drm_i915_private *i915)
> +__create_context(struct drm_i915_private *i915,
> +		 const struct i915_gem_proto_context *pc)
>  {
>  	struct i915_gem_context *ctx;
>  	struct i915_gem_engines *e;
> @@ -673,7 +751,7 @@ __create_context(struct drm_i915_private *i915)
>  
>  	kref_init(&ctx->ref);
>  	ctx->i915 = i915;
> -	ctx->sched.priority = I915_PRIORITY_NORMAL;
> +	ctx->sched = pc->sched;
>  	mutex_init(&ctx->mutex);
>  	INIT_LIST_HEAD(&ctx->link);
>  
> @@ -696,9 +774,7 @@ __create_context(struct drm_i915_private *i915)
>  	 * is no remap info, it will be a NOP. */
>  	ctx->remap_slice = ALL_L3_SLICES(i915);
>  
> -	i915_gem_context_set_bannable(ctx);
> -	i915_gem_context_set_recoverable(ctx);
> -	__context_set_persistence(ctx, true /* cgroup hook? */);
> +	ctx->user_flags = pc->user_flags;
>  
>  	for (i = 0; i < ARRAY_SIZE(ctx->hang_timestamp); i++)
>  		ctx->hang_timestamp[i] = jiffies - CONTEXT_FAST_HANG_JIFFIES;
> @@ -786,20 +862,22 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
>  }
>  
>  static struct i915_gem_context *
> -i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
> +i915_gem_create_context(struct drm_i915_private *i915,
> +			const struct i915_gem_proto_context *pc)
>  {
>  	struct i915_gem_context *ctx;
>  	int ret;
>  
> -	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE &&
> -	    !HAS_EXECLISTS(i915))
> -		return ERR_PTR(-EINVAL);
> -
> -	ctx = __create_context(i915);
> +	ctx = __create_context(i915, pc);
>  	if (IS_ERR(ctx))
>  		return ctx;
>  
> -	if (HAS_FULL_PPGTT(i915)) {
> +	if (pc->vm) {
> +		/* __assign_ppgtt() requires this mutex to be held */
> +		mutex_lock(&ctx->mutex);
> +		__assign_ppgtt(ctx, pc->vm);
> +		mutex_unlock(&ctx->mutex);
> +	} else if (HAS_FULL_PPGTT(i915)) {
>  		struct i915_ppgtt *ppgtt;
>  
>  		ppgtt = i915_ppgtt_create(&i915->gt);
> @@ -810,14 +888,16 @@ i915_gem_create_context(struct drm_i915_private *i915, unsigned int flags)
>  			return ERR_CAST(ppgtt);
>  		}
>  
> +		/* __assign_ppgtt() requires this mutex to be held */
>  		mutex_lock(&ctx->mutex);
>  		__assign_ppgtt(ctx, &ppgtt->vm);
>  		mutex_unlock(&ctx->mutex);
>  
> +		/* __assign_ppgtt() takes another reference for us */
>  		i915_vm_put(&ppgtt->vm);
>  	}
>  
> -	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
> +	if (pc->single_timeline) {
>  		ret = drm_syncobj_create(&ctx->syncobj,
>  					 DRM_SYNCOBJ_CREATE_SIGNALED,
>  					 NULL);
> @@ -883,6 +963,7 @@ int i915_gem_context_open(struct drm_i915_private *i915,
>  			  struct drm_file *file)
>  {
>  	struct drm_i915_file_private *file_priv = file->driver_priv;
> +	struct i915_gem_proto_context *pc;
>  	struct i915_gem_context *ctx;
>  	int err;
>  	u32 id;
> @@ -892,7 +973,14 @@ int i915_gem_context_open(struct drm_i915_private *i915,
>  	/* 0 reserved for invalid/unassigned ppgtt */
>  	xa_init_flags(&file_priv->vm_xa, XA_FLAGS_ALLOC1);
>  
> -	ctx = i915_gem_create_context(i915, 0);
> +	pc = proto_context_create(i915, 0);
> +	if (IS_ERR(pc)) {
> +		err = PTR_ERR(pc);
> +		goto err;
> +	}
> +
> +	ctx = i915_gem_create_context(i915, pc);
> +	proto_context_close(pc);
>  	if (IS_ERR(ctx)) {
>  		err = PTR_ERR(ctx);
>  		goto err;
> @@ -1884,6 +1972,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
>  {
>  	struct drm_i915_private *i915 = to_i915(dev);
>  	struct drm_i915_gem_context_create_ext *args = data;
> +	struct i915_gem_proto_context *pc;
>  	struct create_ext ext_data;
>  	int ret;
>  	u32 id;
> @@ -1906,7 +1995,12 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
>  		return -EIO;
>  	}
>  
> -	ext_data.ctx = i915_gem_create_context(i915, args->flags);
> +	pc = proto_context_create(i915, args->flags);
> +	if (IS_ERR(pc))
> +		return PTR_ERR(pc);
> +
> +	ext_data.ctx = i915_gem_create_context(i915, pc);
> +	proto_context_close(pc);
>  	if (IS_ERR(ext_data.ctx))
>  		return PTR_ERR(ext_data.ctx);
>  
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index 5f0673a2129f9..e0bdf3e298a6a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -66,6 +66,28 @@ struct i915_gem_engines_iter {
>  	const struct i915_gem_engines *engines;
>  };
>  
> +/**
> + * struct i915_gem_proto_context - prototype context
> + *
> + * The struct i915_gem_proto_context represents the creation parameters for
> + * a struct i915_gem_context.  This is used to gather parameters provided
> + * either through creation flags or via SET_CONTEXT_PARAM so that, when we
> + * create the final i915_gem_context, those parameters can be immutable.
> + */
> +struct i915_gem_proto_context {
> +	/** @vm: See &i915_gem_context.vm */
> +	struct i915_address_space *vm;
> +
> +	/** @user_flags: See &i915_gem_context.user_flags */
> +	unsigned long user_flags;
> +
> +	/** @sched: See &i915_gem_context.sched */
> +	struct i915_sched_attr sched;
> +
> +	/** @single_timeline: See See &i915_gem_context.syncobj */
> +	bool single_timeline;
> +};
> +
>  /**
>   * struct i915_gem_context - client state
>   *
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> index 51b5a3421b400..e0f512ef7f3c6 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> @@ -80,11 +80,17 @@ void mock_init_contexts(struct drm_i915_private *i915)
>  struct i915_gem_context *
>  live_context(struct drm_i915_private *i915, struct file *file)
>  {
> +	struct i915_gem_proto_context *pc;
>  	struct i915_gem_context *ctx;
>  	int err;
>  	u32 id;
>  
> -	ctx = i915_gem_create_context(i915, 0);
> +	pc = proto_context_create(i915, 0);
> +	if (IS_ERR(pc))
> +		return ERR_CAST(pc);
> +
> +	ctx = i915_gem_create_context(i915, pc);
> +	proto_context_close(pc);
>  	if (IS_ERR(ctx))
>  		return ctx;
>  
> @@ -142,8 +148,14 @@ struct i915_gem_context *
>  kernel_context(struct drm_i915_private *i915)
>  {
>  	struct i915_gem_context *ctx;
> +	struct i915_gem_proto_context *pc;
> +
> +	pc = proto_context_create(i915, 0);
> +	if (IS_ERR(pc))
> +		return ERR_CAST(pc);
>  
> -	ctx = i915_gem_create_context(i915, 0);
> +	ctx = i915_gem_create_context(i915, pc);
> +	proto_context_close(pc);
>  	if (IS_ERR(ctx))
>  		return ctx;
>  
> -- 
> 2.31.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
