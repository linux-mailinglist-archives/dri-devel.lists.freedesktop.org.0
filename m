Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7ED4B4454
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 09:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DF010E1EE;
	Mon, 14 Feb 2022 08:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4410B10E1E6;
 Mon, 14 Feb 2022 08:36:50 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id y8so14800539qtn.8;
 Mon, 14 Feb 2022 00:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=huIrDimuckDOszkOmMCjSuEuwRROrGzlYkzB8Gt987Q=;
 b=Y9GxAtNkKI07yAPdwGEMVKGugwCELwVfZVNf3H70eAMiMLl35sGwnNAODBolrmuVCd
 CipLw4Gx0JOmquMxdTlENkYYug+3QLmsEPmUrqSdibzhhsXyqsRBwPtfRRNp97QFOaZs
 cSZWfcHNvRrcHR3JTDWRvijyiCC97iltogKpEDLTekGg5V07EWeA5D462l+9sLKXRczB
 COWgWzuAfTW36hbyNYsUTUqlQvzYdrkrrjVWh5l6SgaDTzzS6/DiE6Z0tnbggzAtY7g7
 bbb17++r9OJJjCd4nypAi2/vprGda4BiwOyv0c00jfMJk52gDE/2/KnRxUpRKVZEEwRb
 0ELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=huIrDimuckDOszkOmMCjSuEuwRROrGzlYkzB8Gt987Q=;
 b=qENwjbL+b1NTOs7CEgnhj+Y7LN2KKRgjoVFQpQArxg/Y0SPWOUyjJmLj17vAWuesf+
 QT67bn8v4d2g9ZSPXADXhxnDCU4xXJjquzywyOHPgo6DagEsiZ42UOGIxGJeXUBOe1/S
 n7tRBqrWWVoLdLfpGv1KDZ7DpEwCZvAD43D793C3r8EmhkcuJcgv4oKfCBesGc5t/AUP
 CVOJAnqxZAAz1pyvEQCYyQF4ns91MwmLm+UNfbBj5OX76wubDswIih4jj9JZSXZI80kW
 N++2RKCWVoMkTLUmoHhrL/AA2D6fRPNgZoUigByuYwhEFtmi1X0/cKEvfGD6XD6KL107
 Iylw==
X-Gm-Message-State: AOAM5311FBCOkiQWnQ/HjMoPHwSbsO/gEoap7h4+nufkTeV7s8Qz8W0x
 SkfCOdbyCvR1vxOgyEyX6wnldfX094IC7bec7Wo=
X-Google-Smtp-Source: ABdhPJy9MzQZrPzM+6bFoIJzsCewKlQfPzD7cSSaVT8CqAk528ijSfu09ON6RXBx7rtkMuILq4OJQ+LokSAlVnNU0Ok=
X-Received: by 2002:a05:622a:108:: with SMTP id
 u8mr8881711qtw.455.1644827809222; 
 Mon, 14 Feb 2022 00:36:49 -0800 (PST)
MIME-Version: 1.0
References: <20220213085217.2705-1-Arunpravin.PaneerSelvam@amd.com>
 <32487d00-8ee2-b54e-cf5d-3b241ff19a5b@gmail.com>
In-Reply-To: <32487d00-8ee2-b54e-cf5d-3b241ff19a5b@gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 14 Feb 2022 08:36:22 +0000
Message-ID: <CAM0jSHNAPYjX8cD48195fkM4CoLjMFu5P0i5g2anS3-YGzf2cg@mail.gmail.com>
Subject: Re: [PATCH v12 1/5] drm: improve drm_buddy_alloc function
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
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, tzimmermann@suse.de,
 alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Feb 2022 at 06:32, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 13.02.22 um 09:52 schrieb Arunpravin:
