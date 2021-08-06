Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026773E2EC1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 19:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCA36EBF6;
	Fri,  6 Aug 2021 17:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F4D6E106
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 17:11:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 205DA611CA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 17:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628269866;
 bh=O0771EaCX+PHMTW//1AJu28HmkvGdYXV01bhOOIy/w4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nQvGhbAE6S6AcXp3BPv3Ge5NltZrI1FAO5eO2ljqDrG3ZPb3OlmYikjvjqRTJKo9S
 OkmZ+JhYgB4/cToZUuU1Tt+cuus7pAojpKeQzz0aeQ74HhC4JE3DlXvheiDHF0u8Tj
 Q4D2mVT6CVEezbo8NSpJhEO3qTUz9Iccf7t4vIJPiT4SDFJnBQYvCPbju0226Hblld
 BnRw888UAe9SsJms1EZrNAXskT++DJPYeX615UQ1OqdJ6ih/qZr9gE2id9KHollVtC
 GjFiQJyES2HLuZp+rZ9NRQhuwJxXDClWz2yLCcb1oQWxCtfHUP71yMZw+ZTF2RYRLO
 1oHOGb2U9DTCg==
Received: by mail-ed1-f42.google.com with SMTP id k9so13984955edr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 10:11:06 -0700 (PDT)
X-Gm-Message-State: AOAM531wO1LiAQxiRRC2XOxI9JnQPeWuHF4zb1A7Ri14JpINozaCsDD3
 77QjnYXbsoyuKun9uiIu+sXbWtfq54c5PLLKIg==
X-Google-Smtp-Source: ABdhPJzomInfpBZk1wb/IQTQmTY+/0lUdakWl5r8bwQcgCOCa/htcMif5CLvk5KeYercX9vZ6jD3/3zxX2lZ4vXUxJk=
X-Received: by 2002:aa7:c6d3:: with SMTP id b19mr14378038eds.303.1628269864637; 
 Fri, 06 Aug 2021 10:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210805205226.24880-1-jason-jh.lin@mediatek.com>
 <20210805205226.24880-7-jason-jh.lin@mediatek.com>
In-Reply-To: <20210805205226.24880-7-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 7 Aug 2021 01:10:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9PRNyoegE2QewoKHCR3mfP9Szh3JMW4bL1WcRcC4Yk3A@mail.gmail.com>
Message-ID: <CAAOTY_9PRNyoegE2QewoKHCR3mfP9Szh3JMW4bL1WcRcC4Yk3A@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] drm/mediatek: add MERGE support for mediatek-drm
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, fshao@chromium.org, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com, 
 DTML <devicetree@vger.kernel.org>, 
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

jason-jh.lin <jason-jh.lin@mediatek.com> =E6=96=BC 2021=E5=B9=B48=E6=9C=886=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=884:52=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Add MERGE engine file:
> MERGE module is used to merge two slice-per-line inputs
> into one side-by-side output.
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> This patch is base on [1]
>
> [1] dt-bindings: mediatek: display: add mt8195 SoC binding
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210805171346.=
24249-5-jason-jh.lin@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/Makefile           |   1 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c   | 263 ++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
>  6 files changed, 277 insertions(+), 1 deletion(-)
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
> index 000000000000..f3d262792054
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -0,0 +1,263 @@
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
> +#define MERGE_EN                       1

One more indent for the bitwise value.

> +#define DISP_REG_MERGE_CFG_0           0x010
> +#define DISP_REG_MERGE_CFG_4           0x020
> +#define DISP_REG_MERGE_CFG_10          0x038
> +/* no swap */
> +#define SWAP_MODE                      0
> +#define FLD_SWAP_MODE                  GENMASK(4, 0)
> +#define DISP_REG_MERGE_CFG_12          0x040
> +#define CFG_10_10_1PI_2PO_BUF_MODE     6
> +#define CFG_10_10_2PI_2PO_BUF_MODE     8
> +#define FLD_CFG_MERGE_MODE             GENMASK(4, 0)
> +#define DISP_REG_MERGE_CFG_24          0x070
> +#define DISP_REG_MERGE_CFG_25          0x074
> +#define DISP_REG_MERGE_CFG_36          0x0a0
> +#define ULTRA_EN                       1
> +#define PREULTRA_EN                    1
> +#define HALT_FOR_DVFS_EN               0
> +#define FLD_ULTRA_EN                   GENMASK(0, 0)
> +#define FLD_PREULTRA_EN                        GENMASK(4, 4)
> +#define FLD_HALT_FOR_DVFS_EN           GENMASK(8, 8)
> +#define DISP_REG_MERGE_CFG_37          0x0a4
> +/* 0: Off, 1: SRAM0, 2: SRAM1, 3: SRAM0 + SRAM1 */
> +#define BUFFER_MODE                    3
> +#define FLD_BUFFER_MODE                        GENMASK(1, 0)
> +#define DISP_REG_MERGE_CFG_38          0x0a8
> +#define FLD_VDE_BLOCK_ULTRA            GENMASK(0, 0)
> +#define FLD_VALID_TH_BLOCK_ULTRA       GENMASK(4, 4)
> +#define FLD_ULTRA_FIFO_VALID_TH                GENMASK(31, 16)
> +#define DISP_REG_MERGE_CFG_39          0x0ac
> +#define FLD_NVDE_FORCE_PREULTRA                GENMASK(8, 8)
> +#define FLD_NVALID_TH_FORCE_PREULTRA   GENMASK(12, 12)
> +#define FLD_PREULTRA_FIFO_VALID_TH     GENMASK(31, 16)
> +#define DISP_REG_MERGE_CFG_40          0x0b0
> +/* 6 us, 600M pixel/sec */
> +#define ULTRA_TH_LOW                   (6 * 600)
> +/* 8 us, 600M pixel/sec */
> +#define ULTRA_TH_HIGH                  (8 * 600)
> +#define FLD_ULTRA_TH_LOW               GENMASK(15, 0)
> +#define FLD_ULTRA_TH_HIGH              GENMASK(31, 16)
> +#define DISP_REG_MERGE_CFG_41          0x0b4
> +/* 8 us, 600M pixel/sec */
> +#define PREULTRA_TH_LOW                        (8 * 600)
> +/* 9 us, 600M pixel/sec */

