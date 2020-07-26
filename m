Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6C022E1C1
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 19:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D57889C9B;
	Sun, 26 Jul 2020 17:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E65489C9B
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 17:50:35 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 7061420023;
 Sun, 26 Jul 2020 19:50:32 +0200 (CEST)
Date: Sun, 26 Jul 2020 19:50:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Swapnil Jakhade <sjakhade@cadence.com>
Subject: Re: [PATCH v7 3/3] drm: bridge: cdns-mhdp: Add j721e wrapper
Message-ID: <20200726175031.GK3275923@ravnborg.org>
References: <1595403640-12816-1-git-send-email-sjakhade@cadence.com>
 <1595403640-12816-4-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595403640-12816-4-git-send-email-sjakhade@cadence.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=sozttTNsAAAA:8 a=Br2UW1UjAAAA:8 a=P1BnusSwAAAA:8
 a=e5mUnYsNAAAA:8 a=eEAO8_bJDlSYck1gigMA:9 a=CjuIK1q_8ugA:10
 a=aeg5Gbbo78KNqacMgKqU:22 a=WmXOPjafLNExVIMTj843:22
 a=D0XLA9XvdZm18NrgonBM:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, narmstrong@baylibre.com, airlied@linux.ie,
 tomi.valkeinen@ti.com, jonas@kwiboo.se, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 jsarha@ti.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Swapnil

Small nits in the following.

	Sam

On Wed, Jul 22, 2020 at 09:40:40AM +0200, Swapnil Jakhade wrote:
> Add j721e wrapper for mhdp, which sets up the clock and data muxes.
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig           | 13 ++++
>  drivers/gpu/drm/bridge/Makefile          |  5 ++
>  drivers/gpu/drm/bridge/cdns-mhdp-core.c  | 15 +++++
>  drivers/gpu/drm/bridge/cdns-mhdp-core.h  |  1 +
>  drivers/gpu/drm/bridge/cdns-mhdp-j721e.c | 75 ++++++++++++++++++++++++
>  drivers/gpu/drm/bridge/cdns-mhdp-j721e.h | 19 ++++++
>  6 files changed, 128 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
>  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 6a4c324302a8..8c1738653b7e 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -38,6 +38,19 @@ config DRM_CDNS_MHDP
>  	  It takes a DPI stream as input and outputs it encoded
>  	  in DP format.
>  
> +if DRM_CDNS_MHDP
> +
> +config DRM_CDNS_MHDP_J721E
> +	depends on ARCH_K3_J721E_SOC
> +	bool "J721E Cadence DPI/DP wrapper support"
> +	default y
> +	help
> +	  Support J721E Cadence DPI/DP wrapper. This is a wrapper
> +	  which adds support for J721E related platform ops. It
> +	  initializes the J721e Display Port and sets up the
> +	  clock and data muxes.
> +endif
> +
>  config DRM_CHRONTEL_CH7033
>  	tristate "Chrontel CH7033 Video Encoder"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 0080a9f80f29..f81d606e9598 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -2,6 +2,11 @@
>  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
>  obj-$(CONFIG_DRM_CDNS_MHDP) += cdns-mhdp.o
>  cdns-mhdp-objs := cdns-mhdp-core.o
> +
> +ifeq ($(CONFIG_DRM_CDNS_MHDP_J721E),y)
> +	cdns-mhdp-objs += cdns-mhdp-j721e.o
> +endif

Use the idiomatic:
cdns-mhdp-$(CONFIG_DRM_CDNS_MHDP_J721E) += cdns-mhdp-j721e.o


