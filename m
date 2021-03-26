Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F3F349DC0
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 01:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B756E108;
	Fri, 26 Mar 2021 00:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAF06EE6B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 00:25:35 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e18so4018908wrt.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 17:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=S/RUiFmh7V+PoKkjgt1cusXMGd2gA07gS3MqT7ryX7c=;
 b=ITq0zjdcEe/ACb95eMyKwgljquOghrdw82x/mm9aNUMFACwLqBGmXS3fMXduw5CyzD
 opbj4ujUIscfAalQA2JeX0pkB0vQrzjiUiFmtX6kLYPgs0VFlj+kS2pXTzRp7CXVCcZp
 uT15Im+vHy+Rg65nn7vzRisadE5iE9dJDJz8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S/RUiFmh7V+PoKkjgt1cusXMGd2gA07gS3MqT7ryX7c=;
 b=CQUXTPO+15jv8yace+wIVxdXNj4sk2wwXHa/WnyjMZiSAiTmg22th2OKQW7YG1XWYx
 EyWjpjxaHHe5LTpJJR67cArF6WrXwg72R5F22k91nhraP/cyw+vhF21jRea9erkF2hvU
 5rG6I7Gy7NyfqOH84JO1PGSJQk+XC/inXd+0jGUBd+B3UpwF6bmJZfKo8iB/cw94yoby
 6udDgohMEfTAtwNi3mVB/JMezpQdYF0P6cj1x9PP3aLNxqaQzRf1rNWsylPDMFa/YoVW
 cla3HQHIs32OnC1CXCmYt4x859Y3Ttq3KG5a+lGhlxfEoXCDho0I3vEmt53DhL+yrsnF
 5pZw==
X-Gm-Message-State: AOAM532JKIq7/9pOmZKgAv2Ff0SMnwV6IlbdJIK1ES8EBdUR+MarWJJB
 6nC50wRa+PjorZJVV/VIZXnPB6wDPgyWDuiA
X-Google-Smtp-Source: ABdhPJwN388BAdafFw9S0MsnPX1RfpZKKpUrvIVmywnWBiwFZJaZcFpmBIqzw3WfFnwiC3kMAh8Lfg==
X-Received: by 2002:a5d:604b:: with SMTP id j11mr2462759wrt.424.1616718334064; 
 Thu, 25 Mar 2021 17:25:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c131sm8722637wma.37.2021.03.25.17.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:25:33 -0700 (PDT)
Date: Fri, 26 Mar 2021 01:25:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 7/7] drm/i915: Allow configuring default request expiry
 via modparam
Message-ID: <YF0p++UNk4R6d+G6@phenom.ffwll.local>
References: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
 <20210324121335.2307063-8-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210324121335.2307063-8-tvrtko.ursulin@linux.intel.com>
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

On Wed, Mar 24, 2021 at 12:13:35PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Module parameter is added (request_timeout_ms) to allow configuring the
> default request/fence expiry.
> 
> Default value is inherited from CONFIG_DRM_I915_REQUEST_TIMEOUT.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Entire series merged, thanks for the patches.
-Daniel

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 5 +++--
>  drivers/gpu/drm/i915/i915_params.c          | 5 +++++
>  drivers/gpu/drm/i915/i915_params.h          | 1 +
>  3 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 33ff1a6a7724..0e8f0476e01f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -845,11 +845,12 @@ static void __set_default_fence_expiry(struct i915_gem_context *ctx)
>  	struct drm_i915_private *i915 = ctx->i915;
>  	int ret;
>  
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT))
> +	if (!IS_ACTIVE(CONFIG_DRM_I915_REQUEST_TIMEOUT) ||
> +	    !i915->params.request_timeout_ms)
>  		return;
>  
>  	/* Default expiry for user fences. */
> -	ret = __set_watchdog(ctx, CONFIG_DRM_I915_REQUEST_TIMEOUT * 1000);
> +	ret = __set_watchdog(ctx, i915->params.request_timeout_ms * 1000);
>  	if (ret)
>  		drm_notice(&i915->drm,
>  			   "Failed to configure default fence expiry! (%d)",
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index 6939634e56ed..0320878d96b0 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -197,6 +197,11 @@ i915_param_named_unsafe(fake_lmem_start, ulong, 0400,
>  	"Fake LMEM start offset (default: 0)");
>  #endif
>  
> +#if CONFIG_DRM_I915_REQUEST_TIMEOUT
> +i915_param_named_unsafe(request_timeout_ms, uint, 0600,
> +			"Default request/fence/batch buffer expiration timeout.");
> +#endif
> +
>  static __always_inline void _print_param(struct drm_printer *p,
>  					 const char *name,
>  					 const char *type,
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
> index 48f47e44e848..34ebb0662547 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -72,6 +72,7 @@ struct drm_printer;
>  	param(int, enable_dpcd_backlight, -1, 0600) \
>  	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE, 0400) \
>  	param(unsigned long, fake_lmem_start, 0, 0400) \
> +	param(unsigned int, request_timeout_ms, CONFIG_DRM_I915_REQUEST_TIMEOUT, 0600) \
>  	/* leave bools at the end to not create holes */ \
>  	param(bool, enable_hangcheck, true, 0600) \
>  	param(bool, load_detect_test, false, 0600) \
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
