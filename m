Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251AAC24612
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E7910EAEF;
	Fri, 31 Oct 2025 10:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="REG+vZnq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A399F10EAEF
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:15:27 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso25743255e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761905726; x=1762510526; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=eE+d1cXEHqkcosUss1w2NBrOE9cjfyKKBw4l7rwMmp0=;
 b=REG+vZnqli9eSUCfhgzY3KHTWiVKIx3eFvV0bXvZP+eNwHQcgizAkBfIPUeo4Fw0CA
 yvqmTvcoHPYvhkWDcwxX13U/xBgcPCuwFEb5BGzS9xhxvK20PMO5bMSyO1IIGCNIhWc8
 qfGBfhnEN6j5/2jhKcXPFvvbM5VnDl28zP6zCgG1vqs8tld+g2wD4LwtqF/LGbfFmk7+
 95/vOUf5Wi50IgYBvlntJJEG597uyzFnf1zZQLn1F9zmuVWn6gX4pHZuyq6D9A2mIKKY
 8l+GUbwmKLzVJSJp74u/cJ/CGsAMeF5dTEbHHO7cJi7fcTSLQ2+YW+9aTmXSvmGJLZlP
 3WMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761905726; x=1762510526;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eE+d1cXEHqkcosUss1w2NBrOE9cjfyKKBw4l7rwMmp0=;
 b=fJd1FLQwrtQySCeJu+KhwpUYiGlkfSuTWjPvsUXUF36XCqv5Lj4146WFDWRQainOEo
 qXoRuxD9kq4Zb9b5YxUF4ZImzb11s+5wW07Xzb21hEEfeL3s9xRnL28F6Fo4UKNob8jF
 B4+tMnTwLErzOhBJGRQwE5WWxTHfTqbjTTVpSvf7DLjq4dcUwQ9jTMtp4Dbz/MTwchdb
 +6NxMl3HMi03UIed2MN6HAq32pGqG+AikqHUYYlMurmRujcrLUL0Wli5nTK7AAkl5DEc
 N8z0MC8APP3Jx1ZbsB/gtoRzdEQ2TNpitYznfSexUTmizmS4A4WVWumw4GmtPVK7sbmx
 OGEg==
X-Gm-Message-State: AOJu0YyE7FZDZKfYlq4auM5LNmXOQTmXmqOQh7r4fSePqmkY/LPU2qeT
 BPkErVmff9+HARovyJuFGEnfo1TOdsXyOyqIuNtr1LzzwA68h7LVhTLmmvmTrPXHcao=
X-Gm-Gg: ASbGnculWBsbOx2UKu/tMq/ykLb/NOB4FcEFO6mEysqafoeMFfFEn9YPGwgjOsT6Vjv
 fRbWH4j1ENLTfxCfP4oCcnBNIPU0d1sWjwmn0IdksO8dGuhhmLNnKO5eMplne5UCZfLtQux/MTn
 /agnelPcXjUsxv+7xfRFVqEKjXdT73iczJY9jlZcpdLu5P/zGLhEsd2bB5wX9/MtkEWNz7nKCPb
 6MCb0alR6efekPHdnEGoOqwVU7xeDYekS+XKYmQPS0RgFn/I7mPQXSut2SsexN3fTiSlSKRW3NQ
 631vBqz2WdLO7CQ3UCL/c3OzNuuLa5XOWDQClWse4BjVuJ/eerV4bAa7mTrvOKFn6kJc71o85l4
 DwYf9SPJa7wbOW9c6CNcE2uDG3g2UKtKngLi2RfJYMDJ6yIc3qottTqccAe8LjtpGp3Y8nLMehf
 fn0VJw/tgQNA5H5dE7pRSNQpqQtOa0JqY0reydpxWk5V2vtWo7IYpZCZBjN/aC/CWIAeNzPPZRb
 w==
X-Google-Smtp-Source: AGHT+IEab5HAlvx0nr1OP9Rq6E4OTz6yEzuNxeSysSuw13E9/5p8UkZsu+Z/wlfJOqSRybyRR7JOsg==
X-Received: by 2002:a05:600c:848f:b0:477:25b9:3917 with SMTP id
 5b1f17b1804b1-477308b1aa4mr25211875e9.39.1761905726051; 
 Fri, 31 Oct 2025 03:15:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:d967:2bcf:d2d0:b324?
 ([2a01:e0a:cad:2140:d967:2bcf:d2d0:b324])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13e16f4sm2828576f8f.27.2025.10.31.03.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 03:15:25 -0700 (PDT)
