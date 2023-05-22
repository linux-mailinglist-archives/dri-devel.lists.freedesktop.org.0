Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CC870B8AA
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 11:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C1C10E28F;
	Mon, 22 May 2023 09:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CE110E28F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 09:13:35 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f42c86543bso37208315e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 02:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684746814; x=1687338814;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YKgXV6Eqt7e9wbsOhVGiZn1i0paFmpFE1O+wKjTUvcM=;
 b=xbU1ZHCIkRn+wpg6joNrX+CCDZuaqrqcWFbE4whS16TXcfAyi+2XM1PIueo3mjCNg3
 VDFVXsu+RqwwFy0Y6mNHt8Bw6ldqNYM20YgSJztyqVhiCsCmrp2lF0bjxGs84K+k5M8K
 8LwdR4cczJrcf76jXglOVJMWsmGA3KjfRBXRURJTGO7spaEAbQV+SwAT3APaOkAkUDpL
 88XRCzRSE4ylCTXlLndYC3CDr+8g3JJ7RN8vt99o7NFszyqdfCC8yMRwB5AAkW+Y5+Xv
 302APYt6HbYSZ+p8X8yLbGQbL8nuN08qT4/OEZccaqlFPjitublFzfgSi2YmQGiE6eKy
 LFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684746814; x=1687338814;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YKgXV6Eqt7e9wbsOhVGiZn1i0paFmpFE1O+wKjTUvcM=;
 b=eoKLUkJkQOGQ6/AIupxhTrAVLQe8w4LEdHfLXqSXuHHKy2fnRyJdv7KLysUUuOqCqe
 PxGquvgIAjzOfGpbE83BiksPC0bz5D+lFUV+eZkb5BAhCn0jjsU+BBCT8IJ1srglyCiC
 tzDEw2mzwhIpEVtt3UGkLKlc08fsQesWmFwKmh8GvtBsO0uFwVCDkudMwj4BJ6YX6Zuy
 OYMU3fo2KhVv+swgPy9Cy/3SzLXEGh64hjEy2tQB8fT1K/P5blWLTuy2kkQpIRZy4ceM
 TxeZS9N4ji1lIl5OGqanKlUgwg7Aiyi9DH3h9CmBtfKrEiFjztAGLr52bLuRic3L4shl
 lZtA==
X-Gm-Message-State: AC+VfDxvt+bMSYjQ8LQthFWf0Q3ACohNE9gBbQcuYBCAxOT1uCxv8cC2
 If6ExugDdl8MrqOcKsWbdPx2Acj+qklghX0OJWLOyQ==
X-Google-Smtp-Source: ACHHUZ4tl9hIiaYrPnvfLErUtaqHX9JoPN2VQFkE/GvJVcKQHTRLovjvpbNTgKy2F/bKET1p+iEkNg==
X-Received: by 2002:a7b:c843:0:b0:3f5:d313:db5e with SMTP id
 c3-20020a7bc843000000b003f5d313db5emr6698561wml.15.1684746813835; 
 Mon, 22 May 2023 02:13:33 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 z24-20020a05600c221800b003f31d44f0cbsm10776420wml.29.2023.05.22.02.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 02:13:33 -0700 (PDT)
Message-ID: <7a9c58b4-e99c-593d-1825-56c698379d09@linaro.org>
Date: Mon, 22 May 2023 11:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: Support for Starry-himax83102-j02 TDDI
 MIPI-DSI panel
Content-Language: en-US
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, sam@ravnborg.org,
 daniel@ffwll.ch, dianders@google.com, hsinyi@google.com
References: <20230519032316.3464732-1-yangcong5@huaqin.corp-partner.google.com>
Organization: Linaro Developer Services
In-Reply-To: <20230519032316.3464732-1-yangcong5@huaqin.corp-partner.google.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 19/05/2023 05:23, Cong Yang wrote:
> The Starry-himax83102-j02 panel is a TDDI IC. From the datasheet[1],
> it seems that the touch can communicate successfully only when the RST
> signal is high. Since i2c_hid_core_probe comes after boe_panel_prepare
> let's set the default high for RST at boe_panel_add.

This is a higher level problem, here you basically never set the reset signal to low,
so instead make the reset signal optional and handle the reset elseshere like in a gpio-hog.

> 
> [1]: https://github.com/HimaxSoftware/Doc/tree/main/Himax_Chipset_Power_Sequence

PLease update the DT bindings first when introducing a new compatible.

Neil

