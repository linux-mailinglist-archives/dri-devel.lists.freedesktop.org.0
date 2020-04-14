Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A4A1A88B8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055A56E23D;
	Tue, 14 Apr 2020 18:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058716E112
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:12:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E06EC80441;
 Tue, 14 Apr 2020 20:12:01 +0200 (CEST)
Date: Tue, 14 Apr 2020 20:11:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH v2 1/2] DRM: ARC: add HDMI 2.0 TX encoder support
Message-ID: <20200414181155.GA21071@ravnborg.org>
References: <20200414144402.27643-1-Eugeniy.Paltsev@synopsys.com>
 <20200414144402.27643-2-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414144402.27643-2-Eugeniy.Paltsev@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=jIQo8A4GAAAA:8 a=VwQbUJbxAAAA:8 a=irhMBndJ4tJQUlVCqRwA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Lf5xNeLK5dgiOs8hzIjU:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Eugeniy.

On Tue, Apr 14, 2020 at 05:44:01PM +0300, Eugeniy Paltsev wrote:
> The Synopsys ARC SoCs (like HSDK4xD) include on-chip DesignWare HDMI
> encoders. Support them with a platform driver to provide platform glue
> data to the dw-hdmi driver.


Drivers looks lean and clean.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

But really take this as I found no whitespace erros or something...

A few drive-by comments below.

	Sam

> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  MAINTAINERS                       |   6 ++
>  drivers/gpu/drm/Makefile          |   2 +-
>  drivers/gpu/drm/arc/Kconfig       |   7 ++
>  drivers/gpu/drm/arc/Makefile      |   1 +
>  drivers/gpu/drm/arc/arc-dw-hdmi.c | 126 ++++++++++++++++++++++++++++++
>  5 files changed, 141 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/arc/arc-dw-hdmi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a6fbdf354d34..2aaed1190370 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1258,6 +1258,12 @@ S:	Supported
>  F:	drivers/gpu/drm/arc/
>  F:	Documentation/devicetree/bindings/display/snps,arcpgu.txt
>  
> +ARC DW HDMI DRIVER
> +M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> +S:	Supported
> +F:	drivers/gpu/drm/arc/arc-dw-hdmi.c
> +F:	Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml

I am confused about the filename of the binding.
Binding files are often named after their compatible.
But the compatible is: snps,dw-hdmi-hsdk

And the biding file seems to be named after the driver name.
This seems wrong - and I do nto see it explained.

