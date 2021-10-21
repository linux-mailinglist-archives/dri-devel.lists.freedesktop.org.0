Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BEA436909
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 19:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CF96ECE7;
	Thu, 21 Oct 2021 17:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BC06ECDD;
 Thu, 21 Oct 2021 17:30:48 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id c28so1144454qtv.11;
 Thu, 21 Oct 2021 10:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DxOCWWsD/0+gLjvRcfMIPOSA285zoKyVlm1i/S1e5z8=;
 b=hPSh5AYH94U7K9V0p38h3YlI5hY6A49rMiVGCba1uErWb4eSLZb695ZK4Wla+hJWQl
 ng++MY8mlvsa8q3slYlFZo9HTQHF6BnTHGUWut/KTZNGhV6gGAN61ONAYNpCIbbdcYHw
 ZUycQmXYdqKjcBbjh84ploY2NnFs2OKq2S8hf2mvidNXTvohc2QeDgYMGmDNm3CdFQE+
 UJDX1XGiGSfpN0LvX2MQLOpq3DihdYIjX+M1ZURT8z0CMNDEGRs6OMTRGaIZouwj/aHR
 4Uq5eStN1/TGwqTsfX7ol31Gmdf73tJNNC8sOx2+KfY8LEoT0koRldrfO26j3gWfhB9X
 0srQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DxOCWWsD/0+gLjvRcfMIPOSA285zoKyVlm1i/S1e5z8=;
 b=zHuWYqZhGWWcfsRJL5h12q9j+/IC6CurBB+ZwgUAz3RwYYR5UicrDhSn5EpmG1tiec
 /am8IzgBA9LAe8wCqNiNuXQQ5rQ+5eduIdxg4XMLAGdTUJ3YoqGrZ0uxEPbTIQTsEAUm
 wJvvSCy7RRGV6fi1y1K8EYW1iYwTy4xTEU6fIWFrRLXxdUq2P7ttl+hsyHBD6wusm6VL
 yU9ggcTneqCV6fkEpyGWU9Ke+QVKyElL2zPvOevZghRjar8m6Be8EDJRMMQLQQWSXbsU
 oGuD4NsREoOtdPbdLLjKDS5r8GaydldgqKM6LDaL1iAxnjYvqLukXHTvrRFSOwS6p75X
 Q4kg==
X-Gm-Message-State: AOAM530POAzlCeh72KBs4mkPdE5C3s5yotRbn+qoCfg12G3FumwAb8XJ
 JZyTuGKsiyFQERL88r7py+RVg2UiKBbnScfte+4=
X-Google-Smtp-Source: ABdhPJyl+pJq16lxI1uvkxUc7OgHkpiGQzderU1I9ZsCbyh3egAXCoUvkeKQkufiPZlaBIudluR0Y2uIrfuthMu8AUk=
X-Received: by 2002:ac8:5f91:: with SMTP id j17mr7673860qta.138.1634837446751; 
 Thu, 21 Oct 2021 10:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-13-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211021103605.735002-13-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 21 Oct 2021 18:30:19 +0100
Message-ID: <CAM0jSHOpC7OCQfXUse10h+MHQE06wHOgbkYaVov+g-z+s54j2w@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 13/28] drm/i915: Remove pages_mutex and
 intel_gtt->vma_ops.set/clear_pages members
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
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

