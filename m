Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D493D4AC4
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 02:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048D8737EB;
	Sun, 25 Jul 2021 00:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700E8737EB
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 00:47:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF12A60EB1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 00:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627174038;
 bh=lqphOb0pPXaJ3VZdpct93XwL4ZGYUWJyWDRZ2pY9l7Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MKcsACEOvmnzpySQot9Q0FgZgP9zRt1uiuhBTZznAGd4JsOxQNCW7kd44vEbtQIS2
 2YeDp+oclWx9MBL2Zhl6lbAGTMtlMp53+cgPbbmjJJlNGlYmEHS9ZS+RPO1vEKFu7g
 WdjOgX5RyJbYsOKd5bi7gsQBY86+lf7Y63DZsHN69x80LrBgkoljxFvGb5JyhnvJdK
 +716s+FRJkQZHBRhW26Bq2s8PaIFH6TVgCmhy/qVYMLcxGt2rvvpkUP8259nrGrM3+
 RERbZSBQl/mk7n3uLDczlOVLavc+17qmvRnbHGDV5c37Oeu0AbyRbw9B6ox4ZPG5+s
 gTm/C/mfor2Eg==
Received: by mail-ej1-f48.google.com with SMTP id ga41so9519761ejc.10
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 17:47:17 -0700 (PDT)
X-Gm-Message-State: AOAM532/SzuAdfapEc+YAt1K+D0OGr/QW20U4bXYJMRpzsxqI0T8Xj/w
 Ray8qIoZlj+7co6BOASo1b56HUqScYLvrNPz/Q==
X-Google-Smtp-Source: ABdhPJwA1isch6yhWrzrmK67jOA4kPuoU0cZqcvYoKg20qYbj8+pO+rb90cYn9O720rlCqNBDbvr6mWfA1GWXQih6bA=
X-Received: by 2002:a17:906:2497:: with SMTP id
 e23mr1848834ejb.194.1627174036416; 
 Sat, 24 Jul 2021 17:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <1626417143-8015-1-git-send-email-yongqiang.niu@mediatek.com>
 <1626417143-8015-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1626417143-8015-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 25 Jul 2021 08:47:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-K54whkY9eNc2V66xmra59-aaJTD4amhUKwasQda8Jmg@mail.gmail.com>
Message-ID: <CAAOTY_-K54whkY9eNc2V66xmra59-aaJTD4amhUKwasQda8Jmg@mail.gmail.com>
Subject: Re: [PATCH v3, 1/3] drm/mediatek: Separate aal module
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

