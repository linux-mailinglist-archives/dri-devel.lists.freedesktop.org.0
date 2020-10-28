Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BF729D0C6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 16:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1096E47E;
	Wed, 28 Oct 2020 15:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8466E488
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 15:41:52 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id k3so4620504otp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 08:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V+eNBbGYVRj4sX+Rvx0rEuImdmcFgmABJNYjraj1gTY=;
 b=bQq8XfhFEdLCKY44ABuQsFARgVMLy4BbPIxetpqD0UCUij4TzJSpHq51nKIsia6+YA
 3b/NdbvY7G/wI2QhN0DMgIaMLjElg/9QMs7/7x1CD4K00izok9e9LRRqw5Fwvl4/OPOi
 0C5LYZjsjtK93iWKlMafAaLNoYnfi9l/BV1jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V+eNBbGYVRj4sX+Rvx0rEuImdmcFgmABJNYjraj1gTY=;
 b=G7sQsJsuOgZuO5FC7GFcVHAJRtvF4vovgdB55KtG0h/Utl5DGSPKl4PgvZc5/UiUWb
 AxjbXgUsSABDMBvPx8P+J7EiI51hrdouV1Spz5iI1q+7rfg28DrAgYQcu02YjpE43Xye
 CWlv7iKkvZxo/gWqLq9t1PhWlO7yLw4BQowvcXcLCRjb89mTyuL8N9pPkzDMK9q1z4lG
 Fx/wJk1tPdyj7hK0p6AWjLSZw8vyUJ2+7RiWphBb7icB/smoNNByhIjqXnxkc1Su5ELA
 tyAefBi4kPlpJ/zAQ0AB4xOdas2P5p0OLrxwOc4r5gJaHHqcUpeaUTU0tttWxML2xAw9
 B2Aw==
X-Gm-Message-State: AOAM531/Bdnk928w+Sr0xMUKYBdwsVAJAl5vsixl4i23+8MYj1+COuJr
 lmfQSzFmtLAZ0k70yZgzrIzZsSh8xbXRPsa60eCNuttK+gbvacst
X-Google-Smtp-Source: ABdhPJxMI122d+z6F7n8szbsEqCSLNunOLZaGKAKP20lYQS3tOPM5NFPtMmDFjx+9QSCtCRxj4ROT1qW9VTCO+kYXus=
X-Received: by 2002:a9d:6e81:: with SMTP id a1mr5356692otr.303.1603899712099; 
 Wed, 28 Oct 2020 08:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201028143608.1284-1-patrik.r.jakobsson@gmail.com>
In-Reply-To: <20201028143608.1284-1-patrik.r.jakobsson@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 28 Oct 2020 16:41:40 +0100
Message-ID: <CAKMK7uFLpXoJ-CrgvTd6+akWxQTFxgXb4yMxufwzuStPy=m7dg@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Remove GTT roll support
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 28, 2020 at 3:36 PM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
>
> GTT roll support was used to accelerate fb panning on some machines.
> Unfortunately this never worked properly with multiple monitors and
> caused issues on others where the framebuffer wouldn't fit in stolen
> memory. Let's remove it!
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

btw I tried to figure out whether the accel code is of any use too,
and we don't set FBINFO_HWACCEL_COPYAREA, despite that we have an
accelerated copyarea. So I think we could delete all that code too,
since essentially unused. And aside of fbcon no one is using these
acceleration functions anyway.
-Daniel

