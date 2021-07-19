Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 132123CEB7F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 21:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8D889FC5;
	Mon, 19 Jul 2021 19:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D1089FD1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 19:57:19 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id c16so22842568ybl.9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 12:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EIRbrzjJvlJSVEigy0loCXF1aG8cRoUgXOdJXV32pRY=;
 b=LierCTvCNkP46BISe+l0/ZFdcjUS8hcMfUMmEiEb5qzMHya7pRDFDzpKoi4vqrgD3K
 AaUsqg1OWq4ZfEQUb1WVXCbbuh9EDBI5cd+S9mXC0KT2wdUUWWAHDcGWEU2jDbLE+a8v
 OlWFP+DqehcmeUqMgPJoiCqCCUoeAJfCwXLoeOTAbis6JzYaOAI0eCEH0m9WFYL81+kc
 Fac1wm/iRxnvxummXufeOobjAt8RrQahkaBjPgOZSxZHkU0c3eQeWB7DNbKj+6yRoPEj
 s/NmmbtXFvRBozLoSwOtEmYEnV3C1232pA0btNujLYSE2FATHA/R62iyxLvOMAmuH5H6
 +SXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EIRbrzjJvlJSVEigy0loCXF1aG8cRoUgXOdJXV32pRY=;
 b=Kl7kGmbAAR7ALKqjGB1JZ7R5yEcMTVYiGVnCgOv147r7uSn12wjrGqF0+exUKviBh5
 2odQXWlUgJvlyrqew0KHLpTMWrBrpdENxNYuFzqru6bS0KpNqFI5tvCHNcZVw5Ma1oT5
 dtZosCDHBTyEacFlRhaYiey4as/BbtRBpUgc8IeaVoCPuN14xJ44MRx6igxzWPcaCc68
 z70op/OEAk3J0/olsBRhgX4d/uYXsHSQhCaynoM+TH6GKuF6KiosM8hWzzRgOErS2lDD
 ssNOUesuV0Xqyt3Xm4iTxwSSxrU9q092x+/Lp5zgCUwNe/EiBpPT3M3YFUcVCn7vFWQn
 FZjw==
X-Gm-Message-State: AOAM5317rN/ZnCQVroe+CXgU4tN8gNihArUv03qbWy6Nel9R8nUDhwh7
 xous6qexWRPO5dPL2ERLj6M0wz+Ii088gPYRtOUHYA==
X-Google-Smtp-Source: ABdhPJxNjtEF3/EuGZ2OZv/Tv2lVbolyl5UVtCHL+J11SZSY/Uh6gl1toKXZ1a6jq7ckQZW6QWqtVZ0c7ktpGcSSlrI=
X-Received: by 2002:a25:d3c1:: with SMTP id
 e184mr34122304ybf.139.1626724638135; 
 Mon, 19 Jul 2021 12:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210715101536.2606307-1-matthew.auld@intel.com>
 <20210715101536.2606307-5-matthew.auld@intel.com>
 <70159117-ca97-667a-3e9b-82125bf309df@linux.intel.com>
 <CAOFGe94jGACo_1iiHcdLodTWoj0Z-e+2nVGJJbeybuMmOd827A@mail.gmail.com>
 <CAM0jSHNuG6hqH_FCiph-Lbre3FrJwwD3An=Xv9wPMkKyxGXSJQ@mail.gmail.com>
