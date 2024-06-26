Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B679187D0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 18:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F2E10E96D;
	Wed, 26 Jun 2024 16:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tGHBlWp9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219C510E968
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:46:40 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42561715d41so3367365e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719420398; x=1720025198; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=/NyIf4mhOtD0ihzTCPAbib9y8RhFKPDpSF2/QLgvzCs=;
 b=tGHBlWp93AnTopbs0U2XdEEuXyFwC7jKUgIZEFlqf6Xm/t5YgMNOCNY1vyNpXDZ+8U
 pmvlCxrTscF+2SAI+8QdEtdBjKrdTLuIX9cSEnYawBntzPxolvZZ8ejigxm8/4aKJfwH
 mXEGRlxbXlVk2xZIl/u+WJnBriGukmc5tXxGIDoIrQLU/Mm7lWM5LAB8lTfZHUXPQTOU
 rjPHrE0JAV4hrLiD9Tp+fgrI+YfMdhDbqF/zqMB289ZKdDGeA+E7M3XcDkd0eT7zA2Jg
 mo36TgG76z9W6XJl81LXoqU98+ualVgfNYW6IVMNNqOIMS0736CXuUO4HCm+VzgA0eLp
 dSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719420398; x=1720025198;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/NyIf4mhOtD0ihzTCPAbib9y8RhFKPDpSF2/QLgvzCs=;
 b=L9djpCZlOBHuiKtHQQaG3gsbwORJn5+cP04kmLw6Wh7rdrwCPsND9GKfP5TxzV9Ki1
 bmbL4drtU7U0xAf+sCMPrZ51Q7lcWd8zZuLmsFrjur7XEtJD4edAH31g3vK1R8sLeTvE
 IcnVabOpshBDw0aANd498UCD3XRGG96WbSo5VvNCuAq1P5wsex50RR2yPrG2I/88f2Lm
 BVv7jNkKNT4GgVqL44JJNm/AdwnQVjb/COX8oG+sjzMyZL1BJ5S/pZ6Y96S+qqJci7jI
 KEnja7//tZcEpx+HYNDIIrl7JdhQdjV4dInt5XUpfaIZR46evhIJ8kRn++oQCjA9QfvM
 xVbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/43iBbTZh5eXW7upA70/18hk0e8aALMHLkLYidpkWia9IxkWB/UifqWChgMh0mNF1Y2au9FkXqpyW0XPK+tZ94r/did+qWG6GxOD3mC6x
X-Gm-Message-State: AOJu0Yygo3H5fD5hT4v/IxJPdxq0NByM6XEv+TTDhCWjOtWeTiLsfIVE
 NdOcU9mXqo1dODInMnQHXrim94+gaea5mF9bR7Q6lf1XBgd82apKUtFdFUzCt8E=
X-Google-Smtp-Source: AGHT+IEh3tYhenlXtPWnbe5L29q8hoinsLFd1OsHxhNPLpJhls/HfvQ8+Cd8CnIRbFZnWiiKrTrzDA==
X-Received: by 2002:adf:f74e:0:b0:366:ed80:d054 with SMTP id
 ffacd0b85a97d-3673cc52f9fmr159939f8f.10.1719420397890; 
 Wed, 26 Jun 2024 09:46:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:afc0:84d8:433a:2d67?
 ([2a01:e0a:982:cbb0:afc0:84d8:433a:2d67])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366f7406f4dsm8140739f8f.114.2024.06.26.09.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 09:46:37 -0700 (PDT)
Message-ID: <a6a5ced9-c0dc-4f1d-9eb4-ce14e3db3178@linaro.org>
Date: Wed, 26 Jun 2024 18:46:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] drm/panel: simple: Add Jiangsu Smartwin
 SMMT043480272A-A19 panel
To: Marco Felsch <m.felsch@pengutronix.de>, quic_jesszhan@quicinc.com,
 sam@ravnborg.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: kernel@pengutronix.de, Rouven Czerwinski <r.czerwinski@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240626161714.4057983-1-m.felsch@pengutronix.de>
 <20240626161714.4057983-2-m.felsch@pengutronix.de>
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
In-Reply-To: <20240626161714.4057983-2-m.felsch@pengutronix.de>
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

On 26/06/2024 18:17, Marco Felsch wrote:
> From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
> 
> Add support for the Jiangsu Smartwin SMMT043480272A-A19 4.3" 480x272
> TFT-LCD panel. The timings are based on the ILI6485 controller IC
> datasheet.
> 
> Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index dcb6d0b6ced0..a06ad2cd76f0 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2719,6 +2719,35 @@ static const struct panel_desc innolux_zj070na_01p = {
>   	},
>   };
>   
> +static const struct display_timing jiangsu_smartwin_smmt043480272a_a19_timing = {
> +	.pixelclock = { 8000000, 9000000, 12000000 },
> +	.hactive = { 480, 480, 480 },
> +	.hback_porch = { 1, 43, 43 },
> +	.hfront_porch = { 4, 8, 75 },
> +	.hsync_len = { 2, 4, 75 },
> +	.vactive = { 272, 272, 272 },
> +	.vback_porch = { 2, 12, 12 },
> +	.vfront_porch = { 2, 8, 37 },
> +	.vsync_len = { 2, 4, 37 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
> +		 DISPLAY_FLAGS_SYNC_POSEDGE,
> +};
> +
> +static const struct panel_desc jiangsu_smartwin_smmt043480272a_a19 = {
> +	.timings = &jiangsu_smartwin_smmt043480272a_a19_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 95,
> +		.height = 54,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH |
> +		     DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> +		     DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE,
> +};
> +
>   static const struct display_timing koe_tx14d24vm1bpa_timing = {
>   	.pixelclock = { 5580000, 5850000, 6200000 },
>   	.hactive = { 320, 320, 320 },
> @@ -4626,6 +4655,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "innolux,zj070na-01p",
>   		.data = &innolux_zj070na_01p,
> +	}, {
> +		.compatible = "jianda,smmt043480272a-a19",
> +		.data = &jiangsu_smartwin_smmt043480272a_a19,
>   	}, {
>   		.compatible = "koe,tx14d24vm1bpa",
>   		.data = &koe_tx14d24vm1bpa,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