> +
>  ARCNET NETWORK LAYER
>  M:	Michael Grzeschik <m.grzeschik@pengutronix.de>
>  L:	netdev@vger.kernel.org
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 6493088a0fdd..5b0bcf7f45cd 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -109,7 +109,7 @@ obj-y			+= panel/
>  obj-y			+= bridge/
>  obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
>  obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
> -obj-$(CONFIG_DRM_ARCPGU)+= arc/
> +obj-y			+= arc/
>  obj-y			+= hisilicon/
>  obj-$(CONFIG_DRM_ZTE)	+= zte/
>  obj-$(CONFIG_DRM_MXSFB)	+= mxsfb/
> diff --git a/drivers/gpu/drm/arc/Kconfig b/drivers/gpu/drm/arc/Kconfig
> index e8f3d63e0b91..baec9d2a4fba 100644
> --- a/drivers/gpu/drm/arc/Kconfig
> +++ b/drivers/gpu/drm/arc/Kconfig
> @@ -8,3 +8,10 @@ config DRM_ARCPGU
>  	  Choose this option if you have an ARC PGU controller.
>  
>  	  If M is selected the module will be called arcpgu.
> +
> +config DRM_ARC_DW_HDMI
> +	tristate "ARC DW HDMI"
> +	depends on DRM && OF
> +	select DRM_DW_HDMI
> +	help
> +	  Synopsys DW HDMI driver for various ARC development boards
> diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
> index c7028b7427b3..7a156d8c2c3c 100644
> --- a/drivers/gpu/drm/arc/Makefile
> +++ b/drivers/gpu/drm/arc/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  arcpgu-y := arcpgu_crtc.o arcpgu_hdmi.o arcpgu_sim.o arcpgu_drv.o
>  obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
> +obj-$(CONFIG_DRM_ARC_DW_HDMI) += arc-dw-hdmi.o
> diff --git a/drivers/gpu/drm/arc/arc-dw-hdmi.c b/drivers/gpu/drm/arc/arc-dw-hdmi.c
> new file mode 100644
> index 000000000000..4869dd668a51
> --- /dev/null
> +++ b/drivers/gpu/drm/arc/arc-dw-hdmi.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Synopsys DW HDMI driver for various ARC development boards
> +//
> +// Copyright (C) 2020 Synopsys
> +// Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> +
> +#include <linux/component.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <drm/bridge/dw_hdmi.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_encoder_slave.h>
> +#include <drm/drm_of.h>
> +
> +static const struct dw_hdmi_mpll_config snps_hdmi_mpll_cfg[] = {
> +	{
> +		27000000, {
> +			{ 0x00B3, 0x0000 },
> +			{ 0x00B3, 0x0000 },
> +			{ 0x00B3, 0x0000 }
> +		},
> +	}, {
> +		74250000, {
> +			{ 0x0072, 0x0001},
> +			{ 0x0072, 0x0001},
> +			{ 0x0072, 0x0001}
> +		},
> +	}, {
> +		148500000, {
> +			{ 0x0051, 0x0002},
> +			{ 0x0051, 0x0002},
> +			{ 0x0051, 0x0002}
> +		},
> +	}, {
> +		~0UL, {
> +			{ 0x00B3, 0x0000 },
> +			{ 0x00B3, 0x0000 },
> +			{ 0x00B3, 0x0000 },
> +		},
> +	}
> +};
> +
> +static const struct dw_hdmi_curr_ctrl snps_hdmi_cur_ctr[] = {
> +	/* pixelclk    bpp8    bpp10   bpp12 */
This comment is very useful. Could you put one on top of
snps_hdmi_mpll_cfg too?

> +	{ 27000000,  { 0x0000, 0x0000, 0x0000 }, },
> +	{ 74250000,  { 0x0008, 0x0008, 0x0008 }, },
> +	{ 148500000, { 0x001b, 0x001b, 0x001b }, },
> +	{ ~0UL,      { 0x0000, 0x0000, 0x0000 }, }
> +};
> +
> +
> +static const struct dw_hdmi_phy_config snps_hdmi_phy_config[] = {
> +	/* pixelclk   symbol  term    vlev */
> +	{ 27000000,   0x8009, 0x0004, 0x0232},
> +	{ 74250000,   0x8009, 0x0004, 0x0232},
> +	{ 148500000,  0x8009, 0x0004, 0x0232},
> +	{ ~0UL,       0x8009, 0x0004, 0x0232}
> +};
> +
> +static enum drm_mode_status snps_dw_hdmi_mode_valid(struct drm_connector *con,
> +						    const struct drm_display_mode *mode)
> +{
> +	return MODE_OK;
> +}

dw_hdmi_bridge_mode_valid() will return MODE_OK if no operation
is assigned to .mode_valid.
So I think it is not needed.

Or I have missed something, which is also quite possible.

> +
> +static struct dw_hdmi_plat_data snps_dw_hdmi_drv_data = {
> +	.mpll_cfg   = snps_hdmi_mpll_cfg,
> +	.cur_ctr    = snps_hdmi_cur_ctr,
> +	.phy_config = snps_hdmi_phy_config,
> +	.mode_valid = snps_dw_hdmi_mode_valid,
> +};
> +
static const struct of_device_id snps_dw_hdmi_dt_ids[] = {
	{ .compatible = "snps,dw-hdmi-hsdk", .data = &snps_dw_hdmi_drv_data },
	{ /* sentinel */ },
	
Bracing looked strange. Consider the above format.
Ignore if line becomes a few char too long (IMO).

	Sam

> +};
> +MODULE_DEVICE_TABLE(of, snps_dw_hdmi_dt_ids);
> +
> +static int snps_dw_hdmi_probe(struct platform_device *pdev)
> +{
> +	const struct dw_hdmi_plat_data *plat_data;
> +	const struct of_device_id *match;
> +	struct dw_hdmi *hdmi;
> +
> +	if (!pdev->dev.of_node)
> +		return -ENODEV;
> +
> +	match = of_match_node(snps_dw_hdmi_dt_ids, pdev->dev.of_node);
> +	plat_data = match->data;
> +
> +	hdmi = dw_hdmi_probe(pdev, plat_data);
> +	if (IS_ERR(hdmi))
> +		return PTR_ERR(hdmi);
> +
> +	platform_set_drvdata(pdev, hdmi);
> +
> +	return 0;
> +}
> +
> +static int snps_dw_hdmi_remove(struct platform_device *pdev)
> +{
> +	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
> +
> +	dw_hdmi_remove(hdmi);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver snps_dw_hdmi_platform_driver = {
> +	.probe  = snps_dw_hdmi_probe,
> +	.remove = snps_dw_hdmi_remove,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.of_match_table = snps_dw_hdmi_dt_ids,
> +	},
> +};
> +module_platform_driver(snps_dw_hdmi_platform_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("ARC specific DW-HDMI driver extension");
> +MODULE_AUTHOR("Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>");
> -- 
> 2.21.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
