Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF5rMeQBm2nPpgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 14:17:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2634A16F268
	for <lists+dri-devel@lfdr.de>; Sun, 22 Feb 2026 14:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3959610E0FA;
	Sun, 22 Feb 2026 13:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ixit.cz header.i=@ixit.cz header.b="O1PrwpjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EEE10E0FA
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 13:17:17 +0000 (UTC)
Received: from [IPV6:2a02:f000:10bd:e301::471] (unknown
 [IPv6:2a02:f000:10bd:e301::471])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id E3F0A534081C;
 Sun, 22 Feb 2026 14:17:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1771766231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xA7aVrxe1u4Y/Z6MfLQu76gLU/ctZfjAdmAWZ2wR2AI=;
 b=O1PrwpjMFZ9hrG0UsyrE23rEU+Dh6kvA1Cs9eHfBhu3KaA2o1aqrEhBHrvGL5RUf5u53Ie
 hFJmt4NABx/2b7lWiUKTZMwIgsCOBuRPKjpiN5PXOqsvoKCaFLeQYVG5KIZXSSrbnnUfeV
 91faio9Ee06265vyZwhd5J0YjZL8z8c=
Message-ID: <dc0e1a28-73f3-497c-add7-d4529fd5b8ae@ixit.cz>
Date: Sun, 22 Feb 2026 14:17:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/panel: Add Novatek/Tianma NT37700F panel
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science
References: <20260217000854.131242-1-mailingradian@gmail.com>
 <20260217000854.131242-4-mailingradian@gmail.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20260217000854.131242-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mailingradian@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[david@ixit.cz,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ixit.cz:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:mid,ixit.cz:dkim]
X-Rspamd-Queue-Id: 2634A16F268
X-Rspamd-Action: no action

On 17/02/2026 01:08, Richard Acayan wrote:
> Some Pixel 3a XL devices have a Tianma panel. Add support for it, with
> the aid of linux-mdss-dsi-panel-driver-generator.
> 
> Link: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Tested-by: Yifei Zhan <yifei@zhan.science>
> ---
>   drivers/gpu/drm/panel/Kconfig                 |   9 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   .../gpu/drm/panel/panel-novatek-nt37700f.c    | 282 ++++++++++++++++++
>   3 files changed, 292 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 76f6af819037..138d617e8195 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -553,6 +553,15 @@ config DRM_PANEL_NOVATEK_NT36672E
>   	  LCD panel module. The panel has a resolution of 1080x2408 and uses 24 bit
>   	  RGB per pixel.
>   
> +config DRM_PANEL_NOVATEK_NT37700F
> +	tristate "Novatek NT37700F DSI panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for Novatek NT37700F DSI
> +	  panel module. The panel has a resolution of 1080x2160.
> +
>   config DRM_PANEL_NOVATEK_NT37801
>   	tristate "Novatek NT37801/NT37810 AMOLED DSI panel"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index b9562a6fdcb3..9218a7d7ff34 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -54,6 +54,7 @@ obj-$(CONFIG_DRM_PANEL_NOVATEK_NT35950) += panel-novatek-nt35950.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36523) += panel-novatek-nt36523.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672A) += panel-novatek-nt36672a.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT36672E) += panel-novatek-nt36672e.o
> +obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37700F) += panel-novatek-nt37700f.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT37801) += panel-novatek-nt37801.o
>   obj-$(CONFIG_DRM_PANEL_NOVATEK_NT39016) += panel-novatek-nt39016.o
>   obj-$(CONFIG_DRM_PANEL_MANTIX_MLAF057WE51) += panel-mantix-mlaf057we51.o
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37700f.c b/drivers/gpu/drm/panel/panel-novatek-nt37700f.c
> new file mode 100644
> index 000000000000..e7e6343b2963
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt37700f.c
> @@ -0,0 +1,282 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, The Linux Foundation. All rights reserved.
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> + *   Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +struct nt37700f_tianma {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static inline
> +struct nt37700f_tianma *to_nt37700f_tianma(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct nt37700f_tianma, panel);
> +}
> +
> +static void nt37700f_tianma_reset(struct nt37700f_tianma *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +static int nt37700f_tianma_on(struct nt37700f_tianma *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);

For this command, please use macro similar as in panel-innolux-p079zca.c 
innolux_panel_switch_page .

I had feeling this sequence looks repeated and too suspicious to be 
random command :)

