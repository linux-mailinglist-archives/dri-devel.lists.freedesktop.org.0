Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B62403CB9AF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 17:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770366E9B3;
	Fri, 16 Jul 2021 15:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A144B6E9B3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 15:23:42 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id v189so15444561ybg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 08:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v9xm2NUuIGJhvQLJdwRo8QScJi5ZIrJjEVzynV5Skg8=;
 b=YpqswT5m2fAAtR/jsNIIHQsk+qJO7jIC45YFFHf5DxxwECZ6sJVS+jwIiZyvWTT0bP
 hAU78pz3sc5qbny+087j0UvakF0VGixqR7CGlQsXNND+WzqUWT5e8sDI8BZ/YZdSnK8v
 dO5DX4HfWrOX9an5C11KYAJWLnebgcXC1RkJYK2aLOIztSWt8EL7u4Fdt4UF+t3op7Vx
 KiBQ5KxSOcgGfkriyxJmCb0ATZuo6clvNjy3GIaPxeuZSteDY4aT4g96cNws7f3G9wg/
 txuH9Jr37jyXuPmkKqWX1D6pH5EuZrbchqb6AiG8/t4CfSnXgNVRjDFK3mqxgVpHaSlJ
 TWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v9xm2NUuIGJhvQLJdwRo8QScJi5ZIrJjEVzynV5Skg8=;
 b=A61e53/MR/6h0hgTK68ooLtGl14iW1We5ySX5mAZOT4vWIOZqEMTFe79tspLlqHjD7
 RcBOK/QKVmpiseGMV8MfIeuZOIsBKpKWmrMPdagYhbQ8nxWmD2Oca+ACw0XCybakNJLx
 JbBa2epzwaBPZZoU2kL4WNhX23F3ctr7qkSZWu3cTvSe/D6qOe+eytee7Uy3oHMcrbGe
 qbn/9yos+cYBzQIFOfFNh2f0Uy/h2j1UUogOZ4UH0PuoQnt6PqkC7GB9RNOGrMsCHSVG
 qgY4rJL88YDSWFK3XdyitbucAt374vQDfcOjfG9O0CRT1gHxRR1UjPYQV0/XWNpFpjS5
 ftxw==
X-Gm-Message-State: AOAM531pvUk2fz8eXTkffquXMEiDsK/VEsOaKnWtsEDXXIA+e/KEbAx8
 2f/Mh/rZpPSGkpsE+tERzqM5bT36z50MF1wvkrkHuDw5Vj4=
X-Google-Smtp-Source: ABdhPJyXOC1CVbOwhiST5I/NeKj9WDNlPLwphV+uouIlB5OGJOItN//oXpHKi7dQ6yXOgUX7GV++eta5SanVtFJNItY=
X-Received: by 2002:a25:aa69:: with SMTP id s96mr13765799ybi.241.1626449021687; 
 Fri, 16 Jul 2021 08:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210715101536.2606307-1-matthew.auld@intel.com>
 <20210715101536.2606307-5-matthew.auld@intel.com>
 <70159117-ca97-667a-3e9b-82125bf309df@linux.intel.com>
In-Reply-To: <70159117-ca97-667a-3e9b-82125bf309df@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 16 Jul 2021 10:23:30 -0500
Message-ID: <CAOFGe94jGACo_1iiHcdLodTWoj0Z-e+2nVGJJbeybuMmOd827A@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/i915/uapi: reject set_domain for discrete
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Kenneth Graunke <kenneth@whitecape.org>, Matthew Auld <matthew.auld@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 9:52 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 15/07/2021 11:15, Matthew Auld wrote:
> > The CPU domain should be static for discrete, and on DG1 we don't need
> > any flushing since everything is already coherent, so really all this
> > does is an object wait, for which we have an ioctl. Longer term the
> > desired caching should be an immutable creation time property for the
> > BO, which can be set with something like gem_create_ext.
> >
> > One other user is iris + userptr, which uses the set_domain to probe al=
l
> > the pages to check if the GUP succeeds, however we now have a PROBE
> > flag for this purpose.
> >
> > v2: add some more kernel doc, also add the implicit rules with caching
> >
> > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_domain.c |  3 +++
> >   include/uapi/drm/i915_drm.h                | 19 +++++++++++++++++++
> >   2 files changed, 22 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_domain.c
> > index 43004bef55cb..b684a62bf3b0 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> > @@ -490,6 +490,9 @@ i915_gem_set_domain_ioctl(struct drm_device *dev, v=
oid *data,
> >       u32 write_domain =3D args->write_domain;
> >       int err;
> >
> > +     if (IS_DGFX(to_i915(dev)))
> > +             return -ENODEV;
> > +
> >       /* Only handle setting domains to types used by the CPU. */
> >       if ((write_domain | read_domains) & I915_GEM_GPU_DOMAINS)
> >               return -EINVAL;
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index 2e4112bf4d38..04ce310e7ee6 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -901,6 +901,25 @@ struct drm_i915_gem_mmap_offset {
> >    *  - I915_GEM_DOMAIN_GTT: Mappable aperture domain
> >    *
> >    * All other domains are rejected.
> > + *
> > + * Note that for discrete, starting from DG1, this is no longer suppor=
ted, and
> > + * is instead rejected. On such platforms the CPU domain is effectivel=
y static,
> > + * where we also only support a single &drm_i915_gem_mmap_offset cache=
 mode,
> > + * which can't be set explicitly and instead depends on the object pla=
cements,
> > + * as per the below.
> > + *
> > + * Implicit caching rules, starting from DG1:
> > + *
> > + *   - If any of the object placements (see &drm_i915_gem_create_ext_m=
emory_regions)
> > + *     contain I915_MEMORY_CLASS_DEVICE then the object will be alloca=
ted and
> > + *     mapped as write-combined only.

Is this accurate?  I thought they got WB when living in SMEM and WC
when on the device.  But, since both are coherent, it's safe to lie to
userspace and say it's all WC.  Is that correct or am I missing
something?

> A note about write-combine buffer? I guess saying it is userspace
> responsibility to do it and how.

What exactly are you thinking is userspace's responsibility?

> > + *
> > + *   - Everything else is always allocated and mapped as write-back, w=
ith the
> > + *     guarantee that everything is also coherent with the GPU.
>
> Haven't been following this so just a question on this one - it is not
> considered interesting to offer non-coherent modes, or even write
> combine, with system memory buffers, for a specific reason?

We only care about non-coherent modes on integrated little-core.
There, we share memory between CPU and GPU but snooping from the GPU
is optional.  Depending on access patterns, we might want WB with GPU
snooping or we might want WC.  I don't think we care about WC for SMEM
allocations on discrete.  For that matter, I'm not sure you can
actually shut snooping off when going across a "real" PCIe bus.  At
least not with DG1.

--Jason

> Regards,
>
> Tvrtko
>
> > + *
> > + * Note that this is likely to change in the future again, where we mi=
ght need
> > + * more flexibility on future devices, so making this all explicit as =
part of a
> > + * new &drm_i915_gem_create_ext extension is probable.
> >    */
> >   struct drm_i915_gem_set_domain {
> >       /** @handle: Handle for the object. */
> >
