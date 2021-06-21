Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2D33AEAC9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 16:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1019D6E160;
	Mon, 21 Jun 2021 14:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7BE6E161
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 14:10:38 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r9so19840964wrz.10
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=AGlV2MD6otn2QQN/+YuOax/yo3OPIlMQZ3cJytPNMxk=;
 b=dxIdwiUMehn6sA5E239voC+h18YFW+FN8JYbk25dQdz3MmrWeISh71T/6F/prqU6Yd
 PEFjzOn86SLmtfjabSAUl8gxsEiYQXRaC/IUMf3ZMnotC/iO7EjQQo9XmMTb3DkOrA7H
 69+3iL0eMuT86aKepTsRZXvhrg/tP8rSDhZEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=AGlV2MD6otn2QQN/+YuOax/yo3OPIlMQZ3cJytPNMxk=;
 b=UArVXf92QvJ5nkTLgk2PU+s/YdFu8r/r6JUiO4Cu66R6Pij6Qz1XzNPj0eqdqYiK6l
 c4dIc6WQm63rdnQ1LkVHLZTuqKhZk0cxx2KP3bGIaIn9on3TE2nfSzToQOEX0Rk2ML+S
 LgDM7rOeyJ6X8Uupq85Xe8DtQWnh7RQVQ4LzJAoZOrlEuiHdiARc2vTUheovs8MtAfNy
 LUTnaqiN6X2f83hEeklS0eVOT8rVaUg8WbJ79kIS1WhtdMIWAPFXpipLQGlSwAzPhh5D
 zfpTqIHXWL4FtKWWvdavkkL5oldncmkSBIiDxbdIqVLxLv7eZxIN+DwBf9tkHE/JxPue
 vR+A==
X-Gm-Message-State: AOAM533sOqDTI3B6svwKK4TEZEspru+TAnOSSWgCohlTkpluPZrnSasR
 H/EWqHchgCiohkaT6n5XnxH/Lw==
X-Google-Smtp-Source: ABdhPJx5OqTU3rT2HYNagde8SKe39dhIr0kjKox8JE94Ej/JAxsw9e4p7LE3RW3Rig5FzCstV1cfEQ==
X-Received: by 2002:adf:f592:: with SMTP id f18mr14083074wro.81.1624284636881; 
 Mon, 21 Jun 2021 07:10:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f12sm21491418wru.81.2021.06.21.07.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 07:10:36 -0700 (PDT)
Date: Mon, 21 Jun 2021 16:10:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.william.auld@gmail.com>
Subject: Re: drm/i915: __GFP_RETRY_MAYFAIL allocations in stable kernels
Message-ID: <YNCd2m9yvaUhR9MN@phenom.ffwll.local>
Mail-Followup-To: Matthew Auld <matthew.william.auld@gmail.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 kernel list <linux-kernel@vger.kernel.org>
References: <YMdPcWZi4x7vnCxI@google.com> <YMuGGqs4cDotxuKO@phenom.ffwll.local>
 <CAM0jSHMYk3GeZTP7FQ8z2H02GfCcJsUeNwbzH3GLdRVxvMzqDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM0jSHMYk3GeZTP7FQ8z2H02GfCcJsUeNwbzH3GLdRVxvMzqDg@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 kernel list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 04:46:24PM +0100, Matthew Auld wrote:
> On Thu, 17 Jun 2021 at 18:27, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Jun 14, 2021 at 09:45:37PM +0900, Sergey Senozhatsky wrote:
> > > Hi,
> > >
> > > We are observing some user-space crashes (sigabort, segfaults etc.)
> > > under moderate memory pressure (pretty far from severe pressure) which
> > > have one thing in common - restrictive GFP mask in setup_scratch_page().
> > >
> > > For instance, (stable 4.19) drivers/gpu/drm/i915/i915_gem_gtt.c
> > >
> > > (trimmed down version)
> > >
> > > static int gen8_init_scratch(struct i915_address_space *vm)
> > > {
> > >         setup_scratch_page(vm, __GFP_HIGHMEM);
> > >
> > >         vm->scratch_pt = alloc_pt(vm);
> > >         vm->scratch_pd = alloc_pd(vm);
> > >         if (use_4lvl(vm)) {
> > >                 vm->scratch_pdp = alloc_pdp(vm);
> > >         }
> > > }
> > >
> > > gen8_init_scratch() function puts a rather inconsistent restrictions on mm.
> > >
> > > Looking at it line by line:
> > >
> > > setup_scratch_page() uses very restrictive gfp mask:
> > >       __GFP_HIGHMEM | __GFP_ZERO | __GFP_RETRY_MAYFAIL
> > >
> > > it doesn't try to reclaim anything and fails almost immediately.
> > >
> > > alloc_pt() - uses more permissive gfp mask:
> > >       GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN
> > >
> > > alloc_pd() - likewise:
> > >       GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN
> > >
> > > alloc_pdp() - very permissive gfp mask:
> > >       GFP_KERNEL
> > >
> > >
> > > So can all allocations in gen8_init_scratch() use
> > >       GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN
> >
> > Yeah that looks all fairly broken tbh. The only thing I didn't know was
> > that GFP_DMA32 wasn't a full gfp mask with reclaim bits set as needed. I
> > guess it would be clearer if we use GFP_KERNEL | __GFP_DMA32 for these.
> >
> > The commit that introduced a lot of this, including I915_GFP_ALLOW_FAIL
> > seems to be
> >
> > commit 1abb70f5955d1a9021f96359a2c6502ca569b68d
> > Author: Chris Wilson <chris@chris-wilson.co.uk>
> > Date:   Tue May 22 09:36:43 2018 +0100
> >
> >     drm/i915/gtt: Allow pagedirectory allocations to fail
> >
> > which used a selftest as justification, not real world workloads, so looks
> > rather dubious.
> >
> > Adding Matt Auld to this thread, maybe he has ideas.
> 
> The latest code is quite different, but for both scratch and the
> various paging structures it's now sharing the same GFP
> flags(I915_GFP_ALLOW_FAIL). And for the actual backing page, which is
> now a GEM object, we use i915_gem_object_get_pages_internal().
> 
> Not sure why scratch wants to be different, and I don't recall
> anything funny. At first I thought it might have been related to
> needing only one scratch page/directory etc which was then shared
> between different VMs, but I don't think we had read-only support in
> the driver at that point, so can't be that. But I guess once we did
> add that seeing failures in init_scratch() was very unlikely, at least
> until gen11+ arrived which then broke read-only support in the HW.

