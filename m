Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6CC16BC7E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 09:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFD36EA5D;
	Tue, 25 Feb 2020 08:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A7F6E0E4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 05:38:30 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id d9so5007225plo.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 21:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mfqZGXgqcPFcLTJKiGeAyv3Q4QoPEUtHeOmm57Pq0Bg=;
 b=LcO6iKTpqfabTXwgfFeBl/Y6LYETyCNilbjx+m8rEe0L0O9Bog/7KxqhnOR8C5ALRz
 qX5DJ44C+w8rGQWutRXsklT/1VEsh5jwZvRLfDwrprD4vEpyISLLRTUHvwX8Kurhg9u2
 p0v++ust9yWPvqiELyLkPpIrze3mUFXsXraAGM8a7vc02DEWt5jHZFakl1gyfl2Umj8t
 EHxUwK/iIZQd7JYp+d6fGs8P5xOOJhzXMVgFxsnEjsqenMR989IbAaGhgroLxj9HyAir
 aRooPcuFDs8/EIA/aPhxkBVGLKUNwWJYe/jMtCzgKovfh0fEM7CNx6YCuzWbEDD7+tSH
 889w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mfqZGXgqcPFcLTJKiGeAyv3Q4QoPEUtHeOmm57Pq0Bg=;
 b=IwFpb1xqn6PROOPRvwaub6ABaUdSUTAec638qV8b5QpegKYvzmL1j8offeukjkZXES
 YBlyUbh4Y4UHA3/Qm9Y2qmn3kSFjBMniMxsmkHYwqvGAPH1U+1p5rj5/ew5TDtUI1VeF
 yhrubjhUUGZI0VmyGLgwBXmChGuaaYADzPQQP3gYGxpdc1T5O+6flxgf+UiyaXXAVpc0
 +J8lRA5aBjs2MfJAM+VPNAi1fLWHYBvxsg3HT35uPNEM8wPUpVmTahLH4/Cs2z27xoPf
 exCNrqehp660hVuGK3emW7x4tH8EfrcD6Ryz1ZkYokA62Lt0efqoL7/bDo1JshRjHHEX
 gx6A==
X-Gm-Message-State: APjAAAU9UtLBXNAXFv54IcHd0RziY0wBgBH2NjGxbIOfC6z4UKw4nJ8A
 xnRQyJFf9RGbCt+f+UyXlmyUHQ==
X-Google-Smtp-Source: APXvYqwkscLdmw1pP0ddtOkJWsdMUNpLzaX/fR+sjE3SUT1Fbfb+/os/yj982Eu8VpCm/AlKEWhQbw==
X-Received: by 2002:a17:90a:de05:: with SMTP id
 m5mr3252574pjv.10.1582609109254; 
 Mon, 24 Feb 2020 21:38:29 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id w18sm15374736pfq.167.2020.02.24.21.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 21:38:28 -0800 (PST)
Date: Mon, 24 Feb 2020 21:38:25 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [PATCHv3 2/2] drm/panel: add support for rm69299 visionox panel
 driver
Message-ID: <20200225053825.GI99370@yoga>
References: <1580907990-32108-1-git-send-email-harigovi@codeaurora.org>
 <1580907990-32108-3-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580907990-32108-3-git-send-email-harigovi@codeaurora.org>
X-Mailman-Approved-At: Tue, 25 Feb 2020 08:50:43 +0000
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 05 Feb 05:06 PST 2020, Harigovindan P wrote:

