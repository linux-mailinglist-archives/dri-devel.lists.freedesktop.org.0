Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2844C70C0BB
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 16:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA6510E338;
	Mon, 22 May 2023 14:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD6E10E08B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 14:12:02 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f42ba32e24so39507215e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 07:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684764721; x=1687356721;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=12+cwfh/J/lq/7ReW768CrkhjCKZ9/EkoidN0du/FMM=;
 b=ZRi3ygcdvUaAWP/urkbko3XcgIPKa1rdGoRNTs/p6KbZ+00gJIjgmrFneII1Lit5gV
 XKu+GFI2r1sq+OVGLVc5Y0YqUF77D9fck8HJG5SSCVyeGPgarazoSF/UI/JAwnBBkh84
 uOmR9XadRdZflthc/BiCEU8gzFybJP1NoonMP2rTtOoGSMlzPvRBtI+Ze9jm4czhzKGr
 cn1HF9xt3LUbJjD8pszC7hNhOgKhTsxwRgXpp58WcXnCY69z3Ii9EBNOkeDhmPBVlLfM
 O7pNIf9xYaNd6OcSdO17CgAU7CxqFJ/ILExOnW/69YXfhI2Xat3SRsvSjaGxl9GLhFlc
 EH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684764721; x=1687356721;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=12+cwfh/J/lq/7ReW768CrkhjCKZ9/EkoidN0du/FMM=;
 b=Z8BQQSt62tLZFDIc6fezBewouLfr5pRWurnx/kojo+J4rRwWlPhQ2Y28lw55LImZm6
 +ug0GJMOa7+ckxFECRAjDVqMSHWgfLY2Sczbaegp+dkEdVynPN7fyBv8GQDeKSdPsHxd
 YT/H4BNNrB/nmX2aQPeSU/gSNnqbqYi1uXSzalfXWGct3bGsPdKxHWPmAYENsnyehlO5
 RpV5au8aCux5OYS5QP9XohyCKzRLoDXexUymW9XxreTf+6LR74ZTaIfg+icVcWtjRgw+
 jUDJi3CfhiTDNHVgbMOVfY7wIVlEGY4jnONC26fLGpza4JQwg2dvotX8oviZCgDWAaor
 TjDA==
X-Gm-Message-State: AC+VfDzETrvHKPf25mT7Jy5nW4gT6FblQmRRqCscaKClJNft1uFYzbvT
 ZUFKVImon3pXvdIPb5YzAE61MA==
X-Google-Smtp-Source: ACHHUZ56PUPVuPQqMYXQ9kZa0vF/Qh3zEqzoAnU0KUwXxNgDzDnOsi57CaYYBiMu7X9kMLxsWktG+w==
X-Received: by 2002:a05:600c:28c8:b0:3f4:2452:9666 with SMTP id
 h8-20020a05600c28c800b003f424529666mr6304979wmd.40.1684764720718; 
 Mon, 22 May 2023 07:12:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a478:d61d:5bb5:7df?
 ([2a01:e0a:982:cbb0:a478:d61d:5bb5:7df])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a7bcd85000000b003f6028a4c85sm5278893wmj.16.2023.05.22.07.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 07:12:00 -0700 (PDT)
Message-ID: <575e7f13-69b4-e4b5-a4e1-c7b0fdd59471@linaro.org>
Date: Mon, 22 May 2023 16:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] drm/bridge: display-connector: handle hdmi-pwr
 supply
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20230519184023.3943362-1-dmitry.baryshkov@linaro.org>
 <20230519184023.3943362-4-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230519184023.3943362-4-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2023 20:40, Dmitry Baryshkov wrote:
> On some devices the +5V Power pin of the HDMI connector and/or the ESD
> protection logic is powered on by a separate regulator. Instead of
> declaring this regulator as always-on, make hdmi-connector support the
> additional hdmi-pwr supply.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/display-connector.c | 55 ++++++++++++----------
>   1 file changed, 29 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index 1d37e57242dd..d6a9aa589d17 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -191,6 +191,18 @@ static irqreturn_t display_connector_hpd_irq(int irq, void *arg)
>   	return IRQ_HANDLED;
>   }
>   
> +static int display_connector_get_supply(struct platform_device *pdev,
> +					struct display_connector *conn,
> +					const char *name)
> +{
> +	conn->supply = devm_regulator_get_optional(&pdev->dev, "dp-pwr");

You should use name here right ?

Neil

> +
> +	if (conn->supply == ERR_PTR(-ENODEV))
> +		conn->supply = NULL;
> +
> +	return PTR_ERR_OR_ZERO(conn->supply);
> +}
> +
>   static int display_connector_probe(struct platform_device *pdev)
>   {
>   	struct display_connector *conn;
> @@ -319,36 +331,15 @@ static int display_connector_probe(struct platform_device *pdev)
>   	if (type == DRM_MODE_CONNECTOR_DisplayPort) {
>   		int ret;
>   
> -		conn->supply = devm_regulator_get_optional(&pdev->dev, "dp-pwr");
> -
> -		if (IS_ERR(conn->supply)) {
> -			ret = PTR_ERR(conn->supply);
> -
> -			switch (ret) {
> -			case -ENODEV:
> -				conn->supply = NULL;
> -				break;
> -
> -			case -EPROBE_DEFER:
> -				return -EPROBE_DEFER;
> -
> -			default:
> -				dev_err(&pdev->dev, "failed to get DP PWR regulator: %d\n", ret);
> -				return ret;
> -			}
> -		}
> -
> -		if (conn->supply) {
> -			ret = regulator_enable(conn->supply);
> -			if (ret) {
> -				dev_err(&pdev->dev, "failed to enable DP PWR regulator: %d\n", ret);
> -				return ret;
> -			}
> -		}
> +		ret = display_connector_get_supply(pdev, conn, "dp-pwr");
> +		if (ret < 0)
> +			return dev_err_probe(&pdev->dev, ret, "failed to get DP PWR regulator\n");
>   	}
>   
>   	/* enable DDC */
>   	if (type == DRM_MODE_CONNECTOR_HDMIA) {
> +		int ret;
> +
>   		conn->ddc_en = devm_gpiod_get_optional(&pdev->dev, "ddc-en",
>   						       GPIOD_OUT_HIGH);
>   
> @@ -356,6 +347,18 @@ static int display_connector_probe(struct platform_device *pdev)
>   			dev_err(&pdev->dev, "Couldn't get ddc-en gpio\n");
>   			return PTR_ERR(conn->ddc_en);
>   		}
> +
> +		ret = display_connector_get_supply(pdev, conn, "hdmi-pwr");
> +		if (ret < 0)
> +			return dev_err_probe(&pdev->dev, ret, "failed to get HDMI +5V Power regulator\n");
> +	}
> +
> +	if (conn->supply) {
> +		ret = regulator_enable(conn->supply);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to enable DP PWR regulator: %d\n", ret);
> +			return ret;
> +		}
>   	}
>   
>   	conn->bridge.funcs = &display_connector_bridge_funcs;

