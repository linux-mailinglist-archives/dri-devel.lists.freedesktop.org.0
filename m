Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C73CD6960C6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 11:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D2910E85F;
	Tue, 14 Feb 2023 10:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E514710E044;
 Tue, 14 Feb 2023 10:32:10 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id j17so22841818lfr.3;
 Tue, 14 Feb 2023 02:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yMsVgeHF16TbB6pFfSJ9hotlSXc2ventYHAUwEcaI4A=;
 b=JeiBTw9+GIhhWGGMK/0sHL/koXX784iFFcePJ+3y34GH0Awfqikiv/y5ZHkM30ZweL
 JkI0x4IBzYU1BL9rA7wcwRLeQEJIMP3CwAlvzyJsF118TB6UqGiS7or08nEvliW5WHU1
 f99S2TH7XgkojxlwVG6r3eg2bCBciUhUvq2xCe55WCN/mCEHAyKrxlEmiBMaZTvJjaOx
 9zXYVvtcrD47o1a7Q9h0USibeCUAkwwMnh2YTiSb2sMmBbBZEh2BKk2LBvmBWfca4uLp
 YaeqZAKVkud9PmSKFRESwebB7ooIl8+4pUgpgMjsZIlEty0ju90n8YMUDN/mVKMhs/zV
 +KVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yMsVgeHF16TbB6pFfSJ9hotlSXc2ventYHAUwEcaI4A=;
 b=XMVJ/c6MPiTA2Lm61xNZ6BDxmaxz+O2Vl3IAFKslXD/U8vaph0EvkRGHIeRHzNmGL0
 rxFwkwscAbTbLzATjdz0HD0GZBZLfDbmb0Jt7s03LR5p/RiQrjHEbrxITpVOvZj8KZ9r
 wB7YZY9/6qtZlGbecocwnaAAcD4rIU1hW2tdB4YSszUpoaFie+ZLIgOTg55UkyiV0y1C
 /KLzotVgOkrA5kzWiW+tTB6p4DSc1AlXl2A6zNHGU+Xux44FsFZk/Q4jhAa6jKzfPjM4
 3RcxUL4cvWgqxL4H5NAtW8uyU3brqEPUo4FWNDNLNDnYlqMUU6Wd8U8rJUSmBcs5nT6t
 F0PA==
X-Gm-Message-State: AO0yUKWysivvx/o18vSNhmG1ZjhRcZovz5L6FXFNSGMMMS2vjZ6S5yeJ
 KNVuDighzG3ITYSDzgyj/Q/YAjJtGXiRtFlAuFo=
X-Google-Smtp-Source: AK7set8eiLMhzuLFcEKASjriX0CYCgbT9SebenCxacdumWjvkyFStq/mrZJtn9siBA4j0+613JZmkCVjxBm2OmgIi88=
X-Received: by 2002:ac2:4e8c:0:b0:4d5:ca42:aee5 with SMTP id
 o12-20020ac24e8c000000b004d5ca42aee5mr215386lfr.5.1676370728890; Tue, 14 Feb
 2023 02:32:08 -0800 (PST)
MIME-Version: 1.0
References: <20230214074238.65865-1-christian.koenig@amd.com>
 <20230214074238.65865-4-christian.koenig@amd.com>
In-Reply-To: <20230214074238.65865-4-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 14 Feb 2023 10:31:41 +0000
Message-ID: <CAM0jSHNv32grp=Q7VdTo6EjQQLUV7Bcqw1+KwuwWjBDHCDYa+g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/ttm: Change the meaning of the fields
 in the drm_mm_nodes structure from pfn to bytes v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, Amaranath.Somalapuram@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Feb 2023 at 07:43, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>
