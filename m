Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC06B3186C0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 10:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0936EDEE;
	Thu, 11 Feb 2021 09:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4FB6EAC5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 08:22:04 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id m1so4615781wml.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 00:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4HgiPXcjg9qafqjtUOvFz2JXhEk55VfKUWDFvbfmlUw=;
 b=cvw03PaORhSb8+dPeY19iXH+oJBEX/4jp2YZZULXcyKPpXJji8H9IzJBAOZQTtQGfx
 3bkLNizhSM39inZvUrXmIvPi33ssjwMr6QjUtGLAKLnemfXvWjEMO6SCqXxYDAqqXnPj
 fbhxmZagCThBFAPNgWT+bLBdf0B/BfbpwtOIgUYQfCDNltAn/BK4mNESxAXMp0D8f1qq
 AaymZe7i6NkLb1kSho7Rju0Z1RNOwrSgftlgDswpaU8EVKM+8MPaHrPkz7N5Yb3g3+1s
 FfAiv04C8pskMZLHA9gLQ7y8vsV5AFX8o6oBq00BT8MKLAqyymtoTm2R3l+xzmB0Jkzr
 l2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4HgiPXcjg9qafqjtUOvFz2JXhEk55VfKUWDFvbfmlUw=;
 b=kdyjEF6xuSuZsU8U6tfZshkCtTMfYzRN+mdL3s4ji6FcT17nqxYvWycWRlD+uQ48wl
 U/ferSFxlJs0qVihqy9ToZci1mSJzvWPouMi1z1zDh8ovqVe/nWq4ZIFpQyvNerWh+JE
 caaDnFEPaSU+a7VzYz6dnO/FqVNNHaeU2xlcfsCOBMUsN7hLgOhXDgYx7bqljZscUQkn
 BVfAMnEYPQhFXfwrzJZvmg8Yjft66oBYlpWE/A5DU1pQyKAEUUxMubxNZxpt7xF5oxyO
 PG0Oak0+J7NILT8Vbc9eWQE/ovogMSvThJCmENdIHaCGDrJpcciezd1ekf6hV6xhHC1s
 39qQ==
X-Gm-Message-State: AOAM530LMyQhTjAgACC345cTo7gN9hLpEddvpVTnZgxrwiFO2mLXI7ro
 0jeY/AdUBhfKPeRabo4KsLn8y3uBJSmjqHGeM6E=
X-Google-Smtp-Source: ABdhPJzQ0DXFPk+M5UN9FhBtPSrt9w5pXpKKn3NszIIATh65fQdD0T3dMh9pjT80+MLIAO6otYtvGNmeFuf95nHa/Uk=
X-Received: by 2002:a1c:3cd6:: with SMTP id j205mr3791569wma.166.1613031722960; 
 Thu, 11 Feb 2021 00:22:02 -0800 (PST)
MIME-Version: 1.0
References: <1609854367-2720-1-git-send-email-kevin3.tang@gmail.com>
 <1609854367-2720-5-git-send-email-kevin3.tang@gmail.com>
 <YBqwA7ixagBBZBbP@phenom.ffwll.local>
In-Reply-To: <YBqwA7ixagBBZBbP@phenom.ffwll.local>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Thu, 11 Feb 2021 16:21:51 +0800
Message-ID: <CAFPSGXY5=3RhbVNjD626u=A55h5NUCWVv3KzFnq_ZJ5X79qwrg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] drm/sprd: add Unisoc's drm display controller
 driver
To: Kevin Tang <kevin3.tang@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org
X-Mailman-Approved-At: Thu, 11 Feb 2021 09:18:17 +0000
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
Content-Type: multipart/mixed; boundary="===============1097575216=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1097575216==
Content-Type: multipart/alternative; boundary="000000000000dbca5705bb0b3610"

--000000000000dbca5705bb0b3610
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Daniel Vetter <daniel@ffwll.ch> =E4=BA=8E2021=E5=B9=B42=E6=9C=883=E6=97=A5=
=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=8810:15=E5=86=99=E9=81=93=EF=BC=9A

> On Tue, Jan 05, 2021 at 09:46:05PM +0800, Kevin Tang wrote:
> > Adds DPU(Display Processor Unit) support for the Unisoc's display
> subsystem.
> > It's support multi planes, scaler, rotation, PQ(Picture Quality) and
> more.
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> >
> > v2:
> >   - Use drm_xxx to replace all DRM_XXX.
> >   - Use kzalloc to replace devm_kzalloc for sprd_dpu structure init.
> >
> > v3:
> >   - Remove dpu_layer stuff layer and commit layers by aotmic_update
>
> Scrolling through the code looks very tidy&neat, only thing I spotted is
> that you could use the new drmm_ infrastructure we just landed. See
> comments below, with that addressed:
>

Hi daniel, drmm_helpers seem still on drm-misc, so i need to switch to
drm-misc(not mainline) and then update my patch on drm-misc?

