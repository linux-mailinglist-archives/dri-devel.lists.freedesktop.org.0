Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F326D61361D
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 13:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3436910E1D6;
	Mon, 31 Oct 2022 12:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472E010E1D6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 12:24:23 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29VCOCAu102315;
 Mon, 31 Oct 2022 07:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1667219052;
 bh=DFxvIFBON4S7AoXy9Wq0hEUAc0RJJRkwWvAXNulNVvQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=EPx9z4pfKcmO/bzpoLY4qmqHsvmGHYi33DuYUcd8Qtmuk2Cb+wvRbf00IRqvHWmn3
 CSWtinTCRhtDxnBHyBSVH8c6pWdDn2iGTV70+e+cvBXXta1jT5GhOEZ/GvXwl3sVxT
 AjGnSzT3wXdn1k7ZBnvUnsokXzxIn9XjjXmW0DyU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29VCOBgY044208
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 31 Oct 2022 07:24:11 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 31
 Oct 2022 07:24:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 31 Oct 2022 07:24:11 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29VCOAS4025186;
 Mon, 31 Oct 2022 07:24:11 -0500
Date: Mon, 31 Oct 2022 17:54:09 +0530
From: Rahul T R <r-ravikumar@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v8 5/5] drm/bridge: cdns-dsi: Add support for J721E wrapper
Message-ID: <20221031122409.mupjcvjyasn2w3q5@uda0490373>
References: <20221021171820.15984-1-r-ravikumar@ti.com>
 <20221021171820.15984-6-r-ravikumar@ti.com>
 <ec3be93c-fcc1-e0f9-807e-d7fa790c60ad@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ec3be93c-fcc1-e0f9-807e-d7fa790c60ad@ideasonboard.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: mparab@cadence.com, jernej.skrabec@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, a-bhatia1@ti.com, narmstrong@baylibre.com,
 airlied@linux.ie, jpawar@cadence.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, vigneshr@ti.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com, sjakhade@cadence.com,
 lee.jones@linaro.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On 09:12-20221026, Tomi Valkeinen wrote:
