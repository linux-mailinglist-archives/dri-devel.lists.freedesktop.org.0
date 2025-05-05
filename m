Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4F3AA8D66
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 09:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CCE10E2FF;
	Mon,  5 May 2025 07:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UII17Gxi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB95410E2FF
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 07:51:42 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4394a823036so38576915e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 00:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746431501; x=1747036301; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Wie8r7wwaj4hCKnvUhWZAyBhmz21TlJyJxhA0DAvZ0Q=;
 b=UII17GxiLzzlhPB8Lfn4tDNaBx4j9Yxf4R5y0fveN0fYMQ1E/L0Fo7NXd8JnQgz4Nf
 MkH/dYq/6zXyE0rBGNZ5VPzX3KDys2dE+fAksu8lKc7yOyXWN/mDFcwy4VLl83YJw8pH
 d0bsgD52jl/W1YQpb+7yrNoBMc1RI3tBaOHNhIT13mg24NJeoGdIEN2pXpx7Bs8rSDgM
 qy5pSBeZev+I/jE1it7P/zB56weqLHT51tlEydR7w9c0FANWvNXmhqkUPjdpyR9U1p55
 4D8QAdvtalLqROKPfBg0uXDFRJJCPCD6TWaWR1T+yMAfvMklupSPWdtPLiEwQvTLTZ4m
 e3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746431501; x=1747036301;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Wie8r7wwaj4hCKnvUhWZAyBhmz21TlJyJxhA0DAvZ0Q=;
 b=KhQffR0QKH3QF9nTssnh28zDYOO7Y8AiuYjMDea9Xex1H7SO1xruf6yIcaA0wzNYux
 7B6MUOZeeMnIAxNB3zjOH0K2wsY8V3/Q9b7RjmEvkl7v4zDXJBIg4LFYooGSJ1WB+ffi
 fyFTuA+PJVZdv6765F3Zh0luz70wdxEcs7CSivze1UVkF8JVOMdPqeblBqQl/CgJ0OBo
 vqxhNwej9RXioqOiV0bftE+yOpQgoYGJ3nkz5eNkJslveC/Xj82+M7u7s0ExwBcFsLv/
 /bn9YLlBaUbxmLWD8WWWX/HYFAFReeMtE+RKswg/tAjspu+WzC6xNZydpIOidOr7Ls7j
 HArA==
X-Gm-Message-State: AOJu0YyM4kj231hs3VnUqcgqd+H+kS/PyseoLfKOM2NeWMjA79cQqz0N
 3qDFLUZPfuSqHXa+j1p8GaSbcXsQKVy98zgbo+f14KIOscjgVA8zrsH0ps3Hux8=
X-Gm-Gg: ASbGncu60KS9Q5amlULh6EI+VSKjccNUFUS3hvM9puMm6wGw2Vpb3JBPiaS3n3yV9Je
 afgnna6wxF2YXSOv21ep95xnVQTIEBuvMsMyRdIowbtWHTvz4RxZgYrxHDzMpj1tl1eQZTVI6te
 Ovkmau9JZGGrkVB5ttyhgM2pAfqnjjILv/Cl2w8UqJZ68+WZt/iDK/LD/FAXWhSO+E7J9gXDghX
 ddVJ7AIvmfXDnwkWD+EkjHqIXxUGhOxr15VZKXB9qvpjTOOKSqlhchP3rV2a9+bTMB32kg772lg
 rWtv7JiFJSxmSUzQd+lJLae9sBCQPTph+PMWcmaTG+MsxANHByWEELzX/fUmOMs2RDeCxB/nLKP
 EUXd27hci4I9Joabvkg==
X-Google-Smtp-Source: AGHT+IEPiJdLqcTbJfTjzTOjuxs/aLJDBS7MKFlyLDYrt9pnVYYisdtCF0Hmrjuu4qXzSBKFvNZbXw==
X-Received: by 2002:a05:600c:4ec7:b0:43d:1824:aadc with SMTP id
 5b1f17b1804b1-441c1d73a7emr60072165e9.29.1746431501488; 
 Mon, 05 May 2025 00:51:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3?
 ([2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2af32a0sm172561445e9.23.2025.05.05.00.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 00:51:40 -0700 (PDT)
Message-ID: <d1fd162e-9d12-4913-81b3-56f4455784c7@linaro.org>
Date: Mon, 5 May 2025 09:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] drm: panel: Add support for Renesas R69328 based
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
 <20250503094149.29201-5-clamor95@gmail.com>
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
In-Reply-To: <20250503094149.29201-5-clamor95@gmail.com>
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
> From: Maxim Schwalm <maxim.schwalm@gmail.com>
> 
> Driver adds support for panels with Renesas R69328 IC
> 
> Currently supported compatible is:
> - jdi,dx12d100vm0eaa
> 
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> ---
>   drivers/gpu/drm/panel/Kconfig                |  13 +
>   drivers/gpu/drm/panel/Makefile               |   1 +
>   drivers/gpu/drm/panel/panel-renesas-r69328.c | 283 +++++++++++++++++++
>   3 files changed, 297 insertions(+)
>   create mode 100644 drivers/gpu/drm/panel/panel-renesas-r69328.c
> 

<snip>

> +
> +static int renesas_r69328_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct renesas_r69328 *priv;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->vdd_supply = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(priv->vdd_supply))
> +		return dev_err_probe(dev, PTR_ERR(priv->vdd_supply),
> +				     "Failed to get vdd-supply\n");
> +
> +	priv->vddio_supply = devm_regulator_get(dev, "vddio");
> +	if (IS_ERR(priv->vddio_supply))
> +		return dev_err_probe(dev, PTR_ERR(priv->vddio_supply),
> +				     "Failed to get vddio-supply\n");
> +
> +	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						   GPIOD_OUT_LOW);
> +	if (IS_ERR(priv->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	priv->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, priv);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
> +
> +	drm_panel_init(&priv->panel, dev, &renesas_r69328_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);

Same as patch 2

> +
> +	ret = drm_panel_of_backlight(&priv->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	drm_panel_add(&priv->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret) {
> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> +		drm_panel_remove(&priv->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
<snip>

With that fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
