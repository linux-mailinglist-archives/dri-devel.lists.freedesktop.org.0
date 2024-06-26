Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC0F919971
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 22:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD63210E253;
	Wed, 26 Jun 2024 20:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZuoYGrM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD7110E065
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 20:51:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfQsH023291;
 Wed, 26 Jun 2024 20:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eGkcYlZ1hrDD6PGQ9acEff1OOTfcgPlVrlfbopl6WXQ=; b=ZuoYGrM/l/zSjDXy
 ei7miM8mkBrS1KzfB7HfbbfFtFCGYbIZbwSmCEuJX93E0csz1T47wsWaPLT7MbOg
 RrEgzX2QgAlBZL70RUisekO0UMphevYrPbV1dU3C6h26VeA+3+RgAH3Pu78880DO
 Gcr/E7zrWBlvk62EPSnLhCibJIBJpCPuylQSGCsddvB+TEPWSrj7B2MPVYShX3fd
 hI+2DQvzBMLGBW7nBuJi9RSX/TcgNpxUqdRBZlhrfeg8dO/2qxsz8NsIfKMdPnCr
 +qeK0iJ/m1bRecjZ1UMpwY4HDrrBY5wzrOpl+y3CCVoy/QOwqeCp15/8w/U4vn1L
 kJ2xoA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywpu1a5f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 20:50:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45QKotd1014257
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 20:50:55 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 13:50:55 -0700
Message-ID: <77f511aa-039d-4b01-abad-30f4e2cdcc07@quicinc.com>
Date: Wed, 26 Jun 2024 13:50:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/panel: add Ilitek ILI9806E panel driver
To: Michael Walle <mwalle@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>
References: <20240626144433.3097793-1-mwalle@kernel.org>
 <20240626144433.3097793-3-mwalle@kernel.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240626144433.3097793-3-mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: td0yIwrjBt9m8GLdWYJXQ8HgtZBsVxSC
X-Proofpoint-ORIG-GUID: td0yIwrjBt9m8GLdWYJXQ8HgtZBsVxSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260153
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