> Hi,
> 
> On 21/10/2022 20:18, Rahul T R wrote:
> > Add support for wrapper settings for DSI bridge on
> > j721e. Also set the DPI input to DPI0
> 
> I think a few more words on the HW layout would be nice. What does the
> wrapper do and how is it connected to the DSS.
> 
> > Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> > ---
> >   drivers/gpu/drm/bridge/cadence/Kconfig        | 10 ++++
> >   drivers/gpu/drm/bridge/cadence/Makefile       |  1 +
> >   .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 37 +++++++++++++-
> >   .../gpu/drm/bridge/cadence/cdns-dsi-core.h    | 13 +++++
> >   .../gpu/drm/bridge/cadence/cdns-dsi-j721e.c   | 51 +++++++++++++++++++
> >   .../gpu/drm/bridge/cadence/cdns-dsi-j721e.h   | 18 +++++++
> >   6 files changed, 129 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c
> >   create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h
> > 
> > diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
> > index 8fbb46c66094..663a02d96420 100644
> > --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> > +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> > @@ -36,3 +36,13 @@ config DRM_CDNS_DSI
> >   	help
> >   	  Support Cadence DPI to DSI bridge. This is an internal
> >   	  bridge and is meant to be directly embedded in a SoC.
> > +
> > +if DRM_CDNS_DSI
> > +
> > +config DRM_CDNS_DSI_J721E
> > +	bool "J721E Cadence DPI/DSI wrapper support"
> > +	default y
> > +	help
> > +	  Support J721E Cadence DPI/DSI wrapper. This wrapper adds
> > +	  support to select which DPI input to use for the bridge.
> 
> I'm not sure if the above is quite necessary here. If I understand right,
> there's only one way on J721E to mux the DPI signal going to the DSI. If you
> write "adds support to select DPI input" it sounds like there's something to
> select, and this config somehow enables that selection for the user.
> 
> Perhaps instead just say something like "Support J721E Cadence DPI/DSI
> wrapper. The wrapper manages the routing of the DSS DPI signal to the
> Cadence DSI.", or something along those lines.
> 
> Also, you say "DPI/DSI wrapper". How does this wrap DPI? Isn't this just a
> DSI wrapper?
> 
> > +endif
> > diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
> > index e3d8e9a40784..4cffc8ff71c4 100644
> > --- a/drivers/gpu/drm/bridge/cadence/Makefile
> > +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> > @@ -4,3 +4,4 @@ cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
> >   cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
> >   obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> >   cdns-dsi-y := cdns-dsi-core.o
> > +cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) += cdns-dsi-j721e.o
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> > index cba91247ab26..4b7de38ef1b0 100644
> > --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> > @@ -15,12 +15,16 @@
> >   #include <linux/iopoll.h>
> >   #include <linux/module.h>
> >   #include <linux/of_address.h>
> > +#include <linux/of_device.h>
> >   #include <linux/of_graph.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/pm_runtime.h>
> >   #include <linux/reset.h>
> >   #include "cdns-dsi-core.h"
> > +#ifdef CONFIG_DRM_CDNS_DSI_J721E
> > +#include "cdns-dsi-j721e.h"
> > +#endif
> >   static inline struct cdns_dsi *input_to_dsi(struct cdns_dsi_input *input)
> >   {
> > @@ -265,6 +269,10 @@ static void cdns_dsi_bridge_disable(struct drm_bridge *bridge)
> >   	val = readl(dsi->regs + MCTL_MAIN_EN) & ~IF_EN(input->id);
> >   	writel(val, dsi->regs + MCTL_MAIN_EN);
> > +
> > +	if (dsi->platform_ops && dsi->platform_ops->disable)
> > +		dsi->platform_ops->disable(dsi);
> > +
> >   	pm_runtime_put(dsi->base.dev);
> >   }
> > @@ -360,6 +368,9 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
> >   	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
> >   		return;
> > +	if (dsi->platform_ops && dsi->platform_ops->enable)
> > +		dsi->platform_ops->enable(dsi);
> > +
> >   	mode = &bridge->encoder->crtc->state->adjusted_mode;
> >   	nlanes = output->dev->lanes;
> > @@ -800,6 +811,8 @@ static int cdns_dsi_drm_probe(struct platform_device *pdev)
> >   		goto err_disable_pclk;
> >   	}
> > +	dsi->platform_ops = of_device_get_match_data(&pdev->dev);
> > +
> >   	val = readl(dsi->regs + IP_CONF);
> >   	dsi->direct_cmd_fifo_depth = 1 << (DIRCMD_FIFO_DEPTH(val) + 2);
> >   	dsi->rx_fifo_depth = RX_FIFO_DEPTH(val);
> > @@ -835,14 +848,27 @@ static int cdns_dsi_drm_probe(struct platform_device *pdev)
> >   	dsi->base.dev = &pdev->dev;
> >   	dsi->base.ops = &cdns_dsi_ops;
> > +	if (dsi->platform_ops && dsi->platform_ops->init) {
> > +		ret = dsi->platform_ops->init(dsi);
> > +		if (ret != 0) {
> > +			dev_err(&pdev->dev, "platform initialization failed: %d\n",
> > +				ret);
> > +			goto err_disable_runtime_pm;
> > +		}
> > +	}
> > +
> >   	ret = mipi_dsi_host_register(&dsi->base);
> >   	if (ret)
> > -		goto err_disable_runtime_pm;
> > +		goto err_deinit_platform;
> >   	clk_disable_unprepare(dsi->dsi_p_clk);
> >   	return 0;
> > +err_deinit_platform:
> > +	if (dsi->platform_ops && dsi->platform_ops->exit)
> > +		dsi->platform_ops->exit(dsi);
> > +
> >   err_disable_runtime_pm:
> >   	pm_runtime_disable(&pdev->dev);
> > @@ -857,6 +883,10 @@ static int cdns_dsi_drm_remove(struct platform_device *pdev)
> >   	struct cdns_dsi *dsi = platform_get_drvdata(pdev);
> >   	mipi_dsi_host_unregister(&dsi->base);
> > +
> > +	if (dsi->platform_ops && dsi->platform_ops->exit)
> > +		dsi->platform_ops->exit(dsi);
> > +
> >   	pm_runtime_disable(&pdev->dev);
> >   	return 0;
> > @@ -864,6 +894,11 @@ static int cdns_dsi_drm_remove(struct platform_device *pdev)
> >   static const struct of_device_id cdns_dsi_of_match[] = {
> >   	{ .compatible = "cdns,dsi" },
> > +#ifdef CONFIG_DRM_CDNS_DSI_J721E
> > +	{ .compatible = "ti,j721e-dsi",
> > +	  .data = &dsi_ti_j721e_ops,
> > +	},
> 
> I find the above formatting a bit odd. I think this should do fine:
> 
> { .compatible = "ti,j721e-dsi", .data = &dsi_ti_j721e_ops, },
> 
> If you want multi-line, then I think the opening { should be on its own
> line, similarly to the closing }.
> 
> > +#endif
> >   	{ },
> >   };
> >   MODULE_DEVICE_TABLE(of, cdns_dsi_of_match);
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
> > index 65cc77f19b39..37568b547fbe 100644
> > --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
> > @@ -439,9 +439,22 @@ struct cdns_dsi_input {
> >   	struct drm_bridge bridge;
> >   };
> > +struct cdns_dsi;
> > +
> > +struct dsi_platform_ops {
> > +	int (*init)(struct cdns_dsi *dsi);
> > +	void (*exit)(struct cdns_dsi *dsi);
> 
> I don't think init and exit are the opposites, but rather init and
> deinit/uninit.
> 
> > +	void (*enable)(struct cdns_dsi *dsi);
> > +	void (*disable)(struct cdns_dsi *dsi);
> > +};
> > +
> >   struct cdns_dsi {
> >   	struct mipi_dsi_host base;
> >   	void __iomem *regs;
> > +#ifdef CONFIG_DRM_CDNS_DSI_J721E
> > +	void __iomem *j721e_regs;
> > +#endif
> > +	const struct dsi_platform_ops *platform_ops;
> >   	struct cdns_dsi_input input;
> >   	struct cdns_dsi_output output;
> >   	unsigned int direct_cmd_fifo_depth;
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c
> > new file mode 100644
> > index 000000000000..b5216acb333e
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c
> > @@ -0,0 +1,51 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * TI j721e Cadence DSI wrapper
> > + *
> > + * Copyright (C) 2022 Texas Instruments Incorporated - http://www.ti.com/
> > + * Author: Rahul T R <r-ravikumar@ti.com>
> > + */
> > +
> > +#include <linux/io.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "cdns-dsi-j721e.h"
> > +
> > +#define DSI_WRAP_REVISION		0x0
> > +#define DSI_WRAP_DPI_CONTROL		0x4
> > +#define DSI_WRAP_DSC_CONTROL		0x8
> > +#define DSI_WRAP_DPI_SECURE		0xc
> > +#define DSI_WRAP_DSI_0_ASF_STATUS	0x10
> > +
> > +#define DSI_WRAP_DPI_0_EN		BIT(0)
> > +#define DSI_WRAP_DSI2_MUX_SEL		BIT(4)
> > +
> > +static int cdns_dsi_j721e_init(struct cdns_dsi *dsi)
> > +{
> > +	struct platform_device *pdev = to_platform_device(dsi->base.dev);
> > +
> > +	dsi->j721e_regs = devm_platform_ioremap_resource(pdev, 1);
> > +	return PTR_ERR_OR_ZERO(dsi->j721e_regs);
> > +}
> > +
> > +static void cdns_dsi_j721e_enable(struct cdns_dsi *dsi)
> > +{
> > +	/*
> > +	 * Enable DPI0 as its input. DSS0 DPI2 is connected
> > +	 * to DSI DPI0. This is the only supported configuration on
> > +	 * J721E.
> > +	 */
> > +	writel(DSI_WRAP_DPI_0_EN, dsi->j721e_regs + DSI_WRAP_DPI_CONTROL);
> > +}
> > +
> > +static void cdns_dsi_j721e_disable(struct cdns_dsi *dsi)
> > +{
> > +	/* Put everything to defaults  */
> > +	writel(0, dsi->j721e_regs + DSI_WRAP_DPI_CONTROL);
> > +}
> > +
> > +const struct dsi_platform_ops dsi_ti_j721e_ops = {
> > +	.init = cdns_dsi_j721e_init,
> > +	.enable = cdns_dsi_j721e_enable,
> > +	.disable = cdns_dsi_j721e_disable,
> > +};
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h b/drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h
> > new file mode 100644
> > index 000000000000..01f3dbd92db2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * TI j721e Cadence DSI wrapper
> > + *
> > + * Copyright (C) 2022 Texas Instruments Incorporated - http://www.ti.com/
> > + * Author: Rahul T R <r-ravikumar@ti.com>
> > + */
> > +
> > +#ifndef CDNS_DSI_J721E_H
> > +#define CDNS_DSI_J721E_H
> > +
> > +#include "cdns-dsi-core.h"
> > +
> > +struct dsi_platform_ops;
> 
> You don't need the above line as you already include the cdns-dsi-core.h
> 

Thanks for the detailed review
I have addressed the review comments
and sent a v9 of this series

Regards
Rahul T R

> > +extern const struct dsi_platform_ops dsi_ti_j721e_ops;
> > +
> > +#endif /* !CDNS_DSI_J721E_H */
> 
