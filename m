Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12736CF4516
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 16:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A08A10E405;
	Mon,  5 Jan 2026 15:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Mg4y+KTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12C610E405
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 15:11:16 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so76575e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 07:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767625875; x=1768230675; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=fIpW6cQc9IrIDvqtHuiJ6nwu+gkAkXOSeW3JkpE2jgw=;
 b=Mg4y+KTBY/VEp17m3YJZatJOBZEWH+w521IvQmUSka85D1FsFjwtljJNxFm/fz8lZS
 PRNKA5HzCgRPf1u3jPvRQN8hIr0/nJB1No29hhZZCbQ8BaxR1vYwcMvqjkh9MV1Aznn2
 If5gJOJ3uSxa4CaCUTGsf0TtZLM4wgq1VLswInsLYjEQI9MirCdSZYbx+fc9J6OVM4tW
 xNSMFCVEKBRPP60FxTQCV0PcNuwnTaOtwyMDOqAlJUDmeKDcsjsDyi3XP8a9X/lYSJI3
 MccbtotuUbBhzwPxWiHKRFfReth/sexlRzvILoPVEp7aPuszP+wehiEd5BxLd5uTwJ1N
 sLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767625875; x=1768230675;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fIpW6cQc9IrIDvqtHuiJ6nwu+gkAkXOSeW3JkpE2jgw=;
 b=KX9MrtOAW71BgCDrw/K+zjaP+rDTIh1zzjOeTngEe4P6BMGo14jMnDXLFyODlqusMa
 L9USPNz4osJQrO4ZpQiaPYyVuMeIJKwkqQI1DgkadXnoyQxYGXd/QbsmJoRB/avFRSyU
 vL8iRen05XC/YBXrxZeWd2eRk11wdM6JZUZ+RbrUytN48SE+oWCgtz/tdwhJUk0Vmp2J
 nDf1jArMNOfOzlkSi+gr96B1DfTUPsS5mGaV0rJP218ipYGnfufWqYZHZqcC6fJRxgzE
 xX+I4ABaIqTWThwdHHp8UoTbXs1CgCmlMmaZ9jst/A2UupRvU4RsVqtXuz7Pd6mXcOzB
 IqDQ==
X-Gm-Message-State: AOJu0YyIG7VP7av6CC+bJ5WkiZHs9M7e4XxBLJkPn2wvyXCXkegLZ1zd
 1dFZ37HNgpt/Pkz42hFoebTvYzoKynXi0dIHV+UB7Jn1E5MkVy9MSXy902o7deE3DhGNQVSYjPe
 2juCx
X-Gm-Gg: AY/fxX49WXxKEApdPnS+z7xPyWRT4ExG9Li9HLhaZN331uDe41tOBjW6fBe+kuYIChy
 XeiXTiMItTjxK8es/97rrJxnu/Ni75GOhVtBwAdLCDFiab2+686jUuK+k4T/jBDLEOMxY3BReH1
 Vb6kynVpO+LpCE6V5GleVajGgAjUN3ZRj4pj9EV6YZzCaxN6IK5GQrmWcc5ZhI72Y289jOErSnn
 vyKyZGO2wk4gr3nQQPT6TY8D2w3uivrOYwC6F+EPhudfNtBJrWIhtntEUQj8j/Z6b5yFyNhcUdc
 Vbt9XJW+vNKN+W5OXzzdVp5bJqB++EbnzAuI6NUJfcjxCCTACElyeKz4067pGc9LAPaU4iuNsZj
 4bsSD0VDQVoqUyBjCItf/le2bsHU50FFD+VYDkQXVOIkUbBZhKTJfN1rXBMqG7hSCoXD1pXLmU2
 cZ/ydqkFNluB9UwWcFNMT9fNnCBF6Z99rQqCF9MusEsT0IqEsdkyVE5sw8vJ8HuuI=
X-Google-Smtp-Source: AGHT+IGUHUHeBKegaOYx59FFoOUtzcp8vHYfP0LVvdnYaJI+3e/IojOUAlwYde9llSXTl/krlM8cpw==
X-Received: by 2002:a05:600c:4ed2:b0:475:e067:f23d with SMTP id
 5b1f17b1804b1-47d1959eaaemr657588355e9.25.1767625875140; 
 Mon, 05 Jan 2026 07:11:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d4c1:5589:eadb:1033?
 ([2a01:e0a:3d9:2080:d4c1:5589:eadb:1033])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d73066fdbsm107246285e9.15.2026.01.05.07.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 07:11:14 -0800 (PST)
Message-ID: <91d3e10d-1f8e-4c1a-9919-fafb949e935d@linaro.org>
Date: Mon, 5 Jan 2026 16:11:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/2] drm/panel: simple: Add Innolux G150XGE-L05 panel
 entry
To: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>
References: <20260102141706.36842-1-festevam@gmail.com>
 <20260102141706.36842-2-festevam@gmail.com>
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
In-Reply-To: <20260102141706.36842-2-festevam@gmail.com>
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

On 1/2/26 15:17, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Add support for the Innolux G150XGE-L05 15.0" TFT 1024x768 LVDS panel.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v1:
> - None.
> 
>   drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 3acc9f3dac16..c606e5932ca7 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2836,6 +2836,32 @@ static const struct panel_desc innolux_g121xce_l01 = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct display_timing innolux_g150xge_l05_timing = {
> +	.pixelclock   = { 53350000, 65000000, 80000000 },
> +	.hactive      = { 1024, 1024, 1024 },
> +	.hfront_porch = { 58, 160, 288 },
> +	.hback_porch  = { 58, 160, 288 },
> +	.hsync_len    = { 1, 1, 1 },
> +	.vactive      = { 768, 768, 768 },
> +	.vfront_porch = { 6, 19, 216 },
> +	.vback_porch  = { 6, 19, 216 },
> +	.vsync_len    = { 1, 1, 1 },
> +	.flags        = DISPLAY_FLAGS_DE_HIGH,
> +};
> +
> +static const struct panel_desc innolux_g150xge_l05 = {
> +	.timings = &innolux_g150xge_l05_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width  = 304,
> +		.height = 228,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct display_timing innolux_g156hce_l01_timings = {
>   	.pixelclock = { 120000000, 141860000, 150000000 },
>   	.hactive = { 1920, 1920, 1920 },
> @@ -5314,6 +5340,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "innolux,g121xce-l01",
>   		.data = &innolux_g121xce_l01,
> +	}, {
> +		.compatible = "innolux,g150xge-l05",
> +		.data = &innolux_g150xge_l05,
>   	}, {
>   		.compatible = "innolux,g156hce-l01",
>   		.data = &innolux_g156hce_l01,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
