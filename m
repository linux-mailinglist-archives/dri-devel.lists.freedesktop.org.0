Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFn2CgbOnGnjKQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:00:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D1D17DE80
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B4C10E317;
	Mon, 23 Feb 2026 22:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ixit.cz header.i=@ixit.cz header.b="OA3tbc/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A477010E317
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:00:32 +0000 (UTC)
Received: from [IPV6:2a02:f000:10bd:e301::471] (unknown
 [IPv6:2a02:f000:10bd:e301::471])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 283265340910;
 Mon, 23 Feb 2026 23:00:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1771884026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=OfNdnh8UpvKMsEODve5COdAX3WULSjfDNFrUtEn2DOs=;
 b=OA3tbc/uTGkcys1i9pFAI6SLGqqqcxGvw19B95U2pQ59LvgWr5GDbPmm447O+zL6Sl1h2c
 RTEaFp8RJjO8TN7YW9df7mwo8RVTOv2cI0VzjhZvNm+H6/rtmip0w2a0Fhrv1yhz0IeHDf
 s53kzCTQoJSIlyanjM2JlOpiKaP9xvQ=
Message-ID: <44283903-f11d-4b13-a6c7-6f0d40a3d00b@ixit.cz>
Date: Mon, 23 Feb 2026 23:00:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm: panel: Add Samsung S6E8FCO
To: Yedaya Katsman <yedaya.ka@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Kamil_Go=C5=82da?=
 <kamil.golda@protonmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
 <20260223-panel-patches-v2-2-1b6ad471d540@gmail.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <20260223-panel-patches-v2-2-1b6ad471d540@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:yedaya.ka@gmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:yedayaka@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[david@ixit.cz,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,ixit.cz:mid,ixit.cz:dkim,ixit.cz:email]
X-Rspamd-Queue-Id: A4D1D17DE80
X-Rspamd-Action: no action

On 23/02/2026 21:26, Yedaya Katsman wrote:
> Add driver for Samsung S6E8FCO DSI video mode panel, used in
> Xiaomi Mi A3 mobile phone.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   MAINTAINERS                                   |   1 +
>   drivers/gpu/drm/panel/Kconfig                 |  12 ++
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-samsung-s6e8fco.c | 293 ++++++++++++++++++++++++++
>   4 files changed, 307 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 545d4cf68b9ac27765c7981e668e32cfecf3366b..238b5332eaf0e0cfb9834084e24671ccaee79939 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8187,6 +8187,7 @@ DRM DRIVER FOR SAMSUNG S6E8FCO PANELS
>   M:	Yedaya Katsman <yedaya.ka@gmail.com>
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.yaml
> +F:	drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
>   
>   DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
>   M:	David Heidelberg <david@ixit.cz>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 7a83804fedca1b688ce6fbe4295ec9009007e693..734640bb3f73c83e9273573aeb720ea1ba20862f 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -893,6 +893,18 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
>   	  ~5.6 inch AMOLED display, and the controller is driven by the MIPI
>   	  DSI protocol with 4 lanes.
>   
> +config DRM_PANEL_SAMSUNG_S6E8FCO
> +	tristate "Samsung S6E8FCO DSI video mode panel"
> +	depends on OF
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_MIPI_DSI
> +	select VIDEOMODE_HELPERS
> +	help
> +	  Say Y or M here if you want to enable support for the Samsung video
> +	  mode panel S6E8FCO. The panel has a 6.09 inch AMOLED display, with

The S6E8.. is not panel, but Display Driver IC, the panel from the 
replacement parts is likely one of M1906F9SH M1906F9SI, thus I would say 
M1906F9.

> +	  a resolution of 720x1560.
> +	  Found in the Xiaomi Mi A3 smartphone (xiaomi-laurel).
> +
>   config DRM_PANEL_SAMSUNG_SOFEF00
>   	tristate "Samsung SOFEF00 DSI panel controller"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index b9562a6fdcb38bfd0dfee9e8c11e16149ada4386..54eca60e5b57328ea94ed7880f4dead981f87fc1 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -91,6 +91,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24) += panel-samsung-s6e88a0-ams4
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams452ef01.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01) += panel-samsung-s6e8aa5x01-ams561ra01.o
> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8FCO) += panel-samsung-s6e8fco.o
>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
>   obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
>   obj-$(CONFIG_DRM_PANEL_SHARP_LQ079L1SX01) += panel-sharp-lq079l1sx01.o
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c b/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..7bbbe8af3e2eb9021ed7f555cb4ad2b0d7ea55ee
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e8fco.c
> @@ -0,0 +1,293 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2025 Kamil Gołda <kamil.golda@protonmail.com>

nitpick: you can also drop copyright year from your copyright or update, 
up to you.

> +// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> +// Copyright (c) 2025, The Linux Foundation. All rights reserved.
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +struct s6e8fco_samsungp {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct regulator_bulk_data *supplies;
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static const struct regulator_bulk_data s6e8fco_samsungp_supplies[] = {
> +	{ .supply = "vddio" },
> +	{ .supply = "ldo" },
> +	{ .supply = "iovcc" },
> +};
> +
> +static inline
> +struct s6e8fco_samsungp *to_s6e8fco_samsungp(struct drm_panel *panel)
> +{
> +	return container_of_const(panel, struct s6e8fco_samsungp, panel);
> +}
> +
> +static void s6e8fco_samsungp_reset(struct s6e8fco_samsungp *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(12000, 13000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	usleep_range(2000, 3000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	usleep_range(10000, 11000);
> +}
> +
> +static int s6e8fco_samsungp_on(struct s6e8fco_samsungp *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0x5a, 0x5a);

   #define s6e3fc2x01_test_key_on_lvl3(ctx) \
           mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0x5a, 0x5a> +
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x0000);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
> +				     0x20);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 50);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04, 0xed);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed,
> +				     0xe4, 0x08, 0x96, 0xa4, 0x2a, 0x72, 0xe2,
> +				     0xca, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);

   #define s6e3fc2x01_test_key_off_lvl3(ctx) \
           mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0xa5, 0xa5)

