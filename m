Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2EE41891C
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 15:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0B96E51B;
	Sun, 26 Sep 2021 13:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF676E51B
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 13:44:15 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id i4so63999534lfv.4
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 06:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XZOLwNY+ICWih17o2Ffky56EJPduYzLRCwZCO7Ukxzw=;
 b=jJlD00VnNLlk8/TX0Mqm5+eGY767h07MCcWFz74ULSTo1S+gydUzphN9EfKnLx3ZXu
 Y30+CVZHg0s3ePhQzySgabPfMuXQ7nyDdeE3HFEVDH1iJ3CMaoZVPovp97kZQOsIENaO
 sepOaE9/BAP1pLVRyZr/R46OgTdqFEREndEKGk1dJ7gSLS31juAsi57eJDdygB9pEETE
 uvYw7Joymm6H5OiXT2Ec/3BJKugsP9uNoXYbtL/3NVnmIyO2KUVwHqRct7S9TLxyANUR
 78qgopnKqqWDNCI+Z0g07ov/2y+iQhSheMerbVgmBJkwnjAdUi31N7HUeXy/TW+8BurH
 ONNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XZOLwNY+ICWih17o2Ffky56EJPduYzLRCwZCO7Ukxzw=;
 b=K8QmHSgl7W0tDX2ZWESHHwB8tH5X9DNWECqWP6IJDiEuEtHCC+BWwTNghe0QEHqHwv
 lTxbayalmJOqq93HEWHMUMgjBSDXx8K9nad7AOdbYYESd5SGwE97GWQ4Q2ioRR9/md+J
 lF63g2dkxDeTaOhkhXFmbICTut8H6n/d3krp2QZZCW62eoloBUwc9eNSmYAgoxfKHZuL
 7NgPf3VyFRNyzEx4Fp/Kkgd0qbG/r/b1MYhL/u7PJSay9qQX4opMIfZQfX6HTc04jcBA
 Gd3GOhE4C200jEPfF8VxI0N5Qr5nDtMyfO091LTcp6nRolKp0vjehx++gydsICtfoCsD
 1o5Q==
X-Gm-Message-State: AOAM532PtjxGWEbTs5az1rASjNKnvn5WKSa3RD9gPnoeGBzXyqqQZPzu
 fRvT/K0sfvVYyiYjKPnGsrIDACyKP3R4yMZQqaE=
X-Google-Smtp-Source: ABdhPJw9sqUNJbGo9lvtOemtV5cKGbiBNow8+kHamf19zMOQikOJTP6Mh+8JRYkK2nPFl2BXWbmhVocwVdWrmuAENwM=
X-Received: by 2002:a2e:9c94:: with SMTP id x20mr22322659lji.94.1632663853423; 
 Sun, 26 Sep 2021 06:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210813145302.3933-1-kevin3.tang@gmail.com>
 <20210813145302.3933-5-kevin3.tang@gmail.com>
 <20210917145818.znqcgwii5s6b6a2n@gilmour>
In-Reply-To: <20210917145818.znqcgwii5s6b6a2n@gilmour>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Sun, 26 Sep 2021 21:44:01 +0800
Message-ID: <CAFPSGXbLb3sjdtCa9zC7N37WHHU1WjhS6V=+kJC7Kt+wPSNqwQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] drm/sprd: add Unisoc's drm display controller
 driver
