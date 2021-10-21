Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2CA4366B0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 17:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496886ECAA;
	Thu, 21 Oct 2021 15:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A1D6ECAA
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 15:45:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C01886128E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634831108;
 bh=GTxrDHdfE5Ly4aiXxARUg2pfr/SDgFwqYMxHD1unVT0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iNv0nLSiR5EdbI+/prkOXiKtW4Ta69ubVa6WHUmikoKq4aY0LzlkR8930TX/nHEK+
 Uw/iYQYJo0jHsCo6fYUyquna7taizZ/Q2/e6PsPdNPEWGj6Xhb/2CF6Kxqgurg2o7Q
 FebJUIbOOUTIfATC0l5olg5odejnUcwrLetO//epFDq0jPxefIa8TWOdaLpde8qlw2
 uba1pmZIY9YXHnode/Rm8jyowSZBSSnLJ+7NhmAJkrMjU3wlldBoTwqHygyeHaoeH9
 yBG8/1TtqGTlQZ/4t68xmbk+Tu2cMVdy0KGhPQcMJoG6godHHTfsxSJWgfk5aJGDCx
 JJsmoHHaFuPuA==
Received: by mail-ed1-f51.google.com with SMTP id t16so2824178eds.9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 08:45:08 -0700 (PDT)
X-Gm-Message-State: AOAM530ycSpRC7W1Q4qtS4pCJB6571QQc7TJ4Bk9RDwkDaKBGM+My3ST
 WigbH74IamDPnTRDqR0uw7rWINaJ09dnL6Xm9Q==
X-Google-Smtp-Source: ABdhPJxdGd0ucp6L6ON190q+pzivnCIJcM5Fl+c2bBg02JsOOmqo3B1odU/AN2kNHK0OJt1vpeC905kvRI9Gj49cOgo=
X-Received: by 2002:a17:907:a413:: with SMTP id
 sg19mr3822359ejc.241.1634831107061; 
 Thu, 21 Oct 2021 08:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
 <20211004062140.29803-14-nancy.lin@mediatek.com>
In-Reply-To: <20211004062140.29803-14-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 21 Oct 2021 23:44:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9jz7wnKHm+S5d1NVp+GnPCUBrrGU3sTP9zGJYTfDsM-Q@mail.gmail.com>
Message-ID: <CAAOTY_9jz7wnKHm+S5d1NVp+GnPCUBrrGU3sTP9zGJYTfDsM-Q@mail.gmail.com>
Subject: Re: [PATCH v6 13/16] drm/mediatek: add ETHDR support for MT8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
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

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=884=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:22=E5=AF=AB=E9=81=93=EF=BC=9A
>
> ETHDR is a part of ovl_adaptor.
> ETHDR is designed for HDR video and graphics conversion in the external
> display path. It handles multiple HDR input types and performs tone
> mapping, color space/color format conversion, and then combine
> different layers, output the required HDR or SDR signal to the
> subsequent display path.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile    |   1 +
>  drivers/gpu/drm/mediatek/mtk_ethdr.c | 403 +++++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_ethdr.h |  25 ++
>  3 files changed, 429 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h
>
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek=
/Makefile
> index 6e604a933ed0..fb158a1e7f06 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -14,6 +14,7 @@ mediatek-drm-y :=3D mtk_disp_aal.o \
>                   mtk_drm_plane.o \
>                   mtk_dsi.o \
>                   mtk_dpi.o \
> +                 mtk_ethdr.o \
>                   mtk_mdp_rdma.o
>
>  obj-$(CONFIG_DRM_MEDIATEK) +=3D mediatek-drm.o
> diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/media=
tek/mtk_ethdr.c
> new file mode 100644
> index 000000000000..99e5a95aebed
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
> @@ -0,0 +1,403 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <drm/drm_fourcc.h>
> +#include <linux/clk.h>
> +#include <linux/reset.h>
> +#include <linux/component.h>
> +#include <linux/of_device.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
> +
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
> +#include "mtk_ethdr.h"
> +
> +#define MIX_INTEN              0x4
> +       #define MIX_FME_CPL_INTEN       BIT(1)

Align the indent with mdp rdma driver.

