Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0339E603D89
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 11:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C495E10EA9F;
	Wed, 19 Oct 2022 09:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5123610EA9F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 09:04:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 bh7-20020a05600c3d0700b003c6fb3b2052so4929776wmb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 02:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NrZg8tooH1yOnzWrypIBMmFTPHGQfUX7xh1NNIa2u4M=;
 b=NCQGrZCOuvTdZbsFAIokwjQlfRQkkZcRFpkpa+20sJKqFqk/bIGXfBINDumRbl0+m/
 PJXpZVQZiJud6Tc7moOLARsU+zu7MzZpuHLRlVWQUThir1Tr0L+phwNUo+qnueP57jP2
 1eWmXzYZ46tJfhiixg6KLg3jCm1DliOGEtLeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NrZg8tooH1yOnzWrypIBMmFTPHGQfUX7xh1NNIa2u4M=;
 b=Algk97H/m3ddMmrh2b2VfHCuSPqMcCaTHlbFKVwU3Vk9ZajHGcPpTaVMC9Mu1GzUrq
 d5baJip69jfR+vkKNfo0k86oI0WZPQzEU2elzhFE/74PRrTjjfvmQaBKfHXWzI8ftQWd
 FiCw5x1LNTqFYrad7RMMcca3NDRlAFJPHu9EBQxGjYSzQ/eqVCINMsv1t0xf3cmwqJeA
 aIpYr4HcdbTV2M+lYzUbnkxAji1Zgzyp7VeCRwEagDkCWsuoKBxhOyi/pgXRXSoELTDp
 dfwwx7oJN8sBiFkGguWf1KuKDLr/zgZZ14/vEGdL7XjzYngXcAewTmbUBPHbWLuPE4hy
 xW/A==
X-Gm-Message-State: ACrzQf2/NmiiWsU6oVg7hRuL6p0N3P1FGQY82Yo59VhaB+Dh+d31j920
 BqCr8BIeAEInHHDzGv301GTFjg==
X-Google-Smtp-Source: AMsMyM5HZ3lZrLtt5izS7xZadWbFVCatzI1VQQIUAuik93OcdPbyb20krlDJjhOaOEsv3DLkDAAGJQ==
X-Received: by 2002:a05:600c:468e:b0:3c6:f243:89c2 with SMTP id
 p14-20020a05600c468e00b003c6f24389c2mr13512420wmo.150.1666170266549; 
 Wed, 19 Oct 2022 02:04:26 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i
 (net-188-217-54-207.cust.vodafonedsl.it. [188.217.54.207])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a1c2606000000b003c452678025sm21088500wmm.4.2022.10.19.02.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 02:04:25 -0700 (PDT)
Date: Wed, 19 Oct 2022 11:04:23 +0200
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: [PATCH 2/2] drm/tiny: add support for tft displays based on
 ilitek,ili9488
Message-ID: <20221019090423.GA1737196@tom-ThinkPad-T14s-Gen-2i>
References: <20221018164532.1705215-1-tommaso.merciai@amarulasolutions.com>
 <20221018164532.1705215-3-tommaso.merciai@amarulasolutions.com>
 <CAOf5uw=6kGHFxU7R2b8GdU3orDxmJEuPoB=rv-neiskZpjhOWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOf5uw=6kGHFxU7R2b8GdU3orDxmJEuPoB=rv-neiskZpjhOWA@mail.gmail.com>
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
Cc: linuxfancy@googlegroups.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, kamlesh.gurudasani@gmail.com,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 08:31:22PM +0200, Michael Nazzareno Trimarchi wrote:

Hi Michael,

> Hi
> 
> On Tue, Oct 18, 2022 at 6:46 PM Tommaso Merciai
> <tommaso.merciai@amarulasolutions.com> wrote:
> >
> > This adds support for ilitek,ili9488 based displays with shift register
> > in front of controller. Waveshare,pico-restouch-lcd-3.5 are such displays
> >
> > Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> > ---
> 
> Because I start to make it working this driver, I think that my
> signed-off is missing here

Yes, right. :)
I upload in v2, my bad