> Add support for Visionox panel driver.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v1:
> 	- Split out panel driver patch from dsi config changes(Rob Clark).
> 	- Remove unrelated code(Stephen Boyd).
> 	- Remove static arrays to make regulator setup open coded
> 	in probe(Stephen Boyd).
> 	- Remove pre-assigning variables(Stephen Boyd).
> 	- Inline panel_add function into probe(Stephen Boyd).
> 	- Use mipi_dsi_dcs_write directly(Rob Clark).
> 	- Remove qcom_rm69299_1080p_panel_magic_cmds array(Rob Clark).
> Changes in v2:
> 	- Dropping redundant space in Kconfig(Sam Ravnborg).
> 	- Changing structure for include files(Sam Ravnborg).
> 	- Removing backlight related code and functions(Sam Ravnborg).
> 	- Removing repeated printing of error message(Sam Ravnborg).
> 	- Adding drm_connector as an argument for get_modes function.
> Changes in v3:
> 	- Adding arguments for drm_panel_init to support against mainline.
> 
>  drivers/gpu/drm/panel/Kconfig                  |   8 +
>  drivers/gpu/drm/panel/Makefile                 |   1 +
>  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 371 +++++++++++++++++++++++++
>  3 files changed, 380 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 04225a8..354a3a5 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -407,6 +407,14 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
>  	  Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
>  	  Video Mode panel
>  
> +config DRM_PANEL_VISIONOX_RM69299
> +	tristate "Visionox RM69299"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	help
> +	  Say Y here if you want to enable support for Visionox
> +	  RM69299  DSI Video Mode panel.
> +
>  config DRM_PANEL_XINPENG_XPP055C272
>  	tristate "Xinpeng XPP055C272 panel driver"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 801f9f6..eeeeb7ae 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -43,4 +43,5 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
>  obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
> +obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
>  obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> new file mode 100644
> index 0000000..7195ab0
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +struct rm69299_config {
> +	unsigned long width_mm;
> +	unsigned long height_mm;
> +	const char *panel_name;
> +	u32 num_on_cmds;
> +	const struct drm_display_mode *dm;
> +};
> +
> +struct visionox_rm69299 {
> +	struct device *dev;

You also store dev in panel.dev, why not just use that?

> +	struct drm_panel panel;
> +
> +	struct regulator_bulk_data supplies[2];
> +
> +	struct gpio_desc *reset_gpio;
> +
> +	struct mipi_dsi_device *dsi;
> +	const struct rm69299_config *config;
> +	bool prepared;
> +	bool enabled;
> +};
> +
> +static inline struct visionox_rm69299 *panel_to_ctx(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct visionox_rm69299, panel);
> +}
> +
> +static int visionox_35597_power_on(struct visionox_rm69299 *ctx)
> +{
> +	int ret;
> +
> +	ret = regulator_set_load(ctx->supplies[0].consumer, 32000);
> +	if (ret)
> +		return ret;
> +
> +	ret = regulator_set_load(ctx->supplies[1].consumer, 13200);
> +	if (ret)
> +		return ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * Reset sequence of visionox panel requires the panel to be
> +	 * out of reset for 10ms, followed by being held in reset
> +	 * for 10ms and then out again
> +	 */
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	usleep_range(10000, 20000);
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(10000, 20000);
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	usleep_range(10000, 20000);
> +
> +	return 0;
> +}
> +
> +static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
> +{
> +	int ret;
> +
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +
> +	ret = regulator_set_load(ctx->supplies[0].consumer, 80);
> +

So the panel will leak 80uA when disabled? Does this actually matter, or
can you approximate it with 0uA and by that rely on the fact that
regulator_enable/disable will control if this regulator consumers' load
is considered (i.e. you can set it to 32mA and 13.2mA in probe and then
just call enable/disable after that).

> +	if (ret) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			"regulator_set_load failed %d\n", ret);

regulator_set_load() will provide more a more detailed error message in
the log when failing, so you don't have to.

> +		return ret;
> +	}
> +
> +	ret = regulator_set_load(ctx->supplies[1].consumer, 80);
> +

Please omit the empty line between assignment and checking reg,
throughout the patch.

> +	if (ret) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			"regulator_set_load failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			"regulator_bulk_disable failed %d\n", ret);

There's no need to print here, the regulator framework will already have
printed an error specifying which of the regulators in the bulk that
failed.

And hence, you can simply end the function with a:

	return regulator_bulk_disable(...);