Yongqiang Niu <yongqiang.niu@mediatek.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=
=8816=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=882:32=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> mt8183 aal has no gamma function

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile           |   3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_aal.c     | 166 ++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   9 ++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  42 +------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   6 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>  6 files changed, 186 insertions(+), 41 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_aal.c
>
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek=
/Makefile
> index dc54a7a..29098d7 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -mediatek-drm-y :=3D mtk_disp_ccorr.o \
> +mediatek-drm-y :=3D mtk_disp_aal.o \
> +                 mtk_disp_ccorr.o \
>                   mtk_disp_color.o \
>                   mtk_disp_gamma.o \
>                   mtk_disp_ovl.o \
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/me=
diatek/mtk_disp_aal.c
> new file mode 100644
> index 0000000..fb212e96
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> @@ -0,0 +1,166 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#include "mtk_disp_drv.h"
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +
> +#define DISP_AAL_EN                            0x0000
> +#define AAL_EN                                         BIT(0)
> +#define DISP_AAL_SIZE                          0x0030
> +
> +
> +struct mtk_disp_aal_data {
> +       bool has_gamma;
> +};
> +
> +/**
> + * struct mtk_disp_aal - DISP_AAL driver structure
> + * @ddp_comp - structure containing type enum and hardware resources
> + * @crtc - associated crtc to report irq events to
> + */
> +struct mtk_disp_aal {
> +       struct clk *clk;
> +       void __iomem *regs;
> +       struct cmdq_client_reg cmdq_reg;
> +       const struct mtk_disp_aal_data *data;
> +};
> +
> +int mtk_aal_clk_enable(struct device *dev)
> +{
> +       struct mtk_disp_aal *aal =3D dev_get_drvdata(dev);
> +
> +       return clk_prepare_enable(aal->clk);
> +}
> +
> +void mtk_aal_clk_disable(struct device *dev)
> +{
> +       struct mtk_disp_aal *aal =3D dev_get_drvdata(dev);
> +
> +       clk_disable_unprepare(aal->clk);
> +}
> +
> +void mtk_aal_config(struct device *dev, unsigned int w,
> +                          unsigned int h, unsigned int vrefresh,
> +                          unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_aal *aal =3D dev_get_drvdata(dev);
> +
> +       mtk_ddp_write(cmdq_pkt, w << 16 | h, &aal->cmdq_reg, aal->regs, D=
ISP_AAL_SIZE);
> +}
> +
> +void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
> +{
> +       struct mtk_disp_aal *aal =3D dev_get_drvdata(dev);
> +
> +       if (aal->data && aal->data->has_gamma)
> +               mtk_gamma_set_common(aal->regs, state);
> +}
> +
> +void mtk_aal_start(struct device *dev)
> +{
> +       struct mtk_disp_aal *aal =3D dev_get_drvdata(dev);
> +
> +       writel(AAL_EN, aal->regs + DISP_AAL_EN);
> +}
> +
> +void mtk_aal_stop(struct device *dev)
> +{
> +       struct mtk_disp_aal *aal =3D dev_get_drvdata(dev);
> +
> +       writel_relaxed(0x0, aal->regs + DISP_AAL_EN);
> +}
> +
> +static int mtk_disp_aal_bind(struct device *dev, struct device *master,
> +                              void *data)
> +{
> +       return 0;
> +}
> +
> +static void mtk_disp_aal_unbind(struct device *dev, struct device *maste=
r,
> +                                 void *data)
> +{
> +}
> +
> +static const struct component_ops mtk_disp_aal_component_ops =3D {
> +       .bind   =3D mtk_disp_aal_bind,
> +       .unbind =3D mtk_disp_aal_unbind,
> +};
> +
> +static int mtk_disp_aal_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct mtk_disp_aal *priv;
> +       struct resource *res;
> +       int ret;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->clk =3D devm_clk_get(dev, NULL);
> +       if (IS_ERR(priv->clk)) {
> +               dev_err(dev, "failed to get aal clk\n");
> +               return PTR_ERR(priv->clk);
> +       }
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       priv->regs =3D devm_ioremap_resource(dev, res);
> +       if (IS_ERR(priv->regs)) {
> +               dev_err(dev, "failed to ioremap aal\n");
> +               return PTR_ERR(priv->regs);
> +       }
> +
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +       ret =3D cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
> +       if (ret)
> +               dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
> +#endif
> +
> +       priv->data =3D of_device_get_match_data(dev);
> +       platform_set_drvdata(pdev, priv);
> +
> +       ret =3D component_add(dev, &mtk_disp_aal_component_ops);
> +       if (ret)
> +               dev_err(dev, "Failed to add component: %d\n", ret);
> +
> +       return ret;
> +}
> +
> +static int mtk_disp_aal_remove(struct platform_device *pdev)
> +{
> +       component_del(&pdev->dev, &mtk_disp_aal_component_ops);
> +
> +       return 0;
> +}
> +
> +static const struct mtk_disp_aal_data mt8173_aal_driver_data =3D {
> +       .has_gamma =3D true,
> +};
> +
> +static const struct of_device_id mtk_disp_aal_driver_dt_match[] =3D {
> +       { .compatible =3D "mediatek,mt8173-disp-aal",
> +         .data =3D &mt8173_aal_driver_data},
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_disp_aal_driver_dt_match);
> +
> +struct platform_driver mtk_disp_aal_driver =3D {
> +       .probe          =3D mtk_disp_aal_probe,
> +       .remove         =3D mtk_disp_aal_remove,
> +       .driver         =3D {
> +               .name   =3D "mediatek-disp-aal",
> +               .owner  =3D THIS_MODULE,
> +               .of_match_table =3D mtk_disp_aal_driver_dt_match,
> +       },
> +};
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index cafd9df..86c3068 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -9,6 +9,15 @@
>  #include <linux/soc/mediatek/mtk-cmdq.h>
>  #include "mtk_drm_plane.h"
>
> +int mtk_aal_clk_enable(struct device *dev);
> +void mtk_aal_clk_disable(struct device *dev);
> +void mtk_aal_config(struct device *dev, unsigned int w,
> +                   unsigned int h, unsigned int vrefresh,
> +                   unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> +void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)=
;
> +void mtk_aal_start(struct device *dev);
> +void mtk_aal_stop(struct device *dev);
> +
>  void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)=
;
>  int mtk_ccorr_clk_enable(struct device *dev);
>  void mtk_ccorr_clk_disable(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 75bc00e..99cbf44 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -32,9 +32,6 @@
>
>  #define DISP_REG_UFO_START                     0x0000
>
> -#define DISP_AAL_EN                            0x0000
> -#define DISP_AAL_SIZE                          0x0030
> -
>  #define DISP_DITHER_EN                         0x0000
>  #define DITHER_EN                              BIT(0)
>  #define DISP_DITHER_CFG                                0x0020
> @@ -48,8 +45,6 @@
>
>  #define UFO_BYPASS                             BIT(2)
>
> -#define AAL_EN                                 BIT(0)
> -
>  #define DISP_DITHERING                         BIT(2)
>  #define DITHER_LSB_ERR_SHIFT_R(x)              (((x) & 0x7) << 28)
>  #define DITHER_OVFLW_BIT_R(x)                  (((x) & 0x7) << 24)
> @@ -190,36 +185,6 @@ static void mtk_ufoe_start(struct device *dev)
>         writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
>  }
>
> -static void mtk_aal_config(struct device *dev, unsigned int w,
> -                          unsigned int h, unsigned int vrefresh,
> -                          unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> -{
> -       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> -
> -       mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,=
 DISP_AAL_SIZE);
> -}
> -
> -static void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state =
*state)
> -{
> -       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> -
> -       mtk_gamma_set_common(priv->regs, state);
> -}
> -
> -static void mtk_aal_start(struct device *dev)
> -{
> -       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> -
> -       writel(AAL_EN, priv->regs + DISP_AAL_EN);
> -}
> -
> -static void mtk_aal_stop(struct device *dev)
> -{
> -       struct mtk_ddp_comp_dev *priv =3D dev_get_drvdata(dev);
> -
> -       writel_relaxed(0x0, priv->regs + DISP_AAL_EN);
> -}
> -
>  static void mtk_dither_config(struct device *dev, unsigned int w,
>                               unsigned int h, unsigned int vrefresh,
>                               unsigned int bpc, struct cmdq_pkt *cmdq_pkt=
)
> @@ -247,8 +212,8 @@ static void mtk_dither_stop(struct device *dev)
>  }
>
>  static const struct mtk_ddp_comp_funcs ddp_aal =3D {
> -       .clk_enable =3D mtk_ddp_clk_enable,
> -       .clk_disable =3D mtk_ddp_clk_disable,
> +       .clk_enable =3D mtk_aal_clk_enable,
> +       .clk_disable =3D mtk_aal_clk_disable,
>         .gamma_set =3D mtk_aal_gamma_set,
>         .config =3D mtk_aal_config,
>         .start =3D mtk_aal_start,
> @@ -505,7 +470,8 @@ int mtk_ddp_comp_init(struct device_node *node, struc=
t mtk_ddp_comp *comp,
>                         return ret;
>         }
>
> -       if (type =3D=3D MTK_DISP_BLS ||
> +       if (type =3D=3D MTK_DISP_AAL ||
> +           type =3D=3D MTK_DISP_BLS ||
>             type =3D=3D MTK_DISP_CCORR ||
>             type =3D=3D MTK_DISP_COLOR ||
>             type =3D=3D MTK_DISP_GAMMA ||
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index b46bdb8..67a585e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -532,11 +532,12 @@ static int mtk_drm_probe(struct platform_device *pd=
ev)
>                 private->comp_node[comp_id] =3D of_node_get(node);
>
>                 /*
> -                * Currently only the CCORR, COLOR, GAMMA, OVL, RDMA, DSI=
, and DPI
> +                * Currently only the AAL, CCORR, COLOR, GAMMA, OVL, RDMA=
, DSI, and DPI
>                  * blocks have separate component platform drivers and in=
itialize their own
>                  * DDP component structure. The others are initialized he=
re.
>                  */
> -               if (comp_type =3D=3D MTK_DISP_CCORR ||
> +               if (comp_type =3D=3D MTK_DISP_AAL ||
> +                   comp_type =3D=3D MTK_DISP_CCORR ||
>                     comp_type =3D=3D MTK_DISP_COLOR ||
>                     comp_type =3D=3D MTK_DISP_GAMMA ||
>                     comp_type =3D=3D MTK_DISP_OVL ||
> @@ -636,6 +637,7 @@ static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_=
suspend,
>  };
>
>  static struct platform_driver * const mtk_drm_drivers[] =3D {
> +       &mtk_disp_aal_driver,
>         &mtk_disp_ccorr_driver,
>         &mtk_disp_color_driver,
>         &mtk_disp_gamma_driver,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.h
> index 637f566..3e7d1e6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -46,6 +46,7 @@ struct mtk_drm_private {
>         struct drm_atomic_state *suspend_state;
>  };
>
> +extern struct platform_driver mtk_disp_aal_driver;
>  extern struct platform_driver mtk_disp_ccorr_driver;
>  extern struct platform_driver mtk_disp_color_driver;
>  extern struct platform_driver mtk_disp_gamma_driver;
> --
> 1.8.1.1.dirty
>
