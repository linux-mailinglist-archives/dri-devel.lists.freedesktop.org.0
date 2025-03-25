Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F77A7090C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 19:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053CD10E5EC;
	Tue, 25 Mar 2025 18:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="qQTSYztu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from send217.i.mail.ru (send217.i.mail.ru [95.163.59.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9364710E295
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 18:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Content-Type:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=kWBWQmbfdRzgTOv8DcHIqnGw/ONMxvyXPCPVeHxJ564=; t=1742927497; x=1743017497; 
 b=qQTSYztuFvY8rMLz3noo8wL4hhj8ip5k16PNbLJLL1LMuo16AVnXatonNVgOwFHC6kkB642s/mm
 JoYAH+mtpeR+ROfz161M6deMl95OxPbsUk/BGHnmMnt9e8KzrtUxNSd1cchCZtbWWOajVIO6PR48P
 rByUG9pTCzsRSxzR7BE=;
Received: by exim-smtp-75f69ddc6c-x6xqg with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1tx93m-00000000Kz5-1jwD; Tue, 25 Mar 2025 21:31:35 +0300
Content-Type: multipart/alternative;
 boundary="------------Pv867qn60xTSpFqpVuZhDdjN"
Message-ID: <b619eade-f40c-4bcf-89d9-ff77461b195f@jiaxyga.com>
Date: Tue, 25 Mar 2025 21:31:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: Add Visionox G2647FB105 panel driver
To: Alexander Baransky <sanyapilot496@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250325155756.703907-1-sanyapilot496@gmail.com>
 <20250325155756.703907-3-sanyapilot496@gmail.com>
Content-Language: en-US
From: Danila Tikhonov <danila@jiaxyga.com>
In-Reply-To: <20250325155756.703907-3-sanyapilot496@gmail.com>
Authentication-Results: exim-smtp-75f69ddc6c-x6xqg;
 auth=pass smtp.auth=danila@jiaxyga.com
 smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9E1E28CC68DAD74E7B812F81BD89DD3F87E58D65A119A7CF6182A05F5380850401B25EB2D0009D3453DE06ABAFEAF6705BBAE93AE7099B8B4757D534E1AB4328F9CAD6AA93C8D19D4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AED985C8E545F588EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566F506D4AEC5146499ADAFFF6845170209B196EEF1838E72DE1DB64D78B6C734BF389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C068077CCD40B79AC98941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6783E2B6F79C23BEDCC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C2249FE5EE7C534F234F53AA81AA40904B5D9CF19DD082D7633A0C84D3B47A649675F3AA81AA40904B5D98AA50765F7900637C57200A132A3E0D0EC76A7562686271ED91E3A1F190DE8FD2E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3FD340EA919DED65B35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A5D08A1BB24E93A5695002B1117B3ED696104284E0FAA37A843E67C18142C611B7823CB91A9FED034534781492E4B8EEADEEA082C9A12FE455BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF7F7186131977239CC40A4D8A3BF1E60BA4BC43DD5E9DFECCBA57C56E92AFE5491230ACE34F2D113D7BE67F5C35D933192BD6E002E33A6A47B191EDCCBF6071B9246A83AF588D61DB146D90F64BF3396102C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVRxnlmV4XzQl/8DsHtjjpyA=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FC8A3C831BA35B5364825860F061DF21439C45E4B1931191E0B3EC8B355A210952C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
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