To: Maxime Ripard <maxime@cerno.tech>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, pony1.wu@gmail.com,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B49=E6=9C=8817=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=8810:58=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Fri, Aug 13, 2021 at 10:53:00PM +0800, Kevin Tang wrote:
> > Adds DPU(Display Processor Unit) support for the Unisoc's display
> > subsystem.
> > It's support multi planes, scaler, rotation, PQ(Picture Quality) and mo=
re.
> >
> > v2:
> >   - Use drm_xxx to replace all DRM_XXX.
> >   - Use kzalloc to replace devm_kzalloc for sprd_dpu structure init.
> >
> > v3:
> >   - Remove dpu_layer stuff layer and commit layers by aotmic_update
> >
> > v4:
> >   - Use drmm_helpers to allocate crtc and planes.
> >   - Move rotation enum definitions to crtc layer reg bitfields.
> >   - Move allocate crtc and planes to bind function.
> >
> > v5:
> >   - Fix the checkpatch warnings.
> >   - Use mode_set_nofb instead of mode_valid callback.
> >   - Follow the OF-Graph bindings, use of_graph_get_port_by_id
> >     instead of of_parse_phandle.
> >   - Use zpos to represent the layer position.
> >   - Rebase to last drm misc branch.
> >
> > v6:
> >   - Disable and clear interrupts before register dpu IRQ
> >   - Init dpi config used by crtc_state->adjusted_mode on mode_set_nofb
> >   - Remove enable_irq and disable_irq function call.
> >   - Remove drm_format_info function call.
> >
> > Cc: Orson Zhai <orsonzhai@gmail.com>
> > Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> > Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> > ---
> >  drivers/gpu/drm/sprd/Kconfig    |   1 +
> >  drivers/gpu/drm/sprd/Makefile   |   3 +-
> >  drivers/gpu/drm/sprd/sprd_dpu.c | 937 ++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/sprd/sprd_dpu.h | 109 ++++
> >  drivers/gpu/drm/sprd/sprd_drm.c |   1 +
> >  drivers/gpu/drm/sprd/sprd_drm.h |   2 +
> >  6 files changed, 1052 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
> >  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
> >
> > diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfi=
g
> > index 726c3e76d..37762c333 100644
> > --- a/drivers/gpu/drm/sprd/Kconfig
> > +++ b/drivers/gpu/drm/sprd/Kconfig
> > @@ -5,6 +5,7 @@ config DRM_SPRD
> >       select DRM_GEM_CMA_HELPER
> >       select DRM_KMS_CMA_HELPER
> >       select DRM_KMS_HELPER
> > +     select VIDEOMODE_HELPERS
> >       help
> >         Choose this option if you have a Unisoc chipset.
> >         If M is selected the module will be called sprd_drm.
> > diff --git a/drivers/gpu/drm/sprd/Makefile b/drivers/gpu/drm/sprd/Makef=
ile
> > index 9850f00b8..ab12b95e6 100644
> > --- a/drivers/gpu/drm/sprd/Makefile
> > +++ b/drivers/gpu/drm/sprd/Makefile
> > @@ -1,3 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >
> > -obj-y :=3D sprd_drm.o
> > +obj-y :=3D sprd_drm.o \
> > +     sprd_dpu.o
> > diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/spr=
d_dpu.c
> > new file mode 100644
> > index 000000000..448dd4fb6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> > @@ -0,0 +1,937 @@
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
> > +#include <linux/of_graph.h>
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
> > +#define BIT_DPU_LAY_ROTATION_0               (0x00 << 20)
> > +#define BIT_DPU_LAY_ROTATION_90              (0x01 << 20)
> > +#define BIT_DPU_LAY_ROTATION_180     (0x02 << 20)
> > +#define BIT_DPU_LAY_ROTATION_270     (0x03 << 20)
> > +#define BIT_DPU_LAY_ROTATION_0_M     (0x04 << 20)
> > +#define BIT_DPU_LAY_ROTATION_90_M    (0x05 << 20)
> > +#define BIT_DPU_LAY_ROTATION_180_M   (0x06 << 20)
> > +#define BIT_DPU_LAY_ROTATION_270_M   (0x07 << 20)
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
> > +static const u32 layer_fmts[] =3D {
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
> > +     struct drm_plane base;
> > +};
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
, val);
> > +
> > +             if (val & BIT_DPU_INT_MMU_INV_RD)
> > +                     drm_err(dpu->drm, "iommu invalid read error, addr=
: 0x%08x\n",
> > +                             readl(ctx->base + REG_MMU_INV_ADDR_RD));
> > +             if (val & BIT_DPU_INT_MMU_INV_WR)
> > +                     drm_err(dpu->drm, "iommu invalid write error, add=
r: 0x%08x\n",
> > +                             readl(ctx->base + REG_MMU_INV_ADDR_WR));
> > +             if (val & BIT_DPU_INT_MMU_VAOR_RD)
> > +                     drm_err(dpu->drm, "iommu va out of range read err=
or, addr: 0x%08x\n",
> > +                             readl(ctx->base + REG_MMU_VAOR_ADDR_RD));
> > +             if (val & BIT_DPU_INT_MMU_VAOR_WR)
> > +                     drm_err(dpu->drm, "iommu va out of range write er=
ror, addr: 0x%08x\n",
> > +                             readl(ctx->base + REG_MMU_VAOR_ADDR_WR));
> > +
> > +             for (i =3D 0; i < 8; i++) {
> > +                     reg_val =3D layer_reg_rd(ctx, REG_LAY_CTRL, i);
> > +                     if (reg_val & 0x1)
> > +                             drm_info(dpu->drm, "layer%d: 0x%x 0x%x 0x=
%x ctrl: 0x%x\n", i,
> > +                                     layer_reg_rd(ctx, REG_LAY_BASE_AD=
DR0, i),
> > +                                     layer_reg_rd(ctx, REG_LAY_BASE_AD=
DR1, i),
> > +                                     layer_reg_rd(ctx, REG_LAY_BASE_AD=
DR2, i),
> > +                                     layer_reg_rd(ctx, REG_LAY_CTRL, i=
));
> > +             }
> > +     }
> > +
> > +     return val;
> > +}
>
> We'll still want an Acked-by from one of the IOMMU maintainers. Last
> time they commented they were against that.
>
> > +static int dpu_wait_stop_done(struct sprd_dpu *dpu)
> > +{
> > +     struct dpu_context *ctx =3D &dpu->ctx;
> > +     int rc;
> > +
> > +     if (ctx->stopped)
> > +             return 0;
> > +
> > +     rc =3D wait_event_interruptible_timeout(ctx->wait_queue, ctx->evt=
_stop,
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
> > +     rc =3D wait_event_interruptible_timeout(ctx->wait_queue, ctx->evt=
_update,
> > +                                            msecs_to_jiffies(500));
> > +
> > +     if (!rc) {
> > +             drm_err(dpu->drm, "dpu wait for reg update done time out!=
\n");
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
> > +             fallthrough;
> > +     case DRM_FORMAT_ABGR8888:
> > +             /* RB switch */
> > +             format |=3D BIT_DPU_LAY_RB_OR_UV_SWITCH;
> > +             fallthrough;
> > +     case DRM_FORMAT_ARGB8888:
> > +             format |=3D BIT_DPU_LAY_FORMAT_ARGB8888;
> > +             break;
> > +     case DRM_FORMAT_XBGR8888:
> > +             /* RB switch */
> > +             format |=3D BIT_DPU_LAY_RB_OR_UV_SWITCH;
> > +             fallthrough;
> > +     case DRM_FORMAT_XRGB8888:
> > +             format |=3D BIT_DPU_LAY_FORMAT_ARGB8888;
> > +             break;
> > +     case DRM_FORMAT_BGR565:
> > +             /* RB switch */
> > +             format |=3D BIT_DPU_LAY_RB_OR_UV_SWITCH;
> > +             fallthrough;
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
> > +     u32 rotation =3D 0;
> > +
> > +     switch (state->rotation) {
> > +     default:
> > +     case DRM_MODE_ROTATE_0:
> > +             rotation =3D BIT_DPU_LAY_ROTATION_0;
> > +             break;
> > +     case DRM_MODE_ROTATE_90:
> > +             rotation =3D BIT_DPU_LAY_ROTATION_90;
> > +             break;
> > +     case DRM_MODE_ROTATE_180:
> > +             rotation =3D BIT_DPU_LAY_ROTATION_180;
> > +             break;
> > +     case DRM_MODE_ROTATE_270:
> > +             rotation =3D BIT_DPU_LAY_ROTATION_270;
> > +             break;
> > +     case DRM_MODE_REFLECT_Y:
> > +             rotation =3D BIT_DPU_LAY_ROTATION_180_M;
> > +             break;
> > +     case (DRM_MODE_REFLECT_Y | DRM_MODE_ROTATE_90):
> > +             rotation =3D BIT_DPU_LAY_ROTATION_90_M;
> > +             break;
> > +     case DRM_MODE_REFLECT_X:
> > +             rotation =3D BIT_DPU_LAY_ROTATION_0_M;
> > +             break;
> > +     case (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_90):
> > +             rotation =3D BIT_DPU_LAY_ROTATION_270_M;
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
> > +static void sprd_dpu_layer(struct sprd_dpu *dpu, struct drm_plane_stat=
e *state)
> > +{
> > +     struct dpu_context *ctx =3D &dpu->ctx;
> > +     struct drm_gem_cma_object *cma_obj;
> > +     struct drm_framebuffer *fb =3D state->fb;
> > +     u32 addr, size, offset, pitch, blend, format, rotation;
> > +     u32 src_x =3D state->src_x >> 16;
> > +     u32 src_y =3D state->src_y >> 16;
> > +     u32 src_w =3D state->src_w >> 16;
> > +     u32 src_h =3D state->src_h >> 16;
> > +     u32 dst_x =3D state->crtc_x;
> > +     u32 dst_y =3D state->crtc_y;
> > +     u32 alpha =3D state->alpha;
> > +     u32 index =3D state->zpos;
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
> > +                     layer_reg_wr(ctx, REG_LAY_BASE_ADDR0, addr, index=
);
> > +             else if (i =3D=3D 1)
> > +                     layer_reg_wr(ctx, REG_LAY_BASE_ADDR1, addr, index=
);
> > +             else
> > +                     layer_reg_wr(ctx, REG_LAY_BASE_ADDR2, addr, index=
);
> > +     }
> > +
> > +     if (fb->format->num_planes =3D=3D 3) {
> > +             /* UV pitch is 1/2 of Y pitch */
> > +             pitch =3D (fb->pitches[0] / fb->format->cpp[0]) |
> > +                             (fb->pitches[0] / fb->format->cpp[0] << 1=
5);
> > +     } else {
> > +             pitch =3D fb->pitches[0] / fb->format->cpp[0];
> > +     }
> > +
> > +     layer_reg_wr(ctx, REG_LAY_POS, offset, index);
> > +     layer_reg_wr(ctx, REG_LAY_SIZE, size, index);
> > +     layer_reg_wr(ctx, REG_LAY_CROP_START,
> > +                     src_y << 16 | src_x, index);
> > +     layer_reg_wr(ctx, REG_LAY_ALPHA, alpha, index);
> > +     layer_reg_wr(ctx, REG_LAY_PITCH, pitch, index);
> > +
> > +     format =3D drm_format_to_dpu(fb);
> > +     blend =3D drm_blend_to_dpu(state);
> > +     rotation =3D drm_rotation_to_dpu(state);
> > +
> > +     layer_reg_wr(ctx, REG_LAY_CTRL, BIT_DPU_LAY_EN |
> > +                             format |
> > +                             blend |
> > +                             rotation,
> > +                             index);
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
> > +     u32 int_mask =3D 0;
> > +
> > +     writel(0x00, ctx->base + REG_BG_COLOR);
> > +     writel(0x00, ctx->base + REG_MMU_EN);
> > +     writel(0x00, ctx->base + REG_MMU_PPN1);
> > +     writel(0xffff, ctx->base + REG_MMU_RANGE1);
> > +     writel(0x00, ctx->base + REG_MMU_PPN2);
> > +     writel(0xffff, ctx->base + REG_MMU_RANGE2);
> > +     writel(0x1ffff, ctx->base + REG_MMU_VPN_RANGE);
> > +
> > +     if (ctx->if_type =3D=3D SPRD_DPU_IF_DPI) {
> > +             /* use dpi as interface */
> > +             dpu_reg_clr(ctx, REG_DPU_CFG0, BIT_DPU_IF_EDPI);
> > +             /* disable Halt function for SPRD DSI */
> > +             dpu_reg_clr(ctx, REG_DPI_CTRL, BIT_DPU_DPI_HALT_EN);
> > +             /* select te from external pad */
> > +             dpu_reg_set(ctx, REG_DPI_CTRL, BIT_DPU_EDPI_FROM_EXTERNAL=
_PAD);
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
> > +             dpu_reg_set(ctx, REG_DPI_CTRL, BIT_DPU_EDPI_FROM_EXTERNAL=
_PAD);
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
> > +     u32 reg_val;
> > +     u32 size;
> > +
> > +     size =3D (ctx->vm.vactive << 16) | ctx->vm.hactive;
> > +     writel(size, ctx->base + REG_PANEL_SIZE);
> > +     writel(size, ctx->base + REG_BLEND_SIZE);
> > +
> > +     if (ctx->if_type =3D=3D SPRD_DPU_IF_DPI) {
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
> > +     }
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
> > +                               struct drm_atomic_state *state)
> > +{
> > +     struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_=
state(state,
> > +                                                                      =
    plane);
> > +     struct drm_crtc_state *crtc_state;
> > +     u32 fmt;
> > +
> > +     if (!plane_state->fb || !plane_state->crtc)
> > +             return 0;
> > +
> > +     fmt =3D drm_format_to_dpu(plane_state->fb);
> > +     if (!fmt)
> > +             return -EINVAL;
> > +
> > +     crtc_state =3D drm_atomic_get_crtc_state(plane_state->state, plan=
e_state->crtc);
> > +     if (IS_ERR(crtc_state))
> > +             return PTR_ERR(crtc_state);
> > +
> > +     return drm_atomic_helper_check_plane_state(plane_state, crtc_stat=
e,
> > +                                               DRM_PLANE_HELPER_NO_SCA=
LING,
> > +                                               DRM_PLANE_HELPER_NO_SCA=
LING,
> > +                                               true, true);
> > +}
> > +
> > +static void sprd_plane_atomic_update(struct drm_plane *drm_plane,
> > +                                 struct drm_atomic_state *state)
> > +{
> > +     struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_st=
ate(state,
> > +                                                                      =
  drm_plane);
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(new_state->crtc);
> > +
> > +     /* start configure dpu layers */
> > +     sprd_dpu_layer(dpu, new_state);
> > +}
> > +
> > +static void sprd_plane_atomic_disable(struct drm_plane *drm_plane,
> > +                                  struct drm_atomic_state *state)
> > +{
> > +     struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_st=
ate(state,
> > +                                                                      =
  drm_plane);
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(old_state->crtc);
> > +
> > +     layer_reg_wr(&dpu->ctx, REG_LAY_CTRL, 0x00, old_state->zpos);
> > +}
> > +
> > +static void sprd_plane_create_properties(struct sprd_plane *plane, int=
 index)
> > +{
> > +     unsigned int supported_modes =3D BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> > +                                    BIT(DRM_MODE_BLEND_PREMULTI) |
> > +                                    BIT(DRM_MODE_BLEND_COVERAGE);
> > +
> > +     /* create rotation property */
> > +     drm_plane_create_rotation_property(&plane->base,
> > +                                        DRM_MODE_ROTATE_0,
> > +                                        DRM_MODE_ROTATE_MASK |
> > +                                        DRM_MODE_REFLECT_MASK);
> > +
> > +     /* create alpha property */
> > +     drm_plane_create_alpha_property(&plane->base);
> > +
> > +     /* create blend mode property */
> > +     drm_plane_create_blend_mode_property(&plane->base, supported_mode=
s);
> > +
> > +     /* create zpos property */
> > +     drm_plane_create_zpos_immutable_property(&plane->base, index);
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
> > +static struct sprd_plane *sprd_planes_init(struct drm_device *drm)
> > +{
> > +     struct sprd_plane *plane, *primary;
> > +     enum drm_plane_type plane_type;
> > +     int i;
> > +
> > +     for (i =3D 0; i < 6; i++) {
> > +             plane_type =3D (i =3D=3D 0) ? DRM_PLANE_TYPE_PRIMARY :
> > +                                     DRM_PLANE_TYPE_OVERLAY;
> > +
> > +             plane =3D drmm_universal_plane_alloc(drm, struct sprd_pla=
ne, base,
> > +                                            1, &sprd_plane_funcs,
> > +                                            layer_fmts, ARRAY_SIZE(lay=
er_fmts),
> > +                                            NULL, plane_type, NULL);
> > +             if (IS_ERR(plane)) {
> > +                     drm_err(drm, "failed to init drm plane: %d\n", i)=
;
> > +                     return plane;
> > +             }
> > +
> > +             drm_plane_helper_add(&plane->base, &sprd_plane_helper_fun=
cs);
> > +
> > +             sprd_plane_create_properties(plane, i);
> > +
> > +             if (i =3D=3D 0)
> > +                     primary =3D plane;
> > +     }
> > +
> > +     return primary;
> > +}
> > +
> > +static void sprd_crtc_mode_set_nofb(struct drm_crtc *crtc)
> > +{
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> > +     struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> > +
> > +     drm_display_mode_to_videomode(mode, &dpu->ctx.vm);
>
> You don't need to store the videomode into you dpu structure, just pass
> adjusted_mode to sprd_dpi_init.
I get it, thks.
>
> > +     sprd_dpi_init(dpu);
> > +}
> > +
> > +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,
> > +                                struct drm_atomic_state *state)
> > +{
> > +     struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> > +
> > +     sprd_dpu_init(dpu);
>
> Do you need to do it on both mode_set_nofb and atomic_enable?
mode_set_nofb is sprd_dpi_init, but atomic_enable is sprd_dpu_init,
not the same interface.
>
> Maxime
