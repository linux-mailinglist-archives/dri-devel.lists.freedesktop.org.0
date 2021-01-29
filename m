Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D74C23094D6
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAEC6ECBC;
	Sat, 30 Jan 2021 11:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4005B6E3F2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 08:32:53 +0000 (UTC)
X-UUID: aaf422e7dae14faab55d62bb7d18b35b-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=+3hTXoJGdmRpeVzZ6RU8oM412Ca0wDnktJAqiwy3Z+M=; 
 b=rKRt2BKFdGNslPdIOC3B8s2EEunPCIZtt3OVrfxv5eKO9aZ0CYp7wFovAVGsxEk3M9GxiNLXtE3s4Ir6e26gmUGKLJ+DkBtS3lyrGrnMFmSk2TKLpOynI6lxKEhZpUZXa4mTD+pO5e0qZYbosNaosXTdUqouEMZMbL9JKLJeEvo=;
X-UUID: aaf422e7dae14faab55d62bb7d18b35b-20210129
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1688375287; Fri, 29 Jan 2021 16:32:44 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 29 Jan 2021 16:32:42 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 16:32:41 +0800
Message-ID: <1611909161.24406.1.camel@mhfsdcap03>
Subject: Re: [PATCH v4 2/8] drm/mediatek: add component POSTMASK
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Fri, 29 Jan 2021 16:32:41 +0800
In-Reply-To: <1611908296.31184.5.camel@mtksdaap41>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
 <20210129073436.2429834-3-hsinyi@chromium.org>
 <1611908296.31184.5.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:30 +0000
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David
 Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2021-01-29 at 16:18 +0800, CK Hu wrote:
