Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86E687AD4A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5386710F4D9;
	Wed, 13 Mar 2024 17:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xal6nYPR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7F210F4D9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:30:55 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-33e92b3b5c9so18578f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 10:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710351053; x=1710955853; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=AoJBLvGLSO1Au71tnmkkcC/uvFLxr7hz04I6Ua/2Z9M=;
 b=Xal6nYPRoLTMiIucxMaPH9wzdMskgDUUv++Mdv993lzv91SzfYWcF83vRBEzpld6G9
 g+OjTZG0/ezKN30o1ZOdgltvI/Emc+SyuiJ/KHLIzhKBllZC4C9ItIrBdUZpLHKoWzl3
 37nYJZMnBP3Gfk8MvHxwI9d/ENkgZ6Bz+a2MuYEj0MWtukNBBW31Oy4UhY388MccYPPN
 Evp3JGtcYoo8cM6GXpphZx2TQ/9Nk6EVJwdVgA8tiV6tpbfz1pDPnFiUypsZZ8dxEE2G
 g2Org3YUa2vcB7LcYx923EO/mDikjYNs+dAGt/6Q3MXxHjDwgtzfYhxTtCH2NmlBPu1E
 bNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710351053; x=1710955853;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AoJBLvGLSO1Au71tnmkkcC/uvFLxr7hz04I6Ua/2Z9M=;
 b=cxw4XzDONCNuNkAomYCSTOHVAckdKJ59NwoI3WJLZJygpFEQy8p2zNhHGEaG+8LdIS
 /Yxk4Kdq6gaA6PPgd0nTaDKnmeDfvg9/YVKfjoTo3Wi3BlrFEsbnaGPmGNrNJmuYIA4k
 AoW/PuMLMmvm75cAGGm8B41VyN++GUYv/iOoRx2k4Xe/hTL7DJi3Ff3WLBZjYrVc6+W6
 RsRRSXsg9H1ouS/jIhJcb9XeU65YOxP51sgou820062b3Dz7R2Q+NPhqI67Hm08c/VSc
 9LjwDYu9RCWmN8AMHKWYAMmASkXgkqNUSBokW7wcIBlMq5z+YPBahK5tMXYlubv9FbBL
 Ujzg==
X-Gm-Message-State: AOJu0YzUCkV8COm3HoupQAn7MQCdMv9JysO3O+DcYkytN9+Fo9EZacZx
 9SPaApo0t2a6K+wd4bKfPZ1PKfu9zxOJB/asE1VWgLhjuuxhVhARxKMtizJaInw=
X-Google-Smtp-Source: AGHT+IFpt3nKpb6yZp4WeSJe1NcrqDMP7HGMmEVeZpWD8HEqgofCrKHYpfbd5ftktIToiD8wlHn5zA==
X-Received: by 2002:adf:e482:0:b0:33e:9113:a228 with SMTP id
 i2-20020adfe482000000b0033e9113a228mr2042063wrm.35.1710351053336; 
 Wed, 13 Mar 2024 10:30:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c945:fed:36d6:130?
 ([2a01:e0a:982:cbb0:c945:fed:36d6:130])
 by smtp.gmail.com with ESMTPSA id
 ba1-20020a0560001c0100b0033e712b1d9bsm1934600wrb.77.2024.03.13.10.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 10:30:52 -0700 (PDT)
Message-ID: <571aceaf-fe32-4bce-ba79-8a5718f1aeac@linaro.org>
Date: Wed, 13 Mar 2024 18:30:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/3] drm/panel: simple: add CMT430B19N00 LCD panel
 support
To: =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?=
 <jeremie.dautheribes@bootlin.com>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Yen-Mei Goh <yen-mei.goh@keysight.com>
References: <20240313172016.387277-1-jeremie.dautheribes@bootlin.com>
 <20240313172016.387277-4-jeremie.dautheribes@bootlin.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240313172016.387277-4-jeremie.dautheribes@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 13/03/2024 18:20, Jérémie Dautheribes wrote:
> Add support for Crystal Clear Technology CMT430B19N00 4.3" 480x272
> TFT-LCD panel.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 20e3df1c59d4..d13c42d0f57b 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1457,6 +1457,32 @@ static const struct panel_desc boe_hv070wsa = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct display_timing cct_cmt430b19n00_timing = {
> +	.pixelclock = { 8000000, 9000000, 12000000 },
> +	.hactive = { 480, 480, 480 },
> +	.hfront_porch = { 2, 8, 75 },
> +	.hback_porch = { 3, 43, 43 },
> +	.hsync_len = { 2, 4, 75 },
> +	.vactive = { 272, 272, 272 },
> +	.vfront_porch = { 2, 8, 37 },
> +	.vback_porch = { 2, 12, 12 },
> +	.vsync_len = { 2, 4, 37 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW
> +};
> +
> +static const struct panel_desc cct_cmt430b19n00 = {
> +	.timings = &cct_cmt430b19n00_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 95,
> +		.height = 53,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>   static const struct drm_display_mode cdtech_s043wq26h_ct7_mode = {
>   	.clock = 9000,
>   	.hdisplay = 480,
> @@ -4402,6 +4428,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "boe,hv070wsa-100",
>   		.data = &boe_hv070wsa
> +	}, {
> +		.compatible = "cct,cmt430b19n00",
> +		.data = &cct_cmt430b19n00,
>   	}, {
>   		.compatible = "cdtech,s043wq26h-ct7",
>   		.data = &cdtech_s043wq26h_ct7,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
