Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 124B03D8426
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 01:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74AE6E0B6;
	Tue, 27 Jul 2021 23:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C72A6E0B6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 23:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0821560F6B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 23:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627429211;
 bh=lcQb2B6VDe5z0agZruoO5Z+YOO2FbWi9HUorcY4qKY0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=M7PotSfKMXwybxViVvAbprIJcsg1ncfGQ69MLVJgNawKnxyfulxm5qS2sq4nAuL5B
 j97dcYUPpshAVlbAsmu1XRqtOWb9CcUiiN5BjZRvvykV5T2lpYogwIaDcsU0mcjGaX
 cMexAMzubK5ILwCQ4SUbKZHeZyBEkSXy7Bso2rHpmEyurQd9LLmsweAytqP8HiBbX6
 rzCL6gOo4myipwOtFR6b2oo9AQZNhR07AB7224jcedyFtPPpesX7yTrEA0gRctFSb6
 pSJrWiK6ReowmlU7JqNWAQUZ7pcOZj8ZI08p54b2xPcBG+vl3rF7WxwlV9OSCCAWYq
 E8GQBvAR+295A==
Received: by mail-ej1-f54.google.com with SMTP id gs8so1419176ejc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 16:40:10 -0700 (PDT)
X-Gm-Message-State: AOAM532rQXfE981PJAkvdElq74CsCkVi546lU2T7z13rxnWdwHe8xYDd
 0Uswoif8+YIgr5NVHvs+2xhREyIMFAPrvBtzmw==
X-Google-Smtp-Source: ABdhPJycOnjG6DjFAnRkiSGtIjqBr1E4c85afzsS8FnRW6JIdYOrrEd1R7VxHhF6cib6rw4d/ctAh4LrFLWAGyddsLg=
X-Received: by 2002:a17:907:62a1:: with SMTP id
 nd33mr24390086ejc.303.1627429209563; 
 Tue, 27 Jul 2021 16:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
 <20210722094551.15255-14-nancy.lin@mediatek.com>
In-Reply-To: <20210722094551.15255-14-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 28 Jul 2021 07:39:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8JNaQ5OQT9bZ3y01gM2oDXUQ15WUv65iSz_JxqbudmbQ@mail.gmail.com>
Message-ID: <CAAOTY_8JNaQ5OQT9bZ3y01gM2oDXUQ15WUv65iSz_JxqbudmbQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] drm/mediatek: add ETHDR support for MT8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

Nancy.Lin <nancy.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=8822=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:46=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Add ETHDR module files:
> ETHDR is designed for HDR video and graphics conversion in the external
> display path. It handles multiple HDR input types and performs tone
> mapping, color space/color format conversion, and then combines
> different layers, output the required HDR or SDR signal to the
> subsequent display path.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile       |   3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h |  16 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |   3 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |   1 +
>  drivers/gpu/drm/mediatek/mtk_ethdr.c    | 413 ++++++++++++++++++++++++
>  5 files changed, 435 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
>
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek=
/Makefile
> index 31613564f499..b4b305d58b0f 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -15,7 +15,8 @@ mediatek-drm-y :=3D mtk_disp_ccorr.o \
>                   mtk_dsi.o \
>                   mtk_dpi.o \
>                   mtk_disp_pseudo_ovl.o \
> -                 mtk_mdp_rdma.o
> +                 mtk_mdp_rdma.o \
> +                 mtk_ethdr.o
>
>  obj-$(CONFIG_DRM_MEDIATEK) +=3D mediatek-drm.o
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index 3e27ce7fef57..464db52131db 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -105,4 +105,20 @@ void mtk_rdma_enable_vblank(struct device *dev,
>                             void *vblank_cb_data);
>  void mtk_rdma_disable_vblank(struct device *dev);
>
> +int mtk_ethdr_clk_enable(struct device *dev);
> +void mtk_ethdr_clk_disable(struct device *dev);
> +void mtk_ethdr_config(struct device *dev, unsigned int w,
> +                     unsigned int h, unsigned int vrefresh,
> +                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> +void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
> +                           struct mtk_plane_state *state,
> +                           struct cmdq_pkt *cmdq_pkt);
> +void mtk_ethdr_enable_vblank(struct device *dev,
> +                            void (*vblank_cb)(void *),
> +                            void *vblank_cb_data);
> +void mtk_ethdr_disable_vblank(struct device *dev);
> +void mtk_ethdr_start(struct device *dev);
> +void mtk_ethdr_stop(struct device *dev);
> +unsigned int mtk_ethdr_layer_nr(struct device *dev);
> +
>  #endif
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 11c25daf05d8..58f9f9f06e94 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -480,6 +480,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
] =3D {
>           .data =3D (void *)MTK_DISP_PWM },
>         { .compatible =3D "mediatek,mt8173-disp-od",
>           .data =3D (void *)MTK_DISP_OD },
> +       { .compatible =3D "mediatek,mt8195-disp-ethdr",
> +         .data =3D (void *)MTK_DISP_PSEUDO_OVL },
>         { }
>  };
>
> @@ -676,6 +678,7 @@ static struct platform_driver * const mtk_drm_drivers=
[] =3D {
>         &mtk_dpi_driver,
>         &mtk_drm_platform_driver,
>         &mtk_dsi_driver,
> +       &mtk_ethdr_driver,
>  };
>
>  static int __init mtk_drm_init(void)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.h
> index c4d802a43531..c87ebb5309d0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -55,5 +55,6 @@ extern struct platform_driver mtk_disp_dsc_driver;
>  extern struct platform_driver mtk_disp_merge_driver;
>  extern struct platform_driver mtk_dpi_driver;
>  extern struct platform_driver mtk_dsi_driver;
> +extern struct platform_driver mtk_ethdr_driver;
>
>  #endif /* MTK_DRM_DRV_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/media=
tek/mtk_ethdr.c
> new file mode 100644
> index 000000000000..26e079323de0
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
> @@ -0,0 +1,413 @@
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
> +#include <linux/pm_runtime.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
> +
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
> +#include "mtk_disp_pseudo_ovl.h"
> +
> +#define MIX_INTEN              0x4
> +       #define MIX_FME_CPL_INTEN       BIT(1)
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
> +       struct device *pseudo_ovl_dev;
> +       struct device *mmsys_dev;
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
> +
> +       priv->vblank_cb =3D vblank_cb;
> +       priv->vblank_cb_data =3D vblank_cb_data;

