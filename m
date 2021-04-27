Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A51636C23A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1543D6E932;
	Tue, 27 Apr 2021 09:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DE46E933
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 09:58:24 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l2so6474075wrm.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 02:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XwXY8n/czaUq1OHTjHbFEF5ZZk0Q0pDoTELmzQRdAsw=;
 b=jtX+lEY3jIRHxAItF898AMHdWdotkWBwgc73c1CUn1+dSxtAQ9bIRjCSspFZUCSeHc
 1/yi5Qj8X+KaPCwsKkkWn83onNhxF9vWvWMxIIdSoetxW5vDh3sNZTQnoBCk8u8xbAni
 mdrfg3ymvRPdLKt6IC2FgWFQ6OKsAiKLcUB24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XwXY8n/czaUq1OHTjHbFEF5ZZk0Q0pDoTELmzQRdAsw=;
 b=PPTA9WzzMTgipdFovafxbjc1FzYmRYnLnH7K5u4rLeZgyjqKEpQh+s1G8RvX2ySqqX
 ac8PdVurdLhBD0n8rzCfScIdt48plHAUETrimxxPW11SXlLjjf+QXJ1+y4ecQ8s41aE5
 eZTaIsZAFoWrA/wk/MlVEwSqGzKeCwWZYJOp6v7EVzjyq3RbKEsn6XY4uhXR4zucbpbI
 IvX5Zp4U+dZl3DGifAN9cDlA+XmhTH6095pwiw/Kstmv5tTY3+R7QHsasq5HFTWrTh80
 h5KHNLXKX1lpZdre8NVaZLNcLWtpI0GM3mVcPo8Ar7X+q9IV3lQtJ24yEybNBWM9/M2f
 IO8g==
X-Gm-Message-State: AOAM533372pHHfwQQXSH1HK/cQus3cY+uIj6cWUP3eC6K8OcX7qhXvlp
 n/86GvhKsXnXEIjpRYeIyiHdDQ==
X-Google-Smtp-Source: ABdhPJwjQz76ax3yUhmcN9Y8y1XprHOjMqkF0jGxJlSel6Z6DXa4lmJnKkk2mZUbjMcVmtfhjokU+Q==
X-Received: by 2002:a5d:4845:: with SMTP id n5mr8466203wrs.290.1619517503410; 
 Tue, 27 Apr 2021 02:58:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v13sm1054124wrr.5.2021.04.27.02.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:58:22 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:58:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 07/21] drm/i915: Drop getparam support for
 I915_CONTEXT_PARAM_ENGINES
Message-ID: <YIfgPG+ySbH4hUH6@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-8-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423223131.879208-8-jason@jlekstrand.net>
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

On Fri, Apr 23, 2021 at 05:31:17PM -0500, Jason Ekstrand wrote:
> This has never been used by any userspace except IGT and provides no
> real functionality beyond parroting back parameters userspace passed in
> as part of context creation or via setparam.  If the context is in
> legacy mode (where you use I915_EXEC_RENDER and friends), it returns
> success with zero data so it's not useful for discovering what engines
> are in the context.  It's also not a replacement for the recently
> removed I915_CONTEXT_CLONE_ENGINES because it doesn't return any of the
> balancing or bonding information.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 77 +--------------------
>  1 file changed, 1 insertion(+), 76 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index a72c9b256723b..e8179918fa306 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1725,78 +1725,6 @@ set_engines(struct i915_gem_context *ctx,
>  	return 0;
>  }
>  
> -static int
> -get_engines(struct i915_gem_context *ctx,
> -	    struct drm_i915_gem_context_param *args)
> -{
> -	struct i915_context_param_engines __user *user;
> -	struct i915_gem_engines *e;
> -	size_t n, count, size;
> -	bool user_engines;
> -	int err = 0;
> -
> -	e = __context_engines_await(ctx, &user_engines);
> -	if (!e)
> -		return -ENOENT;
> -
> -	if (!user_engines) {
> -		i915_sw_fence_complete(&e->fence);
> -		args->size = 0;
> -		return 0;
> -	}
> -
> -	count = e->num_engines;
> -
> -	/* Be paranoid in case we have an impedance mismatch */
> -	if (!check_struct_size(user, engines, count, &size)) {
> -		err = -EINVAL;
> -		goto err_free;
> -	}
> -	if (overflows_type(size, args->size)) {
> -		err = -EINVAL;
> -		goto err_free;
> -	}
> -
> -	if (!args->size) {
> -		args->size = size;
> -		goto err_free;
> -	}
> -
> -	if (args->size < size) {
> -		err = -EINVAL;
> -		goto err_free;
> -	}
> -
> -	user = u64_to_user_ptr(args->value);
> -	if (put_user(0, &user->extensions)) {
> -		err = -EFAULT;
> -		goto err_free;
> -	}
> -
> -	for (n = 0; n < count; n++) {
> -		struct i915_engine_class_instance ci = {
> -			.engine_class = I915_ENGINE_CLASS_INVALID,
> -			.engine_instance = I915_ENGINE_CLASS_INVALID_NONE,
> -		};
> -
> -		if (e->engines[n]) {
> -			ci.engine_class = e->engines[n]->engine->uabi_class;
> -			ci.engine_instance = e->engines[n]->engine->uabi_instance;
> -		}
> -
> -		if (copy_to_user(&user->engines[n], &ci, sizeof(ci))) {
> -			err = -EFAULT;
> -			goto err_free;
> -		}
> -	}
> -
> -	args->size = size;
> -
> -err_free:
> -	i915_sw_fence_complete(&e->fence);
> -	return err;
> -}
> -
>  static int
>  set_persistence(struct i915_gem_context *ctx,
>  		const struct drm_i915_gem_context_param *args)
> @@ -2127,10 +2055,6 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
>  		ret = get_ppgtt(file_priv, ctx, args);
>  		break;
>  
> -	case I915_CONTEXT_PARAM_ENGINES:
> -		ret = get_engines(ctx, args);
> -		break;
> -
>  	case I915_CONTEXT_PARAM_PERSISTENCE:
>  		args->size = 0;
>  		args->value = i915_gem_context_is_persistent(ctx);
> @@ -2138,6 +2062,7 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
>  
>  	case I915_CONTEXT_PARAM_NO_ZEROMAP:
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
> +	case I915_CONTEXT_PARAM_ENGINES:
>  	case I915_CONTEXT_PARAM_RINGSIZE:

I like how this list keeps growing. Same thing as usual about "pls check
igt coverage".

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	default:
>  		ret = -EINVAL;
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
