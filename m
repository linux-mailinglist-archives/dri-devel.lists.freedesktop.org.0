Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F6599A92A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 18:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E4710EB9A;
	Fri, 11 Oct 2024 16:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fg5ssYzW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4B910EB9C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 16:52:36 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BD5qBM027261;
 Fri, 11 Oct 2024 16:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YdTapo4S6feBiVPiCSeV3MciWWfF9x6DOTd25x31i+s=; b=fg5ssYzWNdH+cHD5
 pkp2DBrsWsxvN2BeVmJ7u4gPHF1XcnVeJHvQqsyRWojdGvn0aoovt34wr1hIf84/
 YlhhUWpTU5S1Ka4xHVVt/VXeBByE5KcQowkfYcO6hIyZSMAiwbE37dmrvTa9P2x+
 28Z1XJYZlMPddlOBmIxg1bCfAQpDZX1Fryerdebl6a9gwl+gLEmTkbZqep/qBvHV
 ADP9JVmp5CtjsPqQXsfIHz9YC1eJU0E42PxZHJIreogpVnnrsMZgbPCPWAKKW59d
 +TdgWeJQjTwii6R/IuLxiexvhKT3+tu7+TU8gH0W5OQuU8aOC1BF57GQ0mh262n3
 nioJ0A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426fj6v1kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2024 16:52:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BGqUVo031421
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Oct 2024 16:52:30 GMT
Received: from [10.110.78.155] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Oct
 2024 09:52:29 -0700
Message-ID: <6d67c2c6-819b-481a-8cc9-e24ef8f6c142@quicinc.com>
Date: Fri, 11 Oct 2024 09:52:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/panel: samsung-s6e88a0-ams427ap24: Add initial
 driver
To: Jakob Hauser <jahau@rocketmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>
References: <cover.1728582727.git.jahau@rocketmail.com>
 <d36d0d152c509b78d02f9f7adbea665c0c863446.1728582727.git.jahau@rocketmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <d36d0d152c509b78d02f9f7adbea665c0c863446.1728582727.git.jahau@rocketmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Ycvy_0ng3J6UYrpz85-OCgtoylUA1SbQ
X-Proofpoint-ORIG-GUID: Ycvy_0ng3J6UYrpz85-OCgtoylUA1SbQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1011 mlxscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410110117
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



On 10/10/2024 11:31 AM, Jakob Hauser wrote:
> This initial part of the panel driver was mostly generated by the
> "linux-mdss-dsi-panel-driver-generator" tool [1], reading downstream
> Android kernel file "dsi_panel_S6E88A0_AMS427AP24_qhd_octa_video.dtsi" [2].
> 
> On top of the generic output of the tool, there were a couple of changes
> applied:
> - Added mipi_dsi_dcs_set_display_on() to function s6e88a0_ams427ap24_on(),
>    otherwise the display does not show up.
> - In functions s6e88a0_ams427ap24_on() and s6e88a0_ams427ap24_off()
>    changed DSI commands to multi context and used "accum_err" returns.
> - In functions s6e88a0_ams427ap24_on() and s6e88a0_ams427ap24_off() replaced
>    msleep() by mipi_dsi_msleep().
> - The function s6e88a0_ams427ap24_get_modes() was changed to make use of
>    drm_connector_helper_get_modes_fixed(). This also required to include
>    drm/drm_probe_helper.h.
> - In function s6e88a0_ams427ap24_probe() registring the regulators was changed
>    to devm_regulator_bulk_get_const(). This required to change supplies in struct
>    s6e88a0_ams427ap24 to a pointer.
> 
> Coulnd't read out RAW EDID, /sys/class/drm/card0-DSI-1/edid is empty.
> 
> [1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> [2] https://github.com/msm8916-mainline/linux-downstream/blob/GT-I9195I/drivers/video/msm/mdss/samsung/S6E88A0_AMS427AP24/dsi_panel_S6E88A0_AMS427AP24_qhd_octa_video.dtsi
> 
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |   9 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   .../panel/panel-samsung-s6e88a0-ams427ap24.c  | 261 ++++++++++++++++++
>   3 files changed, 271 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index ddfaa99ea9dd..fa6a8c6cac5b 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -623,6 +623,15 @@ config DRM_PANEL_SAMSUNG_AMS639RQ08
>   	  Say Y or M here if you want to enable support for the
>   	  Samsung AMS639RQ08 FHD Plus (2340x1080@60Hz) CMD mode panel.
>   
> +config DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24
> +	tristate "Samsung AMS427AP24 panel with S6E88A0 controller"
> +	depends on GPIOLIB && OF && REGULATOR
> +	depends on DRM_MIPI_DSI
> +	help
> +	  Say Y here if you want to enable support for Samsung AMS427AP24 panel
> +	  with S6E88A0 controller (found in Samsung Galaxy S4 Mini Value Edition
> +	  GT-I9195I). To compile this driver as a module, choose M here.
> +
>   config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
>   	tristate "Samsung AMS452EF01 panel with S6E88A0 DSI video mode controller"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 4b5eaf111676..3002087c26d1 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -76,6 +76,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03) += panel-samsung-s6e63j0x03.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0) += panel-samsung-s6e63m0.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_SPI) += panel-samsung-s6e63m0-spi.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI) += panel-samsung-s6e63m0-dsi.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24) += panel-samsung-s6e88a0-ams427ap24.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams452ef01.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> new file mode 100644
> index 000000000000..182ba8c347e2
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> @@ -0,0 +1,261 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Samsung AMS427AP24 panel with S6E88A0 controller
> + * Copyright (c) 2024 Jakob Hauser <jahau@rocketmail.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +struct s6e88a0_ams427ap24 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct regulator_bulk_data *supplies;
> +	struct gpio_desc *reset_gpio;
> +	bool prepared;