Add comment that "6 us ~ 9us is experience value and max mmsys clock
frequency is 594MHz", and I think you should use 594 instead of 600.

Regards,
Chun-Kuang.

> +#define PREULTRA_TH_HIGH               (9 * 600)
> +#define FLD_PREULTRA_TH_LOW            GENMASK(15, 0)
> +#define FLD_PREULTRA_TH_HIGH           GENMASK(31, 16)
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
> +       writel(MERGE_EN, priv->regs + DISP_REG_MERGE_CTRL);
> +}
> +
> +void mtk_merge_stop(struct device *dev)
> +{
> +       struct mtk_disp_merge *priv =3D dev_get_drvdata(dev);
> +
> +       writel(0x0, priv->regs + DISP_REG_MERGE_CTRL);
> +}
> +
> +static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
> +                                  struct cmdq_pkt *handle)
> +{
> +       mtk_ddp_write_mask(handle, ULTRA_EN | PREULTRA_EN << 4 | HALT_FOR=
_DVFS_EN << 8,
> +                          &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CF=
G_36,
> +                          FLD_ULTRA_EN | FLD_PREULTRA_EN | FLD_HALT_FOR_=
DVFS_EN);
> +
> +       mtk_ddp_write_mask(handle, BUFFER_MODE,
> +                          &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CF=
G_37,
> +                          FLD_BUFFER_MODE);
> +
> +       mtk_ddp_write_mask(handle, 0,
> +                          &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CF=
G_38,
> +                          FLD_VDE_BLOCK_ULTRA | FLD_VALID_TH_BLOCK_ULTRA=
 |
> +                          FLD_ULTRA_FIFO_VALID_TH);
> +
> +       mtk_ddp_write_mask(handle, 0,
> +                          &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CF=
G_39,
> +                          FLD_NVDE_FORCE_PREULTRA | FLD_NVALID_TH_FORCE_=
PREULTRA |
> +                          FLD_PREULTRA_FIFO_VALID_TH);
> +
> +       mtk_ddp_write_mask(handle, ULTRA_TH_LOW | ULTRA_TH_HIGH << 16,
> +                          &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CF=
G_40,
> +                          FLD_ULTRA_TH_LOW | FLD_ULTRA_TH_HIGH);
> +
> +       mtk_ddp_write_mask(handle, PREULTRA_TH_LOW | PREULTRA_TH_HIGH << =
16,
> +                          &priv->cmdq_reg, priv->regs, DISP_REG_MERGE_CF=
G_41,
> +                          FLD_PREULTRA_TH_LOW | FLD_PREULTRA_TH_HIGH);
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
> +               dev_err(dev, "%s: input width(%d) or height(%d) is invali=
d\n", __func__, w, h);
> +               return;
> +       }
> +
> +       if (priv->fifo_en) {
> +               mtk_merge_fifo_setting(priv, handle);
> +               mode =3D CFG_10_10_2PI_2PO_BUF_MODE;
> +       }
> +
> +       mtk_ddp_write(handle, h << 16 | w, &priv->cmdq_reg, priv->regs,
> +                     DISP_REG_MERGE_CFG_0);
> +       mtk_ddp_write(handle, h << 16 | w, &priv->cmdq_reg, priv->regs,
> +                     DISP_REG_MERGE_CFG_4);
> +       mtk_ddp_write(handle, h << 16 | w, &priv->cmdq_reg, priv->regs,
> +                     DISP_REG_MERGE_CFG_24);
> +       mtk_ddp_write(handle, h << 16 | w, &priv->cmdq_reg, priv->regs,
> +                     DISP_REG_MERGE_CFG_25);
> +       mtk_ddp_write_mask(handle, SWAP_MODE, &priv->cmdq_reg, priv->regs=
,
> +                          DISP_REG_MERGE_CFG_10, FLD_SWAP_MODE);
> +       mtk_ddp_write_mask(handle, mode, &priv->cmdq_reg, priv->regs,
> +                          DISP_REG_MERGE_CFG_12, FLD_CFG_MERGE_MODE);
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
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.h
> index 560be6bc9d0e..b42a47c06956 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -25,6 +25,7 @@ enum mtk_ddp_comp_type {
>         MTK_DISP_DITHER,
>         MTK_DISP_DSC,
>         MTK_DISP_GAMMA,
> +       MTK_DISP_MERGE,
>         MTK_DISP_MUTEX,
>         MTK_DISP_OD,
>         MTK_DISP_OVL,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index a95dc1006b82..5eb9c0a04447 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -532,13 +532,14 @@ static int mtk_drm_probe(struct platform_device *pd=
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
> @@ -639,6 +640,7 @@ static struct platform_driver * const mtk_drm_drivers=
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