On Thu, 21 Oct 2021 at 11:36, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Big delta, but boils down to moving set_pages to i915_vma.c, and removing
> the special handling, all callers use the defaults anyway. We only remap
> in ggtt, so default case will fall through.
>
> Because we still don't require locking in i915_vma_unpin(), handle this by
> using xchg in get_pages(), as it's locked with obj->mutex, and cmpxchg in
> unpin, which only fails if we race a against a new pin.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dpt.c      |   2 -
>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  15 -
>  drivers/gpu/drm/i915/gt/intel_ggtt.c          | 345 ----------------
>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  13 -
>  drivers/gpu/drm/i915/gt/intel_gtt.h           |   7 -
>  drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  12 -
>  drivers/gpu/drm/i915/i915_vma.c               | 388 ++++++++++++++++--
>  drivers/gpu/drm/i915/i915_vma.h               |   3 +
>  drivers/gpu/drm/i915/i915_vma_types.h         |   1 -
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  12 +-
>  drivers/gpu/drm/i915/selftests/mock_gtt.c     |   4 -
>  11 files changed, 368 insertions(+), 434 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
> index 8f7b1f7534a4..ef428f3fc538 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
> @@ -221,8 +221,6 @@ intel_dpt_create(struct intel_framebuffer *fb)
>
>         vm->vma_ops.bind_vma    = dpt_bind_vma;
>         vm->vma_ops.unbind_vma  = dpt_unbind_vma;
> -       vm->vma_ops.set_pages   = ggtt_set_pages;
> -       vm->vma_ops.clear_pages = clear_pages;
>
>         vm->pte_encode = gen8_ggtt_pte_encode;
>
> diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> index 5caa1703716e..5c048b4ccd4d 100644
> --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> @@ -270,19 +270,6 @@ static void gen6_ppgtt_cleanup(struct i915_address_space *vm)
>         free_pd(&ppgtt->base.vm, ppgtt->base.pd);
>  }
>
> -static int pd_vma_set_pages(struct i915_vma *vma)
> -{
> -       vma->pages = ERR_PTR(-ENODEV);
> -       return 0;
> -}
> -
> -static void pd_vma_clear_pages(struct i915_vma *vma)
> -{
> -       GEM_BUG_ON(!vma->pages);
> -
> -       vma->pages = NULL;
> -}
> -
>  static void pd_vma_bind(struct i915_address_space *vm,
>                         struct i915_vm_pt_stash *stash,
>                         struct i915_vma *vma,
> @@ -322,8 +309,6 @@ static void pd_vma_unbind(struct i915_address_space *vm, struct i915_vma *vma)
>  }
>
>  static const struct i915_vma_ops pd_vma_ops = {
> -       .set_pages = pd_vma_set_pages,
> -       .clear_pages = pd_vma_clear_pages,
>         .bind_vma = pd_vma_bind,
>         .unbind_vma = pd_vma_unbind,
>  };
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index f17383e76eb7..6da57199bb33 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -20,9 +20,6 @@
>  #include "intel_gtt.h"
>  #include "gen8_ppgtt.h"
>
> -static int
> -i915_get_ggtt_vma_pages(struct i915_vma *vma);
> -
>  static void i915_ggtt_color_adjust(const struct drm_mm_node *node,
>                                    unsigned long color,
>                                    u64 *start,
> @@ -875,21 +872,6 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
>         return 0;
>  }
>
> -int ggtt_set_pages(struct i915_vma *vma)
> -{
> -       int ret;
> -
> -       GEM_BUG_ON(vma->pages);
> -
> -       ret = i915_get_ggtt_vma_pages(vma);
> -       if (ret)
> -               return ret;
> -
> -       vma->page_sizes = vma->obj->mm.page_sizes;
> -
> -       return 0;
> -}
> -
>  static void gen6_gmch_remove(struct i915_address_space *vm)
>  {
>         struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
> @@ -950,8 +932,6 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
>
>         ggtt->vm.vma_ops.bind_vma    = ggtt_bind_vma;
>         ggtt->vm.vma_ops.unbind_vma  = ggtt_unbind_vma;
> -       ggtt->vm.vma_ops.set_pages   = ggtt_set_pages;
> -       ggtt->vm.vma_ops.clear_pages = clear_pages;
>
>         ggtt->vm.pte_encode = gen8_ggtt_pte_encode;
>
> @@ -1100,8 +1080,6 @@ static int gen6_gmch_probe(struct i915_ggtt *ggtt)
>
>         ggtt->vm.vma_ops.bind_vma    = ggtt_bind_vma;
>         ggtt->vm.vma_ops.unbind_vma  = ggtt_unbind_vma;
> -       ggtt->vm.vma_ops.set_pages   = ggtt_set_pages;
> -       ggtt->vm.vma_ops.clear_pages = clear_pages;
>
>         return ggtt_probe_common(ggtt, size);
>  }
> @@ -1145,8 +1123,6 @@ static int i915_gmch_probe(struct i915_ggtt *ggtt)
>
>         ggtt->vm.vma_ops.bind_vma    = ggtt_bind_vma;
>         ggtt->vm.vma_ops.unbind_vma  = ggtt_unbind_vma;
> -       ggtt->vm.vma_ops.set_pages   = ggtt_set_pages;
> -       ggtt->vm.vma_ops.clear_pages = clear_pages;
>
>         if (unlikely(ggtt->do_idle_maps))
>                 drm_notice(&i915->drm,
> @@ -1294,324 +1270,3 @@ void i915_ggtt_resume(struct i915_ggtt *ggtt)
>
>         intel_ggtt_restore_fences(ggtt);
>  }
> -
> -static struct scatterlist *
> -rotate_pages(struct drm_i915_gem_object *obj, unsigned int offset,
> -            unsigned int width, unsigned int height,
> -            unsigned int src_stride, unsigned int dst_stride,
> -            struct sg_table *st, struct scatterlist *sg)
> -{
> -       unsigned int column, row;
> -       unsigned int src_idx;
> -
> -       for (column = 0; column < width; column++) {
> -               unsigned int left;
> -
> -               src_idx = src_stride * (height - 1) + column + offset;
> -               for (row = 0; row < height; row++) {
> -                       st->nents++;
> -                       /*
> -                        * We don't need the pages, but need to initialize
> -                        * the entries so the sg list can be happily traversed.
> -                        * The only thing we need are DMA addresses.
> -                        */
> -                       sg_set_page(sg, NULL, I915_GTT_PAGE_SIZE, 0);
> -                       sg_dma_address(sg) =
> -                               i915_gem_object_get_dma_address(obj, src_idx);
> -                       sg_dma_len(sg) = I915_GTT_PAGE_SIZE;
> -                       sg = sg_next(sg);
> -                       src_idx -= src_stride;
> -               }
> -
> -               left = (dst_stride - height) * I915_GTT_PAGE_SIZE;
> -
> -               if (!left)
> -                       continue;
> -
> -               st->nents++;
> -
> -               /*
> -                * The DE ignores the PTEs for the padding tiles, the sg entry
> -                * here is just a conenience to indicate how many padding PTEs
> -                * to insert at this spot.
> -                */
> -               sg_set_page(sg, NULL, left, 0);
> -               sg_dma_address(sg) = 0;
> -               sg_dma_len(sg) = left;
> -               sg = sg_next(sg);
> -       }
> -
> -       return sg;
> -}
> -
> -static noinline struct sg_table *
> -intel_rotate_pages(struct intel_rotation_info *rot_info,
> -                  struct drm_i915_gem_object *obj)
> -{
> -       unsigned int size = intel_rotation_info_size(rot_info);
> -       struct drm_i915_private *i915 = to_i915(obj->base.dev);
> -       struct sg_table *st;
> -       struct scatterlist *sg;
> -       int ret = -ENOMEM;
> -       int i;
> -
> -       /* Allocate target SG list. */
> -       st = kmalloc(sizeof(*st), GFP_KERNEL);
> -       if (!st)
> -               goto err_st_alloc;
> -
> -       ret = sg_alloc_table(st, size, GFP_KERNEL);
> -       if (ret)
> -               goto err_sg_alloc;
> -
> -       st->nents = 0;
> -       sg = st->sgl;
> -
> -       for (i = 0 ; i < ARRAY_SIZE(rot_info->plane); i++)
> -               sg = rotate_pages(obj, rot_info->plane[i].offset,
> -                                 rot_info->plane[i].width, rot_info->plane[i].height,
> -                                 rot_info->plane[i].src_stride,
> -                                 rot_info->plane[i].dst_stride,
> -                                 st, sg);
> -
> -       return st;
> -
> -err_sg_alloc:
> -       kfree(st);
> -err_st_alloc:
> -
> -       drm_dbg(&i915->drm, "Failed to create rotated mapping for object size %zu! (%ux%u tiles, %u pages)\n",
> -               obj->base.size, rot_info->plane[0].width,
> -               rot_info->plane[0].height, size);
> -
> -       return ERR_PTR(ret);
> -}
> -
> -static struct scatterlist *
> -remap_pages(struct drm_i915_gem_object *obj,
> -           unsigned int offset, unsigned int alignment_pad,
> -           unsigned int width, unsigned int height,
> -           unsigned int src_stride, unsigned int dst_stride,
> -           struct sg_table *st, struct scatterlist *sg)
> -{
> -       unsigned int row;
> -
> -       if (alignment_pad) {
> -               st->nents++;
> -
> -               /*
> -                * The DE ignores the PTEs for the padding tiles, the sg entry
> -                * here is just a convenience to indicate how many padding PTEs
> -                * to insert at this spot.
> -                */
> -               sg_set_page(sg, NULL, alignment_pad * 4096, 0);
> -               sg_dma_address(sg) = 0;
> -               sg_dma_len(sg) = alignment_pad * 4096;
> -               sg = sg_next(sg);
> -       }
> -
> -       for (row = 0; row < height; row++) {
> -               unsigned int left = width * I915_GTT_PAGE_SIZE;
> -
> -               while (left) {
> -                       dma_addr_t addr;
> -                       unsigned int length;
> -
> -                       /*
> -                        * We don't need the pages, but need to initialize
> -                        * the entries so the sg list can be happily traversed.
> -                        * The only thing we need are DMA addresses.
> -                        */
> -
> -                       addr = i915_gem_object_get_dma_address_len(obj, offset, &length);
> -
> -                       length = min(left, length);
> -
> -                       st->nents++;
> -
> -                       sg_set_page(sg, NULL, length, 0);
> -                       sg_dma_address(sg) = addr;
> -                       sg_dma_len(sg) = length;
> -                       sg = sg_next(sg);
> -
> -                       offset += length / I915_GTT_PAGE_SIZE;
> -                       left -= length;
> -               }
> -
> -               offset += src_stride - width;
> -
> -               left = (dst_stride - width) * I915_GTT_PAGE_SIZE;
> -
> -               if (!left)
> -                       continue;
> -
> -               st->nents++;
> -
> -               /*
> -                * The DE ignores the PTEs for the padding tiles, the sg entry
> -                * here is just a conenience to indicate how many padding PTEs
> -                * to insert at this spot.
> -                */
> -               sg_set_page(sg, NULL, left, 0);
> -               sg_dma_address(sg) = 0;
> -               sg_dma_len(sg) = left;
> -               sg = sg_next(sg);
> -       }
> -
> -       return sg;
> -}
> -
> -static noinline struct sg_table *
> -intel_remap_pages(struct intel_remapped_info *rem_info,
> -                 struct drm_i915_gem_object *obj)
> -{
> -       unsigned int size = intel_remapped_info_size(rem_info);
> -       struct drm_i915_private *i915 = to_i915(obj->base.dev);
> -       struct sg_table *st;
> -       struct scatterlist *sg;
> -       unsigned int gtt_offset = 0;
> -       int ret = -ENOMEM;
> -       int i;
> -
> -       /* Allocate target SG list. */
> -       st = kmalloc(sizeof(*st), GFP_KERNEL);
> -       if (!st)
> -               goto err_st_alloc;
> -
> -       ret = sg_alloc_table(st, size, GFP_KERNEL);
> -       if (ret)
> -               goto err_sg_alloc;
> -
> -       st->nents = 0;
> -       sg = st->sgl;
> -
> -       for (i = 0 ; i < ARRAY_SIZE(rem_info->plane); i++) {
> -               unsigned int alignment_pad = 0;
> -
> -               if (rem_info->plane_alignment)
> -                       alignment_pad = ALIGN(gtt_offset, rem_info->plane_alignment) - gtt_offset;
> -
> -               sg = remap_pages(obj,
> -                                rem_info->plane[i].offset, alignment_pad,
> -                                rem_info->plane[i].width, rem_info->plane[i].height,
> -                                rem_info->plane[i].src_stride, rem_info->plane[i].dst_stride,
> -                                st, sg);
> -
> -               gtt_offset += alignment_pad +
> -                             rem_info->plane[i].dst_stride * rem_info->plane[i].height;
> -       }
> -
> -       i915_sg_trim(st);
> -
> -       return st;
> -
> -err_sg_alloc:
> -       kfree(st);
> -err_st_alloc:
> -
> -       drm_dbg(&i915->drm, "Failed to create remapped mapping for object size %zu! (%ux%u tiles, %u pages)\n",
> -               obj->base.size, rem_info->plane[0].width,
> -               rem_info->plane[0].height, size);
> -
> -       return ERR_PTR(ret);
> -}
> -
> -static noinline struct sg_table *
> -intel_partial_pages(const struct i915_ggtt_view *view,
> -                   struct drm_i915_gem_object *obj)
> -{
> -       struct sg_table *st;
> -       struct scatterlist *sg, *iter;
> -       unsigned int count = view->partial.size;
> -       unsigned int offset;
> -       int ret = -ENOMEM;
> -
> -       st = kmalloc(sizeof(*st), GFP_KERNEL);
> -       if (!st)
> -               goto err_st_alloc;
> -
> -       ret = sg_alloc_table(st, count, GFP_KERNEL);
> -       if (ret)
> -               goto err_sg_alloc;
> -
> -       iter = i915_gem_object_get_sg_dma(obj, view->partial.offset, &offset);
> -       GEM_BUG_ON(!iter);
> -
> -       sg = st->sgl;
> -       st->nents = 0;
> -       do {
> -               unsigned int len;
> -
> -               len = min(sg_dma_len(iter) - (offset << PAGE_SHIFT),
> -                         count << PAGE_SHIFT);
> -               sg_set_page(sg, NULL, len, 0);
> -               sg_dma_address(sg) =
> -                       sg_dma_address(iter) + (offset << PAGE_SHIFT);
> -               sg_dma_len(sg) = len;
> -
> -               st->nents++;
> -               count -= len >> PAGE_SHIFT;
> -               if (count == 0) {
> -                       sg_mark_end(sg);
> -                       i915_sg_trim(st); /* Drop any unused tail entries. */
> -
> -                       return st;
> -               }
> -
> -               sg = __sg_next(sg);
> -               iter = __sg_next(iter);
> -               offset = 0;
> -       } while (1);
> -
> -err_sg_alloc:
> -       kfree(st);
> -err_st_alloc:
> -       return ERR_PTR(ret);
> -}
> -
> -static int
> -i915_get_ggtt_vma_pages(struct i915_vma *vma)
> -{
> -       int ret;
> -
> -       /*
> -        * The vma->pages are only valid within the lifespan of the borrowed
> -        * obj->mm.pages. When the obj->mm.pages sg_table is regenerated, so
> -        * must be the vma->pages. A simple rule is that vma->pages must only
> -        * be accessed when the obj->mm.pages are pinned.
> -        */
> -       GEM_BUG_ON(!i915_gem_object_has_pinned_pages(vma->obj));
> -
> -       switch (vma->ggtt_view.type) {
> -       default:
> -               GEM_BUG_ON(vma->ggtt_view.type);
> -               fallthrough;
> -       case I915_GGTT_VIEW_NORMAL:
> -               vma->pages = vma->obj->mm.pages;
> -               return 0;
> -
> -       case I915_GGTT_VIEW_ROTATED:
> -               vma->pages =
> -                       intel_rotate_pages(&vma->ggtt_view.rotated, vma->obj);
> -               break;
> -
> -       case I915_GGTT_VIEW_REMAPPED:
> -               vma->pages =
> -                       intel_remap_pages(&vma->ggtt_view.remapped, vma->obj);
> -               break;
> -
> -       case I915_GGTT_VIEW_PARTIAL:
> -               vma->pages = intel_partial_pages(&vma->ggtt_view, vma->obj);
> -               break;
> -       }
> -
> -       ret = 0;
> -       if (IS_ERR(vma->pages)) {
> -               ret = PTR_ERR(vma->pages);
> -               vma->pages = NULL;
> -               drm_err(&vma->vm->i915->drm,
> -                       "Failed to get pages for VMA view type %u (%d)!\n",
> -                       vma->ggtt_view.type, ret);
> -       }
> -       return ret;
> -}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 67d14afa6623..12eed5fcb17a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -221,19 +221,6 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>         INIT_LIST_HEAD(&vm->bound_list);
>  }
>
> -void clear_pages(struct i915_vma *vma)
> -{
> -       GEM_BUG_ON(!vma->pages);
> -
> -       if (vma->pages != vma->obj->mm.pages) {
> -               sg_free_table(vma->pages);
> -               kfree(vma->pages);
> -       }
> -       vma->pages = NULL;
> -
> -       memset(&vma->page_sizes, 0, sizeof(vma->page_sizes));
> -}
> -
>  void *__px_vaddr(struct drm_i915_gem_object *p)
>  {
>         enum i915_map_type type;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index bc6750263359..306e7645fdc5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -206,9 +206,6 @@ struct i915_vma_ops {
>          */
>         void (*unbind_vma)(struct i915_address_space *vm,
>                            struct i915_vma *vma);
> -
> -       int (*set_pages)(struct i915_vma *vma);
> -       void (*clear_pages)(struct i915_vma *vma);
>  };
>
>  struct i915_address_space {
> @@ -594,10 +591,6 @@ release_pd_entry(struct i915_page_directory * const pd,
>                  const struct drm_i915_gem_object * const scratch);
>  void gen6_ggtt_invalidate(struct i915_ggtt *ggtt);
>
> -int ggtt_set_pages(struct i915_vma *vma);
> -int ppgtt_set_pages(struct i915_vma *vma);
> -void clear_pages(struct i915_vma *vma);
> -
>  void ppgtt_bind_vma(struct i915_address_space *vm,
>                     struct i915_vm_pt_stash *stash,
>                     struct i915_vma *vma,
> diff --git a/drivers/gpu/drm/i915/gt/intel_ppgtt.c b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> index 4396bfd630d8..083b3090c69c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ppgtt.c
> @@ -289,16 +289,6 @@ void i915_vm_free_pt_stash(struct i915_address_space *vm,
>         }
>  }
>
> -int ppgtt_set_pages(struct i915_vma *vma)
> -{
> -       GEM_BUG_ON(vma->pages);
> -
> -       vma->pages = vma->obj->mm.pages;
> -       vma->page_sizes = vma->obj->mm.page_sizes;
> -
> -       return 0;
> -}
> -
>  void ppgtt_init(struct i915_ppgtt *ppgtt, struct intel_gt *gt,
>                 unsigned long lmem_pt_obj_flags)
>  {
> @@ -315,6 +305,4 @@ void ppgtt_init(struct i915_ppgtt *ppgtt, struct intel_gt *gt,
>
>         ppgtt->vm.vma_ops.bind_vma    = ppgtt_bind_vma;
>         ppgtt->vm.vma_ops.unbind_vma  = ppgtt_unbind_vma;
> -       ppgtt->vm.vma_ops.set_pages   = ppgtt_set_pages;
> -       ppgtt->vm.vma_ops.clear_pages = clear_pages;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index ac09b685678a..bacc8d68e495 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -112,7 +112,6 @@ vma_create(struct drm_i915_gem_object *obj,
>                 return ERR_PTR(-ENOMEM);
>
>         kref_init(&vma->ref);
> -       mutex_init(&vma->pages_mutex);
>         vma->vm = i915_vm_get(vm);
>         vma->ops = &vm->vma_ops;
>         vma->obj = obj;
> @@ -789,10 +788,343 @@ static bool try_qad_pin(struct i915_vma *vma, unsigned int flags)
>         return pinned;
>  }
>
> -static int vma_get_pages(struct i915_vma *vma)
> +
> +
> +static struct scatterlist *
> +rotate_pages(struct drm_i915_gem_object *obj, unsigned int offset,
> +            unsigned int width, unsigned int height,
> +            unsigned int src_stride, unsigned int dst_stride,
> +            struct sg_table *st, struct scatterlist *sg)
>  {
> -       int err = 0;
> -       bool pinned_pages = true;
> +       unsigned int column, row;
> +       unsigned int src_idx;
> +
> +       for (column = 0; column < width; column++) {
> +               unsigned int left;
> +
> +               src_idx = src_stride * (height - 1) + column + offset;
> +               for (row = 0; row < height; row++) {
> +                       st->nents++;
> +                       /*
> +                        * We don't need the pages, but need to initialize
> +                        * the entries so the sg list can be happily traversed.
> +                        * The only thing we need are DMA addresses.
> +                        */
> +                       sg_set_page(sg, NULL, I915_GTT_PAGE_SIZE, 0);
> +                       sg_dma_address(sg) =
> +                               i915_gem_object_get_dma_address(obj, src_idx);
> +                       sg_dma_len(sg) = I915_GTT_PAGE_SIZE;
> +                       sg = sg_next(sg);
> +                       src_idx -= src_stride;
> +               }
> +
> +               left = (dst_stride - height) * I915_GTT_PAGE_SIZE;
> +
> +               if (!left)
> +                       continue;
> +
> +               st->nents++;
> +
> +               /*
> +                * The DE ignores the PTEs for the padding tiles, the sg entry
> +                * here is just a conenience to indicate how many padding PTEs
> +                * to insert at this spot.
> +                */
> +               sg_set_page(sg, NULL, left, 0);
> +               sg_dma_address(sg) = 0;
> +               sg_dma_len(sg) = left;
> +               sg = sg_next(sg);
> +       }
> +
> +       return sg;
> +}
> +
> +static noinline struct sg_table *
> +intel_rotate_pages(struct intel_rotation_info *rot_info,
> +                  struct drm_i915_gem_object *obj)
> +{
> +       unsigned int size = intel_rotation_info_size(rot_info);
> +       struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +       struct sg_table *st;
> +       struct scatterlist *sg;
> +       int ret = -ENOMEM;
> +       int i;
> +
> +       /* Allocate target SG list. */
> +       st = kmalloc(sizeof(*st), GFP_KERNEL);
> +       if (!st)
> +               goto err_st_alloc;
> +
> +       ret = sg_alloc_table(st, size, GFP_KERNEL);
> +       if (ret)
> +               goto err_sg_alloc;
> +
> +       st->nents = 0;
> +       sg = st->sgl;
> +
> +       for (i = 0 ; i < ARRAY_SIZE(rot_info->plane); i++)
> +               sg = rotate_pages(obj, rot_info->plane[i].offset,
> +                                 rot_info->plane[i].width, rot_info->plane[i].height,
> +                                 rot_info->plane[i].src_stride,
> +                                 rot_info->plane[i].dst_stride,
> +                                 st, sg);
> +
> +       return st;
> +
> +err_sg_alloc:
> +       kfree(st);
> +err_st_alloc:
> +
> +       drm_dbg(&i915->drm, "Failed to create rotated mapping for object size %zu! (%ux%u tiles, %u pages)\n",
> +               obj->base.size, rot_info->plane[0].width,
> +               rot_info->plane[0].height, size);
> +
> +       return ERR_PTR(ret);
> +}
> +
> +static struct scatterlist *
> +remap_pages(struct drm_i915_gem_object *obj,
> +           unsigned int offset, unsigned int alignment_pad,
> +           unsigned int width, unsigned int height,
> +           unsigned int src_stride, unsigned int dst_stride,
> +           struct sg_table *st, struct scatterlist *sg)
> +{
> +       unsigned int row;
> +
> +       if (alignment_pad) {
> +               st->nents++;
> +
> +               /*
> +                * The DE ignores the PTEs for the padding tiles, the sg entry
> +                * here is just a convenience to indicate how many padding PTEs
> +                * to insert at this spot.
> +                */
> +               sg_set_page(sg, NULL, alignment_pad * 4096, 0);
> +               sg_dma_address(sg) = 0;
> +               sg_dma_len(sg) = alignment_pad * 4096;
> +               sg = sg_next(sg);
> +       }
> +
> +       for (row = 0; row < height; row++) {
> +               unsigned int left = width * I915_GTT_PAGE_SIZE;
> +
> +               while (left) {
> +                       dma_addr_t addr;
> +                       unsigned int length;
> +
> +                       /*
> +                        * We don't need the pages, but need to initialize
> +                        * the entries so the sg list can be happily traversed.
> +                        * The only thing we need are DMA addresses.
> +                        */
> +
> +                       addr = i915_gem_object_get_dma_address_len(obj, offset, &length);
> +
> +                       length = min(left, length);
> +
> +                       st->nents++;
> +
> +                       sg_set_page(sg, NULL, length, 0);
> +                       sg_dma_address(sg) = addr;
> +                       sg_dma_len(sg) = length;
> +                       sg = sg_next(sg);
> +
> +                       offset += length / I915_GTT_PAGE_SIZE;
> +                       left -= length;
> +               }
> +
> +               offset += src_stride - width;
> +
> +               left = (dst_stride - width) * I915_GTT_PAGE_SIZE;
> +
> +               if (!left)
> +                       continue;
> +
> +               st->nents++;
> +
> +               /*
> +                * The DE ignores the PTEs for the padding tiles, the sg entry
> +                * here is just a conenience to indicate how many padding PTEs
> +                * to insert at this spot.
> +                */
> +               sg_set_page(sg, NULL, left, 0);
> +               sg_dma_address(sg) = 0;
> +               sg_dma_len(sg) = left;
> +               sg = sg_next(sg);
> +       }
> +
> +       return sg;
> +}
> +
> +static noinline struct sg_table *
> +intel_remap_pages(struct intel_remapped_info *rem_info,
> +                 struct drm_i915_gem_object *obj)
> +{
> +       unsigned int size = intel_remapped_info_size(rem_info);
> +       struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +       struct sg_table *st;
> +       struct scatterlist *sg;
> +       unsigned int gtt_offset = 0;
> +       int ret = -ENOMEM;
> +       int i;
> +
> +       /* Allocate target SG list. */
> +       st = kmalloc(sizeof(*st), GFP_KERNEL);
> +       if (!st)
> +               goto err_st_alloc;
> +
> +       ret = sg_alloc_table(st, size, GFP_KERNEL);
> +       if (ret)
> +               goto err_sg_alloc;
> +
> +       st->nents = 0;
> +       sg = st->sgl;
> +
> +       for (i = 0 ; i < ARRAY_SIZE(rem_info->plane); i++) {
> +               unsigned int alignment_pad = 0;
> +
> +               if (rem_info->plane_alignment)
> +                       alignment_pad = ALIGN(gtt_offset, rem_info->plane_alignment) - gtt_offset;
> +
> +               sg = remap_pages(obj,
> +                                rem_info->plane[i].offset, alignment_pad,
> +                                rem_info->plane[i].width, rem_info->plane[i].height,
> +                                rem_info->plane[i].src_stride, rem_info->plane[i].dst_stride,
> +                                st, sg);
> +
> +               gtt_offset += alignment_pad +
> +                             rem_info->plane[i].dst_stride * rem_info->plane[i].height;
> +       }
> +
> +       i915_sg_trim(st);
> +
> +       return st;
> +
> +err_sg_alloc:
> +       kfree(st);
> +err_st_alloc:
> +
> +       drm_dbg(&i915->drm, "Failed to create remapped mapping for object size %zu! (%ux%u tiles, %u pages)\n",
> +               obj->base.size, rem_info->plane[0].width,
> +               rem_info->plane[0].height, size);
> +
> +       return ERR_PTR(ret);
> +}
> +
> +static noinline struct sg_table *
> +intel_partial_pages(const struct i915_ggtt_view *view,
> +                   struct drm_i915_gem_object *obj)
> +{
> +       struct sg_table *st;
> +       struct scatterlist *sg, *iter;
> +       unsigned int count = view->partial.size;
> +       unsigned int offset;
> +       int ret = -ENOMEM;
> +
> +       st = kmalloc(sizeof(*st), GFP_KERNEL);
> +       if (!st)
> +               goto err_st_alloc;
> +
> +       ret = sg_alloc_table(st, count, GFP_KERNEL);
> +       if (ret)
> +               goto err_sg_alloc;
> +
> +       iter = i915_gem_object_get_sg_dma(obj, view->partial.offset, &offset);
> +       GEM_BUG_ON(!iter);
> +
> +       sg = st->sgl;
> +       st->nents = 0;
> +       do {
> +               unsigned int len;
> +
> +               len = min(sg_dma_len(iter) - (offset << PAGE_SHIFT),
> +                         count << PAGE_SHIFT);
> +               sg_set_page(sg, NULL, len, 0);
> +               sg_dma_address(sg) =
> +                       sg_dma_address(iter) + (offset << PAGE_SHIFT);
> +               sg_dma_len(sg) = len;
> +
> +               st->nents++;
> +               count -= len >> PAGE_SHIFT;
> +               if (count == 0) {
> +                       sg_mark_end(sg);
> +                       i915_sg_trim(st); /* Drop any unused tail entries. */
> +
> +                       return st;
> +               }
> +
> +               sg = __sg_next(sg);
> +               iter = __sg_next(iter);
> +               offset = 0;
> +       } while (1);
> +
> +err_sg_alloc:
> +       kfree(st);
> +err_st_alloc:
> +       return ERR_PTR(ret);
> +}
> +
> +static int
> +__i915_vma_get_pages(struct i915_vma *vma)
> +{
> +       struct sg_table *pages;
> +       int ret;
> +
> +       /*
> +        * The vma->pages are only valid within the lifespan of the borrowed
> +        * obj->mm.pages. When the obj->mm.pages sg_table is regenerated, so
> +        * must be the vma->pages. A simple rule is that vma->pages must only
> +        * be accessed when the obj->mm.pages are pinned.
> +        */
> +       GEM_BUG_ON(!i915_gem_object_has_pinned_pages(vma->obj));
> +
> +       switch (vma->ggtt_view.type) {
> +       default:
> +               GEM_BUG_ON(vma->ggtt_view.type);
> +               fallthrough;
> +       case I915_GGTT_VIEW_NORMAL:
> +               pages = vma->obj->mm.pages;
> +               break;
> +
> +       case I915_GGTT_VIEW_ROTATED:
> +               pages =
> +                       intel_rotate_pages(&vma->ggtt_view.rotated, vma->obj);
> +               break;
> +
> +       case I915_GGTT_VIEW_REMAPPED:
> +               pages =
> +                       intel_remap_pages(&vma->ggtt_view.remapped, vma->obj);
> +               break;
> +
> +       case I915_GGTT_VIEW_PARTIAL:
> +               pages = intel_partial_pages(&vma->ggtt_view, vma->obj);
> +               break;
> +       }
> +
> +       ret = 0;
> +       /* gen6 ppgtt doesn't have backing pages, special-case it */
> +       if (IS_ERR(pages) && pages != ERR_PTR(-ENODEV)) {

Where does this -ENODEV come from? AFAIK for the gen6 thing mm.pages =
ZERO_SIZE_PTR. Also, just checking, I assume we always hit the
VIEW_NORMAL for that?

> +               ret = PTR_ERR(pages);
> +               pages = NULL;
> +               drm_err(&vma->vm->i915->drm,
> +                       "Failed to get pages for VMA view type %u (%d)!\n",
> +                       vma->ggtt_view.type, ret);

Can we just return here?

> +       }
> +
> +       pages = xchg(&vma->pages, pages);
> +
> +       /* did we race against a put_pages? */
> +       if (pages && pages != vma->obj->mm.pages) {
> +               sg_free_table(vma->pages);
> +               kfree(vma->pages);
> +       }

What is this race exactly, can we add some more details here please?
So we can more easily evaluate the lockless trickery here.
