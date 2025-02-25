Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECD2A43AF5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEB710E5FD;
	Tue, 25 Feb 2025 10:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rtXlqRFJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F92010E5FD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:13:04 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38f265c6cb0so2634625f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 02:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740478383; x=1741083183; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=j/CdZ+U93yCfAHM20K4VCGZK5tana82Sk9q6rPMpkaE=;
 b=rtXlqRFJNCM6OLrWOlv7P4SVMeVmULmhb4/g1QEpWmF9GDZ1Y3dqpBiUm8R41Mcs1N
 eGM99BFgFoxZpp5D0XtPzefx9TLiX9rjIVEkMVUequ6HM9BHuAYfw8LgvixidB3mreUw
 5NebVOPN9xYtO3EyYLUB6ZG7ja4CGpSD9PMa/aTvXtuH3PFEWHSezhxDsbOR+2aTlOsN
 x//N8KORypfnn0F+2JLrC/pZIFgFqOwGAllxnS4zqtBAnj1oJuJ2AR/2mXcIyoHg2YLe
 H60UEluzb/YJCvm3wtAZ9DGSlzDHCh3Z1RS0uMLa/qwg6y8SqQurHsHh2FMRbp57haja
 SNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740478383; x=1741083183;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=j/CdZ+U93yCfAHM20K4VCGZK5tana82Sk9q6rPMpkaE=;
 b=VYsHJgEMJeXlYb58My115BYEy0bp7bLvy11ClSdeiR5QT34fXTSbVOyOQy4U/p19pd
 R3ERaHiSaoUXYZw0kb9B1qMTLc1X0dZq4+bm8jJURSDFWp6C0JcnKMKW//JyhaDwI6/U
 g7mzCl1POjjX/KsQ86V3ZQ6Rx9Kwzr33eVE+Yrd0kAPCRgG8f3V1vaxdeqPvQfV/lmkA
 O6LZ8+fx6FXBm/oehlHbgqCgbC+N6RxQHzDkdzRr0m1gyXZRDW3vfJwtgrIA1ogxUiRb
 Pdn5V2r2j1dvlkaiyx7W5oTwlqQJdBY3r5TiSYb/JrHblCLUKetv3Kdg4djNj6A87g9U
 +HHA==
X-Gm-Message-State: AOJu0YyLPO/2QTRR43ZbFHNQV32Bj9W/zQ/VphBgF2YHg4Qo7XlDF+Tx
 Ofuy1+GjlavjPCU61vzgj4UGQqi9DoZvrEwL5uO7SXJHUef0+6DWOOh8JUO14xA=
X-Gm-Gg: ASbGnctzlnaXoRKrSGn2U4bcexbfkDLcvyKautN0uevM5geYySkyKPiw6PuAdhBnpnA
 CTiV2oVH9yVZjQzdGDRJRyoP0V0yYGj3VRy8QE4xvg+QKp+tbldo8boLcbu95dNXlGozpiHehIr
 Y80jIoB+JGya3bRflnGNIPd8bQdtp9KdeT1n95AKPIJjFRVmgffbl15yl9GYOIADIwMsl5UnFwc
 hI9Kz0o0oPLeYVer1Nn6cIyYpAYpNUbQ377HuZZrCsufXt+jNrw33d2mC+l5vjlRyEfHm5S7B89
 hgqeYhEnaJ9dvkOggTZYSkBJasdeLRzC3eUL
X-Google-Smtp-Source: AGHT+IFG+1rFiHyvGAdLQom1xamSgtQXx5X9EhBwiiiWXiH5ajISwOfGmcfQGL3L3N7dQSd1xz/2Pg==
X-Received: by 2002:a05:6000:1fa3:b0:38d:d603:ff46 with SMTP id
 ffacd0b85a97d-38f7d1ffbfemr10982478f8f.14.1740478382825; 
 Tue, 25 Feb 2025 02:13:02 -0800 (PST)
Received: from [192.168.1.100] ([37.167.173.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43a9d921c9csm93910385e9.11.2025.02.25.02.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 02:13:02 -0800 (PST)
Message-ID: <d08ce3dd-a639-4829-a9ca-c4f897336228@linaro.org>
Date: Tue, 25 Feb 2025 11:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 07/14] drm/panel: simple: add BOE AV101HDT-A10 panel
To: maudspierings@gocontroll.com, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-7-5ccbbf613543@gocontroll.com>
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
In-Reply-To: <20250224-initial_display-v1-7-5ccbbf613543@gocontroll.com>
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

On 24/02/2025 14:50, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> add support for the BOE AV101HDT-A10 10.1" LVDS panel
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9b2f128fd3094bfb6731fc348b91cc101f495a86..a52977ab73dc2edab0d1954c702fd797d6a5b969 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1374,6 +1374,35 @@ static const struct panel_desc bananapi_s070wv20_ct16 = {
>   	},
>   };
>   
> +static const struct display_timing boe_av101hdt_a10_timing = {
> +	.pixelclock = { 74210000, 75330000, 76780000, },
> +	.hactive = { 1280, 1280, 1280, },
> +	.hfront_porch = { 10, 42, 33, },
> +	.hback_porch = { 10, 18, 33, },
> +	.hsync_len = { 30, 10, 30, },
> +	.vactive = { 720, 720, 720, },
> +	.vfront_porch = { 200, 183, 200, },
> +	.vback_porch = { 8, 8, 8, },
> +	.vsync_len = { 2, 19, 2, },
> +	.flags = DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
> +};
> +
> +static const struct panel_desc boe_av101hdt_a10 = {
> +	.timings = &boe_av101hdt_a10_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 224,
> +		.height = 126,
> +	},
> +	.delay = {
> +		.enable = 50,
> +		.disable = 50,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode boe_bp101wx1_100_mode = {
>   	.clock = 78945,
>   	.hdisplay = 1280,
> @@ -4813,6 +4842,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "bananapi,s070wv20-ct16",
>   		.data = &bananapi_s070wv20_ct16,
> +	}, {
> +		.compatible = "boe,av101hdt-a10",
> +		.data = &boe_av101hdt_a10,
>   	}, {
>   		.compatible = "boe,bp082wx1-100",
>   		.data = &boe_bp082wx1_100,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