> +#define MIX_INTSTA             0x8
> +#define MIX_EN                 0xc
> +#define MIX_RST                        0x14
> +#define MIX_ROI_SIZE           0x18
> +#define MIX_DATAPATH_CON       0x1c
> +       #define OUTPUT_NO_RND   BIT(3)
> +       #define SOURCE_RGB_SEL  BIT(7)
> +       #define BACKGROUND_RELAY        (4 << 9)
> +#define MIX_ROI_BGCLR          0x20
> +       #define BGCLR_BLACK     0xff000000
> +#define MIX_SRC_CON            0x24
> +       #define MIX_SRC_L0_EN   BIT(0)
> +#define MIX_L_SRC_CON(n)       (0x28 + 0x18 * (n))
> +       #define NON_PREMULTI_SOURCE (2 << 12)
> +#define MIX_L_SRC_SIZE(n)      (0x30 + 0x18 * (n))
> +#define MIX_L_SRC_OFFSET(n)    (0x34 + 0x18 * (n))
> +#define MIX_FUNC_DCM0          0x120
> +#define MIX_FUNC_DCM1          0x124
> +       #define MIX_FUNC_DCM_ENABLE 0xffffffff
> +
> +#define HDR_VDO_FE_0804_HDR_DM_FE      0x804
> +       #define HDR_VDO_FE_0804_BYPASS_ALL      0xfd
> +#define HDR_GFX_FE_0204_GFX_HDR_FE     0x204
> +       #define HDR_GFX_FE_0204_BYPASS_ALL      0xfd
> +#define HDR_VDO_BE_0204_VDO_DM_BE      0x204
> +       #define HDR_VDO_BE_0204_BYPASS_ALL      0x7e
> +
> +#define MIXER_INx_MODE_BYPASS 0

MIXER_INX_MODE_BYPASS

> +#define MIXER_INx_MODE_EVEN_EXTEND 1
> +#define MIXER_INx_MODE_ODD_EXTEND 2
> +#define DEFAULT_9BIT_ALPHA     0x100
> +#define        MIXER_ALPHA_AEN         BIT(8)
> +#define        MIXER_ALPHA             0xff
> +#define ETHDR_CLK_NUM          13
> +
> +enum mtk_ethdr_comp_id {
> +       ETHDR_MIXER,
> +       ETHDR_VDO_FE0,
> +       ETHDR_VDO_FE1,
> +       ETHDR_GFX_FE0,
> +       ETHDR_GFX_FE1,
> +       ETHDR_VDO_BE,
> +       ETHDR_ADL_DS,
> +       ETHDR_ID_MAX
> +};
> +
> +struct mtk_ethdr_comp {
> +       struct device *dev;
> +       void __iomem *regs;
> +       struct cmdq_client_reg cmdq_base;
> +};
> +
> +struct mtk_ethdr {
> +       struct mtk_ethdr_comp ethdr_comp[ETHDR_ID_MAX];
> +       struct clk_bulk_data ethdr_clk[ETHDR_CLK_NUM];
> +       struct device *mmsys_dev;
> +       spinlock_t lock; /* protects vblank_cb and vblank_cb_data */
> +       void (*vblank_cb)(void *data);
> +       void *vblank_cb_data;
> +       int irq;
> +};
> +
> +static const char * const ethdr_comp_str[] =3D {
> +       "ETHDR_MIXER",
> +       "ETHDR_VDO_FE0",
> +       "ETHDR_VDO_FE1",
> +       "ETHDR_GFX_FE0",
> +       "ETHDR_GFX_FE1",
> +       "ETHDR_VDO_BE",
> +       "ETHDR_ADL_DS",
> +       "ETHDR_ID_MAX"
> +};
> +
> +static const char * const ethdr_clk_str[] =3D {
> +       "ethdr_top",
> +       "mixer",
> +       "vdo_fe0",
> +       "vdo_fe1",
> +       "gfx_fe0",
> +       "gfx_fe1",
> +       "vdo_be",
> +       "adl_ds",
> +       "vdo_fe0_async",
> +       "vdo_fe1_async",
> +       "gfx_fe0_async",
> +       "gfx_fe1_async",
> +       "vdo_be_async",
> +};
> +
> +void mtk_ethdr_enable_vblank(struct device *dev,
> +                            void (*vblank_cb)(void *),
> +                            void *vblank_cb_data)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&priv->lock, flags);
> +       priv->vblank_cb =3D vblank_cb;
> +       priv->vblank_cb_data =3D vblank_cb_data;
> +       spin_unlock_irqrestore(&priv->lock, flags);
> +
> +       writel(MIX_FME_CPL_INTEN, priv->ethdr_comp[ETHDR_MIXER].regs + MI=
X_INTEN);
> +}
> +
> +void mtk_ethdr_disable_vblank(struct device *dev)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&priv->lock, flags);
> +       priv->vblank_cb =3D NULL;
> +       priv->vblank_cb_data =3D NULL;
> +       spin_unlock_irqrestore(&priv->lock, flags);
> +
> +       writel(0x0, priv->ethdr_comp[ETHDR_MIXER].regs + MIX_INTEN);
> +}
> +
> +static irqreturn_t mtk_ethdr_irq_handler(int irq, void *dev_id)
> +{
> +       struct mtk_ethdr *priv =3D dev_id;
> +       unsigned long flags;
> +
> +       writel(0x0, priv->ethdr_comp[ETHDR_MIXER].regs + MIX_INTSTA);
> +
> +       spin_lock_irqsave(&priv->lock, flags);
> +       if (!priv->vblank_cb) {
> +               spin_unlock_irqrestore(&priv->lock, flags);
> +               return IRQ_NONE;
> +       }
> +
> +       priv->vblank_cb(priv->vblank_cb_data);
> +       spin_unlock_irqrestore(&priv->lock, flags);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
> +                           struct mtk_plane_state *state,
> +                           struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct mtk_ethdr_comp *mixer =3D &priv->ethdr_comp[ETHDR_MIXER];
> +       struct mtk_plane_pending_state *pending =3D &state->pending;
> +       unsigned int offset =3D (pending->x & 1) << 31 | pending->y << 16=
 | pending->x;
> +       unsigned int mixer_pad_mode =3D MIXER_INx_MODE_BYPASS;
> +       unsigned int alpha_con =3D 0;
> +       unsigned int fmt =3D 0;

fmt is useless, so remove.

> +
> +       dev_dbg(dev, "%s+ idx:%d", __func__, idx);
> +
> +       if (idx >=3D 4)
> +               return;
> +
> +       if (!pending->enable) {
> +               mtk_ddp_write(cmdq_pkt, 0, &mixer->cmdq_base, mixer->regs=
, MIX_L_SRC_SIZE(idx));
> +               mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_=
IN_MODE,
> +                                    idx + 1, MIXER_INx_MODE_BYPASS, cmdq=
_pkt);
> +               mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_=
IN_BIWIDTH,
> +                                    idx + 1, 0, cmdq_pkt);
> +               return;
> +       }
> +
> +       if (pending->x % 2)
> +               mixer_pad_mode =3D MIXER_INx_MODE_EVEN_EXTEND;
> +
> +       mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_MODE,
> +                            idx + 1, mixer_pad_mode, cmdq_pkt);

