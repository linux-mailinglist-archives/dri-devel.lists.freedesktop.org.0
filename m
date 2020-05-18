Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8A61D6E98
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 03:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B4C6E18F;
	Mon, 18 May 2020 01:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6371D6E18F;
 Mon, 18 May 2020 01:27:24 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k12so7622058wmj.3;
 Sun, 17 May 2020 18:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uZfH/yW2EkwOl9gEcet4jN7ZXi9BLKHqqQrfr1sC6ac=;
 b=vDcWgigWf+8ZKsquN2u4JqfQ8umHJX5fe46rUTGhJECREweESiSfWnUn0R+kFnVYzL
 Po+JjR2lydKpGPNuAuKUfwyrCt05L9FE2SiboNT/Di3jcIyohybAZ7DEy0Rfme5FXmov
 hLdWtACwrYRBlLG0QN8oUbUrydmDczxFu2izF8ScEASNprtdB5wc/pnUdJmba6hRwV9n
 aHCMGNU+KjzWjQTSpCRhc4bWnVvgd0rJg1YDnGNoSnyOoDtovxLu56C1biuKkr+dRjvW
 tJZ3MvsoObtcyH+Pvwi+VeXvwxYehRqFZ5a/TM/TAH2YVIfFH9U6+mtgTNk5l3SnaaaD
 oGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uZfH/yW2EkwOl9gEcet4jN7ZXi9BLKHqqQrfr1sC6ac=;
 b=bAG04CbW5TYlW+Gg4fEBEhPkG61ydPl7YWZwW8f9mgCEm5tmaWPQkjtvPQLn/g3ISh
 2hwu99aPYgIGZ8XscJWc4UXBaOLMr9LrdAc3wieMX15NPuYnDSZ8GI9TKlW/FRRYXUZH
 lbHd2atbhbyvHImybTsZLUuCYB+GtC2eFTfCBmVluIRpTZgO4Yoqjjsvw4CYuBUv3aRz
 kXlQ4eQZbgO1d64/uQ/Ade993NY1wxVr9pPbYPGh7SvO+2RO1vggmpW2ZErMet6c5ElA
 vef+2GLJiX24kMY1oqizrm78PQ6Zm81XUmsRcpjynFBla9QAsuT51dNAFak+Zzq76CwQ
 P88Q==
X-Gm-Message-State: AOAM532EokRbRnOFsyWAdyIUEn16nORSJteFQ9sQqbBpCoAryE2ufOtf
 bfwk0bYuYFb6AwXmQU3celb5aX4EvjOQdp4b3uE=
X-Google-Smtp-Source: ABdhPJwYXjut1W+agJe7qHIAazerG/VY4Qh5rG0NKf6TSwEA+kmhHmC2ZVellCufA3F7oGA23ea+FfJqOJUfr5uzS0A=
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr17035637wmm.67.1589765242888; 
 Sun, 17 May 2020 18:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <CGME20200513133305eucas1p15187ed8fa1e4af181cafa5c65ddab4cd@eucas1p1.samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <20200513133245.6408-13-m.szyprowski@samsung.com>
In-Reply-To: <20200513133245.6408-13-m.szyprowski@samsung.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 18 May 2020 09:27:11 +0800
Message-ID: <CAKGbVbsSPhQY5zEBGPQtyhLu38w=Hw73OQr6UiV_dHC46DescQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/38] drm: lima: fix common struct sg_table related
 issues
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: lima@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks good for me, patch is:
Reviewed-by: Qiang Yu <yuq825@gmail.com>

Regards,
Qiang

On Wed, May 13, 2020 at 9:33 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
> returns the number of the created entries in the DMA address space.
> However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
> dma_unmap_sg must be called with the original number of the entries
> passed to the dma_map_sg().
>
> struct sg_table is a common structure used for describing a non-contiguous
> memory buffer, used commonly in the DRM and graphics subsystems. It
> consists of a scatterlist with memory pages and DMA addresses (sgl entry),
> as well as the number of scatterlist entries: CPU pages (orig_nents entry)
> and DMA mapped pages (nents entry).
>
> It turned out that it was a common mistake to misuse nents and orig_nents
> entries, calling DMA-mapping functions with a wrong number of entries or
> ignoring the number of mapped entries returned by the dma_map_sg()
> function.
>
> To avoid such issues, lets use a common dma-mapping wrappers operating
> directly on the struct sg_table objects and use scatterlist page
> iterators where possible. This, almost always, hides references to the
> nents and orig_nents entries, making the code robust, easier to follow
> and copy/paste safe.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
> vs. orig_nents misuse' thread:
> https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
> ---
>  drivers/gpu/drm/lima/lima_gem.c | 11 ++++++++---
>  drivers/gpu/drm/lima/lima_vm.c  |  5 ++---
>  2 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
> index 5404e0d..cda43f6 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -69,8 +69,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
>                 return ret;
>
>         if (bo->base.sgt) {
> -               dma_unmap_sg(dev, bo->base.sgt->sgl,
> -                            bo->base.sgt->nents, DMA_BIDIRECTIONAL);
> +               dma_unmap_sgtable(dev, bo->base.sgt, DMA_BIDIRECTIONAL, 0);
>                 sg_free_table(bo->base.sgt);
>         } else {
>                 bo->base.sgt = kmalloc(sizeof(*bo->base.sgt), GFP_KERNEL);
> @@ -80,7 +79,13 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
>                 }
>         }
>
> -       dma_map_sg(dev, sgt.sgl, sgt.nents, DMA_BIDIRECTIONAL);
> +       ret = dma_map_sgtable(dev, &sgt, DMA_BIDIRECTIONAL, 0);
> +       if (ret) {
> +               sg_free_table(&sgt);
> +               kfree(bo->base.sgt);
> +               bo->base.sgt = NULL;
> +               return ret;
> +       }
>
>         *bo->base.sgt = sgt;
>
> diff --git a/drivers/gpu/drm/lima/lima_vm.c b/drivers/gpu/drm/lima/lima_vm.c
> index 5b92fb8..2b2739a 100644
> --- a/drivers/gpu/drm/lima/lima_vm.c
> +++ b/drivers/gpu/drm/lima/lima_vm.c
> @@ -124,7 +124,7 @@ int lima_vm_bo_add(struct lima_vm *vm, struct lima_bo *bo, bool create)
>         if (err)
>                 goto err_out1;
>
> -       for_each_sg_dma_page(bo->base.sgt->sgl, &sg_iter, bo->base.sgt->nents, 0) {
> +       for_each_sgtable_dma_page(bo->base.sgt, &sg_iter, 0) {
>                 err = lima_vm_map_page(vm, sg_page_iter_dma_address(&sg_iter),
>                                        bo_va->node.start + offset);
>                 if (err)
> @@ -298,8 +298,7 @@ int lima_vm_map_bo(struct lima_vm *vm, struct lima_bo *bo, int pageoff)
>         mutex_lock(&vm->lock);
>
>         base = bo_va->node.start + (pageoff << PAGE_SHIFT);
> -       for_each_sg_dma_page(bo->base.sgt->sgl, &sg_iter,
> -                            bo->base.sgt->nents, pageoff) {
> +       for_each_sgtable_dma_page(bo->base.sgt, &sg_iter, pageoff) {
>                 err = lima_vm_map_page(vm, sg_page_iter_dma_address(&sg_iter),
>                                        base + offset);
>                 if (err)
> --
> 1.9.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