This is a multi-part message in MIME format.
--------------Pv867qn60xTSpFqpVuZhDdjN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/25 18:57, Alexander Baransky wrote:
> Add the driver for Visionox G2647FB105 6.47" FHD Plus CMD mode AMOLED panel
> support found in:
> - Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
> - Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)
>
> Signed-off-by: Alexander Baransky<sanyapilot496@gmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |   9 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   .../gpu/drm/panel/panel-visionox-g2647fb105.c | 277 ++++++++++++++++++
>   3 files changed, 287 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d7469c565d1d..c4de2749260d 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -977,6 +977,15 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
>   	  Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
>   	  Video Mode panel
>   
> +config DRM_PANEL_VISIONOX_G2647FB105
> +	tristate "Visionox G2647FB105"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for the Visionox
> +	  G2647FB105 (2340x1080@60Hz) AMOLED DSI cmd mode panel.
> +
>   config DRM_PANEL_VISIONOX_R66451
>   	tristate "Visionox R66451"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 7dcf72646cac..31dc893e0b16 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -99,6 +99,7 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
>   obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
>   obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
>   obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
> +obj-$(CONFIG_DRM_PANEL_VISIONOX_G2647FB105) += panel-visionox-g2647fb105.o
>   obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
>   obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += panel-visionox-vtdr6130.o
>   obj-$(CONFIG_DRM_PANEL_VISIONOX_R66451) += panel-visionox-r66451.o
> diff --git a/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c b/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
> new file mode 100644
> index 000000000000..cf80310de13c
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
> @@ -0,0 +1,277 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> + *   Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + *   Copyright (c) 2025, Alexander Baransky<sanyapilot496@gmail.com>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +
> +struct visionox_g2647fb105 {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[4];
> +};
> +
> +static inline
> +struct visionox_g2647fb105 *to_visionox_g2647fb105(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct visionox_g2647fb105, panel);
> +}
> +
> +static void visionox_g2647fb105_reset(struct visionox_g2647fb105 *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +static int visionox_g2647fb105_on(struct visionox_g2647fb105 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x32);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbe, 0x17);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbf, 0xbb);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0xdd);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0xd0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x08);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfe, 0x00);
> +
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x0000);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 100);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int visionox_g2647fb105_off(struct visionox_g2647fb105 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 50);
> +
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int visionox_g2647fb105_prepare(struct drm_panel *panel)
> +{
> +	struct visionox_g2647fb105 *ctx = to_visionox_g2647fb105(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	visionox_g2647fb105_reset(ctx);
> +
> +	ret = visionox_g2647fb105_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int visionox_g2647fb105_unprepare(struct drm_panel *panel)
> +{
> +	struct visionox_g2647fb105 *ctx = to_visionox_g2647fb105(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	ret = visionox_g2647fb105_off(ctx);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode visionox_g2647fb105_mode = {
> +	.clock = (1080 + 28 + 4 + 36) * (2340 + 8 + 4 + 4) * 60 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 28,
> +	.hsync_end = 1080 + 28 + 4,
> +	.htotal = 1080 + 28 + 4 + 36,
> +	.vdisplay = 2340,
> +	.vsync_start = 2340 + 8,
> +	.vsync_end = 2340 + 8 + 4,
> +	.vtotal = 2340 + 8 + 4 + 4,
> +	.width_mm = 69,
> +	.height_mm = 149,
> +};
> +
> +static int visionox_g2647fb105_get_modes(struct drm_panel *panel,
> +					struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &visionox_g2647fb105_mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs visionox_g2647fb105_panel_funcs = {
> +	.prepare = visionox_g2647fb105_prepare,
> +	.unprepare = visionox_g2647fb105_unprepare,
> +	.get_modes = visionox_g2647fb105_get_modes,
> +};
> +
> +static int visionox_g2647fb105_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops visionox_g2647fb105_bl_ops = {
> +	.update_status = visionox_g2647fb105_bl_update_status,
> +};
> +
> +static struct backlight_device *
> +visionox_g2647fb105_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 1023,
> +		.max_brightness = 2047,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &visionox_g2647fb105_bl_ops, &props);
> +}
> +
> +static int visionox_g2647fb105_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct visionox_g2647fb105 *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->supplies[0].supply = "vdd3p3";
> +	ctx->supplies[1].supply = "vddio";
> +	ctx->supplies[2].supply = "vsn";
> +	ctx->supplies[3].supply = "vsp";
Hello Alexander,

Why don't you want to make regulator_bulk_data a static const structure?
Please look:
https://lore.kernel.org/all/20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-2-0cae20d4c55d@linaro.org/

---
Best wishes
Danila
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +								ctx->supplies);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
> +
> +	ctx->panel.prepare_prev_first = true;
> +
> +	drm_panel_init(&ctx->panel, dev, &visionox_g2647fb105_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ctx->panel.backlight = visionox_g2647fb105_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				     "Failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = devm_mipi_dsi_attach(dev, dsi);
> +	if (ret < 0) {
> +		drm_panel_remove(&ctx->panel);
> +		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static void visionox_g2647fb105_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct visionox_g2647fb105 *ctx = mipi_dsi_get_drvdata(dsi);
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id visionox_g2647fb105_of_match[] = {
> +	{ .compatible = "visionox,g2647fb105" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, visionox_g2647fb105_of_match);
> +
> +static struct mipi_dsi_driver visionox_g2647fb105_driver = {
> +	.probe = visionox_g2647fb105_probe,
> +	.remove = visionox_g2647fb105_remove,
> +	.driver = {
> +		.name = "panel-visionox-g2647fb105",
> +		.of_match_table = visionox_g2647fb105_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(visionox_g2647fb105_driver);
> +
> +MODULE_AUTHOR("Alexander Baransky<sanyapilot496@gmail.com>");
> +MODULE_DESCRIPTION("DRM driver for Visionox G2647FB105 AMOLED DSI panel");
> +MODULE_LICENSE("GPL");
--------------Pv867qn60xTSpFqpVuZhDdjN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 3/25/25 18:57, Alexander Baransky
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250325155756.703907-3-sanyapilot496@gmail.com">
      <pre wrap="" class="moz-quote-pre">Add the driver for Visionox G2647FB105 6.47" FHD Plus CMD mode AMOLED panel
support found in:
- Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
- Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)

Signed-off-by: Alexander Baransky <a class="moz-txt-link-rfc2396E" href="mailto:sanyapilot496@gmail.com">&lt;sanyapilot496@gmail.com&gt;</a>
---
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-visionox-g2647fb105.c | 277 ++++++++++++++++++
 3 files changed, 287 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-visionox-g2647fb105.c

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d7469c565d1d..c4de2749260d 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -977,6 +977,15 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
 	  Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
 	  Video Mode panel
 
+config DRM_PANEL_VISIONOX_G2647FB105
+	tristate "Visionox G2647FB105"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for the Visionox
+	  G2647FB105 (2340x1080@60Hz) AMOLED DSI cmd mode panel.
+
 config DRM_PANEL_VISIONOX_R66451
 	tristate "Visionox R66451"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 7dcf72646cac..31dc893e0b16 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -99,6 +99,7 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
 obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
 obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
+obj-$(CONFIG_DRM_PANEL_VISIONOX_G2647FB105) += panel-visionox-g2647fb105.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += panel-visionox-vtdr6130.o
 obj-$(CONFIG_DRM_PANEL_VISIONOX_R66451) += panel-visionox-r66451.o
diff --git a/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c b/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
new file mode 100644
index 000000000000..cf80310de13c
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-visionox-g2647fb105.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+ *   Copyright (c) 2013, The Linux Foundation. All rights reserved.
+ *   Copyright (c) 2025, Alexander Baransky <a class="moz-txt-link-rfc2396E" href="mailto:sanyapilot496@gmail.com">&lt;sanyapilot496@gmail.com&gt;</a>
+ */
+
+#include &lt;linux/backlight.h&gt;
+#include &lt;linux/delay.h&gt;
+#include &lt;linux/gpio/consumer.h&gt;
+#include &lt;linux/module.h&gt;
+#include &lt;linux/of.h&gt;
+#include &lt;linux/regulator/consumer.h&gt;
+
+#include &lt;drm/drm_mipi_dsi.h&gt;
+#include &lt;drm/drm_modes.h&gt;
+#include &lt;drm/drm_panel.h&gt;
+
+struct visionox_g2647fb105 {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[4];
+};
+
+static inline
+struct visionox_g2647fb105 *to_visionox_g2647fb105(struct drm_panel *panel)
+{
+	return container_of(panel, struct visionox_g2647fb105, panel);
+}
+
+static void visionox_g2647fb105_reset(struct visionox_g2647fb105 *ctx)
+{
+	gpiod_set_value_cansleep(ctx-&gt;reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(ctx-&gt;reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+static int visionox_g2647fb105_on(struct visionox_g2647fb105 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx-&gt;dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx, 0x70, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx, 0xfe, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx, 0x4d, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx, 0xfe, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx, 0xbe, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx, 0xbf, 0xbb);
+	mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx, 0xc0, 0xdd);
+	mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx, 0xc1, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx, 0xfe, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx, 0x03, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx, 0x04, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx, 0xfe, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx, 0xc2, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&amp;dsi_ctx, 0xfe, 0x00);
+
+	mipi_dsi_dcs_set_tear_on_multi(&amp;dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	mipi_dsi_dcs_set_display_brightness_multi(&amp;dsi_ctx, 0x0000);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&amp;dsi_ctx);
+	mipi_dsi_msleep(&amp;dsi_ctx, 100);
+
+	mipi_dsi_dcs_set_display_on_multi(&amp;dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int visionox_g2647fb105_off(struct visionox_g2647fb105 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx-&gt;dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&amp;dsi_ctx);
+	mipi_dsi_msleep(&amp;dsi_ctx, 50);
+
+	mipi_dsi_dcs_enter_sleep_mode_multi(&amp;dsi_ctx);
+	mipi_dsi_msleep(&amp;dsi_ctx, 20);
+
+	return dsi_ctx.accum_err;
+}
+
+static int visionox_g2647fb105_prepare(struct drm_panel *panel)
+{
+	struct visionox_g2647fb105 *ctx = to_visionox_g2647fb105(panel);
+	struct device *dev = &amp;ctx-&gt;dsi-&gt;dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx-&gt;supplies), ctx-&gt;supplies);
+	if (ret &lt; 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	visionox_g2647fb105_reset(ctx);
+
+	ret = visionox_g2647fb105_on(ctx);
+	if (ret &lt; 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx-&gt;reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(ctx-&gt;supplies), ctx-&gt;supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int visionox_g2647fb105_unprepare(struct drm_panel *panel)
+{
+	struct visionox_g2647fb105 *ctx = to_visionox_g2647fb105(panel);
+	struct device *dev = &amp;ctx-&gt;dsi-&gt;dev;
+	int ret;
+
+	ret = visionox_g2647fb105_off(ctx);
+	if (ret &lt; 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx-&gt;reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(ctx-&gt;supplies), ctx-&gt;supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode visionox_g2647fb105_mode = {
+	.clock = (1080 + 28 + 4 + 36) * (2340 + 8 + 4 + 4) * 60 / 1000,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 28,
+	.hsync_end = 1080 + 28 + 4,
+	.htotal = 1080 + 28 + 4 + 36,
+	.vdisplay = 2340,
+	.vsync_start = 2340 + 8,
+	.vsync_end = 2340 + 8 + 4,
+	.vtotal = 2340 + 8 + 4 + 4,
+	.width_mm = 69,
+	.height_mm = 149,
+};
+
+static int visionox_g2647fb105_get_modes(struct drm_panel *panel,
+					struct drm_connector *connector)
+{
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector-&gt;dev, &amp;visionox_g2647fb105_mode);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_set_name(mode);
+
+	mode-&gt;type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+	connector-&gt;display_info.width_mm = mode-&gt;width_mm;
+	connector-&gt;display_info.height_mm = mode-&gt;height_mm;
+	drm_mode_probed_add(connector, mode);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs visionox_g2647fb105_panel_funcs = {
+	.prepare = visionox_g2647fb105_prepare,
+	.unprepare = visionox_g2647fb105_unprepare,
+	.get_modes = visionox_g2647fb105_get_modes,
+};
+
+static int visionox_g2647fb105_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	dsi-&gt;mode_flags &amp;= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	if (ret &lt; 0)
+		return ret;
+
+	dsi-&gt;mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static const struct backlight_ops visionox_g2647fb105_bl_ops = {
+	.update_status = visionox_g2647fb105_bl_update_status,
+};
+
+static struct backlight_device *
+visionox_g2647fb105_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &amp;dsi-&gt;dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 1023,
+		.max_brightness = 2047,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &amp;visionox_g2647fb105_bl_ops, &amp;props);
+}
+
+static int visionox_g2647fb105_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &amp;dsi-&gt;dev;
+	struct visionox_g2647fb105 *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx-&gt;supplies[0].supply = "vdd3p3";
+	ctx-&gt;supplies[1].supply = "vddio";
+	ctx-&gt;supplies[2].supply = "vsn";
+	ctx-&gt;supplies[3].supply = "vsp";</pre>
    </blockquote>
    Hello Alexander,<br>
    <br>
    Why don't you want to make regulator_bulk_data a static const
    structure?<br>
    Please look:<br>
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-2-0cae20d4c55d@linaro.org/">https://lore.kernel.org/all/20240828-topic-sm8x50-upstream-vtdr6130-multi-v1-2-0cae20d4c55d@linaro.org/</a><br>
    <br>
    ---<br>
    Best wishes<br>
    Danila <span style="white-space: pre-wrap"></span>
    <blockquote type="cite"
      cite="mid:20250325155756.703907-3-sanyapilot496@gmail.com">
      <pre wrap="" class="moz-quote-pre">
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx-&gt;supplies),
+								ctx-&gt;supplies);
+	if (ret &lt; 0)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
+
+	ctx-&gt;reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx-&gt;reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx-&gt;reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx-&gt;dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi-&gt;lanes = 4;
+	dsi-&gt;format = MIPI_DSI_FMT_RGB888;
+	dsi-&gt;mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
+
+	ctx-&gt;panel.prepare_prev_first = true;
+
+	drm_panel_init(&amp;ctx-&gt;panel, dev, &amp;visionox_g2647fb105_panel_funcs,
+		       DRM_MODE_CONNECTOR_DSI);
+	ctx-&gt;panel.prepare_prev_first = true;
+
+	ctx-&gt;panel.backlight = visionox_g2647fb105_create_backlight(dsi);
+	if (IS_ERR(ctx-&gt;panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx-&gt;panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&amp;ctx-&gt;panel);
+
+	ret = devm_mipi_dsi_attach(dev, dsi);
+	if (ret &lt; 0) {
+		drm_panel_remove(&amp;ctx-&gt;panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void visionox_g2647fb105_remove(struct mipi_dsi_device *dsi)
+{
+	struct visionox_g2647fb105 *ctx = mipi_dsi_get_drvdata(dsi);
+	drm_panel_remove(&amp;ctx-&gt;panel);
+}
+
+static const struct of_device_id visionox_g2647fb105_of_match[] = {
+	{ .compatible = "visionox,g2647fb105" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, visionox_g2647fb105_of_match);
+
+static struct mipi_dsi_driver visionox_g2647fb105_driver = {
+	.probe = visionox_g2647fb105_probe,
+	.remove = visionox_g2647fb105_remove,
+	.driver = {
+		.name = "panel-visionox-g2647fb105",
+		.of_match_table = visionox_g2647fb105_of_match,
+	},
+};
+module_mipi_dsi_driver(visionox_g2647fb105_driver);
+
+MODULE_AUTHOR("Alexander Baransky <a class="moz-txt-link-rfc2396E" href="mailto:sanyapilot496@gmail.com">&lt;sanyapilot496@gmail.com&gt;</a>");
+MODULE_DESCRIPTION("DRM driver for Visionox G2647FB105 AMOLED DSI panel");
+MODULE_LICENSE("GPL");
</pre>
    </blockquote>
  </body>
</html>

--------------Pv867qn60xTSpFqpVuZhDdjN--
