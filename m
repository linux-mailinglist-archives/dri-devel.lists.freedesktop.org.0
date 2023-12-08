Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7F980AD5E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 20:54:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1804B10EB17;
	Fri,  8 Dec 2023 19:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3BC10EB16;
 Fri,  8 Dec 2023 19:53:58 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5908a5d4222so581517eaf.2; 
 Fri, 08 Dec 2023 11:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702065237; x=1702670037; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tlgib7Ymoagx47LunzL8r3/prm76C3jhOjStRO5hxUY=;
 b=SRRCtMhJ24yc/+g5poVJ870pdiZwjb2GXYqRS+V4s+yd6ZDJtUdPcmGjBHxC+8zndv
 0+U5r91avKZ4DidVUb9M+vDrIGsmfqm1t2bcwCStUp0h9+TA59PwByD4vfTHBgWM+w7Z
 oWABUeu98ZcAm7KiGzDfthBahzZbk1ceHuipTlAoF9hoQbO44hifeCXk1RNBLBP6fJF5
 pyirZZhCMnsCtNUvxxFZbTr5GJfjZYFmiR64w5u0lmKNm6lg1TLJJkBvZH+rQ+AV8Ncf
 ULCgG5enCf9qUpXy9E1oYqsDFPpykHPqgaPU1YNRhjtdLm4oW0jCrDI2Nch1LSYXpPfC
 iRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702065237; x=1702670037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tlgib7Ymoagx47LunzL8r3/prm76C3jhOjStRO5hxUY=;
 b=CndDjy5zi/Sk5L1ua/OKyXUKXMgT8gPbg55m3+WRcV3qayxSSVeqtDOrH7I/67LoHm
 IS3WiNPcWBxE4V3H1YwIFXc/1K9ho+wQNHkY2HUQtWvK0ksG1t3AOVArvscNcNrKaTNQ
 fBe5swXdBj383HuKPN4I3ecN9vA4CfHOlZ9w+RP8kt445DHKPM74dSIwdV05gTnkEsks
 F8aSRFttoZBl0YOwTxv5djnv8YswQNiOyekSFg0YtgO7rrY7/U4/6C3zgM8kC2it/DzP
 gZs1NkCo2yVHfl6WX35XZNfK6XHQmbCEQ5Pghp0bTJCk1CTeofSI/0wKVF9CLjQWm4Gh
 JFHw==
X-Gm-Message-State: AOJu0Yzlc4g0ELDhkruJmvrwkZWEjwJFVKVNvpdFDlRTOvh5uzF/F0Jd
 EAMAr+CvZKn3TTz2yITZ1D6RzfLqfuoxYlzfXHgw+e5h
X-Google-Smtp-Source: AGHT+IFwFUoWZ9hDBVCe4pfkie1fx6KDxzhFhL0Ghe047YexvWb5IuMIRUIHgwUmvejZTPyt3I9+R5twFKHRuGh95Js=
X-Received: by 2002:a05:6871:7990:b0:1fb:e5f:c539 with SMTP id
 pb16-20020a056871799000b001fb0e5fc539mr595639oac.49.1702065237053; Fri, 08
 Dec 2023 11:53:57 -0800 (PST)
MIME-Version: 1.0
References: <20231207151142.929349-1-Arunpravin.PaneerSelvam@amd.com>
 <20231207151142.929349-2-Arunpravin.PaneerSelvam@amd.com>
 <d30b7992-5c39-49f5-889c-c31d4994a5c3@amd.com>
