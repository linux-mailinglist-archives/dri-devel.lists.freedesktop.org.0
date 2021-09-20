Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A704126D5
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 21:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E543E6E83E;
	Mon, 20 Sep 2021 19:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7296E83A;
 Mon, 20 Sep 2021 19:24:19 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id y201so11500364oie.3;
 Mon, 20 Sep 2021 12:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8VQWXazgnx4l5Gn1N59IZ0kuogl5HA+pJlzQ83m5GU8=;
 b=MVbyNQtPdR5MOM2R+o+OqzkoLyJ87UDX24Vn+Fq2Rkfv9pcljG9plxgIG1Fk1UhFxe
 PRTzKJZhGntEn9qjHhUwt3p1tWpO/0KeHO/On3e2wHiWrhA/mFDH84ttUeGVpEzR0Ocl
 YY00oQSgz0ddf1U/IUu8psDliX2xVrImKdIXOKzSagUCT3GgK0RSO3QQejsH+K9LbV0R
 opAUFzRT+KgGfQqkBy1gidjRFjh/cYgA5SDyme3QHBmtvjnViOpC7JxRMiAQJECkS5aL
 EfYDT2/G3Ie2hqYlrsQT3vCM1ty4M5vOJhkvNhCW+BORE14B2eVq4CyoZNlW5UVTUrx6
 MR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8VQWXazgnx4l5Gn1N59IZ0kuogl5HA+pJlzQ83m5GU8=;
 b=uHhjUBBmMkGdC+92kFmF0gl1vARbOINNJolTDovg0V0EPPX8OYMT0UE2cl4Kgb13k2
 SHniCS/g06oIeqtutujh+u79Iplzl4Rc+9KWW9ESqMEbunRAA35WM/M+KuzanN5t900s
 8+EngJl1L3ZJj3SgLzEz6oNMVcUCxoh4mcatEI5n0rGS9Tvl9UhojHitAZzaWQHOnijq
 9glQiv3NNgAA0WnusYyg9wTt/FULVwYFlePdFtzd8mb6/523ORwNY8/AGre3ScXZrIrM
 XXf9rTfeF1xd+HUOFK5lC4QMXXOwIXAc/50AiUo0N4LQKVXTJjQj8oSKf3COIxi8ma2d
 oFlg==
X-Gm-Message-State: AOAM533m4pRXOdX/UHkzWKwAgYLWhDrwlzHdpMHViSHOK9YESnAE9H64
 gNcqp3PwY24z21sixW0N4vN1uyHyBKHu1cq9eLU=
X-Google-Smtp-Source: ABdhPJwZ7wpnpORs2p5lAkyoBhZm7EkaCga400UlmEcHwbWS5eAaN0ZGxYV4G8tDSQ0JJCSsX7TkIzmv2QNmpoamv0A=
X-Received: by 2002:a05:6808:1310:: with SMTP id
 y16mr530012oiv.123.1632165859129; 
 Mon, 20 Sep 2021 12:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210920192011.221102-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20210920192011.221102-1-Arunpravin.PaneerSelvam@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Sep 2021 15:24:07 -0400
Message-ID: <CADnq5_O6xXp_JZYjpvsCoPUZMv4AFJ4L_Ocka_A6iUt-kZ2bog@mail.gmail.com>
Subject: Re: [PATCH 1/2] Enable buddy memory manager support
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>
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

On Mon, Sep 20, 2021 at 3:21 PM Arunpravin
<Arunpravin.PaneerSelvam@amd.com> wrote:

Please prefix the patch subject with drm.  E.g.,
drm: Enable buddy memory manager support

Same for the second patch, but make it drm/amdgpu instead.

Alex

