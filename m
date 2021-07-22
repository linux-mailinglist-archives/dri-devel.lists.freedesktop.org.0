Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE59B3D2303
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 13:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7784B6E2D8;
	Thu, 22 Jul 2021 11:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49AE6E8F0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 11:54:04 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id v1so6431814edt.6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 04:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=3EEI1b1jJZ56WorEiVn95rs32GE5xdJFWo665dA4qkc=;
 b=S8oLU5yeQNAg6PDheEwTFx2wzs2tirnIqA95MgW+syjVu34dyXjcx6A7e7EGpIQ/J7
 1FEBvSElAT6VFdcd4Sxl0yG/8Axz50h9chen3yM5Wno6pHNGZ9f0S+5GBb5iz99ZoRjV
 04/efjFBUakRzjSk5wS3/4MEA6nopv2wvF+3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3EEI1b1jJZ56WorEiVn95rs32GE5xdJFWo665dA4qkc=;
 b=MVF6ooctbjOHhR630Fe/q6PrdTmkDw9b0AGdx+HHRaC4sQEwvzQ97W+Glc/kxUi1ET
 Tsbaa2DwUuo7UPfKMZgsKu69pMJQfxQU7T/g6yJWFL3NS/5jrFN1lfX44JJomgXfx2+b
 r7nVVEjVsLgy+bskfCLMwaKKKl/3u/hza8SMOF/y0iEYllInR7Qg1Jz1bd8OgwmY5xEp
 MmE5G1WdDn0o/z27+V3o11Odwgn+GetcpY1URyTfkusEAmh+AUjJvWKXIpzNxau7yQ+B
 t52V3D4KTegbZcpyFruzTAL8R1FP9QnGH+5zaz9RpwLM7fKs0qjnAe6WngZwNGMm2ZL2
 DWFw==
X-Gm-Message-State: AOAM531MTzAXVV6e0ys0/BLtRnDdeXKKD/u1rnf5zLvhcDgHqxaA9xnG
 OGaUpABr4Ki6VL8D5VfwDaF1Rg==
X-Google-Smtp-Source: ABdhPJwFiJqZTcp5ERi9jQ+8KrjWTDLFmBTVAqhdsDxGOZsnhwNTNG2t7ZZMlkpVt9bhXoiiby2jHg==
X-Received: by 2002:a05:6402:198:: with SMTP id
 r24mr54493548edv.93.1626954843287; 
 Thu, 22 Jul 2021 04:54:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n6sm9435472ejc.120.2021.07.22.04.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 04:54:02 -0700 (PDT)