Hi Jakob,

I think you can drop the `prepared` here as it should be handled by 
framework now [1]

Thanks,

Jessica Zhang

[1] 
https://elixir.bootlin.com/linux/v6.11.3/source/include/drm/drm_panel.h#L262

> +};
> +
> +const struct regulator_bulk_data s6e88a0_ams427ap24_supplies[] = {
> +	{ .supply = "vdd3" },
> +	{ .supply = "vci" },
> +};
> +
> +static inline
> +struct s6e88a0_ams427ap24 *to_s6e88a0_ams427ap24(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct s6e88a0_ams427ap24, panel);
> +}
> +
> +static void s6e88a0_ams427ap24_reset(struct s6e88a0_ams427ap24 *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(18000, 19000);
> +}
> +
> +static int s6e88a0_ams427ap24_on(struct s6e88a0_ams427ap24 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x13);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfd, 0x18);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x30);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc, 0x4c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x03, 0x0d);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0xa5, 0xa5);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca,
> +				     0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x80,
> +				     0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
> +				     0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
> +				     0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
> +				     0x80, 0x80, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2,
> +				     0x40, 0x08, 0x20, 0x00, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x28, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf7, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int s6e88a0_ams427ap24_off(struct s6e88a0_ams427ap24 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int s6e88a0_ams427ap24_prepare(struct drm_panel *panel)
> +{
> +	struct s6e88a0_ams427ap24 *ctx = to_s6e88a0_ams427ap24(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	if (ctx->prepared)
> +		return 0;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(s6e88a0_ams427ap24_supplies),
> +				    ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	s6e88a0_ams427ap24_reset(ctx);
> +
> +	ret = s6e88a0_ams427ap24_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_bulk_disable(ARRAY_SIZE(s6e88a0_ams427ap24_supplies),
> +				       ctx->supplies);
> +		return ret;
> +	}
> +
> +	ctx->prepared = true;
> +	return 0;
> +}
> +
> +static int s6e88a0_ams427ap24_unprepare(struct drm_panel *panel)
> +{
> +	struct s6e88a0_ams427ap24 *ctx = to_s6e88a0_ams427ap24(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	if (!ctx->prepared)
> +		return 0;
> +
> +	ret = s6e88a0_ams427ap24_off(ctx);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(s6e88a0_ams427ap24_supplies),
> +			       ctx->supplies);
> +
> +	ctx->prepared = false;
> +	return 0;
> +}
> +
> +static const struct drm_display_mode s6e88a0_ams427ap24_mode = {
> +	.clock = (540 + 94 + 4 + 18) * (960 + 12 + 1 + 3) * 60 / 1000,
> +	.hdisplay = 540,
> +	.hsync_start = 540 + 94,
> +	.hsync_end = 540 + 94 + 4,
> +	.htotal = 540 + 94 + 4 + 18,
> +	.vdisplay = 960,
> +	.vsync_start = 960 + 12,
> +	.vsync_end = 960 + 12 + 1,
> +	.vtotal = 960 + 12 + 1 + 3,
> +	.width_mm = 55,
> +	.height_mm = 95,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static int s6e88a0_ams427ap24_get_modes(struct drm_panel *panel,
> +					struct drm_connector *connector)
> +{
> +	return drm_connector_helper_get_modes_fixed(connector,
> +						    &s6e88a0_ams427ap24_mode);
> +}
> +
> +static const struct drm_panel_funcs s6e88a0_ams427ap24_panel_funcs = {
> +	.prepare = s6e88a0_ams427ap24_prepare,
> +	.unprepare = s6e88a0_ams427ap24_unprepare,
> +	.get_modes = s6e88a0_ams427ap24_get_modes,
> +};
> +
> +static int s6e88a0_ams427ap24_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct s6e88a0_ams427ap24 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ret = devm_regulator_bulk_get_const(dev,
> +				      ARRAY_SIZE(s6e88a0_ams427ap24_supplies),
> +				      s6e88a0_ams427ap24_supplies,
> +				      &ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 2;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_MODE_NO_EOT_PACKET;
> +
> +	drm_panel_init(&ctx->panel, dev, &s6e88a0_ams427ap24_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.prepare_prev_first = true;
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void s6e88a0_ams427ap24_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct s6e88a0_ams427ap24 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id s6e88a0_ams427ap24_of_match[] = {
> +	{ .compatible = "samsung,s6e88a0-ams427ap24" },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, s6e88a0_ams427ap24_of_match);
> +
> +static struct mipi_dsi_driver s6e88a0_ams427ap24_driver = {
> +	.probe = s6e88a0_ams427ap24_probe,
> +	.remove = s6e88a0_ams427ap24_remove,
> +	.driver = {
> +		.name = "panel-s6e88a0-ams427ap24",
> +		.of_match_table = s6e88a0_ams427ap24_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(s6e88a0_ams427ap24_driver);
> +
> +MODULE_AUTHOR("Jakob Hauser <jahau@rocketmail.com>");
> +MODULE_DESCRIPTION("Samsung AMS427AP24 panel with S6E88A0 controller");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.39.5
> 

