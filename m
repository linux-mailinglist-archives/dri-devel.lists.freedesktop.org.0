Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDA836EB53
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 15:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531D96E270;
	Thu, 29 Apr 2021 13:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98A26E270
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 13:27:33 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id x7so66906907wrw.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 06:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nHqTpn1xdX0FS5YaOTe7fvRBjAOby8HWf6qD8HlB2Wk=;
 b=YdJcmPIBArsuPOOuivLwreiuHYSm+kGok7f4lj7CLJ6+gKzzc8NnGhZxc6DyJvPeMj
 xQ0fUevJC62ekAzDz22xcUnR7o0gcWUHVyuqRuJLWCvEXVMd9axt/TYT5qsgZeqYXwT/
 PWnuO3Xeeio4rUxzc/no1/en57w/RkQTcfQhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nHqTpn1xdX0FS5YaOTe7fvRBjAOby8HWf6qD8HlB2Wk=;
 b=b7oXNfdYCxB2+7tSygo/0Qw++3VTvUifY914+q9lFBVFdmhsDgu8t6liU3SVdyOcZ2
 HKN0ZpkOmll7RCh7Rq5AA8vTXyPFxvXGhLJH0RHxKx7nWvXnH0qPCU2Zl0+27Er2hY/n
 3Ale6SxZWZQbiVPgmt7ZQslHMtAeUpdA9ay3zEYZ1NnRLOaVM/rMOsTSvZ99V8ZRPoKf
 OuDIsr1yX7rFY+MSmfZpQ8pFKEKiOZDDSiVwzGTeXJTSpqhupEi1mTN+XozsbBLGAw6y
 7y6xiommnJ7a+b8Q1uN6u4W3RI1pmE21uGzFo7Cu8JaqTC6HleeYPJqQ4lCc6je/6d6n
 036g==
X-Gm-Message-State: AOAM5331uk+cyR8z/BIabybfdUROKeWXb6UW/buaqb6HPSh6MeyhohrR
 h7SEX6Ffi+OtPXxVXVXyGG4ObisyliW2wQ==
X-Google-Smtp-Source: ABdhPJyzzKSMduHQ3wI6tZpIBowroSJUQNEpsVMkjxQekOl7XfiCpYme9Wzs9KiLJ0WMjocRmbLM1g==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr9179272wrr.19.1619702852613; 
 Thu, 29 Apr 2021 06:27:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q16sm3721061wmj.24.2021.04.29.06.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 06:27:32 -0700 (PDT)
Date: Thu, 29 Apr 2021 15:27:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 14/21] drm/i915/gem: Return an error ptr from
 context_lookup
Message-ID: <YIq0QnVG5gn4cOOR@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-15-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423223131.879208-15-jason@jlekstrand.net>
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

On Fri, Apr 23, 2021 at 05:31:24PM -0500, Jason Ekstrand wrote:
> We're about to start doing lazy context creation which means contexts
> get created in i915_gem_context_lookup and we may start having more
> errors than -ENOENT.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c    | 12 ++++++------
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c |  4 ++--
>  drivers/gpu/drm/i915/i915_drv.h                |  2 +-
>  drivers/gpu/drm/i915/i915_perf.c               |  4 ++--
>  4 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 3e883daab93bf..7929d5a8be449 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -2105,8 +2105,8 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
>  	int ret = 0;
>  
>  	ctx = i915_gem_context_lookup(file_priv, args->ctx_id);
> -	if (!ctx)
> -		return -ENOENT;
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
>  
>  	switch (args->param) {
>  	case I915_CONTEXT_PARAM_GTT_SIZE:
> @@ -2174,8 +2174,8 @@ int i915_gem_context_setparam_ioctl(struct drm_device *dev, void *data,
>  	int ret;
>  
>  	ctx = i915_gem_context_lookup(file_priv, args->ctx_id);
> -	if (!ctx)
> -		return -ENOENT;
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
>  
>  	ret = ctx_setparam(file_priv, ctx, args);
>  
> @@ -2194,8 +2194,8 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev,
>  		return -EINVAL;
>  
>  	ctx = i915_gem_context_lookup(file->driver_priv, args->ctx_id);
> -	if (!ctx)
> -		return -ENOENT;
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
>  
>  	/*
>  	 * We opt for unserialised reads here. This may result in tearing
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 7024adcd5cf15..de14b26f3b2d5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -739,8 +739,8 @@ static int eb_select_context(struct i915_execbuffer *eb)
>  	struct i915_gem_context *ctx;
>  
>  	ctx = i915_gem_context_lookup(eb->file->driver_priv, eb->args->rsvd1);
> -	if (unlikely(!ctx))
> -		return -ENOENT;
> +	if (unlikely(IS_ERR(ctx)))
> +		return PTR_ERR(ctx);
>  
>  	eb->gem_context = ctx;
>  	if (rcu_access_pointer(ctx->vm))
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 8571c5c1509a7..004ed0e59c999 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h

I just realized that I think __i915_gem_context_lookup_rcu doesn't have
users anymore. Please make sure it's deleted.

> @@ -1851,7 +1851,7 @@ i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
>  		ctx = NULL;
>  	rcu_read_unlock();
>  
> -	return ctx;
> +	return ctx ? ctx : ERR_PTR(-ENOENT);
>  }
>  
>  /* i915_gem_evict.c */
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 85ad62dbabfab..b86ed03f6a705 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -3414,10 +3414,10 @@ i915_perf_open_ioctl_locked(struct i915_perf *perf,
>  		struct drm_i915_file_private *file_priv = file->driver_priv;
>  
>  		specific_ctx = i915_gem_context_lookup(file_priv, ctx_handle);
> -		if (!specific_ctx) {
> +		if (IS_ERR(specific_ctx)) {
>  			DRM_DEBUG("Failed to look up context with ID %u for opening perf stream\n",
>  				  ctx_handle);
> -			ret = -ENOENT;
> +			ret = PTR_ERR(specific_ctx);

Yeah this looks like a nice place to integrate this.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

One thing we need to make sure in the next patch or thereabouts is that
lookup can only return ENOENT or ENOMEM, but never EINVAL. I'll drop some
bikesheds on that :-)
-Daniel

>  			goto err;
>  		}
>  	}
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
