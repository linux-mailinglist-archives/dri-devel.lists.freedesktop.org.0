Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9043D0EAE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 14:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A696E866;
	Wed, 21 Jul 2021 12:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DF26E866
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 12:16:32 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id r80so2578836oie.13
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=njwSea1ziU6BVgw7H9ot2aaFW7+Ie/+5EFwNmxJigRY=;
 b=iCZ62XQwr1FrYEvnKb9rhhPrbVVBCbWISvYHoMIvi86Yv4WXFKydrtqXeQiN7uArHa
 dXu5Y135xXgrmthZ3sWeS1z286+y039pnUqzcwl0hM+ZYV8k0fcO0haDBG8LHp9itZ7f
 gVWJo02EmdRlyrkc7Q/bTOQYvOf9OTu/DW/o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=njwSea1ziU6BVgw7H9ot2aaFW7+Ie/+5EFwNmxJigRY=;
 b=H111B0nJg38U/Nlf39wcryTB1cyurCbfoJXYyxvHCVvbzm7jKvQYKw7Bz4ikqJktx1
 V8SzwH7vR/blImtQBcoFfGvMJfJpYvHtTYEVMfAhmV2XFQnI6peKUDyWsQrcl7OOfPIy
 M/qondf7SDcU0FXkdU4tp07KeNLiYZvZYT3Il2ojUFy9yINTHWTYGg4b2xWnmZb61Xi6
 2oxeMYGYK57N0Xjf29PQz3lUr1vp/G/v+aCHCJCPiRdHZzRlqADLNVpoupfcG+hyf2Et
 RG3oB+aMJ1Be2g1IMjgUfd/tApBHzWyuTO2FEffDt0BbSBtWyBLI51xXDRjhkWjmVQaB
 zeIA==
X-Gm-Message-State: AOAM530+C0QAg1j5O6BIjpRSrkqHkvk2DM4PahjZ/wji9clRbnTZtMdD
 tXM7nA00vRy+Rl6KGu4FD7qXB6vRkrrHpxfTzZsr4A+qdc0=
X-Google-Smtp-Source: ABdhPJxnsSvGUe2SYBYOzQqGDqeKXLifu1FOdR+xo6Tw9PsKKOjbs1rBcUBMT0sijUL7Y1m20+qEyDHxAW9uDrLT/Qs=
X-Received: by 2002:aca:3085:: with SMTP id w127mr2298842oiw.101.1626869791382; 
 Wed, 21 Jul 2021 05:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210721114449.196015-1-matthew.auld@intel.com>
