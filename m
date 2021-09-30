Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BCE41D557
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 10:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A2F6EAD7;
	Thu, 30 Sep 2021 08:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B4F8923D;
 Thu, 30 Sep 2021 08:20:43 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id q125so4977261qkd.12;
 Thu, 30 Sep 2021 01:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n+Vejk5qmOQOqdI9hMp5kG+++jQthbYcK2U31t58ZHc=;
 b=JJ5ZYgt9x7q41Fj1l10+lda0I/HWe79kDDcyIv8TcetFBBujyQABKJvgvY91ELlzM8
 0NNsjgp/Ss4BOXg10nidUCSgKPv9WNjDM763V7X7ydLXMONU1YhIRNbLOGugpinJ0UI5
 Sdje4UcaTWKP+WHRqSJaBNeC9ZFgJf14bwJKsgx4LevyomSl+9uxDi4Jwhmsew4VHQJH
 op4voAv5X039289V7mMD46oC6OnPojDxS+tifIbOvABQVKcCiLCmkvAAMSE1akq9GhAn
 fKwOA4q2HenTzQkIatXuZnKkoqFize5D7UTwFQkuaUCMRaO+sj6LjGJdMeifLOn8SMEY
 kBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n+Vejk5qmOQOqdI9hMp5kG+++jQthbYcK2U31t58ZHc=;
 b=ODhBaLxqvsXgZ3KP5f2SsGsMx9uyA8FHY1vZkJikyyB8xA3bWVZIHngMgs3B8F6RHI
 eNjZ/VXUBehmLgGF1qksu3ftCDTAv74Eh2beduqgu6I2FJXv4XBxQoe48J2oksB+Mg1a
 8ll6XPiopE8erN2DDy1cZM7VZrKh84vIDKLY+JyiwbTQfFZn5EbCAUpks5p8HcnhLnoF
 180Jo8IWGNTdQ5XAGWJvYIKpBU1ceKFbvNcZHLzPq56rdPeqPcGoBNHnbfo2AbUkU39Z
 kS5eM1pDj7vDHF6imdn/ooTLbGWSwm9aojpEAWfuMOCjHGraW+wAVFJA6w8Peydy6qe/
 OkEQ==
X-Gm-Message-State: AOAM530to0D6VjvczwPgTYgDyEXY4ioLAI4iSufCTuchx4/34IQzM2wl
 ofJsiiMRdEwp13kMKIPsnWeOsSlctI4IMGCDYDE=
X-Google-Smtp-Source: ABdhPJwOtMccAR+PrxtbRXvjtYkZ/yNRM/aJHUYpm89r0A3TBVU5vtAhWZlWrI7c99jc37vRoLeglMyXdrQ5rUUyaXQ=
X-Received: by 2002:a37:901:: with SMTP id 1mr3627047qkj.342.1632990039807;
 Thu, 30 Sep 2021 01:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210929132629.353541-1-matthew.auld@intel.com>
 <f6b4b843-55f8-62cb-ef1d-8e8935c6ad71@amd.com>
 <CAM0jSHMfBsKtyd7To3rWbCvMzLhHLAgyXENjVJPrgkoYCiiNVg@mail.gmail.com>
 <f8ca1ab8-0c07-131e-a68f-4d8ecb67ae3f@amd.com>
In-Reply-To: <f8ca1ab8-0c07-131e-a68f-4d8ecb67ae3f@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 30 Sep 2021 09:20:11 +0100
Message-ID: <CAM0jSHPNWoPMFAtj+cT7oFUBf0zVG__cgwNRgbqniAMqOH8BNw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/ttm: s/FLAG_SG/FLAG_EXTERNAL/
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