I think register callback function need to be protected like [1].

[1] https://chromium-review.googlesource.com/c/chromiumos/third_party/kerne=
l/+/3021203

> +
> +       writel(MIX_FME_CPL_INTEN, priv->ethdr_comp[ETHDR_MIXER].regs + MI=
X_INTEN);
> +}
> +
> +void mtk_ethdr_disable_vblank(struct device *dev)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +
> +       priv->vblank_cb =3D NULL;
> +       priv->vblank_cb_data =3D NULL;

Ditto.

> +
> +       writel(0x0, priv->ethdr_comp[ETHDR_MIXER].regs + MIX_INTEN);
> +}
> +
> +static irqreturn_t mtk_ethdr_irq_handler(int irq, void *dev_id)
> +{
> +       struct mtk_ethdr *priv =3D dev_id;
> +
> +       writel(0x0, priv->ethdr_comp[ETHDR_MIXER].regs + MIX_INTSTA);
> +
> +       if (!priv->vblank_cb)
> +               return IRQ_NONE;
> +
> +       priv->vblank_cb(priv->vblank_cb_data);
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
> +       unsigned int src_size =3D (pending->height << 16) | pending->widt=
h;
> +       unsigned int offset =3D (pending->y << 16) | pending->x;
> +       unsigned int alpha_con =3D 0;
> +       unsigned int fmt =3D 0;
> +
> +       dev_dbg(dev, "%s+ idx:%d", __func__, idx);
> +
> +       if (idx >=3D 4)
> +               return;
> +
> +       mtk_pseudo_ovl_layer_config(priv->pseudo_ovl_dev, idx, state, cmd=
q_pkt);
> +
> +       if (!pending->enable) {
> +               mtk_ddp_write(cmdq_pkt, 0, &mixer->cmdq_base, mixer->regs=
, MIX_L_SRC_SIZE(idx));
> +               return;
> +       }
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
> +
> +       mtk_ddp_write(cmdq_pkt, src_size, &mixer->cmdq_base, mixer->regs,=
 MIX_L_SRC_SIZE(idx));
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
> +void mtk_ethdr_config(struct device *dev, unsigned int w,
> +                     unsigned int h, unsigned int vrefresh,
> +                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct mtk_ethdr_comp *vdo_fe0 =3D &priv->ethdr_comp[ETHDR_VDO_FE=
0];
> +       struct mtk_ethdr_comp *vdo_fe1 =3D &priv->ethdr_comp[ETHDR_VDO_FE=
1];
> +       struct mtk_ethdr_comp *gfx_fe0 =3D &priv->ethdr_comp[ETHDR_GFX_FE=
0];
> +       struct mtk_ethdr_comp *gfx_fe1 =3D &priv->ethdr_comp[ETHDR_GFX_FE=
1];
> +       struct mtk_ethdr_comp *vdo_be =3D &priv->ethdr_comp[ETHDR_VDO_BE]=
;
> +       struct mtk_ethdr_comp *mixer =3D &priv->ethdr_comp[ETHDR_MIXER];
> +       int i;
> +
> +       dev_dbg(dev, "%s-w:%d, h:%d\n", __func__, w, h);
> +
> +       mtk_pseudo_ovl_config(priv->pseudo_ovl_dev, w, h, vrefresh, bpc, =
cmdq_pkt);
> +
> +       mtk_ddp_write(cmdq_pkt, HDR_VDO_FE_0804_BYPASS_ALL, &vdo_fe0->cmd=
q_base,
> +                     vdo_fe0->regs, HDR_VDO_FE_0804_HDR_DM_FE);
> +
> +       mtk_ddp_write(cmdq_pkt, HDR_VDO_FE_0804_BYPASS_ALL, &vdo_fe1->cmd=
q_base,
> +                     vdo_fe1->regs, HDR_VDO_FE_0804_HDR_DM_FE);
> +
> +       mtk_ddp_write(cmdq_pkt, HDR_GFX_FE_0204_BYPASS_ALL, &gfx_fe0->cmd=
q_base,
> +                     gfx_fe0->regs, HDR_GFX_FE_0204_GFX_HDR_FE);
> +
> +       mtk_ddp_write(cmdq_pkt, HDR_GFX_FE_0204_BYPASS_ALL, &gfx_fe1->cmd=
q_base,
> +                     gfx_fe1->regs, HDR_GFX_FE_0204_GFX_HDR_FE);
> +
> +       mtk_ddp_write(cmdq_pkt, HDR_VDO_BE_0204_BYPASS_ALL, &vdo_be->cmdq=
_base,
> +                     vdo_be->regs, HDR_VDO_BE_0204_VDO_DM_BE);
> +
> +       mtk_ddp_write(cmdq_pkt, MIX_FUNC_DCM_ENABLE, &mixer->cmdq_base, m=
ixer->regs, MIX_FUNC_DCM0);
> +       mtk_ddp_write(cmdq_pkt, MIX_FUNC_DCM_ENABLE, &mixer->cmdq_base, m=
ixer->regs, MIX_FUNC_DCM1);
> +       mtk_ddp_write(cmdq_pkt, (h << 16 | w), &mixer->cmdq_base, mixer->=
regs, MIX_ROI_SIZE);
> +       mtk_ddp_write(cmdq_pkt, BGCLR_BLACK, &mixer->cmdq_base, mixer->re=
gs, MIX_ROI_BGCLR);
> +       mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, m=
ixer->regs,
> +                     MIX_L_SRC_CON(0));
> +       mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, m=
ixer->regs,
> +                     MIX_L_SRC_CON(1));
> +       mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, m=
ixer->regs,
> +                     MIX_L_SRC_CON(2));
> +       mtk_ddp_write(cmdq_pkt, NON_PREMULTI_SOURCE, &mixer->cmdq_base, m=
ixer->regs,
> +                     MIX_L_SRC_CON(3));
> +       mtk_ddp_write(cmdq_pkt, 0x0, &mixer->cmdq_base, mixer->regs, MIX_=
L_SRC_SIZE(0));
> +       mtk_ddp_write(cmdq_pkt, OUTPUT_NO_RND | SOURCE_RGB_SEL | BACKGROU=
ND_RELAY,
> +                     &mixer->cmdq_base, mixer->regs, MIX_DATAPATH_CON);
> +       mtk_ddp_write_mask(cmdq_pkt, MIX_SRC_L0_EN, &mixer->cmdq_base, mi=
xer->regs,
> +                          MIX_SRC_CON, MIX_SRC_L0_EN);
> +
> +       mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_BE_ASYNC_W=
IDTH, 0,
> +                            (w / 2), cmdq_pkt);