> 
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>   .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 103 +++++++++++++++++-
>   1 file changed, 102 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 783234ae0f57..0d325fc42bc4 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -36,6 +36,7 @@ struct panel_desc {
>   	const struct panel_init_cmd *init_cmds;
>   	unsigned int lanes;
>   	bool discharge_on_disable;
> +	int enable_gpio_init_value;
>   };
>   
>   struct boe_panel {
> @@ -75,6 +76,75 @@ struct panel_init_cmd {
>   	.len = sizeof((char[]){__VA_ARGS__}), \
>   	.data = (char[]){__VA_ARGS__} }
>   
> +static const struct panel_init_cmd starry_himax83102_j02_init_cmd[] = {
> +	_INIT_DCS_CMD(0xB9, 0x83, 0x10, 0x21, 0x55, 0x00),
> +	_INIT_DCS_CMD(0xB1, 0x2C, 0xB5, 0xB5, 0x31, 0xF1, 0x31, 0xD7, 0x2F, 0x36, 0x36, 0x36, 0x36, 0x1A, 0x8B, 0x11,
> +		0x65, 0x00, 0x88, 0xFA, 0xFF, 0xFF, 0x8F, 0xFF, 0x08, 0x74, 0x33),
> +	_INIT_DCS_CMD(0xB2, 0x00, 0x47, 0xB0, 0x80, 0x00, 0x12, 0x72, 0x3C, 0xA3, 0x03, 0x03, 0x00, 0x00, 0x88, 0xF5),
> +	_INIT_DCS_CMD(0xB4, 0x76, 0x76, 0x76, 0x76, 0x76, 0x76, 0x63, 0x5C, 0x63, 0x5C, 0x01, 0x9E),
> +	_INIT_DCS_CMD(0xE9, 0xCD),
> +	_INIT_DCS_CMD(0xBA, 0x84),
> +	_INIT_DCS_CMD(0xE9, 0x3F),
> +	_INIT_DCS_CMD(0xBC, 0x1B, 0x04),
> +	_INIT_DCS_CMD(0xBE, 0x20),
> +	_INIT_DCS_CMD(0xBF, 0xFC, 0xC4),
> +	_INIT_DCS_CMD(0xC0, 0x36, 0x36, 0x22, 0x11, 0x22, 0xA0, 0x61, 0x08, 0xF5, 0x03),
> +	_INIT_DCS_CMD(0xE9, 0xCC),
> +	_INIT_DCS_CMD(0xC7, 0x80),
> +	_INIT_DCS_CMD(0xE9, 0x3F),
> +	_INIT_DCS_CMD(0xE9, 0xC6),
> +	_INIT_DCS_CMD(0xC8, 0x97),
> +	_INIT_DCS_CMD(0xE9, 0x3F),
> +	_INIT_DCS_CMD(0xC9, 0x00, 0x1E, 0x13, 0x88, 0x01),
> +	_INIT_DCS_CMD(0xCB, 0x08, 0x13, 0x07, 0x00, 0x0F, 0x33),
> +	_INIT_DCS_CMD(0xCC, 0x02),
> +	_INIT_DCS_CMD(0xE9, 0xC4),
> +	_INIT_DCS_CMD(0xD0, 0x03),
> +	_INIT_DCS_CMD(0xE9, 0x3F),
> +	_INIT_DCS_CMD(0xD1, 0x37, 0x06, 0x00, 0x02, 0x04, 0x0C, 0xFF),
> +	_INIT_DCS_CMD(0xD2, 0x1F, 0x11, 0x1F),
> +	_INIT_DCS_CMD(0xD3, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x08, 0x37, 0x47, 0x34, 0x3B, 0x12, 0x12, 0x03,
> +		0x03, 0x32, 0x10, 0x10, 0x00, 0x10, 0x32, 0x10, 0x08, 0x00, 0x08, 0x32, 0x17, 0x94, 0x07, 0x94, 0x00, 0x00),
> +	_INIT_DCS_CMD(0xD5, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x19, 0x19, 0x40, 0x40, 0x1A, 0x1A,
> +		0x1B, 0x1B, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x20, 0x21, 0x28, 0x29, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18),
> +	_INIT_DCS_CMD(0xD6, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x40, 0x40, 0x19, 0x19, 0x1A, 0x1A,
> +		0x1B, 0x1B, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00, 0x29, 0x28, 0x21, 0x20, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18),
> +	_INIT_DCS_CMD(0xD8, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBA, 0xEA, 0xAA,
> +		0xAA, 0xA0, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBA, 0xEA, 0xAA, 0xAA, 0xA0),
> +	_INIT_DCS_CMD(0xE0, 0x00, 0x09, 0x14, 0x1E, 0x26, 0x48, 0x61, 0x67, 0x6C, 0x67, 0x7D, 0x7F, 0x80, 0x8B, 0x87, 0x8F, 0x98, 0xAB,
> +		0xAB, 0x55, 0x5C, 0x68, 0x73, 0x00, 0x09, 0x14, 0x1E, 0x26, 0x48, 0x61, 0x67, 0x6C, 0x67, 0x7D, 0x7F, 0x80, 0x8B, 0x87, 0x8F, 0x98, 0xAB, 0xAB, 0x55, 0x5C, 0x68, 0x73),
> +	_INIT_DCS_CMD(0xE7, 0x0E, 0x10, 0x10, 0x21, 0x2B, 0x9A, 0x02, 0x54, 0x9A, 0x14, 0x14, 0x00, 0x00, 0x00, 0x00, 0x12, 0x05, 0x02, 0x02, 0x10),
> +	_INIT_DCS_CMD(0xBD, 0x01),
> +	_INIT_DCS_CMD(0xB1, 0x01, 0xBF, 0x11),
> +	_INIT_DCS_CMD(0xCB, 0x86),
> +	_INIT_DCS_CMD(0xD2, 0x3C, 0xFA),
> +	_INIT_DCS_CMD(0xE9, 0xC5),
> +	_INIT_DCS_CMD(0xD3, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0C, 0x01),
> +	_INIT_DCS_CMD(0xE9, 0x3F),
> +	_INIT_DCS_CMD(0xE7, 0x02, 0x00, 0x28, 0x01, 0x7E, 0x0F, 0x7E, 0x10, 0xA0, 0x00, 0x00, 0x20, 0x40, 0x50, 0x40),
> +	_INIT_DCS_CMD(0xBD, 0x02),
> +	_INIT_DCS_CMD(0xD8, 0xFF, 0xFF, 0xBF, 0xFE, 0xAA, 0xA0, 0xFF, 0xFF, 0xBF, 0xFE, 0xAA, 0xA0),
> +	_INIT_DCS_CMD(0xE7, 0xFE, 0x04, 0xFE, 0x04, 0xFE, 0x04, 0x03, 0x03, 0x03, 0x26, 0x00, 0x26, 0x81, 0x02, 0x40, 0x00, 0x20, 0x9E, 0x04, 0x03, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00),
> +	_INIT_DCS_CMD(0xBD, 0x03),
> +	_INIT_DCS_CMD(0xE9, 0xC6),
> +	_INIT_DCS_CMD(0xB4, 0x03, 0xFF, 0xF8),
> +	_INIT_DCS_CMD(0xE9, 0x3F),
> +	_INIT_DCS_CMD(0xD8, 0x00, 0x2A, 0xAA, 0xA8, 0x00, 0x00, 0x00, 0x2A, 0xAA, 0xA8, 0x00, 0x00, 0x00, 0x3F, 0xFF, 0xFC, 0x00, 0x00, 0x00, 0x3F, 0xFF, 0xFC, 0x00, 0x00, 0x00, 0x2A, 0xAA, 0xA8, 			0x00, 0x00, 0x00, 0x2A, 0xAA, 0xA8, 0x00, 0x00),
> +	_INIT_DCS_CMD(0xBD, 0x00),
> +	_INIT_DCS_CMD(0xE9, 0xC4),
> +	_INIT_DCS_CMD(0xBA, 0x96),
> +	_INIT_DCS_CMD(0xE9, 0x3F),
> +	_INIT_DCS_CMD(0xBD, 0x01),
> +	_INIT_DCS_CMD(0xE9, 0xC5),
> +	_INIT_DCS_CMD(0xBA, 0x4F),
> +	_INIT_DCS_CMD(0xE9, 0x3F),
> +	_INIT_DCS_CMD(0xBD, 0x00),
> +	_INIT_DCS_CMD(0x11),
> +	_INIT_DELAY_CMD(120),
> +	_INIT_DCS_CMD(0x29),
> +	{},
> +};
> +
>   static const struct panel_init_cmd boe_tv110c9m_init_cmd[] = {
>   	_INIT_DCS_CMD(0xFF, 0x20),
>   	_INIT_DCS_CMD(0xFB, 0x01),
> @@ -1620,6 +1690,34 @@ static const struct panel_desc starry_qfh032011_53g_desc = {
>   	.init_cmds = starry_qfh032011_53g_init_cmd,
>   };
>   
> +static const struct drm_display_mode starry_himax83102_j02_default_mode = {
> +	.clock = 161600,
> +	.hdisplay = 1200,
> +	.hsync_start = 1200 + 40,
> +	.hsync_end = 1200 + 40 + 20,
> +	.htotal = 1200 + 40 + 20 + 40,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 116,
> +	.vsync_end = 1920 + 116 + 8,
> +	.vtotal = 1920 + 116 + 8 + 12,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct panel_desc starry_himax83102_j02_desc = {
> +	.modes = &starry_himax83102_j02_default_mode,
> +	.bpc = 8,
> +	.size = {
> +		.width_mm = 141,
> +		.height_mm = 226,
> +	},
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +	.init_cmds = starry_himax83102_j02_init_cmd,
> +	.enable_gpio_init_value = 1,
> +};
> +
>   static int boe_panel_get_modes(struct drm_panel *panel,
>   			       struct drm_connector *connector)
>   {
> @@ -1694,7 +1792,7 @@ static int boe_panel_add(struct boe_panel *boe)
>   		return PTR_ERR(boe->enable_gpio);
>   	}
>   
> -	gpiod_set_value(boe->enable_gpio, 0);
> +	gpiod_set_value(boe->enable_gpio, boe->desc->enable_gpio_init_value);
>   
>   	drm_panel_init(&boe->base, dev, &boe_panel_funcs,
>   		       DRM_MODE_CONNECTOR_DSI);
> @@ -1793,6 +1891,9 @@ static const struct of_device_id boe_of_match[] = {
>   	{ .compatible = "starry,2081101qfh032011-53g",
>   	  .data = &starry_qfh032011_53g_desc
>   	},
> +	{ .compatible = "starry,himax83102-j02",
> +	  .data = &starry_himax83102_j02_desc
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, boe_of_match);