Drop mixer_pad_mode, and

mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_MODE, idx + 1,
               pending->x & 1 ? MIXER_INx_MODE_EVEN_EXTEND :
MIXER_INx_MODE_BYPASS,
                cmdq_pkt);

Regards,
Chun-Kuang.

> +       mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_BIWID=
TH,
> +                            idx + 1, pending->width / 2 - 1, cmdq_pkt);
> +
> +       if (state->base.fb && state->base.fb->format->has_alpha) {
> +               alpha_con =3D MIXER_ALPHA_AEN | MIXER_ALPHA;
> +               mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_AL=
PHA_SEL,
> +                                    idx + 1, 0, cmdq_pkt);
> +       } else {
> +               mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_AL=
PHA_SEL,
> +                                    idx + 1, 1, cmdq_pkt);
> +       }
> +       mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_ALPHA=
_ODD, idx + 1,
> +                            DEFAULT_9BIT_ALPHA, cmdq_pkt);
> +       mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_ALPHA=
_EVEN, idx + 1,
> +                            DEFAULT_9BIT_ALPHA, cmdq_pkt);
> +
> +       mtk_ddp_write(cmdq_pkt, pending->height << 16 | pending->width, &=
mixer->cmdq_base,
> +                     mixer->regs, MIX_L_SRC_SIZE(idx));
> +       mtk_ddp_write(cmdq_pkt, offset, &mixer->cmdq_base, mixer->regs, M=
IX_L_SRC_OFFSET(idx));
> +       mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer->cmdq_base, mixer-=
>regs, MIX_L_SRC_CON(idx),
> +                          0x1ff);
> +       mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &mixer->cmdq_base, mixer->=
regs, MIX_SRC_CON,
> +                          BIT(idx));
> +}
> +
