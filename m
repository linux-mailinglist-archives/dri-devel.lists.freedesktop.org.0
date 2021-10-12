Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC5642A63E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 15:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA72989F38;
	Tue, 12 Oct 2021 13:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D50E89F24
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 13:42:37 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id p16so17255023lfa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 06:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qqajx6549Xl+aJTYDydzhBgpwPhPQRUrH4V9QQrXI7Y=;
 b=gZE6MFluG52R+XOZEKJ8vBiXiVzzxu3iKc98Q9bNpDzQAmUBTlEpaH/xwfn7tBMkOE
 My1U6nkMFkxl0kYReQhtLgUbrz5anIs1XVvhIHp0eoCuc6gsLHE5g2rpj/5Wmc8Gf4ee
 UKOoKo5Ra/afY31z69XtafzVFbTbGk+p31c7HPhgDwDg8SFNGbrTgqLyRuEkQmO3P66I
 pfsHq+CCUk2XCxDq6P695HPXImgVO9LKkHHKAW0S6XLPV5hY2J9nrMHfHeF+jt9JPFBw
 79w9a2h+r4t/gCJ8a3XE3Dei9F8Qq8sjOAEi93m50zzAYWqIF80sI4v/xKnOyYCVqW1g
 E82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qqajx6549Xl+aJTYDydzhBgpwPhPQRUrH4V9QQrXI7Y=;
 b=AcLCLeslcOv8Rf6WZh4COOAVHk8k+rj/RNb3MFvwSC1Fzpbh54IZEY9g/yzn60v0Eq
 4xMB+5PY4VGWh6jhiIHnZ29IOARnWGYhE94vjpaDwOMU2xZYRm+wRHDaMTaIDnLf5LjQ
 wR3TEj9Id7pCSn1ekF6zGTPCanh/4GO87b4HQpSZXfTyGwHWYSMDBZF5NBLQFlCSRwfE
 psEuxq0IygrabPErgUVX4Is2xJxQCxKw51qRMA8uVNXV40KnPxoPa1QSZg5hXEQ8pqje
 7GQKHSxgEy3Mjd9hxKNHD3A8bsWZID4avMynGSLY+TLTVFmAtwL413eMyvsP23s4MUeW
 3cpw==
X-Gm-Message-State: AOAM531u9hFIl8lhPliwNBT01ZnNiV+KfJCjeqx1lAg42Yxhb3rdfOW/
 FnHtHx7BlzXLoDYxseduxLDQvm4moK4+qXx0e0k=
X-Google-Smtp-Source: ABdhPJzW2YPe/ibbg45JinoX1Bm2trnFbGcO7Kg+b/uZwjBDxKPxgvKUU25uR5RjI5fV6WdCwBwyzJHiMKrm3arUVjc=
X-Received: by 2002:a2e:95c4:: with SMTP id y4mr28717752ljh.0.1634046155565;
 Tue, 12 Oct 2021 06:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211005081151.23612-1-tzimmermann@suse.de>
 <20211005081151.23612-9-tzimmermann@suse.de>
In-Reply-To: <20211005081151.23612-9-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 12 Oct 2021 15:42:24 +0200
Message-ID: <CAMeQTsbBcF6BEYYq0idVxjMkVM-4jBZcoAKbosrQqgo_Lszgjw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] drm/gma500: Set page-caching flags in GEM
 pin/unpin
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Tue, Oct 5, 2021 at 10:11 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Caching of the GEM object's backing pages are unrelated to GTT
> management. Move the respective calls from GTT code to GEM code.
>

