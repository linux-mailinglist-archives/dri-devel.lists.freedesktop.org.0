Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF96A6A3BD4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 08:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DB510E1B0;
	Mon, 27 Feb 2023 07:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1097110E1B0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 07:48:21 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id v11so2290906plz.8
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 23:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g/cNybs8j00ST8jDfViTA/eQOJP7AvgBQHhhCpCs26s=;
 b=kaGpRa9Dq5SYNl16RUOdwwSUFSEKE38KdrxWbsLactQ9QqdSkQKGgnhHkK/e8XcAYR
 F5iozk3+eLfZU4Z9UULx2+0f1hLmih+TmhtKIZ2oAzK9+3alABwymss26+nmQs12jl6u
 9lQ7OgCAZ9JAfllXzQ4SMUy6IpJefJTDrS3xwEZ5SjpZA0w3PEWL7Y5x1bMkbfvEWa6M
 GfMe2qrnnKstkmRqVyVE94JB4ZpBqxUdHczP029xJcWVegB3atxe5JRoDS2z74q3YqZu
 1mHIJFy2gZs/a7ON3nyi/7mP3AvYhMV4CfgIlgav63hZRzG0hHI8MaU1AhwvW41548hb
 2acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g/cNybs8j00ST8jDfViTA/eQOJP7AvgBQHhhCpCs26s=;
 b=NDpKHWjpR9uz0Sk8wcnUZV/eSHyeTwdXUfEOE8mtovTJm/osuPSu/uGutFp6N6/k5U
 Vn8heE2RvFOzDDARbmS2OYn6jDbb8yPnG04rzfbZhj6KrN86r+oBRkYzc70lmjX7dDVP
 W7pS86FzjnF8nZ5jYN/mwaPz935QOkDtyKHSUxmRBmWNki3rajlBKc+zZEU8Tfcz+/ae
 WNPBfgiBCQjpS7hNurOoLyQoXnkHylz8BBbZ94mY1YFT/tgYL+k+dsI32Q1VEqE+EB9e
 cU0LdEd+zK/IBFrUDCLdUd92cWAkPWrwCTLZRsm0uIXL/4JgbhLZUUfH0m3jl+qce7MC
 HWug==
X-Gm-Message-State: AO0yUKUmZZbz5zGxm/9dLSQ8eUTUsdONqlLMkuTWCpJl1N57g6EcZcNN
 AhKGUtKGD761zLTO1eK5YWFFbWIYkiIcUq4/P+fe6lHN
X-Google-Smtp-Source: AK7set8lLncodGEnHo7WAdozvgIBDd9gqduVH3tbD+fr3s/SNesb+JgKSfidlNS6OlKp++QUtR9HTmHROqnp5fxLb48=
X-Received: by 2002:a17:90a:17ec:b0:237:30ef:e252 with SMTP id
 q99-20020a17090a17ec00b0023730efe252mr4254504pja.9.1677484101368; Sun, 26 Feb
 2023 23:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20230223121733.12549-1-tzimmermann@suse.de>
 <20230223121733.12549-3-tzimmermann@suse.de>
 <CAMeQTsbagTuPLZe7b6_wmNPp7N+T3k835u20kg6EQtSU0PeR0w@mail.gmail.com>
 <3ec277c6-a82b-ef83-ed2e-1c907c63c076@suse.de>
In-Reply-To: <3ec277c6-a82b-ef83-ed2e-1c907c63c076@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 27 Feb 2023 08:48:10 +0100
Message-ID: <CAMeQTsY3EGKjo2DUZtBbqSTu3BGoWbS_a-0Wkvf_pXQbVxUZVQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/gma500: Move fbdev code into separate source file
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 8:41=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 27.02.23 um 08:10 schrieb Patrik Jakobsson:
> > On Thu, Feb 23, 2023 at 1:17 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
> >>
> >> Move the fbdev emulation from framebuffer.c into fbdev.c. Only build
> >> the source code if the Kconfig symbol has been selected. Remaining in
> >> framebuffer.c is gma500's code for DRM frambuffers. No functional
> >> hanges.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> > Hi Thomas, this patch doesn't apply to drm-misc. I seem to be missing
> > drm_fb_helper_prepare/unprepare().
>
> Could be. I'm on drm-tip for development. And we're in the merge window,
> which is a bad time to sync-ing trees. Let me see if I can easiyl
> backmerge now. Or otherwise things should stabilize after -rc1 has been
> tagged.

No worries, I'll just review this against drm-tip instead.

