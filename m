Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 865321B2BB0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 17:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C1B6E1A2;
	Tue, 21 Apr 2020 15:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC6B6E1A2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 15:55:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 188so4139376wmc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 08:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GhBIbUior2q4TR3qEaeoVKdQqxLMwUKQTHJUIa/lPXs=;
 b=t3ugB6acScgCP8RAjyWoQEynvqJskpkreswJE7RDBWAu32LmrxGaX/YoSAIssmJjv5
 XLbD0NmslPejCm+oX/GCtBEf7lcTvsyKO4OsEHK5TPECp7FFr/lGSOrSLr7gTGLXF1aF
 DiyhflZB0wbWcasEomQFwzWlr92HgozAiBIVy03/02oQtUUcsZKV6p73g4gMqVWMLJ0L
 /PPgp9A6ER4xqxJLHGw+W2mk0cr6jQz3lJQLKb9lHSmz+KRA3ec9Z/zAWa0lR1q9Vpmm
 wkH7QCJrWSCurP5BGVZ6z7lcLeDjoZ2w7M07pCtvw7+ejaSZ9XgiLKrqZWxVr3podGgL
 AfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GhBIbUior2q4TR3qEaeoVKdQqxLMwUKQTHJUIa/lPXs=;
 b=kSl2yqid3CBZ/IgHFhF/VJPZ+70c1DxXc9uXC41GRX4WmNJxfvsrMKC8cEwcFWElnM
 Kpgk8K7f+Ib9LBJkdCGBlxnBB+zZqG/4MhIaMDeWftuSUb5zJdgJkWx2STAY5i3+b1Sy
 HhCq8ien6eLPwzrkcYLx/IiNtrPR7EHXJ9nE9x/emd9KOHcRNwkEJw4RgMDYJOb/S8Al
 CTjDPcUGG8cxSbb/IBwL9NNJ4pdaNG4fLndsPFy2HU/xjfYQTXByF8Pb0hqoZIHlw1Nk
 8MencmrBxYyfGG/pOXS1UzcEi9HGlz+P+oYt3GWtuoNxVa287VACZBliAXyYWd+SScp6
 RPug==
X-Gm-Message-State: AGi0PubM13OKWCUwOXx/Mzw7WGP+GBNcMhSRTuL55YhVsOxXSbpN5EQ/
 Hygov46vhHTQUqjJGlXOiYegvA==
X-Google-Smtp-Source: APiQypLOt2BmWNbj65l6Ky1ouFJm3HDOTWIkjJwALfa4V5NO7uAyB5tHLaW7XMTRFJVBexe3hN6k4Q==
X-Received: by 2002:a1c:790e:: with SMTP id l14mr5426387wme.174.1587484540962; 
 Tue, 21 Apr 2020 08:55:40 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56?
 ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id h6sm4140261wmf.31.2020.04.21.08.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 08:55:39 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] DRM: ARC: add HDMI 2.0 TX encoder support
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 dri-devel@lists.freedesktop.org, Alexey Brodkin
 <Alexey.Brodkin@synopsys.com>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20200414232929.22788-1-Eugeniy.Paltsev@synopsys.com>
 <20200414232929.22788-2-Eugeniy.Paltsev@synopsys.com>
 <20200415173320.GG3456981@phenom.ffwll.local>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <267d49d8-a73a-0317-cb50-0f63f0ced049@baylibre.com>