> 
> >  drivers/gpu/drm/tiny/Kconfig   |  13 +
> >  drivers/gpu/drm/tiny/Makefile  |   1 +
> >  drivers/gpu/drm/tiny/ili9488.c | 440 +++++++++++++++++++++++++++++++++
> >  3 files changed, 454 insertions(+)
> >  create mode 100644 drivers/gpu/drm/tiny/ili9488.c
> >
> > diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> > index 027cd87c3d0d7..6e708e8414806 100644
> > --- a/drivers/gpu/drm/tiny/Kconfig
> > +++ b/drivers/gpu/drm/tiny/Kconfig
> > @@ -148,6 +148,19 @@ config TINYDRM_ILI9486
> >
> >           If M is selected the module will be called ili9486.
> >
> > +config TINYDRM_ILI9488
> > +       tristate "DRM support for ILI9488 display panels"
> > +       depends on DRM && SPI
> > +       select DRM_KMS_HELPER
> > +       select DRM_GEM_CMA_HELPER
> > +       select DRM_MIPI_DBI
> > +       select BACKLIGHT_CLASS_DEVICE
> > +       help
> > +         DRM driver for the following Ilitek ILI9488 panels:
> > +         * LCD 3.5" 320x480 TFT (Waveshare Pico-ResTouch-LCD-3.5")
> > +
> > +         If M is selected the module will be called ili9486.
> > +
> >  config TINYDRM_MI0283QT
> >         tristate "DRM support for MI0283QT"
> >         depends on DRM && SPI
> > diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
> > index 1d9d6227e7ab7..aad6683b2ac40 100644
> > --- a/drivers/gpu/drm/tiny/Makefile
> > +++ b/drivers/gpu/drm/tiny/Makefile
> > @@ -11,6 +11,7 @@ obj-$(CONFIG_TINYDRM_ILI9163)         += ili9163.o
> >  obj-$(CONFIG_TINYDRM_ILI9225)          += ili9225.o
> >  obj-$(CONFIG_TINYDRM_ILI9341)          += ili9341.o
> >  obj-$(CONFIG_TINYDRM_ILI9486)          += ili9486.o
> > +obj-$(CONFIG_TINYDRM_ILI9488)          += ili9488.o
> >  obj-$(CONFIG_TINYDRM_MI0283QT)         += mi0283qt.o
> >  obj-$(CONFIG_TINYDRM_REPAPER)          += repaper.o
> >  obj-$(CONFIG_TINYDRM_ST7586)           += st7586.o
> > diff --git a/drivers/gpu/drm/tiny/ili9488.c b/drivers/gpu/drm/tiny/ili9488.c
> > new file mode 100644
> > index 0000000000000..b94d9d4ff4544
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tiny/ili9488.c
> > @@ -0,0 +1,440 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * DRM driver for Ilitek ILI9488 panels
> > + *
> > + * Copyright 2020 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> > + */
> 
> Code was changed a bit so please add copyright of me and you

Agree, thanks.

