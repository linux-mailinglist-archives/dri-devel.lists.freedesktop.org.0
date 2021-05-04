Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5314372DC7
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 18:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADA36EB2B;
	Tue,  4 May 2021 16:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3972A6EB2C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 16:13:53 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id m12so14084602eja.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Bg1HlhSlXnGXt1YbJMxOkBDHJuWvw8JGXdXh+1c9iXI=;
 b=KetFdUKdnSXMuT0shm4onBC5WbBOa/GK4yk0w5SuKnaNFzJ0rO41ZciknNdFkq+eNI
 OipcL1i2GJrkuxNCxrjKBGyCydAZr88ET8zBJufpd673Be+cmzShPVetKY8HvLvFwKMR
 yO20Nbk3VlHYp5C6Uz09WVfTwVdrt8n7lS92E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bg1HlhSlXnGXt1YbJMxOkBDHJuWvw8JGXdXh+1c9iXI=;
 b=Ad6KDXc83YA37fmPBCzxj+If+GgSkRPUEvQF/1YULDYPyOVTOmuskXkrSjeWQ/z/n2
 3hOWsRwO1THgtqdOMv1gSd49GbwW0SE9YIT3JzT+3pjtYMW3LgAbO5b8nXLDqocRjn7p
 UFpFVl4/PMywTs6ubHJJ8PZonMg+WIdxOaD702GU70TQ0j98gir+NECoKLmLpBEEsIgf
 jc+NsQk2/7PsRrZnqxcCyk4icwpvO6mDQlHT1PzVov3Y0ftHgkLDN2Z0gC7Ub9Z9uqKx
 K9mQ1DP0l22FFFrPenqMBYrWnBdUHHDqI9wpuKkESTPRyetOWnrYe41X0eiUtXlTDlFb
 eTsw==
X-Gm-Message-State: AOAM530Fn0FlDnTEysRH96Dd7//kPZt1kCBXrmUABsbMD6aisK0R/qLu
 +FOT3KPvvluY/+KQVg2+4to0hnph/uYGBg==
X-Google-Smtp-Source: ABdhPJw9EDyFg7N4VAJDAhf5Fri3Clthov5mjJfRaIlIqO7EtXecuHq8gLQk9xQN/0OxNfhgN+rgWQ==
X-Received: by 2002:a17:906:f41:: with SMTP id
 h1mr23288607ejj.399.1620144831608; 
 Tue, 04 May 2021 09:13:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z17sm1613289eju.65.2021.05.04.09.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 09:13:50 -0700 (PDT)
Date: Tue, 4 May 2021 18:13:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 16/27] drm/i915/gem: Add an intermediate proto_context
 struct
Message-ID: <YJFyvfVFmE3427pl@phenom.ffwll.local>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-17-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503155748.1961781-17-jason@jlekstrand.net>
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

On Mon, May 03, 2021 at 10:57:37AM -0500, Jason Ekstrand wrote:
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
> Unfortunately, both methods of setting the VM and engine set are in
> active use today so we can't simply disallow setting the VM or engine
> set vial SET_CONTEXT_PARAM.  In order to work around this wart, this
> commit adds a proto-context struct which contains all the context create
> parameters.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