Message-ID: <7642d4ba-72fe-4af7-a02a-96676f8945af@linaro.org>
Date: Fri, 31 Oct 2025 11:15:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 2/2] drm/panel: ilitek-ili9882t: Add support for Ilitek
 IL79900A-based panels
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251031100447.253164-1-yelangyan@huaqin.corp-partner.google.com>
 <20251031100447.253164-3-yelangyan@huaqin.corp-partner.google.com>
Content-Language: en-US, fr
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
Organization: Linaro
In-Reply-To: <20251031100447.253164-3-yelangyan@huaqin.corp-partner.google.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/31/25 11:04, Langyan Ye wrote:
> The Ilitek IL79900A display controller is similar to the ILI9882T and can
> be supported within the existing `panel-ilitek-ili9882t.c` driver.
> 
> This patch extends the ILI9882T driver to handle IL79900A-based panels,
> such as the Tianma TL121BVMS07-00. The IL79900A uses a similar command
> sequence and initialization flow, with minor differences in power supply
> configuration and timing.
> 
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 69 +++++++++++++++++++
>   1 file changed, 69 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> index 85c7059be214..c52f20863fc7 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
> @@ -61,6 +61,13 @@ struct ili9882t {
>   	mipi_dsi_dcs_write_seq_multi(ctx, ILI9882T_DCS_SWITCH_PAGE, \
>   				     0x98, 0x82, (page))
>   
> +/* IL79900A-specific commands, add new commands as you decode them */
> +#define IL79900A_DCS_SWITCH_PAGE	0xFF
> +
> +#define il79900a_switch_page(ctx, page) \
> +	mipi_dsi_dcs_write_seq_multi(ctx, IL79900A_DCS_SWITCH_PAGE, \
> +				     0x5a, 0xa5, (page))
> +
>   static int starry_ili9882t_init(struct ili9882t *ili)
>   {
>   	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
> @@ -413,6 +420,38 @@ static int starry_ili9882t_init(struct ili9882t *ili)
>   	return ctx.accum_err;
>   };
>   
> +static int tianma_il79900a_init(struct ili9882t *ili)
> +{
> +	struct mipi_dsi_multi_context ctx = { .dsi = ili->dsi };
> +
> +	mipi_dsi_usleep_range(&ctx, 5000, 5100);
> +
> +	il79900a_switch_page(&ctx, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x3e, 0x62);
> +
> +	il79900a_switch_page(&ctx, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x1b, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5d, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x5e, 0x40);
> +
> +	il79900a_switch_page(&ctx, 0x07);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0X29, 0x00);
> +
> +	il79900a_switch_page(&ctx, 0x06);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x92, 0x22);
> +
> +	il79900a_switch_page(&ctx, 0x00);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
> +
> +	mipi_dsi_msleep(&ctx, 120);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&ctx);
> +
> +	mipi_dsi_msleep(&ctx, 80);
> +
> +	return 0;
> +};
> +
>   static inline struct ili9882t *to_ili9882t(struct drm_panel *panel)
>   {
>   	return container_of(panel, struct ili9882t, base);
> @@ -529,6 +568,19 @@ static const struct drm_display_mode starry_ili9882t_default_mode = {
>   	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
>   };
>   
> +static const struct drm_display_mode tianma_il79900a_default_mode = {
> +	.clock = 264355,
> +	.hdisplay = 1600,
> +	.hsync_start = 1600 + 20,
> +	.hsync_end = 1600 + 20 + 4,
> +	.htotal = 1600 + 20 + 4 + 20,
> +	.vdisplay = 2560,
> +	.vsync_start = 2560 + 82,
> +	.vsync_end = 2560 + 82 + 2,
> +	.vtotal = 2560 + 82 + 2 + 36,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
>   static const struct panel_desc starry_ili9882t_desc = {
>   	.modes = &starry_ili9882t_default_mode,
>   	.bpc = 8,
> @@ -543,6 +595,20 @@ static const struct panel_desc starry_ili9882t_desc = {
>   	.init = starry_ili9882t_init,
>   };
>   
> +static const struct panel_desc tianma_tl121bvms07_desc = {
> +	.modes = &tianma_il79900a_default_mode,
> +	.bpc = 8,
> +	.size = {
> +		.width_mm = 163,
> +		.height_mm = 260,
> +	},
> +	.lanes = 3,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +	.init = tianma_il79900a_init,
> +};
> +
>   static int ili9882t_get_modes(struct drm_panel *panel,
>   			      struct drm_connector *connector)
>   {
> @@ -680,6 +746,9 @@ static const struct of_device_id ili9882t_of_match[] = {
>   	{ .compatible = "starry,ili9882t",
>   	  .data = &starry_ili9882t_desc
>   	},
> +	{ .compatible = "tianma,tl121bvms07-00",
> +	  .data = &tianma_tl121bvms07_desc
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, ili9882t_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
