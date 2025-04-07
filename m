Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7F2A7DA68
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 11:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4064110E411;
	Mon,  7 Apr 2025 09:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PkWFGk/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C3F10E410
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 09:56:35 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-39c0dfba946so2552561f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 02:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744019794; x=1744624594; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=fPyPXdxGGl2k8Sx7xGehlIxRAmU83EBTm5M3zS8a1q8=;
 b=PkWFGk/WtaK4NIGusAhyeP9q4ASR3lYNCSIOh0bfgftgvsylwu4EsHuCGKgGttUFB2
 VItt8lXDwEQnQ8J0KoFlRe13MY3g4D8HNyk/Kn9gVo04IdiaYsTSKvfi9d299wBvhki/
 1WgxdAlPDhhufMZAukVXVliuSJnoWm63QSvbBiIzX9iVU9IyK1pww98TTJrSi5rg4+dB
 zTkwL9Cy6vBtleWnQaX5Ys4f1mktug3WPHRyfmxzDXGQ/xoh2GHjVoPZF2X7ap9oNsD7
 dJCgElybj9agGsrTG3ElrTZ4FpqaEdL1t9Iema1oy3+YjYq01k8uKIELtLP0S0120jrS
 4lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744019794; x=1744624594;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fPyPXdxGGl2k8Sx7xGehlIxRAmU83EBTm5M3zS8a1q8=;
 b=W2rwhXZ0jwlwYgG/hMihXCRdTm1lilZYotjCCo/QSedtTHoy6Z/nJiUiXZNaQgBVvo
 lAo46GVsbAHgO/yi19KlKt+rz0WLZBP1P66CfU6OR25036krHTCfYRafygEQu9k02LsM
 n+TpQ9KILeZctRutQLmE2MxBYBBqLmwnj4Fo1pqzbfJolnQ2Jg1lR73FTNKC3FMHVb1u
 6FZxHpTaRCSZ+ojizNQqy1N6tw5J/U9w/FKRnpawFGkCYwZN3+NP+WWER+KwmI9FpFNj
 I2rhkogGt2xQ64OM0DIhLJbJM9AfS4Idv2R1lXOFkR1YjpkA/xukd2qvkSIRmvvH6LRi
 etSA==
X-Gm-Message-State: AOJu0YzOu+fwS8h9QNKajUKpRVRbSNQev6bdIEkAE0UlDy6mBRS0sJ/9
 cWnXwW5/ZRBi8unG7BhugE8tdRd0Ywad62p2GLx4q6DoNEJD08YtbL9X8HIRC0s=
X-Gm-Gg: ASbGncsQjqO7jOkFMsALYe7US1w0fIEuu40YPjDAeiw0m++mbhtL/Bf2uApFWGR9snO
 aJI7Sl1dC4r7ivo1rWVy8vFlORijjqd6UjTEqRHZz7tCN6ntFB6kf8fHeF6TVVWTq70PG6vtgqU
 15Hr5ICVdtzShd2CODEawaz9KbzKigbRPd201+laET2OCYYQiL2rvKGwCXegI2AuzUPnU6QuK/+
 kvCvwTOh9J4DPUZzow4n155Qh1ERV8tjWxYPlQK9UBFeUR1nD7uDZqTqg3pgBxWjfDm59oyMpTS
 QOk8usJT8T4iXeGk/MKn9ZTtc35o79ekaoprBiC1+4oq7+D7CrJO9FtxO6MmNilt5PVeG6ZsAbQ
 OQdllLkxkthVIwgw/dSfGLw==
X-Google-Smtp-Source: AGHT+IFQhv2mqllajCFsgpQFAgQzTAF18B1E7xBsbczO7Q+g0xg5pZyKhOMA/9Xcx2bdgRY1Us/lrg==
X-Received: by 2002:a05:6000:2482:b0:391:20ef:62d6 with SMTP id
 ffacd0b85a97d-39cb3575966mr10636477f8f.11.1744019793828; 
 Mon, 07 Apr 2025 02:56:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f2a4:b974:cba3:a605?
 ([2a01:e0a:3d9:2080:f2a4:b974:cba3:a605])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec36699e0sm124644015e9.35.2025.04.07.02.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 02:56:33 -0700 (PDT)
Message-ID: <2b5d8f63-d888-4f0c-91a3-216ef9d95d19@linaro.org>
Date: Mon, 7 Apr 2025 11:56:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 13/30] panel/jadard-jd9365da-h3: Use refcounted
 allocation in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>,
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Linus Walleij
 <linus.walleij@linaro.org>, Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Mavrodiev <stefan@olimex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
 <20250403-b4-drm_panel_mass_convert_part2-v2-13-260c8a44c56b@redhat.com>
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
In-Reply-To: <20250403-b4-drm_panel_mass_convert_part2-v2-13-260c8a44c56b@redhat.com>
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

On 03/04/2025 16:16, Anusha Srivatsa wrote:
> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> v2: none.
> ---
>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 7d68a8acfe2ea45a913dff25eb5e9f0663503f08..6b02923de3f0778f45a6f9ce20d70d667772c64c 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -1120,9 +1120,10 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>   	struct jadard *jadard;
>   	int ret;
>   
> -	jadard = devm_kzalloc(&dsi->dev, sizeof(*jadard), GFP_KERNEL);
> -	if (!jadard)
> -		return -ENOMEM;
> +	jadard = devm_drm_panel_alloc(dev, struct jadard, panel, &jadard_funcs,
> +				   DRM_MODE_CONNECTOR_DSI);

Wrong alignment

Neil

> +	if (IS_ERR(jadard))
> +		return PTR_ERR(jadard);
>   
>   	desc = of_device_get_match_data(dev);
>   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> @@ -1148,9 +1149,6 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>   		return PTR_ERR(jadard->vccio);
>   	}
>   
> -	drm_panel_init(&jadard->panel, dev, &jadard_funcs,
> -		       DRM_MODE_CONNECTOR_DSI);
> -
>   	ret = of_drm_get_panel_orientation(dev->of_node, &jadard->orientation);
>   	if (ret < 0)
>   		return dev_err_probe(dev, ret, "failed to get orientation\n");
> 

