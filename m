Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6219A9AC09B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 09:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA9510E1F8;
	Wed, 23 Oct 2024 07:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j/UN/80S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A08A10E1F8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 07:47:32 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-37d447de11dso5094074f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 00:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729669651; x=1730274451; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=K8XhAOWkTQF179xXl3+TzBgUaXsW8j7rP9CkGj8YxbY=;
 b=j/UN/80Sb6LcOiFRNQ3TVGv4/MJ/48DY/5rGhUxA0RPpDEBPRag+YQvMknT7QGiOiu
 lLIpwAgHOWal3jW6/HUcnB0TuofheKh9fmLDrWLSqVJYr5wplmzX96uShekFjoTAwr9g
 3S/+otPhMSR5r0j7t6hEvgZswh1vSah/YAmaAhymJUyGU+Gq+8Y4EnTTZ+wS5vjmYE5e
 mMQc+Jlds/vwsqjUlhF2LRV7zdlFzHgcOgLPJxtpR08iaAcuFsPguAcgVps9QSSU/040
 upMeCf8uCBBHNwsK5c5vRlpeL/UKoC72eNDHwH4tbAg1yYe4iFsiawdyQ4JHVrulSZoi
 xliw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729669651; x=1730274451;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=K8XhAOWkTQF179xXl3+TzBgUaXsW8j7rP9CkGj8YxbY=;
 b=kDzkta6utdJjSgB82bHhh8REDouzageFMoKfiH/J9V3Cst+WMHpyVijpx80+lGOpJb
 yeFv9kdWeGDebLqOfMOI/SKZVcfm2fZCfyV/pUhO+gszX70sweHIF1NAc86hLQkitqAE
 6mwG7gOix5kBye1wadDuT9/H/Rl71lHFpFMXE83S+0pLkb4AZcWpvg5hlJKTZxLRpCwk
 01mCPB4N7V/rDCiGvZ4Ue7bo8wjHupnA4egNPmK4H79TDL0TMZWyTEc4Gk/7l1qet9fH
 jcUHZxBzw/1IPBoBVC2cVJeljFaqMItc0rajvLnNO+Vk2Yib7W5lOsYY5ggj4qrIp1Rz
 Sf9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDTd9MTjdEVqQJCwqXxIlzNc58le7mOzmsFsp43D/hWPW2IGfZ13Mo+gPyiG4OYiDLPjGs/2wRv9U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3EHTZVd/ryJRm9iMAlgQQqGUTXVNdg/sf00uE5ey1M1L/phq5
 rkRZ6rXqSy7Ma8SPZJQgwpV2qNTeXDW+9c2c2yWhk4fBxErU8s5BBD7jLB5HMoA=
X-Google-Smtp-Source: AGHT+IHrNfw9ADOpxGliLZ7C+mOsswL0VnI/CNGntnXyg5z6Klcj4ICG0tqO2d6isSu/7Zxp24Ql1g==
X-Received: by 2002:a5d:4b50:0:b0:37d:4d31:e86c with SMTP id
 ffacd0b85a97d-37efcf794f6mr1102055f8f.44.1729669651254; 
 Wed, 23 Oct 2024 00:47:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:f9e2:19d:5b22:8044?
 ([2a01:e0a:cad:2140:f9e2:19d:5b22:8044])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b943e4sm8313368f8f.75.2024.10.23.00.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2024 00:47:30 -0700 (PDT)
Message-ID: <631d3d25-84ee-4b52-9429-eda6f489ba00@linaro.org>
Date: Wed, 23 Oct 2024 09:47:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/5] drm/panel: samsung-s6e88a0-ams427ap24: Add flip
 option
To: Jakob Hauser <jahau@rocketmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <cover.1729630039.git.jahau@rocketmail.com>
 <57a8498440695218d095cb037a5dc818d6fe7355.1729630039.git.jahau@rocketmail.com>
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
In-Reply-To: <57a8498440695218d095cb037a5dc818d6fe7355.1729630039.git.jahau@rocketmail.com>
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

On 22/10/2024 23:33, Jakob Hauser wrote:
> The way of implementing a flip option follows the existing
> panel-samsung-s6e8aa0.c [1][2][3].
> 
> The value to flip the screen is taken from a downstream kernel file of
> a similar but older panel [4]. The mipi clock [5] for the new panel
> samsung-s6e88a0-ams427ap24 matches 461 MHz and a hardware read-out of the
> 0xcb values corresponds to revision R01 of that older panel [6]. Although
> for samsung-s6e88a0-ams427ap24 that's in non-flipped state while in this
> older driver it seems to be the other way around. Further up there is a
> hint [7] basically saying for revision R01 to change the first word of the
> 0xcb command from 0x06 to 0x0e, which is actually setting BIT(3) of that
> word. This causes a horizontal flip.
> 
> [1] https://github.com/torvalds/linux/blob/v6.11/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c#L103
> [2] https://github.com/torvalds/linux/blob/v6.11/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c#L207-L211
> [3] https://github.com/torvalds/linux/blob/v6.11/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c#L954-L974
> [4] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c
> [5] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L2027-L2028
> [6] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L137-L151
> [7] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L66-L74
> 
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> ---
>   .../drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> index 6e02b881434d..8372d0d307c8 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> @@ -32,6 +32,7 @@ struct s6e88a0_ams427ap24 {
>   	struct mipi_dsi_device *dsi;
>   	struct regulator_bulk_data *supplies;
>   	struct gpio_desc *reset_gpio;
> +	bool flip_horizontal;
>   };
>   
>   const struct regulator_bulk_data s6e88a0_ams427ap24_supplies[] = {
> @@ -538,6 +539,10 @@ static int s6e88a0_ams427ap24_on(struct s6e88a0_ams427ap24 *ctx)
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc, 0x4c);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x03, 0x0d);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0xa5, 0xa5);
> +
> +	if (ctx->flip_horizontal)
> +		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcb, 0x0e);
> +
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
>   	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);
>   
> @@ -672,6 +677,15 @@ static int s6e88a0_ams427ap24_register_backlight(struct s6e88a0_ams427ap24 *ctx)
>   	return ret;
>   }
>   
> +static void s6e88a0_ams427ap24_parse_dt(struct s6e88a0_ams427ap24 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = ctx->dsi;
> +	struct device *dev = &dsi->dev;
> +	struct device_node *np = dev->of_node;
> +
> +	ctx->flip_horizontal = of_property_read_bool(np, "flip-horizontal");


Please use device_property_read_bool() instead

> +}
> +
>   static int s6e88a0_ams427ap24_probe(struct mipi_dsi_device *dsi)
>   {
>   	struct device *dev = &dsi->dev;
> @@ -706,6 +720,8 @@ static int s6e88a0_ams427ap24_probe(struct mipi_dsi_device *dsi)
>   		       DRM_MODE_CONNECTOR_DSI);
>   	ctx->panel.prepare_prev_first = true;
>   
> +	s6e88a0_ams427ap24_parse_dt(ctx);

I don't think this deserves a separate function, just move it probe.

> +
>   	ret = s6e88a0_ams427ap24_register_backlight(ctx);
>   	if (ret < 0)
>   		return ret;

With that changed:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
