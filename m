Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E0149FB7A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 15:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8010810F217;
	Fri, 28 Jan 2022 14:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51A210F218;
 Fri, 28 Jan 2022 14:19:05 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id g11so5956614qvu.3;
 Fri, 28 Jan 2022 06:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jUQsg8U803xxQi+7WTLTwoYrIS8iDnNeT3HnG/DG2qA=;
 b=iNS1uUiHKhmU8/FGRakFDTW3wnJxNWhjbXJQ6K322tY1dkUYixW9kKDCpkaHsAE4ep
 LZOsBySNAkY5bU/nxpCk96Sw90ykGoxfCX6apnChjdOgpcujATWJUgKjp+8gx88cTRMj
 2AXj3GW4hl1+JuVkJj0Bi4lOdmESvxs5fLoh1S1TN2Z3cC9qtU9gxx3gtpKTh4nNIL6q
 Vq88uhANaQ3RQFaoD/3G6zA9R7IkD75QGAk4eY1C/iQFogcjMNbfQTTgIxCwayC2F23Y
 86Gkl0IwELv9P0GJE97lQHNq7dQ9Su9iimZ1knz8IBBLp3UIjQ7P6DTy0K5qsJlD+UCv
 DLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jUQsg8U803xxQi+7WTLTwoYrIS8iDnNeT3HnG/DG2qA=;
 b=RayaQpgeh42+FgUGqu4MhCkib3zV4qY2j/39VUuz9u666hqTB2CfU33IHUQvrhxhX5
 owEqyADVHQWh0Bg3ay2obcszFd/+L0DS9q6bApiB35H0kf5K3AcFTOF2mL7ZOIX86ubt
 e5ApE3fcUla7HUQH46PbfzjnQ9IguKs07ierBd/ewn0TQWzSWvs4KL2eysAS+p7gN458
 3A9bAS/o/7exjtyt49iT5Kn/MAgmfGb0F5ShtG/yVc6Qlw44Fs0P8RirQ2Uv1ZHyoKZr
 KpMHK7wKScjXu99wz3NOwQmnp1fuaCXltzR+fUktI2Kki2YSSNczUNLxoIF3Us/JTuoB
 qyPQ==
X-Gm-Message-State: AOAM530bepv4sCd9/K/QKJ8QHjmYN7Wfe4Seg2ZD4NXH5Yk3OZ676qWw
 7Th35PqCJDiQ/z5YOKW9IKc4isT5ZAWul4ywaZg=
X-Google-Smtp-Source: ABdhPJxeDyJn9ocQuxlUu113GEXIY2jLY6fWvpOoL1sRTciC1OZb8mw6N0LL8OkwYJtwT16qL9qPAVQUiieOqMFjT3o=
X-Received: by 2002:a05:6214:2464:: with SMTP id
 im4mr7033703qvb.41.1643379544888; 
 Fri, 28 Jan 2022 06:19:04 -0800 (PST)
MIME-Version: 1.0
References: <20220127141107.173692-1-Arunpravin.PaneerSelvam@amd.com>
 <20220127141107.173692-5-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20220127141107.173692-5-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 28 Jan 2022 14:18:38 +0000
Message-ID: <CAM0jSHOdMDQvWxGyHfW01UAe-x_eefFQSJnzU43=t6qL_Ec77g@mail.gmail.com>
Subject: Re: [PATCH v11 5/5] drm/amdgpu: add drm buddy support to amdgpu
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, tzimmermann@suse.de,
 alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Jan 2022 at 14:11, Arunpravin
<Arunpravin.PaneerSelvam@amd.com> wrote:
>
> - Remove drm_mm references and replace with drm buddy functionalities
> - Add res cursor support for drm buddy
>
> v2(Matthew Auld):
>   - replace spinlock with mutex as we call kmem_cache_zalloc
>     (..., GFP_KERNEL) in drm_buddy_alloc() function
>
>   - lock drm_buddy_block_trim() function as it calls
>     mark_free/mark_split are all globally visible
>
> v3(Matthew Auld):
>   - remove trim method error handling as we address the failure case
>     at drm_buddy_block_trim() function
>
> v4:
>   - fix warnings reported by kernel test robot <lkp@intel.com>
>
> v5:
>   - fix merge conflict issue
>
> v6:
>   - fix warnings reported by kernel test robot <lkp@intel.com>
>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>  drivers/gpu/drm/Kconfig                       |   1 +
>  .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  97 +++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |   7 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 259 ++++++++++--------
>  4 files changed, 231 insertions(+), 133 deletions(-)