etc. etc., check panel-samsung-s6e3fc2x01.c for example (and eventually 
other surrounding drivers) and try to de-mystify the writes as much as 
you can (ofc "reasonably" - as we don't have the datasheet).

> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x93);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x05, 0xf4);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed, 0x01, 0x81, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int s6e8fco_samsungp_off(struct s6e8fco_samsungp *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int s6e8fco_samsungp_prepare(struct drm_panel *panel)
> +{
> +	struct s6e8fco_samsungp *ctx = to_s6e8fco_samsungp(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(s6e8fco_samsungp_supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	s6e8fco_samsungp_reset(ctx);
> +
> +	ret = s6e8fco_samsungp_on(ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		regulator_bulk_disable(ARRAY_SIZE(s6e8fco_samsungp_supplies), ctx->supplies);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int s6e8fco_samsungp_unprepare(struct drm_panel *panel)
> +{
> +	struct s6e8fco_samsungp *ctx = to_s6e8fco_samsungp(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	ret = s6e8fco_samsungp_off(ctx);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(s6e8fco_samsungp_supplies), ctx->supplies);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode s6e8fco_samsungp_mode = {

name the struct according to the panel, not (only) the DDIC.

> +	.clock = (720 + 350 + 40 + 294) * (1560 + 17 + 2 + 5) * 60 / 1000,
> +	.hdisplay = 720,
> +	.hsync_start = 720 + 350,
> +	.hsync_end = 720 + 350 + 40,
> +	.htotal = 720 + 350 + 40 + 294,
> +	.vdisplay = 1560,
> +	.vsync_start = 1560 + 17,
> +	.vsync_end = 1560 + 17 + 2,
> +	.vtotal = 1560 + 17 + 2 + 5,
> +	.width_mm = 65,
> +	.height_mm = 140,
> +	.type = DRM_MODE_TYPE_DRIVER,
> +};
> +
> +static int s6e8fco_samsungp_get_modes(struct drm_panel *panel,
> +				      struct drm_connector *connector)
> +{
> +	return drm_connector_helper_get_modes_fixed(connector, &s6e8fco_samsungp_mode);
> +}
> +
> +static const struct drm_panel_funcs s6e8fco_samsungp_panel_funcs = {
> +	.prepare = s6e8fco_samsungp_prepare,
> +	.unprepare = s6e8fco_samsungp_unprepare,
> +	.get_modes = s6e8fco_samsungp_get_modes,
> +};
> +
> +static int s6e8fco_samsungp_bl_update_status(struct backlight_device *bl)
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
> +static int s6e8fco_samsungp_bl_get_brightness(struct backlight_device *bl)
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
> +static const struct backlight_ops s6e8fco_samsungp_bl_ops = {
> +	.update_status = s6e8fco_samsungp_bl_update_status,
> +	.get_brightness = s6e8fco_samsungp_bl_get_brightness,
> +};
> +
> +static struct backlight_device *
> +s6e8fco_samsungp_create_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 268,

~ 10% of brightness at boot? What is the scale? Shouldn't make sense to 
set it around 50%? (just asking)

> +		.max_brightness = 2047,
> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &s6e8fco_samsungp_bl_ops, &props);
> +}
> +
> +static int s6e8fco_samsungp_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct s6e8fco_samsungp *ctx;
> +	int ret;
> +
> +	ctx = devm_drm_panel_alloc(dev, struct s6e8fco_samsungp, panel,
> +				   &s6e8fco_samsungp_panel_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	ret = devm_regulator_bulk_get_const(dev,
> +					    ARRAY_SIZE(s6e8fco_samsungp_supplies),
> +					    s6e8fco_samsungp_supplies,
> +					    &ctx->supplies);
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
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ctx->panel.backlight = s6e8fco_samsungp_create_backlight(dsi);
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
> +static void s6e8fco_samsungp_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct s6e8fco_samsungp *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id s6e8fco_samsungp_of_match[] = {
> +	{ .compatible = "samsung,s6e8fco" },

Optimally the compatible should reflect the panel used, eg something 
like samsung,s6e8fco-m1906f9 . It's possible there will be more panels 
using this DDIC, then this would make it much clearer.

Happy to see another phone panel heading to mainline, thanks for your work!

David

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, s6e8fco_samsungp_of_match);
> +
> +static struct mipi_dsi_driver s6e8fco_samsungp_driver = {
> +	.probe = s6e8fco_samsungp_probe,
> +	.remove = s6e8fco_samsungp_remove,
> +	.driver = {
> +		.name = "panel-samsung-s6e8fco",
> +		.of_match_table = s6e8fco_samsungp_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(s6e8fco_samsungp_driver);
> +
> +MODULE_AUTHOR("Kamil Gołda <kamil.golda@protonmail.com>");
> +MODULE_DESCRIPTION("DRM driver for s6e8fco samsung amoled video mode dsi panel");
> +MODULE_LICENSE("GPL");
> 

-- 
David Heidelberg