Date: Tue, 21 Apr 2020 17:55:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200415173320.GG3456981@phenom.ffwll.local>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/04/2020 19:33, Daniel Vetter wrote:
> On Wed, Apr 15, 2020 at 02:29:28AM +0300, Eugeniy Paltsev wrote:
>> The Synopsys ARC SoCs (like HSDK4xD) include on-chip DesignWare HDMI
>> encoders. Support them with a platform driver to provide platform glue
>> data to the dw-hdmi driver.
>>
>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
>> ---
>>  MAINTAINERS                       |   6 ++
>>  drivers/gpu/drm/Makefile          |   2 +-
>>  drivers/gpu/drm/arc/Kconfig       |   7 ++
>>  drivers/gpu/drm/arc/Makefile      |   1 +
>>  drivers/gpu/drm/arc/arc-dw-hdmi.c | 116 ++++++++++++++++++++++++++++++
>>  5 files changed, 131 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/arc/arc-dw-hdmi.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a6fbdf354d34..2aaed1190370 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1258,6 +1258,12 @@ S:	Supported
>>  F:	drivers/gpu/drm/arc/
>>  F:	Documentation/devicetree/bindings/display/snps,arcpgu.txt
>>  
>> +ARC DW HDMI DRIVER
>> +M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
>> +S:	Supported
>> +F:	drivers/gpu/drm/arc/arc-dw-hdmi.c
>> +F:	Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
>> +
>>  ARCNET NETWORK LAYER
>>  M:	Michael Grzeschik <m.grzeschik@pengutronix.de>
>>  L:	netdev@vger.kernel.org
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 6493088a0fdd..5b0bcf7f45cd 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -109,7 +109,7 @@ obj-y			+= panel/
>>  obj-y			+= bridge/
>>  obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
>>  obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
>> -obj-$(CONFIG_DRM_ARCPGU)+= arc/
>> +obj-y			+= arc/
>>  obj-y			+= hisilicon/
>>  obj-$(CONFIG_DRM_ZTE)	+= zte/
>>  obj-$(CONFIG_DRM_MXSFB)	+= mxsfb/
>> diff --git a/drivers/gpu/drm/arc/Kconfig b/drivers/gpu/drm/arc/Kconfig
>> index e8f3d63e0b91..baec9d2a4fba 100644
>> --- a/drivers/gpu/drm/arc/Kconfig
>> +++ b/drivers/gpu/drm/arc/Kconfig
>> @@ -8,3 +8,10 @@ config DRM_ARCPGU
>>  	  Choose this option if you have an ARC PGU controller.
>>  
>>  	  If M is selected the module will be called arcpgu.
>> +
>> +config DRM_ARC_DW_HDMI
>> +	tristate "ARC DW HDMI"
>> +	depends on DRM && OF
>> +	select DRM_DW_HDMI
>> +	help
>> +	  Synopsys DW HDMI driver for various ARC development boards
>> diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
>> index c7028b7427b3..7a156d8c2c3c 100644
>> --- a/drivers/gpu/drm/arc/Makefile
>> +++ b/drivers/gpu/drm/arc/Makefile
>> @@ -1,3 +1,4 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  arcpgu-y := arcpgu_crtc.o arcpgu_hdmi.o arcpgu_sim.o arcpgu_drv.o
>>  obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
>> +obj-$(CONFIG_DRM_ARC_DW_HDMI) += arc-dw-hdmi.o
>> diff --git a/drivers/gpu/drm/arc/arc-dw-hdmi.c b/drivers/gpu/drm/arc/arc-dw-hdmi.c
>> new file mode 100644
>> index 000000000000..46a6ee09b302
>> --- /dev/null
>> +++ b/drivers/gpu/drm/arc/arc-dw-hdmi.c
>> @@ -0,0 +1,116 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +//
>> +// Synopsys DW HDMI driver for various ARC development boards
>> +//
>> +// Copyright (C) 2020 Synopsys
>> +// Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
>> +
>> +#include <linux/component.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <drm/bridge/dw_hdmi.h>
>> +#include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_edid.h>
>> +#include <drm/drm_encoder_slave.h>
>> +#include <drm/drm_of.h>
>> +
>> +static const struct dw_hdmi_mpll_config snps_hdmi_mpll_cfg[] = {
>> +	{
>> +		27000000, {
>> +			{ 0x00B3, 0x0000 },
>> +			{ 0x00B3, 0x0000 },
>> +			{ 0x00B3, 0x0000 }
>> +		},
>> +	}, {
>> +		74250000, {
>> +			{ 0x0072, 0x0001},
>> +			{ 0x0072, 0x0001},
>> +			{ 0x0072, 0x0001}
>> +		},
>> +	}, {
>> +		148500000, {
>> +			{ 0x0051, 0x0002},
>> +			{ 0x0051, 0x0002},
>> +			{ 0x0051, 0x0002}
>> +		},
>> +	}, {
>> +		~0UL, {
>> +			{ 0x00B3, 0x0000 },
>> +			{ 0x00B3, 0x0000 },
>> +			{ 0x00B3, 0x0000 },
>> +		},
>> +	}
>> +};
>> +
>> +static const struct dw_hdmi_curr_ctrl snps_hdmi_cur_ctr[] = {
>> +	/* pixelclk    bpp8    bpp10   bpp12 */
>> +	{ 27000000,  { 0x0000, 0x0000, 0x0000 }, },
>> +	{ 74250000,  { 0x0008, 0x0008, 0x0008 }, },
>> +	{ 148500000, { 0x001b, 0x001b, 0x001b }, },
>> +	{ ~0UL,      { 0x0000, 0x0000, 0x0000 }, }
>> +};
>> +
>> +
>> +static const struct dw_hdmi_phy_config snps_hdmi_phy_config[] = {
>> +	/* pixelclk   symbol  term    vlev */
>> +	{ 27000000,   0x8009, 0x0004, 0x0232},
>> +	{ 74250000,   0x8009, 0x0004, 0x0232},
>> +	{ 148500000,  0x8009, 0x0004, 0x0232},
>> +	{ ~0UL,       0x8009, 0x0004, 0x0232}
>> +};
>> +
>> +static struct dw_hdmi_plat_data snps_dw_hdmi_drv_data = {
>> +	.mpll_cfg   = snps_hdmi_mpll_cfg,
>> +	.cur_ctr    = snps_hdmi_cur_ctr,
>> +	.phy_config = snps_hdmi_phy_config,
>> +};
>> +
>> +static const struct of_device_id snps_dw_hdmi_dt_ids[] = {
>> +	{ .compatible = "snps,arc-dw-hdmi-hsdk", .data = &snps_dw_hdmi_drv_data },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, snps_dw_hdmi_dt_ids);
>> +
>> +static int snps_dw_hdmi_probe(struct platform_device *pdev)
>> +{
>> +	const struct dw_hdmi_plat_data *plat_data;
>> +	const struct of_device_id *match;
>> +	struct dw_hdmi *hdmi;
>> +
>> +	if (!pdev->dev.of_node)
>> +		return -ENODEV;
>> +
>> +	match = of_match_node(snps_dw_hdmi_dt_ids, pdev->dev.of_node);
>> +	plat_data = match->data;
>> +
>> +	hdmi = dw_hdmi_probe(pdev, plat_data);
> 
> So this is kinda not how bridge drivers are supposed to be done nowadays,
> direct calling into the driver was the old way, and dw-hdmi still works
> like that. Modern way is roughly
> - bridge drivers bind automatically to any bridge they support
> - bridge drivers publish a bridge with drm_bridge_add()
> - the driver using the bridge fishes out with dt magic using
>   of_drm_find_bridge() or another of the related of_ functions

dw-hdmi is an IP, with some platform specific code and arrays to make it work
on very different systems, thus we can't use this scheme everywhere....

Some platforms (like r-car) uses the "right" model because the IP is integrated
as-is with the default PHY and as an independent IP on the system.

It's definitely not the case on Rockchip/Amlogic/Allwinner systems,
and even worse on Amlogic system having a glue on top of the IP, and a
custom PHY instead of the Synopsys PHY.

Thus it would be great this would be the case on a Synopsys SoC... but like
other platforms they have platform specific parameters.

All this has been discussed and reviewed a few years ago, I would
personally prefer "fishing out a bridge using dt magic" instead having
1k glue code around the IP.

Neil

> 
> I know a bit late, just spotted this because you brought your series here
> up in my arc cleanup series, but can you pls look into adjusting
> accordingly?
> 
> I shouldn't take more than moving this binding here into the dw-hdmi
> driver, and switching arc itself over to the of_drm_find_bridge() call.
> That way we could slowly work to transform old bridge drivers like dw-hdmi
> to the new way, instead of adding more cases that will never get
> converted.
> 
> Other upside is that arc stays a neat&tiny driver :-)
> 
> Thanks, Daniel
> 
>> +	if (IS_ERR(hdmi))
>> +		return PTR_ERR(hdmi);
>> +
>> +	platform_set_drvdata(pdev, hdmi);
>> +
>> +	return 0;
>> +}
>> +
>> +static int snps_dw_hdmi_remove(struct platform_device *pdev)
>> +{
>> +	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
>> +
>> +	dw_hdmi_remove(hdmi);
>> +
>> +	return 0;
>> +}
>> +
>> +static struct platform_driver snps_dw_hdmi_platform_driver = {
>> +	.probe  = snps_dw_hdmi_probe,
>> +	.remove = snps_dw_hdmi_remove,
>> +	.driver = {
>> +		.name = KBUILD_MODNAME,
>> +		.of_match_table = snps_dw_hdmi_dt_ids,
>> +	},
>> +};
>> +module_platform_driver(snps_dw_hdmi_platform_driver);
>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DESCRIPTION("ARC specific DW-HDMI driver extension");
>> +MODULE_AUTHOR("Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>");
>> -- 
>> 2.21.1
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
