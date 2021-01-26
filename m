Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B1130381D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981216E44C;
	Tue, 26 Jan 2021 08:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E764189D79
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 07:41:55 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id 16so1331242ioz.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 23:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yTEzEls579DZ3BH7hVcyPhp2fOCUcEmP44D/dLy0dWM=;
 b=lhkvH0huBJvc9H+HHJT5oD2JJfLRkNYrzMGtQpHmHbrcyuVVO75mflEeMeVGM5SLeV
 Nvz2LpNpnG4NLXQS3PzviLTmcoJ28ZzcjvSuunpWVNA8XdJ5QA/GD6hAbJMtxdnbxWmo
 TblN5TW94Rysnh9stZJyH71Ylpu5BK5dkAgLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yTEzEls579DZ3BH7hVcyPhp2fOCUcEmP44D/dLy0dWM=;
 b=a5AclQqaWa2QE9C6rJqBJ+brYLsbapvNB3b5qnktxloqFeiKEnmXBlIwAXBEZvK3dR
 j8pfG14f99DDs/2Zbfrd6vYQScx4nCeg72N8443hxwTdxvrfOM+pSG0lmy7JqqpspSIN
 9yWY4dA/vPKZJy4d+tCqIVFGDJtWQP5Vywce0vnvT9mraoPrC8LVOMS6XZScVlElMkVb
 Gdj6ShEUmXgXjgH9pjNWdJS3XEG18jcgh/rW3EUmlvZ6PCgUsQkZUXJexiyS1rnpgk/T
 9kJQ1nrrKzIzn0S43RyLxr0PxZKJlDwfaBPIgJnR5pQNHLMoDcX0Z91A5Du4e+wN/OLZ
 Vg8w==
X-Gm-Message-State: AOAM531496IfMXv77+kLhprS/UE2RSsMqQQu1QGvW49RfonTH1950Zq3
 3j/Ringct0LZA9W8lQ56ZPVzEq/hxSCbpG8lokQ6/A==
X-Google-Smtp-Source: ABdhPJwlpBCKAL7fXLH9DDApVCKASF37ZecJUvGno+yw0iUERuo8IehQdIP5bitm9orrlTzk/WX0NRpPQ8lzpIqZxIQ=
X-Received: by 2002:a05:6638:b12:: with SMTP id
 a18mr3834357jab.114.1611646915306; 
 Mon, 25 Jan 2021 23:41:55 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-6-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-6-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 26 Jan 2021 15:41:29 +0800
