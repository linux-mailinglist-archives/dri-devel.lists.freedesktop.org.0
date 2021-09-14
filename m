Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 400DD40B5EA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 19:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E10C89B5F;
	Tue, 14 Sep 2021 17:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E21189B4D;
 Tue, 14 Sep 2021 17:31:39 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id w78so213486qkb.4;
 Tue, 14 Sep 2021 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uEkP9f0ISlRq0SGBMtB0br/VUwm1Pk6f+r9bdSnkK/4=;
 b=m/sV1FuYXWQhqbkDxhPulhbbGVQ4AkPI/raJkYA75470buCfbnOVuNR64qLbAWn5xd
 e6TxIABm43NnpN3yl3RhlxntdEqS9GHTOxaLvFOLZTlVEAWPpdouewgd/fBoAF9RHlgT
 g5+QQNQO48wc80sqHVLsq4M4Hp1+CqRV5OXBjjHFpr2zjvxn7MRnzANjSU9UsXGbCckn
 QtuAduJxVQM5WbDfIRf3nTM/fhMmMoTvTzODzcVQxiCkWp9GqOyWVoIUBNyol6oec7vO
 /VhqOgrIdYvRegojOTUGnE6dKpsGRrI3+eyZFQoKJpRlnU+xFO0SNAYj8LZr6WVFtZEq
 rh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uEkP9f0ISlRq0SGBMtB0br/VUwm1Pk6f+r9bdSnkK/4=;
 b=xgp1AFvtk0VB8OJ/gS/QKhcSiNlZKf5QiWSqwpiTWtRwA1/bSaj6+In1jfV9nufrIO
 KJrQO3w4703kwtNjnM03R7o1XlCt3GMowwPfmGdD4HT+r5UKHPJT6/tBmexY5BJoHJZx
 ekUgYrJuoQPudVKersUhwP53ZHw9Vhzyv57sVNgD3LrXiEhsLoQCJyy2JtX2e5UtkjCF
 k3LoNx1V3yLCBsCnwYbMW1uI9NIR0b+2T9kj6HujPwRpHpOSEhGtJwpGKDEhwV/pYR5r
 35tz2DJqRJZj/aysAIC/ASCk6ftEahNyjH/IqTGtFYDyi/8ybyued/Lz0VlB6+1daJZp
 t7PA==
X-Gm-Message-State: AOAM532i4kkWu3uHfxFPzfN2Juhl6D+H+1X6xvoCHLqGUbZMOX3BQ0O0
 QziPLKZnX6Yts+56nxFnD0OWO9Z/L3fWlnmlDwA=
X-Google-Smtp-Source: ABdhPJwnRAnNyPSQckqTG5m/neJ232CA3KuInM6KMde6Xnc5wls/eBrck8LJ+4GMjYUKKib9rqOCJwzNkI0Do89tFYE=
X-Received: by 2002:a05:620a:802:: with SMTP id
 s2mr6049965qks.11.1631640698524; 
 Tue, 14 Sep 2021 10:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210914085033.2833993-1-matthew.auld@intel.com>
 <20210914085033.2833993-2-matthew.auld@intel.com>
 <106ed881-5cfb-6a73-f50a-32ef6edb5905@amd.com>
In-Reply-To: <106ed881-5cfb-6a73-f50a-32ef6edb5905@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 14 Sep 2021 18:31:10 +0100
Message-ID: <CAM0jSHPNP1X-eyVREFJxd4B0YtPcHNZFyvtVWXPL0maTA+pqsw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm/ttm: add TTM_PAGE_FLAG_SHMEM
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Sept 2021 at 10:03, Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 14.09.21 um 10:50 schrieb Matthew Auld:
> > Add new flag to indicate special shmem based tt, which can directly
> > handle swapping itself, and should be visible to some shrinker.
> >
> > As part of this we should skip the ttm_pages_allocated accounting, sinc=
e
> > such tt objects should already be reachable, and potentially reclaimabl=
e
> > by some shrinker, if under memory pressure, and so shouldn't directly
> > count towards the swap "watermark" level.
> >
> > We also need to stop touching the page->mapping and page->index for suc=
h
> > objects, like in ttm_tt_add_mapping, since shmem already uses these.
> > Some drivers seems to depend on the tt mapping/index behaviour for thei=
r
> > own purposes, so directly using shmem tt likely won't be usable there
> > as-is.
> >
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > ---
> >   drivers/gpu/drm/ttm/ttm_bo_vm.c |  4 ++--
> >   drivers/gpu/drm/ttm/ttm_tt.c    | 10 +++++-----
> >   include/drm/ttm/ttm_tt.h        |  1 +
> >   3 files changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_=
bo_vm.c
> > index f56be5bc0861..e2131c73dcb6 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -346,8 +346,8 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault=
 *vmf,