> > - Make drm_buddy_alloc a single function to handle
> >    range allocation and non-range allocation demands
> >
> > - Implemented a new function alloc_range() which allocates
> >    the requested power-of-two block comply with range limitations
> >
> > - Moved order computation and memory alignment logic from
> >    i915 driver to drm buddy
> >
> > v2:
> >    merged below changes to keep the build unbroken
> >     - drm_buddy_alloc_range() becomes obsolete and may be removed
> >     - enable ttm range allocation (fpfn / lpfn) support in i915 driver
> >     - apply enhanced drm_buddy_alloc() function to i915 driver
> >
> > v3(Matthew Auld):
> >    - Fix alignment issues and remove unnecessary list_empty check
> >    - add more validation checks for input arguments
> >    - make alloc_range() block allocations as bottom-up
> >    - optimize order computation logic
> >    - replace uint64_t with u64, which is preferred in the kernel
> >
> > v4(Matthew Auld):
> >    - keep drm_buddy_alloc_range() function implementation for generic
> >      actual range allocations
> >    - keep alloc_range() implementation for end bias allocations
> >
> > v5(Matthew Auld):
> >    - modify drm_buddy_alloc() passing argument place->lpfn to lpfn
> >      as place->lpfn will currently always be zero for i915
> >
> > v6(Matthew Auld):
> >    - fixup potential uaf - If we are unlucky and can't allocate
> >      enough memory when splitting blocks, where we temporarily
> >      end up with the given block and its buddy on the respective
> >      free list, then we need to ensure we delete both blocks,
> >      and no just the buddy, before potentially freeing them
> >
> >    - fix warnings reported by kernel test robot <lkp@intel.com>
> >
> > v7(Matthew Auld):
> >    - revert fixup potential uaf
> >    - keep __alloc_range() add node to the list logic same as
> >      drm_buddy_alloc_blocks() by having a temporary list variable
> >    - at drm_buddy_alloc_blocks() keep i915 range_overflows macro
> >      and add a new check for end variable
> >
> > v8:
> >    - fix warnings reported by kernel test robot <lkp@intel.com>
> >
> > v9(Matthew Auld):
> >    - remove DRM_BUDDY_RANGE_ALLOCATION flag
> >    - remove unnecessary function description
> >
> > Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
> As long as nobody objects I'm going to push patches 1-3 to drm-misc-next
> in the next hour or so:

As part of this could you also push
https://patchwork.freedesktop.org/series/99842/ ?

