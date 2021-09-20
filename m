Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D85A4126EC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 21:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23146E84F;
	Mon, 20 Sep 2021 19:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F1D6E84C;
 Mon, 20 Sep 2021 19:30:58 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 y47-20020a4a9832000000b00290fb9f6d3fso6263102ooi.3; 
 Mon, 20 Sep 2021 12:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kOFn2wDmNuaJnEzLu2PjFxOMbmsAzF8fRg5mxGahWu0=;
 b=lXagVFajWuKAcMlYwQl6CXHKp4auJmtoctSVW9OCcGxxYhUAvpzF1P4vTbrXqBapUA
 6fu6AHgIDRM82x5V18GQkvqqDUZLRMDjbkVfzkLJuqzp2geE/Y9gaZJrQG8R05wSRKJ7
 cMq7X18r02JgZ/Pv8lf5DPOQNUvBl3qwGtebSM0jJzwAxfROYGoJQAfonGhQMbKFPPWR
 YdkNs9RRVhuk5TPGcb35EpAGslvcWBJotsyAsfH0qP+QRl1PepS+arjGbHL67+Ma2d3G
 Vf5GUdP3SMMQgfRJXNy/+Gm3A3CqDJPPlFwhqcuv+UPqVfSFyls2e0BYwHEohP3kgbZl
 jvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kOFn2wDmNuaJnEzLu2PjFxOMbmsAzF8fRg5mxGahWu0=;
 b=BQcJRlkycIl8T7sqRiMcqC+l0S/LWVhueeQbjAzhFUaluNSpj5RPrdsJWPmfpULU5v
 XSuKuVXQtKj1zeXa7RXgcQ9Pyzi9WknmDXhN2F0T0FKP+84qx0DSxlHeRfNJDZFnmztJ
 ru4dqpeo8jjoVPNupCzF6Tmt6w6+s125tVvWm2BVQ/MANM+9jqjeSN1KXrAQEAyWz0/G
 z0C+WJ9DpUSWzGfHcTQSeoS7YoMbpyMQ97iLHJy1JanvzlCRD7PXbVVt83wVp9jJHMqT
 Pg04ayelswJRKMYklIFy7UjpIraH7X/NsDn+qe35o+XvUxH/QL11lqi7ssAeljDlGcTE
 oqKw==
X-Gm-Message-State: AOAM532dXzjhxeiDDP7K4QMxw5A/ajMScNsK5H0xsQgxbyTj0eaioQSS
 S2J5SlSqoVhRcUGVwlcJRiYFKDLAhKhiMYeeTmg=
X-Google-Smtp-Source: ABdhPJwOgoMaQNBTYbhQ7WgPDtGLCZSPTTzEhQdFtun6+3ZnuXqttTVyoTMWWyH1ql/rji4z7AWBswHVhDAkJPtVStY=
X-Received: by 2002:a4a:d794:: with SMTP id c20mr20930424oou.23.1632166257809; 
 Mon, 20 Sep 2021 12:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210920192110.221153-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20210920192110.221153-1-Arunpravin.PaneerSelvam@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Sep 2021 15:30:46 -0400
Message-ID: <CADnq5_NshcMm2ZztfNJn0BcNHxUfs-tBpTCpocpZA3xj0v+CSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add drm buddy manager support to amdgpu driver
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Sep 20, 2021 at 3:21 PM Arunpravin
<Arunpravin.PaneerSelvam@amd.com> wrote:
>
> Replace drm_mm with drm buddy manager for
> VRAM memory management

Would be good to document why we are doing this and what advantages it
brings over the old drm_mm code.

Alex


