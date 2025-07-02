Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD545AF0DE9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 10:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1588510E319;
	Wed,  2 Jul 2025 08:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iV7Hi+12";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8486610E319
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 08:26:15 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso40611795e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751444774; x=1752049574; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=MbM+6D17S4lWaNX9Nj5bx/ZziUeNbW5a29FJLV75guk=;
 b=iV7Hi+12rK7V0O/Ubykt7y6LfmcnAm9seOGd+l19cPWbTZXWH3qsJdvu7qJ4ZiADB+
 iHRuPwIgwtQitinfo8KhpjPr3YlvBqMnl2abhwqKoHknfwnx6srL6d/ov/YTlaOCIaXh
 AAzrmXRI6Ov9yZ3r25DQOs5Np+km4lHQ0zOFNtlrsTdJL9WMNM6Xn79lZTRPLA9ZZk1G
 uy/XEE/J2VQe7QVSqbuLvWTzxxoo/6ZXPqdGQcGzLTtVbwTgduWpdCbW8/YYaUZswLHr
 lRIVz88tsV55bDAkWBcEPPZLZBrgpXZsNC+isDiBnPrI1Ij4CNeHY6FNG2uCVhO8sd7Z
 zmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751444774; x=1752049574;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MbM+6D17S4lWaNX9Nj5bx/ZziUeNbW5a29FJLV75guk=;
 b=Lbpw6wmJXa3vj7OnrlJ7M6c2dy9lDQpZ08OAc2HwE52nNnUFmCVp9tVjkQjqYXE3mt
 /2c+0o6y5fyrbdOplzUfQFSX1clyg30PmUEj4RXEKQyeE9eRTmaoW0D5Vq1dDqDd41DB
 6yNTRSfoNBku7x7JZg2q6kY+e9JPdFap55W//UynQDA/QSAtNOqyCR3NI7AX5JU3D+w6
 BJKfgaxwSnmK+b/DaehUrAdXWbR7ZxpCuzNKHltUqx3SP+5KSorjBvpytBuh3ovGitIQ
 yAMcRAjqxk8JzgJa6AGAGFy9toSFl8WVqxVWL1Tbf9kcHR+qpflCESo/veAYfAexmwnP
 TBgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4tRpmW0/awL+d6ATHeY5ZVKAb0GBJLu7Sy2YFY/eigb9hWVS6K8ITzqcD5c5N4KKqbJ4JktBtvGM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtyWfabOnFXbVIusdzHY/3oWlHuXYNd57Gf4GHEGb60J6EdKmc
 RqtqrNZXyuU6f8zYZDFixFIJ72y7xdBdmVk0bJU3ctL/31ytIHq1Rh8I/nhmDdSk9JI=
X-Gm-Gg: ASbGncsRaxR2zfrbXHzfWy+zA/zrz/flzdV3hs4GyMgLT5Gv3jdQXMV78BofYtK2u06
 sr3Zz0JzXvc+p7+qLo46Elo8yuTzkDEu2ux453by5arRbI9KqogpOboenIke6MYa2vyA8nazi08
 Hy83k2We1A3VKKuOewI1RKwKDP7AkFjPQJVmZFfompiwFCqmj8e6F5ln3oVK152wlmjFOfguXOW
 6caYGA85T0fo7FOBW940IriMbni0wUaNak5DriR9daSbz3YbmR7rqVRLFGyrkg0YjaS2p2CS+bm
 /9eqc7iKCdwMwB6yv9BujcmYS1jJjNp/bIwheovn2j9ZiUhsPUneiR8YyRdXsmbxFE4D7dsl82E
 d8b19rKAxjCvDbLn/LZ+L1z9WPb2xYdkcgkRBtBk=
X-Google-Smtp-Source: AGHT+IGsKkO7aO20RFhbU0qabf72Beoj8L/ayRKp5D90Z9aMH5/tYADAONaucmP2V6Q3nUggXxRGvg==
X-Received: by 2002:a05:600c:8710:b0:43c:fe5e:f03b with SMTP id
 5b1f17b1804b1-454a372e783mr24709275e9.30.1751444773939; 
 Wed, 02 Jul 2025 01:26:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:50c5:f782:9f70:bac0?
 ([2a01:e0a:3d9:2080:50c5:f782:9f70:bac0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e5f923sm15068000f8f.89.2025.07.02.01.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 01:26:13 -0700 (PDT)
Message-ID: <0655dcf9-fce4-406c-b4df-434daf82cce1@linaro.org>
Date: Wed, 2 Jul 2025 10:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add Olimex LCD-OLinuXino-5CTS
 support
To: Paul Kocialkowski <paulk@sys-base.io>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20250702082230.1291953-1-paulk@sys-base.io>
 <20250702082230.1291953-2-paulk@sys-base.io>
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
In-Reply-To: <20250702082230.1291953-2-paulk@sys-base.io>
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

On 02/07/2025 10:22, Paul Kocialkowski wrote:
> Add support for the Olimex LCD-OLinuXino-5CTS, a 5-inch TFT LCD panel
> with a mode operating at 33.3 MHz.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 0a3b26bb4d73..b3d7a0eeabd5 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3655,6 +3655,29 @@ static const struct panel_desc olimex_lcd_olinuxino_43ts = {
>   	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>   };
>   
> +static const struct drm_display_mode olimex_lcd_olinuxino_5cts_mode = {
> +	.clock = 33300,
> +	.hdisplay = 800,
> +	.hsync_start = 800 + 210,
> +	.hsync_end = 800 + 210 + 20,
> +	.htotal = 800 + 210 + 20 + 26,
> +	.vdisplay = 480,
> +	.vsync_start = 480 + 22,
> +	.vsync_end = 480 + 22 + 10,
> +	.vtotal = 480 + 22 + 10 + 13,
> +};
> +
> +static const struct panel_desc olimex_lcd_olinuxino_5cts = {
> +	.modes = &olimex_lcd_olinuxino_5cts_mode,
> +	.num_modes = 1,
> +	.size = {
> +		.width = 154,
> +		.height = 86,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +};
> +
> +
>   static const struct display_timing ontat_kd50g21_40nt_a1_timing = {
>   	.pixelclock = { 30000000, 30000000, 50000000 },
>   	.hactive = { 800, 800, 800 },
> @@ -5214,6 +5237,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "olimex,lcd-olinuxino-43-ts",
>   		.data = &olimex_lcd_olinuxino_43ts,
> +	}, {
> +		.compatible = "olimex,lcd-olinuxino-5-cts",
> +		.data = &olimex_lcd_olinuxino_5cts,
>   	}, {
>   		.compatible = "ontat,kd50g21-40nt-a1",
>   		.data = &ontat_kd50g21_40nt_a1,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
