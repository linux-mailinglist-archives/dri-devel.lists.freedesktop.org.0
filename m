Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF8B857A8B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 11:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B17510E584;
	Fri, 16 Feb 2024 10:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="caCTw/ou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776B810E584
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 10:33:40 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3394bec856fso1761616f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 02:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708079619; x=1708684419; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=TfoK7Jif6GaXJuF1KMPOq6M1P0boqy/n68NYRnX1gJk=;
 b=caCTw/ou1ftEHYIpJ0ZIWwcJaDKAO+u7sDQ1C4Xgr7YrtaYVJbeNGrAQ8+NWCsBRzO
 qLqNwXR4y6a264OlBjvs3PEIWskfiXy2jAO8TW4sjncJTQXs47Rc0uh4+HSz4ntmaNb1
 t3zNF/0ybIYsDSrNQNMz//KR8lkJVCxIeBhSfDRtYFSxOtv432bBwUtbPfjpZXLssx+4
 3lZsA/utc0or9I+SmM6MRqhPK28uBalm61LlSEULpxROWeQShs2hPmKgy4WxWAuwyinN
 fdk7eJxm521zntSva75iUqNKmH6XxvXXqaWfwrYSeOM4ERJK6+rNMZ/L+//Vp+JU0mWK
 8tjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708079619; x=1708684419;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TfoK7Jif6GaXJuF1KMPOq6M1P0boqy/n68NYRnX1gJk=;
 b=TLRDMG+pOMGPU6PCJZA051yH86teEGFI2x2d/r3L7EMemO3S/pqPmOeDSkwD5w1Drw
 QzhYqZef9bqJucncMw+6zR/1DNd5+DSomXy2femr095S1DX0JIHmbGQObf16oqbO/XrT
 SfNf5mh0kPQQU6RzQOiLbbZvpXh61mdF8xYfT9MqpiX3tTI5eE7rJ7JZQ4AH2NKcpGr9
 RJnApsss8/2ztKPQAJq6PcWPdyRqVsrrTb9NIOGHqs5GN3Eb2EMBRY4T5rPcIynVkYgD
 IpISVx7rCr3OV7tC7v91+7wZ/+U0bc9V9XbL3Qi7Gm31WpE2KnNPWSNdC2KdjYMHODfd
 Kdbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUplG39p/Wm0hH6KB+BqMhywnYl+ri32YthULsQExQQCbsirnbnUz9MWoi+Yz4yHR1hiJ9sOtFpRSpoP71KefqE3gfRp5GsLC8C1Yc544oo
X-Gm-Message-State: AOJu0YzgHqGtsPdFCpLdDOQx78Gx7Hja++xA+tbTDBw4t0SZDP632eQU
 hWGXUc1zHJKBJPfxUJ28jEBpDfqreqckSaC8Rvkl9C/mC9fTcuoqJmAsLux91xA=
X-Google-Smtp-Source: AGHT+IHelgMXMGpLFfO2FvI4ZmN8EFd61eYtXnfFpCsBAvZHJpZwRzYBWk7N7j+x/QmeqiD1rpMu7w==
X-Received: by 2002:adf:e448:0:b0:33c:e728:c88b with SMTP id
 t8-20020adfe448000000b0033ce728c88bmr3674743wrm.24.1708079618864; 
 Fri, 16 Feb 2024 02:33:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:814e:29c1:3729:78fa?
 ([2a01:e0a:982:cbb0:814e:29c1:3729:78fa])
 by smtp.gmail.com with ESMTPSA id
 j11-20020adff54b000000b0033b43a5f53csm1786281wrp.103.2024.02.16.02.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 02:33:38 -0800 (PST)
