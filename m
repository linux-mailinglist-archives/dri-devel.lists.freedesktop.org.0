Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D33399C6F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 10:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849E56F425;
	Thu,  3 Jun 2021 08:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DAA6F423
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 08:21:44 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id h24so7981878ejy.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 01:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=x4D+7F4+Vl1v1auRPIqeP5RYDYXOKPbT4GzJYIpK6dM=;
 b=Ubcg5M2zao88TMCIsomz+8StVbAkb8unLbhUzuxW09wOYKnD2ik/+z+NJIK002jgOt
 Eux/JYjTOMDikh6Nk/aj2BIwyzH8f3izVobeK6jnP6NaG/syDGGcWEXHb/Gm0F7WppFZ
 e3aIAh+94WFOxxmoYFd+mPi6XIR8I9o0BmxvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x4D+7F4+Vl1v1auRPIqeP5RYDYXOKPbT4GzJYIpK6dM=;
 b=aTo0tCFlzubKAh3hcK54f0h9zaoXRwhAOodvitZSitNsxybsJ/4d28Scpsku/mLIr1
 //d3vKgR1C9DTikGtZ97ee4PvVFMJ7cXSIacMH4SfvTVSzsTuLWpMV4GQEDiTERw+JKI
 M3vSNtZ0NH8BEvO5DAb7ulqhvHKeuKEYDuYXIkC9/08P53n9i+9RfCUT1wnt5RvcCcUX
 2FnvIbQ7GUcRK4PFJiMsc0bc0qvunWrAWCUuqJk8JAt6b0BtkvV1vHkpmbUWWYW8hATZ
 OPvxdzE1fEBmhpKR43t9uqjy6k8cJOLtAci7kTVYpLkVJg0i6z1ttiQY3idDJjXzd1wJ
 zrQA==
X-Gm-Message-State: AOAM5331Q9TL+v4T7MtTwnmc51+ffP83M67XN4cszQDOOEp6UuJjYhZW
 7HDJW66u93rVi5yqHiPAoGTwCw==
X-Google-Smtp-Source: ABdhPJxe2s+TgY2FwvsRRWESxTIyi038fneQ89Yn6HREMp+nzv+dr13yvn35GoESceTJ+WVTignnXw==
X-Received: by 2002:a17:906:2481:: with SMTP id
 e1mr38345206ejb.216.1622708503364; 
 Thu, 03 Jun 2021 01:21:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g11sm1345579edt.85.2021.06.03.01.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 01:21:42 -0700 (PDT)
Date: Thu, 3 Jun 2021 10:21:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH 3/5] drm/i915: Drop error handling from
 dma_fence_work
Message-ID: <YLiRE+6bjJqJHUhl@phenom.ffwll.local>
References: <20210602164149.391653-1-jason@jlekstrand.net>
 <20210602164149.391653-4-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602164149.391653-4-jason@jlekstrand.net>
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

Commit message missing here, something like "With fence error propagation
gone and the cmd parse being sync again all users of this disappeared".


On Wed, Jun 02, 2021 at 11:41:47AM -0500, Jason Ekstrand wrote:
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Reviewed-by: Jon Bloomfield <jon.bloomfield@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_clflush.c | 4 +---
>  drivers/gpu/drm/i915/i915_sw_fence_work.c   | 5 +----
>  drivers/gpu/drm/i915/i915_sw_fence_work.h   | 2 +-
>  drivers/gpu/drm/i915/i915_vma.c             | 3 +--
>  4 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> index daf9284ef1f54..f0435c6feb68b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
> @@ -24,13 +24,11 @@ static void __do_clflush(struct drm_i915_gem_object *obj)
>  	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
>  }
>  
> -static int clflush_work(struct dma_fence_work *base)
> +static void clflush_work(struct dma_fence_work *base)
>  {
>  	struct clflush *clflush = container_of(base, typeof(*clflush), base);
>  
>  	__do_clflush(clflush->obj);
> -
> -	return 0;
>  }
>  
>  static void clflush_release(struct dma_fence_work *base)
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.c b/drivers/gpu/drm/i915/i915_sw_fence_work.c
> index a3a81bb8f2c36..5b33ef23d54c9 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence_work.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence_work.c
> @@ -16,11 +16,8 @@ static void fence_complete(struct dma_fence_work *f)
>  static void fence_work(struct work_struct *work)
>  {
>  	struct dma_fence_work *f = container_of(work, typeof(*f), work);
> -	int err;
>  
> -	err = f->ops->work(f);
> -	if (err)
> -		dma_fence_set_error(&f->dma, err);
> +	f->ops->work(f);
>  
>  	fence_complete(f);
>  	dma_fence_put(&f->dma);
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.h b/drivers/gpu/drm/i915/i915_sw_fence_work.h
> index 2c409f11c5c59..d56806918d131 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence_work.h
> +++ b/drivers/gpu/drm/i915/i915_sw_fence_work.h
> @@ -17,7 +17,7 @@ struct dma_fence_work;
>  
>  struct dma_fence_work_ops {
>  	const char *name;
> -	int (*work)(struct dma_fence_work *f);
> +	void (*work)(struct dma_fence_work *f);
>  	void (*release)(struct dma_fence_work *f);
>  };
>  
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index a6cd0fa628477..03cdaa0f459ba 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -300,14 +300,13 @@ struct i915_vma_work {
>  	unsigned int flags;
>  };
>  
> -static int __vma_bind(struct dma_fence_work *work)
> +static void __vma_bind(struct dma_fence_work *work)
>  {
>  	struct i915_vma_work *vw = container_of(work, typeof(*vw), base);
>  	struct i915_vma *vma = vw->vma;
>  
>  	vma->ops->bind_vma(vw->vm, &vw->stash,
>  			   vma, vw->cache_level, vw->flags);
> -	return 0;
>  }
>  
>  static void __vma_release(struct dma_fence_work *work)
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