In-Reply-To: <CAM0jSHNuG6hqH_FCiph-Lbre3FrJwwD3An=Xv9wPMkKyxGXSJQ@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 19 Jul 2021 14:57:07 -0500
Message-ID: <CAOFGe975igc5RA5iU4jG=xWnV1fKZb7j-v8Qc3hdSvaVaUBV_g@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/i915/uapi: reject set_domain for discrete
To: Matthew Auld <matthew.william.auld@gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Kenneth Graunke <kenneth@whitecape.org>, Matthew Auld <matthew.auld@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 19, 2021 at 4:10 AM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Fri, 16 Jul 2021 at 16:23, Jason Ekstrand <jason@jlekstrand.net> wrote=
:
> >
> > On Fri, Jul 16, 2021 at 9:52 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> > >
> > >
> > > On 15/07/2021 11:15, Matthew Auld wrote:
> > > > The CPU domain should be static for discrete, and on DG1 we don't n=
eed
> > > > any flushing since everything is already coherent, so really all th=
is
> > > > does is an object wait, for which we have an ioctl. Longer term the
> > > > desired caching should be an immutable creation time property for t=
he
> > > > BO, which can be set with something like gem_create_ext.
> > > >
> > > > One other user is iris + userptr, which uses the set_domain to prob=
e all
> > > > the pages to check if the GUP succeeds, however we now have a PROBE
> > > > flag for this purpose.
> > > >
> > > > v2: add some more kernel doc, also add the implicit rules with cach=
ing
> > > >
> > > > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > > > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > > > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > Cc: Ramalingam C <ramalingam.c@intel.com>
> > > > Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/i915/gem/i915_gem_domain.c |  3 +++
> > > >   include/uapi/drm/i915_drm.h                | 19 +++++++++++++++++=
++
> > > >   2 files changed, 22 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/g=
pu/drm/i915/gem/i915_gem_domain.c
> > > > index 43004bef55cb..b684a62bf3b0 100644
> > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> > > > @@ -490,6 +490,9 @@ i915_gem_set_domain_ioctl(struct drm_device *de=
v, void *data,
> > > >       u32 write_domain =3D args->write_domain;
> > > >       int err;
> > > >
> > > > +     if (IS_DGFX(to_i915(dev)))
> > > > +             return -ENODEV;
> > > > +
> > > >       /* Only handle setting domains to types used by the CPU. */
> > > >       if ((write_domain | read_domains) & I915_GEM_GPU_DOMAINS)
> > > >               return -EINVAL;
> > > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_dr=
m.h
> > > > index 2e4112bf4d38..04ce310e7ee6 100644
> > > > --- a/include/uapi/drm/i915_drm.h
> > > > +++ b/include/uapi/drm/i915_drm.h
> > > > @@ -901,6 +901,25 @@ struct drm_i915_gem_mmap_offset {
> > > >    *  - I915_GEM_DOMAIN_GTT: Mappable aperture domain
> > > >    *
> > > >    * All other domains are rejected.
> > > > + *
> > > > + * Note that for discrete, starting from DG1, this is no longer su=
pported, and
> > > > + * is instead rejected. On such platforms the CPU domain is effect=
ively static,
> > > > + * where we also only support a single &drm_i915_gem_mmap_offset c=
ache mode,
> > > > + * which can't be set explicitly and instead depends on the object=
 placements,
> > > > + * as per the below.
> > > > + *
> > > > + * Implicit caching rules, starting from DG1:
> > > > + *
> > > > + *   - If any of the object placements (see &drm_i915_gem_create_e=
xt_memory_regions)
> > > > + *     contain I915_MEMORY_CLASS_DEVICE then the object will be al=
located and
> > > > + *     mapped as write-combined only.
> >
> > Is this accurate?  I thought they got WB when living in SMEM and WC
> > when on the device.  But, since both are coherent, it's safe to lie to
> > userspace and say it's all WC.  Is that correct or am I missing
> > something?
>
> Yes, it's accurate, it will be allocated and mapped as WC. I think we
> can just make select_tt_caching always return cached if we want, and
> it looks like ttm seems to be fine with having different caching
> values for the tt vs io resource. Daniel, should we adjust this?

Mildly related, we had an issue some time back with i915+amdgpu where
we were choosing different caching settings for SMEM shared BOs and
the fallout was that we had all sorts of caching trouble when running
an integrated+discrete setup with them.  I don't remember how all that
shook out but we should think about it here.  Why is this important?
Because our mmap caching settings are going to be related to our
snooping settings for GPU access across the PCIe bar to SMEM.  If
we're WC then when can avoid snooping but if we're WB then we need
snooping enabled.  WC+snooping might work but I'm not sure off-hand.

--Jason

> >
> > > A note about write-combine buffer? I guess saying it is userspace
> > > responsibility to do it and how.
> >
> > What exactly are you thinking is userspace's responsibility?
> >
> > > > + *
> > > > + *   - Everything else is always allocated and mapped as write-bac=
k, with the
> > > > + *     guarantee that everything is also coherent with the GPU.
> > >
> > > Haven't been following this so just a question on this one - it is no=
t
> > > considered interesting to offer non-coherent modes, or even write
> > > combine, with system memory buffers, for a specific reason?
> >
> > We only care about non-coherent modes on integrated little-core.
> > There, we share memory between CPU and GPU but snooping from the GPU
> > is optional.  Depending on access patterns, we might want WB with GPU
> > snooping or we might want WC.  I don't think we care about WC for SMEM
> > allocations on discrete.  For that matter, I'm not sure you can
> > actually shut snooping off when going across a "real" PCIe bus.  At
> > least not with DG1.
> >
> > --Jason
> >
> > > Regards,
> > >
> > > Tvrtko
> > >
> > > > + *
> > > > + * Note that this is likely to change in the future again, where w=
e might need
> > > > + * more flexibility on future devices, so making this all explicit=
 as part of a
> > > > + * new &drm_i915_gem_create_ext extension is probable.
> > > >    */
> > > >   struct drm_i915_gem_set_domain {
> > > >       /** @handle: Handle for the object. */
> > > >