>
> Then going to take a deeper look into patches 4 and 5 to get them reviewe=
d.
>
> Thanks,
> Christian.
>
> > ---
> >   drivers/gpu/drm/drm_buddy.c                   | 292 +++++++++++++----=
-
> >   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  63 ++--
> >   drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
> >   include/drm/drm_buddy.h                       |  11 +-
> >   4 files changed, 250 insertions(+), 118 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> > index d60878bc9c20..e0c0d786a572 100644
> > --- a/drivers/gpu/drm/drm_buddy.c
> > +++ b/drivers/gpu/drm/drm_buddy.c
> > @@ -282,23 +282,97 @@ void drm_buddy_free_list(struct drm_buddy *mm, st=
ruct list_head *objects)
> >   }
> >   EXPORT_SYMBOL(drm_buddy_free_list);
> >
> > -/**
> > - * drm_buddy_alloc_blocks - allocate power-of-two blocks
> > - *
> > - * @mm: DRM buddy manager to allocate from
> > - * @order: size of the allocation
> > - *
> > - * The order value here translates to:
> > - *
> > - * 0 =3D 2^0 * mm->chunk_size
> > - * 1 =3D 2^1 * mm->chunk_size
> > - * 2 =3D 2^2 * mm->chunk_size
> > - *
> > - * Returns:
> > - * allocated ptr to the &drm_buddy_block on success
> > - */
> > -struct drm_buddy_block *
> > -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
> > +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> > +{
> > +     return s1 <=3D e2 && e1 >=3D s2;
> > +}
> > +
> > +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
> > +{
> > +     return s1 <=3D s2 && e1 >=3D e2;
> > +}
> > +
> > +static struct drm_buddy_block *
> > +alloc_range_bias(struct drm_buddy *mm,
> > +              u64 start, u64 end,
> > +              unsigned int order)
> > +{
> > +     struct drm_buddy_block *block;
> > +     struct drm_buddy_block *buddy;
> > +     LIST_HEAD(dfs);
> > +     int err;
> > +     int i;
> > +
> > +     end =3D end - 1;
> > +
> > +     for (i =3D 0; i < mm->n_roots; ++i)
> > +             list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> > +
> > +     do {
> > +             u64 block_start;
> > +             u64 block_end;
> > +
> > +             block =3D list_first_entry_or_null(&dfs,
> > +                                              struct drm_buddy_block,
> > +                                              tmp_link);
> > +             if (!block)
> > +                     break;
> > +
> > +             list_del(&block->tmp_link);
> > +
> > +             if (drm_buddy_block_order(block) < order)
> > +                     continue;
> > +
> > +             block_start =3D drm_buddy_block_offset(block);
> > +             block_end =3D block_start + drm_buddy_block_size(mm, bloc=
k) - 1;
> > +
> > +             if (!overlaps(start, end, block_start, block_end))
> > +                     continue;
> > +
> > +             if (drm_buddy_block_is_allocated(block))
> > +                     continue;
> > +
> > +             if (contains(start, end, block_start, block_end) &&
> > +                 order =3D=3D drm_buddy_block_order(block)) {
> > +                     /*
> > +                      * Find the free block within the range.
> > +                      */
> > +                     if (drm_buddy_block_is_free(block))
> > +                             return block;
> > +
> > +                     continue;
> > +             }
> > +
> > +             if (!drm_buddy_block_is_split(block)) {
> > +                     err =3D split_block(mm, block);
> > +                     if (unlikely(err))
> > +                             goto err_undo;
> > +             }
> > +
> > +             list_add(&block->right->tmp_link, &dfs);
> > +             list_add(&block->left->tmp_link, &dfs);
> > +     } while (1);
> > +
> > +     return ERR_PTR(-ENOSPC);
> > +
> > +err_undo:
> > +     /*
> > +      * We really don't want to leave around a bunch of split blocks, =
since
> > +      * bigger is better, so make sure we merge everything back before=
 we
> > +      * free the allocated blocks.
> > +      */
> > +     buddy =3D get_buddy(block);
> > +     if (buddy &&
> > +         (drm_buddy_block_is_free(block) &&
> > +          drm_buddy_block_is_free(buddy)))
> > +             __drm_buddy_free(mm, block);
> > +     return ERR_PTR(err);
> > +}
> > +
> > +static struct drm_buddy_block *
> > +alloc_from_freelist(struct drm_buddy *mm,
> > +                 unsigned int order,
> > +                 unsigned long flags)
> >   {
> >       struct drm_buddy_block *block =3D NULL;
> >       unsigned int i;
> > @@ -320,78 +394,29 @@ drm_buddy_alloc_blocks(struct drm_buddy *mm, unsi=
gned int order)
> >       while (i !=3D order) {
> >               err =3D split_block(mm, block);
> >               if (unlikely(err))
> > -                     goto out_free;
> > +                     goto err_undo;
> >
> > -             /* Go low */
> > -             block =3D block->left;
> > +             block =3D block->right;
> >               i--;
> >       }
> > -
> > -     mark_allocated(block);
> > -     mm->avail -=3D drm_buddy_block_size(mm, block);
> > -     kmemleak_update_trace(block);
> >       return block;
> >
> > -out_free:
> > +err_undo:
> >       if (i !=3D order)
> >               __drm_buddy_free(mm, block);
> >       return ERR_PTR(err);
> >   }
> > -EXPORT_SYMBOL(drm_buddy_alloc_blocks);
> > -
> > -static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> > -{
> > -     return s1 <=3D e2 && e1 >=3D s2;
> > -}
> > -
> > -static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
> > -{
> > -     return s1 <=3D s2 && e1 >=3D e2;
> > -}
> >
> > -/**
> > - * drm_buddy_alloc_range - allocate range
> > - *
> > - * @mm: DRM buddy manager to allocate from
> > - * @blocks: output list head to add allocated blocks
> > - * @start: start of the allowed range for this block
> > - * @size: size of the allocation
> > - *
> > - * Intended for pre-allocating portions of the address space, for exam=
ple to
> > - * reserve a block for the initial framebuffer or similar, hence the e=
xpectation
> > - * here is that drm_buddy_alloc_blocks() is still the main vehicle for
> > - * allocations, so if that's not the case then the drm_mm range alloca=
tor is
> > - * probably a much better fit, and so you should probably go use that =
instead.
> > - *
> > - * Note that it's safe to chain together multiple alloc_ranges
> > - * with the same blocks list
> > - *
> > - * Returns:
> > - * 0 on success, error code on failure.
> > - */
> > -int drm_buddy_alloc_range(struct drm_buddy *mm,
> > -                       struct list_head *blocks,
> > -                       u64 start, u64 size)
> > +static int __alloc_range(struct drm_buddy *mm,
> > +                      struct list_head *dfs,
> > +                      u64 start, u64 size,
> > +                      struct list_head *blocks)
> >   {
> >       struct drm_buddy_block *block;
> >       struct drm_buddy_block *buddy;
> >       LIST_HEAD(allocated);
> > -     LIST_HEAD(dfs);
> >       u64 end;
> >       int err;
> > -     int i;
> > -
> > -     if (size < mm->chunk_size)
> > -             return -EINVAL;
> > -
> > -     if (!IS_ALIGNED(size | start, mm->chunk_size))
> > -             return -EINVAL;
> > -
> > -     if (range_overflows(start, size, mm->size))
> > -             return -EINVAL;
> > -
> > -     for (i =3D 0; i < mm->n_roots; ++i)
> > -             list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> >
> >       end =3D start + size - 1;
> >
> > @@ -399,7 +424,7 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
> >               u64 block_start;
> >               u64 block_end;
> >
> > -             block =3D list_first_entry_or_null(&dfs,
> > +             block =3D list_first_entry_or_null(dfs,
> >                                                struct drm_buddy_block,
> >                                                tmp_link);
> >               if (!block)
> > @@ -436,8 +461,8 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
> >                               goto err_undo;
> >               }
> >
> > -             list_add(&block->right->tmp_link, &dfs);
> > -             list_add(&block->left->tmp_link, &dfs);
> > +             list_add(&block->right->tmp_link, dfs);
> > +             list_add(&block->left->tmp_link, dfs);
> >       } while (1);
> >
> >       list_splice_tail(&allocated, blocks);
> > @@ -459,7 +484,120 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
> >       drm_buddy_free_list(mm, &allocated);
> >       return err;
> >   }
> > -EXPORT_SYMBOL(drm_buddy_alloc_range);
> > +
> > +static int __drm_buddy_alloc_range(struct drm_buddy *mm,
> > +                                u64 start,
> > +                                u64 size,
> > +                                struct list_head *blocks)
> > +{
> > +     LIST_HEAD(dfs);
> > +     int i;
> > +
> > +     for (i =3D 0; i < mm->n_roots; ++i)
> > +             list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> > +
> > +     return __alloc_range(mm, &dfs, start, size, blocks);
> > +}
> > +
> > +/**
> > + * drm_buddy_alloc_blocks - allocate power-of-two blocks
> > + *
> > + * @mm: DRM buddy manager to allocate from
> > + * @start: start of the allowed range for this block
> > + * @end: end of the allowed range for this block
> > + * @size: size of the allocation
> > + * @min_page_size: alignment of the allocation
> > + * @blocks: output list head to add allocated blocks
> > + * @flags: DRM_BUDDY_*_ALLOCATION flags
> > + *
> > + * alloc_range_bias() called on range limitations, which traverses
> > + * the tree and returns the desired block.
> > + *
> > + * alloc_from_freelist() called when *no* range restrictions
> > + * are enforced, which picks the block from the freelist.
> > + *
> > + * Returns:
> > + * 0 on success, error code on failure.
> > + */
> > +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
> > +                        u64 start, u64 end, u64 size,
> > +                        u64 min_page_size,
> > +                        struct list_head *blocks,
> > +                        unsigned long flags)
> > +{
> > +     struct drm_buddy_block *block =3D NULL;
> > +     unsigned int min_order, order;
> > +     unsigned long pages;
> > +     LIST_HEAD(allocated);
> > +     int err;
> > +
> > +     if (size < mm->chunk_size)
> > +             return -EINVAL;
> > +
> > +     if (min_page_size < mm->chunk_size)
> > +             return -EINVAL;
> > +
> > +     if (!is_power_of_2(min_page_size))
> > +             return -EINVAL;
> > +
> > +     if (!IS_ALIGNED(start | end | size, mm->chunk_size))
> > +             return -EINVAL;
> > +
> > +     if (end > mm->size)
> > +             return -EINVAL;
> > +
> > +     if (range_overflows(start, size, mm->size))
> > +             return -EINVAL;
> > +
> > +     /* Actual range allocation */
> > +     if (start + size =3D=3D end)
> > +             return __drm_buddy_alloc_range(mm, start, size, blocks);
> > +
> > +     pages =3D size >> ilog2(mm->chunk_size);
> > +     order =3D fls(pages) - 1;
> > +     min_order =3D ilog2(min_page_size) - ilog2(mm->chunk_size);
> > +
> > +     do {
> > +             order =3D min(order, (unsigned int)fls(pages) - 1);
> > +             BUG_ON(order > mm->max_order);
> > +             BUG_ON(order < min_order);
> > +
> > +             do {
> > +                     if (start || end !=3D size)
> > +                             /* Allocate traversing within the range *=
/
> > +                             block =3D alloc_range_bias(mm, start, end=
, order);
> > +                     else
> > +                             /* Allocate from freelist */
> > +                             block =3D alloc_from_freelist(mm, order, =
flags);
> > +
> > +                     if (!IS_ERR(block))
> > +                             break;
> > +
> > +                     if (order-- =3D=3D min_order) {
> > +                             err =3D -ENOSPC;
> > +                             goto err_free;
> > +                     }
> > +             } while (1);
> > +
> > +             mark_allocated(block);
> > +             mm->avail -=3D drm_buddy_block_size(mm, block);
> > +             kmemleak_update_trace(block);
> > +             list_add_tail(&block->link, &allocated);
> > +
> > +             pages -=3D BIT(order);
> > +
> > +             if (!pages)
> > +                     break;
> > +     } while (1);
> > +
> > +     list_splice_tail(&allocated, blocks);
> > +     return 0;
> > +
> > +err_free:
> > +     drm_buddy_free_list(mm, &allocated);
> > +     return err;
> > +}
> > +EXPORT_SYMBOL(drm_buddy_alloc_blocks);
> >
> >   /**
> >    * drm_buddy_block_print - print block information
> > diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gp=
u/drm/i915/i915_ttm_buddy_manager.c
> > index 247714bab044..7aef6ad9fe84 100644
> > --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> > +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> > @@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_reso=
urce_manager *man,
> >       struct i915_ttm_buddy_manager *bman =3D to_buddy_manager(man);
> >       struct i915_ttm_buddy_resource *bman_res;
> >       struct drm_buddy *mm =3D &bman->mm;
> > -     unsigned long n_pages;
> > -     unsigned int min_order;
> > +     unsigned long n_pages, lpfn;
> >       u64 min_page_size;
> >       u64 size;
> >       int err;
> >
> > -     GEM_BUG_ON(place->fpfn || place->lpfn);
> > +     lpfn =3D place->lpfn;
> > +     if (!lpfn)
> > +             lpfn =3D man->size;
> >
> >       bman_res =3D kzalloc(sizeof(*bman_res), GFP_KERNEL);
> >       if (!bman_res)
> > @@ -60,10 +61,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_reso=
urce_manager *man,
> >               min_page_size =3D bo->page_alignment << PAGE_SHIFT;
> >
> >       GEM_BUG_ON(min_page_size < mm->chunk_size);
> > -     min_order =3D ilog2(min_page_size) - ilog2(mm->chunk_size);
> > +
> >       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> > +             unsigned long pages;
> > +
> >               size =3D roundup_pow_of_two(size);
> > -             min_order =3D ilog2(size) - ilog2(mm->chunk_size);
> > +             min_page_size =3D size;
> > +
> > +             pages =3D size >> ilog2(mm->chunk_size);
> > +             if (pages > lpfn)
> > +                     lpfn =3D pages;
> >       }
> >
> >       if (size > mm->size) {
> > @@ -73,34 +80,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_reso=
urce_manager *man,
> >
> >       n_pages =3D size >> ilog2(mm->chunk_size);
> >
> > -     do {
> > -             struct drm_buddy_block *block;
> > -             unsigned int order;
> > -
> > -             order =3D fls(n_pages) - 1;
> > -             GEM_BUG_ON(order > mm->max_order);
> > -             GEM_BUG_ON(order < min_order);
> > -
> > -             do {
> > -                     mutex_lock(&bman->lock);
> > -                     block =3D drm_buddy_alloc_blocks(mm, order);
> > -                     mutex_unlock(&bman->lock);
> > -                     if (!IS_ERR(block))
> > -                             break;
> > -
> > -                     if (order-- =3D=3D min_order) {
> > -                             err =3D -ENOSPC;
> > -                             goto err_free_blocks;
> > -                     }
> > -             } while (1);
> > -
> > -             n_pages -=3D BIT(order);
> > -
> > -             list_add_tail(&block->link, &bman_res->blocks);
> > -
> > -             if (!n_pages)
> > -                     break;
> > -     } while (1);
> > +     mutex_lock(&bman->lock);
> > +     err =3D drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT=
,
> > +                                  (u64)lpfn << PAGE_SHIFT,
> > +                                  (u64)n_pages << PAGE_SHIFT,
> > +                                  min_page_size,
> > +                                  &bman_res->blocks,
> > +                                  bman_res->flags);
> > +     mutex_unlock(&bman->lock);
> > +     if (unlikely(err))
> > +             goto err_free_blocks;
> >
> >       *res =3D &bman_res->base;
> >       return 0;
> > @@ -268,12 +257,16 @@ int i915_ttm_buddy_man_reserve(struct ttm_resourc=
e_manager *man,
> >   {
> >       struct i915_ttm_buddy_manager *bman =3D to_buddy_manager(man);
> >       struct drm_buddy *mm =3D &bman->mm;
> > +     unsigned long flags =3D 0;
> >       int ret;
> >
> >       mutex_lock(&bman->lock);
> > -     ret =3D drm_buddy_alloc_range(mm, &bman->reserved, start, size);
> > +     ret =3D drm_buddy_alloc_blocks(mm, start,
> > +                                  start + size,
> > +                                  size, mm->chunk_size,
> > +                                  &bman->reserved,
> > +                                  flags);
> >       mutex_unlock(&bman->lock);
> >
> >       return ret;
> >   }
> > -
> > diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gp=
u/drm/i915/i915_ttm_buddy_manager.h
> > index 312077941411..72c90b432e87 100644
> > --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> > +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
> > @@ -20,6 +20,7 @@ struct drm_buddy;
> >    *
> >    * @base: struct ttm_resource base class we extend
> >    * @blocks: the list of struct i915_buddy_block for this resource/all=
ocation
> > + * @flags: DRM_BUDDY_*_ALLOCATION flags
> >    * @mm: the struct i915_buddy_mm for this resource
> >    *
> >    * Extends the struct ttm_resource to manage an address space allocat=
ion with
> > @@ -28,6 +29,7 @@ struct drm_buddy;
> >   struct i915_ttm_buddy_resource {
> >       struct ttm_resource base;
> >       struct list_head blocks;
> > +     unsigned long flags;
> >       struct drm_buddy *mm;
> >   };
> >
> > diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> > index f524db152413..1f2435426c69 100644
> > --- a/include/drm/drm_buddy.h
> > +++ b/include/drm/drm_buddy.h
> > @@ -131,12 +131,11 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size=
, u64 chunk_size);
> >
> >   void drm_buddy_fini(struct drm_buddy *mm);
> >
> > -struct drm_buddy_block *
> > -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order);
> > -
> > -int drm_buddy_alloc_range(struct drm_buddy *mm,
> > -                       struct list_head *blocks,
> > -                       u64 start, u64 size);
> > +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
> > +                        u64 start, u64 end, u64 size,
> > +                        u64 min_page_size,
> > +                        struct list_head *blocks,
> > +                        unsigned long flags);
> >
> >   void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_bloc=
k *block);
> >
>