> Change the ttm_range_man_alloc() allocation from pages to size in bytes.
> Fix the dependent drm_mm_nodes start and size from pages to bytes.
>
> v2 (chk): Change the drm_mm_node usage in amdgpu as well. re-order the
>           patch to be independent of the resource->start change.
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c    | 15 ++++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h |  8 ++++----
>  drivers/gpu/drm/i915/i915_scatterlist.c        |  6 +++---
>  drivers/gpu/drm/ttm/ttm_range_manager.c        | 17 ++++++++---------
>  4 files changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_gtt_mgr.c
> index 44367f03316f..c90423cd1292 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -116,7 +116,6 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_man=
ager *man,
>                               struct ttm_resource **res)
>  {
>         struct amdgpu_gtt_mgr *mgr =3D to_gtt_mgr(man);
> -       uint32_t num_pages =3D PFN_UP(tbo->base.size);
>         struct ttm_range_mgr_node *node;
>         int r;
>
> @@ -134,17 +133,19 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_m=
anager *man,
>         if (place->lpfn) {
>                 spin_lock(&mgr->lock);
>                 r =3D drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nod=
es[0],
> -                                               num_pages, tbo->page_alig=
nment,
> -                                               0, place->fpfn, place->lp=
fn,
> +                                               tbo->base.size,
> +                                               tbo->page_alignment << PA=
GE_SHIFT, 0,
> +                                               place->fpfn << PAGE_SHIFT=
,
> +                                               place->lpfn << PAGE_SHIFT=
,
>                                                 DRM_MM_INSERT_BEST);
>                 spin_unlock(&mgr->lock);
>                 if (unlikely(r))
>                         goto err_free;
>
> -               node->base.start =3D node->mm_nodes[0].start;
> +               node->base.start =3D node->mm_nodes[0].start >> PAGE_SHIF=
T;
>         } else {
>                 node->mm_nodes[0].start =3D 0;
> -               node->mm_nodes[0].size =3D PFN_UP(node->base.size);
> +               node->mm_nodes[0].size =3D node->base.size;
>                 node->base.start =3D AMDGPU_BO_INVALID_OFFSET;
>         }
>
> @@ -285,8 +286,8 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, u=
int64_t gtt_size)
>
>         ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
>
> -       start =3D AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_=
WINDOWS;
> -       size =3D (adev->gmc.gart_size >> PAGE_SHIFT) - start;
> +       start =3D (AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER=
_WINDOWS) << PAGE_SHIFT;
> +       size =3D adev->gmc.gart_size - start;
>         drm_mm_init(&mgr->mm, start, size);
>         spin_lock_init(&mgr->lock);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_res_cursor.h
> index 5c4f93ee0c57..5c78f0b09351 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -94,8 +94,8 @@ static inline void amdgpu_res_first(struct ttm_resource=
 *res,
>                 while (start >=3D node->size << PAGE_SHIFT)
>                         start -=3D node++->size << PAGE_SHIFT;
>
> -               cur->start =3D (node->start << PAGE_SHIFT) + start;
> -               cur->size =3D min((node->size << PAGE_SHIFT) - start, siz=
e);
> +               cur->start =3D node->start + start;
> +               cur->size =3D min(node->size - start, size);
>                 cur->remaining =3D size;
>                 cur->node =3D node;
>                 break;
> @@ -155,8 +155,8 @@ static inline void amdgpu_res_next(struct amdgpu_res_=
cursor *cur, uint64_t size)
>                 node =3D cur->node;
>
>                 cur->node =3D ++node;
> -               cur->start =3D node->start << PAGE_SHIFT;
> -               cur->size =3D min(node->size << PAGE_SHIFT, cur->remainin=
g);
> +               cur->start =3D node->start;
> +               cur->size =3D min(node->size, cur->remaining);
>                 break;
>         default:
>                 return;
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i9=
15/i915_scatterlist.c
> index 756289e43dff..7defda1219d0 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.c
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.c
> @@ -94,7 +94,7 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const str=
uct drm_mm_node *node,
>         if (!rsgt)
>                 return ERR_PTR(-ENOMEM);
>
> -       i915_refct_sgt_init(rsgt, node->size << PAGE_SHIFT);
> +       i915_refct_sgt_init(rsgt, node->size);
>         st =3D &rsgt->table;
>         /* restricted by sg_alloc_table */
>         if (WARN_ON(overflows_type(DIV_ROUND_UP_ULL(node->size, segment_p=
ages),
> @@ -110,8 +110,8 @@ struct i915_refct_sgt *i915_rsgt_from_mm_node(const s=
truct drm_mm_node *node,
>         sg =3D st->sgl;
>         st->nents =3D 0;
>         prev_end =3D (resource_size_t)-1;
> -       block_size =3D node->size << PAGE_SHIFT;
> -       offset =3D node->start << PAGE_SHIFT;
> +       block_size =3D node->size;
> +       offset =3D node->start;
>
>         while (block_size) {
>                 u64 len;
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/tt=
m/ttm_range_manager.c
> index 62fddcc59f02..9da6054f2955 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -83,9 +83,10 @@ static int ttm_range_man_alloc(struct ttm_resource_man=
ager *man,
>
>         spin_lock(&rman->lock);
>         ret =3D drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
> -                                         PFN_UP(node->base.size),
> -                                         bo->page_alignment, 0,
> -                                         place->fpfn, lpfn, mode);
> +                                         node->base.size,
> +                                         bo->page_alignment << PAGE_SHIF=
T, 0,
> +                                         place->fpfn << PAGE_SHIFT,

place->fpfn is only u32. I assume we need some (u64) cast or so?

> +                                         lpfn << PAGE_SHIFT, mode);
>         spin_unlock(&rman->lock);
>
>         if (unlikely(ret)) {
> @@ -94,7 +95,7 @@ static int ttm_range_man_alloc(struct ttm_resource_mana=
ger *man,
>                 return ret;
>         }
>
> -       node->base.start =3D node->mm_nodes[0].start;
> +       node->base.start =3D node->mm_nodes[0].start >> PAGE_SHIFT;
>         *res =3D &node->base;
>         return 0;
>  }
> @@ -119,11 +120,10 @@ static bool ttm_range_man_intersects(struct ttm_res=
ource_manager *man,
>                                      size_t size)
>  {
>         struct drm_mm_node *node =3D &to_ttm_range_mgr_node(res)->mm_node=
s[0];
> -       u32 num_pages =3D PFN_UP(size);
>
>         /* Don't evict BOs outside of the requested placement range */
> -       if (place->fpfn >=3D (node->start + num_pages) ||
> -           (place->lpfn && place->lpfn <=3D node->start))
> +       if ((place->fpfn << PAGE_SHIFT) >=3D (node->start + size) ||
> +           (place->lpfn && (place->lpfn << PAGE_SHIFT) <=3D node->start)=
)

Same here.

>                 return false;
>
>         return true;
> @@ -135,10 +135,9 @@ static bool ttm_range_man_compatible(struct ttm_reso=
urce_manager *man,
>                                      size_t size)
>  {
>         struct drm_mm_node *node =3D &to_ttm_range_mgr_node(res)->mm_node=
s[0];
> -       u32 num_pages =3D PFN_UP(size);
>
>         if (node->start < place->fpfn ||
> -           (place->lpfn && (node->start + num_pages) > place->lpfn))
> +           (place->lpfn && (node->start + size) > place->lpfn << PAGE_SH=
IFT))

And here.

>                 return false;
>
>         return true;
> --
> 2.34.1
>