If there is something, then shmem get_pages has some reason to use
__GFP_RETRY_MAYFAIL - at least way back when dev->struct_mutex was still
everywhere we had some paths to directly reclaim gem bo when the
allocations failed.

But I think that all disappeared, so all the reasons for MAYFAIL have gone
away - if there's no fallback or call to our own shrinker or anything like
that, then we must rely on core mm to try really hard to find the memory
we want.

This all goes back to

commit 07f73f6912667621276b002e33844ef283d98203
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Mon Sep 14 16:50:30 2009 +0100

    drm/i915: Improve behaviour under memory pressure

but with a lot of detours and confusion going on (__GFP_NORETRY wasn't
actually what we wanted, which is why __GFP_RETRY_MAYFAIL now exists).
-Daniel

> 
> >
> > Thanks, Daniel
> >
> > > ?
> > >
> > > E.g.
> > >
> > > ---
> > > diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
> > > index a12430187108..e862680b9c93 100644
> > > --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> > > +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> > > @@ -792,7 +792,7 @@ alloc_pdp(struct i915_address_space *vm)
> > >
> > >         GEM_BUG_ON(!use_4lvl(vm));
> > >
> > > -       pdp = kzalloc(sizeof(*pdp), GFP_KERNEL);
> > > +       pdp = kzalloc(sizeof(*pdp), I915_GFP_ALLOW_FAIL);
> > >         if (!pdp)
> > >                 return ERR_PTR(-ENOMEM);
> > >
> > > @@ -1262,7 +1262,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
> > >  {
> > >         int ret;
> > >
> > > -       ret = setup_scratch_page(vm, __GFP_HIGHMEM);
> > > +       ret = setup_scratch_page(vm, GFP_KERNEL | __GFP_HIGHMEM);
> > >         if (ret)
> > >                 return ret;
> > >
> > > @@ -1972,7 +1972,7 @@ static int gen6_ppgtt_init_scratch(struct gen6_hw_ppgtt *ppgtt)
> > >         u32 pde;
> > >         int ret;
> > >
> > > -       ret = setup_scratch_page(vm, __GFP_HIGHMEM);
> > > +       ret = setup_scratch_page(vm, GFP_KERNEL | __GFP_HIGHMEM);
> > >         if (ret)
> > >                 return ret;
> > >
> > > @@ -3078,7 +3078,7 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
> > >                 return -ENOMEM;
> > >         }
> > >
> > > -       ret = setup_scratch_page(&ggtt->vm, GFP_DMA32);
> > > +       ret = setup_scratch_page(&ggtt->vm, GFP_KERNEL | GFP_DMA32);
> > >         if (ret) {
> > >                 DRM_ERROR("Scratch setup failed\n");
> > >                 /* iounmap will also get called at remove, but meh */
> > > ---
> > >
> > >
> > >
> > > It's quite similar on stable 5.4 - setup_scratch_page() uses restrictive
> > > gfp mask again.
> > >
> > > ---
> > > diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
> > > index f614646ed3f9..99d78b1052df 100644
> > > --- a/drivers/gpu/drm/i915/i915_gem_gtt.c
> > > +++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
> > > @@ -1378,7 +1378,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
> > >                 return 0;
> > >         }
> > >
> > > -       ret = setup_scratch_page(vm, __GFP_HIGHMEM);
> > > +       ret = setup_scratch_page(vm, GFP_KERNEL | __GFP_HIGHMEM);
> > >         if (ret)
> > >                 return ret;
> > >
> > > @@ -1753,7 +1753,7 @@ static int gen6_ppgtt_init_scratch(struct gen6_ppgtt *ppgtt)
> > >         struct i915_page_directory * const pd = ppgtt->base.pd;
> > >         int ret;
> > >
> > > -       ret = setup_scratch_page(vm, __GFP_HIGHMEM);
> > > +       ret = setup_scratch_page(vm, GFP_KERNEL | __GFP_HIGHMEM);
> > >         if (ret)
> > >                 return ret;
> > >
> > > @@ -2860,7 +2860,7 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
> > >                 return -ENOMEM;
> > >         }
> > >
> > > -       ret = setup_scratch_page(&ggtt->vm, GFP_DMA32);
> > > +       ret = setup_scratch_page(&ggtt->vm, GFP_KERNEL | GFP_DMA32);
> > >         if (ret) {
> > >                 DRM_ERROR("Scratch setup failed\n");
> > >                 /* iounmap will also get called at remove, but meh */
> > > ---
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