> Hi, Hsin-Yi:
> 
> On Fri, 2021-01-29 at 15:34 +0800, Hsin-Yi Wang wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > 
> > This patch add component POSTMASK,
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/Makefile            |   1 +
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h      |   8 +
> >  drivers/gpu/drm/mediatek/mtk_disp_postmask.c | 161 +++++++++++++++++++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c  |  11 ++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h  |   1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c       |   4 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.h       |   1 +
> >  7 files changed, 186 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_postmask.c
> > 
> > diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> > index b64674b944860..13a0eafabf9c0 100644
> > --- a/drivers/gpu/drm/mediatek/Makefile
> > +++ b/drivers/gpu/drm/mediatek/Makefile
> > @@ -3,6 +3,7 @@
> >  mediatek-drm-y := mtk_disp_color.o \
> >  		  mtk_disp_gamma.o \
> >  		  mtk_disp_ovl.o \
> > +		  mtk_disp_postmask.o \
> >  		  mtk_disp_rdma.o \
> >  		  mtk_drm_crtc.o \
> >  		  mtk_drm_ddp_comp.o \
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > index 02191010699f8..d74e85db3fcdf 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > @@ -37,6 +37,14 @@ void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state);
> >  void mtk_gamma_start(struct device *dev);
> >  void mtk_gamma_stop(struct device *dev);
> >  
> > +int mtk_postmask_clk_enable(struct device *dev);
> > +void mtk_postmask_clk_disable(struct device *dev);
> > +void mtk_postmask_config(struct device *dev, unsigned int w,
> > +                      unsigned int h, unsigned int vrefresh,
> > +                      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> > +void mtk_postmask_start(struct device *dev);
> > +void mtk_postmask_stop(struct device *dev);
> > +
> >  void mtk_ovl_bgclr_in_on(struct device *dev);
> >  void mtk_ovl_bgclr_in_off(struct device *dev);
> >  void mtk_ovl_bypass_shadow(struct device *dev);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_postmask.c b/drivers/gpu/drm/mediatek/mtk_disp_postmask.c
> > new file mode 100644
> > index 0000000000000..d640cef9c15a4
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_postmask.c
> > @@ -0,0 +1,161 @@
> > +/*
> > + * SPDX-License-Identifier:
> > + *
> > + * Copyright (c) 2020 MediaTek Inc.
> 
> 2021
> 
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/component.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/soc/mediatek/mtk-cmdq.h>
> > +
> > +#include "mtk_disp_drv.h"
> > +#include "mtk_drm_crtc.h"
> > +#include "mtk_drm_ddp_comp.h"
> > +
> > +#define DISP_POSTMASK_EN			0x0000
> > +#define POSTMASK_EN				BIT(0)
> > +#define DISP_POSTMASK_CFG			0x0020
> > +#define POSTMASK_RELAY_MODE			BIT(0)
> > +#define DISP_POSTMASK_SIZE			0x0030
> > +
> > +struct mtk_disp_postmask_data {
> > +	u32 reserved;
> > +};
> 
> Useless, so remove.
> 
> > +
> > +/**
> > + * struct mtk_disp_postmask - DISP_postmask driver structure
> > + * @ddp_comp - structure containing type enum and hardware resources
> > + * @crtc - associated crtc to report irq events to
> > + */
> > +struct mtk_disp_postmask {
> > +	struct clk *clk;
> > +	void __iomem *regs;
> > +	struct cmdq_client_reg cmdq_reg;
> > +	const struct mtk_disp_postmask_data *data;
> > +};
> > +
> > +int mtk_postmask_clk_enable(struct device *dev)
> > +{
> > +	struct mtk_disp_postmask *postmask = dev_get_drvdata(dev);
> > +
> > +	return clk_prepare_enable(postmask->clk);
> > +}
> > +
> > +void mtk_postmask_clk_disable(struct device *dev)
> > +{
> > +	struct mtk_disp_postmask *postmask = dev_get_drvdata(dev);
> > +
> > +	clk_disable_unprepare(postmask->clk);
> > +}
> > +
> > +void mtk_postmask_config(struct device *dev, unsigned int w,
> > +			 unsigned int h, unsigned int vrefresh,
> > +			 unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> > +{
> > +	struct mtk_disp_postmask *postmask = dev_get_drvdata(dev);
> > +
> > +	mtk_ddp_write(cmdq_pkt, w << 16 | h, &postmask->cmdq_reg, postmask->regs,
> > +		      DISP_POSTMASK_SIZE);
> > +	mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &postmask->cmdq_reg,
> > +		      postmask->regs, DISP_POSTMASK_CFG);
> > +}
> > +
> > +void mtk_postmask_start(struct device *dev)
> > +{
> > +	struct mtk_disp_postmask *postmask = dev_get_drvdata(dev);
> > +
> > +	writel(POSTMASK_EN, postmask->regs + DISP_POSTMASK_EN);
> > +}
> > +
> > +void mtk_postmask_stop(struct device *dev)
> > +{
> > +	struct mtk_disp_postmask *postmask = dev_get_drvdata(dev);
> > +
> > +	writel_relaxed(0x0, postmask->regs + DISP_POSTMASK_EN);
> > +}
> > +
> > +static int mtk_disp_postmask_bind(struct device *dev, struct device *master, void *data)
> > +{
> > +	return 0;
> > +}
> > +
> > +static void mtk_disp_postmask_unbind(struct device *dev, struct device *master,
> > +				  void *data)
> > +{
> > +}
> > +
> > +static const struct component_ops mtk_disp_postmask_component_ops = {
> > +	.bind	= mtk_disp_postmask_bind,
> > +	.unbind = mtk_disp_postmask_unbind,
> > +};
> > +
> > +static int mtk_disp_postmask_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct mtk_disp_postmask *priv;
> > +	struct resource *res;
> > +	int ret;
> > +
> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	priv->clk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(priv->clk)) {
> > +		dev_err(dev, "failed to get postmask clk\n");
> > +		return PTR_ERR(priv->clk);
> > +	}
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	priv->regs = devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(priv->regs)) {
> > +		dev_err(dev, "failed to ioremap postmask\n");
> > +		return PTR_ERR(priv->regs);
> > +	}
> > +
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
> > +	if (ret)
> > +		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
> > +#endif
> > +
> > +	priv->data = of_device_get_match_data(dev);
> > +	platform_set_drvdata(pdev, priv);
> > +
> > +	pm_runtime_enable(dev);
> 
> Why this?

if add power domain information in dts, we need this to make sure
display power domain will be off after module clock off.