On 6/26/2024 7:44 AM, Michael Walle wrote:
> The Ortustech COM35H3P70ULC panel is based on the ILI9806E DSI display
> controller.
> 
> Co-developed-by: Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>
> Signed-off-by: Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   MAINTAINERS                                   |   5 +
>   drivers/gpu/drm/panel/Kconfig                 |   9 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-ilitek-ili9806e.c | 402 ++++++++++++++++++
>   4 files changed, 417 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e2d8fdda1737..61352f26f2d9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7003,6 +7003,11 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/ilitek,ili9805.yaml
>   F:	drivers/gpu/drm/panel/panel-ilitek-ili9805.c
>   
> +DRM DRIVER FOR ILITEK ILI9806E PANELS
> +M:	Michael Walle <mwalle@kernel.org>
> +S:	Maintained
> +F:	drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
> +
>   DRM DRIVER FOR JADARD JD9365DA-H3 MIPI-DSI LCD PANELS
>   M:	Jagan Teki <jagan@edgeble.ai>
>   S:	Maintained
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index bf4eadfe21cb..904a928bc60e 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -205,6 +205,15 @@ config DRM_PANEL_ILITEK_ILI9805
>   	  Say Y if you want to enable support for panels based on the
>   	  Ilitek ILI9805 controller.
>   
> +config DRM_PANEL_ILITEK_ILI9806E
> +	tristate "Ilitek ILI9806E-based panels"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y if you want to enable support for panels based on the
> +	  Ilitek ILI9806E controller.
> +
>   config DRM_PANEL_ILITEK_ILI9881C
>   	tristate "Ilitek ILI9881C-based panels"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 051b75b3df7b..12ce91416849 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9805) += panel-ilitek-ili9805.o
> +obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9806E) += panel-ilitek-ili9806e.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9881C) += panel-ilitek-ili9881c.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9882T) += panel-ilitek-ili9882t.o
>   obj-$(CONFIG_DRM_PANEL_INNOLUX_EJ030NA) += panel-innolux-ej030na.o
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c b/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
> new file mode 100644
> index 000000000000..e4a44cd26c4d
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9806e.c
> @@ -0,0 +1,402 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <video/mipi_display.h>
> +
> +struct panel_desc {
> +	const struct drm_display_mode *display_mode;
> +	unsigned long mode_flags;
> +	enum mipi_dsi_pixel_format format;
> +	unsigned int lanes;
> +	void (*init_sequence)(struct mipi_dsi_multi_context *ctx);
> +};
> +
> +struct ili9806e_panel {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[2];
> +	const struct panel_desc *desc;
> +	enum drm_panel_orientation orientation;
> +};
> +
> +static const char * const regulator_names[] = {
> +	"vdd",
> +	"vccio",
> +};
> +
> +static inline struct ili9806e_panel *to_ili9806e_panel(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct ili9806e_panel, panel);
> +}
> +
> +static int ili9806e_power_on(struct ili9806e_panel *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	int ret;
> +
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(&dsi->dev, "regulator bulk enable failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	usleep_range(10000, 20000);
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(10000, 20000);
> +
> +	return 0;
> +}
> +
> +static int ili9806e_power_off(struct ili9806e_panel *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	int ret;
> +
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +
> +	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret)
> +		dev_err(&dsi->dev, "regulator bulk disable failed: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int ili9806e_on(struct ili9806e_panel *ili9806e)
> +{
> +	struct mipi_dsi_multi_context ctx = { .dsi = ili9806e->dsi };
> +
> +	if (ili9806e->desc->init_sequence)
> +		ili9806e->desc->init_sequence(&ctx);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
> +	mipi_dsi_msleep(&ctx, 120);
> +	mipi_dsi_dcs_set_display_on_multi(&ctx);
> +
> +	return ctx.accum_err;
> +}
> +
> +static int ili9806e_off(struct ili9806e_panel *panel)
> +{
> +	struct mipi_dsi_multi_context ctx = { .dsi = panel->dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&ctx);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
> +	mipi_dsi_msleep(&ctx, 120);
> +
> +	return ctx.accum_err;
> +}
> +
> +static int ili9806e_prepare(struct drm_panel *panel)
> +{
> +	struct ili9806e_panel *ctx = to_ili9806e_panel(panel);
> +	int ret;
> +
> +	ret = ili9806e_power_on(ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ili9806e_on(ctx);
> +	if (ret < 0) {
> +		ili9806e_power_off(ctx);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ili9806e_unprepare(struct drm_panel *panel)
> +{
> +	struct ili9806e_panel *ctx = to_ili9806e_panel(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	int ret;
> +
> +	ili9806e_off(ctx);
> +
> +	ret = ili9806e_power_off(ctx);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "power off failed: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int ili9806e_get_modes(struct drm_panel *panel,
> +			      struct drm_connector *connector)
> +{
> +	struct ili9806e_panel *ctx = to_ili9806e_panel(panel);
> +	const struct drm_display_mode *mode = ctx->desc->display_mode;
> +
> +	return drm_connector_helper_get_modes_fixed(connector, mode);
> +}
> +
> +static enum drm_panel_orientation ili9806e_get_orientation(struct drm_panel *panel)
> +{
> +	struct ili9806e_panel *ctx = to_ili9806e_panel(panel);
> +
> +	return ctx->orientation;
> +}
> +
> +static const struct drm_panel_funcs ili9806e_funcs = {
> +	.prepare = ili9806e_prepare,
> +	.unprepare = ili9806e_unprepare,
> +	.get_modes = ili9806e_get_modes,
> +	.get_orientation = ili9806e_get_orientation,
> +};
> +
> +static int ili9806e_dsi_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct ili9806e_panel *ctx;
> +	int i, ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->desc = device_get_match_data(dev);
> +
> +	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++)
> +		ctx->supplies[i].supply = regulator_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +	ctx->dsi = dsi;
> +
> +	dsi->mode_flags = ctx->desc->mode_flags;
> +	dsi->format = ctx->desc->format;
> +	dsi->lanes = ctx->desc->lanes;
> +
> +	drm_panel_init(&ctx->panel, dev, &ili9806e_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +
> +	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get orientation\n");
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	ctx->panel.prepare_prev_first = true;
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +		drm_panel_remove(&ctx->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void ili9806e_dsi_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct ili9806e_panel *ctx = mipi_dsi_get_drvdata(dsi);
> +
> +	mipi_dsi_detach(dsi);
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static void com35h3p70ulc_init(struct mipi_dsi_multi_context *ctx)
> +{
> +	/* Switch to page 1 */
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x01);
> +	/* Interface Settings */
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x08, 0x18);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x21, 0x01);
> +	/* Panel Settings */
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x30, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x31, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x60, 0x0d);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x61, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x62, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x63, 0x09);
> +	/* Power Control */
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x40, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x41, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x42, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x43, 0x89);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x44, 0x8e);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x45, 0xd9);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x46, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x47, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x50, 0x90);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x51, 0x90);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x56, 0x00);
> +	/* Gamma Settings */
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xa0, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xa1, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xa2, 0x13);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xa3, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xa4, 0x0a);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xa5, 0x0d);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xa6, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xa7, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xa8, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xa9, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xaa, 0x15);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xab, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xac, 0x12);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xad, 0x28);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xae, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xaf, 0x14);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xc0, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xc1, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xc2, 0x13);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xc3, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xc4, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xc5, 0x0d);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xc6, 0x0c);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xc7, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xc8, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xc9, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xca, 0x14);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xcb, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xcc, 0x0f);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xcd, 0x21);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xce, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xcf, 0x0a);
> +
> +	/* Switch to page 7 */
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x07);
> +	/* Power Control */
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x06, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x18, 0x1d);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x17, 0x32);
> +
> +	/* Switch to page 6 */
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x06);
> +	/* GIP settings */
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x00, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x01, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x02, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x03, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x04, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x05, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x06, 0x88);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x07, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x08, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x09, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x0a, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x0b, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x0c, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x0d, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x0e, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x0f, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x10, 0x55);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x11, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x12, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x13, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x14, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x15, 0x43);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x16, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x17, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x18, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x19, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x1a, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x1b, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x1c, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x1d, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x20, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x21, 0x23);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x22, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x23, 0x67);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x24, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x25, 0x23);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x26, 0x45);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x27, 0x67);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x30, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x31, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x32, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x33, 0x88);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x34, 0xaa);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x35, 0xbb);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x36, 0x66);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x37, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x38, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x39, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x3a, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x3b, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x3c, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x3d, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x3e, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x3f, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x40, 0x22);
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x53, 0x12);
> +
> +	/* Switch to page 0 */
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0xff, 0xff, 0x98, 0x06, 0x04, 0x00);
> +	/* Interface Pixel format */
> +	mipi_dsi_dcs_write_seq_multi(ctx, 0x3a, 0x60);
> +};
> +
> +static const struct drm_display_mode com35h3p70ulc_default_mode = {
> +	.clock = 22400,
> +	.hdisplay = 480,
> +	.hsync_start = 480 + 16,
> +	.hsync_end = 480 + 16 + 16,
> +	.htotal = 480 + 16 + 16 + 16,
> +	.vdisplay = 640,
> +	.vsync_start = 640 + 52,
> +	.vsync_end = 640 + 52 + 4,
> +	.vtotal = 640 + 52 + 4 + 16,
> +	.width_mm = 53,
> +	.height_mm = 71,
> +};
> +
> +static const struct panel_desc com35h3p70ulc_desc = {
> +	.init_sequence = com35h3p70ulc_init,
> +	.display_mode = &com35h3p70ulc_default_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_MODE_LPM,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.lanes = 2,
> +};
> +
> +static const struct of_device_id ili9806e_of_match[] = {
> +	{ .compatible = "ortustech,com35h3p70ulc", .data = &com35h3p70ulc_desc },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ili9806e_of_match);
> +
> +static struct mipi_dsi_driver ili9806e_dsi_driver = {
> +	.driver = {
> +		.name = "ili9806e-dsi",
> +		.of_match_table = ili9806e_of_match,
> +	},
> +	.probe = ili9806e_dsi_probe,
> +	.remove = ili9806e_dsi_remove,
> +};
> +module_mipi_dsi_driver(ili9806e_dsi_driver);
> +
> +MODULE_AUTHOR("Gunnar Dibbern <gunnar.dibbern@lht.dlh.de>");
> +MODULE_AUTHOR("Michael Walle <mwalle@kernel.org>");
> +MODULE_DESCRIPTION("Ilitek ILI9806E Controller Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.39.2
> 
