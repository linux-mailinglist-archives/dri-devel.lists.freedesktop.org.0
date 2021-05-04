Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FCA372789
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 10:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456CE6EAB0;
	Tue,  4 May 2021 08:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676376EAB0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 08:48:33 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id di13so9519900edb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 01:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+1LtTl77EdyNVySiQUSZu2AtQhl9JbGUg/ZM00PeZoQ=;
 b=Y9AVWsWMbbRTbPChyW6gjMPNkWIg4CwJQqHSKaK6oXw1Uapo9PMvVVJZo0QSeiDpGR
 2+pOCNeS1ltbx8+YLkZ4kXIGszx/EiVi2tz9NIenOTzM2YgrFw3E3I+zgDsiSTnyHygX
 OYwllX53Jq/EQwI+PnM+uyhzothaf81RvXeG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+1LtTl77EdyNVySiQUSZu2AtQhl9JbGUg/ZM00PeZoQ=;
 b=Vvk3ePWUr3N4w779dh7U3tIcM50AU4nlznK+az4xLU+GPiBkXqRNa4KcmWlynOVvtP
 +i4Tlgyr3yhkl5q1819dBmRPntqAZC8HK/+w/7IOXWHJh3tgvL6Fj+m9h+jULwurbQBm
 bRhSwobh0wWBod6B4/eNLHmM7SCy3P3Qd/IqQeQ39L0eb7KLYrAhOFFrDtFH6A4WWsE6
 eoDMO6VrqEBold8w+ZdVevYawZrwuai0G8CH7nQrX5Rr1aXZA7TwLBdWylOGqiqJDGSj
 M9rKmbe8OfdvH6qlZP39yFEDHrB81fyQpZ4miE0+K5Le3mJep8So/hffEbszQVufaalX
 ZWAg==
X-Gm-Message-State: AOAM532H//ubeSmm9CIeEKbgjoPZULuZfL/GcTpiJluCOTUisMyLDEkr
 UREmFuoLOojS8N3tReXYRuaJsHV4N6dZpg==
X-Google-Smtp-Source: ABdhPJzMDbJd1+JhawUDuY6Rf9dLw6DWjQOoIzGtjn8MtMn24qIMvlkQ6UxRdoQ+vZSLj9xZAfjdag==
X-Received: by 2002:a50:ee85:: with SMTP id f5mr25234698edr.8.1620118111990;
 Tue, 04 May 2021 01:48:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z22sm15434621edm.57.2021.05.04.01.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 01:48:31 -0700 (PDT)
Date: Tue, 4 May 2021 10:48:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 03/27] drm/i915: Drop
 I915_CONTEXT_PARAM_NO_ZEROMAP
Message-ID: <YJEKXsMoBgzqYQyn@phenom.ffwll.local>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-4-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503155748.1961781-4-jason@jlekstrand.net>
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

On Mon, May 03, 2021 at 10:57:24AM -0500, Jason Ekstrand wrote:
> The idea behind this param is to support OpenCL drivers with relocations
> because OpenCL reserves 0x0 for NULL and, if we placed memory there, it
> would confuse CL kernels.  It was originally sent out as part of a patch
> series including libdrm [1] and Beignet [2] support.  However, the
> libdrm and Beignet patches never landed in their respective upstream
> projects so this API has never been used.  It's never been used in Mesa
> or any other driver, either.
> 
> Dropping this API allows us to delete a small bit of code.
> 
> [1]: https://lists.freedesktop.org/archives/intel-gfx/2015-May/067030.html
> [2]: https://lists.freedesktop.org/archives/intel-gfx/2015-May/067031.html
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

