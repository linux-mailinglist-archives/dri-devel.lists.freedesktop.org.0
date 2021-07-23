Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A186C3D372A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 10:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0C06F4FF;
	Fri, 23 Jul 2021 08:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6355F6ED17;
 Fri, 23 Jul 2021 08:58:33 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id l24so1203292qtj.4;
 Fri, 23 Jul 2021 01:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j1pqlWS6KAB7Ofbtn3nZoUjKb77mdNGvuhf03UA+ozQ=;
 b=Jw6mrC7cWX4dleeF+Kn8bZxmUdgkvr0MirnmBe6+UscKSgcybWToT6KwYA6WKDYJoY
 tVSMV57l48gJk6FXOcdwlXictSICBSkYOED0IosVjBZncnJyLmWuivA7r6or+zufymdP
 RFL2yqgPrnpOkxY8UN9UCKm2KUBnQHVtv0klF8eRicPNuK+wEllIHClu3mbRooE8j9Un
 /pP9oTxEodSwzzCtkM7/U61LYKzQAnS6u3rHuPy8g4F/08DjKjPazmOWg+iiq+WRCnY2
 yy82BqpLRu7Wt7vBMLCC0mueSyobv9NbeR3Cws0BY7zAzGuB2c7fu8j0+J1kWKk9RQLP
 FrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j1pqlWS6KAB7Ofbtn3nZoUjKb77mdNGvuhf03UA+ozQ=;
 b=aLQ5AuMgFJkk8Uc0zvSjS/ChNs1EhDhW8G2oQBBaVQDeRU0VwE0KPmlVyEPPuRQ7lS
 JlQsPkgBNGViKvdgsLbJxDGqe/Z+OVjd5xbSB2ZnLzp5rV//Oe6DfKFeH62O3yZbAoVp
 KsASuOCWXX0U6o34asL7sGt7kB/U8HHrtosKP9GcJkiUZEdiACI4a1zND3Ivw6Kkuul/
 Hk8pb+caHLuTbp/t4QbmJjWSqnfL5hpNYPSHXnUrEqwvb58eTWiSIODtNcCYaHJhbNnE
 HyFSq0NMd5H2rJCzXw3vnaBPFWCRLamDbXvaGWrkZKVfDitBiDFeNNs2Ta1QeCVoMMEC
 j4ug==
X-Gm-Message-State: AOAM530oq2pSXFa9mCjC7EfQXhn+v8YU9GxTPhn/0eLczej7dWnkcel/
 CNQkabO7X4QoaCgM3yxHl8VjNPm2H/LrnF3SfWE=
X-Google-Smtp-Source: ABdhPJzysZRmN7DwlTH3BojUhKp2fpzl73JEpTYwfrPLjmvk04gQahNE5Jnpvx2lnVcuaF18XMM2udOzGZFysUM5hug=
X-Received: by 2002:ac8:584e:: with SMTP id h14mr3029795qth.339.1627030712160; 
 Fri, 23 Jul 2021 01:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210722113456.304882-1-matthew.auld@intel.com>
 <YPlcWboy4kuy5nuR@phenom.ffwll.local>