> +
>  obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>  obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
>  obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
> diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.c b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> index b16c5503cef1..eeb33c54334f 100644
> --- a/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> +++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> @@ -38,6 +38,8 @@
>  
>  #include "cdns-mhdp-core.h"
>  
> +#include "cdns-mhdp-j721e.h"
> +
>  static DECLARE_WAIT_QUEUE_HEAD(fw_load_wq);
>  
>  static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
> @@ -1691,6 +1693,16 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
>  
>  	conn->display_info.bus_flags = DRM_BUS_FLAG_DE_HIGH;
>  
> +	if (of_device_is_compatible(mhdp->dev->of_node, "ti,j721e-mhdp8546"))
> +	/*
> +	 * DP is internal to J7 SoC and we need to use DRIVE_POSEDGE
> +	 * in the display controller. This is achieved for the time being
> +	 * by defining SAMPLE_NEGEDGE here.
> +	 */
> +		conn->display_info.bus_flags |=
> +					DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +					DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE;
> +
>  	ret = drm_connector_attach_encoder(conn, bridge->encoder);
>  	if (ret) {
>  		dev_err(mhdp->dev, "failed to attach connector to encoder\n");
> @@ -2470,6 +2482,9 @@ static int cdns_mhdp_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id mhdp_ids[] = {
>  	{ .compatible = "cdns,mhdp8546", },
> +#ifdef CONFIG_DRM_CDNS_MHDP_J721E
> +	{ .compatible = "ti,j721e-mhdp8546", .data = &mhdp_ti_j721e_ops },
> +#endif
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mhdp_ids);
> diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.h b/drivers/gpu/drm/bridge/cdns-mhdp-core.h
> index d1bfcdef4249..4e176698caca 100644
> --- a/drivers/gpu/drm/bridge/cdns-mhdp-core.h
> +++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.h
> @@ -343,6 +343,7 @@ struct cdns_mhdp_bridge_state {
>  
>  struct cdns_mhdp_device {
>  	void __iomem *regs;
> +	void __iomem *j721e_regs;
>  
>  	struct device *dev;
>  	struct clk *clk;
> diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
> new file mode 100644
> index 000000000000..7555c217c9a0
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.c
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TI j721e Cadence MHDP DP wrapper
> + *
> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + * Author: Jyri Sarha <jsarha@ti.com
> + */
> +
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +
> +#include "cdns-mhdp-j721e.h"
> +
> +#define	REVISION			0x00
> +#define	DPTX_IPCFG			0x04
> +#define	ECC_MEM_CFG			0x08
> +#define	DPTX_DSC_CFG			0x0c
> +#define	DPTX_SRC_CFG			0x10
> +#define	DPTX_VIF_SECURE_MODE_CFG	0x14
> +#define	DPTX_VIF_CONN_STATUS		0x18
> +#define	PHY_CLK_STATUS			0x1c
> +
> +#define DPTX_SRC_AIF_EN			BIT(16)
> +#define DPTX_SRC_VIF_3_IN30B		BIT(11)
> +#define DPTX_SRC_VIF_2_IN30B		BIT(10)
> +#define DPTX_SRC_VIF_1_IN30B		BIT(9)
> +#define DPTX_SRC_VIF_0_IN30B		BIT(8)
> +#define DPTX_SRC_VIF_3_SEL_DPI5		BIT(7)
> +#define DPTX_SRC_VIF_3_SEL_DPI3		0
> +#define DPTX_SRC_VIF_2_SEL_DPI4		BIT(6)
> +#define DPTX_SRC_VIF_2_SEL_DPI2		0
> +#define DPTX_SRC_VIF_1_SEL_DPI3		BIT(5)
> +#define DPTX_SRC_VIF_1_SEL_DPI1		0
> +#define DPTX_SRC_VIF_0_SEL_DPI2		BIT(4)
> +#define DPTX_SRC_VIF_0_SEL_DPI0		0
> +#define DPTX_SRC_VIF_3_EN		BIT(3)
> +#define DPTX_SRC_VIF_2_EN		BIT(2)
> +#define DPTX_SRC_VIF_1_EN		BIT(1)
> +#define DPTX_SRC_VIF_0_EN		BIT(0)
> +
> +/* TODO turn DPTX_IPCFG fw_mem_clk_en at pm_runtime_suspend. */
> +
> +static int cdns_mhdp_j721e_init(struct cdns_mhdp_device *mhdp)
> +{
> +	struct platform_device *pdev = to_platform_device(mhdp->dev);
> +
> +	mhdp->j721e_regs = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(mhdp->j721e_regs))
> +		return PTR_ERR(mhdp->j721e_regs);

Use PTR_ERR_OR_ZERO() like this:

	return PTR_ERR_OR_ZERO(mhdp->j721e_regs);

> +
> +	return 0;
> +}
> +
> +static void cdns_mhdp_j721e_enable(struct cdns_mhdp_device *mhdp)
> +{
> +	/*
> +	 * Eneble VIF_0 and select DPI2 as its input. DSS0 DPI0 is connected
> +	 * to eDP DPI2. This is the only supported SST configuration on
> +	 * J721E.
> +	 */
> +	writel(DPTX_SRC_VIF_0_EN | DPTX_SRC_VIF_0_SEL_DPI2,
> +	       mhdp->j721e_regs + DPTX_SRC_CFG);
> +}
> +
> +static void cdns_mhdp_j721e_disable(struct cdns_mhdp_device *mhdp)
> +{
> +	/* Put everything to defaults  */
> +	writel(0, mhdp->j721e_regs + DPTX_DSC_CFG);
> +}
> +
> +const struct mhdp_platform_ops mhdp_ti_j721e_ops = {
> +	.init = cdns_mhdp_j721e_init,
> +	.enable = cdns_mhdp_j721e_enable,
> +	.disable = cdns_mhdp_j721e_disable,
> +};
> diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
> new file mode 100644
> index 000000000000..f1ff07b82d32
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cdns-mhdp-j721e.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * TI j721e Cadence MHDP DP wrapper
> + *
> + * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> + * Author: Jyri Sarha <jsarha@ti.com
> + */
> +
> +#ifndef CDNS_MHDP_J721E_H
> +#define CDNS_MHDP_J721E_H
> +
> +#include <linux/platform_device.h>
> +#include "cdns-mhdp-core.h"
> +
> +struct mhdp_platform_ops;
> +
> +extern const struct mhdp_platform_ops mhdp_ti_j721e_ops;
> +
> +#endif /* !CDNS_MHDP_J721E_H */
> -- 
> 2.26.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