In-Reply-To: <d30b7992-5c39-49f5-889c-c31d4994a5c3@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Dec 2023 14:53:45 -0500
Message-ID: <CADnq5_PdWUDVK0mvMgyTyogMnT-DD2nhXHarO+BLg9BjtGPRGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: Enable clear page functionality
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 8, 2023 at 5:07=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 07.12.23 um 16:11 schrieb Arunpravin Paneer Selvam:
> > Add clear page support in vram memory region.
>
> The first patch looks good, but this here needs quite some work.
>
> >
> > Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.co=
m>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 13 +++--
> >   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 50 ++++++++++++++++++=
+
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  4 ++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 14 +++++-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
> >   6 files changed, 105 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_object.c
> > index cef920a93924..bc4ea87f8b5e 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> > @@ -39,6 +39,7 @@
> >   #include "amdgpu.h"
> >   #include "amdgpu_trace.h"
> >   #include "amdgpu_amdkfd.h"
> > +#include "amdgpu_vram_mgr.h"
> >
> >   /**
> >    * DOC: amdgpu_object
> > @@ -629,15 +630,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
> >
> >       if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
> >           bo->tbo.resource->mem_type =3D=3D TTM_PL_VRAM) {
> > -             struct dma_fence *fence;
> > +             struct dma_fence *fence =3D NULL;
> >
> > -             r =3D amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence=
, true);
> > +             r =3D amdgpu_clear_buffer(bo, bo->tbo.base.resv, &fence, =
true);
> >               if (unlikely(r))
> >                       goto fail_unreserve;
> >
> > -             dma_resv_add_fence(bo->tbo.base.resv, fence,
> > -                                DMA_RESV_USAGE_KERNEL);
> > -             dma_fence_put(fence);
> > +             if (fence) {
> > +                     dma_resv_add_fence(bo->tbo.base.resv, fence,
> > +                                        DMA_RESV_USAGE_KERNEL);
> > +                     dma_fence_put(fence);
> > +             }
> >       }
> >       if (!bp->resv)
> >               amdgpu_bo_unreserve(bo);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_res_cursor.h
> > index 381101d2bf05..50fcd86e1033 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> > @@ -164,4 +164,29 @@ static inline void amdgpu_res_next(struct amdgpu_r=
es_cursor *cur, uint64_t size)
> >       }
> >   }
> >
> > +/**
> > + * amdgpu_res_cleared - check if blocks are cleared
> > + *
> > + * @cur: the cursor to extract the block
> > + *
> > + * Check if the @cur block is cleared
> > + */
> > +static inline bool amdgpu_res_cleared(struct amdgpu_res_cursor *cur)
> > +{
> > +     struct drm_buddy_block *block;
> > +
> > +     switch (cur->mem_type) {
> > +     case TTM_PL_VRAM:
> > +             block =3D cur->node;
> > +
> > +             if (!amdgpu_vram_mgr_is_cleared(block))
> > +                     return false;
> > +             break;
> > +     default:
> > +             return false;
> > +     }
> > +
> > +     return true;
> > +}
> > +
> >   #endif
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> > index 05991c5c8ddb..6d7514e8f40c 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -2222,6 +2222,56 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_rin=
g *ring, uint32_t src_data,
> >       return 0;
> >   }
> >
> > +int amdgpu_clear_buffer(struct amdgpu_bo *bo,
> > +                     struct dma_resv *resv,
> > +                     struct dma_fence **fence,
> > +                     bool delayed)
>
> Drop the delayed parameter, that doesn't make any sense here.
>
> And as Alex said please use an amdgpu_ttm_ prefix for the function name.
>
> > +{
> > +     struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
> > +     struct amdgpu_ring *ring =3D adev->mman.buffer_funcs_ring;
> > +     struct amdgpu_res_cursor cursor;
> > +     struct dma_fence *f =3D NULL;
> > +     u64 addr;
> > +     int r;
> > +
> > +     if (!adev->mman.buffer_funcs_enabled)
> > +             return -EINVAL;
> > +
> > +     amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor=
);
> > +
> > +     mutex_lock(&adev->mman.gtt_window_lock);
> > +     while (cursor.remaining) {
> > +             struct dma_fence *next =3D NULL;
> > +             u64 size;
> > +
> > +             /* Never clear more than 256MiB at once to avoid timeouts=
 */
> > +             size =3D min(cursor.size, 256ULL << 20);
> > +
> > +             if (!amdgpu_res_cleared(&cursor)) {
>
> This needs to come before the min(cursor.size....) directly above. I
> suggest a handling like this:
>
> if (amdgpu_res_cleared(&cursor)) {
>         amdgpu_res_next(&cursor, cursor.size);
>         continue;
> }
>
> size =3D min(....
>
> > +                     r =3D amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.res=
ource, &cursor,
> > +                                               1, ring, false, &size, =
&addr);
> > +                     if (r)
> > +                             goto err;
> > +
> > +                     r =3D amdgpu_ttm_fill_mem(ring, 0, addr, size, re=
sv,
> > +                                             &next, true, delayed);
> > +                     if (r)
> > +                             goto err;
> > +             }
> > +             dma_fence_put(f);
> > +             f =3D next;
> > +
> > +             amdgpu_res_next(&cursor, size);
> > +     }
> > +err:
> > +     mutex_unlock(&adev->mman.gtt_window_lock);
> > +     if (fence)
> > +             *fence =3D dma_fence_get(f);
> > +     dma_fence_put(f);
> > +
> > +     return r;
> > +}
> > +
> >   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
> >                       uint32_t src_data,
> >                       struct dma_resv *resv,
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.h
> > index 65ec82141a8e..838251166883 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> > @@ -155,6 +155,10 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_devic=
e *adev,
> >                              uint64_t size, bool tmz,
> >                              struct dma_resv *resv,
> >                              struct dma_fence **f);
> > +int amdgpu_clear_buffer(struct amdgpu_bo *bo,
> > +                     struct dma_resv *resv,
> > +                     struct dma_fence **fence,
> > +                     bool delayed);
> >   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
> >                       uint32_t src_data,
> >                       struct dma_resv *resv,
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > index d0e199cc8f17..ff74c324b5b5 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> > @@ -435,6 +435,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_=
manager *man,
> >   {
> >       struct amdgpu_vram_mgr *mgr =3D to_vram_mgr(man);
> >       struct amdgpu_device *adev =3D to_amdgpu_device(mgr);
> > +     struct amdgpu_bo *bo =3D ttm_to_amdgpu_bo(tbo);
> >       u64 vis_usage =3D 0, max_bytes, min_block_size;
> >       struct amdgpu_vram_mgr_resource *vres;
> >       u64 size, remaining_size, lpfn, fpfn;
> > @@ -486,6 +487,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_=
manager *man,
> >       if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
> >               vres->flags |=3D DRM_BUDDY_CONTIGUOUS_ALLOCATION;
> >
> > +     if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
> > +             vres->flags |=3D DRM_BUDDY_CLEAR_ALLOCATION;
> > +
> >       if (fpfn || lpfn !=3D mgr->mm.size)
> >               /* Allocate blocks in desired range */
> >               vres->flags |=3D DRM_BUDDY_RANGE_ALLOCATION;
> > @@ -579,7 +583,9 @@ static void amdgpu_vram_mgr_del(struct ttm_resource=
_manager *man,
> >       struct amdgpu_vram_mgr_resource *vres =3D to_amdgpu_vram_mgr_reso=
urce(res);
> >       struct amdgpu_vram_mgr *mgr =3D to_vram_mgr(man);
> >       struct amdgpu_device *adev =3D to_amdgpu_device(mgr);
> > +     struct amdgpu_bo *bo =3D ttm_to_amdgpu_bo(res->bo);
> >       struct drm_buddy *mm =3D &mgr->mm;
> > +     struct dma_fence *fence =3D NULL;
> >       struct drm_buddy_block *block;
> >       uint64_t vis_usage =3D 0;
> >
> > @@ -589,7 +595,13 @@ static void amdgpu_vram_mgr_del(struct ttm_resourc=
e_manager *man,
> >
> >       amdgpu_vram_mgr_do_reserve(man);
> >
> > -     drm_buddy_free_list(mm, &vres->blocks, 0);
> > +     /* Clear all the blocks in free path */
> > +     if (!amdgpu_fill_buffer(bo, 0, NULL, &fence, true)) {
> > +             vres->flags |=3D DRM_BUDDY_CLEARED;
> > +             dma_fence_put(fence);
> > +     }
> > +
>
> That's a pretty clear no-go. This is the backend and CS is done from the
> front end. E.g. can't properly wait for the fence for example.
>
> Instead use the AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE flag for this.
>
> IIRC we already always set this flag when ras is enabled, just make it
> mandatory for now.
>
> > +     drm_buddy_free_list(mm, &vres->blocks, vres->flags);
> >       mutex_unlock(&mgr->lock);
> >
> >       atomic64_sub(vis_usage, &mgr->vis_usage);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_vram_mgr.h
> > index 0e04e42cf809..8478522d7366 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> > @@ -53,6 +53,11 @@ static inline u64 amdgpu_vram_mgr_block_size(struct =
drm_buddy_block *block)
> >       return (u64)PAGE_SIZE << drm_buddy_block_order(block);
> >   }
> >
> > +static inline bool amdgpu_vram_mgr_is_cleared(struct drm_buddy_block *=
block)
> > +{
> > +     return drm_buddy_block_is_clear(block);
> > +}
> > +
>
> You also need a functionality which resets all cleared blocks to
> uncleared after suspend/resume.
>
> No idea how to do this, maybe Alex knows of hand.

Since the buffers are cleared on creation, is there actually anything to do=
?

Alex

>
> Regards,
> Christian.
>
> >   static inline struct amdgpu_vram_mgr_resource *
> >   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
> >   {
>