In-Reply-To: <20210721114449.196015-1-matthew.auld@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 21 Jul 2021 14:16:20 +0200
Message-ID: <CAKMK7uEDKc838yoF3R7JMS4O3qetVZqfiM9YT58DtRCkbnP=6g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/i915: document caching related bits
To: Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 1:46 PM Matthew Auld <matthew.auld@intel.com> wrote=
:
>
> Try to document the object caching related bits, like cache_coherent and
> cache_dirty.
>
> v2(Ville):
>  - As pointed out by Ville, fix the completely incorrect assumptions
>    about the "partial" coherency on shared LLC platforms.
>
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  | 173 +++++++++++++++++-
>  drivers/gpu/drm/i915/i915_drv.h               |   9 -
>  2 files changed, 169 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/g=
pu/drm/i915/gem/i915_gem_object_types.h
> index ef3de2ae9723..a809424bc8c1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -92,6 +92,76 @@ struct drm_i915_gem_object_ops {
>         const char *name; /* friendly name for debug, e.g. lockdep classe=
s */
>  };
>
> +/**
> + * enum i915_cache_level - The supported GTT caching values for system m=
emory
> + * pages.
> + *
> + * These translate to some special GTT PTE bits when binding pages into =
some
> + * address space. It also determines whether an object, or rather its pa=
ges are
> + * coherent with the GPU, when also reading or writing through the CPU c=
ache
> + * with those pages.
> + *
> + * Userspace can also control this through struct drm_i915_gem_caching.
> + */
> +enum i915_cache_level {
> +       /**
> +        * @I915_CACHE_NONE:
> +        *
> +        * Not coherent with the CPU cache. If the cache is dirty and we =
need
> +        * the underlying pages to be coherent with some later GPU access=
 then
> +        * we need to manually flush the pages.
> +        *
> +        * Note that on shared LLC platforms reads and writes through the=
 CPU
> +        * cache are still coherent even with this setting. See also
> +        * &drm_i915_gem_object.cache_coherent for more details.
> +        *
> +        * Note that on platforms with a shared LLC this should ideally o=
nly be
> +        * used for scanout surfaces, otherwise we end up over-flushing i=
n some
> +        * places.
> +        */
> +       I915_CACHE_NONE =3D 0,
> +       /**
> +        * @I915_CACHE_LLC:
> +        *
> +        * Coherent with the CPU cache. If the cache is dirty, then the G=
PU will
> +        * ensure that access remains coherent, when both reading and wri=
ting
> +        * through the CPU cache.
> +        *
> +        * Not used for scanout surfaces.
> +        *
> +        * Applies to both platforms with shared LLC(HAS_LLC), and snoopi=
ng
> +        * based platforms(HAS_SNOOP).
> +        *
> +        * This should be the default for platforms which share the LLC w=
ith the
> +        * CPU. The only exception is scanout objects, where the display =
engine
> +        * is not coherent with the LLC. For such objects I915_CACHE_NONE=
 or
> +        * I915_CACHE_WT should be used.
> +        */
> +       I915_CACHE_LLC,
> +       /**
> +        * @I915_CACHE_L3_LLC:
> +        *
> +        * Explicitly enable the Gfx L3 cache, with snooped LLC.
> +        *
> +        * The Gfx L3 sits between the domain specific caches, e.g
> +        * sampler/render caches, and the larger LLC. LLC is coherent wit=
h the
> +        * GPU, but L3 is only visible to the GPU, so likely needs to be =
flushed
> +        * when the workload completes.
> +        *
> +        * Not used for scanout surfaces.
> +        *
> +        * Only exposed on some gen7 + GGTT. More recent hardware has dro=
pped
> +        * this.
> +        */
> +       I915_CACHE_L3_LLC,
> +       /**
> +        * @I915_CACHE_WT:
> +        *
> +        * hsw:gt3e Write-through for scanout buffers.
> +        */
> +       I915_CACHE_WT,
> +};
> +
>  enum i915_map_type {
>         I915_MAP_WB =3D 0,
>         I915_MAP_WC,
> @@ -228,14 +298,109 @@ struct drm_i915_gem_object {
>         unsigned int mem_flags;
>  #define I915_BO_FLAG_STRUCT_PAGE BIT(0) /* Object backed by struct pages=
 */
>  #define I915_BO_FLAG_IOMEM       BIT(1) /* Object backed by IO memory */
> -       /*
> -        * Is the object to be mapped as read-only to the GPU
> -        * Only honoured if hardware has relevant pte bit
> +       /**
> +        * @cache_level: The desired GTT caching level.
> +        *
> +        * See enum i915_cache_level for possible values, along with what
> +        * each does.
>          */
>         unsigned int cache_level:3;
> -       unsigned int cache_coherent:2;
> +       /**
> +        * @cache_coherent:
> +        *
> +        * Track whether the pages are coherent with the GPU if reading o=
r
> +        * writing through the CPU caches. The largely depends on the
> +        * @cache_level setting.
> +        *
> +        * On platforms which don't have the shared LLC(HAS_SNOOP), like =
on Atom
> +        * platforms, coherency must be explicitly requested with some sp=
ecial
> +        * GTT caching bits(see enum i915_cache_level). When enabling coh=
erency
> +        * it does come at a performance and power cost on such platforms=
. On
> +        * the flip side the kernel does need to manually flush any buffe=
rs
> +        * which need to be coherent with the GPU, if the object is not
> +        * coherent i.e @cache_coherent is zero.
> +        *
> +        * On platforms that share the LLC with the CPU(HAS_LLC), all GT =
memory
> +        * access will automatically snoop the CPU caches(even with CACHE=
_NONE).
> +        * The one exception is when dealing with the display engine, lik=
e with
> +        * scanout surfaces. To handle this the kernel will always flush =
the
> +        * surface out of the CPU caches when preparing it for scanout.  =
Also
> +        * note that since scanout surfaces are only ever read by the dis=
play
> +        * engine we only need to care about flushing any writes through =
the CPU
> +        * cache, reads on the other hand will always be coherent.
> +        *
> +        * Something strange here is why @cache_coherent is not a simple
> +        * boolean, i.e coherent vs non-coherent. The reasoning for this =
is back
> +        * to the display engine not being fully coherent. As a result sc=
anout
> +        * surfaces will either be marked as I915_CACHE_NONE or I915_CACH=
E_WT.
> +        * In the case of seeing I915_CACHE_NONE the kernel makes the ass=
umption
> +        * that this is likely a scanout surface, and will set @cache_coh=
erent
> +        * as only I915_BO_CACHE_COHERENT_FOR_READ, on platforms with the=
 shared
> +        * LLC. The kernel uses this to avoid flushing reads, while then =
also
> +        * applying some optimisations to always flush writes through the=
 CPU
> +        * cache as early as possible, where it can, in effect keeping
> +        * @cache_dirty clean, so we can potentially avoid stalling when
> +        * flushing the surface just before doing the scanout.  This does=
 mean
> +        * we might unnecessarily flush non-scanout objects in some place=
s, but
> +        * the default assumption is that all normal objects should be us=
ing
> +        * I915_CACHE_LLC, at least on platforms with the shared LLC.
> +        *
> +        * I915_BO_CACHE_COHERENT_FOR_READ:
> +        *
> +        * When reading through the CPU cache, the GPU is still coherent.=
 Reads
> +        * through the CPU cache only become a concern when writes can by=
pass
> +        * the CPU cache.
> +        *
> +        * As an example, if some object is mapped on the CPU with write-=
back
> +        * caching, and we read some page, then the cache likely now cont=
ains
> +        * the data from that read. At this point the cache and main memo=
ry
> +        * match up, so all good. But next the GPU needs to write some da=
ta to
> +        * that same page. Now if the @cache_level is I915_CACHE_NONE and=
 the
> +        * the platform doesn't have the shared LLC, then the GPU will
> +        * effectively skip invalidating the cache(or however that works
> +        * internally) when writing the new value.  This is really bad si=
nce the
> +        * GPU has just written some new data to main memory, but the CPU=
 cache
> +        * is still valid and now contains stale data. As a result the ne=
xt time
> +        * we do a cached read with the CPU, we are rewarded with stale d=
ata.
> +        * Likewise if the cache is later flushed, we might be rewarded w=
ith
> +        * overwriting main memory with stale data.

This cannot happen.

If it does our entire clflush scheme would fall apart. We rely on an
IA guarantee that clean cachelines are dropped, never written back.

Also I'm honeslty wondering why we're storing this in the object and
not computing from cache_level and the platform? Or is this indeed set
anytime later on?

> +        *
> +        * I915_BO_CACHE_COHERENT_FOR_WRITE:
> +        *
> +        * When writing through the CPU cache, the GPU is still coherent.=
 Note
> +        * that this also implies I915_BO_CACHE_COHERENT_FOR_READ.
> +        */
>  #define I915_BO_CACHE_COHERENT_FOR_READ BIT(0)
>  #define I915_BO_CACHE_COHERENT_FOR_WRITE BIT(1)
> +       unsigned int cache_coherent:2;
> +
> +       /**
> +        * @cache_dirty:
> +        *
> +        * Track if we are we dirty with writes through the CPU cache for=
 this
> +        * object. As a result reading directly from main memory might yi=
eld
> +        * stale data.
> +        *
> +        * This also ties into whether the kernel is tracking the object =
as
> +        * coherent with the GPU, as per @cache_coherent, as it determine=
s if
> +        * flushing might be needed at various points.
> +        *
> +        * Another part of @cache_dirty is managing flushing when first
> +        * acquiring the pages for system memory, at this point the pages=
 are
> +        * considered foreign, so the default assumption is that the cach=
e is
> +        * dirty, for example the page zeroing done by the kernel might l=
eave
> +        * writes though the CPU cache, or swapping-in, while the actual =
data in
> +        * main memory is potentially stale.  Note that this is a potenti=
al
> +        * security issue when dealing with userspace objects and zeroing=
. Now,
> +        * whether we actually need apply the big sledgehammer of flushin=
g all
> +        * the pages on acquire depends on if @cache_coherent is marked a=
s
> +        * I915_BO_CACHE_COHERENT_FOR_WRITE, i.e that the GPU will be coh=
erent
> +        * for both reads and writes though the CPU cache.
> +        *
> +        * Note that on shared LLC platforms we still apply the heavy flu=
sh for
> +        * I915_CACHE_NONE objects, under the assumption that this is goi=
ng to
> +        * be used for scanout.

Uh, this makes me feel like the ehl w/a is extremely fragile.

Essentially what we're exploiting is the fact that on LLC the gpu
cannot ever do a non-coherent write, it's always coherent with cpu
caches. And so all this does is make sure we keep flushing for display
reads, which also happens to be good enough for other reads that
bypass the coherence with the new MOCS setting.

I feel like Ville's take of making this explicit about "needs
invalidate" and "needs flush" (which is what this stuff was all called
way back), maybe as functions even instead of bits we set that might
go out of sync, would be a lot clearer?

And then that function could have lots of comments about why we needs
flushes/invalidates in certain cases and why not in others.

Anyway that would be future work I guess, for now lets try to just
document this as correctly as we can.
-Daniel


> +        */
>         unsigned int cache_dirty:1;
>
>         /**
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index f99b6c0dd068..ac144d0c69a5 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -394,15 +394,6 @@ struct drm_i915_display_funcs {
>         void (*read_luts)(struct intel_crtc_state *crtc_state);
>  };
>
> -enum i915_cache_level {
> -       I915_CACHE_NONE =3D 0,
> -       I915_CACHE_LLC, /* also used for snoopable memory on non-LLC */
> -       I915_CACHE_L3_LLC, /* gen7+, L3 sits between the domain specifc
> -                             caches, eg sampler/render caches, and the
> -                             large Last-Level-Cache. LLC is coherent wit=
h
> -                             the CPU, but L3 is only visible to the GPU.=
 */
> -       I915_CACHE_WT, /* hsw:gt3e WriteThrough for scanouts */
> -};
>
>  #define I915_COLOR_UNEVICTABLE (-1) /* a non-vma sharing the address spa=
ce */
>
> --
> 2.26.3
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
