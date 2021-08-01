Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310FC3DC922
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 02:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4B16E91C;
	Sun,  1 Aug 2021 00:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987C26E91C
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 00:33:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0709961077
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 00:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627778001;
 bh=HAMj0AIWmUOkeEDVrnthWW3j3q0H3tRboPItjfmDBPM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pY+I+kxLLOl3Gc+WmMXkT2MvKe/8tHITlIfjSgJZqRJQUmhMCZ6+JzwrfYqX2lG8g
 5RgXGdwQDiLphti7+A31Zn8901jhfd1gBgo/y3d2DnedbPb5CLnUnsSJu4zJ9uDvZz
 c52A2A2Vj8PPhqzbvb3vD1ejt7HOeMSY/jIkQ1f4bRbdD1uQoVT6PDRR+H3GoiHWDf
 CevcZh0YvbttcYH8hIBy/BnFR6qEVLC3uAdk9qpCIXZ9GdqyjaCqmMYHodnsMTB5Z5
 X19srhZqDTAjcloJnTDoci4q3Mk8jDiCX50iGhXFDmmd/W3JmKeAAtMNtawxM74sLS
 XXG19VRBDl0gw==
Received: by mail-ed1-f47.google.com with SMTP id d6so11553162edt.7
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 17:33:20 -0700 (PDT)
X-Gm-Message-State: AOAM533jKdgZ2ZU5488K3THvbKYhMAihG53c9wkh5ox0uq13ahabGoyc
 hb+QadpFgq7/YEJMQfPYn+eveGx+UcOPiU36Dw==
X-Google-Smtp-Source: ABdhPJyLzHxW3dyXT9VQ8ynZquqQ7TC8WD03OYSUWAKzR5Bif8j1C50/7MQ5yhWvTfRq2RmgnqW4S5WUk77JabG/z0o=
X-Received: by 2002:a05:6402:648:: with SMTP id
 u8mr4928726edx.162.1627777999353; 
 Sat, 31 Jul 2021 17:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210729170737.21424-1-jason-jh.lin@mediatek.com>
 <20210729170737.21424-7-jason-jh.lin@mediatek.com>
In-Reply-To: <20210729170737.21424-7-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 1 Aug 2021 08:33:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9QqpLU+aPki1-RPy-CZB766nWnNEAagVpc=Dp7gfqdQw@mail.gmail.com>
Message-ID: <CAAOTY_9QqpLU+aPki1-RPy-CZB766nWnNEAagVpc=Dp7gfqdQw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/mediatek: add MERGE support for mt8195
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, fshao@chromium.org, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 singo.chang@mediatek.com, DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>
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