Date: Thu, 22 Jul 2021 13:54:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/2] drm/i915: document caching related bits
Message-ID: <YPlcWboy4kuy5nuR@phenom.ffwll.local>
References: <20210722113456.304882-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210722113456.304882-1-matthew.auld@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 12:34:55PM +0100, Matthew Auld wrote:
> Try to document the object caching related bits, like cache_coherent and
> cache_dirty.
> 
> v2(Ville):
>  - As pointed out by Ville, fix the completely incorrect assumptions
>    about the "partial" coherency on shared LLC platforms.
> v3(Daniel):
>  - Fix nonsense about "dirtying" the cache with reads.
> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  | 176 +++++++++++++++++-
>  drivers/gpu/drm/i915/i915_drv.h               |   9 -
>  2 files changed, 172 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index afbadfc5516b..40cce816a7e3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -92,6 +92,76 @@ struct drm_i915_gem_object_ops {
>  	const char *name; /* friendly name for debug, e.g. lockdep classes */
>  };
>  
> +/**
> + * enum i915_cache_level - The supported GTT caching values for system memory
> + * pages.
> + *
> + * These translate to some special GTT PTE bits when binding pages into some
> + * address space. It also determines whether an object, or rather its pages are
> + * coherent with the GPU, when also reading or writing through the CPU cache
> + * with those pages.
> + *
> + * Userspace can also control this through struct drm_i915_gem_caching.
> + */
> +enum i915_cache_level {
> +	/**
> +	 * @I915_CACHE_NONE:
> +	 *
> +	 * Not coherent with the CPU cache. If the cache is dirty and we need
> +	 * the underlying pages to be coherent with some later GPU access then
> +	 * we need to manually flush the pages.
> +	 *
> +	 * Note that on shared LLC platforms reads and writes through the CPU
> +	 * cache are still coherent even with this setting. See also
> +	 * &drm_i915_gem_object.cache_coherent for more details.
> +	 *
> +	 * Note that on platforms with a shared LLC this should ideally only be

Merge this with the previous note and maybe explain it with "Due to this
we should only use uncached for scanout surfaces on platforms with shared
LLC, otherwise ..."

As-is reads a bit awkward/repetive.

> +	 * used for scanout surfaces, otherwise we end up over-flushing in some
> +	 * places.

Maybe also note that on non-LLC platforms uncached is the default.

> +	 */
> +	I915_CACHE_NONE = 0,
> +	/**
> +	 * @I915_CACHE_LLC:
> +	 *
> +	 * Coherent with the CPU cache. If the cache is dirty, then the GPU will
> +	 * ensure that access remains coherent, when both reading and writing
> +	 * through the CPU cache.
> +	 *
> +	 * Not used for scanout surfaces.
> +	 *
> +	 * Applies to both platforms with shared LLC(HAS_LLC), and snooping
> +	 * based platforms(HAS_SNOOP).
> +	 *
> +	 * This should be the default for platforms which share the LLC with the
s/should/is/

After all it _is_ the default at object creation time.

> +	 * CPU. The only exception is scanout objects, where the display engine
> +	 * is not coherent with the LLC. For such objects I915_CACHE_NONE or
> +	 * I915_CACHE_WT should be used.

Maybe clarify that we automatically apply this transition upon
pin_for_display if userspace hasn't done it.

> +	 */
> +	I915_CACHE_LLC,
> +	/**
> +	 * @I915_CACHE_L3_LLC:
> +	 *
> +	 * Explicitly enable the Gfx L3 cache, with snooped LLC.
> +	 *
> +	 * The Gfx L3 sits between the domain specific caches, e.g
> +	 * sampler/render caches, and the larger LLC. LLC is coherent with the
> +	 * GPU, but L3 is only visible to the GPU, so likely needs to be flushed
> +	 * when the workload completes.
> +	 *
> +	 * Not used for scanout surfaces.
> +	 *
> +	 * Only exposed on some gen7 + GGTT. More recent hardware has dropped
> +	 * this.

I think it's also the default on these?

> +	 */
> +	I915_CACHE_L3_LLC,

> +	/**
> +	 * @I915_CACHE_WT:
> +	 *
> +	 * hsw:gt3e Write-through for scanout buffers.

I haven't checked, but are we using this automatically?

> +	 */
> +	I915_CACHE_WT,
> +};
> +
>  enum i915_map_type {
>  	I915_MAP_WB = 0,
>  	I915_MAP_WC,
> @@ -229,14 +299,112 @@ struct drm_i915_gem_object {
>  	unsigned int mem_flags;
>  #define I915_BO_FLAG_STRUCT_PAGE BIT(0) /* Object backed by struct pages */
>  #define I915_BO_FLAG_IOMEM       BIT(1) /* Object backed by IO memory */
> -	/*
> -	 * Is the object to be mapped as read-only to the GPU
> -	 * Only honoured if hardware has relevant pte bit
> +	/**
> +	 * @cache_level: The desired GTT caching level.
> +	 *
> +	 * See enum i915_cache_level for possible values, along with what
> +	 * each does.
>  	 */
>  	unsigned int cache_level:3;
> -	unsigned int cache_coherent:2;
> +	/**
> +	 * @cache_coherent:
> +	 *
> +	 * Track whether the pages are coherent with the GPU if reading or
> +	 * writing through the CPU caches. The largely depends on the
> +	 * @cache_level setting.
> +	 *
> +	 * On platforms which don't have the shared LLC(HAS_SNOOP), like on Atom
> +	 * platforms, coherency must be explicitly requested with some special
> +	 * GTT caching bits(see enum i915_cache_level). When enabling coherency
> +	 * it does come at a performance and power cost on such platforms. On
> +	 * the flip side the kernel does need to manually flush any buffers

does _not_ need

I think at least that's what you mean here.

> +	 * which need to be coherent with the GPU, if the object is not
> +	 * coherent i.e @cache_coherent is zero.
> +	 *
> +	 * On platforms that share the LLC with the CPU(HAS_LLC), all GT memory
> +	 * access will automatically snoop the CPU caches(even with CACHE_NONE).
> +	 * The one exception is when dealing with the display engine, like with
> +	 * scanout surfaces. To handle this the kernel will always flush the
> +	 * surface out of the CPU caches when preparing it for scanout.  Also
> +	 * note that since scanout surfaces are only ever read by the display
> +	 * engine we only need to care about flushing any writes through the CPU
> +	 * cache, reads on the other hand will always be coherent.
> +	 *
> +	 * Something strange here is why @cache_coherent is not a simple
> +	 * boolean, i.e coherent vs non-coherent. The reasoning for this is back
> +	 * to the display engine not being fully coherent. As a result scanout
> +	 * surfaces will either be marked as I915_CACHE_NONE or I915_CACHE_WT.
> +	 * In the case of seeing I915_CACHE_NONE the kernel makes the assumption
> +	 * that this is likely a scanout surface, and will set @cache_coherent
> +	 * as only I915_BO_CACHE_COHERENT_FOR_READ, on platforms with the shared

Do we only do this for NONE, and not for WT? That would be a bit a bug I
guess ...

> +	 * LLC. The kernel uses this to always flush writes through the CPU
> +	 * cache as early as possible, where it can, in effect keeping
> +	 * @cache_dirty clean, so we can potentially avoid stalling when
> +	 * flushing the surface just before doing the scanout.  This does mean
> +	 * we might unnecessarily flush non-scanout objects in some places, but
> +	 * the default assumption is that all normal objects should be using
> +	 * I915_CACHE_LLC, at least on platforms with the shared LLC.
> +	 *
> +	 * Supported values:
> +	 *
> +	 * I915_BO_CACHE_COHERENT_FOR_READ:
> +	 *
> +	 * On shared LLC platforms, we use this for special scanout surfaces,
> +	 * where the display engine is not coherent with the CPU cache. As such
> +	 * we need to ensure we flush any writes before doing the scanout. As an
> +	 * optimisation we try to flush any writes as early as possible to avoid
> +	 * stalling later.
> +	 *
> +	 * Thus for scanout surfaces using I915_CACHE_NONE, on shared LLC
> +	 * platforms, we use:
> +	 *
> +	 *	cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ
> +	 *
> +	 * While for normal objects that are fully coherent we use:
> +	 *
> +	 *	cache_coherent = I915_BO_CACHE_COHERENT_FOR_READ |
> +	 *			 I915_BO_CACHE_COHERENT_FOR_WRITE
> +	 *
> +	 * And then for objects that are not coherent at all we use:
> +	 *
> +	 *	cache_coherent = 0
> +	 *
> +	 * I915_BO_CACHE_COHERENT_FOR_WRITE:
> +	 *
> +	 * When writing through the CPU cache, the GPU is still coherent. Note
> +	 * that this also implies I915_BO_CACHE_COHERENT_FOR_READ.
> +	 */
>  #define I915_BO_CACHE_COHERENT_FOR_READ BIT(0)
>  #define I915_BO_CACHE_COHERENT_FOR_WRITE BIT(1)
> +	unsigned int cache_coherent:2;
> +
> +	/**
> +	 * @cache_dirty:
> +	 *
> +	 * Track if we are we dirty with writes through the CPU cache for this
> +	 * object. As a result reading directly from main memory might yield
> +	 * stale data.
> +	 *
> +	 * This also ties into whether the kernel is tracking the object as
> +	 * coherent with the GPU, as per @cache_coherent, as it determines if
> +	 * flushing might be needed at various points.
> +	 *
> +	 * Another part of @cache_dirty is managing flushing when first
> +	 * acquiring the pages for system memory, at this point the pages are
> +	 * considered foreign, so the default assumption is that the cache is
> +	 * dirty, for example the page zeroing done by the kernel might leave
> +	 * writes though the CPU cache, or swapping-in, while the actual data in
> +	 * main memory is potentially stale.  Note that this is a potential
> +	 * security issue when dealing with userspace objects and zeroing. Now,
> +	 * whether we actually need apply the big sledgehammer of flushing all
> +	 * the pages on acquire depends on if @cache_coherent is marked as
> +	 * I915_BO_CACHE_COHERENT_FOR_WRITE, i.e that the GPU will be coherent
> +	 * for both reads and writes though the CPU cache.
> +	 *
> +	 * Note that on shared LLC platforms we still apply the heavy flush for
> +	 * I915_CACHE_NONE objects, under the assumption that this is going to
> +	 * be used for scanout.
> +	 */

I feel like rethinking all our special cases here would be really good,
especially around whether we need to flush for security concerns, or not.

E.g. on !LLC platforms, if we set an object to CACHE_LLC, but then use
mocs to not access is such: Can we bypass the cpu cache and potentially
get stale data because i915 didn't force the clflush for this case?

>  	unsigned int cache_dirty:1;
>  
>  	/**
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 0321a1f9738d..f97792ccc199 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -394,15 +394,6 @@ struct drm_i915_display_funcs {
>  	void (*read_luts)(struct intel_crtc_state *crtc_state);
>  };
>  
> -enum i915_cache_level {
> -	I915_CACHE_NONE = 0,
> -	I915_CACHE_LLC, /* also used for snoopable memory on non-LLC */
> -	I915_CACHE_L3_LLC, /* gen7+, L3 sits between the domain specifc
> -			      caches, eg sampler/render caches, and the
> -			      large Last-Level-Cache. LLC is coherent with
> -			      the CPU, but L3 is only visible to the GPU. */
> -	I915_CACHE_WT, /* hsw:gt3e WriteThrough for scanouts */
> -};
>  
>  #define I915_COLOR_UNEVICTABLE (-1) /* a non-vma sharing the address space */

With the nits addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
> -- 
> 2.26.3
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
