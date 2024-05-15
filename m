Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982E58C6DAF
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF41210E8AF;
	Wed, 15 May 2024 21:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="egisHhmG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F45C10E8AF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 21:17:06 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-351cda41b53so1041429f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 14:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715807825; x=1716412625; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=vBWhsyX9LLmi6Zfn+QHqsSBYed60uZAgbYOF3wTL9Z8=;
 b=egisHhmGJs1tJf0XxUQdRvz/fREXAURCEex2wEDdSe/hYqnLfbsimeC4/grKKvNu1w
 OEeA9x+GZlqVVK9KqqysNaCNfMkUIoCLfkpy0iyaUOib/1aagMSAEW1ZDWmEUzAOv3qx
 4ikFZO0NoWCq3A8ZlvSPhtiWvsCzF04H6d6fEeMeadvMTCcNJZ2/3FghqGxipLcisClW
 UixlGZG7HF+272ZcZVdrfj6uwFmOrFXTmepFHWpdmTCkOpEL+dwPpVzYt3wjWMpQNGS5
 D4+8NPIdSGtmsukRxh9vvo9/drzbpqHFUOdAPdMS33qRjRGjKVwCdnIXMzlD7ho6r+QU
 3DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715807825; x=1716412625;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vBWhsyX9LLmi6Zfn+QHqsSBYed60uZAgbYOF3wTL9Z8=;
 b=vXxXRpjNndAjVKmoratenveyX97XLNhCX2n7uqfKwY3KUTCFkg12Bly/2bpYH7ffM6
 sbq78H008CP5kNtSb5i8rvK8ToRwhmDb013kwA1FpR/teqFCVqNup7Bjr59T813i6F2c
 0My+dJAVS29oL3Taokq8UxWmWAFV+FG+yF1EfWXvZWPb3/Yr/B1hXbSdQoFtgBW7tol4
 y/2FqQ7pl21fmCdbzCh0lSOXLwZIHR6941bmuIqoZsxnWtHjwuwWz6XWXddTZkGw/VPF
 KKX/G/gcFHtOU706M3B2+lHoYlfSinNthtMmpF2NpP2UbgS4af96L/kD4EG4njIF8qhp
 GJ5g==
X-Gm-Message-State: AOJu0Yz1s4D01C1+9+9RUJTDbt0vsK6UpQ02jGH5AH/xwGdzeBNDCqDb
 JoP+5ttYpAvilGSGo9MFSpPvDRpIfMy5iKcDivgqUryDsu+Xjwvqa7U7Lxd0fQo=
X-Google-Smtp-Source: AGHT+IGQw+SyF1Ngyi3PHoftO0kJoIhWYm3aqC1MeDXQ/v9s6nV3ueLPsQz8+6lxlT7itvNTlikq3Q==
X-Received: by 2002:adf:e5cc:0:b0:351:cb2d:fd2f with SMTP id
 ffacd0b85a97d-351cb2dffa2mr3200072f8f.19.1715807825162; 
 Wed, 15 May 2024 14:17:05 -0700 (PDT)
Received: from [10.1.2.176] ([149.14.240.163])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b896b00sm17241576f8f.45.2024.05.15.14.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 14:17:04 -0700 (PDT)
Message-ID: <a48e0ccb-43cf-4215-a725-1ed62b222ab1@linaro.org>
Date: Wed, 15 May 2024 23:17:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/6] drm/panel: simple: Add Microtips Technology
 13-101HIEBCAF0-C panel
To: Aradhya Bhatia <a-bhatia1@ti.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20240515095133.745492-1-a-bhatia1@ti.com>
 <20240515095133.745492-6-a-bhatia1@ti.com>
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
In-Reply-To: <20240515095133.745492-6-a-bhatia1@ti.com>
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

On 15/05/2024 11:51, Aradhya Bhatia wrote:
> Add support for Microtips Technology USA 13-101HIECAF0-C 10.1",
> 1920x1200, 8-bit TFT LCD with LVDS interface, LED backlight and touch
> support (ILITEK 2511).
> 
> [0]: Panel Datasheet
> https://simplespec.microtipsusa.com/uploads/spec/datasheetFile/2588/13-101HIEBCAF0-S_V1.1_20221104.pdf
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 10e974bffd28..3a0d8f0ff267 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3055,6 +3055,35 @@ static const struct panel_desc logicpd_type_28 = {
>   	.connector_type = DRM_MODE_CONNECTOR_DPI,
>   };
>   
> +static const struct drm_display_mode microtips_mf_101hiebcaf0_c_mode = {
> +	.clock = 150275,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 32,
> +	.hsync_end = 1920 + 32 + 52,
> +	.htotal = 1920 + 32 + 52 + 24,
> +	.vdisplay = 1200,
> +	.vsync_start = 1200 + 24,
> +	.vsync_end = 1200 + 24 + 8,
> +	.vtotal = 1200 + 24 + 8 + 3,
> +};
> +
> +static const struct panel_desc microtips_mf_101hiebcaf0_c = {
> +	.modes = &microtips_mf_101hiebcaf0_c_mode,
> +	.bpc = 8,
> +	.num_modes = 1,
> +	.size = {
> +		.width = 217,
> +		.height = 136,
> +	},
> +	.delay = {
> +		.prepare = 50,
> +		.disable = 50,
> +	},
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
>   	.clock = 30400,
>   	.hdisplay = 800,
> @@ -4694,6 +4723,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "logictechno,lttd800480070-l6wh-rt",
>   		.data = &logictechno_lttd800480070_l6wh_rt,
> +	}, {
> +		.compatible = "microtips,mf-101hiebcaf0",
> +		.data = &microtips_mf_101hiebcaf0_c,
>   	}, {
>   		.compatible = "mitsubishi,aa070mc01-ca1",
>   		.data = &mitsubishi_aa070mc01,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