On Thu, 30 Sept 2021 at 08:45, Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 30.09.21 um 09:42 schrieb Matthew Auld:
> > On Thu, 30 Sept 2021 at 08:28, Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
> >> I pushed those to drm-misc-next and fixed the i915 merge fallout in dr=
m-tip.
> >>
> >> Maybe take another look at the resolution in drm-tip if you have time.
> > Thanks, although it looks like there is some breakage in the build on d=
rm-tip:
> >
> > drivers/gpu/drm/ttm/ttm_bo_util.c: In function =E2=80=98ttm_bo_move_mem=
cpy=E2=80=99:
> > drivers/gpu/drm/ttm/ttm_bo_util.c:172:44: error:
> > =E2=80=98TTM_PAGE_FLAG_ZERO_ALLOC=E2=80=99 undeclared (first use in thi=
s function);
> > did you mean =E2=80=98TTM_TT_FLAG_ZERO_ALLOC=E2=80=99?
> > 172 | if (!(clear && ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLO=
C)))
> >
> > ...
> >
> > drivers/gpu/drm/i915/gem/i915_gem_ttm.c: In function =E2=80=98i915_ttm_=
move=E2=80=99:
> > drivers/gpu/drm/i915/gem/i915_gem_ttm.c:576:44: error:
> > =E2=80=98TTM_PAGE_FLAG_ZERO_ALLOC=E2=80=99 undeclared (first use in thi=
s function);
> > did you mean =E2=80=98TTM_TT_FLAG_ZERO_ALLOC=E2=80=99?
> > 576 | if (!(clear && ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLO=
C)))
> > | ^~~~~~~~~~~~~~~~~~~~~~~~
> > | TTM_TT_FLAG_ZERO_ALLOC
> >
>
> Crap, I hoped that I got all of those.
>
> > Do we just need to revert the bad commit in drm-rerere, rebuild tip,
> > and try again? If so I can try to attempt this.
>
> Yes, please do so. I can't easily build drm-tip, would need to setup
> another box extra for this.

Ok, hopefully sorted now.

>
> Christian.
>
> >
> >> Christian.
> >>
> >> Am 29.09.21 um 15:26 schrieb Matthew Auld:
> >>> It covers more than just ttm_bo_type_sg usage, like with say dma-buf,
> >>> since one other user is userptr in amdgpu, and in the future we might
> >>> have some more. Hence EXTERNAL is likely a more suitable name.
> >>>
> >>> v2(Christian):
> >>>     - Rename these to TTM_TT_FLAGS_*
> >>>     - Fix up all the holes in the flag values
> >>>
> >>> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> >>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> ---
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 10 +++++-----
> >>>    drivers/gpu/drm/i915/gem/i915_gem_ttm.c |  6 +++---
> >>>    drivers/gpu/drm/nouveau/nouveau_bo.c    |  4 ++--
> >>>    drivers/gpu/drm/radeon/radeon_ttm.c     |  8 ++++----
> >>>    drivers/gpu/drm/ttm/ttm_bo.c            |  4 ++--
> >>>    drivers/gpu/drm/ttm/ttm_bo_util.c       |  4 ++--
> >>>    drivers/gpu/drm/ttm/ttm_bo_vm.c         |  2 +-
> >>>    drivers/gpu/drm/ttm/ttm_pool.c          |  2 +-
> >>>    drivers/gpu/drm/ttm/ttm_tt.c            | 24 ++++++++++++---------=
---
> >>>    include/drm/ttm/ttm_device.h            |  2 +-
> >>>    include/drm/ttm/ttm_tt.h                | 18 +++++++++---------
> >>>    11 files changed, 42 insertions(+), 42 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_ttm.c
> >>> index 60b12bb55244..e8d70b6e6737 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> >>> @@ -894,7 +894,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_dev=
ice *bdev,
> >>>                        DRM_ERROR("failed to pin userptr\n");
> >>>                        return r;
> >>>                }
> >>> -     } else if (ttm->page_flags & TTM_PAGE_FLAG_SG) {
> >>> +     } else if (ttm->page_flags & TTM_TT_FLAG_EXTERNAL) {
> >>>                if (!ttm->sg) {
> >>>                        struct dma_buf_attachment *attach;
> >>>                        struct sg_table *sgt;
> >>> @@ -1130,7 +1130,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_de=
vice *bdev,
> >>>                return 0;
> >>>        }
> >>>
> >>> -     if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> >>> +     if (ttm->page_flags & TTM_TT_FLAG_EXTERNAL)
> >>>                return 0;
> >>>
> >>>        ret =3D ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
> >>> @@ -1165,7 +1165,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm=
_device *bdev,
> >>>                return;
> >>>        }
> >>>
> >>> -     if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> >>> +     if (ttm->page_flags & TTM_TT_FLAG_EXTERNAL)
> >>>                return;
> >>>
> >>>        for (i =3D 0; i < ttm->num_pages; ++i)
> >>> @@ -1198,8 +1198,8 @@ int amdgpu_ttm_tt_set_userptr(struct ttm_buffer=
_object *bo,
> >>>                        return -ENOMEM;
> >>>        }
> >>>
> >>> -     /* Set TTM_PAGE_FLAG_SG before populate but after create. */
> >>> -     bo->ttm->page_flags |=3D TTM_PAGE_FLAG_SG;
> >>> +     /* Set TTM_TT_FLAG_EXTERNAL before populate but after create. *=
/
> >>> +     bo->ttm->page_flags |=3D TTM_TT_FLAG_EXTERNAL;
> >>>
> >>>        gtt =3D (void *)bo->ttm;
> >>>        gtt->userptr =3D addr;
> >>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_ttm.c
> >>> index f0a61a9474fc..8beef57ba52b 100644
> >>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> >>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> >>> @@ -182,7 +182,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct t=
tm_buffer_object *bo,
> >>>
> >>>        if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
> >>>            man->use_tt)
> >>> -             page_flags |=3D TTM_PAGE_FLAG_ZERO_ALLOC;
> >>> +             page_flags |=3D TTM_TT_FLAG_ZERO_ALLOC;
> >>>
> >>>        ret =3D ttm_tt_init(&i915_tt->ttm, bo, page_flags,
> >>>                          i915_ttm_select_tt_caching(obj));
> >>> @@ -451,7 +451,7 @@ static int i915_ttm_accel_move(struct ttm_buffer_=
object *bo,
> >>>                if (bo->type =3D=3D ttm_bo_type_kernel)
> >>>                        return -EINVAL;
> >>>
> >>> -             if (ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC=
))
> >>> +             if (ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC))
> >>>                        return 0;
> >>>
> >>>                intel_engine_pm_get(i915->gt.migrate.context->engine);
> >>> @@ -525,7 +525,7 @@ static int i915_ttm_move(struct ttm_buffer_object=
 *bo, bool evict,
> >>>
> >>>        /* Populate ttm with pages if needed. Typically system memory.=
 */