I gave suspend/resume a try and it seems fine so
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/gma500/gem.c |  9 ++++++++-
>  drivers/gpu/drm/gma500/gtt.c | 17 ++---------------
>  drivers/gpu/drm/gma500/gtt.h |  2 +-
>  3 files changed, 11 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index 425d183c76ca..def26d9ce89d 100644
> --- a/drivers/gpu/drm/gma500/gem.c
> +++ b/drivers/gpu/drm/gma500/gem.c
> @@ -13,6 +13,8 @@
>
>  #include <linux/pagemap.h>
>
> +#include <asm/set_memory.h>
> +
>  #include <drm/drm.h>
>  #include <drm/drm_vma_manager.h>
>
> @@ -41,7 +43,9 @@ int psb_gem_pin(struct gtt_range *gt)
>
>         npages = gt->gem.size / PAGE_SIZE;
>
> -       ret = psb_gtt_insert(dev, gt, 0);
> +       set_pages_array_wc(pages, npages);
> +
> +       ret = psb_gtt_insert(dev, gt);
>         if (ret)
>                 goto err_drm_gem_put_pages;
>
> @@ -84,6 +88,9 @@ void psb_gem_unpin(struct gtt_range *gt)
>                                      (gpu_base + gt->offset), gt->npage, 0, 0);
>         psb_gtt_remove(dev, gt);
>
> +       /* Reset caching flags */
> +       set_pages_array_wb(gt->pages, gt->npage);
> +
>         drm_gem_put_pages(&gt->gem, gt->pages, true, false);
>         gt->pages = NULL;
>
> diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
> index 5d940fdbe6b8..244de618e612 100644
> --- a/drivers/gpu/drm/gma500/gtt.c
> +++ b/drivers/gpu/drm/gma500/gtt.c
> @@ -7,10 +7,6 @@
>   *         Alan Cox <alan@linux.intel.com>
>   */
>
> -#include <linux/shmem_fs.h>
> -
> -#include <asm/set_memory.h>
> -
>  #include "psb_drv.h"
>
>
> @@ -92,17 +88,15 @@ static u32 __iomem *psb_gtt_entry(struct drm_device *dev, struct gtt_range *r)
>   *     psb_gtt_insert  -       put an object into the GTT
>   *     @dev: our DRM device
>   *     @r: our GTT range
> - *     @resume: on resume
>   *
>   *     Take our preallocated GTT range and insert the GEM object into
>   *     the GTT. This is protected via the gtt mutex which the caller
>   *     must hold.
>   */
> -int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r, int resume)
> +int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r)
>  {
>         u32 __iomem *gtt_slot;
>         u32 pte;
> -       struct page **pages;
>         int i;
>
>         if (r->pages == NULL) {
> @@ -113,12 +107,6 @@ int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r, int resume)
>         WARN_ON(r->stolen);     /* refcount these maybe ? */
>
>         gtt_slot = psb_gtt_entry(dev, r);
> -       pages = r->pages;
> -
> -       if (!resume) {
> -               /* Make sure changes are visible to the GPU */
> -               set_pages_array_wc(pages, r->npage);
> -       }
>
>         /* Write our page entries into the GTT itself */
>         for (i = 0; i < r->npage; i++) {
> @@ -158,7 +146,6 @@ void psb_gtt_remove(struct drm_device *dev, struct gtt_range *r)
>         for (i = 0; i < r->npage; i++)
>                 iowrite32(pte, gtt_slot++);
>         ioread32(gtt_slot - 1);
> -       set_pages_array_wb(r->pages, r->npage);
>  }
>
>  static void psb_gtt_alloc(struct drm_device *dev)
> @@ -349,7 +336,7 @@ int psb_gtt_restore(struct drm_device *dev)
>         while (r != NULL) {
>                 range = container_of(r, struct gtt_range, resource);
>                 if (range->pages) {
> -                       psb_gtt_insert(dev, range, 1);
> +                       psb_gtt_insert(dev, range);
>                         size += range->resource.end - range->resource.start;
>                         restored++;
>                 }
> diff --git a/drivers/gpu/drm/gma500/gtt.h b/drivers/gpu/drm/gma500/gtt.h
> index 459a03141e8b..7af71617e0c5 100644
> --- a/drivers/gpu/drm/gma500/gtt.h
> +++ b/drivers/gpu/drm/gma500/gtt.h
> @@ -49,7 +49,7 @@ int psb_gtt_allocate_resource(struct drm_psb_private *pdev, struct resource *res
>                               const char *name, resource_size_t size, resource_size_t align,
>                               bool stolen, u32 offset[static 1]);
>
> -int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r, int resume);
> +int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r);
>  void psb_gtt_remove(struct drm_device *dev, struct gtt_range *r);
>
>  #endif
> --
> 2.33.0
>
