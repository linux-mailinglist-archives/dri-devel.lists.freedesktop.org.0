Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9728E7BD8A7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 12:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B50510E25C;
	Mon,  9 Oct 2023 10:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7C510E25E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 10:32:06 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-405361bb94eso43828825e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 03:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696847525; x=1697452325; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=PPyMXLVeyZxntEhe+ZOBCkIdu/OIW+dkqZd8SlAez0E=;
 b=SScXtUAbauq0C0xjU4tCGV6qZttwyMQZnSn79r+5IuuuyQvGU7082P++mNYNLlDXFC
 CyaHUclo9lwPCUYKO24+3PlugG4VlxWmdBx15xKmzj4bCFLHnpmmzXKZh6ajzeLVEhQZ
 EZhOqKAW+UQD4MNZ3AWwEamjLqqS9yw5DgcNfqytZEMnI5y8tzaXFvTVZe4Tz4QaeN3V
 sMUYulzSf+UJuRzdGl45CsRpw6u5uTgDeKkj+pcGTDpioox4zrt3Z/+NRGY1XCgOY1Q8
 dM7Q7DFjMurDL0Kcleav5bYmYTSkZUZGBxo95jBbytBAQs82H/oAN/qJDcUhx+7hTwE0
 VjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696847525; x=1697452325;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PPyMXLVeyZxntEhe+ZOBCkIdu/OIW+dkqZd8SlAez0E=;
 b=rsUi1YreAfiRGpk1VDY3NH1tgFK0q3q29+1jEjhMMNnL52h3AYp1JVN6QiZoeAkIla
 ChQ691qK5WOPVNHBEB/0FO8mLzJIhy3CIlGU6Lf8Nj946mIeapjS+nQzNqop6ncukd8V
 TeaO7iogC7ttL+y97xhoohJiaXTpmrOHkXj87FanLIhNf6yJqcF8c5OvbL/K9SdLyB9K
 fMGCVRJ8hswEL3t7bYPejD1Ef7EaILKYr4zU7stl7NyFi7b8I/aVXDKrXmKN00Dtjk39
 UAiliy7sXqIeCZnejRo5g/rG1Ptn6b/oS+doLPnl6GbsTtN7dcEjaY1VJCjYnaqcQjuQ
 +/UA==
X-Gm-Message-State: AOJu0YwMoDCxCVhZ1bQUK6UnQUfbiC/bjmVe6/5JDwT1kXNNaZPPcmoG
 t535XebkbjwznmKzo9bfmR69ZA==
X-Google-Smtp-Source: AGHT+IG99Er9hAyGpkSogyprWJxHtspegKMzgkDrvHXSDYjUbGWzWi0x8BGDnKRLPAfpdN3vV4m54g==
X-Received: by 2002:adf:fb0b:0:b0:31f:c1b5:d4c1 with SMTP id
 c11-20020adffb0b000000b0031fc1b5d4c1mr12148894wrr.35.1696847525104; 
 Mon, 09 Oct 2023 03:32:05 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 e15-20020adff34f000000b0031c6e1ea4c7sm9258837wrp.90.2023.10.09.03.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 03:32:04 -0700 (PDT)
Message-ID: <b1626143-747f-41b1-9b7b-18a2d4f9ffc4@linaro.org>
Date: Mon, 9 Oct 2023 12:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/panel: Enable DSC and CMD mode for Visionox
 VTDR6130 panel
Content-Language: en-US, fr
To: Paloma Arellano <quic_parellan@quicinc.com>, quic_abhinavk@quicinc.com,
 quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org
References: <20230728012623.22991-1-quic_parellan@quicinc.com>
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
In-Reply-To: <20230728012623.22991-1-quic_parellan@quicinc.com>
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
Cc: sam@ravnborg.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paloma,

On 28/07/2023 03:26, Paloma Arellano wrote:
> Enable display compression (DSC v1.2) and CMD mode for 1080x2400 Visionox
> VTDR6130 AMOLED DSI panel. In addition, this patch will set the default
> to command mode with DSC enabled.
> 
> Note: This patch has only been validated DSC over command mode as DSC over
> video mode has never been validated for the MSM driver before.

I was able to test this on the QRD8550 on top of v6.6-rc5, display works fine,
but when runnning:
# modetest -r -v
<snip>
setting mode 1080x2400-144.00Hz on connectors 32, crtc 95
failed to set gamma: Function not implemented
freq: 74.22Hz
freq: 73.09Hz
freq: 72.48Hz

We get a correct 144Hz vsync test in video mode.

Do you know why this happens ?

Neil

