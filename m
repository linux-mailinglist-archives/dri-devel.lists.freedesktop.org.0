Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593A6AA8D5E
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 09:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1CF10E28E;
	Mon,  5 May 2025 07:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FS8q7dzB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50EC10E28E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 07:50:45 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so2480519f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 00:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746431444; x=1747036244; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=uCzAWVJKudlGSsTTp8Mqf9Mg/VxXTDyWoombBPE5a9Y=;
 b=FS8q7dzBZGJlTunvEFr+ZEVX/i4aVW6k7zjhHKSGWZnaTlpzAH7hOr4c2W8G4BROK+
 M6MOxJTPyv/7WAIFRzaaCKbphQYguuRs1weIJTzQzfWujYoXHxEpjWiuG0FIotQUkMBF
 AAhjP/Rf+Ik3UHNnhaK5oS1CrFM+PAwL1ZejQiT1QaO9FKgagudmAbXPCi36fcu9pVjt
 3vDYlleEgVKGm3doSeNVJYHOR6z48ggdLmMOm8Btks5+cW87qRhHZoiXu+vqwjaLOM0A
 qKw6o+eAE95C9thkNnUuRTl6F36E8M2AJTOpqSZPC2rXIDyYrPPLq8pF94+jC09AFKVS
 RzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746431444; x=1747036244;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uCzAWVJKudlGSsTTp8Mqf9Mg/VxXTDyWoombBPE5a9Y=;
 b=Q+CrkhOyto5pHhrKrtrr6rjnh4WHr6D3cFx2TSqlrz7YBUf+b5bqdDP8GMkBYMFY2n
 xze8nFPUZz/2TSgrS4QN8rcx9L/CmXtKN9gE4tmGbeF/0AWqUBLwg7FeZO4Z0amuJbL2
 nnDE5C+MwxjzBVzKbnIdRmhD30DJUcmksbdf/0XSL5w7n1LiQIAG7oh0vU0N5hzqoCCQ
 UXrnw/FgIdceiWFhKFFt9KUXU05gZ1W0/l/FDxug6iIb86k8Mund/vyHPlaBrKzVAZ/A
 vayHd4J82dhiQGeKh8ZcejiqANMuG1XO1UmnckeZOsfkixrpGsZNjzIP2LXrpteIH46g
 kKww==
X-Gm-Message-State: AOJu0YxtlBGCXPX2iq0QzN+qPv1Z3EWXSqjVCwuvvVUEyx+nU/ScPyL1
 +U4zyBx5Psp9n+cduio657ggXTGBLsjzT+nd45OLhqQOHWhXGxViYLsRSmyOk5I=
X-Gm-Gg: ASbGncsxO/yPkUn99kMCWjyKJ87YHAIfapz5VLHnIhgEpkta8qDZpXGLFiopk3Gvy5Z
 bLEl7lDQZ3twORmal8zGmtXx5U75XPBS+9xwRSWvyeZdMxR5s5UGFivYMDgYSe81qjJS9w2DHTK
 j9pb+nZzeYDLLO/JZ10pxdD/0et7hmNPqYFur7TghlQAhOVIzvz+QlQkeaG+I0gryuF7AH1QX3e
 5cOGGaHRuGCsVtWOUYYTYVxh7IYKEYqVxl54wJFIWsL59DZtW8c6Ci04fTCB4S247/fh8WncNq5
 wa4NPBebtueiNpQdWgT5bpoisG2zlOYcTP70xyDhvR5P0P5WE3IwAaM95hXKYvwstAxbjw54INa
 ldP/pji+aqndSbuzkhGszmHg0KCUo
X-Google-Smtp-Source: AGHT+IG0YjR0pOS+mPxGwAmH+DdU4Wux8KjtWtFkXVVNHEhAlQOHrjEqILqYPlZacgqXKNWhcBJj9A==
X-Received: by 2002:a05:6000:3108:b0:391:466f:314e with SMTP id
 ffacd0b85a97d-3a09fd88976mr4436114f8f.16.1746431444177; 
 Mon, 05 May 2025 00:50:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3?
 ([2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae338bsm9395380f8f.27.2025.05.05.00.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 00:50:43 -0700 (PDT)
Message-ID: <ffac4a1b-5dfa-48e9-8ac4-37939b6a9347@linaro.org>
Date: Mon, 5 May 2025 09:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] drm: panel: Add support for Renesas R61307 based
 MIPI DSI panel
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250503094149.29201-1-clamor95@gmail.com>
 <20250503094149.29201-3-clamor95@gmail.com>
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
In-Reply-To: <20250503094149.29201-3-clamor95@gmail.com>
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

On 03/05/2025 11:41, Svyatoslav Ryhel wrote:
> R61307 is liquid crystal driver for high-definition amorphous silicon
> (a-Si) panels and is ideal for tablets and smartphones.
> 
> Supported compatibles are:
> - hit,tx13d100vm0eaa
> - koe,tx13d100vm0eaa
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                |  13 +
>   drivers/gpu/drm/panel/Makefile               |   1 +
>   drivers/gpu/drm/panel/panel-renesas-r61307.c | 327 +++++++++++++++++++
>   3 files changed, 341 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c
> 

<snip>

> +static int renesas_r61307_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct renesas_r61307 *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->vcc_supply = devm_regulator_get(dev, "vcc");
> +	if (IS_ERR(priv->vcc_supply))
> +		return dev_err_probe(dev, PTR_ERR(priv->vcc_supply),
> +				     "Failed to get vcc-supply\n");
> +
> +	priv->iovcc_supply = devm_regulator_get(dev, "iovcc");
> +	if (IS_ERR(priv->iovcc_supply))
> +		return dev_err_probe(dev, PTR_ERR(priv->iovcc_supply),
> +				     "Failed to get iovcc-supply\n");
> +
> +	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						   GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> +				     "Failed to get reset gpios\n");
> +
> +	if (device_property_read_bool(dev, "renesas,inversion"))
> +		priv->inversion = true;
> +
> +	if (device_property_read_bool(dev, "renesas,contrast"))
> +		priv->dig_cont_adj = true;
> +
> +	priv->gamma = 0;
> +	device_property_read_u32(dev, "renesas,gamma", &priv->gamma);
> +
> +	priv->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, priv);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
> +
> +	drm_panel_init(&priv->panel, dev, &renesas_r61307_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);

Please switch to devm_drm_panel_alloc()

> +
> +	ret = drm_panel_of_backlight(&priv->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	drm_panel_add(&priv->panel);
> +
<snip>

With that:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