>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>  .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  78 +++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |   3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 216 ++++++++++--------
>  3 files changed, 189 insertions(+), 108 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> index acfa207cf970..ba24052e9062 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -30,12 +30,25 @@
>  #include <drm/ttm/ttm_resource.h>
>  #include <drm/ttm/ttm_range_manager.h>
>
> +struct amdgpu_vram_mgr_node {
> +       struct ttm_range_mgr_node tnode;
> +       struct list_head blocks;
> +};
> +
> +static inline struct amdgpu_vram_mgr_node *
> +to_amdgpu_vram_mgr_node(struct ttm_resource *res)
> +{
> +       return container_of(container_of(res, struct ttm_range_mgr_node, base),
> +                       struct amdgpu_vram_mgr_node, tnode);
> +}
> +
>  /* state back for walking over vram_mgr and gtt_mgr allocations */
>  struct amdgpu_res_cursor {
>         uint64_t                start;
>         uint64_t                size;
>         uint64_t                remaining;
> -       struct drm_mm_node      *node;
> +       void                    *node;
> +       uint32_t                mem_type;
>  };
>
>  /**
> @@ -52,8 +65,6 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>                                     uint64_t start, uint64_t size,
>                                     struct amdgpu_res_cursor *cur)
>  {
> -       struct drm_mm_node *node;
> -
>         if (!res || res->mem_type == TTM_PL_SYSTEM) {
>                 cur->start = start;
>                 cur->size = size;
> @@ -65,14 +76,39 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>
>         BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
>
> -       node = to_ttm_range_mgr_node(res)->mm_nodes;
> -       while (start >= node->size << PAGE_SHIFT)
> -               start -= node++->size << PAGE_SHIFT;
> +       cur->mem_type = res->mem_type;
> +
> +       if (cur->mem_type == TTM_PL_VRAM) {
> +               struct drm_buddy_block *block;
> +               struct list_head *head, *next;
> +
> +               head = &to_amdgpu_vram_mgr_node(res)->blocks;
> +
> +               block = list_first_entry_or_null(head, struct drm_buddy_block, link);
> +               while (start >= block->size << PAGE_SHIFT) {
> +                       start -= block->size << PAGE_SHIFT;
> +
> +                       next = block->link.next;
> +                       if (next != head)
> +                               block = list_entry(next, struct drm_buddy_block, link);
> +               }
>
> -       cur->start = (node->start << PAGE_SHIFT) + start;
> -       cur->size = min((node->size << PAGE_SHIFT) - start, size);
> -       cur->remaining = size;
> -       cur->node = node;
> +               cur->start = (block->start << PAGE_SHIFT) + start;
> +               cur->size = min((block->size << PAGE_SHIFT) - start, size);
> +               cur->remaining = size;
> +               cur->node = block;
> +       } else if (cur->mem_type == TTM_PL_TT) {
> +               struct drm_mm_node *node;
> +
> +               node = to_ttm_range_mgr_node(res)->mm_nodes;
> +               while (start >= node->size << PAGE_SHIFT)
> +                       start -= node++->size << PAGE_SHIFT;
> +
> +               cur->start = (node->start << PAGE_SHIFT) + start;
> +               cur->size = min((node->size << PAGE_SHIFT) - start, size);
> +               cur->remaining = size;
> +               cur->node = node;
> +       }
>  }
>
>  /**
> @@ -85,8 +121,6 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>   */
>  static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>  {
> -       struct drm_mm_node *node = cur->node;
> -
>         BUG_ON(size > cur->remaining);
>
>         cur->remaining -= size;
> @@ -99,9 +133,23 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>                 return;
>         }
>
> -       cur->node = ++node;
> -       cur->start = node->start << PAGE_SHIFT;
> -       cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
> +       if (cur->mem_type == TTM_PL_VRAM) {
> +               struct drm_buddy_block *block = cur->node;
> +               struct list_head *next;
> +
> +               next = block->link.next;
> +               block = list_entry(next, struct drm_buddy_block, link);
> +
> +               cur->node = block;
> +               cur->start = block->start << PAGE_SHIFT;
> +               cur->size = min(block->size << PAGE_SHIFT, cur->remaining);
> +       } else if (cur->mem_type == TTM_PL_TT) {
> +               struct drm_mm_node *node = cur->node;
> +
> +               cur->node = ++node;
> +               cur->start = node->start << PAGE_SHIFT;
> +               cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
> +       }
>  }
>
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index e69f3e8e06e5..96c8e8aaa0ee 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -26,6 +26,7 @@
>
>  #include <linux/dma-direction.h>
>  #include <drm/gpu_scheduler.h>
> +#include <drm/drm_buddy.h>
>  #include "amdgpu.h"
>
>  #define AMDGPU_PL_GDS          (TTM_PL_PRIV + 0)
> @@ -40,7 +41,7 @@
>
>  struct amdgpu_vram_mgr {
>         struct ttm_resource_manager manager;
> -       struct drm_mm mm;
> +       struct drm_buddy_mm mm;
>         spinlock_t lock;
>         struct list_head reservations_pending;
>         struct list_head reserved_pages;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 7b2b0980ec41..de0c5f4cabaf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -23,7 +23,9 @@
>   */
>
>  #include <linux/dma-mapping.h>
> +#include <linux/list_sort.h>
>  #include <drm/ttm/ttm_range_manager.h>
> +#include <drm/drm_buddy.h>
>
>  #include "amdgpu.h"
>  #include "amdgpu_vm.h"
> @@ -33,7 +35,7 @@
>
>  struct amdgpu_vram_reservation {
>         struct list_head node;
> -       struct drm_mm_node mm_node;
> +       struct drm_buddy_block mm_node;
>  };
>
>  static inline struct amdgpu_vram_mgr *
> @@ -196,10 +198,10 @@ const struct attribute_group amdgpu_vram_mgr_attr_group = {
>   * Calculate how many bytes of the MM node are inside visible VRAM
>   */
>  static u64 amdgpu_vram_mgr_vis_size(struct amdgpu_device *adev,
> -                                   struct drm_mm_node *node)
> +                                   struct drm_buddy_block *block)
>  {
> -       uint64_t start = node->start << PAGE_SHIFT;
> -       uint64_t end = (node->size + node->start) << PAGE_SHIFT;
> +       uint64_t start = block->start << PAGE_SHIFT;
> +       uint64_t end = (block->size + block->start) << PAGE_SHIFT;
>
>         if (start >= adev->gmc.visible_vram_size)
>                 return 0;
> @@ -220,8 +222,8 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
>  {
>         struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>         struct ttm_resource *res = bo->tbo.resource;
> -       unsigned pages = res->num_pages;
> -       struct drm_mm_node *mm;
> +       struct amdgpu_vram_mgr_node *vnode = to_amdgpu_vram_mgr_node(res);
> +       struct drm_buddy_block *block;
>         u64 usage;
>
>         if (amdgpu_gmc_vram_full_visible(&adev->gmc))
> @@ -230,9 +232,8 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
>         if (res->start >= adev->gmc.visible_vram_size >> PAGE_SHIFT)
>                 return 0;
>
> -       mm = &container_of(res, struct ttm_range_mgr_node, base)->mm_nodes[0];
> -       for (usage = 0; pages; pages -= mm->size, mm++)
> -               usage += amdgpu_vram_mgr_vis_size(adev, mm);
> +       list_for_each_entry(block, &vnode->blocks, link)
> +               usage += amdgpu_vram_mgr_vis_size(adev, block);
>
>         return usage;
>  }
> @@ -242,12 +243,15 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
>  {
>         struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>         struct amdgpu_device *adev = to_amdgpu_device(mgr);
> -       struct drm_mm *mm = &mgr->mm;
> +       struct drm_buddy_mm *mm = &mgr->mm;
>         struct amdgpu_vram_reservation *rsv, *temp;
>         uint64_t vis_usage;
> +       int r = 0;
>
>         list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node) {
> -               if (drm_mm_reserve_node(mm, &rsv->mm_node))
> +               r = drm_buddy_alloc_range(mm, &rsv->node, rsv->mm_node.start, rsv->mm_node.size);
> +
> +               if (unlikely(r))
>                         continue;
>
>                 dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Succeeded\n",
> @@ -333,26 +337,16 @@ int amdgpu_vram_mgr_query_page_status(struct ttm_resource_manager *man,
>         return ret;
>  }
>
> -/**
> - * amdgpu_vram_mgr_virt_start - update virtual start address
> - *
> - * @mem: ttm_resource to update
> - * @node: just allocated node
> - *
> - * Calculate a virtual BO start address to easily check if everything is CPU
> - * accessible.
> - */
> -static void amdgpu_vram_mgr_virt_start(struct ttm_resource *mem,
> -                                      struct drm_mm_node *node)
> +static int sort_blocks(void *priv, const struct list_head *A,
> +                                       const struct list_head *B)
>  {
> -       unsigned long start;
> +       struct drm_buddy_block *a = list_entry(A, typeof(*a), link);
> +       struct drm_buddy_block *b = list_entry(B, typeof(*b), link);
>
> -       start = node->start + node->size;
> -       if (start > mem->num_pages)
> -               start -= mem->num_pages;
> +       if (a->start < b->start)
> +               return -1;
>         else
> -               start = 0;
> -       mem->start = max(mem->start, start);
> +               return 1;
>  }
>
>  /**
> @@ -370,15 +364,20 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>                                const struct ttm_place *place,
>                                struct ttm_resource **res)
>  {
> -       unsigned long lpfn, num_nodes, pages_per_node, pages_left, pages;
> +       unsigned long lpfn, pages_per_node, pages_left, pages;
>         struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>         struct amdgpu_device *adev = to_amdgpu_device(mgr);
>         uint64_t vis_usage = 0, mem_bytes, max_bytes;
> +       struct amdgpu_vram_mgr_node *vnode;
> +       struct drm_buddy_mm *mm = &mgr->mm;
>         struct ttm_range_mgr_node *node;
> -       struct drm_mm *mm = &mgr->mm;
> -       enum drm_mm_insert_mode mode;
> +       enum drm_buddy_alloc_mode mode;
> +       struct drm_buddy_block *block;
> +       unsigned int visible_pfn;
> +       bool bar_limit_enabled;
> +       unsigned long n_pages;
>         unsigned i;
> -       int r;
> +       int r = 0;
>
>         lpfn = place->lpfn;
>         if (!lpfn)
> @@ -395,10 +394,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>                 goto error_sub;
>         }
>
> -       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +       if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>                 pages_per_node = ~0ul;
> -               num_nodes = 1;
> -       } else {
> +       else {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>                 pages_per_node = HPAGE_PMD_NR;
>  #else
> @@ -407,57 +405,97 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>  #endif
>                 pages_per_node = max_t(uint32_t, pages_per_node,
>                                        tbo->page_alignment);
> -               num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
>         }
>
> -       node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
> -                       GFP_KERNEL | __GFP_ZERO);
> -       if (!node) {
> +       vnode = kzalloc(sizeof(*vnode), GFP_KERNEL);
> +
> +       if (!vnode) {
>                 r = -ENOMEM;
>                 goto error_sub;
>         }
>
> +       node = &vnode->tnode;
> +
>         ttm_resource_init(tbo, place, &node->base);
>
> -       mode = DRM_MM_INSERT_BEST;
> -       if (place->flags & TTM_PL_FLAG_TOPDOWN)
> -               mode = DRM_MM_INSERT_HIGH;
> +       bar_limit_enabled = !(amdgpu_gmc_vram_full_visible(&adev->gmc));
> +
> +       visible_pfn = adev->gmc.visible_vram_size >> PAGE_SHIFT;
> +
> +       mode = DRM_BUDDY_BOTTOM_UP;
> +       if (!place->fpfn && lpfn == man->size &&
> +                                       (place->flags & TTM_PL_FLAG_TOPDOWN))
> +               /* Allocate blocks from CPU non-mappable (TOP-DOWN) region */
> +               mode = DRM_BUDDY_TOP_DOWN;
> +       else if (place->fpfn || (lpfn != man->size && lpfn != visible_pfn))
> +               /* Allocate blocks in desired range */
> +               mode = DRM_BUDDY_ALLOC_RANGE;
>
>         pages_left = node->base.num_pages;
>
>         /* Limit maximum size to 2GB due to SG table limitations */
>         pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
>
> +       INIT_LIST_HEAD(&vnode->blocks);
> +
>         i = 0;
> -       spin_lock(&mgr->lock);
> -       while (pages_left) {
> -               uint32_t alignment = tbo->page_alignment;
> -
> -               if (pages >= pages_per_node)
> -                       alignment = pages_per_node;
> -
> -               r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
> -                                               alignment, 0, place->fpfn,
> -                                               lpfn, mode);
> -               if (unlikely(r)) {
> -                       if (pages > pages_per_node) {
> -                               if (is_power_of_2(pages))
> -                                       pages = pages / 2;
> -                               else
> -                                       pages = rounddown_pow_of_two(pages);
> -                               continue;
> -                       }
> -                       goto error_free;
> -               }
> +       if (mode == DRM_BUDDY_ALLOC_RANGE) {
> +               r = drm_buddy_alloc_range(mm, &vnode->blocks,
> +                               (uint64_t)place->fpfn << PAGE_SHIFT, pages << PAGE_SHIFT);
> +
> +               if (unlikely(r))
> +                       goto error_free_res;
> +       } else {
> +               while (pages_left) {
> +                       if (pages >= pages_per_node)
> +                               pages = pages_per_node;
> +
> +                       n_pages = pages;
> +
> +                       if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
> +                               n_pages = roundup_pow_of_two(n_pages);
> +
> +                       do {
> +                               unsigned int order;
> +
> +                               order = fls(n_pages) - 1;
> +                               BUG_ON(order > mm->max_order);
> +
> +                               spin_lock(&mgr->lock);
> +                               block = drm_buddy_alloc(mm, order, bar_limit_enabled,
> +                                                                       visible_pfn, mode);
> +                               spin_unlock(&mgr->lock);
>
> -               vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
> -               amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
> -               pages_left -= pages;
> -               ++i;
> +                               if (IS_ERR(block)) {
> +                                       r = -ENOSPC;
> +                                       goto error_free_blocks;
> +                               }
>
> -               if (pages > pages_left)
> -                       pages = pages_left;
> +                               n_pages -= BIT(order);
> +
> +                               list_add_tail(&block->link, &vnode->blocks);
> +
> +                               if (!n_pages)
> +                                       break;
> +                       } while (1);
> +
> +                       pages_left -= pages;
> +                       ++i;
> +
> +                       if (pages > pages_left)
> +                               pages = pages_left;
> +               }
>         }
> +
> +       spin_lock(&mgr->lock);
> +       list_sort(NULL, &vnode->blocks, sort_blocks);
> +
> +       list_for_each_entry(block, &vnode->blocks, link)
> +               vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
> +
> +       block = list_first_entry_or_null(&vnode->blocks,
> +                       struct drm_buddy_block, link);
> +       node->base.start = block->start;
>         spin_unlock(&mgr->lock);
>
>         if (i == 1)
> @@ -472,12 +510,12 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>         *res = &node->base;
>         return 0;
>
> -error_free:
> -       while (i--)
> -               drm_mm_remove_node(&node->mm_nodes[i]);
> +error_free_blocks:
> +       spin_lock(&mgr->lock);
> +       drm_buddy_free_list(mm, &vnode->blocks);
>         spin_unlock(&mgr->lock);
> -       kvfree(node);
> -
> +error_free_res:
> +       kfree(vnode);
>  error_sub:
>         atomic64_sub(mem_bytes, &mgr->usage);
>         return r;
> @@ -494,28 +532,28 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>  static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>                                 struct ttm_resource *res)
>  {
> -       struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
> +       struct amdgpu_vram_mgr_node *vnode = to_amdgpu_vram_mgr_node(res);
>         struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>         struct amdgpu_device *adev = to_amdgpu_device(mgr);
> +       struct drm_buddy_mm *mm = &mgr->mm;
> +       struct drm_buddy_block *block;
>         uint64_t usage = 0, vis_usage = 0;
> -       unsigned i, pages;
>
>         spin_lock(&mgr->lock);
> -       for (i = 0, pages = res->num_pages; pages;
> -            pages -= node->mm_nodes[i].size, ++i) {
> -               struct drm_mm_node *mm = &node->mm_nodes[i];
> -
> -               drm_mm_remove_node(mm);
> -               usage += mm->size << PAGE_SHIFT;
> -               vis_usage += amdgpu_vram_mgr_vis_size(adev, mm);
> +       list_for_each_entry(block, &vnode->blocks, link) {
> +               usage += block->size << PAGE_SHIFT;
> +               vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
>         }
> +
>         amdgpu_vram_mgr_do_reserve(man);
> +
> +       drm_buddy_free_list(mm, &vnode->blocks);
>         spin_unlock(&mgr->lock);
>
>         atomic64_sub(usage, &mgr->usage);
>         atomic64_sub(vis_usage, &mgr->vis_usage);
>
> -       kvfree(node);
> +       kfree(vnode);
>  }
>
>  /**
> @@ -668,12 +706,6 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct ttm_resource_manager *man)
>  static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
>                                   struct drm_printer *printer)
>  {
> -       struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
> -
> -       spin_lock(&mgr->lock);
> -       drm_mm_print(&mgr->mm, printer);
> -       spin_unlock(&mgr->lock);
> -
>         drm_printf(printer, "man size:%llu pages, ram usage:%lluMB, vis usage:%lluMB\n",
>                    man->size, amdgpu_vram_mgr_usage(man) >> 20,
>                    amdgpu_vram_mgr_vis_usage(man) >> 20);
> @@ -701,7 +733,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>
>         man->func = &amdgpu_vram_mgr_func;
>
> -       drm_mm_init(&mgr->mm, 0, man->size);
> +       drm_buddy_init(&mgr->mm, man->size << PAGE_SHIFT, PAGE_SIZE);
>         spin_lock_init(&mgr->lock);
>         INIT_LIST_HEAD(&mgr->reservations_pending);
>         INIT_LIST_HEAD(&mgr->reserved_pages);
> @@ -737,10 +769,10 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
>                 kfree(rsv);
>
>         list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, node) {
> -               drm_mm_remove_node(&rsv->mm_node);
> +               drm_buddy_free(&mgr->mm, &rsv->mm_node);
>                 kfree(rsv);
>         }
> -       drm_mm_takedown(&mgr->mm);
> +       drm_buddy_fini(&mgr->mm);
>         spin_unlock(&mgr->lock);
>
>         ttm_resource_manager_cleanup(man);
> --
> 2.25.1
>
