Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32865AA47A6
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 11:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709D710E2FA;
	Wed, 30 Apr 2025 09:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z3KrIYAm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F2D10E2FA
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 09:53:11 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-39bf44be22fso4818554f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 02:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746006790; x=1746611590; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=NQ33tAShH1B9qY7Mvbeo2mk5ktxHALQMW++e/cV2rKM=;
 b=z3KrIYAmOC7h8x6hWYev/zFUdduqL8PY+HajhhOpXDnfg/ohA6SqkhsqJ9Riep+3IS
 rOA/hMVfGM95K1TqlZKkfCndkMfRVpSsiupcwpDh3ipdj1QfiH7G3lODpH4lrHz6W+lp
 SpYspcNbB5MVPzg/AACa/A2h25WCcZvlib+TahBgVsPLikzrJFNfKsOaI92m+amyw4+m
 fWxfmOLjQmH8NSv6Jv7Zi9CHrFvBDVZTPxKjzAsum+Y1eg05zfMk9+XYKyZIUKhXiC6L
 mCoPXoemsZ+gIFHIdH24/nAeobkzzWceTkeJ47NVYv1vwI4xvAa1v/uYBWLrZgul6XIX
 c87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746006790; x=1746611590;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NQ33tAShH1B9qY7Mvbeo2mk5ktxHALQMW++e/cV2rKM=;
 b=k4LL7UjcOKpXTeGxC8+hh490pb6HE6uV4JZtCpXZc7/eyv6IHYk/VkW1ht0SNd36TH
 nkwlmbU56q2M+awkJ3JdLjpSG7ru6xovphWJHu5JeLDWFua8tYECQMr+lWJ4KXiyrMIu
 tQ02Z3MBbZ7xC9fVKulFQfy7NT/omVeYykferXPt+tpgWpIgkj5W0XBGlXl35esHjoFI
 u97crhmEzyVSZngFtBX3JIhDbA70ZQBbpYO1cneCaPEunF7KY5SfaPoKp7RkAf3OQ1Y/
 m5iUIyvpALzxkjM2zqcgB4KN00nx/kC9Mkrc4QZe1lCSu4O3D8V4ofw/veYeO6YG4OOC
 bUgw==
X-Gm-Message-State: AOJu0Yycq8N0waOfWnWkU01N0J2kCzccP+k7mwsgwUPiO+X5hGrZZoVa
 e3S+32+flQ6hjC0SsXlfX8KBjoxa6OPHR9cs8aQgRiDrELBdutmWOS/20Ss97pU=
X-Gm-Gg: ASbGncty8CBrT5DRAUTraHVwj4uehLynO4WBZcWQN5eGyEug4V1LE2ObWIH9/edDnbO
 y5bgXyWXkdETQLF1IKMmubeP4RJo8LTF4tU2zZVXuF2waADUt769eg6tkjQz7Dhuuf8k4BDLUs2
 HDkMTiwpgi+eexEXeLQKS6UQsccx4hrhu+tfPEwnHyBNd3AvbVKJHcCp85MIwN42mIBSHP4eSYa
 w5ECRpekBa8/yCdcvvaJiJhsMVT5/iXIzI9k0/nzdTVI6lqD3xdcVf+HRk2NUSkjkc91aPkb7ro
 thG8i1oao+7rhlFg76AFkv6vtTxxs1An8kPhFevGngbEa2vfpf5RNb3JFRhcoOT90m/DEvh7VQG
 gF/5JNcebjBjMfu8+AQ==
X-Google-Smtp-Source: AGHT+IHmFxBVgaTsAGbGDh4EsUHv+T+0NrbKf322VztbdkbBDNbxxF0eQnDWIUCwiaEeUi/56VbRMA==
X-Received: by 2002:a5d:59af:0:b0:39f:76:8bc with SMTP id
 ffacd0b85a97d-3a08f765397mr2097367f8f.17.1746006789750; 
 Wed, 30 Apr 2025 02:53:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3d6:213c:5c50:7785?
 ([2a01:e0a:3d9:2080:b3d6:213c:5c50:7785])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca4742sm16225841f8f.23.2025.04.30.02.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 02:53:09 -0700 (PDT)
Message-ID: <6ec33d95-ed93-40bb-8ff3-d2e039dcdaa4@linaro.org>
Date: Wed, 30 Apr 2025 11:53:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] drivers: gpu: drm: panel: Add BOE TD4320
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20250429-lavender-panel-v2-0-fb467ff81bac@mainlining.org>
 <20250429-lavender-panel-v2-2-fb467ff81bac@mainlining.org>
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
In-Reply-To: <20250429-lavender-panel-v2-2-fb467ff81bac@mainlining.org>
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

On 29/04/2025 23:33, Barnabás Czémán wrote:
> Add driver for BOE TD4320 DSI panel, used in Xiaomi Redmi Note 7
> mobile phone.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>   drivers/gpu/drm/panel/Kconfig            |   9 ++
>   drivers/gpu/drm/panel/Makefile           |   1 +
>   drivers/gpu/drm/panel/panel-boe-td4320.c | 247 +++++++++++++++++++++++++++++++
>   3 files changed, 257 insertions(+)

<snip>

> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +	drm_panel_init(&ctx->panel, dev, &boe_td4320_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);

Please switch to devm_drm_panel_alloc()

> +	ctx->panel.prepare_prev_first = true;
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	drm_panel_add(&ctx->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		drm_panel_remove(&ctx->panel);
> +		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static void boe_td4320_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct boe_td4320 *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id boe_td4320_of_match[] = {
> +	{ .compatible = "boe,td4320" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, boe_td4320_of_match);
> +
> +static struct mipi_dsi_driver boe_td4320_driver = {
> +	.probe = boe_td4320_probe,
> +	.remove = boe_td4320_remove,
> +	.driver = {
> +		.name = "panel-boe-td4320",
> +		.of_match_table = boe_td4320_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(boe_td4320_driver);
> +
> +MODULE_AUTHOR("Barnabas Czeman <barnabas.czeman@mainlining.org>");
> +MODULE_DESCRIPTION("DRM driver for boe td4320 fhdplus video mode dsi panel");
> +MODULE_LICENSE("GPL");
> 

Otherwise it looks fine.

Thanks,
Neil