> 
> > +
> > +#include <linux/delay.h>
> > +#include <linux/dma-buf.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/module.h>
> > +#include <linux/property.h>
> > +#include <linux/spi/spi.h>
> > +#include <video/mipi_display.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_damage_helper.h>
> > +#include <drm/drm_framebuffer.h>
> > +#include <drm/drm_gem_atomic_helper.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_managed.h>
> > +#include <drm/drm_mipi_dbi.h>
> > +#include <drm/drm_modeset_helper.h>
> > +
> > +#define ILI9488_VCOM_CONTROL_1                 0xC5
> > +#define ILI9488_COLUMN_ADDRESS_SET             0x2A
> > +#define ILI9488_PAGE_ADDRESS_SET               0x2B
> > +#define ILI9488_MEMORY_WRITE                   0x2C
> > +#define ILI9488_POSITIVE_GAMMA_CORRECTION      0xE0
> > +#define ILI9488_NEGATIVE_GAMMA_CORRECTION      0xE1
> > +#define ILI9488_POWER_CONTROL_1                        0xC0
> > +#define ILI9488_POWER_CONTROL_2                        0xC1
> > +#define ILI9488_POWER_CONTROL_3                        0xC2
> > +#define ILI9488_MEM_ACCESS_CONTROL             0x36
> > +#define ILI9488_COLMOD_PIXEL_FORMAT_SET                0x3A
> > +#define ILI9488_INTERFACE_MODE_CONTROL         0xB0
> > +#define ILI9488_FRAME_RATE_CONTROL_PARTIAL     0xB3
> > +#define ILI9488_DISPLAY_INVERSION_ON           0x21
> > +#define ILI9488_DISPLAY_INVERSION_CONTROL      0xB4
> > +#define ILI9488_DISPLAY_FUNCTION_CONTROL       0xB6
> > +#define ILI9488_ENTRY_MODE_SET                 0xB7
> > +#define ILI9488_HS_LANES_CONTROL               0xBE
> > +#define ILI9488_SET_IMAGE_FUNCTION             0xE9
> > +#define ILI9488_ADJUST_CONTROL_3               0xF7
> > +#define ILI9488_DISPLAY_ON                     0x29
> > +#define ILI9488_DISPLAY_OFF                    0x28
> > +#define ILI9488_ENTER_SLEEP_MODE               0x10
> > +#define ILI9488_DBI_BPP18                      0x06
> > +#define ILI9488_DBI_BPP16                      0x05
> > +#define ILI9488_DPI_BPP24                      0x70
> > +#define ILI9488_DPI_BPP18                      0x60
> > +#define ILI9488_DPI_BPP16                      0x50
> > +#define ILI9488_FRAME_RATE_CONTROL_NORMAL      0xB1
> > +#define ILI9488_SLEEP_OUT                      0x11
> > +
> > +#define ILI9488_MADCTL_RGB     BIT(2)
> > +#define ILI9488_MADCTL_BGR     BIT(3)
> > +#define ILI9488_MADCTL_MV      BIT(5)
> > +#define ILI9488_MADCTL_MX      BIT(6)
> > +#define ILI9488_MADCTL_MY      BIT(7)
> > +
> > +static void ili9488_rgb565_to_rgb666_line(u8 *dst, u16 *sbuf,
> > +                                         unsigned int pixels)
> > +{
> > +       unsigned int x;
> > +
> > +       for (x = 0; x < pixels; x++) {
> > +               *dst++ = ((*sbuf & 0xF800) >> 8);
> > +               *dst++ = ((*sbuf & 0x07E0) >> 3);
> > +               *dst++ = ((*sbuf & 0x001F) << 3);
> > +               sbuf++;
> > +       }
> > +}
> > +
> > +static void ili9488_rgb565_to_rgb666(u8 *dst, void *vaddr,
> > +                                    struct drm_framebuffer *fb,
> > +                                    struct drm_rect *rect)
> > +{
> > +       unsigned long linepixels = drm_rect_width(rect);
> > +       unsigned long lines = drm_rect_height(rect);
> > +       size_t dst_len = linepixels * 3;
> > +       size_t src_len = linepixels * fb->format->cpp[0];
> > +       unsigned int y;
> > +       u16 *sbuf;
> > +
> > +       /*
> > +        * The cma memory is write-combined so reads are uncached.
> > +        * Speed up by fetching one line at a time.
> > +        */
> > +       sbuf = kmalloc(src_len, GFP_KERNEL);
> > +       if (!sbuf)
> > +               return;
> > +
> > +       memset(sbuf, 0, src_len);
> > +
> 
> Is this really needed?. This will be write on the copy

You are right, this comes from some test. I remove this in v2.

> 
> > +       vaddr += rect->y1 * fb->pitches[0] + rect->x1 * fb->format->cpp[0];
> > +       for (y = 0; y < lines; y++) {
> > +               memcpy(sbuf, vaddr, src_len);
> > +               ili9488_rgb565_to_rgb666_line(dst, sbuf, linepixels);
> > +               vaddr += fb->pitches[0];
> > +               dst += dst_len;
> > +       }
> > +       kfree(sbuf);
> > +}
> > +
> > +static int ili9488_buf_copy(void *dst, struct drm_framebuffer *fb,
> > +                           struct drm_rect *rect)
> > +{
> > +       struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
> > +       void *src = cma_obj->vaddr;
> > +       int ret = 0;
> > +
> > +       ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
> > +       if (ret)
> > +               return ret;
> > +
> > +       switch (fb->format->format) {
> > +       case DRM_FORMAT_RGB565:
> > +               ili9488_rgb565_to_rgb666(dst, src, fb, rect);
> > +               break;
> > +       default:
> > +               dev_err_once(fb->dev->dev, "Format is not supported: %p4cc\n",
> > +                               &fb->format->format);
> > +               return -EINVAL;
> > +       }
> > +
> > +       drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> > +
> > +       return ret;
> > +}
> > +
> > +static void ili9488_dbi_set_window_address(struct mipi_dbi_dev *dbidev,
> > +                                       unsigned int xs, unsigned int xe,
> > +                                       unsigned int ys, unsigned int ye)
> > +{
> > +       struct mipi_dbi *dbi = &dbidev->dbi;
> > +
> > +       xs += dbidev->left_offset;
> > +       xe += dbidev->left_offset;
> > +       ys += dbidev->top_offset;
> > +       ye += dbidev->top_offset;
> > +
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_COLUMN_ADDRESS, (xs >> 8) & 0xff,
> > +                        xs & 0xff, (xe >> 8) & 0xff, xe & 0xff);
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_PAGE_ADDRESS, (ys >> 8) & 0xff,
> > +                        ys & 0xff, (ye >> 8) & 0xff, ye & 0xff);
> > +}
> > +
> 
> This is duplicated from the drm and maybe we can export from there

