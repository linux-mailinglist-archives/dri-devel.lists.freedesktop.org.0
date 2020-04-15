Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7711AAF98
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 19:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09D76EA44;
	Wed, 15 Apr 2020 17:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336AB6EA44
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 17:33:25 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y24so548754wma.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 10:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rkck/HArmjgepuHn4NJVu+OJYGwshBlSqBTd3E9eO9s=;
 b=aXAmvMC38ItFa/I/ODNZFZ8Nrx7rhomjxXCK4J5+GBQd1yCzGiDpI4dIGYKTYh2tJN
 VgaKRL1AocDuGGpa+VM0K6CIIoL7tYRLv7yvbYFf+kfSv+MtKPOJkdAv3gmwpi8cCspn
 A/2EOdtw7HqI2BzdJb3cX7WC5xqxOjIvuzdDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Rkck/HArmjgepuHn4NJVu+OJYGwshBlSqBTd3E9eO9s=;
 b=AdaP3ZIYEYNaktL7kdFkYG5fZbHE0JlcMo5CgGVb5a9RPUstug1s2jplRDK1uYcjmQ
 gdEtxXq07dZNJXjImYJgXe7Vliy47Wb0ArHyYxYgTwxHgZTYDX2HeRolCrzpnTM1h2+W
 hYsJM8tKWkKZnEtipnoaVEecVo9tqIKddKniGOqvDRj3NFpCr7tvmy09gVhp5EjWbkKf
 kmTQv94S4mMigiRYAdlOBj/hxEdKTFWEZkXryFJNDlgqt6oZF2cD/ASOd/PGVccA/hit
 OdHrY4uro+GQbPAVhLY7k2ZVXMzwvNUZPCNul00AEJfMZHPMvweZFWqhimYz0Gt3tX+3
 QfrQ==
X-Gm-Message-State: AGi0PuapoJih85vTA91HLZgte73itzhv7Al4VRfLMbfdMRBnGeEWTmlL
 Std3A3DaiEruJXqQ1h9deT25sA==
X-Google-Smtp-Source: APiQypIdl3rsjfv/Is2Bm6qZeSmQZagNruwgJ+J30Wx3YvhKi8ugAsblhQ2s/uQ8MCyGKbgMoJvuIQ==
X-Received: by 2002:a1c:1f96:: with SMTP id f144mr297157wmf.114.1586972003719; 
 Wed, 15 Apr 2020 10:33:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z8sm3996060wrr.40.2020.04.15.10.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 10:33:23 -0700 (PDT)
Date: Wed, 15 Apr 2020 19:33:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH v3 1/2] DRM: ARC: add HDMI 2.0 TX encoder support
Message-ID: <20200415173320.GG3456981@phenom.ffwll.local>
Mail-Followup-To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20200414232929.22788-1-Eugeniy.Paltsev@synopsys.com>
 <20200414232929.22788-2-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414232929.22788-2-Eugeniy.Paltsev@synopsys.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
 linux-snps-arc@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 02:29:28AM +0300, Eugeniy Paltsev wrote:
> The Synopsys ARC SoCs (like HSDK4xD) include on-chip DesignWare HDMI
> encoders. Support them with a platform driver to provide platform glue
> data to the dw-hdmi driver.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  MAINTAINERS                       |   6 ++
>  drivers/gpu/drm/Makefile          |   2 +-
>  drivers/gpu/drm/arc/Kconfig       |   7 ++
>  drivers/gpu/drm/arc/Makefile      |   1 +
>  drivers/gpu/drm/arc/arc-dw-hdmi.c | 116 ++++++++++++++++++++++++++++++
>  5 files changed, 131 insertions(+), 1 deletion(-)
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
> index 000000000000..46a6ee09b302
> --- /dev/null
> +++ b/drivers/gpu/drm/arc/arc-dw-hdmi.c
> @@ -0,0 +1,116 @@
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
> +static struct dw_hdmi_plat_data snps_dw_hdmi_drv_data = {
> +	.mpll_cfg   = snps_hdmi_mpll_cfg,
> +	.cur_ctr    = snps_hdmi_cur_ctr,
> +	.phy_config = snps_hdmi_phy_config,
> +};
> +
> +static const struct of_device_id snps_dw_hdmi_dt_ids[] = {
> +	{ .compatible = "snps,arc-dw-hdmi-hsdk", .data = &snps_dw_hdmi_drv_data },
> +	{ /* sentinel */ }
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

So this is kinda not how bridge drivers are supposed to be done nowadays,
direct calling into the driver was the old way, and dw-hdmi still works
like that. Modern way is roughly
- bridge drivers bind automatically to any bridge they support
- bridge drivers publish a bridge with drm_bridge_add()
- the driver using the bridge fishes out with dt magic using
  of_drm_find_bridge() or another of the related of_ functions

I know a bit late, just spotted this because you brought your series here
up in my arc cleanup series, but can you pls look into adjusting
accordingly?

I shouldn't take more than moving this binding here into the dw-hdmi
driver, and switching arc itself over to the of_drm_find_bridge() call.
That way we could slowly work to transform old bridge drivers like dw-hdmi
to the new way, instead of adding more cases that will never get
converted.

Other upside is that arc stays a neat&tiny driver :-)

Thanks, Daniel

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
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