In-Reply-To: <YPlcWboy4kuy5nuR@phenom.ffwll.local>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 23 Jul 2021 09:58:05 +0100
Message-ID: <CAM0jSHMfZWqhjxe+YDOOgmqp12b2DFxPrj7PbatShg+=9DB4MA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 1/2] drm/i915: document caching related bits
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 22 Jul 2021 at 12:54, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jul 22, 2021 at 12:34:55PM +0100, Matthew Auld wrote:
> > Try to document the object caching related bits, like cache_coherent an=
d
> > cache_dirty.
> >
> > v2(Ville):
> >  - As pointed out by Ville, fix the completely incorrect assumptions
> >    about the "partial" coherency on shared LLC platforms.
> > v3(Daniel):
> >  - Fix nonsense about "dirtying" the cache with reads.
> >
> > Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > ---
> >  .../gpu/drm/i915/gem/i915_gem_object_types.h  | 176 +++++++++++++++++-
> >  drivers/gpu/drm/i915/i915_drv.h               |   9 -
> >  2 files changed, 172 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers=
/gpu/drm/i915/gem/i915_gem_object_types.h
> > index afbadfc5516b..40cce816a7e3 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > @@ -92,6 +92,76 @@ struct drm_i915_gem_object_ops {
> >       const char *name; /* friendly name for debug, e.g. lockdep classe=
s */
> >  };
> >
> > +/**
> > + * enum i915_cache_level - The supported GTT caching values for system=
 memory
> > + * pages.
> > + *
> > + * These translate to some special GTT PTE bits when binding pages int=
o some
> > + * address space. It also determines whether an object, or rather its =
pages are
> > + * coherent with the GPU, when also reading or writing through the CPU=
 cache
> > + * with those pages.
> > + *
> > + * Userspace can also control this through struct drm_i915_gem_caching=
.
> > + */
> > +enum i915_cache_level {
> > +     /**
> > +      * @I915_CACHE_NONE:
> > +      *
> > +      * Not coherent with the CPU cache. If the cache is dirty and we =
need
> > +      * the underlying pages to be coherent with some later GPU access=
 then
> > +      * we need to manually flush the pages.
> > +      *
> > +      * Note that on shared LLC platforms reads and writes through the=
 CPU
> > +      * cache are still coherent even with this setting. See also
> > +      * &drm_i915_gem_object.cache_coherent for more details.
> > +      *
> > +      * Note that on platforms with a shared LLC this should ideally o=
nly be
>
> Merge this with the previous note and maybe explain it with "Due to this
> we should only use uncached for scanout surfaces on platforms with shared
> LLC, otherwise ..."
>
> As-is reads a bit awkward/repetive.
>
> > +      * used for scanout surfaces, otherwise we end up over-flushing i=
n some
> > +      * places.
>
> Maybe also note that on non-LLC platforms uncached is the default.
>
> > +      */
> > +     I915_CACHE_NONE =3D 0,
> > +     /**
> > +      * @I915_CACHE_LLC:
> > +      *
> > +      * Coherent with the CPU cache. If the cache is dirty, then the G=
PU will
> > +      * ensure that access remains coherent, when both reading and wri=
ting
> > +      * through the CPU cache.
> > +      *
> > +      * Not used for scanout surfaces.
> > +      *
> > +      * Applies to both platforms with shared LLC(HAS_LLC), and snoopi=
ng
> > +      * based platforms(HAS_SNOOP).
> > +      *
> > +      * This should be the default for platforms which share the LLC w=
ith the
> s/should/is/
>
> After all it _is_ the default at object creation time.
>
> > +      * CPU. The only exception is scanout objects, where the display =
engine
> > +      * is not coherent with the LLC. For such objects I915_CACHE_NONE=
 or
> > +      * I915_CACHE_WT should be used.
>
> Maybe clarify that we automatically apply this transition upon
> pin_for_display if userspace hasn't done it.
>
> > +      */
> > +     I915_CACHE_LLC,
> > +     /**
> > +      * @I915_CACHE_L3_LLC:
> > +      *
> > +      * Explicitly enable the Gfx L3 cache, with snooped LLC.
> > +      *
> > +      * The Gfx L3 sits between the domain specific caches, e.g
> > +      * sampler/render caches, and the larger LLC. LLC is coherent wit=
h the
> > +      * GPU, but L3 is only visible to the GPU, so likely needs to be =
flushed
> > +      * when the workload completes.
> > +      *
> > +      * Not used for scanout surfaces.
> > +      *
> > +      * Only exposed on some gen7 + GGTT. More recent hardware has dro=
pped
> > +      * this.
>
> I think it's also the default on these?

I would say yes.

>
> > +      */
> > +     I915_CACHE_L3_LLC,
>
> > +     /**
> > +      * @I915_CACHE_WT:
> > +      *
> > +      * hsw:gt3e Write-through for scanout buffers.
>
> I haven't checked, but are we using this automatically?

Yes, if the HW supports it.

>
> > +      */
> > +     I915_CACHE_WT,
> > +};
> > +
> >  enum i915_map_type {
> >       I915_MAP_WB =3D 0,
> >       I915_MAP_WC,
> > @@ -229,14 +299,112 @@ struct drm_i915_gem_object {
> >       unsigned int mem_flags;
> >  #define I915_BO_FLAG_STRUCT_PAGE BIT(0) /* Object backed by struct pag=
es */
> >  #define I915_BO_FLAG_IOMEM       BIT(1) /* Object backed by IO memory =
*/
> > -     /*
> > -      * Is the object to be mapped as read-only to the GPU
> > -      * Only honoured if hardware has relevant pte bit
> > +     /**
> > +      * @cache_level: The desired GTT caching level.
> > +      *
> > +      * See enum i915_cache_level for possible values, along with what
> > +      * each does.
> >        */
> >       unsigned int cache_level:3;
> > -     unsigned int cache_coherent:2;
> > +     /**
> > +      * @cache_coherent:
> > +      *
> > +      * Track whether the pages are coherent with the GPU if reading o=
r
> > +      * writing through the CPU caches. The largely depends on the
> > +      * @cache_level setting.
> > +      *
> > +      * On platforms which don't have the shared LLC(HAS_SNOOP), like =
on Atom
> > +      * platforms, coherency must be explicitly requested with some sp=
ecial
> > +      * GTT caching bits(see enum i915_cache_level). When enabling coh=
erency
> > +      * it does come at a performance and power cost on such platforms=
. On
> > +      * the flip side the kernel does need to manually flush any buffe=
rs
>
> does _not_ need
>
> I think at least that's what you mean here.
>
> > +      * which need to be coherent with the GPU, if the object is not
> > +      * coherent i.e @cache_coherent is zero.
> > +      *
> > +      * On platforms that share the LLC with the CPU(HAS_LLC), all GT =
memory
> > +      * access will automatically snoop the CPU caches(even with CACHE=
_NONE).
> > +      * The one exception is when dealing with the display engine, lik=
e with
> > +      * scanout surfaces. To handle this the kernel will always flush =
the
> > +      * surface out of the CPU caches when preparing it for scanout.  =
Also
> > +      * note that since scanout surfaces are only ever read by the dis=
play
> > +      * engine we only need to care about flushing any writes through =
the CPU
> > +      * cache, reads on the other hand will always be coherent.
> > +      *
> > +      * Something strange here is why @cache_coherent is not a simple
> > +      * boolean, i.e coherent vs non-coherent. The reasoning for this =
is back
> > +      * to the display engine not being fully coherent. As a result sc=
anout
> > +      * surfaces will either be marked as I915_CACHE_NONE or I915_CACH=
E_WT.
> > +      * In the case of seeing I915_CACHE_NONE the kernel makes the ass=
umption
> > +      * that this is likely a scanout surface, and will set @cache_coh=
erent
> > +      * as only I915_BO_CACHE_COHERENT_FOR_READ, on platforms with the=
 shared
>
> Do we only do this for NONE, and not for WT? That would be a bit a bug I
> guess ...

If I'm reading this correctly, write-through only ensures we don't
need to flush the scanout surface when moving it out of the render
domain, but writes through the cache on the CPU side still need to be
flushed, so yeah I would have expected cache_coherent =3D FOR_READ here
for WT...

I guess that means we don't do the flush-early optimisations in some
places, and for the flush-on-acquire, the forced set_cache_level in
pin_to_display should still ensure cache_dirty =3D true before the
scanout?

>
> > +      * LLC. The kernel uses this to always flush writes through the C=
PU
> > +      * cache as early as possible, where it can, in effect keeping
> > +      * @cache_dirty clean, so we can potentially avoid stalling when
> > +      * flushing the surface just before doing the scanout.  This does=
 mean
> > +      * we might unnecessarily flush non-scanout objects in some place=
s, but
> > +      * the default assumption is that all normal objects should be us=
ing
> > +      * I915_CACHE_LLC, at least on platforms with the shared LLC.
> > +      *
> > +      * Supported values:
> > +      *
> > +      * I915_BO_CACHE_COHERENT_FOR_READ:
> > +      *
> > +      * On shared LLC platforms, we use this for special scanout surfa=
ces,
> > +      * where the display engine is not coherent with the CPU cache. A=
s such
> > +      * we need to ensure we flush any writes before doing the scanout=
. As an
> > +      * optimisation we try to flush any writes as early as possible t=
o avoid
> > +      * stalling later.
> > +      *
> > +      * Thus for scanout surfaces using I915_CACHE_NONE, on shared LLC
> > +      * platforms, we use:
> > +      *
> > +      *      cache_coherent =3D I915_BO_CACHE_COHERENT_FOR_READ
> > +      *
> > +      * While for normal objects that are fully coherent we use:
> > +      *
> > +      *      cache_coherent =3D I915_BO_CACHE_COHERENT_FOR_READ |
> > +      *                       I915_BO_CACHE_COHERENT_FOR_WRITE
> > +      *
> > +      * And then for objects that are not coherent at all we use:
> > +      *
> > +      *      cache_coherent =3D 0
> > +      *
> > +      * I915_BO_CACHE_COHERENT_FOR_WRITE:
> > +      *
> > +      * When writing through the CPU cache, the GPU is still coherent.=
 Note
> > +      * that this also implies I915_BO_CACHE_COHERENT_FOR_READ.
> > +      */
> >  #define I915_BO_CACHE_COHERENT_FOR_READ BIT(0)
> >  #define I915_BO_CACHE_COHERENT_FOR_WRITE BIT(1)
> > +     unsigned int cache_coherent:2;
> > +
> > +     /**
> > +      * @cache_dirty:
> > +      *
> > +      * Track if we are we dirty with writes through the CPU cache for=
 this
> > +      * object. As a result reading directly from main memory might yi=
eld
> > +      * stale data.
> > +      *
> > +      * This also ties into whether the kernel is tracking the object =
as
> > +      * coherent with the GPU, as per @cache_coherent, as it determine=
s if
> > +      * flushing might be needed at various points.
> > +      *
> > +      * Another part of @cache_dirty is managing flushing when first
> > +      * acquiring the pages for system memory, at this point the pages=
 are
> > +      * considered foreign, so the default assumption is that the cach=
e is
> > +      * dirty, for example the page zeroing done by the kernel might l=
eave
> > +      * writes though the CPU cache, or swapping-in, while the actual =
data in
> > +      * main memory is potentially stale.  Note that this is a potenti=
al
> > +      * security issue when dealing with userspace objects and zeroing=
. Now,
> > +      * whether we actually need apply the big sledgehammer of flushin=
g all
> > +      * the pages on acquire depends on if @cache_coherent is marked a=
s
> > +      * I915_BO_CACHE_COHERENT_FOR_WRITE, i.e that the GPU will be coh=
erent
> > +      * for both reads and writes though the CPU cache.
> > +      *
> > +      * Note that on shared LLC platforms we still apply the heavy flu=
sh for
> > +      * I915_CACHE_NONE objects, under the assumption that this is goi=
ng to
> > +      * be used for scanout.
> > +      */
>
> I feel like rethinking all our special cases here would be really good,
> especially around whether we need to flush for security concerns, or not.
>
> E.g. on !LLC platforms, if we set an object to CACHE_LLC, but then use
> mocs to not access is such: Can we bypass the cpu cache and potentially
> get stale data because i915 didn't force the clflush for this case?
>
> >       unsigned int cache_dirty:1;
> >
> >       /**
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i91=
5_drv.h
> > index 0321a1f9738d..f97792ccc199 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -394,15 +394,6 @@ struct drm_i915_display_funcs {
> >       void (*read_luts)(struct intel_crtc_state *crtc_state);
> >  };
> >
> > -enum i915_cache_level {
> > -     I915_CACHE_NONE =3D 0,
> > -     I915_CACHE_LLC, /* also used for snoopable memory on non-LLC */
> > -     I915_CACHE_L3_LLC, /* gen7+, L3 sits between the domain specifc
> > -                           caches, eg sampler/render caches, and the
> > -                           large Last-Level-Cache. LLC is coherent wit=
h
> > -                           the CPU, but L3 is only visible to the GPU.=
 */
> > -     I915_CACHE_WT, /* hsw:gt3e WriteThrough for scanouts */
> > -};
> >
> >  #define I915_COLOR_UNEVICTABLE (-1) /* a non-vma sharing the address s=
pace */
>
> With the nits addressed:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> >
> > --
> > 2.26.3
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