> +	}
> +	return ret;
> +}
> +
> +static int visionox_rm69299_unprepare(struct drm_panel *panel)
> +{
> +	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> +	int ret;
> +
> +	if (!ctx->prepared)

Is it really necessary for the panel drivers to keep track of it already
being prepared or not? Will the framework invoke prepare (on unprepare)
for an already prepared panel?

> +		return 0;
> +
> +	ctx->dsi->mode_flags = 0;
> +
> +	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_OFF, NULL, 0);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			"set_display_off cmd failed ret = %d\n",
> +			ret);

Please align broken lines to the char after (

> +	}
> +
> +	/* 120ms delay required here as per DCS spec */
> +	msleep(120);
> +
> +	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_ENTER_SLEEP_MODE, NULL, 0);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			"enter_sleep cmd failed ret = %d\n", ret);
> +	}
> +
> +	ret = visionox_rm69299_power_off(ctx);
> +
> +	ctx->prepared = false;

Given that you clear prepared regardless of "ret", just set it before
and do:
	return visionox_rm69299_power_off(ctx);

> +	return ret;
> +}
> +
> +static int visionox_rm69299_prepare(struct drm_panel *panel)
> +{
> +	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> +	int ret;
> +	const struct rm69299_config *config;
> +
> +	if (ctx->prepared)
> +		return 0;
> +
> +	ret = visionox_35597_power_on(ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	config = ctx->config;
> +
> +	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xfe, 0x00 }, 2);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev,
> +		"cmd set tx 0 failed, ret = %d\n",
> +		ret);
> +		goto power_off;
> +	}
> +
> +	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xc2, 0x08 }, 2);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev,
> +		"cmd set tx 1 failed, ret = %d\n",
> +		ret);
> +		goto power_off;
> +	}
> +
> +	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x35, 0x00 }, 2);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev,
> +		"cmd set tx 2 failed, ret = %d\n",
> +		ret);
> +		goto power_off;
> +	}
> +
> +	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x51, 0xff }, 2);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev,
> +		"cmd set tx 3 failed, ret = %d\n",
> +		ret);
> +		goto power_off;
> +	}
> +
> +	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_EXIT_SLEEP_MODE, NULL, 0);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			"exit_sleep_mode cmd failed ret = %d\n",
> +			ret);
> +		goto power_off;
> +	}
> +
> +	/* Per DSI spec wait 120ms after sending exit sleep DCS command */
> +	msleep(120);
> +
> +	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_ON, NULL, 0);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			"set_display_on cmd failed ret = %d\n", ret);
> +		goto power_off;
> +	}
> +
> +	/* Per DSI spec wait 120ms after sending set_display_on DCS command */
> +	msleep(120);
> +
> +	ctx->prepared = true;
> +
> +	return 0;
> +
> +power_off:
> +	ret = visionox_rm69299_power_off(ctx);
> +	return ret;

	return visionox_rm69299_power_off();

> +}
> +
> +static int visionox_rm69299_get_modes(struct drm_panel *panel,
> +				       struct drm_connector *connector)
> +{
> +	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> +	struct drm_display_mode *mode;
> +	const struct rm69299_config *config;
> +
> +	config = ctx->config;
> +	mode = drm_mode_create(connector->dev);
> +	if (!mode) {
> +		DRM_DEV_ERROR(ctx->dev,
> +			"failed to create a new display mode\n");
> +		return 0;
> +	}
> +
> +	connector->display_info.width_mm = config->width_mm;
> +	connector->display_info.height_mm = config->height_mm;
> +	drm_mode_copy(mode, config->dm);
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_probed_add(connector, mode);
> +
> +	return 1;
> +}
> +
> +static const struct drm_panel_funcs visionox_rm69299_drm_funcs = {
> +	.unprepare = visionox_rm69299_unprepare,
> +	.prepare = visionox_rm69299_prepare,
> +	.get_modes = visionox_rm69299_get_modes,
> +};
> +
> +static const struct drm_display_mode qcom_sc7180_mtp_1080p_mode = {
> +	.name = "1080x2248",
> +	.clock = 158695,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 26,
> +	.hsync_end = 1080 + 26 + 2,
> +	.htotal = 1080 + 26 + 2 + 36,
> +	.vdisplay = 2248,
> +	.vsync_start = 2248 + 56,
> +	.vsync_end = 2248 + 56 + 4,
> +	.vtotal = 2248 + 56 + 4 + 4,
> +	.vrefresh = 60,
> +	.flags = 0,
> +};
> +
> +static const struct rm69299_config rm69299_dir = {
> +	.width_mm = 74,
> +	.height_mm = 131,
> +	.panel_name = "qcom_sc7180_mtp_1080p_panel",
> +	.dm = &qcom_sc7180_mtp_1080p_mode,
> +};
> +
> +static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct device *device;