> >                       } else if (unlikely(!page)) {
> >                               break;
> >                       }
> > -                     page->index =3D drm_vma_node_start(&bo->base.vma_=
node) +
> > -                             page_offset;
> > +                     if (!(bo->ttm->page_flags & TTM_PAGE_FLAG_SHMEM))
> > +                             page->index =3D drm_vma_node_start(&bo->b=
ase.vma_node) + page_offset;
>
> I still have a rather bad feeling about that.
>
> This should either not be necessary any more in general or the shmemfile
> approach doesn't work correctly.
>
> Please send a patch to remove this for everybody instead and we will see
> if that really works or not.
>
> >                       pfn =3D page_to_pfn(page);
> >               }
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.=
c
> > index dae52433beeb..cc4815c1f505 100644
> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > @@ -293,7 +293,7 @@ static void ttm_tt_add_mapping(struct ttm_device *b=
dev, struct ttm_tt *ttm)
> >   {
> >       pgoff_t i;
> >
> > -     if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> > +     if (ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))
>
> Maybe you should re-use the TTM_PAGE_FLAG_SG for this and/or rename the
> flag to better describe what it does.
>
> Something like TTM_PAGE_FLAG_EXTERNAL or similar? The only other use
> case for TTM_PAGE_FLAG_SG which comes to my mind is controlling if the
> pages array is allocated or not.

This seems slightly tricky. We still want ttm_bo_vm_reserve() to
behave normally when seeing shmem_tt, and yet it still needs to return
SIGBUS or so for FLAG_SG, as per the existing behaviour. Throwing in
bo->type =3D=3D type_sg seems maybe plausible, but at least amdgpu is
manually setting FLAG_SG for userptr objects, so I presume bo->type !=3D
type_sg here?

Otherwise maybe just s/SHMEM/EXTERNAL and leave FLAG_SG as-is?

>
> Christian.
>
> >               return;
> >
> >       for (i =3D 0; i < ttm->num_pages; ++i)
> > @@ -311,7 +311,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
> >       if (ttm_tt_is_populated(ttm))
> >               return 0;
> >
> > -     if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> > +     if (!(ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))=
) {
> >               atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
> >               if (bdev->pool.use_dma32)
> >                       atomic_long_add(ttm->num_pages,
> > @@ -349,7 +349,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
> >       return 0;
> >
> >   error:
> > -     if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> > +     if (!(ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))=
) {
> >               atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> >               if (bdev->pool.use_dma32)
> >                       atomic_long_sub(ttm->num_pages,
> > @@ -364,7 +364,7 @@ static void ttm_tt_clear_mapping(struct ttm_tt *ttm=
)
> >       pgoff_t i;
> >       struct page **page =3D ttm->pages;
> >
> > -     if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> > +     if (ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))
> >               return;
> >
> >       for (i =3D 0; i < ttm->num_pages; ++i) {
> > @@ -384,7 +384,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, str=
uct ttm_tt *ttm)
> >       else
> >               ttm_pool_free(&bdev->pool, ttm);
> >
> > -     if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> > +     if (!(ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))=
) {
> >               atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> >               if (bdev->pool.use_dma32)
> >                       atomic_long_sub(ttm->num_pages,
> > diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> > index 89b15d673b22..20d550185065 100644
> > --- a/include/drm/ttm/ttm_tt.h
> > +++ b/include/drm/ttm/ttm_tt.h
> > @@ -42,6 +42,7 @@ struct ttm_operation_ctx;
> >   #define TTM_PAGE_FLAG_ZERO_ALLOC      (1 << 6)
> >   #define TTM_PAGE_FLAG_SG              (1 << 8)
> >   #define TTM_PAGE_FLAG_NO_RETRY            (1 << 9)
> > +#define TTM_PAGE_FLAG_SHMEM        (1 << 10)
> >
> >   #define TTM_PAGE_FLAG_PRIV_POPULATED  (1 << 31)
> >
>