> 
> > +
> > +	ret = component_add(dev, &mtk_disp_postmask_component_ops);
> > +	if (ret)
> > +		dev_err(dev, "Failed to add component: %d\n", ret);
> > +
> > +	return ret;
> > +}
> > +
> > +static int mtk_disp_postmask_remove(struct platform_device *pdev)
> > +{
> > +	component_del(&pdev->dev, &mtk_disp_postmask_component_ops);
> > +
> > +	pm_runtime_disable(&pdev->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id mtk_disp_postmask_driver_dt_match[] = {
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_disp_postmask_driver_dt_match);
> > +
> > +struct platform_driver mtk_disp_postmask_driver = {
> > +	.probe		= mtk_disp_postmask_probe,
> > +	.remove		= mtk_disp_postmask_remove,
> > +	.driver		= {
> > +		.name	= "mediatek-disp-postmask",
> > +		.owner	= THIS_MODULE,
> > +		.of_match_table = mtk_disp_postmask_driver_dt_match,
> > +	},
> > +};
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index ccfaada998cf5..6c539783118dd 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -415,6 +415,14 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
> >  	.bgclr_in_off = mtk_ovl_bgclr_in_off,
> >  };
> >  
> > +static const struct mtk_ddp_comp_funcs ddp_postmask = {
> > +	.clk_enable = mtk_postmask_clk_enable,
> > +        .clk_disable = mtk_postmask_clk_disable,
> 
> tab.
> 
> > +	.config = mtk_postmask_config,
> > +	.start = mtk_postmask_start,
> > +	.stop = mtk_postmask_stop,
> > +};
> > +
> >  static const struct mtk_ddp_comp_funcs ddp_rdma = {
> >  	.clk_enable = mtk_rdma_clk_enable,
> >  	.clk_disable = mtk_rdma_clk_disable,
> > @@ -450,6 +458,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
> >  	[MTK_DISP_MUTEX] = "mutex",
> >  	[MTK_DISP_OD] = "od",
> >  	[MTK_DISP_BLS] = "bls",
> > +	[MTK_DISP_POSTMASK] = "postmask",
> >  };
> >  
> >  struct mtk_ddp_comp_match {
> > @@ -480,6 +489,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
> >  	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
> >  	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
> >  	[DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, &ddp_ovl },
> > +	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0, &ddp_postmask },
> 
> Make other row the same indent.
> 
> >  	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
> >  	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
> >  	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
> > @@ -603,6 +613,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
> >  	if (type == MTK_DISP_BLS ||
> >  	    type == MTK_DISP_COLOR ||
> >  	    type == MTK_DISP_GAMMA ||
> > +	    type == MTK_DISP_POSTMASK ||
> >  	    type == MTK_DPI ||
> >  	    type == MTK_DSI ||
> >  	    type == MTK_DISP_OVL ||
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > index bb914d976cf5d..cd1dec6b4cdf2 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > @@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
> >  	MTK_DISP_UFOE,
> >  	MTK_DSI,
> >  	MTK_DPI,
> > +	MTK_DISP_POSTMASK,
> >  	MTK_DISP_PWM,
> >  	MTK_DISP_MUTEX,
> >  	MTK_DISP_OD,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 486e73e675ad5..d99afc8528684 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -531,7 +531,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
> >  		private->comp_node[comp_id] = of_node_get(node);
> >  
> >  		/*
> > -		 * Currently only the COLOR, GAMMA, OVL, RDMA, DSI, and DPI blocks have
> > +		 * Currently only the COLOR, GAMMA, OVL, POSTMASK, RDMA, DSI, and DPI blocks have
> >  		 * separate component platform drivers and initialize their own
> >  		 * DDP component structure. The others are initialized here.
> >  		 */
> > @@ -539,6 +539,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
> >  		    comp_type == MTK_DISP_GAMMA ||
> >  		    comp_type == MTK_DISP_OVL ||
> >  		    comp_type == MTK_DISP_OVL_2L ||
> > +		    comp_type == MTK_DISP_POSTMASK ||
> >  		    comp_type == MTK_DISP_RDMA ||
> >  		    comp_type == MTK_DSI ||
> >  		    comp_type == MTK_DPI) {
> > @@ -637,6 +638,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
> >  	&mtk_disp_color_driver,
> >  	&mtk_disp_gamma_driver,
> >  	&mtk_disp_ovl_driver,
> > +	&mtk_disp_postmask_driver,
> >  	&mtk_disp_rdma_driver,
> >  	&mtk_dpi_driver,
> >  	&mtk_drm_platform_driver,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > index 0e54e3d51014a..7e7b28e32aa2f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > @@ -49,6 +49,7 @@ struct mtk_drm_private {
> >  extern struct platform_driver mtk_disp_color_driver;
> >  extern struct platform_driver mtk_disp_gamma_driver;
> >  extern struct platform_driver mtk_disp_ovl_driver;
> > +extern struct platform_driver mtk_disp_postmask_driver;
> >  extern struct platform_driver mtk_disp_rdma_driver;
> >  extern struct platform_driver mtk_dpi_driver;
> >  extern struct platform_driver mtk_dsi_driver;
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
