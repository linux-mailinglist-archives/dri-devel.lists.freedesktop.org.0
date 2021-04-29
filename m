Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B43836EEBD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 19:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1AA6F402;
	Thu, 29 Apr 2021 17:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F27C6F3FD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 17:19:16 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a4so67723550wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 10:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rxagbRG1JgkcQC2Cqq0fFSrtFa7citKOxKlTLvnjLE0=;
 b=Cp2F/7UG+KFtYrzm+ZiyGpYINkhslMV7IJayaGjppfzFdL7CK3UfgP8dECNVKrn8wP
 767KqC5mLg0kWk8MiSAUqv/7miiO60oAHuiqTfl2c7fzLwUeZ/AHs4Ujxaq+Cgvc7jW5
 eMvorSIotNomyTy65jRBxZhFVX3/vlgpLef3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rxagbRG1JgkcQC2Cqq0fFSrtFa7citKOxKlTLvnjLE0=;
 b=YR8dvdT9lqD+gAyWTSdJ3mx1y8qxqq7codExCFEOIZtl4Vddep3ZcstXpTQgFhIfN/
 bQTPHoQdbnv5fpVi+bPXno26myWjve85Y31yqrykL+grymv+DFLxTkwXL3NtbFuRO+4f
 1bP+RhZ1i8b7eIoq+sp5TmrAnARzlUmcm4B9/LDGAn17+ZZZMBaWA/GCsKZ99loHmDWZ
 8RTE79YuVNNQ8KQHoZAL5e35dJtDunh/CFn27jCACp8UuDNEHoCmxbTrh6falK+tY+9G
 jesJEhbA1eM5cmkAq6URB1OAK9smpvXHyDxvwS7+Wqi3WFGW+gXrWuC3GflurSgo8/GN
 rnQQ==
X-Gm-Message-State: AOAM5302Jcj1uV3fX6UsaPr7LeNEa0kJC8Il5vgcqGwiEza2J6GVY0ru
 ziA9pl4/mTABBYx1L5kWAu9ACEs18AwvqA==
X-Google-Smtp-Source: ABdhPJwC3sXBoXf0OmNwke0ns4Y6r2s0Xs4pxEQIFPkwrqGPY0/HexkxoJR9MgdEHyfDR+Ss1JGA+Q==
X-Received: by 2002:a05:6000:8b:: with SMTP id
 m11mr991892wrx.224.1619716755237; 
 Thu, 29 Apr 2021 10:19:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n2sm845022wmb.32.2021.04.29.10.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 10:19:14 -0700 (PDT)
Date: Thu, 29 Apr 2021 19:19:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 20/21] i915/gem/selftests: Assign the VM at
 context creation in igt_shared_ctx_exec
Message-ID: <YIrqkMRz04Ng5cc4@phenom.ffwll.local>
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-21-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423223131.879208-21-jason@jlekstrand.net>
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

On Fri, Apr 23, 2021 at 05:31:30PM -0500, Jason Ekstrand wrote:
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>

Maybe spend a few words on explaining why in these two selftest patches
instead of letting me guess :-)
-Daniel

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
