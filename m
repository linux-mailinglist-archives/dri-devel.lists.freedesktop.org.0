Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B958274858D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 15:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CC710E1B6;
	Wed,  5 Jul 2023 13:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F0F10E1B6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 13:57:14 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31441bc0092so1705842f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688565432; x=1691157432;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=vpsssEPmpajsdnttO+o6S0QxmmSISUMu1xjEBKdnavk=;
 b=fD71TGTj9jsY0UXWe1YPxNQrgKHIBCFFVo4LqQx2+K/2cTGPHFlq79aRE47A/ZItFd
 6XyygQZ/vXwtQNJX/HTbSduyvXmSH7sf3x9GybmS2clBIMBvzCcZZczmmdTWoyV4YBSE
 4aFq6AHV7zb/rZhvTIPupJCK11S2uKUYJAXZ7YgSAimNCxydK1GV11RehdCt9EZ9LhtI
 kfnQC2YWcqFqm26EjEVrHpiAWiJhgTrOHFIbcrxTZ0x0p5D4CoxxnAc9hRYpa+3Fr538
 zmoRXKtxuk06B74XQLvcgaF+XsMlKgfAHf+P675k5wTM7jKYX/9SbO2ZtiYdjsiZq9nH
 AAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688565432; x=1691157432;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vpsssEPmpajsdnttO+o6S0QxmmSISUMu1xjEBKdnavk=;
 b=BrAgAq8ErsozKINALdrDvDmbhl1RSmIOda3fMmKWdaCFN9zENAlWZsv6JsV9oUYZpY
 IlMzqW1FuyBL97YM77OXkuGbm2hyrOcwlXLmAfpaYRavgFBkgsOYSt/EP9m4vnpm0KEb
 Ex2f0xxQPFJvefUjy22U65f/UyGLl+LWI+kkus474VWoWGKdUEsw4eOegakEFc2xRj36
 p11Ra83VfmNeExvquNaZReFIZ+7rCnkUdYP6MMTVBG/PGIkLwifNXwq6hBRCJgK7d4Jv
 VpNwMS5cue5RmaiHZWweC4c4/D5Yt8h1gS+AWyifSRLySdvLqo5xAx4mbXCzg1o3uWO3
 VN6Q==
X-Gm-Message-State: ABy/qLb7mWC1ik2b6pvPDIISP8eC+BoSS8JV1N4Q0T/E8CTuG5uMnl2b
 i5PuU5QmMkuhFHrHZbxmP55L9A==
X-Google-Smtp-Source: APBJJlH2dsA5o6+F7TnmKCeRS52ZywTNpTZxfxsv8glLGMhJN/IETOKgQmhOy4erRIAKsJmydhhq3g==
X-Received: by 2002:a5d:452f:0:b0:314:35c2:c4aa with SMTP id
 j15-20020a5d452f000000b0031435c2c4aamr7986708wra.8.1688565432505; 
 Wed, 05 Jul 2023 06:57:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:65eb:d140:2d45:ee85?
 ([2a01:e0a:982:cbb0:65eb:d140:2d45:ee85])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d514d000000b0030e56a9ff25sm30867700wrt.31.2023.07.05.06.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 06:57:11 -0700 (PDT)
Message-ID: <194ac047-b20e-04c1-1d96-67cc483bb4a1@linaro.org>
Date: Wed, 5 Jul 2023 15:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] drm/panel: ld9040: Register a backlight device
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20230703214715.623447-1-paul@crapouillou.net>
 <20230703214715.623447-3-paul@crapouillou.net>
Organization: Linaro Developer Services
In-Reply-To: <20230703214715.623447-3-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/07/2023 23:47, Paul Cercueil wrote:
> Register a backlight device to be able to switch between all the gamma
> levels.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>   drivers/gpu/drm/panel/panel-samsung-ld9040.c | 40 ++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> index 7fd9444b42c5..b4f87d6244cb 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
> @@ -8,6 +8,7 @@
>    * Andrzej Hajda <a.hajda@samsung.com>
>   */
>   
> +#include <linux/backlight.h>
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/module.h>
> @@ -311,8 +312,40 @@ static int ld9040_parse_dt(struct ld9040 *ctx)
>   	return 0;
>   }
>   
> +static int ld9040_bl_update_status(struct backlight_device *dev)
> +{
> +	struct ld9040 *ctx = dev_get_drvdata(&dev->dev);
> +
> +	ctx->brightness = dev->props.brightness;
> +	ld9040_brightness_set(ctx);
> +
> +	return 0;
> +}
> +
> +static int ld9040_bl_get_intensity(struct backlight_device *dev)
> +{
> +	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
> +			dev->props.power == FB_BLANK_UNBLANK)
> +		return dev->props.brightness;
> +
> +	return 0;
> +}

You can totally drop the _get_brightness.

Neil

> +
> +static const struct backlight_ops ld9040_bl_ops = {
> +	.get_brightness = ld9040_bl_get_intensity,
> +	.update_status  = ld9040_bl_update_status,
> +};
> +
> +static const struct backlight_properties ld9040_bl_props = {
> +	.type = BACKLIGHT_RAW,
> +	.scale = BACKLIGHT_SCALE_NON_LINEAR,
> +	.max_brightness = ARRAY_SIZE(ld9040_gammas) - 1,
> +	.brightness = ARRAY_SIZE(ld9040_gammas) - 1,
> +};
> +
>   static int ld9040_probe(struct spi_device *spi)
>   {
> +	struct backlight_device *bldev;
>   	struct device *dev = &spi->dev;
>   	struct ld9040 *ctx;
>   	int ret;
> @@ -354,6 +387,13 @@ static int ld9040_probe(struct spi_device *spi)
>   	drm_panel_init(&ctx->panel, dev, &ld9040_drm_funcs,
>   		       DRM_MODE_CONNECTOR_DPI);
>   
> +
> +	bldev = devm_backlight_device_register(dev, dev_name(dev), dev,
> +					       ctx, &ld9040_bl_ops,
> +					       &ld9040_bl_props);
> +	if (IS_ERR(bldev))
> +		return PTR_ERR(bldev);
> +
>   	drm_panel_add(&ctx->panel);
>   
>   	return 0;