David

> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x56);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0x52);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x2b, 0x1a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x04, 0x82);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x55);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf6, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x56);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf6, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xaa, 0x55, 0xa5, 0x81);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x05);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x90, 0x01);
> +
> +	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0x0000, 1080 - 1);
> +	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 2160 - 1);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0, 0x56);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcd, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x55, 0xaa, 0x52, 0x08, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd0, 0x11, 0x64);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x09);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x20);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int nt37700f_tianma_disable(struct drm_panel *panel)
> +{
> +	struct nt37700f_tianma *ctx = to_nt37700f_tianma(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 50);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 100);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int nt37700f_tianma_prepare(struct drm_panel *panel)
> +{
> +	struct nt37700f_tianma *ctx = to_nt37700f_tianma(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	nt37700f_tianma_reset(ctx);
> +
> +	ret = nt37700f_tianma_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nt37700f_tianma_unprepare(struct drm_panel *panel)
> +{
> +	struct nt37700f_tianma *ctx = to_nt37700f_tianma(panel);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode nt37700f_tianma_mode = {
> +	.clock = (1080 + 32 + 32 + 98) * (2160 + 32 + 4 + 98) * 60 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 32,
> +	.hsync_end = 1080 + 32 + 32,
> +	.htotal = 1080 + 32 + 32 + 98,
> +	.vdisplay = 2160,
> +	.vsync_start = 2160 + 32,
> +	.vsync_end = 2160 + 32 + 4,
> +	.vtotal = 2160 + 32 + 4 + 98,
> +	.width_mm = 69,
> +	.height_mm = 137,
> +	.type = DRM_MODE_TYPE_DRIVER,
> +};
> +
> +static int nt37700f_tianma_get_modes(struct drm_panel *panel,
> +				     struct drm_connector *connector)
> +{
> +	return drm_connector_helper_get_modes_fixed(connector, &nt37700f_tianma_mode);
> +}
> +
> +static const struct drm_panel_funcs nt37700f_tianma_panel_funcs = {
> +	.prepare = nt37700f_tianma_prepare,
> +	.unprepare = nt37700f_tianma_unprepare,
> +	.disable = nt37700f_tianma_disable,
> +	.get_modes = nt37700f_tianma_get_modes,
> +};
> +
> +static int nt37700f_tianma_bl_update_status(struct backlight_device *bl)
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
> +static int nt37700f_tianma_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return brightness;
> +}
> +
> +static const struct backlight_ops nt37700f_tianma_bl_ops = {
> +	.update_status = nt37700f_tianma_bl_update_status,
> +	.get_brightness = nt37700f_tianma_bl_get_brightness,
> +};
> +
> +static struct backlight_device *
> +nt37700f_tianma_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 2047,
> +		.max_brightness = 2047,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &nt37700f_tianma_bl_ops, &props);
> +}
> +
> +static int nt37700f_tianma_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct nt37700f_tianma *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
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
> +	drm_panel_init(&ctx->panel, dev, &nt37700f_tianma_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ctx->panel.backlight = nt37700f_tianma_create_backlight(dsi);
> +	if (IS_ERR(ctx->panel.backlight))
> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
> +				     "Failed to create backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		drm_panel_remove(&ctx->panel);
> +		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static void nt37700f_tianma_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct nt37700f_tianma *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id nt37700f_tianma_of_match[] = {
> +	{ .compatible = "novatek,nt37700f" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, nt37700f_tianma_of_match);
> +
> +static struct mipi_dsi_driver nt37700f_tianma_driver = {
> +	.probe = nt37700f_tianma_probe,
> +	.remove = nt37700f_tianma_remove,
> +	.driver = {
> +		.name = "panel-novatek-nt37700f",
> +		.of_match_table = nt37700f_tianma_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(nt37700f_tianma_driver);
> +
> +MODULE_DESCRIPTION("DRM driver for nt37700f cmd mode dsi tianma panel");
> +MODULE_LICENSE("GPL");

-- 
David Heidelberg

