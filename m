Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 494EC36C1FB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 11:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A176E05F;
	Tue, 27 Apr 2021 09:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2776E90B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 09:42:48 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id x5so8474391wrv.13
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 02:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KT2W66edZ69XQDnQT+0+2BMR6V7WFCRJFChom7qgih8=;
 b=iJO0/C4X762UDmwUljVo/ODgrUwNOCMe4KzyjAY99fDk/tQ/ORVD6fY10cLPA7S3Gw
 nLYELzO83z+7ilu3HcMsM8JCUfqCyykUeIdIZETStWYNDaGP5E+wbhSvvCKs3nMpTjMt
 QuH5TRFsE4FGMO/EwLOgeJoVSqGaU7KJgmFpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KT2W66edZ69XQDnQT+0+2BMR6V7WFCRJFChom7qgih8=;
 b=GGs8pKK2fy3X2MnI5Z7sBkittI5ICr4OV7GOhEPvE6J3tl0SPd2nH6TRw1rL0hxyM4
 if3jFXbT0+xF5TbWNWanhtSVWVRXiGSoTw/PD0SrFXnxW4yGNNozc7Z23w6qGzEdocs+
 FN2rIDwL2EQh0IPLOjlfkiD3Fd1ZfbtI88Q0NzavJw2oZEnLpxZN8rKm0Wr0y0Y6lh+l
 W2kE+gfzn4lRif6+H2GDJkfO34XkIdm6ZELUtpZOIzuiovV8bT8PkD9w2CqlTLD1elF2
 8w95KHUyH6e3k9BNZlgTRcr8hzuVAF+7u6IxbU0DVwPaLGjLtbcLQKLubeE7ntrtJrIV
 FRbw==
X-Gm-Message-State: AOAM5313JdZzSg0oWU7gSEz+r0Tzre0McnRRDkvR97pWCizFn++fzcTO
 aCk7FvCaWS+6+nXnG6OtUlzIkA==
X-Google-Smtp-Source: ABdhPJzNPblunvLSqteTJhoumG+bBSPJeF4q82a0Z9RhXciHzQ4oSYQPu/Mmt/aB1H/g+7WslS6iDA==
X-Received: by 2002:a5d:628e:: with SMTP id k14mr28372063wru.150.1619516567696; 
 Tue, 27 Apr 2021 02:42:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y11sm941977wmi.41.2021.04.27.02.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:42:47 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:42:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 04/21] drm/i915/gem: Return void from context_apply_all
Message-ID: <YIfclRQW+tg4cEqj@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-5-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423223131.879208-5-jason@jlekstrand.net>
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

On Fri, Apr 23, 2021 at 05:31:14PM -0500, Jason Ekstrand wrote:
> None of the callbacks we use with it return an error code anymore; they
> all return 0 unconditionally.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

Nice.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 26 +++++++--------------
>  1 file changed, 8 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 1091cc04a242a..8a77855123cec 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -718,32 +718,25 @@ __context_engines_await(const struct i915_gem_context *ctx,
>  	return engines;
>  }
>  
> -static int
> +static void
>  context_apply_all(struct i915_gem_context *ctx,
> -		  int (*fn)(struct intel_context *ce, void *data),
> +		  void (*fn)(struct intel_context *ce, void *data),
>  		  void *data)
>  {
>  	struct i915_gem_engines_iter it;
>  	struct i915_gem_engines *e;
>  	struct intel_context *ce;
> -	int err = 0;
>  
>  	e = __context_engines_await(ctx, NULL);
> -	for_each_gem_engine(ce, e, it) {
> -		err = fn(ce, data);
> -		if (err)
> -			break;
> -	}
> +	for_each_gem_engine(ce, e, it)
> +		fn(ce, data);
>  	i915_sw_fence_complete(&e->fence);
> -
> -	return err;
>  }
>  
> -static int __apply_ppgtt(struct intel_context *ce, void *vm)
> +static void __apply_ppgtt(struct intel_context *ce, void *vm)
>  {
>  	i915_vm_put(ce->vm);
>  	ce->vm = i915_vm_get(vm);
> -	return 0;
>  }
>  
>  static struct i915_address_space *
> @@ -783,10 +776,9 @@ static void __set_timeline(struct intel_timeline **dst,
>  		intel_timeline_put(old);
>  }
>  
> -static int __apply_timeline(struct intel_context *ce, void *timeline)
> +static void __apply_timeline(struct intel_context *ce, void *timeline)
>  {
>  	__set_timeline(&ce->timeline, timeline);
> -	return 0;
>  }
>  
>  static void __assign_timeline(struct i915_gem_context *ctx,
> @@ -1842,19 +1834,17 @@ set_persistence(struct i915_gem_context *ctx,
>  	return __context_set_persistence(ctx, args->value);
>  }
>  
> -static int __apply_priority(struct intel_context *ce, void *arg)
> +static void __apply_priority(struct intel_context *ce, void *arg)
>  {
>  	struct i915_gem_context *ctx = arg;
>  
>  	if (!intel_engine_has_timeslices(ce->engine))
> -		return 0;
> +		return;
>  
>  	if (ctx->sched.priority >= I915_PRIORITY_NORMAL)
>  		intel_context_set_use_semaphores(ce);
>  	else
>  		intel_context_clear_use_semaphores(ce);
> -
> -	return 0;
>  }
>  
>  static int set_priority(struct i915_gem_context *ctx,
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
