Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 478A540F82A
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E3C6EC71;
	Fri, 17 Sep 2021 12:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73226EC72
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 12:43:37 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id w29so14957403wra.8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 05:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OEpSu03aTknllYOAJKeS+RGy2XiCrGCpQqOrL1fKqbk=;
 b=RtcacCJ/LaIquhZ03tRCalGbuGnIV2OT7MG5WyuBiZ+U6QSNOwqn4fbxZwE2ztMX51
 Pk43Aske6+8GgMUn/nhFHZDzPw/enSelAA8b3KqIh+cmd0k25UWFm4Rr8CBm45PGxYPN
 JqEDkbhzhpTip9yZ5gJ3EA23JxGVaALgfJg9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OEpSu03aTknllYOAJKeS+RGy2XiCrGCpQqOrL1fKqbk=;
 b=fWgdQ37niiGO3QI/8ViQpYFdlPxdtiPmqWg3mI5d+UaFnOXrtotdCJ3tZkZPqWb9JZ
 GlS4fMTgGBCV9r2STACU5iCA26P6BlbsIej7773J8ajIMB+HV/VIi8y/Wy7sVeYaBUux
 nV5Wohhsiib7N1/lRr/R2inwuqldx6yxAAnQAr09vC2LimjCAYHE0ZI4N5+bflL17TNN
 20uWySGOnnpahSgVRchNkewind3ZvQeVu9umhVDG08Qc96bUTn/0tD6klAViRURy/Tw5
 Ec5EYZ0xMSfCoiYIYVLrr48hJsmnpFbMxhHDNFegyL/f1y1SJBZSzZrD+k1ZWIBHM6Xx
 neKA==
X-Gm-Message-State: AOAM533X3qRcFPJ5/OERzmNzS2QqosBf8640L/UW6oR1CJvGMhdcXdLp
 ltPjvGqYFnGcw/sW7UULEjCrag==
X-Google-Smtp-Source: ABdhPJzOrXzRS76FuYC1jRpJGPf1eBLUVUjvYXW6Fh4sHu6PFg+KZUQTognmlCC8uflncNzeRDtzTQ==
X-Received: by 2002:a5d:64c9:: with SMTP id f9mr3469649wri.426.1631882616320; 
 Fri, 17 Sep 2021 05:43:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m4sm10840824wml.28.2021.09.17.05.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:43:35 -0700 (PDT)
Date: Fri, 17 Sep 2021 14:43:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/i915/debugfs: Do not report currently active engine
 when describing objects
Message-ID: <YUSNdZsDxWnxWL6F@phenom.ffwll.local>
References: <20210915114153.951670-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210915114153.951670-1-tvrtko.ursulin@linux.intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 15, 2021 at 12:41:53PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> It is not very useful to have code which tries to report a rapidly
> transient state which will not report anything majority of the time,
> especially since it is currently only used from
> <debugfs>/i915_gem_framebuffers.

Maybe mention that this is motiveated by Christian's series to rework all
the fence iteration stuff.

Also iirc the history here, this was for figuring out hangs. When the gpu
is dead, the last-write stuff isn't very transient anymore (until reset).
But we have error state capture now since forever, so this can go.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Acked-by: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.h | 17 -----------------
>  drivers/gpu/drm/i915/i915_debugfs.c        |  5 -----
>  2 files changed, 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 48112b9d76df..3043fcbd31bd 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -503,23 +503,6 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
>  	i915_gem_object_unpin_pages(obj);
>  }
>  
> -static inline struct intel_engine_cs *
> -i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
> -{
> -	struct intel_engine_cs *engine = NULL;
> -	struct dma_fence *fence;
> -
> -	rcu_read_lock();
> -	fence = dma_resv_get_excl_unlocked(obj->base.resv);
> -	rcu_read_unlock();
> -
> -	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
> -		engine = to_request(fence)->engine;
> -	dma_fence_put(fence);
> -
> -	return engine;
> -}
> -
>  void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
>  					 unsigned int cache_level);
>  void i915_gem_object_flush_if_display(struct drm_i915_gem_object *obj);
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 04351a851586..1795af81bf41 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -139,7 +139,6 @@ void
>  i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(obj->base.dev);
> -	struct intel_engine_cs *engine;
>  	struct i915_vma *vma;
>  	int pin_count = 0;
>  
> @@ -229,10 +228,6 @@ i915_debugfs_describe_obj(struct seq_file *m, struct drm_i915_gem_object *obj)
>  		seq_printf(m, " (stolen: %08llx)", obj->stolen->start);
>  	if (i915_gem_object_is_framebuffer(obj))
>  		seq_printf(m, " (fb)");
> -
> -	engine = i915_gem_object_last_write_engine(obj);
> -	if (engine)
> -		seq_printf(m, " (%s)", engine->name);
>  }
>  
>  static int i915_gem_object_info(struct seq_file *m, void *data)
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
