Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EB7A02EE3
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 18:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6080010E9A4;
	Mon,  6 Jan 2025 17:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aNhVqe3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F20910E9A4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 17:26:30 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-385de59c1a0so8762194f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jan 2025 09:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736184329; x=1736789129; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=+oIdHn0Dq889BZIyexLlVmSB0o4QCoEOEb0ZsOZgzJk=;
 b=aNhVqe3bYzr72Wh+1q3Lx0N9p8+FKyjgbMFuc1gtki6jTPyHpSyfYIg/Q6Uipog4+m
 3ugxmN8LhvA3Gc9vCAaGjsa8TzmJEtkh6Tl5lXO5tgyZRa4sjPghvHSZnpkuzC4zvzsi
 ggDlpHEORIwPyuYAdtjZ7NGmyyIp7B6z6vem/7opyvSccYHY16L6lkAHViPZl2K0uP+i
 BmO4OA20aXfReu3LA894AmN6SieKKT1y/Zs+wOQVyIs5a0VB/pcBCilq1lpGfs7arCmu
 T+YKe1a8Uiu/A2k+CXN9X5UWfe6goWnocGrO5xoudafP4rK383grKQFd4OuBrPAyVlQL
 /Dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736184329; x=1736789129;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+oIdHn0Dq889BZIyexLlVmSB0o4QCoEOEb0ZsOZgzJk=;
 b=OdyHf6J4By9cLFhdzRFuJ4omnL+KXNQuHaM196MYChwP6tRxPadiowwZH6dH6li1Qv
 qEH9q9hYaQLvx5rA762itw4F3/e58PabjluJ1G0NOKIm/dcusQ9CECpt8DZI19hvJ6nH
 IH8iPJFxWWkJtO3We6HGsqTRJ4jesYhr8248AUfWPaQ++4syMLYVoDg/2KDnU9cFuiPu
 h6YsJmom+QA/12xtbdXsc+LTz60+TuFtdkewh2ioxVBDFJd74Rx7kmxbyJX0TmVx/fMH
 Ke3WWPfQsdBLaqEXYo+q0cO3h8U9XiR4pcBG8mr7VLQwnaklCHl7T+jbCjNM1VHizE2r
 JJ5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8tPsziOUl7lQYwgHbAH9uQ2xum/G1NvY0keXn/jZztR+Qgg0Qk5RMxWRKaVxujOY1+TZ056d/BdE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzler6+TUPOjsYE9mNHzCUBacngKH88lB4TbKpdClyl1sBIkn4v
 eWN7Al/EeF+dE60rnWuVlT/4RZpKXR6skJivBni/NPTMrxIdTXpyS8gIxcdSjQU=
X-Gm-Gg: ASbGncusN5gHT89smc3K0rHGMUKQ4a25TgSfVAdVe7UFtjQ6aazIoclgOD7bLpmCHsq
 BA0DhkboDm6heNbBDl76PeZeih2/Im2Ao3CzuaVW+LEVT0FSJH0PZB1niyIkrlEC0uonPOWlnvd
 Z34T7Ivh4dR3+RopdJPUn1/HaV8bJd53IC0QmfghCT7Q/hyxMp0b7vlpWKyzbF9H6OHLGMrzOA7
 Z4lr8MA93OrTz2IeV12rmFeQyA7R/6vZJxZFFWsLN5Y1O/pwpQnXaAtHw6fSQE8eekjUHcMPKu7
 Pj0Zv6W0CsBLwtpfnH0q2SPRiLFS
X-Google-Smtp-Source: AGHT+IFuWIe7P76vAAJBxaSyBOKgxabYoIof89v0Nq8PwlV3QyzLbMffZ/MQMsRcqJoGVi0Yh0TA6g==
X-Received: by 2002:a05:6000:2af:b0:386:3752:b28c with SMTP id
 ffacd0b85a97d-38a223f5c3bmr42762481f8f.41.1736184328638; 
 Mon, 06 Jan 2025 09:25:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:95:e905:1421:811c?
 ([2a01:e0a:982:cbb0:95:e905:1421:811c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e2b0sm49270546f8f.82.2025.01.06.09.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 09:25:28 -0800 (PST)
Message-ID: <76295adf-5356-4997-9b61-492796a6e6d6@linaro.org>
Date: Mon, 6 Jan 2025 18:25:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: ebbg-ft8719: transition to mipi_dsi wrapped
 functions
To: Tejas Vipin <tejasvipin76@gmail.com>, jo@jsfamily.in,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250106041129.114867-1-tejasvipin76@gmail.com>
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
In-Reply-To: <20250106041129.114867-1-tejasvipin76@gmail.com>
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

On 06/01/2025 05:11, Tejas Vipin wrote:
> Changes the ebbg-ft8719 panel to use multi style functions for
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-ebbg-ft8719.c | 67 ++++++-----------------
>   1 file changed, 16 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> index e85d63a176d0..0bfed0ec0bbc 100644
> --- a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> +++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> @@ -57,65 +57,39 @@ static void ebbg_ft8719_reset(struct ebbg_ft8719 *ctx)
>   static int ebbg_ft8719_on(struct ebbg_ft8719 *ctx)
>   {
>   	struct mipi_dsi_device *dsi = ctx->dsi;
> -	struct device *dev = &dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
>   	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>   
> -	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x00ff);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set display brightness: %d\n", ret);
> -		return ret;
> -	}
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x00ff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
>   
> -	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
> -	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 90);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
>   
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(90);
> -
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set display on: %d\n", ret);
> -		return ret;
> -	}
> -
> -	return 0;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static int ebbg_ft8719_off(struct ebbg_ft8719 *ctx)
>   {
>   	struct mipi_dsi_device *dsi = ctx->dsi;
> -	struct device *dev = &dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
>   	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>   
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set display off: %d\n", ret);
> -		return ret;
> -	}
> -	usleep_range(10000, 11000);
> -
> -	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(90);
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 90);
>   
> -	return 0;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static int ebbg_ft8719_prepare(struct drm_panel *panel)
>   {
>   	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
> -	struct device *dev = &ctx->dsi->dev;
>   	int ret;
>   
>   	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> @@ -126,7 +100,6 @@ static int ebbg_ft8719_prepare(struct drm_panel *panel)
>   
>   	ret = ebbg_ft8719_on(ctx);
>   	if (ret < 0) {
> -		dev_err(dev, "Failed to initialize panel: %d\n", ret);
>   		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>   		return ret;
>   	}
> @@ -137,18 +110,10 @@ static int ebbg_ft8719_prepare(struct drm_panel *panel)
>   static int ebbg_ft8719_unprepare(struct drm_panel *panel)
>   {
>   	struct ebbg_ft8719 *ctx = to_ebbg_ft8719(panel);
> -	struct device *dev = &ctx->dsi->dev;
> -	int ret;
> -
> -	ret = ebbg_ft8719_off(ctx);
> -	if (ret < 0)
> -		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
>   
> +	ebbg_ft8719_off(ctx);
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> -
> -	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> -	if (ret)
> -		dev_err(panel->dev, "Failed to disable regulators: %d\n", ret);
> +	regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>   
>   	return 0;
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
