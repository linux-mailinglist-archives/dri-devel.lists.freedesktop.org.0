Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA7A2A7EF6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 13:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AF86E0E8;
	Thu,  5 Nov 2020 12:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E140E6E0E8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 12:50:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id k18so1489059wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 04:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Qk7Nd04TX1CuzmvrU7Ro/oas6NVXQoSX74DFefE4rE8=;
 b=ZMMpwScy42qNexmWgnwH2qbqehPgLjJkgRUV4ySDDeo7vU5wR1kUhyIx8Ihxc+kuvX
 JC12oQOhpHVb0KBmUdqhdk3UTeVrzHpdzMgOV/7aooNBNDN4h/7640/VlAvurfAE8b//
 KlGzcKtxQBNmvRI/1H2f8CqrKAZXkqtz66/yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Qk7Nd04TX1CuzmvrU7Ro/oas6NVXQoSX74DFefE4rE8=;
 b=qBxtSSR/7YB33aUZTA2QlHY8Ah6lSWEuH/Lz2wrHF6fqZeedeIi5iXNCW+WsFnd1d6
 Z5i79oAJIkcyZ6VdZXGcZKfD+USkWkD8HcXQZmOyKzJk8u9MrkBjAOUOc3fKRVkAw3ec
 DviHQefhbD1YwdOas9G4Ao5J/5/ntmC3Co6mPIl8x8fTJK9QjXmLvWJQi5CQgY9sZ8Ri
 ahqPqnKBNsYjOZE1b714KRz7lstB61VLGLZYYGYYipLLvywTxwjUfFlvamILmKDEsLJV
 31oRD8LrbphBWZXBwA4kL4DR0bE1DnC+vIZSteTP71117Q1l34U+Psb5Uhslnq7zLelM
 NkGA==
X-Gm-Message-State: AOAM532fkMPxyeHbehix+pdGldzSNrUTt19b7wZpQa8Bo2krkvbAahJL
 d5428BuNOxGLfQBSUiRhNRf7ug==
X-Google-Smtp-Source: ABdhPJw7P8z5tZHfuqaWEKe9IaO/F+4Dar/LMnjj5wgjHYghW+5iXw2AWlGTeS0X/RaSK/sC2arjJw==
X-Received: by 2002:a1c:b783:: with SMTP id h125mr2523623wmf.108.1604580612558; 
 Thu, 05 Nov 2020 04:50:12 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u81sm2615547wmb.27.2020.11.05.04.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 04:50:11 -0800 (PST)
Date: Thu, 5 Nov 2020 13:50:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/ttm: don't set page->mapping
Message-ID: <20201105125009.GV401619@phenom.ffwll.local>
References: <20201104165030.2005167-1-daniel.vetter@ffwll.ch>
 <859e2b9c-c202-25c6-b52f-9841fe32b082@amd.com>
 <CAKMK7uGA3URvu3BUzs617sGS_TchHDhpzzgsMGrVVJtwBpD+Vw@mail.gmail.com>
 <d6cdc22d-9cb2-7985-fdc3-ad3548899f02@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6cdc22d-9cb2-7985-fdc3-ad3548899f02@amd.com>
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

On Thu, Nov 05, 2020 at 01:29:50PM +0100, Christian K=F6nig wrote:
> Am 05.11.20 um 10:11 schrieb Daniel Vetter:
> > On Thu, Nov 5, 2020 at 9:00 AM Christian K=F6nig <christian.koenig@amd.=
com> wrote:
> > > Am 04.11.20 um 17:50 schrieb Daniel Vetter:
> > > > Random observation while trying to review Christian's patch series =
to
> > > > stop looking at struct page for dma-buf imports.
> > > > =

> > > > This was originally added in
> > > > =

> > > > commit 58aa6622d32af7d2c08d45085f44c54554a16ed7
> > > > Author: Thomas Hellstrom <thellstrom@vmware.com>
> > > > Date:   Fri Jan 3 11:47:23 2014 +0100
> > > > =

> > > >       drm/ttm: Correctly set page mapping and -index members
> > > > =

> > > >       Needed for some vm operations; most notably unmap_mapping_ran=
ge() with
> > > >       even_cows =3D 0.
> > > > =

> > > >       Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
> > > >       Reviewed-by: Brian Paul <brianp@vmware.com>
> > > > =

> > > > but we do not have a single caller of unmap_mapping_range with
> > > > even_cows =3D=3D 0. And all the gem drivers don't do this, so anoth=
er
> > > > small thing we could standardize between drm and ttm drivers.
> > > > =

> > > > Plus I don't really see a need for unamp_mapping_range where we don=
't
> > > > want to indiscriminately shoot down all ptes.
> > > NAK, we use this to determine if a pages belongs to the driver or not=
 in
> > > amdgpu for example.
> > > =

> > > Mostly used for debugging, but I would really like to keep that.
> > Can you pls point me at that code? A quick grep hasn't really found muc=
h at all.
> =

> See amdgpu_iomem_read() for an example:

Why do you reject this?

If this is to avoid issues with userptr, then I think there's a simple
trick:
- grab page reference
- recheck that the iova still points at the same address
- do read/write, safe in the knowledge that this page cannot be reused for
  anything else
- drop page reference

Of course this can still race against iova updates, but that seems to be a
fundamental part of your debug interface here.

Or am I missing something?

Just pondering this more since setting the page->mapping pointer for just
this seems somewhat wild abuse of ->mapping semantics :-)
-Daniel

> =

> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (p->mapping !=3D adev-=
>mman.bdev.dev_mapping)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r=
eturn -EPERM;
> =

> Christian.
> =

> > -Daniel
> > =

> > > Christian.
> > > =

> > > > Cc: Thomas Hellstrom <thellstrom@vmware.com>
> > > > Cc: Brian Paul <brianp@vmware.com>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Christian Koenig <christian.koenig@amd.com>
> > > > Cc: Huang Rui <ray.huang@amd.com>
> > > > ---
> > > >    drivers/gpu/drm/ttm/ttm_tt.c | 12 ------------
> > > >    1 file changed, 12 deletions(-)
> > > > =

> > > > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm=
_tt.c
> > > > index 8861a74ac335..438ea43fd8c1 100644
> > > > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > > > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > > > @@ -291,17 +291,6 @@ int ttm_tt_swapout(struct ttm_bo_device *bdev,=
 struct ttm_tt *ttm)
> > > >        return ret;
> > > >    }
> > > > =

> > > > -static void ttm_tt_add_mapping(struct ttm_bo_device *bdev, struct =
ttm_tt *ttm)
> > > > -{
> > > > -     pgoff_t i;
> > > > -
> > > > -     if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> > > > -             return;
> > > > -
> > > > -     for (i =3D 0; i < ttm->num_pages; ++i)
> > > > -             ttm->pages[i]->mapping =3D bdev->dev_mapping;
> > > > -}
> > > > -
> > > >    int ttm_tt_populate(struct ttm_bo_device *bdev,
> > > >                    struct ttm_tt *ttm, struct ttm_operation_ctx *ct=
x)
> > > >    {
> > > > @@ -320,7 +309,6 @@ int ttm_tt_populate(struct ttm_bo_device *bdev,
> > > >        if (ret)
> > > >                return ret;
> > > > =

> > > > -     ttm_tt_add_mapping(bdev, ttm);
> > > >        ttm->page_flags |=3D TTM_PAGE_FLAG_PRIV_POPULATED;
> > > >        if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
> > > >                ret =3D ttm_tt_swapin(ttm);
> > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