Hi, Jason:

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=883=
0=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=881:07=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Add MERGE module file:
>
> MERGE module is used to merge two slice-per-line inputs
> into one side-by-side output.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> This patch is base on [1]
>
> [1]add mt8195 SoC DRM binding
> - https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D5195=
97
> ---
>  drivers/gpu/drm/mediatek/Makefile           |   1 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 277 ++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  16 ++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   6 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>  7 files changed, 309 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
>
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek=
/Makefile
> index dc54a7a69005..538e0087a44c 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -3,6 +3,7 @@
>  mediatek-drm-y :=3D mtk_disp_ccorr.o \
>                   mtk_disp_color.o \
>                   mtk_disp_gamma.o \
> +                 mtk_disp_merge.o \
>                   mtk_disp_ovl.o \
>                   mtk_disp_rdma.o \
>                   mtk_drm_crtc.o \
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/me=
diatek/mtk_disp_drv.h
> index cafd9df2d63b..f407cd9d873e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -46,6 +46,14 @@ void mtk_gamma_set_common(void __iomem *regs, struct d=
rm_crtc_state *state);
>  void mtk_gamma_start(struct device *dev);
>  void mtk_gamma_stop(struct device *dev);
>
> +int mtk_merge_clk_enable(struct device *dev);
> +void mtk_merge_clk_disable(struct device *dev);
> +void mtk_merge_config(struct device *dev, unsigned int width,
> +                     unsigned int height, unsigned int vrefresh,
> +                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> +void mtk_merge_start(struct device *dev);
> +void mtk_merge_stop(struct device *dev);
> +
>  void mtk_ovl_bgclr_in_on(struct device *dev);
>  void mtk_ovl_bgclr_in_off(struct device *dev);
>  void mtk_ovl_bypass_shadow(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/=
mediatek/mtk_disp_merge.c
> new file mode 100644
> index 000000000000..594d76ccd205
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#include "mtk_drm_ddp_comp.h"
> +#include "mtk_drm_drv.h"
> +#include "mtk_disp_drv.h"
> +
> +#define DISP_REG_MERGE_CTRL            0x000
> +#define FLD_MERGE_EN BIT(0)
> +#define FLD_MERGE_RST BIT(4)
> +#define FLD_MERGE_LR_SWAP BIT(8)
> +#define FLD_MERGE_DCM_DIS BIT(12)
> +
> +#define DISP_MERGE_CFG_0               0x010
> +#define DISP_MERGE_CFG_4               0x020
> +#define DISP_MERGE_CFG_10              0x038
> +#define DISP_MERGE_CFG_12              0x040
> +#define CFG_10_10_1PI_2PO_BUF_MODE     6
> +#define CFG_10_10_2PI_2PO_BUF_MODE     8
> +#define DISP_MERGE_CFG_24              0x070
> +#define DISP_MERGE_CFG_25              0x074
> +
> +#define DISP_MERGE_CFG_36              0x0a0
> +#define DISP_MERGE_CFG_36_FLD_ULTRA_EN GENMASK(0, 0)
> +#define DISP_MERGE_CFG_36_FLD_PREULTRA_EN GENMASK(4, 4)
> +#define DISP_MERGE_CFG_36_FLD_HALT_FOR_DVFS_EN GENMASK(8, 8)
> +#define DISP_MERGE_CFG_37              0x0a4
> +#define DISP_MERGE_CFG_37_FLD_BUFFER_MODE GENMASK(1, 0)
> +#define DISP_MERGE_CFG_38              0x0a8
> +#define DISP_MERGE_CFG_38_FLD_VDE_BLOCK_ULTRA GENMASK(0, 0)
> +#define DISP_MERGE_CFG_38_FLD_VALID_TH_BLOCK_ULTRA GENMASK(4, 4)
> +#define DISP_MERGE_CFG_38_FLD_ULTRA_FIFO_VALID_TH GENMASK(31, 16)
> +#define DISP_MERGE_CFG_39              0x0ac
> +#define DISP_MERGE_CFG_39_FLD_NVDE_FORCE_PREULTRA GENMASK(8, 8)
> +#define DISP_MERGE_CFG_39_FLD_NVALID_TH_FORCE_PREULTRA GENMASK(12, 12)
> +#define DISP_MERGE_CFG_39_FLD_PREULTRA_FIFO_VALID_TH GENMASK(31, 16)
> +#define DISP_MERGE_CFG_40              0x0b0
> +#define DISP_MERGE_CFG_40_FLD_ULTRA_TH_LOW GENMASK(15, 0)
> +#define DISP_MERGE_CFG_40_FLD_ULTRA_TH_HIGH GENMASK(31, 16)
> +#define DISP_MERGE_CFG_41              0x0b4
> +#define DISP_MERGE_CFG_41_FLD_PREULTRA_TH_LOW GENMASK(15, 0)
> +#define DISP_MERGE_CFG_41_FLD_PREULTRA_TH_HIGH GENMASK(31, 16)
> +
> +struct mtk_disp_merge {
> +       void __iomem *regs;
> +       struct clk *clk;
> +       struct clk *async_clk;
> +       struct cmdq_client_reg          cmdq_reg;
> +       bool                            fifo_en;
> +};
> +
> +void mtk_merge_start(struct device *dev)
> +{
> +       struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
> +
> +       mtk_ddp_write(NULL, 0x1, &priv->cmdq_reg, priv->regs, DISP_REG_ME=
RGE_CTRL);

writel.

> +}
> +
> +void mtk_merge_stop(struct device *dev)
> +{
> +       struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
> +
> +       mtk_ddp_write(NULL, 0x0, &priv->cmdq_reg, priv->regs, DISP_REG_ME=
RGE_CTRL);

Ditto.

> +}
> +
> +static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
> +                                  struct cmdq_pkt *handle)
> +{
> +       unsigned int ultra_en =3D 1;
> +       unsigned int preultra_en =3D 1;
> +       unsigned int halt_for_dvfs_en =3D 0;

All these are constant, so use #define instead of variable.

> +       /*
> +        * 0 : Off
> +        * 1 : SRAM 0
> +        * 2 : SRAM 1
> +        * 3 : SRAM 0 + SRAM 1
> +        */
> +       unsigned int buffer_mode =3D 3;

Ditto.

> +       /* 6 us, 600M pixel/sec */
> +       unsigned int ultra_th_low =3D 6 * 600;
> +       /* 8 us, 600M pixel/sec */
> +       unsigned int ultra_th_high =3D 8 * 600;
> +       /* 8 us, 600M pixel/sec */
> +       unsigned int preultra_th_low =3D 8 * 600;
> +       /* 9 us, 600M pixel/sec */
> +       unsigned int preultra_th_high =3D 9 * 600;

Why 6us ~ 9us?. Why 600M pixel/sec?

> +
> +       mtk_ddp_write_mask(handle, ultra_en << 0 | preultra_en << 4 | hal=
t_for_dvfs_en << 8,

Remove '<< 0'

> +                          &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_36=
,
> +                          DISP_MERGE_CFG_36_FLD_ULTRA_EN | DISP_MERGE_CF=
G_36_FLD_PREULTRA_EN |
> +                          DISP_MERGE_CFG_36_FLD_HALT_FOR_DVFS_EN);
> +
> +       mtk_ddp_write_mask(handle, buffer_mode << 0,
> +                          &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_37=
,
> +                          DISP_MERGE_CFG_37_FLD_BUFFER_MODE);
> +
> +       mtk_ddp_write_mask(handle, 0,
> +                          &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_38=
,
> +                          DISP_MERGE_CFG_38_FLD_VDE_BLOCK_ULTRA |
> +                          DISP_MERGE_CFG_38_FLD_VALID_TH_BLOCK_ULTRA |
> +                          DISP_MERGE_CFG_38_FLD_ULTRA_FIFO_VALID_TH);
> +
> +       mtk_ddp_write_mask(handle, 0,
> +                          &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_39=
,
> +                          DISP_MERGE_CFG_39_FLD_NVDE_FORCE_PREULTRA |
> +                          DISP_MERGE_CFG_39_FLD_NVALID_TH_FORCE_PREULTRA=
 |
> +                          DISP_MERGE_CFG_39_FLD_PREULTRA_FIFO_VALID_TH);
> +
> +       mtk_ddp_write_mask(handle, ultra_th_low << 0 | ultra_th_high << 1=
6,
> +                          &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_40=
,
> +                          DISP_MERGE_CFG_40_FLD_ULTRA_TH_LOW |
> +                          DISP_MERGE_CFG_40_FLD_ULTRA_TH_HIGH);
> +
> +       mtk_ddp_write_mask(handle, preultra_th_low << 0 | preultra_th_hig=
h << 16,
> +                          &priv->cmdq_reg, priv->regs, DISP_MERGE_CFG_41=
,
> +                          DISP_MERGE_CFG_41_FLD_PREULTRA_TH_LOW |
> +                          DISP_MERGE_CFG_41_FLD_PREULTRA_TH_HIGH);
> +}
> +
> +void mtk_merge_config(struct device *dev, unsigned int w,
> +                     unsigned int h, unsigned int vrefresh,
> +                     unsigned int bpc, struct cmdq_pkt *handle)
> +{
> +       struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
> +       unsigned int mode =3D CFG_10_10_1PI_2PO_BUF_MODE;
> +
> +       if (!h || !w) {
> +               pr_err("%s: input width(%d) or height(%d) is invalid\n",

dev_err.

> +                      __func__, w, h);

one line.

> +               return;
> +       }
> +
> +       if (priv->fifo_en) {
> +               mtk_merge_fifo_setting(priv, handle);
> +               mode =3D CFG_10_10_2PI_2PO_BUF_MODE;
> +       }
> +
> +       mtk_ddp_write(handle, (h << 16 | w), &priv->cmdq_reg, priv->regs,

Remove parentheses of (h << 16 | w).

> +                     DISP_MERGE_CFG_0);
> +       mtk_ddp_write(handle, (h << 16 | w), &priv->cmdq_reg, priv->regs,
> +                     DISP_MERGE_CFG_4);
> +       mtk_ddp_write(handle, (h << 16 | w), &priv->cmdq_reg, priv->regs,
> +                     DISP_MERGE_CFG_24);
> +       mtk_ddp_write(handle, (h << 16 | w), &priv->cmdq_reg, priv->regs,
> +                     DISP_MERGE_CFG_25);
> +       /* no swap */
> +       mtk_ddp_write_mask(handle, 0, &priv->cmdq_reg, priv->regs,
> +                          DISP_MERGE_CFG_10, 0x1f);

Symbolize 0x1f.

> +       mtk_ddp_write_mask(handle, mode, &priv->cmdq_reg, priv->regs,
> +                          DISP_MERGE_CFG_12, 0x1f);

Ditto.

> +}
> +
> +int mtk_merge_clk_enable(struct device *dev)
> +{
> +       int ret =3D 0;
> +       struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
> +
> +       ret =3D clk_prepare_enable(priv->clk);
> +       if (ret)
> +               pr_err("merge clk prepare enable failed\n");
> +
> +       if (priv->async_clk) {
> +               ret =3D clk_prepare_enable(priv->async_clk);
> +               if (ret)
> +                       pr_err("async clk prepare enable failed\n");
> +       }
> +
> +       return ret;
> +}
> +
> +void mtk_merge_clk_disable(struct device *dev)
> +{
> +       struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
> +
> +       if (priv->async_clk)
> +               clk_disable_unprepare(priv->async_clk);
> +
> +       clk_disable_unprepare(priv->clk);
> +}
> +
> +static int mtk_disp_merge_bind(struct device *dev, struct device *master=
,
> +                              void *data)
> +{
> +       return 0;
> +}
> +
> +static void mtk_disp_merge_unbind(struct device *dev, struct device *mas=
ter,
> +                                 void *data)
> +{
> +}
> +
> +static const struct component_ops mtk_disp_merge_component_ops =3D {
> +       .bind   =3D mtk_disp_merge_bind,
> +       .unbind =3D mtk_disp_merge_unbind,
> +};
> +
> +static int mtk_disp_merge_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct resource *res;
> +       struct mtk_disp_merge *priv;
> +       int ret;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       priv->regs =3D devm_ioremap_resource(dev, res);
> +       if (IS_ERR(priv->regs)) {
> +               dev_err(dev, "failed to ioremap merge\n");
> +               return PTR_ERR(priv->regs);
> +       }
> +
> +       priv->clk =3D devm_clk_get(dev, NULL);
> +       if (IS_ERR(priv->clk)) {
> +               dev_err(dev, "failed to get merge clk\n");
> +               return PTR_ERR(priv->clk);
> +       }
> +
> +       priv->async_clk =3D of_clk_get(dev->of_node, 1);
> +       if (IS_ERR(priv->async_clk)) {
> +               ret =3D PTR_ERR(priv->async_clk);
> +               dev_dbg(dev, "No merge async clock: %d\n", ret);
> +               priv->async_clk =3D NULL;
> +       }
> +
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +       ret =3D cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
> +       if (ret)
> +               dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
> +#endif
> +
> +       priv->fifo_en =3D of_property_read_bool(dev->of_node,
> +                                             "mediatek,merge-fifo-en");
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       ret =3D component_add(dev, &mtk_disp_merge_component_ops);
> +       if (ret !=3D 0)
> +               dev_err(dev, "Failed to add component: %d\n", ret);
> +
> +       return ret;
> +}
> +
> +static int mtk_disp_merge_remove(struct platform_device *pdev)
> +{
> +       component_del(&pdev->dev, &mtk_disp_merge_component_ops);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id mtk_disp_merge_driver_dt_match[] =3D {
> +       { .compatible =3D "mediatek,mt8195-disp-merge", },
> +       {},
> +};
> +
> +MODULE_DEVICE_TABLE(of, mtk_disp_merge_driver_dt_match);
> +
> +struct platform_driver mtk_disp_merge_driver =3D {
> +       .probe =3D mtk_disp_merge_probe,
> +       .remove =3D mtk_disp_merge_remove,
> +       .driver =3D {
> +               .name =3D "mediatek-disp-merge",
> +               .owner =3D THIS_MODULE,
> +               .of_match_table =3D mtk_disp_merge_driver_dt_match,
> +       },
> +};
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index 6f4a9b8c9914..a037b564052e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -376,6 +376,14 @@ static const struct mtk_ddp_comp_funcs ddp_rdma =3D =
{
>         .layer_config =3D mtk_rdma_layer_config,
>  };
>
> +static const struct mtk_ddp_comp_funcs ddp_merge =3D {
> +       .clk_enable =3D mtk_merge_clk_enable,
> +       .clk_disable =3D mtk_merge_clk_disable,
> +       .start =3D mtk_merge_start,
> +       .stop =3D mtk_merge_stop,
> +       .config =3D mtk_merge_config,
> +};
> +
>  static const struct mtk_ddp_comp_funcs ddp_ufoe =3D {
>         .clk_enable =3D mtk_ddp_clk_enable,
>         .clk_disable =3D mtk_ddp_clk_disable,
> @@ -400,6 +408,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_C=
OMP_TYPE_MAX] =3D {
>         [MTK_DISP_OD] =3D "od",
>         [MTK_DISP_BLS] =3D "bls",
>         [MTK_DISP_DSC] =3D "dsc",
> +       [MTK_DISP_MERGE] =3D "merge",
>  };
>
>  struct mtk_ddp_comp_match {
> @@ -425,6 +434,12 @@ static const struct mtk_ddp_comp_match mtk_ddp_match=
es[DDP_COMPONENT_ID_MAX] =3D {
>         [DDP_COMPONENT_DSI2]    =3D { MTK_DSI,            2, &ddp_dsi },
>         [DDP_COMPONENT_DSI3]    =3D { MTK_DSI,            3, &ddp_dsi },
>         [DDP_COMPONENT_GAMMA]   =3D { MTK_DISP_GAMMA,     0, &ddp_gamma }=
,
> +       [DDP_COMPONENT_MERGE0]  =3D { MTK_DISP_MERGE,     0, &ddp_merge }=
,
> +       [DDP_COMPONENT_MERGE1]  =3D { MTK_DISP_MERGE,     1, &ddp_merge }=
,
> +       [DDP_COMPONENT_MERGE2]  =3D { MTK_DISP_MERGE,     2, &ddp_merge }=
,
> +       [DDP_COMPONENT_MERGE3]  =3D { MTK_DISP_MERGE,     3, &ddp_merge }=
,
> +       [DDP_COMPONENT_MERGE4]  =3D { MTK_DISP_MERGE,     4, &ddp_merge }=
,
> +       [DDP_COMPONENT_MERGE5]  =3D { MTK_DISP_MERGE,     5, &ddp_merge }=
,
>         [DDP_COMPONENT_OD0]     =3D { MTK_DISP_OD,        0, &ddp_od },
>         [DDP_COMPONENT_OD1]     =3D { MTK_DISP_OD,        1, &ddp_od },
>         [DDP_COMPONENT_OVL0]    =3D { MTK_DISP_OVL,       0, &ddp_ovl },
> @@ -557,6 +572,7 @@ int mtk_ddp_comp_init(struct device_node *node, struc=
t mtk_ddp_comp *comp,
>             type =3D=3D MTK_DISP_GAMMA ||
>             type =3D=3D MTK_DPI ||
>             type =3D=3D MTK_DSI ||
> +           type =3D=3D MTK_DISP_MERGE ||
>             type =3D=3D MTK_DISP_OVL ||
>             type =3D=3D MTK_DISP_OVL_2L ||
>             type =3D=3D MTK_DISP_PWM ||
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.h
> index 661fb620e266..0afd78c0bc92 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -35,6 +35,7 @@ enum mtk_ddp_comp_type {
>         MTK_DISP_OD,
>         MTK_DISP_BLS,
>         MTK_DISP_DSC,
> +       MTK_DISP_MERGE,
>         MTK_DDP_COMP_TYPE_MAX,
>  };
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 0f6bb4bdc58a..53e0de3f17d7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -448,6 +448,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
] =3D {
>           .data =3D (void *)MTK_DISP_DITHER },
>         { .compatible =3D "mediatek,mt8195-disp-dsc",
>           .data =3D (void *)MTK_DISP_DSC },
> +       { .compatible =3D "mediatek,mt8195-disp-merge",
> +         .data =3D (void *)MTK_DISP_MERGE },

Move this patch before the patch "add mediatek-drm of vdosys0 support
for mt8195" and move this part into that patch.

Regards,
Chun-Kuang.

>         { .compatible =3D "mediatek,mt8173-disp-ufoe",
>           .data =3D (void *)MTK_DISP_UFOE },
>         { .compatible =3D "mediatek,mt2701-dsi",
> @@ -558,13 +560,14 @@ static int mtk_drm_probe(struct platform_device *pd=
ev)
>                 private->comp_node[comp_id] =3D of_node_get(node);
>
>                 /*
> -                * Currently only the CCORR, COLOR, GAMMA, OVL, RDMA, DSI=
, and DPI
> +                * Currently only the CCORR, COLOR, GAMMA, MERGE, OVL, RD=
MA, DSI, and DPI
>                  * blocks have separate component platform drivers and in=
itialize their own
>                  * DDP component structure. The others are initialized he=
re.
>                  */
>                 if (comp_type =3D=3D MTK_DISP_CCORR ||
>                     comp_type =3D=3D MTK_DISP_COLOR ||
>                     comp_type =3D=3D MTK_DISP_GAMMA ||
> +                   comp_type =3D=3D MTK_DISP_MERGE ||
>                     comp_type =3D=3D MTK_DISP_OVL ||
>                     comp_type =3D=3D MTK_DISP_OVL_2L ||
>                     comp_type =3D=3D MTK_DISP_RDMA ||
> @@ -665,6 +668,7 @@ static struct platform_driver * const mtk_drm_drivers=
[] =3D {
>         &mtk_disp_ccorr_driver,
>         &mtk_disp_color_driver,
>         &mtk_disp_gamma_driver,
> +       &mtk_disp_merge_driver,
>         &mtk_disp_ovl_driver,
>         &mtk_disp_rdma_driver,
>         &mtk_dpi_driver,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.h
> index 637f5669e895..0fa417219a69 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -49,6 +49,7 @@ struct mtk_drm_private {
>  extern struct platform_driver mtk_disp_ccorr_driver;
>  extern struct platform_driver mtk_disp_color_driver;
>  extern struct platform_driver mtk_disp_gamma_driver;
> +extern struct platform_driver mtk_disp_merge_driver;
>  extern struct platform_driver mtk_disp_ovl_driver;
>  extern struct platform_driver mtk_disp_rdma_driver;
>  extern struct platform_driver mtk_dpi_driver;
> --
> 2.18.0
>
