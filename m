Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AAC2A7F8A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 14:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CB96E21C;
	Thu,  5 Nov 2020 13:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3336E21C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 13:20:20 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y12so1733958wrp.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 05:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=NEGl5JzExptr1hQfOw5SGBAQ5qfOgep75CPPsplxwKk=;
 b=C2xBRuX3+1GvgurJuuBctLeWqy91nw7q8qp12xvA7OnHwHzVzM3PpUFc0P5jPbClUV
 lbo4UQN5pKqsV4xVUqMZdnvLLplGZDstTy4dx4fdmhR/YokJWkXI5YMzEe0jiut4YcQW
 IOuDiQgOu21X18gdwxRyGDxjMO3+DbY9eGATw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NEGl5JzExptr1hQfOw5SGBAQ5qfOgep75CPPsplxwKk=;
 b=nSdq2ZHoNK+eHNe//DoiRqJ7Q0yja57l9gCSuwzHc6UiGFD3noXr7XN0tPlm5XWkP0
 63jXghMLLoZqdby+dyFnSWJZkTNqiRJ97aBG9MA3j98517s64Qlzw1SPIM5jLZ0T1wjp
 gHv8dAD88SDCTD+DnkaaBdlu+cuXOF0aJZmkmywhuD8Jn/5b2IMF63eWgVWKfx5hRrmp
 YvOWXwPT3ePBJf/YoVyauixhJOtoiJ7uLrznTMWdz7m0qAF9NuG+spiJldEWG3aGvGaN
 e0BeHhG38CINCdIdfuUAiiXuUqsc9eCI4pk/9RR9JGqz2TL4GC4ek1cpF7X9NaFWOCjC
 OaBw==
X-Gm-Message-State: AOAM531VrMeMARM1H5SAb2JhAj6W2F0HkpBI5loGEekG5C5qmN/MjL3q
 oFsef9Dim7gijn2+Kz4XX5ROVg==
X-Google-Smtp-Source: ABdhPJxp0a3Wb/DLYSsPgvP37x4nELtrRTrhwM8wtabfizxXwTzTIyt5r7YYCKx+1wZeZShekSCcxA==
X-Received: by 2002:adf:93e5:: with SMTP id 92mr2978366wrp.421.1604582419400; 
 Thu, 05 Nov 2020 05:20:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y63sm2485139wmg.28.2020.11.05.05.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 05:20:18 -0800 (PST)
Date: Thu, 5 Nov 2020 14:20:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/ttm: don't set page->mapping
Message-ID: <20201105132016.GY401619@phenom.ffwll.local>
References: <20201104165030.2005167-1-daniel.vetter@ffwll.ch>
 <859e2b9c-c202-25c6-b52f-9841fe32b082@amd.com>
 <CAKMK7uGA3URvu3BUzs617sGS_TchHDhpzzgsMGrVVJtwBpD+Vw@mail.gmail.com>
 <d6cdc22d-9cb2-7985-fdc3-ad3548899f02@amd.com>
 <20201105125009.GV401619@phenom.ffwll.local>
 <614b3893-b735-7ba4-4f0a-55891adbdc8d@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <614b3893-b735-7ba4-4f0a-55891adbdc8d@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>, Brian Paul <brianp@vmware.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 01:56:22PM +0100, Christian K=F6nig wrote:
> Am 05.11.20 um 13:50 schrieb Daniel Vetter:
> > On Thu, Nov 05, 2020 at 01:29:50PM +0100, Christian K=F6nig wrote:
> > > Am 05.11.20 um 10:11 schrieb Daniel Vetter:
> > > > On Thu, Nov 5, 2020 at 9:00 AM Christian K=F6nig <christian.koenig@=
amd.com> wrote:
> > > > > Am 04.11.20 um 17:50 schrieb Daniel Vetter:
> > > > > > Random observation while trying to review Christian's patch ser=
ies to
> > > > > > stop looking at struct page for dma-buf imports.
> > > > > > =

> > > > > > This was originally added in
> > > > > > =

> > > > > > commit 58aa6622d32af7d2c08d45085f44c54554a16ed7
> > > > > > Author: Thomas Hellstrom <thellstrom@vmware.com>
> > > > > > Date:   Fri Jan 3 11:47:23 2014 +0100
> > > > > > =

> > > > > >        drm/ttm: Correctly set page mapping and -index members
> > > > > > =

> > > > > >        Needed for some vm operations; most notably unmap_mappin=
g_range() with
> > > > > >        even_cows =3D 0.
> > > > > > =

> > > > > >        Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
> > > > > >        Reviewed-by: Brian Paul <brianp@vmware.com>
> > > > > > =