Message-ID: <6cb8338e-d5d2-4d26-b1e7-2624e7f77ef5@linaro.org>
Date: Fri, 16 Feb 2024 11:33:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/4] drm/panel: Add driver for DJN HX83112A LCD panel
Content-Language: en-US, fr
To: Luca Weiss <luca.weiss@fairphone.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
 <20240216-fp4-panel-v3-2-a556e4b79640@fairphone.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20240216-fp4-panel-v3-2-a556e4b79640@fairphone.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/02/2024 11:10, Luca Weiss wrote:
> Add support for the 2340x1080 LCD panel (DJN 9A-3R063-1102B) bundled
> with a HX83112A driver IC, as found on the Fairphone 4 smartphone.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                |  10 +
>   drivers/gpu/drm/panel/Makefile               |   1 +
>   drivers/gpu/drm/panel/panel-himax-hx83112a.c | 372 +++++++++++++++++++++++++++
>   3 files changed, 383 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 8f3783742208..7e25a4609682 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -162,6 +162,16 @@ config DRM_PANEL_FEIYANG_FY07024DI26A30D
>   	  Say Y if you want to enable support for panels based on the
>   	  Feiyang FY07024DI26A30-D MIPI-DSI interface.
>   
> +config DRM_PANEL_HIMAX_HX83112A
> +	tristate "Himax HX83112A-based DSI panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_KMS_HELPER
> +	help
> +	  Say Y here if you want to enable support for Himax HX83112A-based
> +	  display panels, such as the one found in the Fairphone 4 smartphone.
> +
>   config DRM_PANEL_HIMAX_HX8394
>   	tristate "HIMAX HX8394 MIPI-DSI LCD panels"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index d94a644d0a6c..f3e40f24d516 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_DRM_PANEL_EBBG_FT8719) += panel-ebbg-ft8719.o
>   obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
>   obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
>   obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
> +obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112A) += panel-himax-hx83112a.o
>   obj-$(CONFIG_DRM_PANEL_HIMAX_HX8394) += panel-himax-hx8394.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_IL9322) += panel-ilitek-ili9322.o
>   obj-$(CONFIG_DRM_PANEL_ILITEK_ILI9341) += panel-ilitek-ili9341.o
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83112a.c b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
> new file mode 100644
> index 000000000000..466c27012abf
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83112a.c
> @@ -0,0 +1,372 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
> + * Copyright (c) 2024 Luca Weiss <luca.weiss@fairphone.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +/* Manufacturer specific DSI commands */
> +#define HX83112A_SETPOWER1	0xb1
> +#define HX83112A_SETDISP	0xb2
> +#define HX83112A_SETDRV		0xb4
> +#define HX83112A_SETEXTC	0xb9
> +#define HX83112A_SETBANK	0xbd
> +#define HX83112A_SETPTBA	0xbf
> +#define HX83112A_SETDGCLUT	0xc1
> +#define HX83112A_SETTCON	0xc7
> +#define HX83112A_SETCLOCK	0xcb
> +#define HX83112A_SETPANEL	0xcc
> +#define HX83112A_SETPOWER2	0xd2
> +#define HX83112A_SETGIP0	0xd3
> +#define HX83112A_SETGIP1	0xd5
> +#define HX83112A_SETGIP2	0xd6
> +#define HX83112A_SETGIP3	0xd8
> +#define HX83112A_SETTP1		0xe7
> +#define HX83112A_UNKNOWN1	0xe9
> +
> +struct hx83112a_panel {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct regulator_bulk_data supplies[3];
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static inline struct hx83112a_panel *to_hx83112a_panel(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct hx83112a_panel, panel);
> +}
> +
> +static void hx83112a_reset(struct hx83112a_panel *ctx)
> +{
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	msleep(20);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	msleep(20);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +	msleep(50);
> +}
> +
> +static int hx83112a_on(struct hx83112a_panel *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETEXTC, 0x83, 0x11, 0x2a);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPOWER1,
> +			       0x08, 0x28, 0x28, 0x83, 0x83, 0x4c, 0x4f, 0x33);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDISP,
> +			       0x00, 0x02, 0x00, 0x90, 0x24, 0x00, 0x08, 0x19,
> +			       0xea, 0x11, 0x11, 0x00, 0x11, 0xa3);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDRV,
> +			       0x58, 0x68, 0x58, 0x68, 0x0f, 0xef, 0x0b, 0xc0,
> +			       0x0b, 0xc0, 0x0b, 0xc0, 0x00, 0xff, 0x00, 0xff,
> +			       0x00, 0x00, 0x14, 0x15, 0x00, 0x29, 0x11, 0x07,
> +			       0x12, 0x00, 0x29);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDRV,
> +			       0x00, 0x12, 0x12, 0x11, 0x88, 0x12, 0x12, 0x00,
> +			       0x53);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x03);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT,
> +			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
> +			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
> +			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
> +			       0x84, 0x7c, 0x74, 0x6b, 0x62, 0x5a, 0x51, 0x49,
> +			       0x41, 0x39, 0x31, 0x29, 0x21, 0x19, 0x12, 0x0a,
> +			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
> +			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
> +			       0x40);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT,
> +			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
> +			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
> +			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
> +			       0x84, 0x7c, 0x74, 0x6b, 0x62, 0x5a, 0x51, 0x49,
> +			       0x41, 0x39, 0x31, 0x29, 0x21, 0x19, 0x12, 0x0a,
> +			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
> +			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
> +			       0x40);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT,
> +			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
> +			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
> +			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
> +			       0x84, 0x7c, 0x74, 0x6b, 0x62, 0x5a, 0x51, 0x49,
> +			       0x41, 0x39, 0x31, 0x29, 0x21, 0x19, 0x12, 0x0a,
> +			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
> +			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
> +			       0x40);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETDGCLUT, 0x01);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTCON,
> +			       0x70, 0x00, 0x04, 0xe0, 0x33, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPANEL, 0x08);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPOWER2, 0x2b, 0x2b);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP0,
> +			       0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08,
> +			       0x08, 0x03, 0x03, 0x22, 0x18, 0x07, 0x07, 0x07,
> +			       0x07, 0x32, 0x10, 0x06, 0x00, 0x06, 0x32, 0x10,
> +			       0x07, 0x00, 0x07, 0x32, 0x19, 0x31, 0x09, 0x31,
> +			       0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x08,
> +			       0x09, 0x30, 0x00, 0x00, 0x00, 0x06, 0x0d, 0x00,
> +			       0x0f);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP0,
> +			       0x00, 0x00, 0x19, 0x10, 0x00, 0x0a, 0x00, 0x81);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP1,
> +			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +			       0xc0, 0xc0, 0x18, 0x18, 0x19, 0x19, 0x18, 0x18,
> +			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
> +			       0x28, 0x28, 0x24, 0x24, 0x02, 0x03, 0x02, 0x03,
> +			       0x00, 0x01, 0x00, 0x01, 0x31, 0x31, 0x31, 0x31,
> +			       0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP2,
> +			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x19, 0x19,
> +			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
> +			       0x24, 0x24, 0x28, 0x28, 0x01, 0x00, 0x01, 0x00,
> +			       0x03, 0x02, 0x03, 0x02, 0x31, 0x31, 0x31, 0x31,
> +			       0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
> +			       0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea,
> +			       0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa,
> +			       0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa, 0xaa, 0xaa);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
> +			       0xaa, 0x2e, 0x28, 0x00, 0x00, 0x00, 0xaa, 0x2e,
> +			       0x28, 0x00, 0x00, 0x00, 0xaa, 0xee, 0xaa, 0xaa,
> +			       0xaa, 0xaa, 0xaa, 0xee, 0xaa, 0xaa, 0xaa, 0xaa);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
> +			       0xaa, 0xff, 0xff, 0xff, 0xff, 0xff, 0xaa, 0xff,
> +			       0xff, 0xff, 0xff, 0xff);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x03);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETGIP3,
> +			       0xaa, 0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
> +			       0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xff, 0xff, 0xff,
> +			       0xff, 0xff, 0xaa, 0xff, 0xff, 0xff, 0xff, 0xff);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTP1,
> +			       0x0e, 0x0e, 0x1e, 0x65, 0x1c, 0x65, 0x00, 0x50,
> +			       0x20, 0x20, 0x00, 0x00, 0x02, 0x02, 0x02, 0x05,
> +			       0x14, 0x14, 0x32, 0xb9, 0x23, 0xb9, 0x08);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTP1,
> +			       0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETTP1,
> +			       0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00,
> +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,
> +			       0x00, 0x00, 0x00, 0x02, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0xc3);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETCLOCK, 0xd1, 0xd6);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0x3f);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0xc6);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_SETPTBA, 0x37);
> +	mipi_dsi_dcs_write_seq(dsi, HX83112A_UNKNOWN1, 0x3f);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(150);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display on: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(50);
> +
> +	return 0;
> +}
> +
> +static int hx83112a_disable(struct drm_panel *panel)
> +{
> +	struct hx83112a_panel *ctx = to_hx83112a_panel(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display off: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(20);
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(120);
> +
> +	return 0;
> +}
> +
> +static int hx83112a_prepare(struct drm_panel *panel)
> +{
> +	struct hx83112a_panel *ctx = to_hx83112a_panel(panel);
> +	struct device *dev = &ctx->dsi->dev;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	hx83112a_reset(ctx);
> +
> +	ret = hx83112a_on(ctx);
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
> +static int hx83112a_unprepare(struct drm_panel *panel)
> +{
> +	struct hx83112a_panel *ctx = to_hx83112a_panel(panel);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode hx83112a_mode = {
> +	.clock = (1080 + 28 + 8 + 8) * (2340 + 27 + 5 + 5) * 60 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 28,
> +	.hsync_end = 1080 + 28 + 8,
> +	.htotal = 1080 + 28 + 8 + 8,
> +	.vdisplay = 2340,
> +	.vsync_start = 2340 + 27,
> +	.vsync_end = 2340 + 27 + 5,
> +	.vtotal = 2340 + 27 + 5 + 5,
> +	.width_mm = 67,
> +	.height_mm = 145,
> +	.type = DRM_MODE_TYPE_DRIVER,
> +};
> +
> +static int hx83112a_get_modes(struct drm_panel *panel,
> +				  struct drm_connector *connector)
> +{
> +	return drm_connector_helper_get_modes_fixed(connector, &hx83112a_mode);
> +}
> +
> +static const struct drm_panel_funcs hx83112a_panel_funcs = {
> +	.prepare = hx83112a_prepare,
> +	.unprepare = hx83112a_unprepare,
> +	.disable = hx83112a_disable,
> +	.get_modes = hx83112a_get_modes,
> +};
> +
> +static int hx83112a_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct hx83112a_panel *ctx;
> +	int ret;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->supplies[0].supply = "vdd1";
> +	ctx->supplies[1].supply = "vsn";
> +	ctx->supplies[2].supply = "vsp";
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
> +				      ctx->supplies);
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
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_MODE_VIDEO_HSE |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +	drm_panel_init(&ctx->panel, dev, &hx83112a_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
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
> +static void hx83112a_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct hx83112a_panel *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id hx83112a_of_match[] = {
> +	{ .compatible = "djn,9a-3r063-1102b" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, hx83112a_of_match);
> +
> +static struct mipi_dsi_driver hx83112a_driver = {
> +	.probe = hx83112a_probe,
> +	.remove = hx83112a_remove,
> +	.driver = {
> +		.name = "panel-himax-hx83112a",
> +		.of_match_table = hx83112a_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(hx83112a_driver);
> +
> +MODULE_DESCRIPTION("DRM driver for hx83112a-equipped DSI panels");
> +MODULE_LICENSE("GPL");
> 

LGTM

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