> 
> Depends on: "Add prepare_prev_first flag to Visionox VTDR6130" [1]
> 
> Changes since v1:
>   - Changed from email address
> 
> [1] https://patchwork.freedesktop.org/series/121337/
> 
> Suggested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   .../gpu/drm/panel/panel-visionox-vtdr6130.c   | 77 ++++++++++++++++++-
>   1 file changed, 73 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> index e1363e128e7e..5658d39a3a6b 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -9,6 +9,7 @@
>   #include <linux/of.h>
>   
>   #include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
>   #include <drm/drm_mipi_dsi.h>
>   #include <drm/drm_modes.h>
>   #include <drm/drm_panel.h>
> @@ -20,7 +21,8 @@ struct visionox_vtdr6130 {
>   	struct mipi_dsi_device *dsi;
>   	struct gpio_desc *reset_gpio;
>   	struct regulator_bulk_data supplies[3];
> -	bool prepared;
> +	bool prepared, enabled;
> +	bool video_mode;
>   };
>   
>   static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct drm_panel *panel)
> @@ -50,12 +52,18 @@ static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
>   	if (ret)
>   		return ret;
>   
> +	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);
>   	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>   	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00, 0x00);
>   	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
>   	mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
>   	mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
> +	
> +	if (ctx->video_mode)
> +		mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
> +	else
> +		mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x02);
> +
>   	mipi_dsi_dcs_write_seq(dsi, 0x70,
>   			       0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 0x09, 0x60, 0x04,
>   			       0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
> @@ -214,6 +222,42 @@ static const struct drm_display_mode visionox_vtdr6130_mode = {
>   	.height_mm = 157,
>   };
>   
> +static int visionox_vtdr6130_enable(struct drm_panel *panel)
> +{
> +	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct drm_dsc_picture_parameter_set pps;
> +	int ret;
> +
> +	if (ctx->enabled)
> +		return 0;
> +
> +	if (!dsi->dsc) {
> +		dev_err(&dsi->dev, "DSC not attached to DSI\n");
> +		return -ENODEV;
> +	}
> +
> +	drm_dsc_pps_payload_pack(&pps, dsi->dsc);
> +	ret = mipi_dsi_picture_parameter_set(dsi, &pps);
> +	if (ret) {
> +		dev_err(&dsi->dev, "Failed to set PPS\n");
> +		return ret;
> +	}
> +
> +	ctx->enabled = true;
> +
> +	return 0;
> +}
> +
> +static int visionox_vtdr6130_disable(struct drm_panel *panel)
> +{
> +	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
> +
> +	ctx->enabled = false;
> +
> +	return 0;
> +}
> +
>   static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
>   				       struct drm_connector *connector)
>   {
> @@ -237,6 +281,8 @@ static const struct drm_panel_funcs visionox_vtdr6130_panel_funcs = {
>   	.prepare = visionox_vtdr6130_prepare,
>   	.unprepare = visionox_vtdr6130_unprepare,
>   	.get_modes = visionox_vtdr6130_get_modes,
> +	.enable = visionox_vtdr6130_enable,
> +	.disable = visionox_vtdr6130_disable,
>   };
>   
>   static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
> @@ -269,11 +315,31 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>   {
>   	struct device *dev = &dsi->dev;
>   	struct visionox_vtdr6130 *ctx;
> +	struct drm_dsc_config *dsc;
>   	int ret;
>   
>   	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>   	if (!ctx)
>   		return -ENOMEM;
> +	
> +	ctx->video_mode = of_property_read_bool(dev->of_node, "enforce-video-mode");
> +
> +	dsc = devm_kzalloc(dev, sizeof(*dsc), GFP_KERNEL);
> +	if (!dsc)
> +		return -ENOMEM;
> +
> +	/* Set DSC params */
> +	dsc->dsc_version_major = 0x1;
> +	dsc->dsc_version_minor = 0x2;
> +
> +	dsc->slice_height = 40;
> +	dsc->slice_width = 540;
> +	dsc->slice_count = 2;
> +	dsc->bits_per_component = 8;
> +	dsc->bits_per_pixel = 8 << 4;
> +	dsc->block_pred_enable = true;
> +
> +	dsi->dsc = dsc;
>   
>   	ctx->supplies[0].supply = "vddio";
>   	ctx->supplies[1].supply = "vci";
> @@ -294,8 +360,11 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>   
>   	dsi->lanes = 4;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
> -			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	if (ctx->video_mode)
> +		dsi->mode_flags |= MIPI_DSI_MODE_VIDEO;
> +
>   	ctx->panel.prepare_prev_first = true;
>   
>   	drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,