> > > > > > but we do not have a single caller of unmap_mapping_range with
> > > > > > even_cows =3D=3D 0. And all the gem drivers don't do this, so a=
nother
> > > > > > small thing we could standardize between drm and ttm drivers.
> > > > > > =

> > > > > > Plus I don't really see a need for unamp_mapping_range where we=
 don't
> > > > > > want to indiscriminately shoot down all ptes.
> > > > > NAK, we use this to determine if a pages belongs to the driver or=
 not in
> > > > > amdgpu for example.
> > > > > =

> > > > > Mostly used for debugging, but I would really like to keep that.
> > > > Can you pls point me at that code? A quick grep hasn't really found=
 much at all.
> > > See amdgpu_iomem_read() for an example:
> > Why do you reject this?
> =

> When IOMMU is disabled or uses an 1 to 1 mapping we would otherwise give =
the
> same access as /dev/mem to system memory and that is forbidden. But as I
> noted this is just for the debugfs file.

Ah, there's a config option for that. Plus it's debugfs, anything goes in
debugfs, but if you're worried about that hole we should just disable the
entire debugfs file for CONFIG_STRICT_DEVMEM. I can perhaps throw that on
top, that follow_pfn patch series I'm baking is all about this kind of
fun.

> When I tried a few years ago to not set the page->mapping I immediately r=
an
> into issues with our eviction test. So I think that this is used elsewhere
> as well.

That's the kind of interaction I'm worried about here tbh. If this does
some kind of shrinking of some sorts, I think a real shrinker should take
over.

An improved grep shows nothing else, so the only the above is the only
thing I can think of. What kind of eviction test goes boom if you clear
->mapping here? I'd be happy to type up the clever trick for the debugfs
files.
-Daniel

> =

> Regards,
> Christian.
> =

> > =

> > If this is to avoid issues with userptr, then I think there's a simple
> > trick:
> > - grab page reference
> > - recheck that the iova still points at the same address
> > - do read/write, safe in the knowledge that this page cannot be reused =
for
> >    anything else
> > - drop page reference
> > =

> > Of course this can still race against iova updates, but that seems to b=
e a
> > fundamental part of your debug interface here.
> > =

> > Or am I missing something?
> > =

> > Just pondering this more since setting the page->mapping pointer for ju=
st
> > this seems somewhat wild abuse of ->mapping semantics :-)
> > -Daniel
> > =

> > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (p->mapping !=3D =
adev->mman.bdev.dev_mapping)
> > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 return -EPERM;
> > > Christian.
> > > =

> > > > -Daniel
> > > > =

> > > > > Christian.
> > > > > =

> > > > > > Cc: Thomas Hellstrom <thellstrom@vmware.com>
> > > > > > Cc: Brian Paul <brianp@vmware.com>
> > > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > > Cc: Christian Koenig <christian.koenig@amd.com>
> > > > > > Cc: Huang Rui <ray.huang@amd.com>
> > > > > > ---
> > > > > >     drivers/gpu/drm/ttm/ttm_tt.c | 12 ------------
> > > > > >     1 file changed, 12 deletions(-)
> > > > > > =

> > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm=
/ttm_tt.c
> > > > > > index 8861a74ac335..438ea43fd8c1 100644
> > > > > > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > > > @@ -291,17 +291,6 @@ int ttm_tt_swapout(struct ttm_bo_device *b=
dev, struct ttm_tt *ttm)
> > > > > >         return ret;
> > > > > >     }
> > > > > > =

> > > > > > -static void ttm_tt_add_mapping(struct ttm_bo_device *bdev, str=
uct ttm_tt *ttm)
> > > > > > -{
> > > > > > -     pgoff_t i;
> > > > > > -
> > > > > > -     if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> > > > > > -             return;
> > > > > > -
> > > > > > -     for (i =3D 0; i < ttm->num_pages; ++i)
> > > > > > -             ttm->pages[i]->mapping =3D bdev->dev_mapping;
> > > > > > -}
> > > > > > -
> > > > > >     int ttm_tt_populate(struct ttm_bo_device *bdev,
> > > > > >                     struct ttm_tt *ttm, struct ttm_operation_ct=
x *ctx)
> > > > > >     {
> > > > > > @@ -320,7 +309,6 @@ int ttm_tt_populate(struct ttm_bo_device *b=
dev,
> > > > > >         if (ret)
> > > > > >                 return ret;
> > > > > > =

> > > > > > -     ttm_tt_add_mapping(bdev, ttm);
> > > > > >         ttm->page_flags |=3D TTM_PAGE_FLAG_PRIV_POPULATED;
> > > > > >         if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
> > > > > >                 ret =3D ttm_tt_swapin(ttm);
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
