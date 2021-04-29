Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1B336EB14
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 15:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEBD6EE9C;
	Thu, 29 Apr 2021 13:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1AC6EE9A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 13:02:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so6620182wmn.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 06:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sg4sAZBMQAROpLpp5W9yWJbORbhGOGNFkPcv4Et6fwo=;
 b=ZdRvOCRMj1/tpq5DYr4R7IGkPBJKqNnjrVfZ7WYo1AFoMyipcDaI07QjDLgAI4dl4a
 fJYsqz99I7o7vZOBsMmmAJxejonQZKd3ZwZucdCNFEAwYlYuBt7YU+3O/KhheVxxYIqj
 c0YQq3VAVExQpC7YqJrfIdJvj+JMxAZ73Xc8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sg4sAZBMQAROpLpp5W9yWJbORbhGOGNFkPcv4Et6fwo=;
 b=mjHV8ljixycw5mfwIFwJ9yQKrgk0/zaLSL8mFCQe5bUPQ0jdzLUovavp4Cn6rvnQnY
 mUQP7BgFvdePEFyt/f35/BzdbO9xxxPgYctPZO8/R+L74Muhm+8G2D3ZDn0wTQ4ubX5O
 m9aWkqSiDCw2naSdmySx8jWsPsMJN8ZOEaq7Ve+ru9odJZVdaHgnFCcdDn5rcsE6L7NR
 4Zbzp7hxda58xo9Q1VuSDD7bZKeGWoxzRJq7Yotu2NOH18alzvZoiTuynPlg/Yz4FZ8C
 czCXSBbZPgqfh26FJORcgDkM8/9SaBPJyIJmgXxzEvYXDH7gCxwCXEUPs7FTwmWbk3Ur
 tKGQ==
X-Gm-Message-State: AOAM533xWRRJLLXAXzoUDpGWSBPgDp2aOcOdYo69Ed6WUvKdGCcfM7eD
 qh1W6FnGC2b3TaZaub7XywQCXg==
X-Google-Smtp-Source: ABdhPJwSuS7PJ7NI4J/pKUKCHIMBP7Tw54PRGDP05geU4zT9g/IQ2tSnPYLQKXTqnbPmjkkCRqdjEg==
X-Received: by 2002:a05:600c:35cf:: with SMTP id
 r15mr36814685wmq.21.1619701376504; 
 Thu, 29 Apr 2021 06:02:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t206sm3912997wmb.11.2021.04.29.06.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 06:02:56 -0700 (PDT)
Date: Thu, 29 Apr 2021 15:02:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 13/21] drm/i915/gem: Add an intermediate
 proto_context struct
Message-ID: <YIqufo0AsyRndhav@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-14-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423223131.879208-14-jason@jlekstrand.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit introducing a new data structure really should have a solid
intro in the commit message about. Please cover

- that ctx really should be immutable, safe for exceptions like priority

- that unfortunately we butchered the uapi with setparam and sharing
  setparams between create_ext and setparam

- and how exactly proto ctx fixes this (with stuff like locking design
  used)

Maybe also dupe the kerneldoc into here for completeness.
On Fri, Apr 23, 2021 at 05:31:23PM -0500, Jason Ekstrand wrote:
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 143 ++++++++++++++----
>  .../gpu/drm/i915/gem/i915_gem_context_types.h |  21 +++
>  .../gpu/drm/i915/gem/selftests/mock_context.c |  16 +-

I'm wondering whether in the end we should split out the proto_ctx into
its own file, with the struct private only to itself. But I guess
impossible during the transition, and also maybe afterwards?

>  3 files changed, 150 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index e5efd22c89ba2..3e883daab93bf 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -191,6 +191,95 @@ static int validate_priority(struct drm_i915_private *i915,
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
> +	if (test_bit(UCONTEXT_PERSISTENCE, &pc->user_flags) == persist)
> +		return 0;

We have compilers to optimize this kind of stuff, pls remove :-)
Especially with the non-atomic bitops there's no point.

> +
> +	if (persist) {
> +		/*
> +		 * Only contexts that are short-lived [that will expire or be
> +		 * reset] are allowed to survive past termination. We require
> +		 * hangcheck to ensure that the persistent requests are healthy.
> +		 */
> +		if (!i915->params.enable_hangcheck)
> +			return -EINVAL;
> +
> +		set_bit(UCONTEXT_PERSISTENCE, &pc->user_flags);

It's a bit entetaining, but the bitops in the kernel are atomic. Which is
hella confusing here.

I think open coding is the standard for truly normal bitops.

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
> +		clear_bit(UCONTEXT_PERSISTENCE, &pc->user_flags);

Same here.

> +	}
> +
> +	return 0;
> +}
> +
> +static struct i915_gem_proto_context *
> +proto_context_create(struct drm_i915_private *i915, unsigned int flags)
> +{
> +	struct i915_gem_proto_context *pc;
> +
> +	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE &&
> +	    !HAS_EXECLISTS(i915))
> +		return ERR_PTR(-EINVAL);
> +
> +	pc = kzalloc(sizeof(*pc), GFP_KERNEL);
> +	if (!pc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (HAS_FULL_PPGTT(i915)) {
> +		struct i915_ppgtt *ppgtt;
> +
> +		ppgtt = i915_ppgtt_create(&i915->gt);
> +		if (IS_ERR(ppgtt)) {
> +			drm_dbg(&i915->drm, "PPGTT setup failed (%ld)\n",
> +				PTR_ERR(ppgtt));
> +			proto_context_close(pc);
> +			return ERR_CAST(ppgtt);
> +		}
> +		pc->vm = &ppgtt->vm;
> +	}
> +
> +	pc->user_flags = 0;
> +	set_bit(UCONTEXT_BANNABLE, &pc->user_flags);
> +	set_bit(UCONTEXT_RECOVERABLE, &pc->user_flags);

Same about atomic bitops here.

> +	proto_context_set_persistence(i915, pc, true);
> +	pc->sched.priority = I915_PRIORITY_NORMAL;
> +
> +	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE)
> +		pc->single_timeline = true;