Message-ID: <CAJMQK-g_+7h0vo7758aoY6304pqULJpHgSWE3HhvF8FWjkze_w@mail.gmail.com>
Subject: Re: [PATCH v3, 05/15] drm/mediatek: add component POSTMASK
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 11, 2021 at 3:44 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> This patch add component POSTMASK,
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile            |   1 +
>  drivers/gpu/drm/mediatek/mtk_disp_postmask.c | 160 +++++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c  |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h  |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c       |   4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h       |   1 +
>  6 files changed, 168 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_postmask.c
>
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index 17a08e2..ce5ad59 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -3,6 +3,7 @@
>  mediatek-drm-y := mtk_disp_color.o \
>                   mtk_disp_gamma.o \
>                   mtk_disp_ovl.o \
> +                 mtk_disp_postmask.o \
>                   mtk_disp_rdma.o \
>                   mtk_drm_crtc.o \
>                   mtk_drm_ddp.o \
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_postmask.c b/drivers/gpu/drm/mediatek/mtk_disp_postmask.c
> new file mode 100644
> index 0000000..736224c
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_postmask.c
> @@ -0,0 +1,160 @@
> +/*
> + * SPDX-License-Identifier:
> + *
> + * Copyright (c) 2020 MediaTek Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
> +
> +#include "mtk_drm_crtc.h"
> +#include "mtk_drm_ddp_comp.h"
> +
> +#define DISP_POSTMASK_EN                       0x0000
> +#define POSTMASK_EN                                    BIT(0)
> +#define DISP_POSTMASK_CFG                      0x0020
> +#define POSTMASK_RELAY_MODE                            BIT(0)
> +#define DISP_POSTMASK_SIZE                     0x0030
> +
> +struct mtk_disp_postmask_data {
> +       u32 reserved;
> +};
> +

Will there be more data and config for different soc in the future? If
not, it can be put in mtk_drm_ddp_comp.c and use struct
mtk_ddp_comp_dev, like ddp_dither or ddp_aal.


> +/**
> + * struct mtk_disp_postmask - DISP_postmask driver structure
> + * @ddp_comp - structure containing type enum and hardware resources
> + * @crtc - associated crtc to report irq events to
> + */
> +struct mtk_disp_postmask {
> +       struct mtk_ddp_comp                     ddp_comp;
> +       const struct mtk_disp_postmask_data     *data;
> +};
> +
> +static inline struct mtk_disp_postmask *comp_to_postmask(struct mtk_ddp_comp *comp)
> +{
> +       return container_of(comp, struct mtk_disp_postmask, ddp_comp);
> +}
> +
> +static void mtk_postmask_config(struct mtk_ddp_comp *comp, unsigned int w,
> +                             unsigned int h, unsigned int vrefresh,
> +                             unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +       mtk_ddp_write(cmdq_pkt, w << 16 | h, comp, DISP_POSTMASK_SIZE);
> +       mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, comp, DISP_POSTMASK_CFG);
> +}
> +
> +static void mtk_postmask_start(struct mtk_ddp_comp *comp)
> +{
> +       writel(POSTMASK_EN, comp->regs + DISP_POSTMASK_EN);
> +}
> +
> +static void mtk_postmask_stop(struct mtk_ddp_comp *comp)
> +{
> +       writel_relaxed(0x0, comp->regs + DISP_POSTMASK_EN);
> +}
> +
> +static const struct mtk_ddp_comp_funcs mtk_disp_postmask_funcs = {
> +       .config = mtk_postmask_config,
> +       .start = mtk_postmask_start,
> +       .stop = mtk_postmask_stop,
> +};
> +
> +static int mtk_disp_postmask_bind(struct device *dev, struct device *master, void *data)
> +{
> +       struct mtk_disp_postmask *priv = dev_get_drvdata(dev);
> +       struct drm_device *drm_dev = data;
> +       int ret;
> +
> +       ret = mtk_ddp_comp_register(drm_dev, &priv->ddp_comp);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to register component %pOF: %d\n",
> +                       dev->of_node, ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static void mtk_disp_postmask_unbind(struct device *dev, struct device *master,
> +                                 void *data)
> +{
> +       struct mtk_disp_postmask *priv = dev_get_drvdata(dev);
> +       struct drm_device *drm_dev = data;
> +
> +       mtk_ddp_comp_unregister(drm_dev, &priv->ddp_comp);
> +}
> +
> +static const struct component_ops mtk_disp_postmask_component_ops = {
> +       .bind   = mtk_disp_postmask_bind,
> +       .unbind = mtk_disp_postmask_unbind,
> +};
> +
> +static int mtk_disp_postmask_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct mtk_disp_postmask *priv;
> +       int comp_id;
> +       int ret;
> +
> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_POSTMASK);
> +       if (comp_id < 0) {
> +               dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
> +               return comp_id;
> +       }
> +
> +       ret = mtk_ddp_comp_init(dev, dev->of_node, &priv->ddp_comp, comp_id,
> +                               &mtk_disp_postmask_funcs);
> +       if (ret) {
> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(dev, "Failed to initialize component: %d\n",
> +                               ret);
> +
> +               return ret;
> +       }
> +
> +       priv->data = of_device_get_match_data(dev);
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       pm_runtime_enable(dev);
> +
> +       ret = component_add(dev, &mtk_disp_postmask_component_ops);
> +       if (ret)
> +               dev_err(dev, "Failed to add component: %d\n", ret);
> +
> +       return ret;
> +}
> +
> +static int mtk_disp_postmask_remove(struct platform_device *pdev)
> +{
> +       pm_runtime_disable(&pdev->dev);
> +
> +       component_del(&pdev->dev, &mtk_disp_postmask_component_ops);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id mtk_disp_postmask_driver_dt_match[] = {
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_disp_postmask_driver_dt_match);
> +
> +struct platform_driver mtk_disp_postmask_driver = {
> +       .probe          = mtk_disp_postmask_probe,
> +       .remove         = mtk_disp_postmask_remove,
> +       .driver         = {
> +               .name   = "mediatek-disp-postmask",
> +               .owner  = THIS_MODULE,
> +               .of_match_table = mtk_disp_postmask_driver_dt_match,
> +       },
> +};
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index a715127..bc6b10a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -354,6 +354,7 @@ static void mtk_dither_stop(struct mtk_ddp_comp *comp)
>         [MTK_DISP_MUTEX] = "mutex",
>         [MTK_DISP_OD] = "od",
>         [MTK_DISP_BLS] = "bls",
> +       [MTK_DISP_POSTMASK] = "postmask",
>  };
>
>  struct mtk_ddp_comp_match {
> @@ -384,6 +385,7 @@ struct mtk_ddp_comp_match {
>         [DDP_COMPONENT_OVL_2L0] = { MTK_DISP_OVL_2L,    0, NULL },
>         [DDP_COMPONENT_OVL_2L1] = { MTK_DISP_OVL_2L,    1, NULL },
>         [DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, NULL },
> +       [DDP_COMPONENT_POSTMASK0]       = { MTK_DISP_POSTMASK,  0, NULL },
>         [DDP_COMPONENT_PWM0]    = { MTK_DISP_PWM,       0, NULL },
>         [DDP_COMPONENT_PWM1]    = { MTK_DISP_PWM,       1, NULL },
>         [DDP_COMPONENT_PWM2]    = { MTK_DISP_PWM,       2, NULL },
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 178fae9..0b23b5c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -29,6 +29,7 @@ enum mtk_ddp_comp_type {
>         MTK_DISP_UFOE,
>         MTK_DSI,
>         MTK_DPI,
> +       MTK_DISP_POSTMASK,
>         MTK_DISP_PWM,
>         MTK_DISP_MUTEX,
>         MTK_DISP_OD,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index b6e963e..bc205e9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -533,7 +533,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
>                 private->comp_node[comp_id] = of_node_get(node);
>
>                 /*
> -                * Currently only the COLOR, GAMMA, OVL, RDMA, DSI, and DPI blocks have
> +                * Currently only the COLOR, GAMMA, OVL, POSTMASK, RDMA, DSI, and DPI blocks have
>                  * separate component platform drivers and initialize their own
>                  * DDP component structure. The others are initialized here.
>                  */
> @@ -541,6 +541,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
>                     comp_type == MTK_DISP_GAMMA ||
>                     comp_type == MTK_DISP_OVL ||
>                     comp_type == MTK_DISP_OVL_2L ||
> +                   comp_type == MTK_DISP_POSTMASK ||
>                     comp_type == MTK_DISP_RDMA ||
>                     comp_type == MTK_DSI ||
>                     comp_type == MTK_DPI) {
> @@ -654,6 +655,7 @@ static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
>         &mtk_disp_color_driver,
>         &mtk_disp_gamma_driver,
>         &mtk_disp_ovl_driver,
> +       &mtk_disp_postmask_driver,
>         &mtk_disp_rdma_driver,
>         &mtk_dpi_driver,
>         &mtk_drm_platform_driver,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index bbd362b..8a9544b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -50,6 +50,7 @@ struct mtk_drm_private {
>  extern struct platform_driver mtk_disp_color_driver;
>  extern struct platform_driver mtk_disp_gamma_driver;
>  extern struct platform_driver mtk_disp_ovl_driver;
> +extern struct platform_driver mtk_disp_postmask_driver;
>  extern struct platform_driver mtk_disp_rdma_driver;
>  extern struct platform_driver mtk_dpi_driver;
>  extern struct platform_driver mtk_dsi_driver;
> --
> 1.8.1.1.dirty
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