>
> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> ---
>  drivers/gpu/drm/gma500/framebuffer.c | 96 ++++------------------------
>  drivers/gpu/drm/gma500/gtt.c         | 52 +--------------
>  drivers/gpu/drm/gma500/gtt.h         |  3 -
>  3 files changed, 14 insertions(+), 137 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
> index 5ede24fb44ae..2d64c58607f5 100644
> --- a/drivers/gpu/drm/gma500/framebuffer.c
> +++ b/drivers/gpu/drm/gma500/framebuffer.c
> @@ -76,27 +76,6 @@ static int psbfb_setcolreg(unsigned regno, unsigned red, unsigned green,
>         return 0;
>  }
>
> -static int psbfb_pan(struct fb_var_screeninfo *var, struct fb_info *info)
> -{
> -       struct drm_fb_helper *fb_helper = info->par;
> -       struct drm_framebuffer *fb = fb_helper->fb;
> -       struct drm_device *dev = fb->dev;
> -       struct gtt_range *gtt = to_gtt_range(fb->obj[0]);
> -
> -       /*
> -        *      We have to poke our nose in here. The core fb code assumes
> -        *      panning is part of the hardware that can be invoked before
> -        *      the actual fb is mapped. In our case that isn't quite true.
> -        */
> -       if (gtt->npage) {
> -               /* GTT roll shifts in 4K pages, we need to shift the right
> -                  number of pages */
> -               int pages = info->fix.line_length >> 12;
> -               psb_gtt_roll(dev, gtt, var->yoffset * pages);
> -       }
> -        return 0;
> -}
> -
>  static vm_fault_t psbfb_vm_fault(struct vm_fault *vmf)
>  {
>         struct vm_area_struct *vma = vmf->vma;
> @@ -176,17 +155,6 @@ static const struct fb_ops psbfb_ops = {
>         .fb_sync = psbfb_sync,
>  };
>
> -static const struct fb_ops psbfb_roll_ops = {
> -       .owner = THIS_MODULE,
> -       DRM_FB_HELPER_DEFAULT_OPS,
> -       .fb_setcolreg = psbfb_setcolreg,
> -       .fb_fillrect = drm_fb_helper_cfb_fillrect,
> -       .fb_copyarea = drm_fb_helper_cfb_copyarea,
> -       .fb_imageblit = drm_fb_helper_cfb_imageblit,
> -       .fb_pan_display = psbfb_pan,
> -       .fb_mmap = psbfb_mmap,
> -};
> -
>  static const struct fb_ops psbfb_unaccel_ops = {
>         .owner = THIS_MODULE,
>         DRM_FB_HELPER_DEFAULT_OPS,
> @@ -312,8 +280,6 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
>         int ret;
>         struct gtt_range *backing;
>         u32 bpp, depth;
> -       int gtt_roll = 0;
> -       int pitch_lines = 0;
>
>         mode_cmd.width = sizes->surface_width;
>         mode_cmd.height = sizes->surface_height;
> @@ -324,50 +290,15 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
>         if (bpp == 24)
>                 bpp = 32;
>
> -       do {
> -               /*
> -                * Acceleration via the GTT requires pitch to be
> -                * power of two aligned. Preferably page but less
> -                * is ok with some fonts
> -                */
> -               mode_cmd.pitches[0] =  ALIGN(mode_cmd.width * ((bpp + 7) / 8), 4096 >> pitch_lines);
> -
> -               size = mode_cmd.pitches[0] * mode_cmd.height;
> -               size = ALIGN(size, PAGE_SIZE);
> -
> -               /* Allocate the fb in the GTT with stolen page backing */
> -               backing = psbfb_alloc(dev, size);
> -
> -               if (pitch_lines)
> -                       pitch_lines *= 2;
> -               else
> -                       pitch_lines = 1;
> -               gtt_roll++;
> -       } while (backing == NULL && pitch_lines <= 16);
> -
> -       /* The final pitch we accepted if we succeeded */
> -       pitch_lines /= 2;
> -
> -       if (backing == NULL) {
> -               /*
> -                *      We couldn't get the space we wanted, fall back to the
> -                *      display engine requirement instead.  The HW requires
> -                *      the pitch to be 64 byte aligned
> -                */
> -
> -               gtt_roll = 0;   /* Don't use GTT accelerated scrolling */
> -               pitch_lines = 64;
> -
> -               mode_cmd.pitches[0] =  ALIGN(mode_cmd.width * ((bpp + 7) / 8), 64);
> -
> -               size = mode_cmd.pitches[0] * mode_cmd.height;
> -               size = ALIGN(size, PAGE_SIZE);
> -
> -               /* Allocate the framebuffer in the GTT with stolen page backing */
> -               backing = psbfb_alloc(dev, size);
> -               if (backing == NULL)
> -                       return -ENOMEM;
> -       }
> +       mode_cmd.pitches[0] = ALIGN(mode_cmd.width * DIV_ROUND_UP(bpp, 8), 64);
> +
> +       size = mode_cmd.pitches[0] * mode_cmd.height;
> +       size = ALIGN(size, PAGE_SIZE);
> +
> +       /* Allocate the framebuffer in the GTT with stolen page backing */
> +       backing = psbfb_alloc(dev, size);
> +       if (backing == NULL)
> +               return -ENOMEM;
>
>         memset(dev_priv->vram_addr + backing->offset, 0, size);
>
> @@ -387,17 +318,14 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
>
>         fb_helper->fb = fb;
>
> -       if (dev_priv->ops->accel_2d && pitch_lines > 8) /* 2D engine */
> +       if (dev_priv->ops->accel_2d)    /* 2D engine */
>                 info->fbops = &psbfb_ops;
> -       else if (gtt_roll) {    /* GTT rolling seems best */
> -               info->fbops = &psbfb_roll_ops;
> -               info->flags |= FBINFO_HWACCEL_YPAN;
> -       } else  /* Software */
> +       else    /* Software */
>                 info->fbops = &psbfb_unaccel_ops;
>
>         info->fix.smem_start = dev->mode_config.fb_base;
>         info->fix.smem_len = size;
> -       info->fix.ywrapstep = gtt_roll;
> +       info->fix.ywrapstep = 0;
>         info->fix.ypanstep = 0;
>
>         /* Accessed stolen memory directly */
> diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
> index 9278bcfad1bf..d246b1f70366 100644
> --- a/drivers/gpu/drm/gma500/gtt.c
> +++ b/drivers/gpu/drm/gma500/gtt.c
> @@ -96,16 +96,12 @@ static int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r,
>         }
>
>         /* Write our page entries into the GTT itself */
> -       for (i = r->roll; i < r->npage; i++) {
> -               pte = psb_gtt_mask_pte(page_to_pfn(r->pages[i]),
> -                                      PSB_MMU_CACHED_MEMORY);
> -               iowrite32(pte, gtt_slot++);
> -       }
> -       for (i = 0; i < r->roll; i++) {
> +       for (i = 0; i < r->npage; i++) {
>                 pte = psb_gtt_mask_pte(page_to_pfn(r->pages[i]),
>                                        PSB_MMU_CACHED_MEMORY);
>                 iowrite32(pte, gtt_slot++);
>         }
> +
>         /* Make sure all the entries are set before we return */
>         ioread32(gtt_slot - 1);
>
> @@ -140,49 +136,6 @@ static void psb_gtt_remove(struct drm_device *dev, struct gtt_range *r)
>         set_pages_array_wb(r->pages, r->npage);
>  }
>
> -/**
> - *     psb_gtt_roll    -       set scrolling position
> - *     @dev: our DRM device
> - *     @r: the gtt mapping we are using
> - *     @roll: roll offset
> - *
> - *     Roll an existing pinned mapping by moving the pages through the GTT.
> - *     This allows us to implement hardware scrolling on the consoles without
> - *     a 2D engine
> - */
> -void psb_gtt_roll(struct drm_device *dev, struct gtt_range *r, int roll)
> -{
> -       u32 __iomem *gtt_slot;
> -       u32 pte;
> -       int i;
> -
> -       if (roll >= r->npage) {
> -               WARN_ON(1);
> -               return;
> -       }
> -
> -       r->roll = roll;
> -
> -       /* Not currently in the GTT - no worry we will write the mapping at
> -          the right position when it gets pinned */
> -       if (!r->stolen && !r->in_gart)
> -               return;
> -
> -       gtt_slot = psb_gtt_entry(dev, r);
> -
> -       for (i = r->roll; i < r->npage; i++) {
> -               pte = psb_gtt_mask_pte(page_to_pfn(r->pages[i]),
> -                                      PSB_MMU_CACHED_MEMORY);
> -               iowrite32(pte, gtt_slot++);
> -       }
> -       for (i = 0; i < r->roll; i++) {
> -               pte = psb_gtt_mask_pte(page_to_pfn(r->pages[i]),
> -                                      PSB_MMU_CACHED_MEMORY);
> -               iowrite32(pte, gtt_slot++);
> -       }
> -       ioread32(gtt_slot - 1);
> -}
> -
>  /**
>   *     psb_gtt_attach_pages    -       attach and pin GEM pages
>   *     @gt: the gtt range
> @@ -346,7 +299,6 @@ struct gtt_range *psb_gtt_alloc_range(struct drm_device *dev, int len,
>         gt->resource.name = name;
>         gt->stolen = backed;
>         gt->in_gart = backed;
> -       gt->roll = 0;
>         /* Ensure this is set for non GEM objects */
>         gt->gem.dev = dev;
>         ret = allocate_resource(dev_priv->gtt_mem, &gt->resource,
> diff --git a/drivers/gpu/drm/gma500/gtt.h b/drivers/gpu/drm/gma500/gtt.h
> index 3cf190295ad3..2bf165849ebe 100644
> --- a/drivers/gpu/drm/gma500/gtt.h
> +++ b/drivers/gpu/drm/gma500/gtt.h
> @@ -37,7 +37,6 @@ struct gtt_range {
>         bool mmapping;                  /* Is mmappable */
>         struct page **pages;            /* Backing pages if present */
>         int npage;                      /* Number of backing pages */
> -       int roll;                       /* Roll applied to the GTT entries */
>  };
>
>  #define to_gtt_range(x) container_of(x, struct gtt_range, gem)
> @@ -49,7 +48,5 @@ extern void psb_gtt_kref_put(struct gtt_range *gt);
>  extern void psb_gtt_free_range(struct drm_device *dev, struct gtt_range *gt);
>  extern int psb_gtt_pin(struct gtt_range *gt);
>  extern void psb_gtt_unpin(struct gtt_range *gt);
> -extern void psb_gtt_roll(struct drm_device *dev,
> -                                       struct gtt_range *gt, int roll);
>  extern int psb_gtt_restore(struct drm_device *dev);
>  #endif
> --
> 2.28.0
>


--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
