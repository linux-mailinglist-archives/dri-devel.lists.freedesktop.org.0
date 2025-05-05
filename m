Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D261AA8D7B
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 09:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC86B10E303;
	Mon,  5 May 2025 07:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uZCD9Yux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3636910E303
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 07:53:22 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso24284785e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 00:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746431601; x=1747036401; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=KKwL95uiFtUkueF3DdQ6WhU1f60LmPCrAu3GykUzsdk=;
 b=uZCD9YuxG+CBZfZYx3l+abuEeQpy0GwqsgULAHCyECstEKld8CF+vL+WIfLOvYR76K
 on9Qw0rBR3/ojUm1TDURnxXHfggRq+kHa/ZWWeuwQoRemJzNV9l9WCkGlO3kzrDsQQVG
 rZk12K7xNWaxqUOoNkCgMqZjRzi+a0+nyp/B12c6iXEYdmPrFMWXeOnohmBJgMR48t9N
 rvAw8QcdQq3IDw7uxiUKYIbSkDCcnIYwXall64Pr8Q/lxb84w7Whz0nj9AL8RwA6Y/Jy
 Vb69B4K36XdMGXuYEd+J71oWwtX6rgkn4BoYR8PgbjxwDjmq30zyczuVxT5UQChNvwk2
 TwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746431601; x=1747036401;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KKwL95uiFtUkueF3DdQ6WhU1f60LmPCrAu3GykUzsdk=;
 b=WMFYZEaNY5SnxrsR96vO67LUI7jtQz0oJWgZlM0ZA6rjqGAj9DjhppQLCy57zA+bO2
 ex0Liu071e0JYYG9oDqWGn68MjHj37jEdYcGqbA2gkago7dO+IMF6ZEm/d9rqsxRGEPo
 gE65RH2GyUgo4H29cRO42ZaV46ELEPLP+e+wqjivNwZi+m62dpQq4QZRA9QGkbyDgQSb
 QYxerRY3fHuAOQbXK2SYO4HbautZYBQRqvBuQYx/iupKi2yqF2quRMKB88yAFRZyOIwK
 wjUrsJrecvsWt6zY8mGdalbygMx6x7uaH1OOpM+JioPeBmOh1/PdfUSOKLhSFNZDDzbM
 6fIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXarex1oP7mTxZzs1o/HVN7hIWr5shz4ggi+/tYTpVSXpeKx5ET/kFl3q8JCPSyDhseGAZcQi/6FyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqFJvI6Ybl5ZP/CtTrhQoxKqWdTj/LXbU+fmCJ46Lw+sIuXojb
 m6SzAcLXjcPpXQlDHpbgRtzgeHycg4H25CBQtTFiq4kwJroIztYi6jj400OegUbT3DbIXQjoO7A
 y
X-Gm-Gg: ASbGnctAkji3wwVmjSElwP6uyeEJwHhJfzYaGOU8bd5zQE2w/QuNpWNeYFPigxGYGhj
 YJTDG02Oc+T93ursaXn/pfDJJf9NA1rFTtyFsiGzAwnYTS+jGz+IwHVMLDfg/ONk8cUh+UkcWvD
 6GxJA2bYcnBJQSapZQORyxFq+M7ST6v4mQmo06y9xSkXl8nR3zzG5CccAROILrnjJAScAVJ7UbK
 Fa2YPkdjLdY1EnTBqUieVm70wa6gJV65XIAEZD6J5gjPMiAjlIysT4UOdYh1r6HWJU0iOoladsh
 Zzg4XK8w2N5SwWKDo0tp3j/+r2x41c9hRxtss+R4qhHrLzW6QOjuWQMZ45rqRdNv2uNe5MPJki9
 Fgsc2w5tfNWhW197QTA==
X-Google-Smtp-Source: AGHT+IHDMdih+hEnzP3vOjnU/Xs6E/jsrRii74HrFx4JP91bn/qL1NEIKUfcBUgSehWSzE/wSbcuZA==
X-Received: by 2002:a05:600d:3:b0:43c:fffc:7886 with SMTP id
 5b1f17b1804b1-441c5b51556mr31085155e9.8.1746431600756; 
 Mon, 05 May 2025 00:53:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3?
 ([2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae3344sm9405993f8f.23.2025.05.05.00.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 00:53:20 -0700 (PDT)
Message-ID: <dbd8e1bc-bc23-4240-b6b1-321ac6f5ed68@linaro.org>
Date: Mon, 5 May 2025 09:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: simple: Update timings for AUO G101EVN010
To: Kevin Baker <kevinb@ventureresearch.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250428210726.3395279-1-kevinb@ventureresearch.com>
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
In-Reply-To: <20250428210726.3395279-1-kevinb@ventureresearch.com>
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

On 28/04/2025 23:07, Kevin Baker wrote:
> Switch to panel timings based on datasheet for the AUO G101EVN01.0
> LVDS panel. Default timings were tested on the panel.
> 
> Previous mode-based timings resulted in horizontal display shift.

Can you add a Fixes tag ?

Thanks,
Neil

> 
> Signed-off-by: Kevin Baker <kevinb@ventureresearch.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index fb8a57afe687..1a3d7ccb328a 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -979,27 +979,28 @@ static const struct panel_desc auo_g070vvn01 = {
>   	},
>   };
>   
> -static const struct drm_display_mode auo_g101evn010_mode = {
> -	.clock = 68930,
> -	.hdisplay = 1280,
> -	.hsync_start = 1280 + 82,
> -	.hsync_end = 1280 + 82 + 2,
> -	.htotal = 1280 + 82 + 2 + 84,
> -	.vdisplay = 800,
> -	.vsync_start = 800 + 8,
> -	.vsync_end = 800 + 8 + 2,
> -	.vtotal = 800 + 8 + 2 + 6,
> +static const struct display_timing auo_g101evn010_timing = {
> +	.pixelclock = { 64000000, 68930000, 85000000 },
> +	.hactive = { 1280, 1280, 1280 },
> +	.hfront_porch = { 8, 64, 256 },
> +	.hback_porch = { 8, 64, 256 },
> +	.hsync_len = { 40, 168, 767 },
> +	.vactive = { 800, 800, 800 },
> +	.vfront_porch = { 4, 8, 100 },
> +	.vback_porch = { 4, 8, 100 },
> +	.vsync_len = { 8, 16, 223 },
>   };
>   
>   static const struct panel_desc auo_g101evn010 = {
> -	.modes = &auo_g101evn010_mode,
> -	.num_modes = 1,
> +	.timings = &auo_g101evn010_timing,
> +	.num_timings = 1,
>   	.bpc = 6,
>   	.size = {
>   		.width = 216,
>   		.height = 135,
>   	},
>   	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   