> >>>        if (bo->ttm && (dst_man->use_tt ||
> >>> -                     (bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)))=
 {
> >>> +                     (bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED))) {
> >>>                ret =3D ttm_tt_populate(bo->bdev, bo->ttm, ctx);
> >>>                if (ret)
> >>>                        return ret;
> >>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/n=
ouveau/nouveau_bo.c
> >>> index 33dca2565cca..b2c7e0802ac3 100644
> >>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> >>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >>> @@ -1249,7 +1249,7 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev=
,
> >>>        struct ttm_tt *ttm_dma =3D (void *)ttm;
> >>>        struct nouveau_drm *drm;
> >>>        struct device *dev;
> >>> -     bool slave =3D !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> >>> +     bool slave =3D !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
> >>>
> >>>        if (ttm_tt_is_populated(ttm))
> >>>                return 0;
> >>> @@ -1272,7 +1272,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_device *bd=
ev,
> >>>    {
> >>>        struct nouveau_drm *drm;
> >>>        struct device *dev;
> >>> -     bool slave =3D !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> >>> +     bool slave =3D !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
> >>>
> >>>        if (slave)
> >>>                return;
> >>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/ra=
deon/radeon_ttm.c
> >>> index 7793249bc549..11b21d605584 100644
> >>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> >>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> >>> @@ -545,14 +545,14 @@ static int radeon_ttm_tt_populate(struct ttm_de=
vice *bdev,
> >>>    {
> >>>        struct radeon_device *rdev =3D radeon_get_rdev(bdev);
> >>>        struct radeon_ttm_tt *gtt =3D radeon_ttm_tt_to_gtt(rdev, ttm);
> >>> -     bool slave =3D !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> >>> +     bool slave =3D !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
> >>>
> >>>        if (gtt && gtt->userptr) {
> >>>                ttm->sg =3D kzalloc(sizeof(struct sg_table), GFP_KERNE=
L);
> >>>                if (!ttm->sg)
> >>>                        return -ENOMEM;
> >>>
> >>> -             ttm->page_flags |=3D TTM_PAGE_FLAG_SG;
> >>> +             ttm->page_flags |=3D TTM_TT_FLAG_EXTERNAL;
> >>>                return 0;
> >>>        }
> >>>
> >>> @@ -569,13 +569,13 @@ static void radeon_ttm_tt_unpopulate(struct ttm=
_device *bdev, struct ttm_tt *ttm
> >>>    {
> >>>        struct radeon_device *rdev =3D radeon_get_rdev(bdev);
> >>>        struct radeon_ttm_tt *gtt =3D radeon_ttm_tt_to_gtt(rdev, ttm);
> >>> -     bool slave =3D !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> >>> +     bool slave =3D !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
> >>>
> >>>        radeon_ttm_tt_unbind(bdev, ttm);
> >>>
> >>>        if (gtt && gtt->userptr) {
> >>>                kfree(ttm->sg);
> >>> -             ttm->page_flags &=3D ~TTM_PAGE_FLAG_SG;
> >>> +             ttm->page_flags &=3D ~TTM_TT_FLAG_EXTERNAL;
> >>>                return;
> >>>        }
> >>>
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_b=
o.c
> >>> index 3b22c0013dbf..d62b2013c367 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> >>> @@ -1115,8 +1115,8 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo=
, struct ttm_operation_ctx *ctx,
> >>>                return -EBUSY;
> >>>
> >>>        if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
> >>> -         bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
> >>> -         bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED ||
> >>> +         bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL ||
> >>> +         bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED ||
> >>>            !ttm_bo_get_unless_zero(bo)) {
> >>>                if (locked)
> >>>                        dma_resv_unlock(bo->base.resv);
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/=
ttm_bo_util.c
> >>> index 1c5ffe2935af..82af095f6b81 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> >>> @@ -103,7 +103,7 @@ void ttm_move_memcpy(struct ttm_buffer_object *bo=
,
> >>>
> >>>        /* Don't move nonexistent data. Clear destination instead. */
> >>>        if (src_ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm))) {
> >>> -             if (ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC=
))
> >>> +             if (ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC))
> >>>                        return;
> >>>
> >>>                for (i =3D 0; i < num_pages; ++i) {
> >>> @@ -150,7 +150,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *=
bo,
> >>>        struct ttm_kmap_iter *dst_iter, *src_iter;
> >>>        int ret =3D 0;
> >>>
> >>> -     if (ttm && ((ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) ||
> >>> +     if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
> >>>                    dst_man->use_tt)) {
> >>>                ret =3D ttm_tt_populate(bdev, ttm, ctx);
> >>>                if (ret)
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/tt=
m_bo_vm.c
> >>> index 9a2119fe4bdd..950f4f132802 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> >>> @@ -162,7 +162,7 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_ob=
ject *bo,
> >>>         * Refuse to fault imported pages. This should be handled
> >>>         * (if at all) by redirecting mmap to the exporter.
> >>>         */
> >>> -     if (bo->ttm && (bo->ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> >>> +     if (bo->ttm && (bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
> >>>                dma_resv_unlock(bo->base.resv);
> >>>                return VM_FAULT_SIGBUS;
> >>>        }
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm=
_pool.c
> >>> index c961a788b519..1bba0a0ed3f9 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> >>> @@ -371,7 +371,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct =
ttm_tt *tt,
> >>>        WARN_ON(!num_pages || ttm_tt_is_populated(tt));
> >>>        WARN_ON(dma_addr && !pool->dev);
> >>>
> >>> -     if (tt->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)
> >>> +     if (tt->page_flags & TTM_TT_FLAG_ZERO_ALLOC)
> >>>                gfp_flags |=3D __GFP_ZERO;
> >>>
> >>>        if (ctx->gfp_retry_mayfail)
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_t=
t.c
> >>> index 980ecb079b2c..86f31fde6e35 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> >>> @@ -68,12 +68,12 @@ int ttm_tt_create(struct ttm_buffer_object *bo, b=
ool zero_alloc)
> >>>        switch (bo->type) {
> >>>        case ttm_bo_type_device:
> >>>                if (zero_alloc)
> >>> -                     page_flags |=3D TTM_PAGE_FLAG_ZERO_ALLOC;
> >>> +                     page_flags |=3D TTM_TT_FLAG_ZERO_ALLOC;
> >>>                break;
> >>>        case ttm_bo_type_kernel:
> >>>                break;
> >>>        case ttm_bo_type_sg:
> >>> -             page_flags |=3D TTM_PAGE_FLAG_SG;
> >>> +             page_flags |=3D TTM_TT_FLAG_EXTERNAL;
> >>>                break;
> >>>        default:
> >>>                pr_err("Illegal buffer object type\n");
> >>> @@ -156,7 +156,7 @@ EXPORT_SYMBOL(ttm_tt_init);
> >>>
> >>>    void ttm_tt_fini(struct ttm_tt *ttm)
> >>>    {
> >>> -     WARN_ON(ttm->page_flags & TTM_PAGE_FLAG_PRIV_POPULATED);
> >>> +     WARN_ON(ttm->page_flags & TTM_TT_FLAG_PRIV_POPULATED);
> >>>
> >>>        if (ttm->swap_storage)
> >>>                fput(ttm->swap_storage);
> >>> @@ -178,7 +178,7 @@ int ttm_sg_tt_init(struct ttm_tt *ttm, struct ttm=
_buffer_object *bo,
> >>>
> >>>        ttm_tt_init_fields(ttm, bo, page_flags, caching);
> >>>
> >>> -     if (page_flags & TTM_PAGE_FLAG_SG)
> >>> +     if (page_flags & TTM_TT_FLAG_EXTERNAL)
> >>>                ret =3D ttm_sg_tt_alloc_page_directory(ttm);
> >>>        else
> >>>                ret =3D ttm_dma_tt_alloc_page_directory(ttm);
> >>> @@ -224,7 +224,7 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
> >>>
> >>>        fput(swap_storage);
> >>>        ttm->swap_storage =3D NULL;
> >>> -     ttm->page_flags &=3D ~TTM_PAGE_FLAG_SWAPPED;
> >>> +     ttm->page_flags &=3D ~TTM_TT_FLAG_SWAPPED;
> >>>
> >>>        return 0;
> >>>
> >>> @@ -279,7 +279,7 @@ int ttm_tt_swapout(struct ttm_device *bdev, struc=
t ttm_tt *ttm,
> >>>
> >>>        ttm_tt_unpopulate(bdev, ttm);
> >>>        ttm->swap_storage =3D swap_storage;
> >>> -     ttm->page_flags |=3D TTM_PAGE_FLAG_SWAPPED;
> >>> +     ttm->page_flags |=3D TTM_TT_FLAG_SWAPPED;
> >>>
> >>>        return ttm->num_pages;
> >>>
> >>> @@ -300,7 +300,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
> >>>        if (ttm_tt_is_populated(ttm))
> >>>                return 0;
> >>>
> >>> -     if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> >>> +     if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
> >>>                atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
> >>>                if (bdev->pool.use_dma32)
> >>>                        atomic_long_add(ttm->num_pages,
> >>> @@ -325,8 +325,8 @@ int ttm_tt_populate(struct ttm_device *bdev,
> >>>        if (ret)
> >>>                goto error;
> >>>
> >>> -     ttm->page_flags |=3D TTM_PAGE_FLAG_PRIV_POPULATED;
> >>> -     if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
> >>> +     ttm->page_flags |=3D TTM_TT_FLAG_PRIV_POPULATED;
> >>> +     if (unlikely(ttm->page_flags & TTM_TT_FLAG_SWAPPED)) {
> >>>                ret =3D ttm_tt_swapin(ttm);
> >>>                if (unlikely(ret !=3D 0)) {
> >>>                        ttm_tt_unpopulate(bdev, ttm);
> >>> @@ -337,7 +337,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
> >>>        return 0;
> >>>
> >>>    error:
> >>> -     if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> >>> +     if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
> >>>                atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> >>>                if (bdev->pool.use_dma32)
> >>>                        atomic_long_sub(ttm->num_pages,
> >>> @@ -357,14 +357,14 @@ void ttm_tt_unpopulate(struct ttm_device *bdev,=
 struct ttm_tt *ttm)
> >>>        else
> >>>                ttm_pool_free(&bdev->pool, ttm);
> >>>
> >>> -     if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> >>> +     if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
> >>>                atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
> >>>                if (bdev->pool.use_dma32)
> >>>                        atomic_long_sub(ttm->num_pages,
> >>>                                        &ttm_dma32_pages_allocated);
> >>>        }
> >>>
> >>> -     ttm->page_flags &=3D ~TTM_PAGE_FLAG_PRIV_POPULATED;
> >>> +     ttm->page_flags &=3D ~TTM_TT_FLAG_PRIV_POPULATED;
> >>>    }
> >>>
> >>>    #ifdef CONFIG_DEBUG_FS
> >>> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_devic=
e.h
> >>> index cbe03d45e883..0a4ddec78d8f 100644
> >>> --- a/include/drm/ttm/ttm_device.h
> >>> +++ b/include/drm/ttm/ttm_device.h
> >>> @@ -65,7 +65,7 @@ struct ttm_device_funcs {
> >>>         * ttm_tt_create
> >>>         *
> >>>         * @bo: The buffer object to create the ttm for.
> >>> -      * @page_flags: Page flags as identified by TTM_PAGE_FLAG_XX fl=
ags.
> >>> +      * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flag=
s.
> >>>         *
> >>>         * Create a struct ttm_tt to back data with system memory page=
s.
> >>>         * No pages are actually allocated.
> >>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> >>> index 842ce756213c..b023cd58ff38 100644
> >>> --- a/include/drm/ttm/ttm_tt.h
> >>> +++ b/include/drm/ttm/ttm_tt.h
> >>> @@ -38,17 +38,17 @@ struct ttm_resource;
> >>>    struct ttm_buffer_object;
> >>>    struct ttm_operation_ctx;
> >>>
> >>> -#define TTM_PAGE_FLAG_SWAPPED         (1 << 4)
> >>> -#define TTM_PAGE_FLAG_ZERO_ALLOC      (1 << 6)
> >>> -#define TTM_PAGE_FLAG_SG              (1 << 8)
> >>> +#define TTM_TT_FLAG_SWAPPED  (1 << 0)
> >>> +#define TTM_TT_FLAG_ZERO_ALLOC       (1 << 1)
> >>> +#define TTM_TT_FLAG_EXTERNAL (1 << 2)
> >>>
> >>> -#define TTM_PAGE_FLAG_PRIV_POPULATED  (1 << 31)
> >>> +#define TTM_TT_FLAG_PRIV_POPULATED  (1 << 31)
> >>>
> >>>    /**
> >>>     * struct ttm_tt
> >>>     *
> >>>     * @pages: Array of pages backing the data.
> >>> - * @page_flags: see TTM_PAGE_FLAG_*
> >>> + * @page_flags: see TTM_TT_FLAG_*
> >>>     * @num_pages: Number of pages in the page array.
> >>>     * @sg: for SG objects via dma-buf
> >>>     * @dma_address: The DMA (bus) addresses of the pages
> >>> @@ -84,7 +84,7 @@ struct ttm_kmap_iter_tt {
> >>>
> >>>    static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
> >>>    {
> >>> -     return tt->page_flags & TTM_PAGE_FLAG_PRIV_POPULATED;
> >>> +     return tt->page_flags & TTM_TT_FLAG_PRIV_POPULATED;
> >>>    }
> >>>
> >>>    /**
> >>> @@ -103,7 +103,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, b=
ool zero_alloc);
> >>>     *
> >>>     * @ttm: The struct ttm_tt.
> >>>     * @bo: The buffer object we create the ttm for.
> >>> - * @page_flags: Page flags as identified by TTM_PAGE_FLAG_XX flags.
> >>> + * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flags.
> >>>     * @caching: the desired caching state of the pages
> >>>     *
> >>>     * Create a struct ttm_tt to back data with system memory pages.
> >>> @@ -178,7 +178,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, s=
truct ttm_tt *ttm);
> >>>     */
> >>>    static inline void ttm_tt_mark_for_clear(struct ttm_tt *ttm)
> >>>    {
> >>> -     ttm->page_flags |=3D TTM_PAGE_FLAG_ZERO_ALLOC;
> >>> +     ttm->page_flags |=3D TTM_TT_FLAG_ZERO_ALLOC;
> >>>    }
> >>>
> >>>    void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dm=
a32_pages);
> >>> @@ -194,7 +194,7 @@ struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struc=
t ttm_kmap_iter_tt *iter_tt,
> >>>     *
> >>>     * @bo: Buffer object we allocate the ttm for.
> >>>     * @bridge: The agp bridge this device is sitting on.
> >>> - * @page_flags: Page flags as identified by TTM_PAGE_FLAG_XX flags.
> >>> + * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flags.
> >>>     *
> >>>     *
> >>>     * Create a TTM backend that uses the indicated AGP bridge as an a=
perture
>