>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >  drivers/gpu/drm/sprd/Kconfig    |   1 +
> >  drivers/gpu/drm/sprd/Makefile   |   4 +-
> >  drivers/gpu/drm/sprd/sprd_dpu.c | 985
> ++++++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_dpu.h | 120 +++++
> >  drivers/gpu/drm/sprd/sprd_drm.c |   1 +
> >  drivers/gpu/drm/sprd/sprd_drm.h |   2 +
> >  6 files changed, 1111 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
> >
> > diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfi=
g
> > index 6e80cc9..9b4ef9a 100644
> > --- a/drivers/gpu/drm/sprd/Kconfig
> > +++ b/drivers/gpu/drm/sprd/Kconfig
> > @@ -3,6 +3,7 @@ config DRM_SPRD
> >       depends on ARCH_SPRD || COMPILE_TEST
> >       depends on DRM && OF
> >       select DRM_KMS_HELPER
> > +     select VIDEOMODE_HELPERS
> >       select DRM_GEM_CMA_HELPER
> >       select DRM_KMS_CMA_HELPER
> >       select DRM_MIPI_DSI
> > diff --git a/drivers/gpu/drm/sprd/Makefile
> b/drivers/gpu/drm/sprd/Makefile
> > index 86d95d9..6c25bfa 100644
> > --- a/drivers/gpu/drm/sprd/Makefile
> > +++ b/drivers/gpu/drm/sprd/Makefile
> > @@ -1,5 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >
> > -subdir-ccflags-y +=3D -I$(srctree)/$(src)
> > +obj-y :=3D sprd_drm.o \
> > +     sprd_dpu.o
> >
> > -obj-y :=3D sprd_drm.o
> > diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c
> b/drivers/gpu/drm/sprd/sprd_dpu.c
> > new file mode 100644
> > index 0000000..d562d44
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> > @@ -0,0 +1,985 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#include <linux/component.h>
> > +#include <linux/delay.h>
> > +#include <linux/dma-buf.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/wait.h>
> > +#include <linux/workqueue.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_crtc_helper.h>
> > +#include <drm/drm_fb_cma_helper.h>
> > +#include <drm/drm_gem_cma_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +#include <drm/drm_plane_helper.h>
> > +
> > +#include "sprd_drm.h"
> > +#include "sprd_dpu.h"
> > +
> > +/* Global control registers */
> > +#define REG_DPU_CTRL 0x04
> > +#define REG_DPU_CFG0 0x08
> > +#define REG_PANEL_SIZE       0x20
> > +#define REG_BLEND_SIZE       0x24
> > +#define REG_BG_COLOR 0x2C
> > +
> > +/* Layer0 control registers */
> > +#define REG_LAY_BASE_ADDR0   0x30
> > +#define REG_LAY_BASE_ADDR1   0x34
> > +#define REG_LAY_BASE_ADDR2   0x38
> > +#define REG_LAY_CTRL         0x40
> > +#define REG_LAY_SIZE         0x44
> > +#define REG_LAY_PITCH                0x48
> > +#define REG_LAY_POS          0x4C
> > +#define REG_LAY_ALPHA                0x50
> > +#define REG_LAY_CROP_START   0x5C
> > +
> > +/* Interrupt control registers */
> > +#define REG_DPU_INT_EN               0x1E0
> > +#define REG_DPU_INT_CLR              0x1E4
> > +#define REG_DPU_INT_STS              0x1E8
> > +
> > +/* DPI control registers */
> > +#define REG_DPI_CTRL         0x1F0
> > +#define REG_DPI_H_TIMING     0x1F4
> > +#define REG_DPI_V_TIMING     0x1F8
> > +
> > +/* MMU control registers */
> > +#define REG_MMU_EN                   0x800
> > +#define REG_MMU_VPN_RANGE            0x80C
> > +#define REG_MMU_VAOR_ADDR_RD         0x818
> > +#define REG_MMU_VAOR_ADDR_WR         0x81C
> > +#define REG_MMU_INV_ADDR_RD          0x820
> > +#define REG_MMU_INV_ADDR_WR          0x824
> > +#define REG_MMU_PPN1                 0x83C
> > +#define REG_MMU_RANGE1                       0x840
> > +#define REG_MMU_PPN2                 0x844
> > +#define REG_MMU_RANGE2                       0x848
> > +
> > +/* Global control bits */
> > +#define BIT_DPU_RUN                  BIT(0)
> > +#define BIT_DPU_STOP                 BIT(1)
> > +#define BIT_DPU_REG_UPDATE           BIT(2)
> > +#define BIT_DPU_IF_EDPI                      BIT(0)
> > +
> > +/* Layer control bits */
> > +#define BIT_DPU_LAY_EN                               BIT(0)
> > +#define BIT_DPU_LAY_LAYER_ALPHA                      (0x01 << 2)
> > +#define BIT_DPU_LAY_COMBO_ALPHA                      (0x02 << 2)
> > +#define BIT_DPU_LAY_FORMAT_YUV422_2PLANE             (0x00 << 4)
> > +#define BIT_DPU_LAY_FORMAT_YUV420_2PLANE             (0x01 << 4)
> > +#define BIT_DPU_LAY_FORMAT_YUV420_3PLANE             (0x02 << 4)
> > +#define BIT_DPU_LAY_FORMAT_ARGB8888                  (0x03 << 4)
> > +#define BIT_DPU_LAY_FORMAT_RGB565                    (0x04 << 4)
> > +#define BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3             (0x00 << 8)
> > +#define BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0             (0x01 << 8)
> > +#define BIT_DPU_LAY_NO_SWITCH                        (0x00 << 10)
> > +#define BIT_DPU_LAY_RB_OR_UV_SWITCH          (0x01 << 10)
> > +#define BIT_DPU_LAY_MODE_BLEND_NORMAL                (0x00 << 16)
> > +#define BIT_DPU_LAY_MODE_BLEND_PREMULT               (0x01 << 16)
> > +
> > +/* Interrupt control & status bits */
> > +#define BIT_DPU_INT_DONE             BIT(0)
> > +#define BIT_DPU_INT_TE                       BIT(1)
> > +#define BIT_DPU_INT_ERR                      BIT(2)
> > +#define BIT_DPU_INT_UPDATE_DONE              BIT(4)
> > +#define BIT_DPU_INT_VSYNC            BIT(5)
> > +#define BIT_DPU_INT_MMU_VAOR_RD              BIT(16)
> > +#define BIT_DPU_INT_MMU_VAOR_WR              BIT(17)
> > +#define BIT_DPU_INT_MMU_INV_RD               BIT(18)
> > +#define BIT_DPU_INT_MMU_INV_WR               BIT(19)
> > +
> > +/* DPI control bits */
> > +#define BIT_DPU_EDPI_TE_EN           BIT(8)
> > +#define BIT_DPU_EDPI_FROM_EXTERNAL_PAD       BIT(10)
> > +#define BIT_DPU_DPI_HALT_EN          BIT(16)
> > +
> > +static const u32 primary_fmts[] =3D {
> > +     DRM_FORMAT_XRGB8888,
> > +     DRM_FORMAT_XBGR8888,
> > +     DRM_FORMAT_ARGB8888,
> > +     DRM_FORMAT_ABGR8888,
> > +     DRM_FORMAT_RGBA8888,
> > +     DRM_FORMAT_BGRA8888,
> > +     DRM_FORMAT_RGBX8888,
> > +     DRM_FORMAT_RGB565,
> > +     DRM_FORMAT_BGR565,
> > +     DRM_FORMAT_NV12,
> > +     DRM_FORMAT_NV21,
> > +     DRM_FORMAT_NV16,
> > +     DRM_FORMAT_NV61,
> > +     DRM_FORMAT_YUV420,
> > +     DRM_FORMAT_YVU420,
> > +};
> > +
> > +struct sprd_plane {
> > +     struct drm_plane plane;
> > +     u32 index;
> > +};
> > +
> > +static inline struct sprd_plane *to_sprd_plane(struct drm_plane *plane=
)
> > +{
> > +     return container_of(plane, struct sprd_plane, plane);
> > +}
> > +
> > +static u32 check_mmu_isr(struct sprd_dpu *dpu, u32 reg_val)
> > +{
> > +     struct dpu_context *ctx =3D &dpu->ctx;
> > +     u32 mmu_mask =3D BIT_DPU_INT_MMU_VAOR_RD |
> > +                     BIT_DPU_INT_MMU_VAOR_WR |
> > +                     BIT_DPU_INT_MMU_INV_RD |
> > +                     BIT_DPU_INT_MMU_INV_WR;
> > +     u32 val =3D reg_val & mmu_mask;
> > +     int i;
> > +
> > +     if (val) {
> > +             drm_err(dpu->drm, "--- iommu interrupt err: 0x%04x ---\n"=
,
> val);
> > +
> > +             if (val & BIT_DPU_INT_MMU_INV_RD)
> > +                     drm_err(dpu->drm, "iommu invalid read error, addr=
:
> 0x%08x\n",
> > +                             readl(ctx->base + REG_MMU_INV_ADDR_RD));
> > +             if (val & BIT_DPU_INT_MMU_INV_WR)
> > +                     drm_err(dpu->drm, "iommu invalid write error,
> addr: 0x%08x\n",
> > +                             readl(ctx->base + REG_MMU_INV_ADDR_WR));
> > +             if (val & BIT_DPU_INT_MMU_VAOR_RD)
> > +                     drm_err(dpu->drm, "iommu va out of range read
> error, addr: 0x%08x\n",
> > +                             readl(ctx->base + REG_MMU_VAOR_ADDR_RD));
> > +             if (val & BIT_DPU_INT_MMU_VAOR_WR)
> > +                     drm_err(dpu->drm, "iommu va out of range write
> error, addr: 0x%08x\n",
> > +                             readl(ctx->base + REG_MMU_VAOR_ADDR_WR));
> > +
> > +             for (i =3D 0; i < 8; i++) {
> > +                     reg_val =3D layer_reg_rd(ctx, REG_LAY_CTRL, i);
> > +                     if (reg_val & 0x1)
> > +                             drm_info(dpu->drm, "layer%d: 0x%08x 0x%08=
x
> 0x%08x ctrl: 0x%08x\n", i,
> > +                                     layer_reg_rd(ctx,
> REG_LAY_BASE_ADDR0, i),
> > +                                     layer_reg_rd(ctx,
> REG_LAY_BASE_ADDR1, i),
> > +                                     layer_reg_rd(ctx,
> REG_LAY_BASE_ADDR2, i),
> > +                                     layer_reg_rd(ctx, REG_LAY_CTRL,
> i));
> > +             }
> > +     }
> > +
> > +     return val;
> > +}
> > +
> > +static int dpu_wait_stop_done(struct sprd_dpu *dpu)
> > +{
> > +     struct dpu_context *ctx =3D &dpu->ctx;
> > +     int rc;
> > +
> > +     if (ctx->stopped)
> > +             return 0;
> > +
> > +     rc =3D wait_event_interruptible_timeout(ctx->wait_queue,
> ctx->evt_stop,
> > +                                            msecs_to_jiffies(500));
> > +     ctx->evt_stop =3D false;
> > +
> > +     ctx->stopped =3D true;
> > +
> > +     if (!rc) {
> > +             drm_err(dpu->drm, "dpu wait for stop done time out!\n");
> > +             return -ETIMEDOUT;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int dpu_wait_update_done(struct sprd_dpu *dpu)
> > +{
> > +     struct dpu_context *ctx =3D &dpu->ctx;
> > +     int rc;
> > +
> > +     ctx->evt_update =3D false;
> > +
> > +     rc =3D wait_event_interruptible_timeout(ctx->wait_queue,
> ctx->evt_update,
> > +                                            msecs_to_jiffies(500));
> > +
> > +     if (!rc) {
> > +             drm_err(dpu->drm, "dpu wait for reg update done time
> out!\n");
> > +             return -ETIMEDOUT;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static u32 drm_format_to_dpu(struct drm_framebuffer *fb)
> > +{
> > +     u32 format =3D 0;
> > +
> > +     switch (fb->format->format) {
> > +     case DRM_FORMAT_BGRA8888:
> > +             /* BGRA8888 -> ARGB8888 */
> > +             format |=3D BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0;
> > +             format |=3D BIT_DPU_LAY_FORMAT_ARGB8888;
> > +             break;
> > +     case DRM_FORMAT_RGBX8888:
> > +     case DRM_FORMAT_RGBA8888:
> > +             /* RGBA8888 -> ABGR8888 */
> > +             format |=3D BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0;
> > +             /* fallthrough */
> > +     case DRM_FORMAT_ABGR8888:
> > +             /* RB switch */
> > +             format |=3D BIT_DPU_LAY_RB_OR_UV_SWITCH;
> > +             /* fallthrough */
> > +     case DRM_FORMAT_ARGB8888:
> > +             format |=3D BIT_DPU_LAY_FORMAT_ARGB8888;
> > +             break;
> > +     case DRM_FORMAT_XBGR8888:
> > +             /* RB switch */
> > +             format |=3D BIT_DPU_LAY_RB_OR_UV_SWITCH;
> > +             /* fallthrough */
> > +     case DRM_FORMAT_XRGB8888:
> > +             format |=3D BIT_DPU_LAY_FORMAT_ARGB8888;
> > +             break;
> > +     case DRM_FORMAT_BGR565:
> > +             /* RB switch */
> > +             format |=3D BIT_DPU_LAY_RB_OR_UV_SWITCH;
> > +             /* fallthrough */
> > +     case DRM_FORMAT_RGB565:
> > +             format |=3D BIT_DPU_LAY_FORMAT_RGB565;
> > +             break;
> > +     case DRM_FORMAT_NV12:
> > +             /* 2-Lane: Yuv420 */
> > +             format |=3D BIT_DPU_LAY_FORMAT_YUV420_2PLANE;
> > +             /* Y endian */
> > +             format |=3D BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
> > +             /* UV endian */
> > +             format |=3D BIT_DPU_LAY_NO_SWITCH;
> > +             break;
> > +     case DRM_FORMAT_NV21:
> > +             /* 2-Lane: Yuv420 */
> > +             format |=3D BIT_DPU_LAY_FORMAT_YUV420_2PLANE;
> > +             /* Y endian */
> > +             format |=3D BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
> > +             /* UV endian */
> > +             format |=3D BIT_DPU_LAY_RB_OR_UV_SWITCH;
> > +             break;
> > +     case DRM_FORMAT_NV16:
> > +             /* 2-Lane: Yuv422 */
> > +             format |=3D BIT_DPU_LAY_FORMAT_YUV422_2PLANE;
> > +             /* Y endian */
> > +             format |=3D BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0;
> > +             /* UV endian */
> > +             format |=3D BIT_DPU_LAY_RB_OR_UV_SWITCH;
> > +             break;
> > +     case DRM_FORMAT_NV61:
> > +             /* 2-Lane: Yuv422 */
> > +             format |=3D BIT_DPU_LAY_FORMAT_YUV422_2PLANE;
> > +             /* Y endian */
> > +             format |=3D BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
> > +             /* UV endian */
> > +             format |=3D BIT_DPU_LAY_NO_SWITCH;
> > +             break;
> > +     case DRM_FORMAT_YUV420:
> > +             format |=3D BIT_DPU_LAY_FORMAT_YUV420_3PLANE;
> > +             /* Y endian */
> > +             format |=3D BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
> > +             /* UV endian */
> > +             format |=3D BIT_DPU_LAY_NO_SWITCH;
> > +             break;
> > +     case DRM_FORMAT_YVU420:
> > +             format |=3D BIT_DPU_LAY_FORMAT_YUV420_3PLANE;
> > +             /* Y endian */
> > +             format |=3D BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3;
> > +             /* UV endian */
> > +             format |=3D BIT_DPU_LAY_RB_OR_UV_SWITCH;
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     return format;
> > +}
> > +
> > +static u32 drm_rotation_to_dpu(struct drm_plane_state *state)
> > +{
> > +     u32 rotation;
> > +
> > +     switch (state->rotation) {
> > +     default:
> > +     case DRM_MODE_ROTATE_0:
> > +             rotation =3D DPU_LAYER_ROTATION_0;
> > +             break;
> > +     case DRM_MODE_ROTATE_90:
> > +             rotation =3D DPU_LAYER_ROTATION_90;
> > +             break;
> > +     case DRM_MODE_ROTATE_180:
> > +             rotation =3D DPU_LAYER_ROTATION_180;
> > +             break;
> > +     case DRM_MODE_ROTATE_270:
> > +             rotation =3D DPU_LAYER_ROTATION_270;
> > +             break;
> > +     case DRM_MODE_REFLECT_Y:
> > +             rotation =3D DPU_LAYER_ROTATION_180_M;
> > +             break;
> > +     case (DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE_90):
> > +             rotation =3D DPU_LAYER_ROTATION_90_M;
> > +             break;
> > +     case DRM_MODE_REFLECT_X:
> > +             rotation =3D DPU_LAYER_ROTATION_0_M;
> > +             break;
> > +     case (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90):
> > +             rotation =3D DPU_LAYER_ROTATION_270_M;
> > +             break;
> > +     }
> > +
> > +     return rotation;
> > +}
> > +
> > +static u32 drm_blend_to_dpu(struct drm_plane_state *state)
> > +{
> > +     u32 blend =3D 0;
> > +
> > +     switch (state->pixel_blend_mode) {
> > +     case DRM_MODE_BLEND_COVERAGE:
> > +             /* alpha mode select - combo alpha */
> > +             blend |=3D BIT_DPU_LAY_COMBO_ALPHA;
> > +             /* Normal mode */
> > +             blend |=3D BIT_DPU_LAY_MODE_BLEND_NORMAL;
> > +             break;
> > +     case DRM_MODE_BLEND_PREMULTI:
> > +             /* alpha mode select - combo alpha */
> > +             blend |=3D BIT_DPU_LAY_COMBO_ALPHA;
> > +             /* Pre-mult mode */
> > +             blend |=3D BIT_DPU_LAY_MODE_BLEND_PREMULT;
> > +             break;
> > +     case DRM_MODE_BLEND_PIXEL_NONE:
> > +     default:
> > +             /* don't do blending, maybe RGBX */
> > +             /* alpha mode select - layer alpha */
> > +             blend |=3D BIT_DPU_LAY_LAYER_ALPHA;
> > +             break;
> > +     }
> > +
> > +     return blend;
> > +}
> > +
> > +static void sprd_dpu_layer(struct sprd_dpu *dpu, struct sprd_plane
> *plane,
> > +                     struct drm_plane_state *state)
> > +{
> > +     struct dpu_context *ctx =3D &dpu->ctx;
> > +     struct drm_gem_cma_object *cma_obj;
> > +     const struct drm_format_info *info;
> > +     struct drm_framebuffer *fb =3D state->fb;
> > +     u32 addr, size, offset, pitch, blend, format, rotation;
> > +     u32 src_x =3D state->src_x >> 16;
> > +     u32 src_y =3D state->src_y >> 16;
> > +     u32 src_w =3D state->src_w >> 16;
> > +     u32 src_h =3D state->src_h >> 16;
> > +     u32 dst_x =3D state->crtc_x;
> > +     u32 dst_y =3D state->crtc_y;
> > +     u32 alpha =3D state->alpha;
> > +     int i;
> > +
> > +     offset =3D (dst_x & 0xffff) | (dst_y << 16);
> > +     size =3D (src_w & 0xffff) | (src_h << 16);
> > +
> > +     for (i =3D 0; i < fb->format->num_planes; i++) {
> > +             cma_obj =3D drm_fb_cma_get_gem_obj(fb, i);
> > +             addr =3D cma_obj->paddr + fb->offsets[i];
> > +
> > +             if (i =3D=3D 0)
> > +                     layer_reg_wr(ctx, REG_LAY_BASE_ADDR0, addr,
> plane->index);
> > +             else if (i =3D=3D 1)
> > +                     layer_reg_wr(ctx, REG_LAY_BASE_ADDR1, addr,
> plane->index);
> > +             else
> > +                     layer_reg_wr(ctx, REG_LAY_BASE_ADDR2, addr,
> plane->index);
> > +     }
> > +
> > +     info =3D drm_format_info(fb->format->format);
> > +     if (fb->format->num_planes =3D=3D 3) {
> > +             /* UV pitch is 1/2 of Y pitch */
> > +             pitch =3D (fb->pitches[0] / info->cpp[0]) |
> > +                             (fb->pitches[0] / info->cpp[0] << 15);
> > +     } else {
> > +             pitch =3D fb->pitches[0] / info->cpp[0];
> > +     }
> > +
> > +     layer_reg_wr(ctx, REG_LAY_POS, offset, plane->index);
> > +     layer_reg_wr(ctx, REG_LAY_SIZE, size, plane->index);
> > +     layer_reg_wr(ctx, REG_LAY_CROP_START,
> > +                     src_y << 16 | src_x, plane->index);
> > +     layer_reg_wr(ctx, REG_LAY_ALPHA, alpha, plane->index);
> > +     layer_reg_wr(ctx, REG_LAY_PITCH, pitch, plane->index);
> > +
> > +     format =3D drm_format_to_dpu(fb);
> > +     blend =3D drm_blend_to_dpu(state);
> > +     rotation =3D drm_rotation_to_dpu(state);
> > +
> > +     layer_reg_wr(ctx, REG_LAY_CTRL, BIT_DPU_LAY_EN |
> > +                             format |
> > +                             blend |
> > +                             rotation << 20,
> > +                             plane->index);
> > +}
> > +
> > +static void sprd_dpu_flip(struct sprd_dpu *dpu)
> > +{
> > +     struct dpu_context *ctx =3D &dpu->ctx;
> > +     u32 reg_val;
> > +
> > +     /*
> > +      * Make sure the dpu is in stop status. DPU has no shadow
> > +      * registers in EDPI mode. So the config registers can only be
> > +      * updated in the rising edge of DPU_RUN bit.
> > +      */
> > +     if (ctx->if_type =3D=3D SPRD_DPU_IF_EDPI)
> > +             dpu_wait_stop_done(dpu);
> > +
> > +     /* update trigger and wait */
> > +     if (ctx->if_type =3D=3D SPRD_DPU_IF_DPI) {
> > +             if (!ctx->stopped) {
> > +                     dpu_reg_set(ctx, REG_DPU_CTRL, BIT_DPU_REG_UPDATE=
);
> > +                     dpu_wait_update_done(dpu);
> > +             }
> > +
> > +             dpu_reg_set(ctx, REG_DPU_INT_EN, BIT_DPU_INT_ERR);
> > +     } else if (ctx->if_type =3D=3D SPRD_DPU_IF_EDPI) {
> > +             dpu_reg_set(ctx, REG_DPU_CTRL, BIT_DPU_RUN);
> > +
> > +             ctx->stopped =3D false;
> > +     }
> > +
> > +     /*
> > +      * If the following interrupt was disabled in isr,
> > +      * re-enable it.
> > +      */
> > +     reg_val =3D BIT_DPU_INT_MMU_VAOR_RD |
> > +               BIT_DPU_INT_MMU_VAOR_WR |
> > +               BIT_DPU_INT_MMU_INV_RD |
> > +               BIT_DPU_INT_MMU_INV_WR;
> > +     dpu_reg_set(ctx, REG_DPU_INT_EN, reg_val);
> > +}
> > +
> > +static void sprd_dpu_init(struct sprd_dpu *dpu)
> > +{
> > +     struct dpu_context *ctx =3D &dpu->ctx;
> > +     u32 reg_val, size;
> > +
> > +     writel(0x00, ctx->base + REG_BG_COLOR);
> > +
> > +     size =3D (ctx->vm.vactive << 16) | ctx->vm.hactive;
> > +     writel(size, ctx->base + REG_PANEL_SIZE);
> > +     writel(size, ctx->base + REG_BLEND_SIZE);
> > +
> > +     writel(0x00, ctx->base + REG_MMU_EN);
> > +     writel(0x00, ctx->base + REG_MMU_PPN1);
> > +     writel(0xffff, ctx->base + REG_MMU_RANGE1);
> > +     writel(0x00, ctx->base + REG_MMU_PPN2);
> > +     writel(0xffff, ctx->base + REG_MMU_RANGE2);
> > +     writel(0x1ffff, ctx->base + REG_MMU_VPN_RANGE);
> > +}
> > +
> > +static void sprd_dpu_fini(struct sprd_dpu *dpu)
> > +{
> > +     struct dpu_context *ctx =3D &dpu->ctx;
> > +
> > +     writel(0x00, ctx->base + REG_DPU_INT_EN);
> > +     writel(0xff, ctx->base + REG_DPU_INT_CLR);
> > +}
> > +
> > +static void sprd_dpi_init(struct sprd_dpu *dpu)
> > +{
> > +     struct dpu_context *ctx =3D &dpu->ctx;
> > +     u32 int_mask =3D 0;
> > +     u32 reg_val;
> > +
> > +     if (ctx->if_type =3D=3D SPRD_DPU_IF_DPI) {
> > +             /* use dpi as interface */
> > +             dpu_reg_clr(ctx, REG_DPU_CFG0, BIT_DPU_IF_EDPI);
> > +             /* disable Halt function for SPRD DSI */
> > +             dpu_reg_clr(ctx, REG_DPI_CTRL, BIT_DPU_DPI_HALT_EN);
> > +             /* select te from external pad */
> > +             dpu_reg_set(ctx, REG_DPI_CTRL,
> BIT_DPU_EDPI_FROM_EXTERNAL_PAD);
> > +
> > +             /* set dpi timing */
> > +             reg_val =3D ctx->vm.hsync_len << 0 |
> > +                       ctx->vm.hback_porch << 8 |
> > +                       ctx->vm.hfront_porch << 20;
> > +             writel(reg_val, ctx->base + REG_DPI_H_TIMING);
> > +
> > +             reg_val =3D ctx->vm.vsync_len << 0 |
> > +                       ctx->vm.vback_porch << 8 |
> > +                       ctx->vm.vfront_porch << 20;
> > +             writel(reg_val, ctx->base + REG_DPI_V_TIMING);
> > +
> > +             if (ctx->vm.vsync_len + ctx->vm.vback_porch < 32)
> > +                     drm_warn(dpu->drm, "Warning: (vsync + vbp) < 32, =
"
> > +                             "underflow risk!\n");
> > +
> > +             /* enable dpu update done INT */
> > +             int_mask |=3D BIT_DPU_INT_UPDATE_DONE;
> > +             /* enable dpu done INT */
> > +             int_mask |=3D BIT_DPU_INT_DONE;
> > +             /* enable dpu dpi vsync */
> > +             int_mask |=3D BIT_DPU_INT_VSYNC;
> > +             /* enable dpu TE INT */
> > +             int_mask |=3D BIT_DPU_INT_TE;
> > +             /* enable underflow err INT */
> > +             int_mask |=3D BIT_DPU_INT_ERR;
> > +     } else if (ctx->if_type =3D=3D SPRD_DPU_IF_EDPI) {
> > +             /* use edpi as interface */
> > +             dpu_reg_set(ctx, REG_DPU_CFG0, BIT_DPU_IF_EDPI);
> > +             /* use external te */
> > +             dpu_reg_set(ctx, REG_DPI_CTRL,
> BIT_DPU_EDPI_FROM_EXTERNAL_PAD);
> > +             /* enable te */
> > +             dpu_reg_set(ctx, REG_DPI_CTRL, BIT_DPU_EDPI_TE_EN);
> > +
> > +             /* enable stop done INT */
> > +             int_mask |=3D BIT_DPU_INT_DONE;
> > +             /* enable TE INT */
> > +             int_mask |=3D BIT_DPU_INT_TE;
> > +     }
> > +
> > +     /* enable iommu va out of range read error INT */
> > +     int_mask |=3D BIT_DPU_INT_MMU_VAOR_RD;
> > +     /* enable iommu va out of range write error INT */
> > +     int_mask |=3D BIT_DPU_INT_MMU_VAOR_WR;
> > +     /* enable iommu invalid read error INT */
> > +     int_mask |=3D BIT_DPU_INT_MMU_INV_RD;
> > +     /* enable iommu invalid write error INT */
> > +     int_mask |=3D BIT_DPU_INT_MMU_INV_WR;
> > +
> > +     writel(int_mask, ctx->base + REG_DPU_INT_EN);
> > +}
> > +
> > +void sprd_dpu_run(struct sprd_dpu *dpu)
> > +{
> > +     struct dpu_context *ctx =3D &dpu->ctx;
> > +
> > +     dpu_reg_set(ctx, REG_DPU_CTRL, BIT_DPU_RUN);
> > +
> > +     ctx->stopped =3D false;
> > +}
> > +
> > +void sprd_dpu_stop(struct sprd_dpu *dpu)
> > +{
> > +     struct dpu_context *ctx =3D &dpu->ctx;
> > +
> > +     if (ctx->if_type =3D=3D SPRD_DPU_IF_DPI)
> > +             dpu_reg_set(ctx, REG_DPU_CTRL, BIT_DPU_STOP);
> > +
> > +     dpu_wait_stop_done(dpu);
> > +}
> > +
> > +static int sprd_plane_atomic_check(struct drm_plane *plane,
> > +                               struct drm_plane_state *state)
> > +{
> > +     struct drm_framebuffer *fb =3D state->fb;
> > +     struct drm_crtc_state *crtc_state;
> > +     u32 fmt;
> > +
> > +     if (!fb || !state->crtc)
> > +             return 0;
> > +
> > +     fmt =3D drm_format_to_dpu(fb);
> > +     if (!fmt)
> > +             return -EINVAL;
> > +
> > +     crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crt=
c);
> > +     if (IS_ERR(crtc_state))
> > +             return PTR_ERR(crtc_state);
> > +
> > +     return drm_atomic_helper_check_plane_state(state, crtc_state,
> > +
>  DRM_PLANE_HELPER_NO_SCALING,
> > +
>  DRM_PLANE_HELPER_NO_SCALING,
> > +                                               true, true);
> > +}
> > +
> > +static void sprd_plane_atomic_update(struct drm_plane *plane,
> > +                                 struct drm_plane_state *old_state)
> > +{
> > +     struct drm_plane_state *state =3D plane->state;
> > +     struct sprd_plane *p =3D to_sprd_plane(plane);
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(state->crtc);
> > +
> > +     /* start configure dpu layers */
> > +     sprd_dpu_layer(dpu, p, state);
> > +}
> > +
> > +static void sprd_plane_atomic_disable(struct drm_plane *plane,
> > +                                  struct drm_plane_state *old_state)
> > +{
> > +     struct sprd_plane *p =3D to_sprd_plane(plane);
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(old_state->crtc);
> > +
> > +     layer_reg_wr(&dpu->ctx, REG_LAY_CTRL, 0x00, p->index);
> > +}
> > +
> > +static void sprd_plane_create_properties(struct sprd_plane *p, int
> index)
> > +{
> > +     unsigned int supported_modes =3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> > +                                    BIT(DRM_MODE_BLEND_PREMULTI) |
> > +                                    BIT(DRM_MODE_BLEND_COVERAGE);
> > +
> > +     /* create rotation property */
> > +     drm_plane_create_rotation_property(&p->plane,
> > +                                        DRM_MODE_ROTATE_0,
> > +                                        DRM_MODE_ROTATE_MASK |
> > +                                        DRM_MODE_REFLECT_MASK);
> > +
> > +     /* create alpha property */
> > +     drm_plane_create_alpha_property(&p->plane);
> > +
> > +     /* create blend mode property */
> > +     drm_plane_create_blend_mode_property(&p->plane, supported_modes);
> > +
> > +     /* create zpos property */
> > +     drm_plane_create_zpos_immutable_property(&p->plane, index);
> > +}
> > +
> > +static const struct drm_plane_helper_funcs sprd_plane_helper_funcs =3D=
 {
> > +     .atomic_check =3D sprd_plane_atomic_check,
> > +     .atomic_update =3D sprd_plane_atomic_update,
> > +     .atomic_disable =3D sprd_plane_atomic_disable,
> > +};
> > +
> > +static const struct drm_plane_funcs sprd_plane_funcs =3D {
> > +     .update_plane =3D drm_atomic_helper_update_plane,
> > +     .disable_plane  =3D drm_atomic_helper_disable_plane,
> > +     .destroy =3D drm_plane_cleanup,
> > +     .reset =3D drm_atomic_helper_plane_reset,
> > +     .atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_sta=
te,
> > +     .atomic_destroy_state =3D drm_atomic_helper_plane_destroy_state,
> > +};
> > +
> > +static struct drm_plane *sprd_plane_init(struct drm_device *drm,
> > +                                     struct sprd_dpu *dpu)
> > +{
> > +     struct drm_plane *primary =3D NULL;
> > +     struct sprd_plane *p =3D NULL;
> > +     int ret, i;
> > +
> > +     for (i =3D 0; i < 6; i++) {
> > +             p =3D devm_kzalloc(drm->dev, sizeof(*p), GFP_KERNEL);
>
> You still have a devm_kzalloc here. We've just landed some neat new drmm_
> helpers to allocate planes, please use these instead. See
> drmm_universal_plane_alloc().
>

> > +             if (!p)
> > +                     return ERR_PTR(-ENOMEM);
> > +
> > +             ret =3D drm_universal_plane_init(drm, &p->plane, 1,
> > +                                            &sprd_plane_funcs,
> primary_fmts,
> > +                                            ARRAY_SIZE(primary_fmts),
> NULL,
> > +                                            DRM_PLANE_TYPE_PRIMARY,
> NULL);
> > +             if (ret) {
> > +                     drm_err(drm, "fail to init primary plane\n");
> > +                     return ERR_PTR(ret);
> > +             }
> > +
> > +             drm_plane_helper_add(&p->plane, &sprd_plane_helper_funcs)=
;
> > +
> > +             sprd_plane_create_properties(p, i);
> > +
> > +             p->index =3D i;
> > +             if (i =3D=3D 0)
> > +                     primary =3D &p->plane;
> > +     }
> > +
> > +     return primary;
> > +}
> > +
> > +static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc *crtc=
,
> > +                                     const struct drm_display_mode
> *mode)
> > +{
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> > +
> > +     drm_dbg(dpu->drm, "%s() mode: "DRM_MODE_FMT"\n", __func__,
> DRM_MODE_ARG(mode));
> > +
> > +     if (mode->type & DRM_MODE_TYPE_PREFERRED) {
> > +             drm_display_mode_to_videomode(mode, &dpu->ctx.vm);
> > +
> > +             if ((mode->hdisplay =3D=3D mode->htotal) ||
> > +                 (mode->vdisplay =3D=3D mode->vtotal))
> > +                     dpu->ctx.if_type =3D SPRD_DPU_IF_EDPI;
> > +             else
> > +                     dpu->ctx.if_type =3D SPRD_DPU_IF_DPI;
> > +     }
> > +
> > +     return MODE_OK;
> > +}
> > +
> > +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,
> > +                                struct drm_crtc_state *old_state)
> > +{
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> > +
> > +     sprd_dpu_init(dpu);
> > +
> > +     sprd_dpi_init(dpu);
> > +
> > +     enable_irq(dpu->ctx.irq);
> > +
> > +     drm_crtc_vblank_on(&dpu->crtc);
> > +}
> > +
> > +static void sprd_crtc_atomic_disable(struct drm_crtc *crtc,
> > +                                 struct drm_crtc_state *old_state)
> > +{
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> > +     struct drm_device *drm =3D dpu->crtc.dev;
> > +
> > +     drm_crtc_vblank_off(&dpu->crtc);
> > +
> > +     disable_irq(dpu->ctx.irq);
> > +
> > +     sprd_dpu_fini(dpu);
> > +
> > +     spin_lock_irq(&drm->event_lock);
> > +     if (crtc->state->event) {
> > +             drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +             crtc->state->event =3D NULL;
> > +     }
> > +     spin_unlock_irq(&drm->event_lock);
> > +}
> > +
> > +static int sprd_crtc_atomic_check(struct drm_crtc *crtc,
> > +                              struct drm_crtc_state *state)
> > +{
> > +     drm_dbg(crtc->dev, "%s()\n", __func__);
> > +
> > +     return 0;
> > +}
> > +
> > +static void sprd_crtc_atomic_flush(struct drm_crtc *crtc,
> > +                               struct drm_crtc_state *old_state)
> > +
> > +{
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> > +     struct drm_device *drm =3D dpu->crtc.dev;
> > +
> > +     sprd_dpu_flip(dpu);
> > +
> > +     spin_lock_irq(&drm->event_lock);
> > +     if (crtc->state->event) {
> > +             drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +             crtc->state->event =3D NULL;
> > +     }
> > +     spin_unlock_irq(&drm->event_lock);
> > +}
> > +
> > +static int sprd_crtc_enable_vblank(struct drm_crtc *crtc)
> > +{
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> > +
> > +     dpu_reg_set(&dpu->ctx, REG_DPU_INT_EN, BIT_DPU_INT_VSYNC);
> > +
> > +     return 0;
> > +}
> > +
> > +static void sprd_crtc_disable_vblank(struct drm_crtc *crtc)
> > +{
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> > +
> > +     dpu_reg_clr(&dpu->ctx, REG_DPU_INT_EN, BIT_DPU_INT_VSYNC);
> > +}
> > +
> > +static const struct drm_crtc_helper_funcs sprd_crtc_helper_funcs =3D {
> > +     .mode_valid     =3D sprd_crtc_mode_valid,
> > +     .atomic_check   =3D sprd_crtc_atomic_check,
> > +     .atomic_flush   =3D sprd_crtc_atomic_flush,
> > +     .atomic_enable  =3D sprd_crtc_atomic_enable,
> > +     .atomic_disable =3D sprd_crtc_atomic_disable,
> > +};
> > +
> > +static const struct drm_crtc_funcs sprd_crtc_funcs =3D {
> > +     .destroy        =3D drm_crtc_cleanup,
> > +     .set_config     =3D drm_atomic_helper_set_config,
> > +     .page_flip      =3D drm_atomic_helper_page_flip,
> > +     .reset          =3D drm_atomic_helper_crtc_reset,
> > +     .atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_stat=
e,
> > +     .atomic_destroy_state   =3D drm_atomic_helper_crtc_destroy_state,
> > +     .enable_vblank  =3D sprd_crtc_enable_vblank,
> > +     .disable_vblank =3D sprd_crtc_disable_vblank,
> > +};
> > +
> > +static int sprd_crtc_init(struct drm_device *drm, struct drm_crtc *crt=
c,
> > +                      struct drm_plane *primary)
> > +{
> > +     struct device_node *port;
> > +     int ret;
> > +
> > +     /*
> > +      * set crtc port so that drm_of_find_possible_crtcs call works
> > +      */
> > +     port =3D of_parse_phandle(drm->dev->of_node, "ports", 0);
> > +     if (!port) {
> > +             drm_err(drm, "find 'ports' phandle of %s failed\n",
> > +                       drm->dev->of_node->full_name);
> > +             return -EINVAL;
> > +     }
> > +     of_node_put(port);
> > +     crtc->port =3D port;
> > +
> > +     ret =3D drm_crtc_init_with_planes(drm, crtc, primary, NULL,
> > +                                     &sprd_crtc_funcs, NULL);
> > +     if (ret) {
> > +             drm_err(drm, "failed to init crtc.\n");
> > +             return ret;
> > +     }
> > +
> > +     drm_crtc_helper_add(crtc, &sprd_crtc_helper_funcs);
> > +
> > +     return 0;
> > +}
> > +
> > +static irqreturn_t sprd_dpu_isr(int irq, void *data)
> > +{
> > +     struct sprd_dpu *dpu =3D data;
> > +     struct dpu_context *ctx =3D &dpu->ctx;
> > +     u32 reg_val, int_mask =3D 0;
> > +
> > +     reg_val =3D readl(ctx->base + REG_DPU_INT_STS);
> > +
> > +     /* disable err interrupt */
> > +     if (reg_val & BIT_DPU_INT_ERR) {
> > +             int_mask |=3D BIT_DPU_INT_ERR;
> > +             drm_warn(dpu->drm, "Warning: dpu underflow!\n");
> > +     }
> > +
> > +     /* dpu update done isr */
> > +     if (reg_val & BIT_DPU_INT_UPDATE_DONE) {
> > +             ctx->evt_update =3D true;
> > +             wake_up_interruptible_all(&ctx->wait_queue);
> > +     }
> > +
> > +     /* dpu stop done isr */
> > +     if (reg_val & BIT_DPU_INT_DONE) {
> > +             ctx->evt_stop =3D true;
> > +             wake_up_interruptible_all(&ctx->wait_queue);
> > +     }
> > +
> > +     if (reg_val & BIT_DPU_INT_VSYNC)
> > +             drm_crtc_handle_vblank(&dpu->crtc);
> > +
> > +     int_mask |=3D check_mmu_isr(dpu, reg_val);
> > +
> > +     writel(reg_val, ctx->base + REG_DPU_INT_CLR);
> > +     dpu_reg_clr(ctx, REG_DPU_INT_EN, int_mask);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int sprd_dpu_bind(struct device *dev, struct device *master,
> void *data)
> > +{
> > +     struct drm_device *drm =3D data;
> > +     struct sprd_dpu *dpu =3D dev_get_drvdata(dev);
> > +     struct drm_plane *plane;
> > +     int ret;
> > +
> > +     plane =3D sprd_plane_init(drm, dpu);
> > +     if (IS_ERR_OR_NULL(plane)) {
> > +             ret =3D PTR_ERR(plane);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D sprd_crtc_init(drm, &dpu->crtc, plane);
> > +     if (ret)
> > +             return ret;
> > +
> > +     dpu->drm =3D drm;
> > +
> > +     return 0;
> > +}
> > +
> > +static void sprd_dpu_unbind(struct device *dev, struct device *master,
> > +     void *data)
> > +{
> > +     struct sprd_dpu *dpu =3D dev_get_drvdata(dev);
> > +
> > +     drm_crtc_cleanup(&dpu->crtc);
> > +}
> > +
> > +static const struct component_ops dpu_component_ops =3D {
> > +     .bind =3D sprd_dpu_bind,
> > +     .unbind =3D sprd_dpu_unbind,
> > +};
> > +
> > +static int sprd_dpu_context_init(struct sprd_dpu *dpu,
> > +                             struct device *dev)
> > +{
> > +     struct platform_device *pdev =3D to_platform_device(dev);
> > +     struct dpu_context *ctx =3D &dpu->ctx;
> > +     struct resource *res;
> > +     int ret;
> > +
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     ctx->base =3D devm_ioremap(dev, res->start, resource_size(res));
> > +     if (!ctx->base) {
> > +             dev_err(dev, "failed to map dpu registers\n");
> > +             return -EFAULT;
> > +     }
> > +
> > +     ctx->irq =3D platform_get_irq(pdev, 0);
> > +     if (ctx->irq < 0) {
> > +             dev_err(dev, "failed to get dpu irq\n");
> > +             return ctx->irq;
> > +     }
> > +
> > +     irq_set_status_flags(ctx->irq, IRQ_NOAUTOEN);
> > +     ret =3D devm_request_irq(dev, ctx->irq, sprd_dpu_isr,
> > +                                     0, "DPU", dpu);
> > +     if (ret) {
> > +             dev_err(dev, "failed to register dpu irq handler\n");
> > +             return ret;
> > +     }
> > +
> > +     init_waitqueue_head(&ctx->wait_queue);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id dpu_match_table[] =3D {
> > +     { .compatible =3D "sprd,sharkl3-dpu" },
> > +     { /* sentinel */ },
> > +};
> > +
> > +static int sprd_dpu_probe(struct platform_device *pdev)
> > +{
> > +     struct sprd_dpu *dpu;
> > +     int ret;
> > +
> > +     dpu =3D kzalloc(sizeof(*dpu), GFP_KERNEL);
> > +     if (!dpu)
> > +             return -ENOMEM;
> > +
> > +     ret =3D sprd_dpu_context_init(dpu, &pdev->dev);
> > +     if (ret) {
> > +             kfree(dpu);
> > +             return ret;
> > +     }
> > +
> > +     platform_set_drvdata(pdev, dpu);
>
> The above should be moved into your bind function, with that you can
> allocate the struct sprd_dpu with drmm_crtc_alloc_with_planes() and remov=
e
> a bunch of cleanup code.
> > +
> > +     return component_add(&pdev->dev, &dpu_component_ops);
> > +}
> > +
> > +static int sprd_dpu_remove(struct platform_device *pdev)
> > +{
> > +     struct sprd_dpu *dpu =3D platform_get_drvdata(pdev);
> > +
> > +     component_del(&pdev->dev, &dpu_component_ops);
> > +
> > +     kfree(dpu);
>
> The kfree here is wrong, you'd need to hook into the ->destroy hook of th=
e
> drm_crtc_funcs, but if you're using drmm_ like suggested above it should
> all work including driver unload and any ordering issues with
> deferred_probe.
>
> > +     return 0;
> > +}
> > +
> > +struct platform_driver sprd_dpu_driver =3D {
> > +     .probe =3D sprd_dpu_probe,
> > +     .remove =3D sprd_dpu_remove,
> > +     .driver =3D {
> > +             .name =3D "sprd-dpu-drv",
> > +             .of_match_table =3D dpu_match_table,
> > +     },
> > +};
> > +
> > +MODULE_AUTHOR("Leon He <leon.he@unisoc.com>");
> > +MODULE_AUTHOR("Kevin Tang <kevin.tang@unisoc.com>");
> > +MODULE_DESCRIPTION("Unisoc Display Controller Driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/gpu/drm/sprd/sprd_dpu.h
> b/drivers/gpu/drm/sprd/sprd_dpu.h
> > new file mode 100644
> > index 0000000..a937ba1
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_dpu.h
> > @@ -0,0 +1,120 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020 Unisoc Inc.
> > + */
> > +
> > +#ifndef __SPRD_DPU_H__
> > +#define __SPRD_DPU_H__
> > +
> > +#include <linux/bug.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/string.h>
> > +#include <video/videomode.h>
> > +
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_fourcc.h>
> > +#include <drm/drm_print.h>
> > +#include <drm/drm_vblank.h>
> > +#include <uapi/drm/drm_mode.h>
> > +
> > +/* DPU Layer registers offset */
> > +#define DPU_LAY_REG_OFFSET   0x30
> > +
> > +enum {
> > +     SPRD_DPU_IF_DBI =3D 0,
> > +     SPRD_DPU_IF_DPI,
> > +     SPRD_DPU_IF_EDPI,
> > +     SPRD_DPU_IF_LIMIT
> > +};
> > +
> > +enum {
> > +     DPU_LAYER_ROTATION_0,
> > +     DPU_LAYER_ROTATION_90,
> > +     DPU_LAYER_ROTATION_180,
> > +     DPU_LAYER_ROTATION_270,
> > +     DPU_LAYER_ROTATION_0_M,
> > +     DPU_LAYER_ROTATION_90_M,
> > +     DPU_LAYER_ROTATION_180_M,
> > +     DPU_LAYER_ROTATION_270_M,
> > +};
> > +
> > +/**
> > + * Sprd DPU context structure
> > + *
> > + * @base: DPU controller base address
> > + * @irq: IRQ number to install the handler for
> > + * @if_type: The type of DPI interface, default is DPI mode.
> > + * @vm: videomode structure to use for DPU and DPI initialization
> > + * @stopped: indicates whether DPU are stopped
> > + * @wait_queue: wait queue, used to wait for DPU shadow register updat=
e
> done and
> > + * DPU stop register done interrupt signal.
> > + * @evt_update: wait queue condition for DPU shadow register
> > + * @evt_stop: wait queue condition for DPU stop register
> > + */
> > +struct dpu_context {
> > +     void __iomem *base;
> > +     int irq;
> > +     u8 if_type;
> > +     struct videomode vm;
> > +     bool stopped;
> > +     wait_queue_head_t wait_queue;
> > +     bool evt_update;
> > +     bool evt_stop;
> > +};
> > +
> > +/**
> > + * Sprd DPU device structure
> > + *
> > + * @crtc: DRM crtc
> > + * @ctx: A pointer to the DPU's implementation specific context
> > + */
> > +struct sprd_dpu {
> > +     struct drm_crtc crtc;
> > +     struct drm_device *drm;
> > +     struct dpu_context ctx;
> > +};
> > +
> > +static inline struct sprd_dpu *to_sprd_crtc(struct drm_crtc *crtc)
> > +{
> > +     return container_of(crtc, struct sprd_dpu, crtc);
> > +}
> > +
> > +static inline void
> > +dpu_reg_set(struct dpu_context *ctx, u32 offset, u32 set_bits)
> > +{
> > +     u32 bits =3D readl_relaxed(ctx->base + offset);
> > +
> > +     writel(bits | set_bits, ctx->base + offset);
> > +}
> > +
> > +static inline void
> > +dpu_reg_clr(struct dpu_context *ctx, u32 offset, u32 clr_bits)
> > +{
> > +     u32 bits =3D readl_relaxed(ctx->base + offset);
> > +
> > +     writel(bits & ~clr_bits, ctx->base + offset);
> > +}
> > +
> > +static inline u32
> > +layer_reg_rd(struct dpu_context *ctx, u32 offset, int index)
> > +{
> > +     u32 layer_offset =3D offset + index * DPU_LAY_REG_OFFSET;
> > +
> > +     return readl(ctx->base + layer_offset);
> > +}
> > +
> > +static inline void
> > +layer_reg_wr(struct dpu_context *ctx, u32 offset, u32 cfg_bits, int
> index)
> > +{
> > +     u32 layer_offset =3D  offset + index * DPU_LAY_REG_OFFSET;
> > +
> > +     writel(cfg_bits, ctx->base + layer_offset);
> > +}
> > +
> > +void sprd_dpu_run(struct sprd_dpu *dpu);
> > +void sprd_dpu_stop(struct sprd_dpu *dpu);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.c
> b/drivers/gpu/drm/sprd/sprd_drm.c
> > index ec101de..ca93be2 100644
> > --- a/drivers/gpu/drm/sprd/sprd_drm.c
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.c
> > @@ -196,6 +196,7 @@ static struct platform_driver sprd_drm_driver =3D {
> >
> >  static struct platform_driver *sprd_drm_drivers[]  =3D {
> >       &sprd_drm_driver,
> > +     &sprd_dpu_driver,
> >  };
> >
> >  static int __init sprd_drm_init(void)
> > diff --git a/drivers/gpu/drm/sprd/sprd_drm.h
> b/drivers/gpu/drm/sprd/sprd_drm.h
> > index 9781fd5..85d4a8b 100644
> > --- a/drivers/gpu/drm/sprd/sprd_drm.h
> > +++ b/drivers/gpu/drm/sprd/sprd_drm.h
> > @@ -13,4 +13,6 @@ struct sprd_drm {
> >       struct drm_device drm;
> >  };
> >
> > +extern struct platform_driver sprd_dpu_driver;
> > +
> >  #endif /* _SPRD_DRM_H_ */
> > --
> > 2.7.4
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000dbca5705bb0b3610
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Daniel Vetter &lt;<a href=3D"mailto:d=
aniel@ffwll.ch">daniel@ffwll.ch</a>&gt; =E4=BA=8E2021=E5=B9=B42=E6=9C=883=
=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=8810:15=E5=86=99=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Jan =
05, 2021 at 09:46:05PM +0800, Kevin Tang wrote:<br>
&gt; Adds DPU(Display Processor Unit) support for the Unisoc&#39;s display =
subsystem.<br>
&gt; It&#39;s support multi planes, scaler, rotation, PQ(Picture Quality) a=
nd more.<br>
&gt; <br>
&gt; Cc: Orson Zhai &lt;<a href=3D"mailto:orsonzhai@gmail.com" target=3D"_b=
lank">orsonzhai@gmail.com</a>&gt;<br>
&gt; Cc: Chunyan Zhang &lt;<a href=3D"mailto:zhang.lyra@gmail.com" target=
=3D"_blank">zhang.lyra@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Kevin Tang &lt;<a href=3D"mailto:kevin.tang@unisoc.com"=
 target=3D"_blank">kevin.tang@unisoc.com</a>&gt;<br>
&gt; <br>
&gt; v2:<br>
&gt;=C2=A0 =C2=A0- Use drm_xxx to replace all DRM_XXX.<br>
&gt;=C2=A0 =C2=A0- Use kzalloc to replace devm_kzalloc for sprd_dpu structu=
re init.<br>
&gt; <br>
&gt; v3:<br>
&gt;=C2=A0 =C2=A0- Remove dpu_layer stuff layer and commit layers by aotmic=
_update<br>
<br>
Scrolling through the code looks very tidy&amp;neat, only thing I spotted i=
s<br>
that you could use the new drmm_ infrastructure we just landed. See<br>
comments below, with that addressed:<br></blockquote><div><br></div><div>Hi=
 daniel, drmm_helpers seem still on drm-misc, so i need to switch to drm-mi=
sc(not mainline) and then update my patch on drm-misc? </div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
Acked-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" targe=
t=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/Kconfig=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dpu.c | 985 ++++++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_dpu.h | 120 +++++<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.c |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/gpu/drm/sprd/sprd_drm.h |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 6 files changed, 1111 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconf=
ig<br>
&gt; index 6e80cc9..9b4ef9a 100644<br>
&gt; --- a/drivers/gpu/drm/sprd/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/sprd/Kconfig<br>
&gt; @@ -3,6 +3,7 @@ config DRM_SPRD<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ARCH_SPRD || COMPILE_TEST<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on DRM &amp;&amp; OF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_KMS_HELPER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select VIDEOMODE_HELPERS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_GEM_CMA_HELPER<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_KMS_CMA_HELPER<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select DRM_MIPI_DSI<br>
&gt; diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Make=
file<br>
&gt; index 86d95d9..6c25bfa 100644<br>
&gt; --- a/drivers/gpu/drm/sprd/Makefile<br>
&gt; +++ b/drivers/gpu/drm/sprd/Makefile<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 # SPDX-License-Identifier: GPL-2.0<br>
&gt;=C2=A0 <br>
&gt; -subdir-ccflags-y +=3D -I$(srctree)/$(src)<br>
&gt; +obj-y :=3D sprd_drm.o \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dpu.o<br>
&gt;=C2=A0 <br>
&gt; -obj-y :=3D sprd_drm.o<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sp=
rd_dpu.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..d562d44<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_dpu.c<br>
&gt; @@ -0,0 +1,985 @@<br>
&gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/component.h&gt;<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/dma-buf.h&gt;<br>
&gt; +#include &lt;linux/io.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/of.h&gt;<br>
&gt; +#include &lt;linux/of_address.h&gt;<br>
&gt; +#include &lt;linux/of_device.h&gt;<br>
&gt; +#include &lt;linux/of_irq.h&gt;<br>
&gt; +#include &lt;linux/wait.h&gt;<br>
&gt; +#include &lt;linux/workqueue.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_atomic_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_crtc_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_fb_cma_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_cma_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_framebuffer_helper.h&gt;<br>
&gt; +#include &lt;drm/drm_plane_helper.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;sprd_drm.h&quot;<br>
&gt; +#include &quot;sprd_dpu.h&quot;<br>
&gt; +<br>
&gt; +/* Global control registers */<br>
&gt; +#define REG_DPU_CTRL 0x04<br>
&gt; +#define REG_DPU_CFG0 0x08<br>
&gt; +#define REG_PANEL_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A00x20<br>
&gt; +#define REG_BLEND_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A00x24<br>
&gt; +#define REG_BG_COLOR 0x2C<br>
&gt; +<br>
&gt; +/* Layer0 control registers */<br>
&gt; +#define REG_LAY_BASE_ADDR0=C2=A0 =C2=A00x30<br>
&gt; +#define REG_LAY_BASE_ADDR1=C2=A0 =C2=A00x34<br>
&gt; +#define REG_LAY_BASE_ADDR2=C2=A0 =C2=A00x38<br>
&gt; +#define REG_LAY_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x40<br>
&gt; +#define REG_LAY_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x44<br>
&gt; +#define REG_LAY_PITCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x48<br>
&gt; +#define REG_LAY_POS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4C<br>
&gt; +#define REG_LAY_ALPHA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x50<br>
&gt; +#define REG_LAY_CROP_START=C2=A0 =C2=A00x5C<br>
&gt; +<br>
&gt; +/* Interrupt control registers */<br>
&gt; +#define REG_DPU_INT_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x1E0<br>
&gt; +#define REG_DPU_INT_CLR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x1E4<br>
&gt; +#define REG_DPU_INT_STS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x1E8<br>
&gt; +<br>
&gt; +/* DPI control registers */<br>
&gt; +#define REG_DPI_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1F0<br>
&gt; +#define REG_DPI_H_TIMING=C2=A0 =C2=A0 =C2=A00x1F4<br>
&gt; +#define REG_DPI_V_TIMING=C2=A0 =C2=A0 =C2=A00x1F8<br>
&gt; +<br>
&gt; +/* MMU control registers */<br>
&gt; +#define REG_MMU_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x800<br>
&gt; +#define REG_MMU_VPN_RANGE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
80C<br>
&gt; +#define REG_MMU_VAOR_ADDR_RD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x818<b=
r>
&gt; +#define REG_MMU_VAOR_ADDR_WR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x81C<b=
r>
&gt; +#define REG_MMU_INV_ADDR_RD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x820<b=
r>
&gt; +#define REG_MMU_INV_ADDR_WR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x824<b=
r>
&gt; +#define REG_MMU_PPN1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x83C<br>
&gt; +#define REG_MMU_RANGE1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x840<br>
&gt; +#define REG_MMU_PPN2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x844<br>
&gt; +#define REG_MMU_RANGE2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x848<br>
&gt; +<br>
&gt; +/* Global control bits */<br>
&gt; +#define BIT_DPU_RUN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 BIT(0)<br>
&gt; +#define BIT_DPU_STOP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0BIT(1)<br>
&gt; +#define BIT_DPU_REG_UPDATE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BI=
T(2)<br>
&gt; +#define BIT_DPU_IF_EDPI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(0)<br>
&gt; +<br>
&gt; +/* Layer control bits */<br>
&gt; +#define BIT_DPU_LAY_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(0)<br=
>
&gt; +#define BIT_DPU_LAY_LAYER_ALPHA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x01 &lt;&lt; 2)<br>
&gt; +#define BIT_DPU_LAY_COMBO_ALPHA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x02 &lt;&lt; 2)<br>
&gt; +#define BIT_DPU_LAY_FORMAT_YUV422_2PLANE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(0x00 &lt;&lt; 4)<br>
&gt; +#define BIT_DPU_LAY_FORMAT_YUV420_2PLANE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(0x01 &lt;&lt; 4)<br>
&gt; +#define BIT_DPU_LAY_FORMAT_YUV420_3PLANE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(0x02 &lt;&lt; 4)<br>
&gt; +#define BIT_DPU_LAY_FORMAT_ARGB8888=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x03 &lt;&lt; 4)<br>
&gt; +#define BIT_DPU_LAY_FORMAT_RGB565=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x04 &lt;&lt; 4)<br>
&gt; +#define BIT_DPU_LAY_DATA_ENDIAN_B0B1B2B3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(0x00 &lt;&lt; 8)<br>
&gt; +#define BIT_DPU_LAY_DATA_ENDIAN_B3B2B1B0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(0x01 &lt;&lt; 8)<br>
&gt; +#define BIT_DPU_LAY_NO_SWITCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x00 &lt;&lt; 10)<br>
&gt; +#define BIT_DPU_LAY_RB_OR_UV_SWITCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 (0x01 &lt;&lt; 10)<br>
&gt; +#define BIT_DPU_LAY_MODE_BLEND_NORMAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (0x00 &lt;&lt; 16)<br>
&gt; +#define BIT_DPU_LAY_MODE_BLEND_PREMULT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(0x01 &lt;&lt; 16)<br>
&gt; +<br>
&gt; +/* Interrupt control &amp; status bits */<br>
&gt; +#define BIT_DPU_INT_DONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0BIT(0)<br>
&gt; +#define BIT_DPU_INT_TE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(1)<br>
&gt; +#define BIT_DPU_INT_ERR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(2)<br>
&gt; +#define BIT_DPU_INT_UPDATE_DONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BIT(4)<br>
&gt; +#define BIT_DPU_INT_VSYNC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BI=
T(5)<br>
&gt; +#define BIT_DPU_INT_MMU_VAOR_RD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BIT(16)<br>
&gt; +#define BIT_DPU_INT_MMU_VAOR_WR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BIT(17)<br>
&gt; +#define BIT_DPU_INT_MMU_INV_RD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BIT(18)<br>
&gt; +#define BIT_DPU_INT_MMU_INV_WR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BIT(19)<br>
&gt; +<br>
&gt; +/* DPI control bits */<br>
&gt; +#define BIT_DPU_EDPI_TE_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BI=
T(8)<br>
&gt; +#define BIT_DPU_EDPI_FROM_EXTERNAL_PAD=C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(=
10)<br>
&gt; +#define BIT_DPU_DPI_HALT_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(16)=
<br>
&gt; +<br>
&gt; +static const u32 primary_fmts[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_XRGB8888,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_XBGR8888,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_ARGB8888,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_ABGR8888,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_RGBA8888,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_BGRA8888,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_RGBX8888,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_RGB565,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_BGR565,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_NV12,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_NV21,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_NV16,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_NV61,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_YUV420,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_YVU420,<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct sprd_plane {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_plane plane;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 index;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static inline struct sprd_plane *to_sprd_plane(struct drm_plane *plan=
e)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return container_of(plane, struct sprd_plane, pla=
ne);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u32 check_mmu_isr(struct sprd_dpu *dpu, u32 reg_val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;ctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 mmu_mask =3D BIT_DPU_INT_MMU_VAOR_RD |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0BIT_DPU_INT_MMU_VAOR_WR |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0BIT_DPU_INT_MMU_INV_RD |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0BIT_DPU_INT_MMU_INV_WR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 val =3D reg_val &amp; mmu_mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (val) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dpu-&gt;drm, =
&quot;--- iommu interrupt err: 0x%04x ---\n&quot;, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &amp; BIT_DPU=
_INT_MMU_INV_RD)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_err(dpu-&gt;drm, &quot;iommu invalid read error, addr: 0x%08x\n&=
quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readl(ctx-&gt;base + REG_MMU_INV_ADDR_RD=
));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &amp; BIT_DPU=
_INT_MMU_INV_WR)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_err(dpu-&gt;drm, &quot;iommu invalid write error, addr: 0x%08x\n=
&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readl(ctx-&gt;base + REG_MMU_INV_ADDR_WR=
));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &amp; BIT_DPU=
_INT_MMU_VAOR_RD)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_err(dpu-&gt;drm, &quot;iommu va out of range read error, addr: 0=
x%08x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readl(ctx-&gt;base + REG_MMU_VAOR_ADDR_R=
D));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &amp; BIT_DPU=
_INT_MMU_VAOR_WR)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_err(dpu-&gt;drm, &quot;iommu va out of range write error, addr: =
0x%08x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0readl(ctx-&gt;base + REG_MMU_VAOR_ADDR_W=
R));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; =
8; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg_val =3D layer_reg_rd(ctx, REG_LAY_CTRL, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (reg_val &amp; 0x1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_info(dpu-&gt;drm, &quot;layer%d: 0x%=
08x 0x%08x 0x%08x ctrl: 0x%08x\n&quot;, i,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer_reg_rd=
(ctx, REG_LAY_BASE_ADDR0, i),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer_reg_rd=
(ctx, REG_LAY_BASE_ADDR1, i),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer_reg_rd=
(ctx, REG_LAY_BASE_ADDR2, i),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0layer_reg_rd=
(ctx, REG_LAY_CTRL, i));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return val;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int dpu_wait_stop_done(struct sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;ctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int rc;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ctx-&gt;stopped)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc =3D wait_event_interruptible_timeout(ctx-&gt;w=
ait_queue, ctx-&gt;evt_stop,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 msecs_to_jiffies(500));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;evt_stop =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;stopped =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!rc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dpu-&gt;drm, =
&quot;dpu wait for stop done time out!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ETIMEDOUT;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int dpu_wait_update_done(struct sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;ctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int rc;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;evt_update =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rc =3D wait_event_interruptible_timeout(ctx-&gt;w=
ait_queue, ctx-&gt;evt_update,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 msecs_to_jiffies(500));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!rc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dpu-&gt;drm, =
&quot;dpu wait for reg update done time out!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ETIMEDOUT;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u32 drm_format_to_dpu(struct drm_framebuffer *fb)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 format =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (fb-&gt;format-&gt;format) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_BGRA8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* BGRA8888 -&gt; ARG=
B8888 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_DATA_ENDIAN_B3B2B1B0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_FORMAT_ARGB8888;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_RGBX8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_RGBA8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RGBA8888 -&gt; ABG=
R8888 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_DATA_ENDIAN_B3B2B1B0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* fallthrough */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_ABGR8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RB switch */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_RB_OR_UV_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* fallthrough */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_ARGB8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_FORMAT_ARGB8888;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_XBGR8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RB switch */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_RB_OR_UV_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* fallthrough */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_XRGB8888:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_FORMAT_ARGB8888;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_BGR565:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* RB switch */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_RB_OR_UV_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* fallthrough */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_RGB565:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_FORMAT_RGB565;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV12:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv420 */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_FORMAT_YUV420_2PLANE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_DATA_ENDIAN_B0B1B2B3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_NO_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV21:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv420 */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_FORMAT_YUV420_2PLANE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_DATA_ENDIAN_B0B1B2B3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_RB_OR_UV_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV16:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv422 */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_FORMAT_YUV422_2PLANE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_DATA_ENDIAN_B3B2B1B0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_RB_OR_UV_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_NV61:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2-Lane: Yuv422 */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_FORMAT_YUV422_2PLANE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_DATA_ENDIAN_B0B1B2B3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_NO_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_YUV420:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_FORMAT_YUV420_3PLANE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_DATA_ENDIAN_B0B1B2B3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_NO_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_FORMAT_YVU420:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_FORMAT_YUV420_3PLANE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Y endian */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_DATA_ENDIAN_B0B1B2B3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV endian */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |=3D BIT_DPU_L=
AY_RB_OR_UV_SWITCH;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return format;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u32 drm_rotation_to_dpu(struct drm_plane_state *state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 rotation;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (state-&gt;rotation) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rotation =3D DPU_LAYE=
R_ROTATION_0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_90:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rotation =3D DPU_LAYE=
R_ROTATION_90;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_180:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rotation =3D DPU_LAYE=
R_ROTATION_180;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_MODE_ROTATE_270:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rotation =3D DPU_LAYE=
R_ROTATION_270;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_MODE_REFLECT_Y:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rotation =3D DPU_LAYE=
R_ROTATION_180_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case (DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE_90):<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rotation =3D DPU_LAYE=
R_ROTATION_90_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_MODE_REFLECT_X:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rotation =3D DPU_LAYE=
R_ROTATION_0_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90):<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rotation =3D DPU_LAYE=
R_ROTATION_270_M;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return rotation;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u32 drm_blend_to_dpu(struct drm_plane_state *state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 blend =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0switch (state-&gt;pixel_blend_mode) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_MODE_BLEND_COVERAGE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* alpha mode select =
- combo alpha */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blend |=3D BIT_DPU_LA=
Y_COMBO_ALPHA;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Normal mode */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blend |=3D BIT_DPU_LA=
Y_MODE_BLEND_NORMAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_MODE_BLEND_PREMULTI:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* alpha mode select =
- combo alpha */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blend |=3D BIT_DPU_LA=
Y_COMBO_ALPHA;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Pre-mult mode */<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blend |=3D BIT_DPU_LA=
Y_MODE_BLEND_PREMULT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case DRM_MODE_BLEND_PIXEL_NONE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* don&#39;t do blend=
ing, maybe RGBX */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* alpha mode select =
- layer alpha */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blend |=3D BIT_DPU_LA=
Y_LAYER_ALPHA;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return blend;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dpu_layer(struct sprd_dpu *dpu, struct sprd_plane *p=
lane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0struct drm_plane_state *state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;ctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_gem_cma_object *cma_obj;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct drm_format_info *info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_framebuffer *fb =3D state-&gt;fb;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 addr, size, offset, pitch, blend, format, rot=
ation;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 src_x =3D state-&gt;src_x &gt;&gt; 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 src_y =3D state-&gt;src_y &gt;&gt; 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 src_w =3D state-&gt;src_w &gt;&gt; 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 src_h =3D state-&gt;src_h &gt;&gt; 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 dst_x =3D state-&gt;crtc_x;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 dst_y =3D state-&gt;crtc_y;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 alpha =3D state-&gt;alpha;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0offset =3D (dst_x &amp; 0xffff) | (dst_y &lt;&lt;=
 16);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size =3D (src_w &amp; 0xffff) | (src_h &lt;&lt; 1=
6);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; fb-&gt;format-&gt;num_planes=
; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cma_obj =3D drm_fb_cm=
a_get_gem_obj(fb, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D cma_obj-&gt;=
paddr + fb-&gt;offsets[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0layer_reg_wr(ctx, REG_LAY_BASE_ADDR0, addr, plane-&gt;index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (i =3D=3D 1)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0layer_reg_wr(ctx, REG_LAY_BASE_ADDR1, addr, plane-&gt;index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0layer_reg_wr(ctx, REG_LAY_BASE_ADDR2, addr, plane-&gt;index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0info =3D drm_format_info(fb-&gt;format-&gt;format=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fb-&gt;format-&gt;num_planes =3D=3D 3) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* UV pitch is 1/2 of=
 Y pitch */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pitch =3D (fb-&gt;pit=
ches[0] / info-&gt;cpp[0]) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fb-&gt;pitches[0] / info-&gt;cpp[0] &lt=
;&lt; 15);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pitch =3D fb-&gt;pitc=
hes[0] / info-&gt;cpp[0];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer_reg_wr(ctx, REG_LAY_POS, offset, plane-&gt;=
index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer_reg_wr(ctx, REG_LAY_SIZE, size, plane-&gt;i=
ndex);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer_reg_wr(ctx, REG_LAY_CROP_START,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0src_y &lt;&lt; 16 | src_x, plane-&gt;index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer_reg_wr(ctx, REG_LAY_ALPHA, alpha, plane-&gt=
;index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer_reg_wr(ctx, REG_LAY_PITCH, pitch, plane-&gt=
;index);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0format =3D drm_format_to_dpu(fb);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0blend =3D drm_blend_to_dpu(state);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rotation =3D drm_rotation_to_dpu(state);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer_reg_wr(ctx, REG_LAY_CTRL, BIT_DPU_LAY_EN |<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0format |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blend |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rotation &lt;&lt; 20,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plane-&gt;index);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dpu_flip(struct sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;ctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 reg_val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Make sure the dpu is in stop status. DPU has n=
o shadow<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * registers in EDPI mode. So the config register=
s can only be<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * updated in the rising edge of DPU_RUN bit.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ctx-&gt;if_type =3D=3D SPRD_DPU_IF_EDPI)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_wait_stop_done(dp=
u);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* update trigger and wait */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ctx-&gt;if_type =3D=3D SPRD_DPU_IF_DPI) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ctx-&gt;stopped)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dpu_reg_set(ctx, REG_DPU_CTRL, BIT_DPU_REG_UPDATE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dpu_wait_update_done(dpu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_reg_set(ctx, REG_=
DPU_INT_EN, BIT_DPU_INT_ERR);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (ctx-&gt;if_type =3D=3D SPRD_DPU_IF_EDP=
I) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_reg_set(ctx, REG_=
DPU_CTRL, BIT_DPU_RUN);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;stopped =3D f=
alse;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * If the following interrupt was disabled in isr=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * re-enable it.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg_val =3D BIT_DPU_INT_MMU_VAOR_RD |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT_DPU_INT_MM=
U_VAOR_WR |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT_DPU_INT_MM=
U_INV_RD |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT_DPU_INT_MM=
U_INV_WR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dpu_reg_set(ctx, REG_DPU_INT_EN, reg_val);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dpu_init(struct sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;ctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 reg_val, size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(0x00, ctx-&gt;base + REG_BG_COLOR);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size =3D (ctx-&gt;vm.vactive &lt;&lt; 16) | ctx-&=
gt;vm.hactive;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(size, ctx-&gt;base + REG_PANEL_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(size, ctx-&gt;base + REG_BLEND_SIZE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(0x00, ctx-&gt;base + REG_MMU_EN);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(0x00, ctx-&gt;base + REG_MMU_PPN1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(0xffff, ctx-&gt;base + REG_MMU_RANGE1);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(0x00, ctx-&gt;base + REG_MMU_PPN2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(0xffff, ctx-&gt;base + REG_MMU_RANGE2);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(0x1ffff, ctx-&gt;base + REG_MMU_VPN_RANGE)=
;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dpu_fini(struct sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;ctx;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(0x00, ctx-&gt;base + REG_DPU_INT_EN);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(0xff, ctx-&gt;base + REG_DPU_INT_CLR);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dpi_init(struct sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;ctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 int_mask =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 reg_val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ctx-&gt;if_type =3D=3D SPRD_DPU_IF_DPI) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use dpi as interfa=
ce */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_reg_clr(ctx, REG_=
DPU_CFG0, BIT_DPU_IF_EDPI);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* disable Halt funct=
ion for SPRD DSI */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_reg_clr(ctx, REG_=
DPI_CTRL, BIT_DPU_DPI_HALT_EN);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* select te from ext=
ernal pad */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_reg_set(ctx, REG_=
DPI_CTRL, BIT_DPU_EDPI_FROM_EXTERNAL_PAD);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set dpi timing */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val =3D ctx-&gt;v=
m.hsync_len &lt;&lt; 0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ctx-&gt;vm.hback_porch &lt;&lt; 8 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ctx-&gt;vm.hfront_porch &lt;&lt; 20;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(reg_val, ctx-&=
gt;base + REG_DPI_H_TIMING);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_val =3D ctx-&gt;v=
m.vsync_len &lt;&lt; 0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ctx-&gt;vm.vback_porch &lt;&lt; 8 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ctx-&gt;vm.vfront_porch &lt;&lt; 20;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writel(reg_val, ctx-&=
gt;base + REG_DPI_V_TIMING);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;vm.vsync_=
len + ctx-&gt;vm.vback_porch &lt; 32)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_warn(dpu-&gt;drm, &quot;Warning: (vsync + vbp) &lt; 32, &quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;underflow risk!\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable dpu update =
done INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU=
_INT_UPDATE_DONE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable dpu done IN=
T */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU=
_INT_DONE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable dpu dpi vsy=
nc */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU=
_INT_VSYNC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable dpu TE INT =
*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU=
_INT_TE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable underflow e=
rr INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU=
_INT_ERR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (ctx-&gt;if_type =3D=3D SPRD_DPU_IF_EDP=
I) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use edpi as interf=
ace */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_reg_set(ctx, REG_=
DPU_CFG0, BIT_DPU_IF_EDPI);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use external te */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_reg_set(ctx, REG_=
DPI_CTRL, BIT_DPU_EDPI_FROM_EXTERNAL_PAD);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable te */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_reg_set(ctx, REG_=
DPI_CTRL, BIT_DPU_EDPI_TE_EN);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable stop done I=
NT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU=
_INT_DONE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* enable TE INT */<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU=
_INT_TE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* enable iommu va out of range read error INT */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU_INT_MMU_VAOR_RD;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* enable iommu va out of range write error INT *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU_INT_MMU_VAOR_WR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* enable iommu invalid read error INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU_INT_MMU_INV_RD;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* enable iommu invalid write error INT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU_INT_MMU_INV_WR;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(int_mask, ctx-&gt;base + REG_DPU_INT_EN);<=
br>
&gt; +}<br>
&gt; +<br>
&gt; +void sprd_dpu_run(struct sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;ctx;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dpu_reg_set(ctx, REG_DPU_CTRL, BIT_DPU_RUN);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;stopped =3D false;<br>
&gt; +}<br>
&gt; +<br>
&gt; +void sprd_dpu_stop(struct sprd_dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;ctx;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ctx-&gt;if_type =3D=3D SPRD_DPU_IF_DPI)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dpu_reg_set(ctx, REG_=
DPU_CTRL, BIT_DPU_STOP);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dpu_wait_stop_done(dpu);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_plane_atomic_check(struct drm_plane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_state *state)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_framebuffer *fb =3D state-&gt;fb;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_crtc_state *crtc_state;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 fmt;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!fb || !state-&gt;crtc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fmt =3D drm_format_to_dpu(fb);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!fmt)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0crtc_state =3D drm_atomic_get_crtc_state(state-&g=
t;state, state-&gt;crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(crtc_state))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(crtc_s=
tate);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return drm_atomic_helper_check_plane_state(state,=
 crtc_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0DRM_PLANE_HELPER_NO_SCALING,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0DRM_PLANE_HELPER_NO_SCALING,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0true, true);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_plane_atomic_update(struct drm_plane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_state *ol=
d_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_plane_state *state =3D plane-&gt;state=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D to_sprd_plane(plane);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D to_sprd_crtc(state-&gt;c=
rtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* start configure dpu layers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dpu_layer(dpu, p, state);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_plane_atomic_disable(struct drm_plane *plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_plane_state *o=
ld_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D to_sprd_plane(plane);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D to_sprd_crtc(old_state-&=
gt;crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0layer_reg_wr(&amp;dpu-&gt;ctx, REG_LAY_CTRL, 0x00=
, p-&gt;index);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_plane_create_properties(struct sprd_plane *p, int in=
dex)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int supported_modes =3D BIT(DRM_MODE_BLE=
ND_PIXEL_NONE) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(DRM_MODE_BLEND=
_PREMULTI) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(DRM_MODE_BLEND=
_COVERAGE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* create rotation property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_plane_create_rotation_property(&amp;p-&gt;pla=
ne,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_=
MODE_ROTATE_0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_=
MODE_ROTATE_MASK |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_=
MODE_REFLECT_MASK);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* create alpha property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_plane_create_alpha_property(&amp;p-&gt;plane)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* create blend mode property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_plane_create_blend_mode_property(&amp;p-&gt;p=
lane, supported_modes);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* create zpos property */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_plane_create_zpos_immutable_property(&amp;p-&=
gt;plane, index);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_plane_helper_funcs sprd_plane_helper_funcs =
=3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_check =3D sprd_plane_atomic_check,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_update =3D sprd_plane_atomic_update,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_disable =3D sprd_plane_atomic_disable,<br=
>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct drm_plane_funcs sprd_plane_funcs =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.update_plane =3D drm_atomic_helper_update_plane,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.disable_plane=C2=A0 =3D drm_atomic_helper_disabl=
e_plane,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.destroy =3D drm_plane_cleanup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reset =3D drm_atomic_helper_plane_reset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_duplicate_state =3D drm_atomic_helper_pla=
ne_duplicate_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_destroy_state =3D drm_atomic_helper_plane=
_destroy_state,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct drm_plane *sprd_plane_init(struct drm_device *drm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct sprd_=
dpu *dpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_plane *primary =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_plane *p =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret, i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 6; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D devm_kzalloc(dr=
m-&gt;dev, sizeof(*p), GFP_KERNEL);<br>
<br>
You still have a devm_kzalloc here. We&#39;ve just landed some neat new drm=
m_<br>
helpers to allocate planes, please use these instead. See<br>
drmm_universal_plane_alloc().<br></blockquote><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!p)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ERR_PTR(-ENOMEM);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_universal=
_plane_init(drm, &amp;p-&gt;plane, 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;sprd_plane_funcs, primary_fmts,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ARRAY_SIZE(primary_fmts), NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DRM_PLANE_TYPE_PRIMARY, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0drm_err(drm, &quot;fail to init primary plane\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ERR_PTR(ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_plane_helper_add(=
&amp;p-&gt;plane, &amp;sprd_plane_helper_funcs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprd_plane_create_pro=
perties(p, i);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p-&gt;index =3D i;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0primary =3D &amp;p-&gt;plane;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return primary;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static enum drm_mode_status sprd_crtc_mode_valid(struct drm_crtc *crt=
c,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct=
 drm_display_mode *mode)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_dbg(dpu-&gt;drm, &quot;%s() mode: &quot;DRM_M=
ODE_FMT&quot;\n&quot;, __func__, DRM_MODE_ARG(mode));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (mode-&gt;type &amp; DRM_MODE_TYPE_PREFERRED) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_display_mode_to_v=
ideomode(mode, &amp;dpu-&gt;ctx.vm);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((mode-&gt;hdispla=
y =3D=3D mode-&gt;htotal) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(mode-&=
gt;vdisplay =3D=3D mode-&gt;vtotal))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dpu-&gt;ctx.if_type =3D SPRD_DPU_IF_EDPI;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dpu-&gt;ctx.if_type =3D SPRD_DPU_IF_DPI;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return MODE_OK;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_crtc_state *old_state=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dpu_init(dpu);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dpi_init(dpu);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enable_irq(dpu-&gt;ctx.irq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_crtc_vblank_on(&amp;dpu-&gt;crtc);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_atomic_disable(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc_state *old=
_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D dpu-&gt;<a href=3D"htt=
p://crtc.dev" rel=3D"noreferrer" target=3D"_blank">crtc.dev</a>;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_crtc_vblank_off(&amp;dpu-&gt;crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0disable_irq(dpu-&gt;ctx.irq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dpu_fini(dpu);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock_irq(&amp;drm-&gt;event_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (crtc-&gt;state-&gt;event) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_send_vblank_=
event(crtc, crtc-&gt;state-&gt;event);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtc-&gt;state-&gt;ev=
ent =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock_irq(&amp;drm-&gt;event_lock);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_crtc_atomic_check(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_crtc_state *state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_dbg(crtc-&gt;dev, &quot;%s()\n&quot;, __func_=
_);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_atomic_flush(struct drm_crtc *crtc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc_state *old_state)=
<br>
&gt; +<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D dpu-&gt;<a href=3D"htt=
p://crtc.dev" rel=3D"noreferrer" target=3D"_blank">crtc.dev</a>;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprd_dpu_flip(dpu);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock_irq(&amp;drm-&gt;event_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (crtc-&gt;state-&gt;event) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_send_vblank_=
event(crtc, crtc-&gt;state-&gt;event);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtc-&gt;state-&gt;ev=
ent =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock_irq(&amp;drm-&gt;event_lock);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_crtc_enable_vblank(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dpu_reg_set(&amp;dpu-&gt;ctx, REG_DPU_INT_EN, BIT=
_DPU_INT_VSYNC);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_crtc_disable_vblank(struct drm_crtc *crtc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dpu_reg_clr(&amp;dpu-&gt;ctx, REG_DPU_INT_EN, BIT=
_DPU_INT_VSYNC);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct drm_crtc_helper_funcs sprd_crtc_helper_funcs =3D =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.mode_valid=C2=A0 =C2=A0 =C2=A0=3D sprd_crtc_mode=
_valid,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_check=C2=A0 =C2=A0=3D sprd_crtc_atomic_ch=
eck,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_flush=C2=A0 =C2=A0=3D sprd_crtc_atomic_fl=
ush,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_enable=C2=A0 =3D sprd_crtc_atomic_enable,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_disable =3D sprd_crtc_atomic_disable,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct drm_crtc_funcs sprd_crtc_funcs =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.destroy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D drm_crtc_=
cleanup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.set_config=C2=A0 =C2=A0 =C2=A0=3D drm_atomic_hel=
per_set_config,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.page_flip=C2=A0 =C2=A0 =C2=A0 =3D drm_atomic_hel=
per_page_flip,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.reset=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D drm_=
atomic_helper_crtc_reset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_duplicate_state =3D drm_atomic_helper_crt=
c_duplicate_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.atomic_destroy_state=C2=A0 =C2=A0=3D drm_atomic_=
helper_crtc_destroy_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.enable_vblank=C2=A0 =3D sprd_crtc_enable_vblank,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.disable_vblank =3D sprd_crtc_disable_vblank,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_crtc_init(struct drm_device *drm, struct drm_crtc *cr=
tc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 struct drm_plane *primary)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *port;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * set crtc port so that drm_of_find_possible_crt=
cs call works<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0port =3D of_parse_phandle(drm-&gt;dev-&gt;of_node=
, &quot;ports&quot;, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!port) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;fi=
nd &#39;ports&#39; phandle of %s failed\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0drm-&gt;dev-&gt;of_node-&gt;full_name);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0of_node_put(port);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0crtc-&gt;port =3D port;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D drm_crtc_init_with_planes(drm, crtc, prim=
ary, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sprd_cr=
tc_funcs, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(drm, &quot;fa=
iled to init crtc.\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_crtc_helper_add(crtc, &amp;sprd_crtc_helper_f=
uncs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static irqreturn_t sprd_dpu_isr(int irq, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;ctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 reg_val, int_mask =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg_val =3D readl(ctx-&gt;base + REG_DPU_INT_STS)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* disable err interrupt */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (reg_val &amp; BIT_DPU_INT_ERR) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int_mask |=3D BIT_DPU=
_INT_ERR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_warn(dpu-&gt;drm,=
 &quot;Warning: dpu underflow!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* dpu update done isr */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (reg_val &amp; BIT_DPU_INT_UPDATE_DONE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;evt_update =
=3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_interruptible=
_all(&amp;ctx-&gt;wait_queue);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* dpu stop done isr */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (reg_val &amp; BIT_DPU_INT_DONE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;evt_stop =3D =
true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_interruptible=
_all(&amp;ctx-&gt;wait_queue);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (reg_val &amp; BIT_DPU_INT_VSYNC)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_crtc_handle_vblan=
k(&amp;dpu-&gt;crtc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int_mask |=3D check_mmu_isr(dpu, reg_val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(reg_val, ctx-&gt;base + REG_DPU_INT_CLR);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0dpu_reg_clr(ctx, REG_DPU_INT_EN, int_mask);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return IRQ_HANDLED;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dpu_bind(struct device *dev, struct device *master, v=
oid *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D dev_get_drvdata(dev);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_plane *plane;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0plane =3D sprd_plane_init(drm, dpu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR_OR_NULL(plane)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ERR(plane=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D sprd_crtc_init(drm, &amp;dpu-&gt;crtc, pl=
ane);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dpu-&gt;drm =3D drm;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sprd_dpu_unbind(struct device *dev, struct device *master=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D dev_get_drvdata(dev);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_crtc_cleanup(&amp;dpu-&gt;crtc);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct component_ops dpu_component_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.bind =3D sprd_dpu_bind,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.unbind =3D sprd_dpu_unbind,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_dpu_context_init(struct sprd_dpu *dpu,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct platform_device *pdev =3D to_platform_devi=
ce(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dpu_context *ctx =3D &amp;dpu-&gt;ctx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESOURCE_ME=
M, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;base =3D devm_ioremap(dev, res-&gt;start,=
 resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ctx-&gt;base) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;fa=
iled to map dpu registers\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ctx-&gt;irq =3D platform_get_irq(pdev, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ctx-&gt;irq &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;fa=
iled to get dpu irq\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ctx-&gt;irq;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0irq_set_status_flags(ctx-&gt;irq, IRQ_NOAUTOEN);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D devm_request_irq(dev, ctx-&gt;irq, sprd_d=
pu_isr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, &quot;DPU=
&quot;, dpu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;fa=
iled to register dpu irq handler\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0init_waitqueue_head(&amp;ctx-&gt;wait_queue);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id dpu_match_table[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;sprd,sharkl3-dpu&quot; },=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ /* sentinel */ },<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int sprd_dpu_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dpu =3D kzalloc(sizeof(*dpu), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!dpu)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D sprd_dpu_context_init(dpu, &amp;pdev-&gt;=
dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(dpu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, dpu);<br>
<br>
The above should be moved into your bind function, with that you can<br>
allocate the struct sprd_dpu with drmm_crtc_alloc_with_planes() and remove<=
br>
a bunch of cleanup code.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return component_add(&amp;pdev-&gt;dev, &amp;dpu_=
component_ops);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int sprd_dpu_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sprd_dpu *dpu =3D platform_get_drvdata(pde=
v);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0component_del(&amp;pdev-&gt;dev, &amp;dpu_compone=
nt_ops);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(dpu);<br>
<br>
The kfree here is wrong, you&#39;d need to hook into the -&gt;destroy hook =
of the<br>
drm_crtc_funcs, but if you&#39;re using drmm_ like suggested above it shoul=
d<br>
all work including driver unload and any ordering issues with<br>
deferred_probe.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +struct platform_driver sprd_dpu_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe =3D sprd_dpu_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove =3D sprd_dpu_remove,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;sprd-=
dpu-drv&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D d=
pu_match_table,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Leon He &lt;<a href=3D"mailto:leon.he@unisoc.com"=
 target=3D"_blank">leon.he@unisoc.com</a>&gt;&quot;);<br>
&gt; +MODULE_AUTHOR(&quot;Kevin Tang &lt;<a href=3D"mailto:kevin.tang@uniso=
c.com" target=3D"_blank">kevin.tang@unisoc.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;Unisoc Display Controller Driver&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_dpu.h b/drivers/gpu/drm/sprd/sp=
rd_dpu.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..a937ba1<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_dpu.h<br>
&gt; @@ -0,0 +1,120 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2020 Unisoc Inc.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef __SPRD_DPU_H__<br>
&gt; +#define __SPRD_DPU_H__<br>
&gt; +<br>
&gt; +#include &lt;linux/bug.h&gt;<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/device.h&gt;<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; +#include &lt;linux/string.h&gt;<br>
&gt; +#include &lt;video/videomode.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/drm_crtc.h&gt;<br>
&gt; +#include &lt;drm/drm_fourcc.h&gt;<br>
&gt; +#include &lt;drm/drm_print.h&gt;<br>
&gt; +#include &lt;drm/drm_vblank.h&gt;<br>
&gt; +#include &lt;uapi/drm/drm_mode.h&gt;<br>
&gt; +<br>
&gt; +/* DPU Layer registers offset */<br>
&gt; +#define DPU_LAY_REG_OFFSET=C2=A0 =C2=A00x30<br>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SPRD_DPU_IF_DBI =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SPRD_DPU_IF_DPI,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SPRD_DPU_IF_EDPI,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SPRD_DPU_IF_LIMIT<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_90,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_180,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_270,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_0_M,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_90_M,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_180_M,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DPU_LAYER_ROTATION_270_M,<br>
&gt; +};<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * Sprd DPU context structure<br>
&gt; + *<br>
&gt; + * @base: DPU controller base address<br>
&gt; + * @irq: IRQ number to install the handler for<br>
&gt; + * @if_type: The type of DPI interface, default is DPI mode.<br>
&gt; + * @vm: videomode structure to use for DPU and DPI initialization<br>
&gt; + * @stopped: indicates whether DPU are stopped<br>
&gt; + * @wait_queue: wait queue, used to wait for DPU shadow register upda=
te done and<br>
&gt; + * DPU stop register done interrupt signal.<br>
&gt; + * @evt_update: wait queue condition for DPU shadow register<br>
&gt; + * @evt_stop: wait queue condition for DPU stop register<br>
&gt; + */<br>
&gt; +struct dpu_context {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 if_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct videomode vm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool stopped;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0wait_queue_head_t wait_queue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool evt_update;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool evt_stop;<br>
&gt; +};<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * Sprd DPU device structure<br>
&gt; + *<br>
&gt; + * @crtc: DRM crtc<br>
&gt; + * @ctx: A pointer to the DPU&#39;s implementation specific context<b=
r>
&gt; + */<br>
&gt; +struct sprd_dpu {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_crtc crtc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *drm;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dpu_context ctx;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static inline struct sprd_dpu *to_sprd_crtc(struct drm_crtc *crtc)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return container_of(crtc, struct sprd_dpu, crtc);=
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void<br>
&gt; +dpu_reg_set(struct dpu_context *ctx, u32 offset, u32 set_bits)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 bits =3D readl_relaxed(ctx-&gt;base + offset)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(bits | set_bits, ctx-&gt;base + offset);<b=
r>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void<br>
&gt; +dpu_reg_clr(struct dpu_context *ctx, u32 offset, u32 clr_bits)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 bits =3D readl_relaxed(ctx-&gt;base + offset)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(bits &amp; ~clr_bits, ctx-&gt;base + offse=
t);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline u32<br>
&gt; +layer_reg_rd(struct dpu_context *ctx, u32 offset, int index)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 layer_offset =3D offset + index * DPU_LAY_REG=
_OFFSET;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return readl(ctx-&gt;base + layer_offset);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline void<br>
&gt; +layer_reg_wr(struct dpu_context *ctx, u32 offset, u32 cfg_bits, int i=
ndex)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 layer_offset =3D=C2=A0 offset + index * DPU_L=
AY_REG_OFFSET;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel(cfg_bits, ctx-&gt;base + layer_offset);<br=
>
&gt; +}<br>
&gt; +<br>
&gt; +void sprd_dpu_run(struct sprd_dpu *dpu);<br>
&gt; +void sprd_dpu_stop(struct sprd_dpu *dpu);<br>
&gt; +<br>
&gt; +#endif<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sp=
rd_drm.c<br>
&gt; index ec101de..ca93be2 100644<br>
&gt; --- a/drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.c<br>
&gt; @@ -196,6 +196,7 @@ static struct platform_driver sprd_drm_driver =3D =
{<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static struct platform_driver *sprd_drm_drivers[]=C2=A0 =3D {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sprd_drm_driver,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;sprd_dpu_driver,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static int __init sprd_drm_init(void)<br>
&gt; diff --git a/drivers/gpu/drm/sprd/sprd_drm.h b/drivers/gpu/drm/sprd/sp=
rd_drm.h<br>
&gt; index 9781fd5..85d4a8b 100644<br>
&gt; --- a/drivers/gpu/drm/sprd/sprd_drm.h<br>
&gt; +++ b/drivers/gpu/drm/sprd/sprd_drm.h<br>
&gt; @@ -13,4 +13,6 @@ struct sprd_drm {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device drm;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +extern struct platform_driver sprd_dpu_driver;<br>
&gt; +<br>
&gt;=C2=A0 #endif /* _SPRD_DRM_H_ */<br>
&gt; -- <br>
&gt; 2.7.4<br>
&gt; <br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div></div>

--000000000000dbca5705bb0b3610--

--===============1097575216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1097575216==--
