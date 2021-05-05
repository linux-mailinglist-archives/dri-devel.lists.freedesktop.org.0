Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83617373828
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 11:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05476E45D;
	Wed,  5 May 2021 09:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E356E47B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 09:53:16 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id u3so1834681eja.12
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 02:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dlvByDyIDETyCNdnPyl0WbgAy6AbjGDI+04tGT0Whag=;
 b=ERAC83oal6BDOh1eVsKhk59Z9EWVWzQPLVDUccLdW7rLDjAFwcCmLBtNO0NytzmliN
 rP0vz6yTkajOtN46R3CzIKxSbn5EZacV8e4CD5J344JfsZqiA29+ZLcTN7gL2jVCm8b4
 wcpOOBnbLZDJQHreTExyGncEGBZrm9SxcTEbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dlvByDyIDETyCNdnPyl0WbgAy6AbjGDI+04tGT0Whag=;
 b=n45kLf1GW2GGPyf4Hufk1Y7RR45y8J+haQdQDHCBXiafvdhn6whaNj4mjkxnExXwTk
 82FnOVld0ndcXtyIUGEoKTAIr/uC8YerYFhm8OpPr2SdjOFszCgpNtt8p8Bejpvj2Yua
 LKr22e0QAwIUzMz0yxKBUv/iskIY8W3GyLaBNju6t90xkrulAIEbKdh5ubqm0mydwNoj
 /3UiVRoY3Fo2nWtdBR+lPzXwa4ykG5K5MFFAEispubcyNn+Zs5iaQFrs6qOZsRzodvZ4
 eGMDiT7kxdpF16TbWeBJvZWwd3d4WBfjQOZeOuWMB93yAtRbRVxpAMhdsiweGbFk3+RU
 6z3A==
X-Gm-Message-State: AOAM530CwmchWLyk7kAagOPoD9Fh1kWlfCTLqwELpJZOsxNbXGTiOZvB
 BFoYGs3rcLbvZ8cK3YmmHGCBkw==
X-Google-Smtp-Source: ABdhPJz6H6T9OTmvOLDerwnOWjZClG9G0wSlKHFvEDu904h327qxAmDXjyI7H2VMoZ2ZtF1GcOpGJg==
X-Received: by 2002:a17:906:3ec9:: with SMTP id
 d9mr26315028ejj.479.1620208395497; 
 Wed, 05 May 2021 02:53:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a24sm13833868edr.74.2021.05.05.02.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 02:53:15 -0700 (PDT)
Date: Wed, 5 May 2021 11:53:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 26/27] i915/gem/selftests: Assign the VM at
 context creation in igt_shared_ctx_exec
Message-ID: <YJJrCdLIxUE/p/rI@phenom.ffwll.local>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-27-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503155748.1961781-27-jason@jlekstrand.net>
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

On Mon, May 03, 2021 at 10:57:47AM -0500, Jason Ekstrand wrote:
> We want to delete __assign_ppgtt and, generally, stop setting the VM
> after context creation.  This is the one place I could find in the
> selftests where we set a VM after the fact.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> index 76029d7143f6c..76dd5cfe11b3c 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> @@ -813,16 +813,12 @@ static int igt_shared_ctx_exec(void *arg)
>  			struct i915_gem_context *ctx;
>  			struct intel_context *ce;
>  
> -			ctx = kernel_context(i915, NULL);
> +			ctx = kernel_context(i915, ctx_vm(parent));
>  			if (IS_ERR(ctx)) {
>  				err = PTR_ERR(ctx);
>  				goto out_test;
>  			}
>  
> -			mutex_lock(&ctx->mutex);
> -			__assign_ppgtt(ctx, ctx_vm(parent));
> -			mutex_unlock(&ctx->mutex);
> -
>  			ce = i915_gem_context_get_engine(ctx, engine->legacy_idx);
>  			GEM_BUG_ON(IS_ERR(ce));
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
