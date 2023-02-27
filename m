Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4706A3B8A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 08:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5CB10E1B2;
	Mon, 27 Feb 2023 07:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC5C10E0EF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 07:11:06 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id bh1so5711736plb.11
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 23:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JIRUvS0pcEgni8ZB2YwIR/N+Dv6SEBnx8gSHGRcUYZY=;
 b=nVGqUseWK2g/3grSgj+7JkPGp2hwQZYIwJkHuBQBIKlSJYDuJhbEb2cmF/vGFxVbRj
 m61t1SSOhQUVehX3mLGcvOVhiranx5nBYSUyDhOfnJp3Tp/k0JD8nx2XB7mkHZP3BwzK
 D6UYJuk7whVxYo8MYGtcn5L+nSoIYHCJ8mBY2DBO7TwnSwlt9D/OhRhzQL6e5LXsE7N/
 6hBU/R9UVH1o1d+qOxFfHxx5oQRgWTDYEapndCYcXai9Yjz431pNCC1pAjQgW5ZfaZbJ
 6MXSNsSzEPJ74wQsCuZ3i/QYCC5ogHbyo6OMODu1mluEQAhG8l7eiAvTKgMPY5gtEAHV
 vojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JIRUvS0pcEgni8ZB2YwIR/N+Dv6SEBnx8gSHGRcUYZY=;
 b=7uuGMW3p7r1YCH8nHQgGzDLuQjP+JC9LW/sIqAyNoIbszzRvfjfTM7MzHYfTg8f0x3
 qBQqTBLKlvMuJe6DR47iTFsx4j0c+2bYdAebIsB+CRQzrh6vO8s8Uyd8qxgOZJbUkGG0
 6SYgmerfDNUqqaC+4tCBTjd3V5inYfF5uhVBzY570tdFjcrm9tb/3y5+OheLrfAO2Rkp
 HO6sFSPmwsSgRPwh2NtqaoOb+Rn4QpsqKCmxHYL4OHNK9hHl1RtHq6Q4RXBxy2XnVjTc
 fBd1OZOMHmDrJmRDJOLhFfrkBkunpw3LIPcQEBQgmQDX15oF/AyurxIsFH4A4hP6w1qf
 ribQ==
X-Gm-Message-State: AO0yUKW/aH77lu/irIctaVRKe+OXKgl2k8RfnSFj4LQX/xXb8d7Syqbg
 +RapUVm+ALjZTH1Q2Qv0wy1dFcRoLhHI5br+j2e2rjIB
X-Google-Smtp-Source: AK7set8jnp6zkGvoWwuFSpn0z43R1dJPQIOjoUdW8z/JTZruL/MdVhBeEXiw2O2wEzrFjNr4sqOSAyQnon9DCfA/fOM=
X-Received: by 2002:a17:903:26c2:b0:19a:fdca:e3f1 with SMTP id
 jg2-20020a17090326c200b0019afdcae3f1mr5723533plb.3.1677481865664; Sun, 26 Feb
 2023 23:11:05 -0800 (PST)
MIME-Version: 1.0
References: <20230223121733.12549-1-tzimmermann@suse.de>
 <20230223121733.12549-3-tzimmermann@suse.de>
In-Reply-To: <20230223121733.12549-3-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 27 Feb 2023 08:10:54 +0100
Message-ID: <CAMeQTsbagTuPLZe7b6_wmNPp7N+T3k835u20kg6EQtSU0PeR0w@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/gma500: Move fbdev code into separate source file
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 23, 2023 at 1:17 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Move the fbdev emulation from framebuffer.c into fbdev.c. Only build
> the source code if the Kconfig symbol has been selected. Remaining in
> framebuffer.c is gma500's code for DRM frambuffers. No functional
> hanges.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Hi Thomas, this patch doesn't apply to drm-misc. I seem to be missing
drm_fb_helper_prepare/unprepare().

-Patrik

