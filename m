Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E0D3CD02A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 11:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57816E07F;
	Mon, 19 Jul 2021 09:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1A96E07F;
 Mon, 19 Jul 2021 09:10:23 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id 23so16047622qke.0;
 Mon, 19 Jul 2021 02:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZifyXtvp3kFIUpD8Cb8DIYvuj4BoV/BCWsMXTy3MfW0=;
 b=CNpXLMusluoukCDIIknarY5l8/MVs/n549pZlQxHLI8yq4J7m58w9I/MXjJH2SGCLX
 7ZsPaf36XGt5hTmEnI6eS0gOtWYzcBvi/GL/AgMuynQjj2zRo+0tJW+U1Q5dzPuBzsxG
 0I5gTL38f7T5yFvppQIsRhWDpcmKDfvCwnIFrRNMh1zMr9eYc16lFEyiBEA27BNOAGCq
 EnGdaPwilzDc1qO8lU9TBGVaQ/Anuiig0ONGwZ4BS2NBrmo0FCVTLcxz3JQzMYfnmEcL
 ZrN2KxeTOhLy24zIRgYkPrvG0QVAkpbOb2L0VOEr69cD1GDo9TNtat43RsWbJuNZS9y2
 CXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZifyXtvp3kFIUpD8Cb8DIYvuj4BoV/BCWsMXTy3MfW0=;
 b=WH9Ehz+YBUKIn0LtfDs1V6sIAkT9CdqYoZMs/Xs/T2NA1UnEANWhxAAPPkxPswiAM8
 Nwtnj6YwDvKIEbtvbIdTI33TWMlcl13L7vukMY6lS8FQrJBUzoap6HMMJpCX4hjMIWjP
 lJLSRNxpH8DgRQMkKPdlQyg57xOR7LHfpA3PsciSHQIE2ETaziprrdbQhniNV65Mc5K0
 JYsIQH3p567xFP5fxEn+dysAzzLPu6EXP7nMw5vyqsGHOLFJnOOis4I46TvaJq9uWlu4
 yfPKZSZzZWVIPdFPFQmTLfHSYAqGhOBU0dgHg0CfjgNFfy05hNO5R4b7+3vsgUA1thMG
 FYPg==
X-Gm-Message-State: AOAM532Wetdg5vkbO47MH5tYp9aBlLY2f7d9M70rBNwYvYGrAt2c/cOU
 owQ6rNTbemvcb7HyeqJiqNbtOdzgTUel8kotRi16VpaZan0=
X-Google-Smtp-Source: ABdhPJxjcVUzP2FNtpOS7n9Z/vTC7iXjIJ3qs8PfB/XmW0Z6eyuwUWniKmOtkGBT6yiXVmHnawpZ9+erQUUUM4QINbY=
X-Received: by 2002:a37:668f:: with SMTP id
 a137mr22239830qkc.481.1626685822442; 
 Mon, 19 Jul 2021 02:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210715101536.2606307-1-matthew.auld@intel.com>
 <20210715101536.2606307-5-matthew.auld@intel.com>
 <70159117-ca97-667a-3e9b-82125bf309df@linux.intel.com>
 <CAOFGe94jGACo_1iiHcdLodTWoj0Z-e+2nVGJJbeybuMmOd827A@mail.gmail.com>
In-Reply-To: <CAOFGe94jGACo_1iiHcdLodTWoj0Z-e+2nVGJJbeybuMmOd827A@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 19 Jul 2021 10:09:56 +0100
Message-ID: <CAM0jSHNuG6hqH_FCiph-Lbre3FrJwwD3An=Xv9wPMkKyxGXSJQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/i915/uapi: reject set_domain for discrete
To: Jason Ekstrand <jason@jlekstrand.net>
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