<snip>

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
> -{
> -       unsigned long start;
> -
> -       start = node->start + node->size;
> -       if (start > mem->num_pages)
> -               start -= mem->num_pages;
> -       else
> -               start = 0;
> -       mem->start = max(mem->start, start);
> -}
> -
>  /**
>   * amdgpu_vram_mgr_new - allocate new ranges
>   *
> @@ -366,13 +357,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>                                const struct ttm_place *place,
>                                struct ttm_resource **res)
>  {
> -       unsigned long lpfn, num_nodes, pages_per_node, pages_left, pages;
> +       unsigned long lpfn, pages_per_node, pages_left, pages, n_pages;
> +       u64 vis_usage = 0, mem_bytes, max_bytes, min_page_size;
>         struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>         struct amdgpu_device *adev = to_amdgpu_device(mgr);
> -       uint64_t vis_usage = 0, mem_bytes, max_bytes;
> -       struct ttm_range_mgr_node *node;
> -       struct drm_mm *mm = &mgr->mm;
> -       enum drm_mm_insert_mode mode;
> +       struct amdgpu_vram_mgr_node *node;
> +       struct drm_buddy *mm = &mgr->mm;
> +       struct drm_buddy_block *block;
>         unsigned i;
>         int r;
>
> @@ -391,10 +382,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
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
> @@ -403,11 +393,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>  #endif
>                 pages_per_node = max_t(uint32_t, pages_per_node,
>                                        tbo->page_alignment);
> -               num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
>         }
>
> -       node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
> -                       GFP_KERNEL | __GFP_ZERO);
> +       node = kzalloc(sizeof(*node), GFP_KERNEL);
>         if (!node) {
>                 r = -ENOMEM;
>                 goto error_sub;
> @@ -415,9 +403,17 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>
>         ttm_resource_init(tbo, place, &node->base);
>
> -       mode = DRM_MM_INSERT_BEST;
> +       INIT_LIST_HEAD(&node->blocks);
> +
>         if (place->flags & TTM_PL_FLAG_TOPDOWN)
> -               mode = DRM_MM_INSERT_HIGH;
> +               node->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
> +
> +       if (place->fpfn || lpfn != man->size)
> +               /* Allocate blocks in desired range */
> +               node->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> +
> +       min_page_size = mgr->default_page_size;
> +       BUG_ON(min_page_size < mm->chunk_size);
>
>         pages_left = node->base.num_pages;
>
> @@ -425,36 +421,61 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>         pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
>
>         i = 0;
> -       spin_lock(&mgr->lock);
>         while (pages_left) {
> -               uint32_t alignment = tbo->page_alignment;
> -
>                 if (pages >= pages_per_node)
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
> +                       pages = pages_per_node;
> +
> +               n_pages = pages;
> +
> +               if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +                       n_pages = roundup_pow_of_two(n_pages);
> +                       min_page_size = (u64)n_pages << PAGE_SHIFT;
> +
> +                       if (n_pages > lpfn)
> +                               lpfn = n_pages;
>                 }
>
> -               vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
> -               amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
> +               mutex_lock(&mgr->lock);
> +               r = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
> +                                          (u64)lpfn << PAGE_SHIFT,
> +                                          (u64)n_pages << PAGE_SHIFT,
> +                                          min_page_size,
> +                                          &node->blocks,
> +                                          node->flags);
> +               mutex_unlock(&mgr->lock);
> +               if (unlikely(r))
> +                       goto error_free_blocks;
> +
>                 pages_left -= pages;
>                 ++i;
>
>                 if (pages > pages_left)
>                         pages = pages_left;
>         }
> -       spin_unlock(&mgr->lock);
> +
> +       /* Free unused pages for contiguous allocation */
> +       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +               u64 actual_size = (u64)node->base.num_pages << PAGE_SHIFT;
> +
> +               mutex_lock(&mgr->lock);
> +               drm_buddy_block_trim(mm,
> +                                    actual_size,
> +                                    &node->blocks);
> +               mutex_unlock(&mgr->lock);
> +       }
> +
> +       list_for_each_entry(block, &node->blocks, link)
> +               vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
> +
> +       block = list_first_entry_or_null(&node->blocks,
> +                                        struct drm_buddy_block,
> +                                        link);
> +       if (!block) {
> +               r = -ENOENT;
> +               goto error_free_res;
> +       }
> +
> +       node->base.start = amdgpu_node_start(block) >> PAGE_SHIFT;

Hmm, does this work? It looks like there are various places checking
that res->start + res->num_pages <= visible_size, which IIUC should
only return true when the entire object is placed in the mappable
portion. i915 is doing something similar. Also it looks like
ttm_resource_compat() is potentially relying on this, like when moving
something from non-mappable -> mappable in
amdgpu_bo_fault_reserve_notify()?

Perhaps something like:

if (vis_usage == num_pages)
    base.start = 0;
else
    base.start = visible_size;

Otherwise I guess just keep amdgpu_vram_mgr_virt_start()?