I'll check and let you know.

> 
> > +static void ili9488_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
> > +{
> > +       struct iosys_map map[DRM_FORMAT_MAX_PLANES];
> > +       struct iosys_map data[DRM_FORMAT_MAX_PLANES];
> > +       struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
> > +       unsigned int height = rect->y2 - rect->y1;
> > +       unsigned int width = rect->x2 - rect->x1;
> > +       struct mipi_dbi *dbi = &dbidev->dbi;
> > +       int idx, ret = 0;
> > +       bool full;
> > +       void *tr;
> > +
> > +       if (WARN_ON(!fb))
> > +               return;
> > +
> > +       if (!drm_dev_enter(fb->dev, &idx))
> > +               return;
> > +
> > +       ret = drm_gem_fb_vmap(fb, map, data);
> > +       if (ret)
> > +               goto err_drm_dev_exit;
> > +
> > +       full = width == fb->width && height == fb->height;
> > +
> > +       DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
> > +
> > +       if (!dbi->dc || !full ||
> > +           fb->format->format == DRM_FORMAT_RGB565) {
> > +               tr = dbidev->tx_buf;
> > +               ret = ili9488_buf_copy(dbidev->tx_buf, fb, rect);
> > +               if (ret)
> > +                       goto err_msg;
> > +       } else {
> > +               tr = data[0].vaddr; /* TODO: Use mapping abstraction properly */
> > +       }
> > +
> > +       ili9488_dbi_set_window_address(dbidev, rect->x1, rect->x2 - 1, rect->y1,
> > +                                   rect->y2 - 1);
> > +
> > +       ret = mipi_dbi_command_buf(dbi, MIPI_DCS_WRITE_MEMORY_START, tr,
> > +                                  width * height * 3);
> > +err_msg:
> > +       if (ret)
> > +               drm_err_once(fb->dev, "Failed to update display %d\n", ret);
> > +
> > +       drm_gem_fb_vunmap(fb, map);
> > +
> > +err_drm_dev_exit:
> > +       drm_dev_exit(idx);
> > +}
> > +
> > +static void ili9488_pipe_update(struct drm_simple_display_pipe *pipe,
> > +                              struct drm_plane_state *old_state)
> > +{
> > +       struct drm_plane_state *state = pipe->plane.state;
> > +       struct drm_rect rect;
> > +
> > +       if (!pipe->crtc.state->active)
> > +               return;
> > +
> > +       if (drm_atomic_helper_damage_merged(old_state, state, &rect))
> > +               ili9488_fb_dirty(state->fb, &rect);
> > +}
> > +
> > +static void ili9488_pipe_enable(struct drm_simple_display_pipe *pipe,
> > +                               struct drm_crtc_state *crtc_state,
> > +                               struct drm_plane_state *plane_state)
> > +{
> > +       struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
> > +       struct drm_framebuffer *fb = plane_state->fb;
> > +       struct mipi_dbi *dbi = &dbidev->dbi;
> > +       u8 addr_mode;
> > +       struct drm_rect rect = {
> > +               .x1 = 0,
> > +               .x2 = fb->width,
> > +               .y1 = 0,
> > +               .y2 = fb->height,
> > +       };
> 
> rect can be dropped
> 
> > +       int ret, idx;
> > +
> > +       if (!drm_dev_enter(pipe->crtc.dev, &idx))
> > +               return;
> > +
> > +       DRM_DEBUG_KMS("\n");
> > +
> > +       ret = mipi_dbi_poweron_conditional_reset(dbidev);
> > +       if (ret < 0)
> > +               goto out_exit;
> > +       if (ret == 1)
> > +               goto out_enable;
> > +
> > +       mipi_dbi_command(dbi, ILI9488_DISPLAY_INVERSION_ON);
> > +       mipi_dbi_command(dbi, ILI9488_POWER_CONTROL_3, 0x33);
> > +       mipi_dbi_command(dbi, ILI9488_FRAME_RATE_CONTROL_NORMAL, 0xB0);
> > +       mipi_dbi_command(dbi, ILI9488_MEM_ACCESS_CONTROL, 0x28);
> > +
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, 0x65);
> > +
> > +       mipi_dbi_command(dbi, ILI9488_POSITIVE_GAMMA_CORRECTION,
> > +                        0x00, 0x13, 0x18, 0x04, 0x0F,
> > +                        0x06, 0x3A, 0x56, 0x4D, 0x03,
> > +                        0x0A, 0x06, 0x30, 0x3E, 0x0F);
> > +       mipi_dbi_command(dbi, ILI9488_NEGATIVE_GAMMA_CORRECTION,
> > +                        0x00, 0x13, 0x18, 0x01, 0x11,
> > +                        0x06, 0x38, 0x3A, 0x4D, 0x06,
> > +                        0x0D, 0x0B, 0x31, 0x37, 0x0F);
> > +
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_18BIT);
> > +       mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
> > +       msleep(120);
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
> > +       msleep(100);
> > +
> > +out_enable:
> > +       switch (dbidev->rotation) {
> > +       default:
> > +               addr_mode = ILI9488_MADCTL_MX;
> > +               break;
> > +       case 90:
> > +               addr_mode = ILI9488_MADCTL_MV;
> > +               break;
> > +       case 180:
> > +               addr_mode = ILI9488_MADCTL_MY;
> > +               break;
> > +       case 270:
> > +               addr_mode = ILI9488_MADCTL_MV | ILI9488_MADCTL_MY |
> > +                       ILI9488_MADCTL_MX;
> > +               break;
> > +       }
> > +       addr_mode |= ILI9488_MADCTL_BGR;
> > +       mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
> > +       ili9488_fb_dirty(fb, &rect);
> 
> This is not needed and and rect can be drop as I have on latest code
> 
>    mipi_dbi_command(dbi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
>    mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
> 
> The flush should call the pipeline_update and you don't need to have
> then anything more than this

Don't agree on this I found the following description:

drivers/gpu/drm/drm_mipi_dbi.c

Note: Drivers which don't use mipi_dbi_pipe_update() because they have custom
framebuffer flushing, can't use this function since they both use the same
flushing code.

Thanks & Regards,
Tommaso

> 
> Michael
> 
> > +out_exit:
> > +       drm_dev_exit(idx);
> > +}
> > +
> > +static void ili9488_pipe_disable(struct drm_simple_display_pipe *pipe)
> > +{
> > +       struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
> > +       /*
> > +        * This callback is not protected by drm_dev_enter/exit since we want to
> > +        * turn off the display on regular driver unload. It's highly unlikely
> > +        * that the underlying SPI controller is gone should this be called
> > +        * after unplug.
> > +        */
> > +
> > +       DRM_DEBUG_KMS("\n");
> > +
> > +       mipi_dbi_command(&dbidev->dbi, MIPI_DCS_SET_DISPLAY_OFF);
> > +}
> > +
> > +static const u32 ili9488_formats[] = {
> > +       DRM_FORMAT_RGB565,
> > +};
> > +
> > +static const struct drm_simple_display_pipe_funcs ili9488_pipe_funcs = {
> > +       .enable = ili9488_pipe_enable,
> > +       .disable = ili9488_pipe_disable,
> > +       .update = ili9488_pipe_update,
> > +};
> > +
> > +static const struct drm_display_mode ili9488_mode = {
> > +       DRM_SIMPLE_MODE(320, 480, 49, 73),
> > +};
> > +
> > +DEFINE_DRM_GEM_CMA_FOPS(ili9488_fops);
> > +
> > +static struct drm_driver ili9488_driver = {
> > +       .driver_features        = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> > +       .fops                   = &ili9488_fops,
> > +       DRM_GEM_CMA_DRIVER_OPS_VMAP,
> > +       .debugfs_init           = mipi_dbi_debugfs_init,
> > +       .name                   = "ili9488",
> > +       .desc                   = "Ilitek ILI9488",
> > +       .date                   = "20221017",
> > +       .major                  = 1,
> > +       .minor                  = 0,
> > +};
> > +
> > +static const struct of_device_id ili9488_of_match[] = {
> > +       { .compatible = "waveshare,pico-rt-lcd-35" },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(of, ili9488_of_match);
> > +
> > +static const struct spi_device_id ili9488_id[] = {
> > +       { "ili9488", 0 },
> > +       { }
> > +};
> > +MODULE_DEVICE_TABLE(spi, ili9488_id);
> > +
> > +static int ili9488_probe(struct spi_device *spi)
> > +{
> > +       struct device *dev = &spi->dev;
> > +       struct mipi_dbi_dev *dbidev;
> > +       struct drm_device *drm;
> > +       struct mipi_dbi *dbi;
> > +       struct gpio_desc *dc;
> > +       u32 rotation = 0;
> > +       size_t bufsize;
> > +       int ret;
> > +
> > +       dbidev = devm_drm_dev_alloc(dev, &ili9488_driver,
> > +                                   struct mipi_dbi_dev, drm);
> > +       if (IS_ERR(dbidev))
> > +               return PTR_ERR(dbidev);
> > +
> > +       dbi = &dbidev->dbi;
> > +       drm = &dbidev->drm;
> > +
> > +       bufsize = ili9488_mode.vdisplay * ili9488_mode.hdisplay * 3;
> > +
> > +       dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +       if (IS_ERR(dbi->reset)) {
> > +               DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
> > +               return PTR_ERR(dbi->reset);
> > +       }
> > +
> > +       dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
> > +       if (IS_ERR(dc)) {
> > +               DRM_DEV_ERROR(dev, "Failed to get gpio 'dc'\n");
> > +               return PTR_ERR(dc);
> > +       }
> > +
> > +       dbidev->backlight = devm_of_find_backlight(dev);
> > +       if (IS_ERR(dbidev->backlight))
> > +               return PTR_ERR(dbidev->backlight);
> > +
> > +       device_property_read_u32(dev, "rotation", &rotation);
> > +
> > +       ret = mipi_dbi_spi_init(spi, dbi, dc);
> > +       if (ret)
> > +               return ret;
> > +
> > +       dbidev->drm.mode_config.preferred_depth = 16;
> > +
> > +       ret = mipi_dbi_dev_init_with_formats(dbidev, &ili9488_pipe_funcs,
> > +                                            ili9488_formats,
> > +                                            ARRAY_SIZE(ili9488_formats),
> > +                                            &ili9488_mode, rotation, bufsize);
> > +       if (ret)
> > +               return ret;
> > +
> > +       dbi->swap_bytes = true;
> > +       drm_mode_config_reset(drm);
> > +
> > +       ret = drm_dev_register(drm, 0);
> > +       if (ret)
> > +               return ret;
> > +
> > +       spi_set_drvdata(spi, drm);
> > +
> > +       drm_fbdev_generic_setup(drm, 0);
> > +
> > +       return 0;
> > +}
> > +
> > +static void ili9488_remove(struct spi_device *spi)
> > +{
> > +       struct drm_device *drm = spi_get_drvdata(spi);
> > +
> > +       drm_dev_unplug(drm);
> > +       drm_atomic_helper_shutdown(drm);
> > +}
> > +
> > +static void ili9488_shutdown(struct spi_device *spi)
> > +{
> > +       drm_atomic_helper_shutdown(spi_get_drvdata(spi));
> > +}
> > +
> > +static struct spi_driver ili9488_spi_driver = {
> > +       .driver = {
> > +               .name = "ili9488",
> > +               .owner = THIS_MODULE,
> > +               .of_match_table = ili9488_of_match,
> > +       },
> > +       .id_table = ili9488_id,
> > +       .probe = ili9488_probe,
> > +       .remove = ili9488_remove,
> > +       .shutdown = ili9488_shutdown,
> > +};
> > +module_spi_driver(ili9488_spi_driver);
> > +
> > +MODULE_DESCRIPTION("Ilitek ILI9488 DRM driver");
> > +MODULE_AUTHOR("Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>");
> > +MODULE_AUTHOR("Michael Trimarchi <michael@amarulasolutions.com>");
> > +MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai@amarulasolutions.com>");
> > +MODULE_LICENSE("GPL");
> > \ No newline at end of file
> > --
> > 2.25.1
> >
> 
> 
> -- 
> Michael Nazzareno Trimarchi
> Co-Founder & Chief Executive Officer
> M. +39 347 913 2170
> michael@amarulasolutions.com
> __________________________________
> 
> Amarula Solutions BV
> Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
> T. +31 (0)85 111 9172
> info@amarulasolutions.com
> www.amarulasolutions.com

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