>
> Best regards
> Thomas
>
> >
> > -Patrik
> >
> >> ---
> >>   drivers/gpu/drm/gma500/Makefile      |   1 +
> >>   drivers/gpu/drm/gma500/fbdev.c       | 325 +++++++++++++++++++++++++=
++
> >>   drivers/gpu/drm/gma500/framebuffer.c | 318 +------------------------=
-
> >>   drivers/gpu/drm/gma500/psb_drv.h     |  17 ++
> >>   4 files changed, 346 insertions(+), 315 deletions(-)
> >>   create mode 100644 drivers/gpu/drm/gma500/fbdev.c
> >>
> >> diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gma500/=
Makefile
> >> index 63012bf2485a..4f302cd5e1a6 100644
> >> --- a/drivers/gpu/drm/gma500/Makefile
> >> +++ b/drivers/gpu/drm/gma500/Makefile
> >> @@ -38,5 +38,6 @@ gma500_gfx-y +=3D \
> >>            psb_irq.o
> >>
> >>   gma500_gfx-$(CONFIG_ACPI) +=3D  opregion.o
> >> +gma500_gfx-$(CONFIG_DRM_FBDEV_EMULATION) +=3D  fbdev.o
> >>
> >>   obj-$(CONFIG_DRM_GMA500) +=3D gma500_gfx.o
> >> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/f=
bdev.c
> >> new file mode 100644
> >> index 000000000000..9ce76b11d256
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/gma500/fbdev.c
> >> @@ -0,0 +1,325 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/********************************************************************=
******
> >> + * Copyright (c) 2007-2011, Intel Corporation.
> >> + * All Rights Reserved.
> >> + *
> >> + ********************************************************************=
******/
> >> +
> >> +#include <linux/pfn_t.h>
> >> +
> >> +#include <drm/drm_crtc_helper.h>
> >> +#include <drm/drm_fb_helper.h>
> >> +#include <drm/drm_framebuffer.h>
> >> +
> >> +#include "gem.h"
> >> +#include "psb_drv.h"
> >> +
> >> +/*
> >> + * VM area struct
> >> + */
> >> +
> >> +static vm_fault_t psbfb_vm_fault(struct vm_fault *vmf)
> >> +{
> >> +       struct vm_area_struct *vma =3D vmf->vma;
> >> +       struct drm_framebuffer *fb =3D vma->vm_private_data;
> >> +       struct drm_device *dev =3D fb->dev;
> >> +       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >> +       struct psb_gem_object *pobj =3D to_psb_gem_object(fb->obj[0]);
> >> +       int page_num;
> >> +       int i;
> >> +       unsigned long address;
> >> +       vm_fault_t ret =3D VM_FAULT_SIGBUS;
> >> +       unsigned long pfn;
> >> +       unsigned long phys_addr =3D (unsigned long)dev_priv->stolen_ba=
se + pobj->offset;
> >> +
> >> +       page_num =3D vma_pages(vma);
> >> +       address =3D vmf->address - (vmf->pgoff << PAGE_SHIFT);
> >> +
> >> +       vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
> >> +
> >> +       for (i =3D 0; i < page_num; i++) {
> >> +               pfn =3D (phys_addr >> PAGE_SHIFT);
> >> +
> >> +               ret =3D vmf_insert_mixed(vma, address, __pfn_to_pfn_t(=
pfn, PFN_DEV));
> >> +               if (unlikely(ret & VM_FAULT_ERROR))
> >> +                       break;
> >> +               address +=3D PAGE_SIZE;
> >> +               phys_addr +=3D PAGE_SIZE;
> >> +       }
> >> +       return ret;
> >> +}
> >> +
> >> +static void psbfb_vm_open(struct vm_area_struct *vma)
> >> +{ }
> >> +
> >> +static void psbfb_vm_close(struct vm_area_struct *vma)
> >> +{ }
> >> +
> >> +static const struct vm_operations_struct psbfb_vm_ops =3D {
> >> +       .fault  =3D psbfb_vm_fault,
> >> +       .open   =3D psbfb_vm_open,
> >> +       .close  =3D psbfb_vm_close
> >> +};
> >> +
> >> +/*
> >> + * struct fb_ops
> >> + */
> >> +
> >> +#define CMAP_TOHW(_val, _width) ((((_val) << (_width)) + 0x7FFF - (_v=
al)) >> 16)
> >> +
> >> +static int psbfb_setcolreg(unsigned int regno,
> >> +                          unsigned int red, unsigned int green,
> >> +                          unsigned int blue, unsigned int transp,
> >> +                          struct fb_info *info)
> >> +{
> >> +       struct drm_fb_helper *fb_helper =3D info->par;
> >> +       struct drm_framebuffer *fb =3D fb_helper->fb;
> >> +       uint32_t v;
> >> +
> >> +       if (!fb)
> >> +               return -ENOMEM;
> >> +
> >> +       if (regno > 255)
> >> +               return 1;
> >> +
> >> +       red =3D CMAP_TOHW(red, info->var.red.length);
> >> +       blue =3D CMAP_TOHW(blue, info->var.blue.length);
> >> +       green =3D CMAP_TOHW(green, info->var.green.length);
> >> +       transp =3D CMAP_TOHW(transp, info->var.transp.length);
> >> +
> >> +       v =3D (red << info->var.red.offset) |
> >> +           (green << info->var.green.offset) |
> >> +           (blue << info->var.blue.offset) |
> >> +           (transp << info->var.transp.offset);
> >> +
> >> +       if (regno < 16) {
> >> +               switch (fb->format->cpp[0] * 8) {
> >> +               case 16:
> >> +                       ((uint32_t *) info->pseudo_palette)[regno] =3D=
 v;
> >> +                       break;
> >> +               case 24:
> >> +               case 32:
> >> +                       ((uint32_t *) info->pseudo_palette)[regno] =3D=
 v;
> >> +                       break;
> >> +               }
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static int psbfb_mmap(struct fb_info *info, struct vm_area_struct *vm=
a)
> >> +{
> >> +       struct drm_fb_helper *fb_helper =3D info->par;
> >> +       struct drm_framebuffer *fb =3D fb_helper->fb;
> >> +
> >> +       if (vma->vm_pgoff !=3D 0)
> >> +               return -EINVAL;
> >> +       if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
> >> +               return -EINVAL;
> >> +
> >> +       /*
> >> +        * If this is a GEM object then info->screen_base is the virtu=
al
> >> +        * kernel remapping of the object. FIXME: Review if this is
> >> +        * suitable for our mmap work
> >> +        */
> >> +       vma->vm_ops =3D &psbfb_vm_ops;
> >> +       vma->vm_private_data =3D (void *)fb;
> >> +       vma->vm_flags |=3D VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DO=
NTDUMP;
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static const struct fb_ops psbfb_unaccel_ops =3D {
> >> +       .owner =3D THIS_MODULE,
> >> +       DRM_FB_HELPER_DEFAULT_OPS,
> >> +       .fb_setcolreg =3D psbfb_setcolreg,
> >> +       .fb_read =3D drm_fb_helper_cfb_read,
> >> +       .fb_write =3D drm_fb_helper_cfb_write,
> >> +       .fb_fillrect =3D drm_fb_helper_cfb_fillrect,
> >> +       .fb_copyarea =3D drm_fb_helper_cfb_copyarea,
> >> +       .fb_imageblit =3D drm_fb_helper_cfb_imageblit,
> >> +       .fb_mmap =3D psbfb_mmap,
> >> +};
> >> +
> >> +/*
> >> + * struct drm_fb_helper_funcs
> >> + */
> >> +
> >> +static int psbfb_create(struct drm_fb_helper *fb_helper,
> >> +                       struct drm_fb_helper_surface_size *sizes)
> >> +{
> >> +       struct drm_device *dev =3D fb_helper->dev;
> >> +       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >> +       struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> >> +       struct fb_info *info;
> >> +       struct drm_framebuffer *fb;
> >> +       struct drm_mode_fb_cmd2 mode_cmd;
> >> +       int size;
> >> +       int ret;
> >> +       struct psb_gem_object *backing;
> >> +       struct drm_gem_object *obj;
> >> +       u32 bpp, depth;
> >> +
> >> +       mode_cmd.width =3D sizes->surface_width;
> >> +       mode_cmd.height =3D sizes->surface_height;
> >> +       bpp =3D sizes->surface_bpp;
> >> +       depth =3D sizes->surface_depth;
> >> +
> >> +       /* No 24bit packed */
> >> +       if (bpp =3D=3D 24)
> >> +               bpp =3D 32;
> >> +
> >> +       mode_cmd.pitches[0] =3D ALIGN(mode_cmd.width * DIV_ROUND_UP(bp=
p, 8), 64);
> >> +
> >> +       size =3D mode_cmd.pitches[0] * mode_cmd.height;
> >> +       size =3D ALIGN(size, PAGE_SIZE);
> >> +
> >> +       /* Allocate the framebuffer in the GTT with stolen page backin=
g */
> >> +       backing =3D psb_gem_create(dev, size, "fb", true, PAGE_SIZE);
> >> +       if (IS_ERR(backing))
> >> +               return PTR_ERR(backing);
> >> +       obj =3D &backing->base;
> >> +
> >> +       memset(dev_priv->vram_addr + backing->offset, 0, size);
> >> +
> >> +       info =3D drm_fb_helper_alloc_info(fb_helper);
> >> +       if (IS_ERR(info)) {
> >> +               ret =3D PTR_ERR(info);
> >> +               goto err_drm_gem_object_put;
> >> +       }
> >> +
> >> +       mode_cmd.pixel_format =3D drm_mode_legacy_fb_format(bpp, depth=
);
> >> +
> >> +       fb =3D psb_framebuffer_create(dev, &mode_cmd, obj);
> >> +       if (IS_ERR(fb)) {
> >> +               ret =3D PTR_ERR(fb);
> >> +               goto err_drm_gem_object_put;
> >> +       }
> >> +
> >> +       fb_helper->fb =3D fb;
> >> +
> >> +       info->fbops =3D &psbfb_unaccel_ops;
> >> +
> >> +       info->fix.smem_start =3D dev_priv->fb_base;
> >> +       info->fix.smem_len =3D size;
> >> +       info->fix.ywrapstep =3D 0;
> >> +       info->fix.ypanstep =3D 0;
> >> +
> >> +       /* Accessed stolen memory directly */
> >> +       info->screen_base =3D dev_priv->vram_addr + backing->offset;
> >> +       info->screen_size =3D size;
> >> +
> >> +       drm_fb_helper_fill_info(info, fb_helper, sizes);
> >> +
> >> +       info->fix.mmio_start =3D pci_resource_start(pdev, 0);
> >> +       info->fix.mmio_len =3D pci_resource_len(pdev, 0);
> >> +
> >> +       /* Use default scratch pixmap (info->pixmap.flags =3D FB_PIXMA=
P_SYSTEM) */
> >> +
> >> +       dev_dbg(dev->dev, "allocated %dx%d fb\n", fb->width, fb->heigh=
t);
> >> +
> >> +       return 0;
> >> +
> >> +err_drm_gem_object_put:
> >> +       drm_gem_object_put(obj);
> >> +       return ret;
> >> +}
> >> +
> >> +static int psbfb_probe(struct drm_fb_helper *fb_helper,
> >> +                               struct drm_fb_helper_surface_size *siz=
es)
> >> +{
> >> +       struct drm_device *dev =3D fb_helper->dev;
> >> +       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >> +       unsigned int fb_size;
> >> +       int bytespp;
> >> +
> >> +       bytespp =3D sizes->surface_bpp / 8;
> >> +       if (bytespp =3D=3D 3)       /* no 24bit packed */
> >> +               bytespp =3D 4;
> >> +
> >> +       /*
> >> +        * If the mode will not fit in 32bit then switch to 16bit to g=
et
> >> +        * a console on full resolution. The X mode setting server wil=
l
> >> +        * allocate its own 32bit GEM framebuffer
> >> +        */
> >> +       fb_size =3D ALIGN(sizes->surface_width * bytespp, 64) *
> >> +                 sizes->surface_height;
> >> +       fb_size =3D ALIGN(fb_size, PAGE_SIZE);
> >> +
> >> +       if (fb_size > dev_priv->vram_stolen_size) {
> >> +               sizes->surface_bpp =3D 16;
> >> +               sizes->surface_depth =3D 16;
> >> +       }
> >> +
> >> +       return psbfb_create(fb_helper, sizes);
> >> +}
> >> +
> >> +static const struct drm_fb_helper_funcs psb_fb_helper_funcs =3D {
> >> +       .fb_probe =3D psbfb_probe,
> >> +};
> >> +
> >> +static int psb_fbdev_destroy(struct drm_device *dev,
> >> +                            struct drm_fb_helper *fb_helper)
> >> +{
> >> +       struct drm_framebuffer *fb =3D fb_helper->fb;
> >> +
> >> +       drm_fb_helper_unregister_info(fb_helper);
> >> +
> >> +       drm_fb_helper_fini(fb_helper);
> >> +       drm_framebuffer_unregister_private(fb);
> >> +       drm_framebuffer_cleanup(fb);
> >> +
> >> +       if (fb->obj[0])
> >> +               drm_gem_object_put(fb->obj[0]);
> >> +       kfree(fb);
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +int psb_fbdev_init(struct drm_device *dev)
> >> +{
> >> +       struct drm_fb_helper *fb_helper;
> >> +       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >> +       int ret;
> >> +
> >> +       fb_helper =3D kzalloc(sizeof(*fb_helper), GFP_KERNEL);
> >> +       if (!fb_helper)
> >> +               return -ENOMEM;
> >> +
> >> +       dev_priv->fb_helper =3D fb_helper;
> >> +
> >> +       drm_fb_helper_prepare(dev, fb_helper, 32, &psb_fb_helper_funcs=
);
> >> +
> >> +       ret =3D drm_fb_helper_init(dev, fb_helper);
> >> +       if (ret)
> >> +               goto free;
> >> +
> >> +       /* disable all the possible outputs/crtcs before entering KMS =
mode */
> >> +       drm_helper_disable_unused_functions(dev);
> >> +
> >> +       ret =3D drm_fb_helper_initial_config(fb_helper);
> >> +       if (ret)
> >> +               goto fini;
> >> +
> >> +       return 0;
> >> +
> >> +fini:
> >> +       drm_fb_helper_fini(fb_helper);
> >> +free:
> >> +       drm_fb_helper_unprepare(fb_helper);
> >> +       kfree(fb_helper);
> >> +       return ret;
> >> +}
> >> +
> >> +void psb_fbdev_fini(struct drm_device *dev)
> >> +{
> >> +       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >> +
> >> +       if (!dev_priv->fb_helper)
> >> +               return;
> >> +
> >> +       psb_fbdev_destroy(dev, dev_priv->fb_helper);
> >> +       drm_fb_helper_unprepare(dev_priv->fb_helper);
> >> +       kfree(dev_priv->fb_helper);
> >> +       dev_priv->fb_helper =3D NULL;
> >> +}
> >> diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gm=
a500/framebuffer.c
> >> index df4dbc509f68..506b881a7b24 100644
> >> --- a/drivers/gpu/drm/gma500/framebuffer.c
> >> +++ b/drivers/gpu/drm/gma500/framebuffer.c
> >> @@ -5,16 +5,12 @@
> >>    *
> >>    *******************************************************************=
*******/
> >>
> >> -#include <linux/pfn_t.h>
> >> -
> >> -#include <drm/drm_crtc_helper.h>
> >>   #include <drm/drm_fb_helper.h>
> >>   #include <drm/drm_framebuffer.h>
> >>   #include <drm/drm_gem_framebuffer_helper.h>
> >>   #include <drm/drm_modeset_helper.h>
> >>
> >>   #include "framebuffer.h"
> >> -#include "gem.h"
> >>   #include "psb_drv.h"
> >>
> >>   static const struct drm_framebuffer_funcs psb_fb_funcs =3D {
> >> @@ -22,126 +18,6 @@ static const struct drm_framebuffer_funcs psb_fb_f=
uncs =3D {
> >>          .create_handle =3D drm_gem_fb_create_handle,
> >>   };
> >>
> >> -#define CMAP_TOHW(_val, _width) ((((_val) << (_width)) + 0x7FFF - (_v=
al)) >> 16)
> >> -
> >> -static int psbfb_setcolreg(unsigned regno, unsigned red, unsigned gre=
en,
> >> -                          unsigned blue, unsigned transp,
> >> -                          struct fb_info *info)
> >> -{
> >> -       struct drm_fb_helper *fb_helper =3D info->par;
> >> -       struct drm_framebuffer *fb =3D fb_helper->fb;
> >> -       uint32_t v;
> >> -
> >> -       if (!fb)
> >> -               return -ENOMEM;
> >> -
> >> -       if (regno > 255)
> >> -               return 1;
> >> -
> >> -       red =3D CMAP_TOHW(red, info->var.red.length);
> >> -       blue =3D CMAP_TOHW(blue, info->var.blue.length);
> >> -       green =3D CMAP_TOHW(green, info->var.green.length);
> >> -       transp =3D CMAP_TOHW(transp, info->var.transp.length);
> >> -
> >> -       v =3D (red << info->var.red.offset) |
> >> -           (green << info->var.green.offset) |
> >> -           (blue << info->var.blue.offset) |
> >> -           (transp << info->var.transp.offset);
> >> -
> >> -       if (regno < 16) {
> >> -               switch (fb->format->cpp[0] * 8) {
> >> -               case 16:
> >> -                       ((uint32_t *) info->pseudo_palette)[regno] =3D=
 v;
> >> -                       break;
> >> -               case 24:
> >> -               case 32:
> >> -                       ((uint32_t *) info->pseudo_palette)[regno] =3D=
 v;
> >> -                       break;
> >> -               }
> >> -       }
> >> -
> >> -       return 0;
> >> -}
> >> -
> >> -static vm_fault_t psbfb_vm_fault(struct vm_fault *vmf)
> >> -{
> >> -       struct vm_area_struct *vma =3D vmf->vma;
> >> -       struct drm_framebuffer *fb =3D vma->vm_private_data;
> >> -       struct drm_device *dev =3D fb->dev;
> >> -       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >> -       struct psb_gem_object *pobj =3D to_psb_gem_object(fb->obj[0]);
> >> -       int page_num;
> >> -       int i;
> >> -       unsigned long address;
> >> -       vm_fault_t ret =3D VM_FAULT_SIGBUS;
> >> -       unsigned long pfn;
> >> -       unsigned long phys_addr =3D (unsigned long)dev_priv->stolen_ba=
se + pobj->offset;
> >> -
> >> -       page_num =3D vma_pages(vma);
> >> -       address =3D vmf->address - (vmf->pgoff << PAGE_SHIFT);
> >> -
> >> -       vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
> >> -
> >> -       for (i =3D 0; i < page_num; i++) {
> >> -               pfn =3D (phys_addr >> PAGE_SHIFT);
> >> -
> >> -               ret =3D vmf_insert_mixed(vma, address,
> >> -                               __pfn_to_pfn_t(pfn, PFN_DEV));
> >> -               if (unlikely(ret & VM_FAULT_ERROR))
> >> -                       break;
> >> -               address +=3D PAGE_SIZE;
> >> -               phys_addr +=3D PAGE_SIZE;
> >> -       }
> >> -       return ret;
> >> -}
> >> -
> >> -static void psbfb_vm_open(struct vm_area_struct *vma)
> >> -{
> >> -}
> >> -
> >> -static void psbfb_vm_close(struct vm_area_struct *vma)
> >> -{
> >> -}
> >> -
> >> -static const struct vm_operations_struct psbfb_vm_ops =3D {
> >> -       .fault  =3D psbfb_vm_fault,
> >> -       .open   =3D psbfb_vm_open,
> >> -       .close  =3D psbfb_vm_close
> >> -};
> >> -
> >> -static int psbfb_mmap(struct fb_info *info, struct vm_area_struct *vm=
a)
> >> -{
> >> -       struct drm_fb_helper *fb_helper =3D info->par;
> >> -       struct drm_framebuffer *fb =3D fb_helper->fb;
> >> -
> >> -       if (vma->vm_pgoff !=3D 0)
> >> -               return -EINVAL;
> >> -       if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
> >> -               return -EINVAL;
> >> -
> >> -       /*
> >> -        * If this is a GEM object then info->screen_base is the virtu=
al
> >> -        * kernel remapping of the object. FIXME: Review if this is
> >> -        * suitable for our mmap work
> >> -        */
> >> -       vma->vm_ops =3D &psbfb_vm_ops;
> >> -       vma->vm_private_data =3D (void *)fb;
> >> -       vma->vm_flags |=3D VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DO=
NTDUMP;
> >> -       return 0;
> >> -}
> >> -
> >> -static const struct fb_ops psbfb_unaccel_ops =3D {
> >> -       .owner =3D THIS_MODULE,
> >> -       DRM_FB_HELPER_DEFAULT_OPS,
> >> -       .fb_setcolreg =3D psbfb_setcolreg,
> >> -       .fb_read =3D drm_fb_helper_cfb_read,
> >> -       .fb_write =3D drm_fb_helper_cfb_write,
> >> -       .fb_fillrect =3D drm_fb_helper_cfb_fillrect,
> >> -       .fb_copyarea =3D drm_fb_helper_cfb_copyarea,
> >> -       .fb_imageblit =3D drm_fb_helper_cfb_imageblit,
> >> -       .fb_mmap =3D psbfb_mmap,
> >> -};
> >> -
> >>   /**
> >>    *     psb_framebuffer_init    -       initialize a framebuffer
> >>    *     @dev: our DRM device
> >> @@ -192,11 +68,9 @@ static int psb_framebuffer_init(struct drm_device =
*dev,
> >>    *
> >>    *     TODO: review object references
> >>    */
> >> -
> >> -static struct drm_framebuffer *psb_framebuffer_create
> >> -                       (struct drm_device *dev,
> >> -                        const struct drm_mode_fb_cmd2 *mode_cmd,
> >> -                        struct drm_gem_object *obj)
> >> +struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev=
,
> >> +                                              const struct drm_mode_f=
b_cmd2 *mode_cmd,
> >> +                                              struct drm_gem_object *=
obj)
> >>   {
> >>          struct drm_framebuffer *fb;
> >>          int ret;
> >> @@ -213,93 +87,6 @@ static struct drm_framebuffer *psb_framebuffer_cre=
ate
> >>          return fb;
> >>   }
> >>
> >> -/**
> >> - *     psbfb_create            -       create a framebuffer
> >> - *     @fb_helper: the framebuffer helper
> >> - *     @sizes: specification of the layout
> >> - *
> >> - *     Create a framebuffer to the specifications provided
> >> - */
> >> -static int psbfb_create(struct drm_fb_helper *fb_helper,
> >> -                               struct drm_fb_helper_surface_size *siz=
es)
> >> -{
> >> -       struct drm_device *dev =3D fb_helper->dev;
> >> -       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >> -       struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> >> -       struct fb_info *info;
> >> -       struct drm_framebuffer *fb;
> >> -       struct drm_mode_fb_cmd2 mode_cmd;
> >> -       int size;
> >> -       int ret;
> >> -       struct psb_gem_object *backing;
> >> -       struct drm_gem_object *obj;
> >> -       u32 bpp, depth;
> >> -
> >> -       mode_cmd.width =3D sizes->surface_width;
> >> -       mode_cmd.height =3D sizes->surface_height;
> >> -       bpp =3D sizes->surface_bpp;
> >> -       depth =3D sizes->surface_depth;
> >> -
> >> -       /* No 24bit packed */
> >> -       if (bpp =3D=3D 24)
> >> -               bpp =3D 32;
> >> -
> >> -       mode_cmd.pitches[0] =3D ALIGN(mode_cmd.width * DIV_ROUND_UP(bp=
p, 8), 64);
> >> -
> >> -       size =3D mode_cmd.pitches[0] * mode_cmd.height;
> >> -       size =3D ALIGN(size, PAGE_SIZE);
> >> -
> >> -       /* Allocate the framebuffer in the GTT with stolen page backin=
g */
> >> -       backing =3D psb_gem_create(dev, size, "fb", true, PAGE_SIZE);
> >> -       if (IS_ERR(backing))
> >> -               return PTR_ERR(backing);
> >> -       obj =3D &backing->base;
> >> -
> >> -       memset(dev_priv->vram_addr + backing->offset, 0, size);
> >> -
> >> -       info =3D drm_fb_helper_alloc_info(fb_helper);
> >> -       if (IS_ERR(info)) {
> >> -               ret =3D PTR_ERR(info);
> >> -               goto err_drm_gem_object_put;
> >> -       }
> >> -
> >> -       mode_cmd.pixel_format =3D drm_mode_legacy_fb_format(bpp, depth=
);
> >> -
> >> -       fb =3D psb_framebuffer_create(dev, &mode_cmd, obj);
> >> -       if (IS_ERR(fb)) {
> >> -               ret =3D PTR_ERR(fb);
> >> -               goto err_drm_gem_object_put;
> >> -       }
> >> -
> >> -       fb_helper->fb =3D fb;
> >> -
> >> -       info->fbops =3D &psbfb_unaccel_ops;
> >> -
> >> -       info->fix.smem_start =3D dev_priv->fb_base;
> >> -       info->fix.smem_len =3D size;
> >> -       info->fix.ywrapstep =3D 0;
> >> -       info->fix.ypanstep =3D 0;
> >> -
> >> -       /* Accessed stolen memory directly */
> >> -       info->screen_base =3D dev_priv->vram_addr + backing->offset;
> >> -       info->screen_size =3D size;
> >> -
> >> -       drm_fb_helper_fill_info(info, fb_helper, sizes);
> >> -
> >> -       info->fix.mmio_start =3D pci_resource_start(pdev, 0);
> >> -       info->fix.mmio_len =3D pci_resource_len(pdev, 0);
> >> -
> >> -       /* Use default scratch pixmap (info->pixmap.flags =3D FB_PIXMA=
P_SYSTEM) */
> >> -
> >> -       dev_dbg(dev->dev, "allocated %dx%d fb\n", fb->width, fb->heigh=
t);
> >> -
> >> -       return 0;
> >> -
> >> -err_drm_gem_object_put:
> >> -       drm_gem_object_put(obj);
> >> -       return ret;
> >> -}
> >> -
> >>   /**
> >>    *     psb_user_framebuffer_create     -       create framebuffer
> >>    *     @dev: our DRM device
> >> @@ -331,105 +118,6 @@ static struct drm_framebuffer *psb_user_framebuf=
fer_create
> >>          return fb;
> >>   }
> >>
> >> -static int psbfb_probe(struct drm_fb_helper *fb_helper,
> >> -                               struct drm_fb_helper_surface_size *siz=
es)
> >> -{
> >> -       struct drm_device *dev =3D fb_helper->dev;
> >> -       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >> -       unsigned int fb_size;
> >> -       int bytespp;
> >> -
> >> -       bytespp =3D sizes->surface_bpp / 8;
> >> -       if (bytespp =3D=3D 3)       /* no 24bit packed */
> >> -               bytespp =3D 4;
> >> -
> >> -       /* If the mode will not fit in 32bit then switch to 16bit to g=
et
> >> -          a console on full resolution. The X mode setting server wil=
l
> >> -          allocate its own 32bit GEM framebuffer */
> >> -       fb_size =3D ALIGN(sizes->surface_width * bytespp, 64) *
> >> -                 sizes->surface_height;
> >> -       fb_size =3D ALIGN(fb_size, PAGE_SIZE);
> >> -
> >> -       if (fb_size > dev_priv->vram_stolen_size) {
> >> -                sizes->surface_bpp =3D 16;
> >> -                sizes->surface_depth =3D 16;
> >> -        }
> >> -
> >> -       return psbfb_create(fb_helper, sizes);
> >> -}
> >> -
> >> -static const struct drm_fb_helper_funcs psb_fb_helper_funcs =3D {
> >> -       .fb_probe =3D psbfb_probe,
> >> -};
> >> -
> >> -static int psb_fbdev_destroy(struct drm_device *dev,
> >> -                            struct drm_fb_helper *fb_helper)
> >> -{
> >> -       struct drm_framebuffer *fb =3D fb_helper->fb;
> >> -
> >> -       drm_fb_helper_unregister_info(fb_helper);
> >> -
> >> -       drm_fb_helper_fini(fb_helper);
> >> -       drm_framebuffer_unregister_private(fb);
> >> -       drm_framebuffer_cleanup(fb);
> >> -
> >> -       if (fb->obj[0])
> >> -               drm_gem_object_put(fb->obj[0]);
> >> -       kfree(fb);
> >> -
> >> -       return 0;
> >> -}
> >> -
> >> -int psb_fbdev_init(struct drm_device *dev)
> >> -{
> >> -       struct drm_fb_helper *fb_helper;
> >> -       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >> -       int ret;
> >> -
> >> -       fb_helper =3D kzalloc(sizeof(*fb_helper), GFP_KERNEL);
> >> -       if (!fb_helper) {
> >> -               dev_err(dev->dev, "no memory\n");
> >> -               return -ENOMEM;
> >> -       }
> >> -
> >> -       dev_priv->fb_helper =3D fb_helper;
> >> -
> >> -       drm_fb_helper_prepare(dev, fb_helper, 32, &psb_fb_helper_funcs=
);
> >> -
> >> -       ret =3D drm_fb_helper_init(dev, fb_helper);
> >> -       if (ret)
> >> -               goto free;
> >> -
> >> -       /* disable all the possible outputs/crtcs before entering KMS =
mode */
> >> -       drm_helper_disable_unused_functions(dev);
> >> -
> >> -       ret =3D drm_fb_helper_initial_config(fb_helper);
> >> -       if (ret)
> >> -               goto fini;
> >> -
> >> -       return 0;
> >> -
> >> -fini:
> >> -       drm_fb_helper_fini(fb_helper);
> >> -free:
> >> -       drm_fb_helper_unprepare(fb_helper);
> >> -       kfree(fb_helper);
> >> -       return ret;
> >> -}
> >> -
> >> -static void psb_fbdev_fini(struct drm_device *dev)
> >> -{
> >> -       struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> >> -
> >> -       if (!dev_priv->fb_helper)
> >> -               return;
> >> -
> >> -       psb_fbdev_destroy(dev, dev_priv->fb_helper);
> >> -       drm_fb_helper_unprepare(dev_priv->fb_helper);
> >> -       kfree(dev_priv->fb_helper);
> >> -       dev_priv->fb_helper =3D NULL;
> >> -}
> >> -
> >>   static const struct drm_mode_config_funcs psb_mode_funcs =3D {
> >>          .fb_create =3D psb_user_framebuffer_create,
> >>          .output_poll_changed =3D drm_fb_helper_output_poll_changed,
> >> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500=
/psb_drv.h
> >> index a5df6d2f2cab..cd0a30011572 100644
> >> --- a/drivers/gpu/drm/gma500/psb_drv.h
> >> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> >> @@ -610,7 +610,24 @@ extern void psb_lid_timer_takedown(struct drm_psb=
_private *dev_priv);
> >>   /* modesetting */
> >>   extern void psb_modeset_init(struct drm_device *dev);
> >>   extern void psb_modeset_cleanup(struct drm_device *dev);
> >> +
> >> +/* framebuffer */
> >> +extern struct drm_framebuffer *psb_framebuffer_create(struct drm_devi=
ce *dev,
> >> +                                                     const struct drm=
_mode_fb_cmd2 *mode_cmd,
> >> +                                                     struct drm_gem_o=
bject *obj);
> >> +
> >> +/* fbdev */
> >> +#if defined(CONFIG_DRM_FBDEV_EMULATION)
> >>   extern int psb_fbdev_init(struct drm_device *dev);
> >> +extern void psb_fbdev_fini(struct drm_device *dev);
> >> +#else
> >> +int psb_fbdev_init(struct drm_device *dev)
> >> +{
> >> +       return 0;
> >> +}
> >> +void psb_fbdev_fini(struct drm_device *dev)
> >> +{ }
> >> +#endif
> >>
> >>   /* backlight.c */
> >>   int gma_backlight_init(struct drm_device *dev);
> >> --
> >> 2.39.2
> >>
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
