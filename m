Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A0B41FE6B
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 00:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4E56E856;
	Sat,  2 Oct 2021 22:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C8C6E856
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 22:15:16 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id j5so49064689lfg.8
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 15:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BZxhj82TeUgKdxCA6a8dGgWVd+NHXGpfykUzRbqV5hM=;
 b=YD8S9jJCl4b/QpLMQQNscbWUrxWjo9yJrENK4At1wsD2hCkezezQlZ4c6q2bje4foX
 hlyF4hqpWHrYe/Oe2Wqfouo5VswfmlrlJ281bPk0trxi4Jg52yzjYmLThMphXovdZ6Bi
 owt5wQnilp4Voz5F4DAGVB2I5RbeLbC3dPd4lVlxSKh+iqbsANC9nwuF75sEEYBvxJ8R
 f4I7TbULYFLllIapac2cKIsLWF0OpJDgwMGwqXHWxwKBkyuDXqiYRcjZH+N+A67wZxzC
 HbmCgOlupxr+6pAv0MksMum0TASZYpUOo0MFmA2K6itRc1xiocP9uLb0oHDQDBVwghfa
 JUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BZxhj82TeUgKdxCA6a8dGgWVd+NHXGpfykUzRbqV5hM=;
 b=IEg6SfNP49SIqSPOwss1U2lCnS1/6z4Ij8JykuYR7ifMxnyUAG8at7icf2leOBIFhO
 J9lf7W24spL93hbP8lXgWKTdo8EAZMFsRGGMOej6AETTTcj2ho49rjM1t+tnO5mc29fs
 thO/MqLqWLirw1okyoatMd3QSkE+2WgOELVxUKEKAX+UJfib/DRxxAZ3wOoihKeJHp4W
 byAjxqi0V2BAMa80L0Ih2qo3UmFk7uIlk3pzEEFkmqBXolbtKbe2hPoMwgubTfy5sevg
 s9nFZL0J53Uw1xbezq9b2avlDfmGLJp1p1s+iVUzS8yD/+fqyFQc5sFoHjn7igOr7XPH
 WKzQ==
X-Gm-Message-State: AOAM5332AVftQWi4W3OpGCj0xUlBhRoioZSq2N10bAkd48v81CJ5BnzL
 sMGSQS8J/KEFW0CSMkuft20KGP6QqZxQQzV9d30=
X-Google-Smtp-Source: ABdhPJwo7gf9vSOwYB6pkUOb+pBWHeSJqoJKFd/oJD70fQpKTKk9RCYDbfsdtzxLl7oU7D0VElFSoWp2eoTBvY+/6tk=
X-Received: by 2002:a2e:9d84:: with SMTP id c4mr5933193ljj.14.1633212914407;
 Sat, 02 Oct 2021 15:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210928084446.22580-1-tzimmermann@suse.de>
 <20210928084446.22580-9-tzimmermann@suse.de>
In-Reply-To: <20210928084446.22580-9-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sun, 3 Oct 2021 00:15:03 +0200
Message-ID: <CAMeQTsa8t5rSA4uD2y7QrNduN3QQX2wxjW2Ub=YkpcvgGDBv-Q@mail.gmail.com>
Subject: Re: [PATCH 08/10] drm/gma500: Set page-caching flags in GEM pin/unpin
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

On Tue, Sep 28, 2021 at 10:44 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Caching of the GEM object's backing pages are unrelated to GTT
> management. Move the respective calls from GTT code to GEM code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/gma500/gem.c |  9 ++++++++-
>  drivers/gpu/drm/gma500/gtt.c | 17 ++---------------
>  drivers/gpu/drm/gma500/gtt.h |  2 +-
>  3 files changed, 11 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
> index 46209e10dcc2..a88d51a3aa2a 100644
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
> @@ -39,7 +41,9 @@ int psb_gem_pin(struct gtt_range *gt)
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
> @@ -80,6 +84,9 @@ void psb_gem_unpin(struct gtt_range *gt)
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

I don't quite remember why we have this but I suspect something bad
happened when setting WC on a page with WC already set. Did you try
hibernation?

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