> ---
>  drivers/gpu/drm/gma500/Makefile      |   1 +
>  drivers/gpu/drm/gma500/fbdev.c       | 325 +++++++++++++++++++++++++++
>  drivers/gpu/drm/gma500/framebuffer.c | 318 +-------------------------
>  drivers/gpu/drm/gma500/psb_drv.h     |  17 ++
>  4 files changed, 346 insertions(+), 315 deletions(-)
>  create mode 100644 drivers/gpu/drm/gma500/fbdev.c
>
> diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gma500/Makefile
> index 63012bf2485a..4f302cd5e1a6 100644
> --- a/drivers/gpu/drm/gma500/Makefile
> +++ b/drivers/gpu/drm/gma500/Makefile
> @@ -38,5 +38,6 @@ gma500_gfx-y += \
>           psb_irq.o
>
>  gma500_gfx-$(CONFIG_ACPI) +=  opregion.o
> +gma500_gfx-$(CONFIG_DRM_FBDEV_EMULATION) +=  fbdev.o
>
>  obj-$(CONFIG_DRM_GMA500) += gma500_gfx.o
> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
> new file mode 100644
> index 000000000000..9ce76b11d256
> --- /dev/null
> +++ b/drivers/gpu/drm/gma500/fbdev.c
> @@ -0,0 +1,325 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/**************************************************************************
> + * Copyright (c) 2007-2011, Intel Corporation.
> + * All Rights Reserved.
> + *
> + **************************************************************************/
> +
> +#include <linux/pfn_t.h>
> +
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_framebuffer.h>
> +
> +#include "gem.h"
> +#include "psb_drv.h"
> +
> +/*
> + * VM area struct
> + */
> +
> +static vm_fault_t psbfb_vm_fault(struct vm_fault *vmf)
> +{
> +       struct vm_area_struct *vma = vmf->vma;
> +       struct drm_framebuffer *fb = vma->vm_private_data;
> +       struct drm_device *dev = fb->dev;
> +       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +       struct psb_gem_object *pobj = to_psb_gem_object(fb->obj[0]);
> +       int page_num;
> +       int i;
> +       unsigned long address;
> +       vm_fault_t ret = VM_FAULT_SIGBUS;
> +       unsigned long pfn;
> +       unsigned long phys_addr = (unsigned long)dev_priv->stolen_base + pobj->offset;
> +
> +       page_num = vma_pages(vma);
> +       address = vmf->address - (vmf->pgoff << PAGE_SHIFT);
> +
> +       vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +
> +       for (i = 0; i < page_num; i++) {
> +               pfn = (phys_addr >> PAGE_SHIFT);
> +
> +               ret = vmf_insert_mixed(vma, address, __pfn_to_pfn_t(pfn, PFN_DEV));
> +               if (unlikely(ret & VM_FAULT_ERROR))
> +                       break;
> +               address += PAGE_SIZE;
> +               phys_addr += PAGE_SIZE;
> +       }
> +       return ret;
> +}
> +
> +static void psbfb_vm_open(struct vm_area_struct *vma)
> +{ }
> +
> +static void psbfb_vm_close(struct vm_area_struct *vma)
> +{ }
> +
> +static const struct vm_operations_struct psbfb_vm_ops = {
> +       .fault  = psbfb_vm_fault,
> +       .open   = psbfb_vm_open,
> +       .close  = psbfb_vm_close
> +};
> +
> +/*
> + * struct fb_ops
> + */
> +
> +#define CMAP_TOHW(_val, _width) ((((_val) << (_width)) + 0x7FFF - (_val)) >> 16)
> +
> +static int psbfb_setcolreg(unsigned int regno,
> +                          unsigned int red, unsigned int green,
> +                          unsigned int blue, unsigned int transp,
> +                          struct fb_info *info)
> +{
> +       struct drm_fb_helper *fb_helper = info->par;
> +       struct drm_framebuffer *fb = fb_helper->fb;
> +       uint32_t v;
> +
> +       if (!fb)
> +               return -ENOMEM;
> +
> +       if (regno > 255)
> +               return 1;
> +
> +       red = CMAP_TOHW(red, info->var.red.length);
> +       blue = CMAP_TOHW(blue, info->var.blue.length);
> +       green = CMAP_TOHW(green, info->var.green.length);
> +       transp = CMAP_TOHW(transp, info->var.transp.length);
> +
> +       v = (red << info->var.red.offset) |
> +           (green << info->var.green.offset) |
> +           (blue << info->var.blue.offset) |
> +           (transp << info->var.transp.offset);
> +
> +       if (regno < 16) {
> +               switch (fb->format->cpp[0] * 8) {
> +               case 16:
> +                       ((uint32_t *) info->pseudo_palette)[regno] = v;
> +                       break;
> +               case 24:
> +               case 32:
> +                       ((uint32_t *) info->pseudo_palette)[regno] = v;
> +                       break;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int psbfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
> +{
> +       struct drm_fb_helper *fb_helper = info->par;
> +       struct drm_framebuffer *fb = fb_helper->fb;
> +
> +       if (vma->vm_pgoff != 0)
> +               return -EINVAL;
> +       if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
> +               return -EINVAL;
> +
> +       /*
> +        * If this is a GEM object then info->screen_base is the virtual
> +        * kernel remapping of the object. FIXME: Review if this is
> +        * suitable for our mmap work
> +        */
> +       vma->vm_ops = &psbfb_vm_ops;
> +       vma->vm_private_data = (void *)fb;
> +       vma->vm_flags |= VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP;
> +
> +       return 0;
> +}
> +
> +static const struct fb_ops psbfb_unaccel_ops = {
> +       .owner = THIS_MODULE,
> +       DRM_FB_HELPER_DEFAULT_OPS,
> +       .fb_setcolreg = psbfb_setcolreg,
> +       .fb_read = drm_fb_helper_cfb_read,
> +       .fb_write = drm_fb_helper_cfb_write,
> +       .fb_fillrect = drm_fb_helper_cfb_fillrect,
> +       .fb_copyarea = drm_fb_helper_cfb_copyarea,
> +       .fb_imageblit = drm_fb_helper_cfb_imageblit,
> +       .fb_mmap = psbfb_mmap,
> +};
> +
> +/*
> + * struct drm_fb_helper_funcs
> + */
> +
> +static int psbfb_create(struct drm_fb_helper *fb_helper,
> +                       struct drm_fb_helper_surface_size *sizes)
> +{
> +       struct drm_device *dev = fb_helper->dev;
> +       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +       struct pci_dev *pdev = to_pci_dev(dev->dev);
> +       struct fb_info *info;
> +       struct drm_framebuffer *fb;
> +       struct drm_mode_fb_cmd2 mode_cmd;
> +       int size;
> +       int ret;
> +       struct psb_gem_object *backing;
> +       struct drm_gem_object *obj;
> +       u32 bpp, depth;
> +
> +       mode_cmd.width = sizes->surface_width;
> +       mode_cmd.height = sizes->surface_height;
> +       bpp = sizes->surface_bpp;
> +       depth = sizes->surface_depth;
> +
> +       /* No 24bit packed */
> +       if (bpp == 24)
> +               bpp = 32;
> +
> +       mode_cmd.pitches[0] = ALIGN(mode_cmd.width * DIV_ROUND_UP(bpp, 8), 64);
> +
> +       size = mode_cmd.pitches[0] * mode_cmd.height;
> +       size = ALIGN(size, PAGE_SIZE);
> +
> +       /* Allocate the framebuffer in the GTT with stolen page backing */
> +       backing = psb_gem_create(dev, size, "fb", true, PAGE_SIZE);
> +       if (IS_ERR(backing))
> +               return PTR_ERR(backing);
> +       obj = &backing->base;
> +
> +       memset(dev_priv->vram_addr + backing->offset, 0, size);
> +
> +       info = drm_fb_helper_alloc_info(fb_helper);
> +       if (IS_ERR(info)) {
> +               ret = PTR_ERR(info);
> +               goto err_drm_gem_object_put;
> +       }
> +
> +       mode_cmd.pixel_format = drm_mode_legacy_fb_format(bpp, depth);
> +
> +       fb = psb_framebuffer_create(dev, &mode_cmd, obj);
> +       if (IS_ERR(fb)) {
> +               ret = PTR_ERR(fb);
> +               goto err_drm_gem_object_put;
> +       }
> +
> +       fb_helper->fb = fb;
> +
> +       info->fbops = &psbfb_unaccel_ops;
> +
> +       info->fix.smem_start = dev_priv->fb_base;
> +       info->fix.smem_len = size;
> +       info->fix.ywrapstep = 0;
> +       info->fix.ypanstep = 0;
> +
> +       /* Accessed stolen memory directly */
> +       info->screen_base = dev_priv->vram_addr + backing->offset;
> +       info->screen_size = size;
> +
> +       drm_fb_helper_fill_info(info, fb_helper, sizes);
> +
> +       info->fix.mmio_start = pci_resource_start(pdev, 0);
> +       info->fix.mmio_len = pci_resource_len(pdev, 0);
> +
> +       /* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
> +
> +       dev_dbg(dev->dev, "allocated %dx%d fb\n", fb->width, fb->height);
> +
> +       return 0;
> +
> +err_drm_gem_object_put:
> +       drm_gem_object_put(obj);
> +       return ret;
> +}
> +
> +static int psbfb_probe(struct drm_fb_helper *fb_helper,
> +                               struct drm_fb_helper_surface_size *sizes)
> +{
> +       struct drm_device *dev = fb_helper->dev;
> +       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +       unsigned int fb_size;
> +       int bytespp;
> +
> +       bytespp = sizes->surface_bpp / 8;
> +       if (bytespp == 3)       /* no 24bit packed */
> +               bytespp = 4;
> +
> +       /*
> +        * If the mode will not fit in 32bit then switch to 16bit to get
> +        * a console on full resolution. The X mode setting server will
> +        * allocate its own 32bit GEM framebuffer
> +        */
> +       fb_size = ALIGN(sizes->surface_width * bytespp, 64) *
> +                 sizes->surface_height;
> +       fb_size = ALIGN(fb_size, PAGE_SIZE);
> +
> +       if (fb_size > dev_priv->vram_stolen_size) {
> +               sizes->surface_bpp = 16;
> +               sizes->surface_depth = 16;
> +       }
> +
> +       return psbfb_create(fb_helper, sizes);
> +}
> +
> +static const struct drm_fb_helper_funcs psb_fb_helper_funcs = {
> +       .fb_probe = psbfb_probe,
> +};
> +
> +static int psb_fbdev_destroy(struct drm_device *dev,
> +                            struct drm_fb_helper *fb_helper)
> +{
> +       struct drm_framebuffer *fb = fb_helper->fb;
> +
> +       drm_fb_helper_unregister_info(fb_helper);
> +
> +       drm_fb_helper_fini(fb_helper);
> +       drm_framebuffer_unregister_private(fb);
> +       drm_framebuffer_cleanup(fb);
> +
> +       if (fb->obj[0])
> +               drm_gem_object_put(fb->obj[0]);
> +       kfree(fb);
> +
> +       return 0;
> +}
> +
> +int psb_fbdev_init(struct drm_device *dev)
> +{
> +       struct drm_fb_helper *fb_helper;
> +       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +       int ret;
> +
> +       fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
> +       if (!fb_helper)
> +               return -ENOMEM;
> +
> +       dev_priv->fb_helper = fb_helper;
> +
> +       drm_fb_helper_prepare(dev, fb_helper, 32, &psb_fb_helper_funcs);
> +
> +       ret = drm_fb_helper_init(dev, fb_helper);
> +       if (ret)
> +               goto free;
> +
> +       /* disable all the possible outputs/crtcs before entering KMS mode */
> +       drm_helper_disable_unused_functions(dev);
> +
> +       ret = drm_fb_helper_initial_config(fb_helper);
> +       if (ret)
> +               goto fini;
> +
> +       return 0;
> +
> +fini:
> +       drm_fb_helper_fini(fb_helper);
> +free:
> +       drm_fb_helper_unprepare(fb_helper);
> +       kfree(fb_helper);
> +       return ret;
> +}
> +
> +void psb_fbdev_fini(struct drm_device *dev)
> +{
> +       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> +
> +       if (!dev_priv->fb_helper)
> +               return;
> +
> +       psb_fbdev_destroy(dev, dev_priv->fb_helper);
> +       drm_fb_helper_unprepare(dev_priv->fb_helper);
> +       kfree(dev_priv->fb_helper);
> +       dev_priv->fb_helper = NULL;
> +}
> diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
> index df4dbc509f68..506b881a7b24 100644
> --- a/drivers/gpu/drm/gma500/framebuffer.c
> +++ b/drivers/gpu/drm/gma500/framebuffer.c
> @@ -5,16 +5,12 @@
>   *
>   **************************************************************************/
>
> -#include <linux/pfn_t.h>
> -
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_modeset_helper.h>
>
>  #include "framebuffer.h"
> -#include "gem.h"
>  #include "psb_drv.h"
>
>  static const struct drm_framebuffer_funcs psb_fb_funcs = {
> @@ -22,126 +18,6 @@ static const struct drm_framebuffer_funcs psb_fb_funcs = {
>         .create_handle = drm_gem_fb_create_handle,
>  };
>
> -#define CMAP_TOHW(_val, _width) ((((_val) << (_width)) + 0x7FFF - (_val)) >> 16)
> -
> -static int psbfb_setcolreg(unsigned regno, unsigned red, unsigned green,
> -                          unsigned blue, unsigned transp,
> -                          struct fb_info *info)
> -{
> -       struct drm_fb_helper *fb_helper = info->par;
> -       struct drm_framebuffer *fb = fb_helper->fb;
> -       uint32_t v;
> -
> -       if (!fb)
> -               return -ENOMEM;
> -
> -       if (regno > 255)
> -               return 1;
> -
> -       red = CMAP_TOHW(red, info->var.red.length);
> -       blue = CMAP_TOHW(blue, info->var.blue.length);
> -       green = CMAP_TOHW(green, info->var.green.length);
> -       transp = CMAP_TOHW(transp, info->var.transp.length);
> -
> -       v = (red << info->var.red.offset) |
> -           (green << info->var.green.offset) |
> -           (blue << info->var.blue.offset) |
> -           (transp << info->var.transp.offset);
> -
> -       if (regno < 16) {
> -               switch (fb->format->cpp[0] * 8) {
> -               case 16:
> -                       ((uint32_t *) info->pseudo_palette)[regno] = v;
> -                       break;
> -               case 24:
> -               case 32:
> -                       ((uint32_t *) info->pseudo_palette)[regno] = v;
> -                       break;
> -               }
> -       }
> -
> -       return 0;
> -}
> -
> -static vm_fault_t psbfb_vm_fault(struct vm_fault *vmf)
> -{
> -       struct vm_area_struct *vma = vmf->vma;
> -       struct drm_framebuffer *fb = vma->vm_private_data;
> -       struct drm_device *dev = fb->dev;
> -       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -       struct psb_gem_object *pobj = to_psb_gem_object(fb->obj[0]);
> -       int page_num;
> -       int i;
> -       unsigned long address;
> -       vm_fault_t ret = VM_FAULT_SIGBUS;
> -       unsigned long pfn;
> -       unsigned long phys_addr = (unsigned long)dev_priv->stolen_base + pobj->offset;
> -
> -       page_num = vma_pages(vma);
> -       address = vmf->address - (vmf->pgoff << PAGE_SHIFT);
> -
> -       vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> -
> -       for (i = 0; i < page_num; i++) {
> -               pfn = (phys_addr >> PAGE_SHIFT);
> -
> -               ret = vmf_insert_mixed(vma, address,
> -                               __pfn_to_pfn_t(pfn, PFN_DEV));
> -               if (unlikely(ret & VM_FAULT_ERROR))
> -                       break;
> -               address += PAGE_SIZE;
> -               phys_addr += PAGE_SIZE;
> -       }
> -       return ret;
> -}
> -
> -static void psbfb_vm_open(struct vm_area_struct *vma)
> -{
> -}
> -
> -static void psbfb_vm_close(struct vm_area_struct *vma)
> -{
> -}
> -
> -static const struct vm_operations_struct psbfb_vm_ops = {
> -       .fault  = psbfb_vm_fault,
> -       .open   = psbfb_vm_open,
> -       .close  = psbfb_vm_close
> -};
> -
> -static int psbfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
> -{
> -       struct drm_fb_helper *fb_helper = info->par;
> -       struct drm_framebuffer *fb = fb_helper->fb;
> -
> -       if (vma->vm_pgoff != 0)
> -               return -EINVAL;
> -       if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
> -               return -EINVAL;
> -
> -       /*
> -        * If this is a GEM object then info->screen_base is the virtual
> -        * kernel remapping of the object. FIXME: Review if this is
> -        * suitable for our mmap work
> -        */
> -       vma->vm_ops = &psbfb_vm_ops;
> -       vma->vm_private_data = (void *)fb;
> -       vma->vm_flags |= VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP;
> -       return 0;
> -}
> -
> -static const struct fb_ops psbfb_unaccel_ops = {
> -       .owner = THIS_MODULE,
> -       DRM_FB_HELPER_DEFAULT_OPS,
> -       .fb_setcolreg = psbfb_setcolreg,
> -       .fb_read = drm_fb_helper_cfb_read,
> -       .fb_write = drm_fb_helper_cfb_write,
> -       .fb_fillrect = drm_fb_helper_cfb_fillrect,
> -       .fb_copyarea = drm_fb_helper_cfb_copyarea,
> -       .fb_imageblit = drm_fb_helper_cfb_imageblit,
> -       .fb_mmap = psbfb_mmap,
> -};
> -
>  /**
>   *     psb_framebuffer_init    -       initialize a framebuffer
>   *     @dev: our DRM device
> @@ -192,11 +68,9 @@ static int psb_framebuffer_init(struct drm_device *dev,
>   *
>   *     TODO: review object references
>   */
> -
> -static struct drm_framebuffer *psb_framebuffer_create
> -                       (struct drm_device *dev,
> -                        const struct drm_mode_fb_cmd2 *mode_cmd,
> -                        struct drm_gem_object *obj)
> +struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
> +                                              const struct drm_mode_fb_cmd2 *mode_cmd,
> +                                              struct drm_gem_object *obj)
>  {
>         struct drm_framebuffer *fb;
>         int ret;
> @@ -213,93 +87,6 @@ static struct drm_framebuffer *psb_framebuffer_create
>         return fb;
>  }
>
> -/**
> - *     psbfb_create            -       create a framebuffer
> - *     @fb_helper: the framebuffer helper
> - *     @sizes: specification of the layout
> - *
> - *     Create a framebuffer to the specifications provided
> - */
> -static int psbfb_create(struct drm_fb_helper *fb_helper,
> -                               struct drm_fb_helper_surface_size *sizes)
> -{
> -       struct drm_device *dev = fb_helper->dev;
> -       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -       struct pci_dev *pdev = to_pci_dev(dev->dev);
> -       struct fb_info *info;
> -       struct drm_framebuffer *fb;
> -       struct drm_mode_fb_cmd2 mode_cmd;
> -       int size;
> -       int ret;
> -       struct psb_gem_object *backing;
> -       struct drm_gem_object *obj;
> -       u32 bpp, depth;
> -
> -       mode_cmd.width = sizes->surface_width;
> -       mode_cmd.height = sizes->surface_height;
> -       bpp = sizes->surface_bpp;
> -       depth = sizes->surface_depth;
> -
> -       /* No 24bit packed */
> -       if (bpp == 24)
> -               bpp = 32;
> -
> -       mode_cmd.pitches[0] = ALIGN(mode_cmd.width * DIV_ROUND_UP(bpp, 8), 64);
> -
> -       size = mode_cmd.pitches[0] * mode_cmd.height;
> -       size = ALIGN(size, PAGE_SIZE);
> -
> -       /* Allocate the framebuffer in the GTT with stolen page backing */
> -       backing = psb_gem_create(dev, size, "fb", true, PAGE_SIZE);
> -       if (IS_ERR(backing))
> -               return PTR_ERR(backing);
> -       obj = &backing->base;
> -
> -       memset(dev_priv->vram_addr + backing->offset, 0, size);
> -
> -       info = drm_fb_helper_alloc_info(fb_helper);
> -       if (IS_ERR(info)) {
> -               ret = PTR_ERR(info);
> -               goto err_drm_gem_object_put;
> -       }
> -
> -       mode_cmd.pixel_format = drm_mode_legacy_fb_format(bpp, depth);
> -
> -       fb = psb_framebuffer_create(dev, &mode_cmd, obj);
> -       if (IS_ERR(fb)) {
> -               ret = PTR_ERR(fb);
> -               goto err_drm_gem_object_put;
> -       }
> -
> -       fb_helper->fb = fb;
> -
> -       info->fbops = &psbfb_unaccel_ops;
> -
> -       info->fix.smem_start = dev_priv->fb_base;
> -       info->fix.smem_len = size;
> -       info->fix.ywrapstep = 0;
> -       info->fix.ypanstep = 0;
> -
> -       /* Accessed stolen memory directly */
> -       info->screen_base = dev_priv->vram_addr + backing->offset;
> -       info->screen_size = size;
> -
> -       drm_fb_helper_fill_info(info, fb_helper, sizes);
> -
> -       info->fix.mmio_start = pci_resource_start(pdev, 0);
> -       info->fix.mmio_len = pci_resource_len(pdev, 0);
> -
> -       /* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
> -
> -       dev_dbg(dev->dev, "allocated %dx%d fb\n", fb->width, fb->height);
> -
> -       return 0;
> -
> -err_drm_gem_object_put:
> -       drm_gem_object_put(obj);
> -       return ret;
> -}
> -
>  /**
>   *     psb_user_framebuffer_create     -       create framebuffer
>   *     @dev: our DRM device
> @@ -331,105 +118,6 @@ static struct drm_framebuffer *psb_user_framebuffer_create
>         return fb;
>  }
>
> -static int psbfb_probe(struct drm_fb_helper *fb_helper,
> -                               struct drm_fb_helper_surface_size *sizes)
> -{
> -       struct drm_device *dev = fb_helper->dev;
> -       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -       unsigned int fb_size;
> -       int bytespp;
> -
> -       bytespp = sizes->surface_bpp / 8;
> -       if (bytespp == 3)       /* no 24bit packed */
> -               bytespp = 4;
> -
> -       /* If the mode will not fit in 32bit then switch to 16bit to get
> -          a console on full resolution. The X mode setting server will
> -          allocate its own 32bit GEM framebuffer */
> -       fb_size = ALIGN(sizes->surface_width * bytespp, 64) *
> -                 sizes->surface_height;
> -       fb_size = ALIGN(fb_size, PAGE_SIZE);
> -
> -       if (fb_size > dev_priv->vram_stolen_size) {
> -                sizes->surface_bpp = 16;
> -                sizes->surface_depth = 16;
> -        }
> -
> -       return psbfb_create(fb_helper, sizes);
> -}
> -
> -static const struct drm_fb_helper_funcs psb_fb_helper_funcs = {
> -       .fb_probe = psbfb_probe,
> -};
> -
> -static int psb_fbdev_destroy(struct drm_device *dev,
> -                            struct drm_fb_helper *fb_helper)
> -{
> -       struct drm_framebuffer *fb = fb_helper->fb;
> -
> -       drm_fb_helper_unregister_info(fb_helper);
> -
> -       drm_fb_helper_fini(fb_helper);
> -       drm_framebuffer_unregister_private(fb);
> -       drm_framebuffer_cleanup(fb);
> -
> -       if (fb->obj[0])
> -               drm_gem_object_put(fb->obj[0]);
> -       kfree(fb);
> -
> -       return 0;
> -}
> -
> -int psb_fbdev_init(struct drm_device *dev)
> -{
> -       struct drm_fb_helper *fb_helper;
> -       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -       int ret;
> -
> -       fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
> -       if (!fb_helper) {
> -               dev_err(dev->dev, "no memory\n");
> -               return -ENOMEM;
> -       }
> -
> -       dev_priv->fb_helper = fb_helper;
> -
> -       drm_fb_helper_prepare(dev, fb_helper, 32, &psb_fb_helper_funcs);
> -
> -       ret = drm_fb_helper_init(dev, fb_helper);
> -       if (ret)
> -               goto free;
> -
> -       /* disable all the possible outputs/crtcs before entering KMS mode */
> -       drm_helper_disable_unused_functions(dev);
> -
> -       ret = drm_fb_helper_initial_config(fb_helper);
> -       if (ret)
> -               goto fini;
> -
> -       return 0;
> -
> -fini:
> -       drm_fb_helper_fini(fb_helper);
> -free:
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
> -       return ret;
> -}
> -
> -static void psb_fbdev_fini(struct drm_device *dev)
> -{
> -       struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
> -
> -       if (!dev_priv->fb_helper)
> -               return;
> -
> -       psb_fbdev_destroy(dev, dev_priv->fb_helper);
> -       drm_fb_helper_unprepare(dev_priv->fb_helper);
> -       kfree(dev_priv->fb_helper);
> -       dev_priv->fb_helper = NULL;
> -}
> -
>  static const struct drm_mode_config_funcs psb_mode_funcs = {
>         .fb_create = psb_user_framebuffer_create,
>         .output_poll_changed = drm_fb_helper_output_poll_changed,
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> index a5df6d2f2cab..cd0a30011572 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -610,7 +610,24 @@ extern void psb_lid_timer_takedown(struct drm_psb_private *dev_priv);
>  /* modesetting */
>  extern void psb_modeset_init(struct drm_device *dev);
>  extern void psb_modeset_cleanup(struct drm_device *dev);
> +
> +/* framebuffer */
> +extern struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
> +                                                     const struct drm_mode_fb_cmd2 *mode_cmd,
> +                                                     struct drm_gem_object *obj);
> +
> +/* fbdev */
> +#if defined(CONFIG_DRM_FBDEV_EMULATION)
>  extern int psb_fbdev_init(struct drm_device *dev);
> +extern void psb_fbdev_fini(struct drm_device *dev);
> +#else
> +int psb_fbdev_init(struct drm_device *dev)
> +{
> +       return 0;
> +}
> +void psb_fbdev_fini(struct drm_device *dev)
> +{ }
> +#endif
>
>  /* backlight.c */
>  int gma_backlight_init(struct drm_device *dev);
> --
> 2.39.2
>