Per-patch changelog pls.

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 145 ++++++++++++++----
>  .../gpu/drm/i915/gem/i915_gem_context_types.h |  22 +++
>  .../gpu/drm/i915/gem/selftests/mock_context.c |  16 +-
>  3 files changed, 153 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 4835991898ac9..10bd1b6dd1774 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -191,6 +191,97 @@ static int validate_priority(struct drm_i915_private *i915,
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
> +		__set_bit(UCONTEXT_PERSISTENCE, &pc->user_flags);

Ok so I looked, and the reason __set_bit and friends is for endless
bitfields, i.e. where user_flags is an actually dynamically sized array.

Given that this is complete overkill I think fully open-coding the bitops
is the right bikeshed color choice. So

		user_flags &= UCONTEXT_PERSISTENCE;

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
> +		__clear_bit(UCONTEXT_PERSISTENCE, &pc->user_flags);

		user_flags &= ~UCONTEXT_PERSISTENCE;

Similar for all the others.

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
> +	if (HAS_FULL_PPGTT(i915)) {
> +		struct i915_ppgtt *ppgtt;
> +
> +		ppgtt = i915_ppgtt_create(&i915->gt);
> +		if (IS_ERR(ppgtt)) {
> +			drm_dbg(&i915->drm, "PPGTT setup failed (%ld)\n",
> +				PTR_ERR(ppgtt));
> +			err = ERR_CAST(ppgtt);
> +			goto proto_close;
> +		}
> +		pc->vm = &ppgtt->vm;

I'm not understanding why we're creating the default vm as part of the
proto context? If we end up setting one this is kinda just wasted
conditionals, and we're not really gaining in code simplicity. It's just
whether we create the default vm here (and might need to delete it) or
when we finalize the context in i915_gem_create_context().

Or am I missing something?

If it's cleaner overall I'm ok with this, just feels a bit silly.

> +	}
> +
> +	pc->user_flags = 0;
> +	__set_bit(UCONTEXT_BANNABLE, &pc->user_flags);
> +	__set_bit(UCONTEXT_RECOVERABLE, &pc->user_flags);
> +	proto_context_set_persistence(i915, pc, true);

So this I think is another case of trying too hard to share code, because
what this essentially does is pick the default through a _very_ contrived
way:
- we start out with false since we kzalloc, so everything is cleared
- we try to enable persistence, but we fail silently, so if the module
  options don't allow persistence we silently keep it at false

I think open-coding this condition would be a lot better. Also disabling
hangcheck isn't a thing anymore, but we still have code in it.

I think the right thing here is a patch which removes all occurences of
params.enable_hangcheck and replaces it with the default (which is true).

And then just set this default here directly, because not doing so would
randomly break some mesa depending how a modparam is set which otherwise
has 0 impact. Also I think the other code which checks this could end up
with a refcount underrun on !execlist platforms.

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
> @@ -660,7 +751,8 @@ static int __context_set_persistence(struct i915_gem_context *ctx, bool state)
>  }
>  
>  static struct i915_gem_context *
> -__create_context(struct drm_i915_private *i915)
> +__create_context(struct drm_i915_private *i915,
> +		 const struct i915_gem_proto_context *pc)
>  {
>  	struct i915_gem_context *ctx;
>  	struct i915_gem_engines *e;
> @@ -673,7 +765,7 @@ __create_context(struct drm_i915_private *i915)
>  
>  	kref_init(&ctx->ref);
>  	ctx->i915 = i915;
> -	ctx->sched.priority = I915_PRIORITY_NORMAL;
> +	ctx->sched = pc->sched;
>  	mutex_init(&ctx->mutex);
>  	INIT_LIST_HEAD(&ctx->link);
>  
> @@ -696,9 +788,7 @@ __create_context(struct drm_i915_private *i915)
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
> @@ -786,38 +876,23 @@ static void __assign_ppgtt(struct i915_gem_context *ctx,
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
> @@ -883,6 +958,7 @@ int i915_gem_context_open(struct drm_i915_private *i915,
>  			  struct drm_file *file)
>  {
>  	struct drm_i915_file_private *file_priv = file->driver_priv;
> +	struct i915_gem_proto_context *pc;
>  	struct i915_gem_context *ctx;
>  	int err;
>  	u32 id;
> @@ -892,7 +968,14 @@ int i915_gem_context_open(struct drm_i915_private *i915,
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
> @@ -1885,6 +1968,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
>  {
>  	struct drm_i915_private *i915 = to_i915(dev);
>  	struct drm_i915_gem_context_create_ext *args = data;
> +	struct i915_gem_proto_context *pc;
>  	struct create_ext ext_data;
>  	int ret;
>  	u32 id;
> @@ -1907,7 +1991,12 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
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
> index 5f0673a2129f9..0bf337b6d89ac 100644
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
> + * an i915_gem_context.  This is used to gather parameters provided either
> + * through creation flags or via SET_CONTEXT_PARAM so that, when we create
> + * the final i915_gem_context, those parameters can be immutable.
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
> +	/** @single_timeline: See See i915_gem_context::syncobj */
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

I think at large still looks pretty good, but some polish needed.
-Daniel

>  	if (IS_ERR(ctx))
>  		return ctx;
>  
> -- 
> 2.31.1
> 
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