>
> Port Intel buddy system manager to drm root folder
> Add CPU mappable/non-mappable region support to the drm buddy manager
>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>  drivers/gpu/drm/Makefile    |   2 +-
>  drivers/gpu/drm/drm_buddy.c | 465 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_buddy.h     | 154 ++++++++++++
>  3 files changed, 620 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/drm_buddy.c
>  create mode 100644 include/drm/drm_buddy.h
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index a118692a6df7..fe1a2fc09675 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -18,7 +18,7 @@ drm-y       :=3D        drm_aperture.o drm_auth.o drm_c=
ache.o \
>                 drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
>                 drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
>                 drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
> -               drm_managed.o drm_vblank_work.o
> +               drm_managed.o drm_vblank_work.o drm_buddy.o
>
>  drm-$(CONFIG_DRM_LEGACY) +=3D drm_agpsupport.o drm_bufs.o drm_context.o =
drm_dma.o \
>                             drm_legacy_misc.o drm_lock.o drm_memory.o drm=
_scatter.o \
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> new file mode 100644
> index 000000000000..f07919a004b6
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -0,0 +1,465 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =EF=BF=BD 2021 Intel Corporation
> + */
> +
> +#include <linux/kmemleak.h>
> +#include <drm/drm_buddy.h>
> +
> +static struct drm_buddy_block *drm_block_alloc(struct drm_buddy_mm *mm,
> +                       struct drm_buddy_block *parent, unsigned int orde=
r,
> +                       u64 offset)
> +{
> +       struct drm_buddy_block *block;
> +
> +       BUG_ON(order > DRM_BUDDY_MAX_ORDER);
> +
> +       block =3D kmem_cache_zalloc(mm->slab_blocks, GFP_KERNEL);
> +       if (!block)
> +               return NULL;
> +
> +       block->header =3D offset;
> +       block->header |=3D order;
> +       block->parent =3D parent;
> +       block->start =3D offset >> PAGE_SHIFT;
> +       block->size =3D (mm->chunk_size << order) >> PAGE_SHIFT;
> +
> +       BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
> +       return block;
> +}
> +
> +static void drm_block_free(struct drm_buddy_mm *mm, struct drm_buddy_blo=
ck *block)
> +{
> +       kmem_cache_free(mm->slab_blocks, block);
> +}
> +
> +static void add_ordered(struct drm_buddy_mm *mm, struct drm_buddy_block =
*block)
> +{
> +       struct drm_buddy_block *node;
> +
> +       if (list_empty(&mm->free_list[drm_buddy_block_order(block)])) {
> +               list_add(&block->link,
> +                               &mm->free_list[drm_buddy_block_order(bloc=
k)]);
> +               return;
> +       }
> +
> +       list_for_each_entry(node, &mm->free_list[drm_buddy_block_order(bl=
ock)], link)
> +               if (block->start > node->start)
> +                       break;
> +
> +       __list_add(&block->link, node->link.prev, &node->link);
> +}
> +
> +static void mark_allocated(struct drm_buddy_block *block)
> +{
> +       block->header &=3D ~DRM_BUDDY_HEADER_STATE;
> +       block->header |=3D DRM_BUDDY_ALLOCATED;
> +
> +       list_del(&block->link);
> +}
> +
> +static void mark_free(struct drm_buddy_mm *mm,
> +                     struct drm_buddy_block *block)
> +{
> +       block->header &=3D ~DRM_BUDDY_HEADER_STATE;
> +       block->header |=3D DRM_BUDDY_FREE;
> +
> +       add_ordered(mm, block);
> +}
> +
> +static void mark_split(struct drm_buddy_block *block)
> +{
> +       block->header &=3D ~DRM_BUDDY_HEADER_STATE;
> +       block->header |=3D DRM_BUDDY_SPLIT;
> +
> +       list_del(&block->link);
> +}
> +
> +int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size)
> +{
> +       unsigned int i;
> +       u64 offset;
> +
> +       if (size < chunk_size)
> +               return -EINVAL;
> +
> +       if (chunk_size < PAGE_SIZE)
> +               return -EINVAL;
> +
> +       if (!is_power_of_2(chunk_size))
> +               return -EINVAL;
> +
> +       size =3D round_down(size, chunk_size);
> +
> +       mm->size =3D size;
> +       mm->chunk_size =3D chunk_size;
> +       mm->max_order =3D ilog2(size) - ilog2(chunk_size);
> +
> +       BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
> +
> +       mm->slab_blocks =3D KMEM_CACHE(drm_buddy_block, SLAB_HWCACHE_ALIG=
N);
> +
> +       if (!mm->slab_blocks)
> +               return -ENOMEM;
> +
> +       mm->free_list =3D kmalloc_array(mm->max_order + 1,
> +                                     sizeof(struct list_head),
> +                                     GFP_KERNEL);
> +       if (!mm->free_list)
> +               goto out_destroy_slab;
> +
> +       for (i =3D 0; i <=3D mm->max_order; ++i)
> +               INIT_LIST_HEAD(&mm->free_list[i]);
> +
> +       mm->n_roots =3D hweight64(size);
> +
> +       mm->roots =3D kmalloc_array(mm->n_roots,
> +                                 sizeof(struct drm_buddy_block *),
> +                                 GFP_KERNEL);
> +       if (!mm->roots)
> +               goto out_free_list;
> +
> +       offset =3D 0;
> +       i =3D 0;
> +
> +       /*
> +        * Split into power-of-two blocks, in case we are given a size th=
at is
> +        * not itself a power-of-two.
> +        */
> +       do {
> +               struct drm_buddy_block *root;
> +               unsigned int order;
> +               u64 root_size;
> +
> +               root_size =3D rounddown_pow_of_two(size);
> +               order =3D ilog2(root_size) - ilog2(chunk_size);
> +
> +               root =3D drm_block_alloc(mm, NULL, order, offset);
> +               if (!root)
> +                       goto out_free_roots;
> +
> +               mark_free(mm, root);
> +
> +               BUG_ON(i > mm->max_order);
> +               BUG_ON(drm_buddy_block_size(mm, root) < chunk_size);
> +
> +               mm->roots[i] =3D root;
> +
> +               offset +=3D root_size;
> +               size -=3D root_size;
> +               i++;
> +       } while (size);
> +
> +       return 0;
> +
> +out_free_roots:
> +       while (i--)
> +               drm_block_free(mm, mm->roots[i]);
> +       kfree(mm->roots);
> +out_free_list:
> +       kfree(mm->free_list);
> +out_destroy_slab:
> +       kmem_cache_destroy(mm->slab_blocks);
> +       return -ENOMEM;
> +}
> +EXPORT_SYMBOL(drm_buddy_init);
> +
> +void drm_buddy_fini(struct drm_buddy_mm *mm)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < mm->n_roots; ++i) {
> +               WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
> +               drm_block_free(mm, mm->roots[i]);
> +       }
> +
> +       kfree(mm->roots);
> +       kfree(mm->free_list);
> +       kmem_cache_destroy(mm->slab_blocks);
> +}
> +EXPORT_SYMBOL(drm_buddy_fini);
> +
> +static int split_block(struct drm_buddy_mm *mm,
> +                      struct drm_buddy_block *block)
> +{
> +       unsigned int block_order =3D drm_buddy_block_order(block) - 1;
> +       u64 offset =3D drm_buddy_block_offset(block);
> +
> +       BUG_ON(!drm_buddy_block_is_free(block));
> +       BUG_ON(!drm_buddy_block_order(block));
> +
> +       block->left =3D drm_block_alloc(mm, block, block_order, offset);
> +       if (!block->left)
> +               return -ENOMEM;
> +
> +       block->right =3D drm_block_alloc(mm, block, block_order,
> +                                       offset + (mm->chunk_size << block=
_order));
> +       if (!block->right) {
> +               drm_block_free(mm, block->left);
> +               return -ENOMEM;
> +       }
> +
> +       mark_free(mm, block->left);
> +       mark_free(mm, block->right);
> +
> +       mark_split(block);
> +
> +       return 0;
> +}
> +
> +static struct drm_buddy_block *
> +get_buddy(struct drm_buddy_block *block)
> +{
> +       struct drm_buddy_block *parent;
> +
> +       parent =3D block->parent;
> +       if (!parent)
> +               return NULL;
> +
> +       if (parent->left =3D=3D block)
> +               return parent->right;
> +
> +       return parent->left;
> +}
> +
> +static void __drm_buddy_free(struct drm_buddy_mm *mm,
> +                             struct drm_buddy_block *block)
> +{
> +       struct drm_buddy_block *parent;
> +
> +       while ((parent =3D block->parent)) {
> +               struct drm_buddy_block *buddy;
> +
> +               buddy =3D get_buddy(block);
> +
> +               if (!drm_buddy_block_is_free(buddy))
> +                       break;
> +
> +               list_del(&buddy->link);
> +
> +               drm_block_free(mm, block);
> +               drm_block_free(mm, buddy);
> +
> +               block =3D parent;
> +       }
> +
> +       mark_free(mm, block);
> +}
> +
> +void drm_buddy_free(struct drm_buddy_mm *mm,
> +                    struct drm_buddy_block *block)
> +{
> +       BUG_ON(!drm_buddy_block_is_allocated(block));
> +       __drm_buddy_free(mm, block);
> +}
> +EXPORT_SYMBOL(drm_buddy_free);
> +
> +void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *obje=
cts)
> +{
> +       struct drm_buddy_block *block, *on;
> +
> +       list_for_each_entry_safe(block, on, objects, link) {
> +               drm_buddy_free(mm, block);
> +               cond_resched();
> +       }
> +       INIT_LIST_HEAD(objects);
> +}
> +EXPORT_SYMBOL(drm_buddy_free_list);
> +
> +/*
> + * Allocate power-of-two block. The order value here translates to:
> + *
> + *   0 =3D 2^0 * mm->chunk_size
> + *   1 =3D 2^1 * mm->chunk_size
> + *   2 =3D 2^2 * mm->chunk_size
> + *   ...
> + */
> +struct drm_buddy_block *
> +drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order,
> +               bool bar_enabled, unsigned int limit,
> +               enum drm_buddy_alloc_mode mode)
> +{
> +       struct drm_buddy_block *block =3D NULL;
> +       unsigned int pages;
> +       unsigned int i;
> +       int err;
> +
> +       pages =3D (mm->chunk_size << order) >> PAGE_SHIFT;
> +
> +       for (i =3D order; i <=3D mm->max_order; ++i) {
> +               if (mode =3D=3D DRM_BUDDY_TOP_DOWN) {
> +                       if (!list_empty(&mm->free_list[i])) {
> +                               block =3D list_first_entry(&mm->free_list=
[i],
> +                                               struct drm_buddy_block, l=
ink);
> +
> +                               if (bar_enabled) {
> +                                       if (!(block->start > limit))
> +                                               continue;
> +                               }
> +
> +                               break;
> +                       }
> +               } else if (mode =3D=3D DRM_BUDDY_BOTTOM_UP) {
> +                       if (!list_empty(&mm->free_list[i])) {
> +                               block =3D list_last_entry(&mm->free_list[=
i],
> +                                               struct drm_buddy_block, l=
ink);
> +
> +                               if (bar_enabled) {
> +                                       if (!(block->start < limit &&
> +                                                       (block->start + p=
ages) < limit))
> +                                               continue;
> +                               }
> +
> +                               break;
> +                       }
> +               }
> +       }
> +
> +       if (!block)
> +               return ERR_PTR(-ENOSPC);
> +
> +       BUG_ON(!drm_buddy_block_is_free(block));
> +
> +       while (i !=3D order) {
> +               err =3D split_block(mm, block);
> +               if (unlikely(err))
> +                       goto out_free;
> +
> +               /* Go low */
> +               if (mode =3D=3D DRM_BUDDY_TOP_DOWN)
> +                       block =3D block->right;
> +               else
> +                       block =3D block->left;
> +               i--;
> +       }
> +
> +       if (mode =3D=3D DRM_BUDDY_TOP_DOWN && bar_enabled) {
> +               if (!(block->start > limit))
> +                       return ERR_PTR(-ENOSPC);
> +       } else if (mode =3D=3D DRM_BUDDY_BOTTOM_UP && bar_enabled) {
> +               if (!(block->start < limit &&
> +                               (block->start + pages) < limit))
> +                       return ERR_PTR(-ENOSPC);
> +       }
> +
> +       mark_allocated(block);
> +       kmemleak_update_trace(block);
> +       return block;
> +
> +out_free:
> +       if (i !=3D order)
> +               __drm_buddy_free(mm, block);
> +       return ERR_PTR(err);
> +}
> +EXPORT_SYMBOL(drm_buddy_alloc);
> +
> +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> +{
> +       return s1 <=3D e2 && e1 >=3D s2;
> +}
> +
> +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
> +{
> +       return s1 <=3D s2 && e1 >=3D e2;
> +}
> +
> +/*
> + * Allocate range. Note that it's safe to chain together multiple alloc_=
ranges
> + * with the same blocks list.
> + *
> + * Intended for pre-allocating portions of the address space, for exampl=
e to
> + * reserve a block for the initial framebuffer or similar, hence the exp=
ectation
> + * here is that drm_buddy_alloc() is still the main vehicle for
> + * allocations, so if that's not the case then the drm_mm range allocato=
r is
> + * probably a much better fit, and so you should probably go use that in=
stead.
> + */
> +int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
> +                       struct list_head *blocks,
> +                       u64 start, u64 size)
> +{
> +       struct drm_buddy_block *block;
> +       struct drm_buddy_block *buddy;
> +       LIST_HEAD(allocated);
> +       LIST_HEAD(dfs);
> +       u64 end;
> +       int err;
> +       int i;
> +
> +       if (size < mm->chunk_size)
> +               return -EINVAL;
> +
> +       if (!IS_ALIGNED(size | start, mm->chunk_size))
> +               return -EINVAL;
> +
> +       if (range_overflows(start, size, mm->size))
> +               return -EINVAL;
> +
> +       for (i =3D 0; i < mm->n_roots; ++i)
> +               list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> +
> +       end =3D start + size - 1;
> +
> +       do {
> +               u64 block_start;
> +               u64 block_end;
> +
> +               block =3D list_first_entry_or_null(&dfs,
> +                                                struct drm_buddy_block,
> +                                                tmp_link);
> +               if (!block)
> +                       break;
> +
> +               list_del(&block->tmp_link);
> +
> +               block_start =3D drm_buddy_block_offset(block);
> +               block_end =3D block_start + drm_buddy_block_size(mm, bloc=
k) - 1;
> +
> +               if (!overlaps(start, end, block_start, block_end))
> +                       continue;
> +
> +               if (drm_buddy_block_is_allocated(block)) {
> +                       err =3D -ENOSPC;
> +                       goto err_free;
> +               }
> +
> +               if (contains(start, end, block_start, block_end)) {
> +                       if (!drm_buddy_block_is_free(block)) {
> +                               err =3D -ENOSPC;
> +                               goto err_free;
> +                       }
> +
> +                       mark_allocated(block);
> +                       list_add_tail(&block->link, &allocated);
> +                       continue;
> +               }
> +
> +               if (!drm_buddy_block_is_split(block)) {
> +                       err =3D split_block(mm, block);
> +                       if (unlikely(err))
> +                               goto err_undo;
> +               }
> +
> +               list_add(&block->right->tmp_link, &dfs);
> +               list_add(&block->left->tmp_link, &dfs);
> +       } while (1);
> +
> +       list_splice_tail(&allocated, blocks);
> +       return 0;
> +
> +err_undo:
> +       /*
> +        * We really don't want to leave around a bunch of split blocks, =
since
> +        * bigger is better, so make sure we merge everything back before=
 we
> +        * free the allocated blocks.
> +        */
> +       buddy =3D get_buddy(block);
> +       if (buddy &&
> +           (drm_buddy_block_is_free(block) &&
> +            drm_buddy_block_is_free(buddy)))
> +               __drm_buddy_free(mm, block);
> +
> +err_free:
> +       drm_buddy_free_list(mm, &allocated);
> +       return err;
> +}
> +EXPORT_SYMBOL(drm_buddy_alloc_range);
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> new file mode 100644
> index 000000000000..50e4d819a3dd
> --- /dev/null
> +++ b/include/drm/drm_buddy.h
> @@ -0,0 +1,154 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =EF=BF=BD 2021 Intel Corporation
> + */
> +
> +#ifndef __DRM_BUDDY_H__
> +#define __DRM_BUDDY_H__
> +
> +#include <linux/bitops.h>
> +#include <linux/list.h>
> +#include <linux/slab.h>
> +#include <linux/sched.h>
> +
> +#define range_overflows(start, size, max) ({ \
> +       typeof(start) start__ =3D (start); \
> +       typeof(size) size__ =3D (size); \
> +       typeof(max) max__ =3D (max); \
> +       (void)(&start__ =3D=3D &size__); \
> +       (void)(&start__ =3D=3D &max__); \
> +       start__ >=3D max__ || size__ > max__ - start__; \
> +})
> +
> +enum drm_buddy_alloc_mode {
> +        DRM_BUDDY_TOP_DOWN =3D 0,
> +        DRM_BUDDY_BOTTOM_UP,
> +        DRM_BUDDY_ALLOC_RANGE
> +};
> +
> +struct drm_buddy_block {
> +#define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
> +#define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
> +#define   DRM_BUDDY_ALLOCATED     (1 << 10)
> +#define   DRM_BUDDY_FREE          (2 << 10)
> +#define   DRM_BUDDY_SPLIT         (3 << 10)
> +/* Free to be used, if needed in the future */
> +#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
> +#define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
> +       u64 header;
> +       /* Store start and size fields in pages */
> +       u64 start;
> +       u64 size;
> +
> +       struct drm_buddy_block *left;
> +       struct drm_buddy_block *right;
> +       struct drm_buddy_block *parent;
> +
> +       void *private; /* owned by creator */
> +
> +       /*
> +        * While the block is allocated by the user through drm_buddy_all=
oc*,
> +        * the user has ownership of the link, for example to maintain wi=
thin
> +        * a list, if so desired. As soon as the block is freed with
> +        * drm_buddy_free* ownership is given back to the mm.
> +        */
> +       struct list_head link;
> +       struct list_head tmp_link;
> +};
> +
> +/* Order-zero must be at least PAGE_SIZE */
> +#define DRM_BUDDY_MAX_ORDER (63 - PAGE_SHIFT)
> +
> +/*
> + * Binary Buddy System.
> + *
> + * Locking should be handled by the user, a simple mutex around
> + * drm_buddy_alloc* and drm_buddy_free* should suffice.
> + */
> +struct drm_buddy_mm {
> +       struct kmem_cache *slab_blocks;
> +       /* Maintain a free list for each order. */
> +       struct list_head *free_list;
> +
> +       /*
> +        * Maintain explicit binary tree(s) to track the allocation of th=
e
> +        * address space. This gives us a simple way of finding a buddy b=
lock
> +        * and performing the potentially recursive merge step when freei=
ng a
> +        * block.  Nodes are either allocated or free, in which case they=
 will
> +        * also exist on the respective free list.
> +        */
> +       struct drm_buddy_block **roots;
> +
> +       /*
> +        * Anything from here is public, and remains static for the lifet=
ime of
> +        * the mm. Everything above is considered do-not-touch.
> +        */
> +       unsigned int n_roots;
> +       unsigned int max_order;
> +
> +       /* Must be at least PAGE_SIZE */
> +       u64 chunk_size;
> +       u64 size;
> +};
> +
> +static inline u64
> +drm_buddy_block_offset(struct drm_buddy_block *block)
> +{
> +       return block->header & DRM_BUDDY_HEADER_OFFSET;
> +}
> +
> +static inline unsigned int
> +drm_buddy_block_order(struct drm_buddy_block *block)
> +{
> +       return block->header & DRM_BUDDY_HEADER_ORDER;
> +}
> +
> +static inline unsigned int
> +drm_buddy_block_state(struct drm_buddy_block *block)
> +{
> +       return block->header & DRM_BUDDY_HEADER_STATE;
> +}
> +
> +static inline bool
> +drm_buddy_block_is_allocated(struct drm_buddy_block *block)
> +{
> +       return drm_buddy_block_state(block) =3D=3D DRM_BUDDY_ALLOCATED;
> +}
> +
> +static inline bool
> +drm_buddy_block_is_free(struct drm_buddy_block *block)
> +{
> +       return drm_buddy_block_state(block) =3D=3D DRM_BUDDY_FREE;
> +}
> +
> +static inline bool
> +drm_buddy_block_is_split(struct drm_buddy_block *block)
> +{
> +       return drm_buddy_block_state(block) =3D=3D DRM_BUDDY_SPLIT;
> +}
> +
> +static inline u64
> +drm_buddy_block_size(struct drm_buddy_mm *mm,
> +                     struct drm_buddy_block *block)
> +{
> +       return mm->chunk_size << drm_buddy_block_order(block);
> +}
> +
> +int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
> +
> +void drm_buddy_fini(struct drm_buddy_mm *mm);
> +
> +struct drm_buddy_block *
> +drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order,
> +               bool bar_limit_enabled, unsigned int limit,
> +               enum drm_buddy_alloc_mode mode);
> +
> +int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
> +                          struct list_head *blocks,
> +                          u64 start, u64 size);
> +
> +void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *blo=
ck);
> +
> +void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *obje=
cts);
> +
> +#endif
> --
> 2.25.1
>