On Fri, 16 Jul 2021 at 16:23, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Fri, Jul 16, 2021 at 9:52 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >
> >
> > On 15/07/2021 11:15, Matthew Auld wrote:
> > > The CPU domain should be static for discrete, and on DG1 we don't nee=
d
> > > any flushing since everything is already coherent, so really all this
> > > does is an object wait, for which we have an ioctl. Longer term the
> > > desired caching should be an immutable creation time property for the
> > > BO, which can be set with something like gem_create_ext.
> > >
> > > One other user is iris + userptr, which uses the set_domain to probe =
all
> > > the pages to check if the GUP succeeds, however we now have a PROBE
> > > flag for this purpose.
> > >
> > > v2: add some more kernel doc, also add the implicit rules with cachin=
g
> > >
> > > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Ramalingam C <ramalingam.c@intel.com>
> > > Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gem/i915_gem_domain.c |  3 +++
> > >   include/uapi/drm/i915_drm.h                | 19 +++++++++++++++++++
> > >   2 files changed, 22 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c b/drivers/gpu=
/drm/i915/gem/i915_gem_domain.c
> > > index 43004bef55cb..b684a62bf3b0 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> > > @@ -490,6 +490,9 @@ i915_gem_set_domain_ioctl(struct drm_device *dev,=
 void *data,
> > >       u32 write_domain =3D args->write_domain;
> > >       int err;
> > >
> > > +     if (IS_DGFX(to_i915(dev)))
> > > +             return -ENODEV;
> > > +
> > >       /* Only handle setting domains to types used by the CPU. */
> > >       if ((write_domain | read_domains) & I915_GEM_GPU_DOMAINS)
> > >               return -EINVAL;
> > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.=
h
> > > index 2e4112bf4d38..04ce310e7ee6 100644
> > > --- a/include/uapi/drm/i915_drm.h
> > > +++ b/include/uapi/drm/i915_drm.h
> > > @@ -901,6 +901,25 @@ struct drm_i915_gem_mmap_offset {
> > >    *  - I915_GEM_DOMAIN_GTT: Mappable aperture domain
> > >    *
> > >    * All other domains are rejected.
> > > + *
> > > + * Note that for discrete, starting from DG1, this is no longer supp=
orted, and
> > > + * is instead rejected. On such platforms the CPU domain is effectiv=
ely static,
> > > + * where we also only support a single &drm_i915_gem_mmap_offset cac=
he mode,
> > > + * which can't be set explicitly and instead depends on the object p=
lacements,
> > > + * as per the below.
> > > + *
> > > + * Implicit caching rules, starting from DG1:
> > > + *
> > > + *   - If any of the object placements (see &drm_i915_gem_create_ext=
_memory_regions)
> > > + *     contain I915_MEMORY_CLASS_DEVICE then the object will be allo=
cated and
> > > + *     mapped as write-combined only.
>
> Is this accurate?  I thought they got WB when living in SMEM and WC
> when on the device.  But, since both are coherent, it's safe to lie to
> userspace and say it's all WC.  Is that correct or am I missing
> something?

Yes, it's accurate, it will be allocated and mapped as WC. I think we
can just make select_tt_caching always return cached if we want, and
it looks like ttm seems to be fine with having different caching
values for the tt vs io resource. Daniel, should we adjust this?

>
> > A note about write-combine buffer? I guess saying it is userspace
> > responsibility to do it and how.
>
> What exactly are you thinking is userspace's responsibility?
>
> > > + *
> > > + *   - Everything else is always allocated and mapped as write-back,=
 with the
> > > + *     guarantee that everything is also coherent with the GPU.
> >
> > Haven't been following this so just a question on this one - it is not
> > considered interesting to offer non-coherent modes, or even write
> > combine, with system memory buffers, for a specific reason?
>
> We only care about non-coherent modes on integrated little-core.
> There, we share memory between CPU and GPU but snooping from the GPU
> is optional.  Depending on access patterns, we might want WB with GPU
> snooping or we might want WC.  I don't think we care about WC for SMEM
> allocations on discrete.  For that matter, I'm not sure you can
> actually shut snooping off when going across a "real" PCIe bus.  At
> least not with DG1.
>
> --Jason
>
> > Regards,
> >
> > Tvrtko
> >
> > > + *
> > > + * Note that this is likely to change in the future again, where we =
might need
> > > + * more flexibility on future devices, so making this all explicit a=
s part of a
> > > + * new &drm_i915_gem_create_ext extension is probable.
> > >    */
> > >   struct drm_i915_gem_set_domain {
> > >       /** @handle: Handle for the object. */
> > >
