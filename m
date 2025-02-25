Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A937A43AF7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE3310E5FE;
	Tue, 25 Feb 2025 10:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vca312RU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C9910E5FE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:13:17 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4398e839cd4so37218415e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 02:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740478395; x=1741083195; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=UIEVpBfqzlAIj3t3+p9Xkb4HBEKJwXzTRtthqqzde8o=;
 b=vca312RUPIa5GN1B3QHjAlk03RJ0BY+uZLxxd7qeqj9OCtLb/mvWbRyV0UpWWEjzAz
 cim/0XE4k2c7N+0CfmwaysT7iNDlD2bVgFd6F8i49RX6EchxFW1dXjzAjQScBKITyrr2
 ZF9KcqOha6ku0gBwEA2C/8pZuLX8XWjUSEq1Af7RyNDKPhnenagliUxjUmJXW8zIOy41
 X37NtDMHJ1Xz0pVaxFK4BLSWwHbYGPLYmX3pOfwy7DBYrrduJo/5679bakLYOtBZuPAr
 X3YKGLU5lydC2vT8jpwT4ADV9S2gFwT428D8m8eMYe4urzW+XjrGMtN0dynJQAPCjDzK
 7ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740478395; x=1741083195;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UIEVpBfqzlAIj3t3+p9Xkb4HBEKJwXzTRtthqqzde8o=;
 b=OTAyuV3XYm4Zttn17WEMbe9ea8I8FC2QmRxqh9VFNuXMOwfz2Q0lMW/yTI1d56ymN4
 VfIB6jiQlocepZ1YszWbY0DNv3qQ/t7n5GjIEYQfwVu3XNEqF++2uDtMDV9pDUF9qbjE
 6H9tU4Q9t1eXaghzyFUbCE25u3irvcJtta47+itvZOL/vv9EOi7Jdav9heYF24ZwD9hq
 FJ7fqfPM24NnkXJjHcWtH1iOjgMXyYVEi19luiVhFpc4GoNzI/T+hw5EYYoJ5Ghx4ihh
 xtdAqrjTeINL0wz8H9X4WuzYdEwTI7GyrbuLgHf6bhyBe1ai4a/JYHxOmJn6hDv8qSR8
 YBXA==
X-Gm-Message-State: AOJu0YxxVRUAt+RTh4huvNE6903lVVKuRYEF8OtXq8+qvTQFElknenmI
 +ErVGCaRh18wvBwH1QcBdrnmiNO7LfhqyfoHeyYd4E5BfKM95+D1fjJbeFoHsIA=
X-Gm-Gg: ASbGncsrIsQxxhfPwvIgRCR8+CaIYrxLn3pfLdgRkQw7jPH0dpYT43q+lti1XDk5mDX
 OITcsTvEzTYADilkHdXkR3pXCksJ7ccqPyo97NSBkyh8IzZHQwdbdfDBnSqp4R9zlpalrZuarqd
 oxOHv5sXw+0CM3cAu2WVdZOMXvKsCv0VWtP3Uhr85X2K2Lu2RQ0pKBrhmETlrmbZWf0eoLivhcm
 A3tymbmsI/ZTW8d4ltfkcgYivi/DNBSYrhRxvgU4jhnkoPlGBq4NA77JgilkTsmeWy5Bz0J+aTC
 3vydQ3G3ovZtBHZTO1Ho/HhTvuwRg2vD9pwz
X-Google-Smtp-Source: AGHT+IHuxrFve4RrQxTJm/qq5KQxrxMVsYCL+f8dws0ADcO/Z7yzKKpEwdKKdpFUHyiamvR4ZVYVPw==
X-Received: by 2002:a05:600c:46ca:b0:439:4b23:9e8e with SMTP id
 5b1f17b1804b1-439ae2d1f3fmr129669155e9.3.1740478395441; 
 Tue, 25 Feb 2025 02:13:15 -0800 (PST)
Received: from [192.168.1.100] ([37.167.173.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02ce615sm135803455e9.5.2025.02.25.02.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 02:13:15 -0800 (PST)
Message-ID: <d4903cb5-f876-4229-b89c-c1fafd77fc3c@linaro.org>
Date: Tue, 25 Feb 2025 11:13:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 08/14] drm/panel: simple: Add BOE AV123Z7M-N17 panel
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
 <20250224-initial_display-v1-8-5ccbbf613543@gocontroll.com>
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
In-Reply-To: <20250224-initial_display-v1-8-5ccbbf613543@gocontroll.com>
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
> Add support for the BOE AV123Z7M-N17 12.3" LVDS panel.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index a52977ab73dc2edab0d1954c702fd797d6a5b969..232b03c1a259eb15e423b9d452d28e2ff95c70f8 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1403,6 +1403,35 @@ static const struct panel_desc boe_av101hdt_a10 = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct display_timing boe_av123z7m_n17_timing = {
> +	.pixelclock = { 86600000, 88000000, 90800000, },
> +	.hactive = { 1920, 1920, 1920, },
> +	.hfront_porch = { 10, 10, 10, },
> +	.hback_porch = { 10, 10, 10, },
> +	.hsync_len = { 9, 12, 25, },
> +	.vactive = { 720, 720, 720, },
> +	.vfront_porch = { 7, 10, 13, },
> +	.vback_porch = { 7, 10, 13, },
> +	.vsync_len = { 7, 11, 14, },
> +	.flags = DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
> +};
> +
> +static const struct panel_desc boe_av123z7m_n17 = {
> +	.timings = &boe_av123z7m_n17_timing,
> +	.bpc = 8,
> +	.num_timings = 1,
> +	.size = {
> +		.width = 292,
> +		.height = 110,
> +	},
> +	.delay = {
> +		.prepare = 50,
> +		.disable = 50,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode boe_bp101wx1_100_mode = {
>   	.clock = 78945,
>   	.hdisplay = 1280,
> @@ -4845,6 +4874,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "boe,av101hdt-a10",
>   		.data = &boe_av101hdt_a10,
> +	}, {
> +		.compatible = "boe,av123z7m-n17",
> +		.data = &boe_av123z7m_n17,
>   	}, {
>   		.compatible = "boe,bp082wx1-100",
>   		.data = &boe_bp082wx1_100,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
