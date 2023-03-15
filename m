Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB166BABB4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DED910E979;
	Wed, 15 Mar 2023 09:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250F410E979
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 09:09:54 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id x22so6578531wmj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678871392;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0ehhM3WDQ0BzcG7Zytg5ZL1CgQcuprrt2BD+PBU8s/g=;
 b=uu+kBBddtJuRli4OXM4hbKnuLhtKkv/jS2KMvYUIZ7/Q/9PDSiQt9KGu5zKmTnJk4d
 KPtdQGA2+JGzcJrNSjc2URvoz7GUwfLIG5uU8RC7xtA8tgUkK6ZVUbuVdtprmgmL2tF7
 OiPUxtcEzGcqr4NIxJAJ+dDIzlw/qqzALwSx+ezpzXzhGLUX0eREVVkhpp2/Abc2Qfr3
 2Vnl6zp6B81OTjTyf3GWl2XsuAG+wUswTU5rftAIVkxL7WzebWNRnFQwQRL84CkSGNqz
 JV2sNtGMs2Nz6BrkidcaMwiJS0d4TGY3vmgTFv64cUnUn+EErZIOyr7Y/XZ+/H6kR4+O
 PNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871392;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0ehhM3WDQ0BzcG7Zytg5ZL1CgQcuprrt2BD+PBU8s/g=;
 b=QXECo+LccTbRV46nYY3wX5qo2t+LOqsCTmKbd82eeq4QCLnV4PRvDBuyGtxDEdRUNj
 1ToE1S7CZrpGZRzB/O4C4jCmpue3HRT6j3QmlnTpvZ8QOWhzE6TRUgYKJMulDj8LjN+f
 EtHNmdF5eLXXqGxTqD8TUB+0WQOY1aAr/6dBFl5ZD1HgkCrcLs4RV4h7CKIgmIzz5yRH
 fQHzT7nc/vKtnMPWK1Ip8z4dQaS3EWr6BVkcEz0nxV0MTAyPnTuMF2r54I1Vfiqcwbcd
 wSYz5zrID25gxpB6r9rY5zU3eTJ+BXk22RYruwj5H9KVJKoLN1sXkHjXbnb70SG9r4oW
 Jkkw==
X-Gm-Message-State: AO0yUKVJUpsxxI6socKH/xKOh734bRSmYBMU25YUCrhCEk641STj17AH
 m9l6aP58F03dPBvxwb3Omow5Zg==
X-Google-Smtp-Source: AK7set/UeVut8iVUM290qZrMIefOCnYRx2T85bTcp5RQsIKw/HHzpHn4F9JE6YWxp5XDl5Ui6/6g+Q==
X-Received: by 2002:a05:600c:4f44:b0:3eb:383c:1870 with SMTP id
 m4-20020a05600c4f4400b003eb383c1870mr16290455wmq.11.1678871392578; 
 Wed, 15 Mar 2023 02:09:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5d2d:8427:397b:8fe7?
 ([2a01:e0a:982:cbb0:5d2d:8427:397b:8fe7])
 by smtp.gmail.com with ESMTPSA id
 4-20020a05600c024400b003eb966d39desm1252244wmj.2.2023.03.15.02.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 02:09:52 -0700 (PDT)
Message-ID: <aa9bfab7-220e-9488-8972-9a32fb11b0ff@linaro.org>
Date: Wed, 15 Mar 2023 10:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] drm/panel: seiko-43wvf1g: Add the 'enable-gpios'
 property
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>
References: <20230314111724.1520178-1-festevam@denx.de>
 <20230314111724.1520178-2-festevam@denx.de>
Organization: Linaro Developer Services
In-Reply-To: <20230314111724.1520178-2-festevam@denx.de>
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
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 CPHEALY@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2023 12:17, Fabio Estevam wrote:
> Sometimes a GPIO is needed to turn on/off the display.
> 
> Add support for this usecase by introducing the optional 'enable-gpios'
> property.
> 
> Tested on a imx53qsb board.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>   drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> index 76160e5d43bd..c250ca36a5b3 100644
> --- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> +++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> @@ -7,6 +7,7 @@
>    */
>   
>   #include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/media-bus-format.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> @@ -48,6 +49,7 @@ struct seiko_panel {
>   	const struct seiko_panel_desc *desc;
>   	struct regulator *dvdd;
>   	struct regulator *avdd;
> +	struct gpio_desc *enable_gpio;
>   };
>   
>   static inline struct seiko_panel *to_seiko_panel(struct drm_panel *panel)
> @@ -139,6 +141,8 @@ static int seiko_panel_unprepare(struct drm_panel *panel)
>   	if (!p->prepared)
>   		return 0;
>   
> +	gpiod_set_value_cansleep(p->enable_gpio, 0);
> +
>   	regulator_disable(p->avdd);
>   
>   	/* Add a 100ms delay as per the panel datasheet */
> @@ -174,6 +178,8 @@ static int seiko_panel_prepare(struct drm_panel *panel)
>   		goto disable_dvdd;
>   	}
>   
> +	gpiod_set_value_cansleep(p->enable_gpio, 1);
> +
>   	p->prepared = true;
>   
>   	return 0;
> @@ -252,6 +258,12 @@ static int seiko_panel_probe(struct device *dev,
>   	if (IS_ERR(panel->avdd))
>   		return PTR_ERR(panel->avdd);
>   
> +	panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
> +						     GPIOD_OUT_LOW);
> +	if (IS_ERR(panel->enable_gpio))
> +		return dev_err_probe(dev, PTR_ERR(panel->enable_gpio),
> +				     "failed to request GPIO\n");
> +
>   	drm_panel_init(&panel->base, dev, &seiko_panel_funcs,
>   		       DRM_MODE_CONNECTOR_DPI);
>   


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