bit a bikeshed, but I'd put the error checking in here too and deal with
the unwind pain with the usual goto proto_close. That should also make the
ppgtt unwind path a bit clearer because it sticks out in the standard way.

> +
> +	return pc;
> +}
> +
>  static struct i915_address_space *
>  context_get_vm_rcu(struct i915_gem_context *ctx)
>  {
> @@ -660,7 +749,8 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
>  }
>  
>  static struct i915_gem_context *
> -__create_context(struct drm_i915_private *i915)
> +__create_context(struct drm_i915_private *i915,
> +		 const struct i915_gem_proto_context *pc)
>  {
>  	struct i915_gem_context *ctx;
>  	struct i915_gem_engines *e;
> @@ -673,7 +763,7 @@ __create_context(struct drm_i915_private *i915)
>  
>  	kref_init(&ctx->ref);
>  	ctx->i915 = i915;
> -	ctx->sched.priority = I915_PRIORITY_NORMAL;
> +	ctx->sched = pc->sched;
>  	mutex_init(&ctx->mutex);
>  	INIT_LIST_HEAD(&ctx->link);
>  
> @@ -696,9 +786,7 @@ __create_context(struct drm_i915_private *i915)
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
> @@ -786,38 +874,23 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
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
> -		struct i915_ppgtt *ppgtt;
> -
> -		ppgtt = i915_ppgtt_create(&i915->gt);
> -		if (IS_ERR(ppgtt)) {
> -			drm_dbg(&i915->drm, "PPGTT setup failed (%ld)\n",
> -				PTR_ERR(ppgtt));
> -			context_close(ctx);
> -			return ERR_CAST(ppgtt);
> -		}
> -
> +	if (pc->vm) {
>  		mutex_lock(&ctx->mutex);

I guess this dies later, but this mutex_lock here is superflous since
right now no one else can get at our ctx struct. And nothing in
__assign_ppgtt checks for us holding the lock.

But fine if it only gets remove in the vm immutable patch.

> -		__assign_ppgtt(ctx, &ppgtt->vm);
> +		__assign_ppgtt(ctx, pc->vm);
>  		mutex_unlock(&ctx->mutex);
> -
> -		i915_vm_put(&ppgtt->vm);
>  	}
>  
> -	if (flags & I915_CONTEXT_CREATE_FLAGS_SINGLE_TIMELINE) {
> +	if (pc->single_timeline) {
>  		ret = drm_syncobj_create(&ctx->syncobj,
>  					 DRM_SYNCOBJ_CREATE_SIGNALED,
>  					 NULL);
> @@ -883,6 +956,7 @@ int i915_gem_context_open(struct drm_i915_private *i915,
>  			  struct drm_file *file)
>  {
>  	struct drm_i915_file_private *file_priv = file->driver_priv;
> +	struct i915_gem_proto_context *pc;
>  	struct i915_gem_context *ctx;
>  	int err;
>  	u32 id;
> @@ -892,7 +966,14 @@ int i915_gem_context_open(struct drm_i915_private *i915,
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
> @@ -1884,6 +1965,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
>  {
>  	struct drm_i915_private *i915 = to_i915(dev);
>  	struct drm_i915_gem_context_create_ext *args = data;
> +	struct i915_gem_proto_context *pc;
>  	struct create_ext ext_data;
>  	int ret;
>  	u32 id;
> @@ -1906,7 +1988,12 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
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
> index df76767f0c41b..a42c429f94577 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -46,6 +46,27 @@ struct i915_gem_engines_iter {
>  	const struct i915_gem_engines *engines;
>  };
>  
> +/**
> + * struct i915_gem_proto_context - prototype context
> + *
> + * The struct i915_gem_proto_context represents the creation parameters for
> + * an i915_gem_context.  This is used to gather parameters provided either
> + * through creation flags or via SET_CONTEXT_PARAM so that, when we create
> + * the final i915_gem_context, those parameters can be immutable.

The patch that puts them on an xa should explain how the locking here
works, even if it's rather trivial.

> + */
> +struct i915_gem_proto_context {
> +	/** @vm: See i915_gem_context::vm */
> +	struct i915_address_space *vm;
> +
> +	/** @user_flags: See i915_gem_context::user_flags */
> +	unsigned long user_flags;
> +
> +	/** @sched: See i915_gem_context::sched */
> +	struct i915_sched_attr sched;
> +

To avoid the kerneldoc warning point at your emulated syncobj here.

Also this file isn't included in the i915 context docs (why would it, the
docs have been left dead for years after all :-/). Please fix that in a
prep patch.

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

With all comments addressed: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
