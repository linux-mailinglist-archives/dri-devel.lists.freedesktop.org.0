Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A4AABB82
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 09:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CDA10E06F;
	Tue,  6 May 2025 07:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SgEbaNn8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC8610E06F
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 07:42:38 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso32929415e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 00:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746517356; x=1747122156; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Vh83Cr86myKpT/xxvxdNHA88dLzEPKe/Vq3zERRKRoI=;
 b=SgEbaNn8RjkW87BG3RV9AOb9SPWsC/ebEOlppBwPAyItk7mxfWh+hH8qZ6w/VG/F3R
 WpenSH2A/11F7LHM8LKeaOBdSVI2snTpOn41xk6IrzHKKD3U06YdgywtE3+WQlKhu65e
 AUEKESz5ZTLs1bQvCHcRZiZ+gVCPetBdi0EPSk7K4Oc5XvmKGLocwsxRP5FXZ44XiY8m
 EJw3FCyQZYOcMhovuVeTvH8Lb/32p7mmlQUyWVKBtwruW+QdytL2hTV/qarnVKoD6+44
 xyGfC0u5n3ixc+gL/xcYg8XFD7x6AVPSsGSch4hZFvjhq0fbeaUbORKTshW3kBZAKBV9
 mlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746517356; x=1747122156;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Vh83Cr86myKpT/xxvxdNHA88dLzEPKe/Vq3zERRKRoI=;
 b=wo16dCIUpnxsTNiHDKeFr/gWmnczNNNlDCnWxXlkDCrY5SDshqrU7/Ml9lKiRNUAzR
 qPXwM5eiOTbQY/sXjx5liU2YPQxnzk340Pc/EcVHmH/gpVs32vDYDIFMa8AXzd2LN4Mu
 N7jLYJSnW8s4QArbTNcGZp1fXwE8DBD0oaU11gRBY48CD7Gt8hD63UmcgDxGlAllUV8Z
 BQuhmYH3MEcyYqtmM0XCORXqHve4F2U1tMctZlltNvV7+PhOJcwopufsW33P5qPrm9zR
 Zapn/jDpKFWYA2cwNh2+Ld03ei2Wtfwp4vh9UQD3cNheMhlyNIzN8nuqdpFHE6/nX3rm
 swUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNB2Qb8nC7eO6Vdsm4WSdXvI2npFKd+eaBRcA1Ai3S1kADED0LOZ6owIEpxih6aAzpRTlwNojE88E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydM95qyiL2IkRllrIpg6uaZlqIpMwNDy26OE3lVThu70326qz/
 xJyn01CDrgUyipSIYcoKIKNSpfeOmZ3X1FANAki9L5+klITwIhzgD4e8Br7OCwY=
X-Gm-Gg: ASbGnctJ6ikLRJyFIpyiiNRPz4iaJzdB9axPoacAvjbHOQxKjp3dpu5OueUm/8f0hbC
 JfTwTv6dCH/GkllizXpHw9VipTYfoQsob+yHOCoC86VDLBKY6BleMJRCdKdYNmjj5pZ2helKWgs
 QwTtfl6RIffE9dcMDiDKjpVH9el48+8KJUn1DTFXKq1MA3+vie0hZnM0OJWPGOPxc1dYrXcBpKV
 d6NZ8KeKykms72cBSY/R4whsGgvyxiPmv6wRCIVi4mJAYwP5uzcioW6W3pxUTHbDIk2hU4S9gUo
 ANk+YMIYznb34Hstjo3vpL2/8s6PNYucPqTNhqX3H2WqAh/N/4PE+YkLb7xPL7no5fl8aZDHh67
 ihKq7yld+lSQVL3ptnw4oLd7Asn62
X-Google-Smtp-Source: AGHT+IE7lA05hqmzBtHBX0KgbjWpLd4PA2JGm5RJ1Hk27fXzxfMHd8z0NDIazoFMjl4M7chYqanXHA==
X-Received: by 2002:a05:600c:1d0d:b0:43d:26e3:f2f6 with SMTP id
 5b1f17b1804b1-441d04f3a09mr14783115e9.5.1746517356603; 
 Tue, 06 May 2025 00:42:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:127a:7a9e:6ba7:152f?
 ([2a01:e0a:3d9:2080:127a:7a9e:6ba7:152f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b0f09dsm12842019f8f.63.2025.05.06.00.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 00:42:36 -0700 (PDT)
Message-ID: <d9594641-a6aa-40e9-b8fd-b6002000e490@linaro.org>
Date: Tue, 6 May 2025 09:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/panel: simple: Update timings for AUO G101EVN010
To: Kevin Baker <kevinb@ventureresearch.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gonzalez <alex.gonzalez@digi.com>, Thierry Reding <treding@nvidia.com>,
 Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <dbd8e1bc-bc23-4240-b6b1-321ac6f5ed68@linaro.org>
 <20250505170256.1385113-1-kevinb@ventureresearch.com>
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
In-Reply-To: <20250505170256.1385113-1-kevinb@ventureresearch.com>
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

On 05/05/2025 19:02, Kevin Baker wrote:
> Switch to panel timings based on datasheet for the AUO G101EVN01.0
> LVDS panel. Default timings were tested on the panel.
> 
> Previous mode-based timings resulted in horizontal display shift.
> 
> Signed-off-by: Kevin Baker <kevinb@ventureresearch.com>
> Fixes: 4fb86404a977 ("drm/panel: simple: Add AUO G101EVN010 panel support")
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index df718c4a86cb..c79dc8581054 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1026,27 +1026,28 @@ static const struct panel_desc auo_g070vvn01 = {
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