Below I see:

ctx->dev = dev;
device = ctx->dev;

A few uses of device and some of dev.

ctx->panel.dev = device;

Presumably you can drop the "device"?


> +	struct visionox_rm69299 *ctx;
> +	const struct rm69299_config *config;

"config" is assigned below, but never used.

> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->config = device_get_match_data(dev);
> +
> +	if (!ctx->config) {

This won't happen.

> +		dev_err(dev, "missing device configuration\n");
> +		return -ENODEV;
> +	}
> +
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	ctx->dev = dev;
> +	ctx->dsi = dsi;
> +
> +	device = ctx->dev;
> +
> +	config = ctx->config;
> +	ctx->supplies[0].supply = "vdda";
> +	ctx->supplies[1].supply = "vdd3p3";
> +
> +	ret = devm_regulator_bulk_get(device, ARRAY_SIZE(ctx->supplies),
> +								ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(device, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset_gpio)) {
> +		DRM_DEV_ERROR(dev, "cannot get reset gpio %ld\n",
> +					PTR_ERR(ctx->reset_gpio));
> +		return PTR_ERR(ctx->reset_gpio);
> +	}
> +
> +	drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs, 
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.dev = device;
> +	ctx->panel.funcs = &visionox_rm69299_drm_funcs;
> +	drm_panel_add(&ctx->panel);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
> +		MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev,
> +			"dsi attach failed ret = %d\n", ret);
> +		goto err_dsi_attach;
> +	}
> +
> +	return 0;
> +
> +err_dsi_attach:
> +	drm_panel_remove(&ctx->panel);
> +	return ret;
> +}
> +
> +static int visionox_rm69299_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct visionox_rm69299 *ctx = mipi_dsi_get_drvdata(dsi);
> +
> +	if (ctx->dsi) {

If visionox_rm69299_probe() doesn't reach the point where it assigns
ctx->dsi the remove function will not be called. So I don't see how this
could be NULL, please remove the check.

> +		mipi_dsi_detach(ctx->dsi);
> +		mipi_dsi_device_unregister(ctx->dsi);
> +	}
> +
> +	drm_panel_remove(&ctx->panel);
> +	return 0;
> +}
> +
> +static const struct of_device_id visionox_rm69299_of_match[] = {
> +	{
> +		.compatible = "visionox,rm69299-1080p-display",
> +		.data = &rm69299_dir,
> +	},
> +	{ /* */ }

Please drop the empty comment thing.

Regards,
Bjorn

> +};
> +MODULE_DEVICE_TABLE(of, visionox_rm69299_of_match);
> +
> +static struct mipi_dsi_driver visionox_rm69299_driver = {
> +	.driver = {
> +		.name = "panel-visionox-rm69299",
> +		.of_match_table = visionox_rm69299_of_match,
> +	},
> +	.probe = visionox_rm69299_probe,
> +	.remove = visionox_rm69299_remove,
> +};
> +module_mipi_dsi_driver(visionox_rm69299_driver);
> +
> +MODULE_DESCRIPTION("VISIONOX RM69299 DSI Panel Driver");
> +MODULE_LICENSE("GPL v2");
> +
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