Hm I forgot to r-b this last time around.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c      | 16 ++--------------
>  .../gpu/drm/i915/gem/i915_gem_context_types.h    |  1 -
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c   |  8 --------
>  include/uapi/drm/i915_drm.h                      |  4 ++++
>  4 files changed, 6 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 2ba4c7e4011b4..44841db04301b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1921,15 +1921,6 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
>  	int ret = 0;
>  
>  	switch (args->param) {
> -	case I915_CONTEXT_PARAM_NO_ZEROMAP:
> -		if (args->size)
> -			ret = -EINVAL;
> -		else if (args->value)
> -			set_bit(UCONTEXT_NO_ZEROMAP, &ctx->user_flags);
> -		else
> -			clear_bit(UCONTEXT_NO_ZEROMAP, &ctx->user_flags);
> -		break;
> -
>  	case I915_CONTEXT_PARAM_NO_ERROR_CAPTURE:
>  		if (args->size)
>  			ret = -EINVAL;
> @@ -1979,6 +1970,7 @@ static int ctx_setparam(struct drm_i915_file_private *fpriv,
>  		ret = set_persistence(ctx, args);
>  		break;
>  
> +	case I915_CONTEXT_PARAM_NO_ZEROMAP:
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
>  	case I915_CONTEXT_PARAM_RINGSIZE:
>  	default:
> @@ -2359,11 +2351,6 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
>  		return -ENOENT;
>  
>  	switch (args->param) {
> -	case I915_CONTEXT_PARAM_NO_ZEROMAP:
> -		args->size = 0;
> -		args->value = test_bit(UCONTEXT_NO_ZEROMAP, &ctx->user_flags);
> -		break;
> -
>  	case I915_CONTEXT_PARAM_GTT_SIZE:
>  		args->size = 0;
>  		rcu_read_lock();
> @@ -2411,6 +2398,7 @@ int i915_gem_context_getparam_ioctl(struct drm_device *dev, void *data,
>  		args->value = i915_gem_context_is_persistent(ctx);
>  		break;
>  
> +	case I915_CONTEXT_PARAM_NO_ZEROMAP:
>  	case I915_CONTEXT_PARAM_BAN_PERIOD:
>  	case I915_CONTEXT_PARAM_RINGSIZE:
>  	default:
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index 340473aa70de0..5ae71ec936f7c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -129,7 +129,6 @@ struct i915_gem_context {
>  	 * @user_flags: small set of booleans controlled by the user
>  	 */
>  	unsigned long user_flags;
> -#define UCONTEXT_NO_ZEROMAP		0
>  #define UCONTEXT_NO_ERROR_CAPTURE	1
>  #define UCONTEXT_BANNABLE		2
>  #define UCONTEXT_RECOVERABLE		3
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 297143511f99b..b812f313422a9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -290,7 +290,6 @@ struct i915_execbuffer {
>  	struct intel_context *reloc_context;
>  
>  	u64 invalid_flags; /** Set of execobj.flags that are invalid */
> -	u32 context_flags; /** Set of execobj.flags to insert from the ctx */
>  
>  	u64 batch_len; /** Length of batch within object */
>  	u32 batch_start_offset; /** Location within object of batch */
> @@ -541,9 +540,6 @@ eb_validate_vma(struct i915_execbuffer *eb,
>  			entry->flags |= EXEC_OBJECT_NEEDS_GTT | __EXEC_OBJECT_NEEDS_MAP;
>  	}
>  
> -	if (!(entry->flags & EXEC_OBJECT_PINNED))
> -		entry->flags |= eb->context_flags;
> -
>  	return 0;
>  }
>  
> @@ -750,10 +746,6 @@ static int eb_select_context(struct i915_execbuffer *eb)
>  	if (rcu_access_pointer(ctx->vm))
>  		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
>  
> -	eb->context_flags = 0;
> -	if (test_bit(UCONTEXT_NO_ZEROMAP, &ctx->user_flags))
> -		eb->context_flags |= __EXEC_OBJECT_NEEDS_BIAS;
> -
>  	return 0;
>  }
>  
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index 6eefbc6dec01f..a0aaa8298f28d 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1637,6 +1637,10 @@ struct drm_i915_gem_context_param {
>  	__u32 size;
>  	__u64 param;
>  #define I915_CONTEXT_PARAM_BAN_PERIOD	0x1
> +/* I915_CONTEXT_PARAM_NO_ZEROMAP has been removed.  On the off chance
> + * someone somewhere has attempted to use it, never re-use this context
> + * param number.
> + */
>  #define I915_CONTEXT_PARAM_NO_ZEROMAP	0x2
>  #define I915_CONTEXT_PARAM_GTT_SIZE	0x3
>  #define I915_CONTEXT_PARAM_NO_ERROR_CAPTURE	0x4
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