Remove parentheses of (w / 2).

> +       mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_HDR_BE_ASYNC_H=
EIGHT, 0,
> +                            h, cmdq_pkt);
> +       mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_IN_CH_SW=
AP, 4, 0, cmdq_pkt);
> +
> +       for (i =3D 1; i <=3D 4; i++) {
> +               mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_=
IN_ALPHA_ODD, i,
> +                                    DEFAULT_9BIT_ALPHA, cmdq_pkt);
> +               mtk_mmsys_ddp_config(priv->mmsys_dev, MMSYS_CONFIG_MIXER_=
IN_ALPHA_EVEN, i,
> +                                    DEFAULT_9BIT_ALPHA, cmdq_pkt);

Could these be moved to mtk_ethdr_layer_config()? That means you
config the i only for the layer is on.

> +       }
> +}
> +
> +void mtk_ethdr_start(struct device *dev)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct mtk_ethdr_comp *mixer =3D &priv->ethdr_comp[ETHDR_MIXER];
> +
> +       mtk_pseudo_ovl_start(priv->pseudo_ovl_dev);
> +
> +       mtk_ddp_write(NULL, 1, &mixer->cmdq_base, mixer->regs, MIX_EN);

whitel();

> +}
> +
> +void mtk_ethdr_stop(struct device *dev)
> +{
> +       struct mtk_ethdr *priv =3D dev_get_drvdata(dev);
> +       struct mtk_ethdr_comp *mixer =3D &priv->ethdr_comp[ETHDR_MIXER];
> +
> +       mtk_pseudo_ovl_stop(priv->pseudo_ovl_dev);
> +
> +       mtk_ddp_write(NULL, 0, &mixer->cmdq_base, mixer->regs, MIX_EN);

ditto.

Regards,
Chun-Kuang.

> +       mtk_ddp_write(NULL, 1, &mixer->cmdq_base, mixer->regs, MIX_RST);
> +       reset_control_reset(devm_reset_control_array_get(dev, true, true)=
);
> +       mtk_ddp_write(NULL, 0, &mixer->cmdq_base, mixer->regs, MIX_RST);
> +}
> +
