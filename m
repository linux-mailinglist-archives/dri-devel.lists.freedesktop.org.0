Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A521534CEF
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 12:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A1810E0E9;
	Thu, 26 May 2022 10:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EDD10E0E9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 10:05:14 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 o29-20020a05600c511d00b00397697f172dso2195526wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 03:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q2/Vrqz5X77pgoaL4sWT9uNh8P+G0LpsaCXqtANxzbY=;
 b=alvENUPR1RoIdzdhbyYZL4jZz6a2WTuZVvGMUXOyRzTtSUlFMVkMmroCvum7nmvad0
 AdI49WUD5g7yY8JcuP+gxSpebiD38sEWgO1fPim74uQNUhuGba7CWd6ST2TMULVxDhh3
 0cQqbnj6iSKJhPtsNeauBq+EENMJRyWQBxeutx7HagHWHeaJpQxY+HfqNYS9+arSjtlN
 r3u55+VbMwFVNraRdE26MsV29D3rfy0o3mzDRcCrD6o4KggqSSyMLFZkqeqmgMfMdO9Y
 5XKl1+e1RicYK3Prq5Dn+WtQ0HGA2x8pbBIXS8E8nVUGeEoksec8o8uDeAXemuuc5oaq
 AUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q2/Vrqz5X77pgoaL4sWT9uNh8P+G0LpsaCXqtANxzbY=;
 b=FFs1D/h0MQw1BKo0vQC6jWTvCWiFe3X9TZFuEM5USEHvZHU6UTeLw5aZMlDulcVvrh
 H8vW7v6tXSk4drC3afrahBFaCYGz1gmGg8IokX0CA8IrGZt2VJOWoq8ovbU+STAksPBp
 2UIG98jKrqMTTHkWXENmSJKTLbNJcy6+AbdeoW32aYawBqMS+i9AJ4sIHzYJnfDvdVuj
 OiGVeluWGzgvbZy1thDB5ccDBO+5wkd3Sb7gI2lDGZVKPoJ29lARD70HM8UZb0d/pItQ
 pNha252sdfOTiA3urcsbxwAUx0MHV7sP/7FKLR0jAwqWpsv+1MXK8J2CcWKp4glo2rGc
 GQSg==
X-Gm-Message-State: AOAM5330KljHvU9GBitI7ncdwdxGRG8G0Y2oW27cHkUC1zDLO6JyBtuF
 Vj9ycothrvgl8IhM7qAkKPd8pQ==
X-Google-Smtp-Source: ABdhPJyAMsU2F/RK1cL0bLCBgOBJUZUtMEQOXHjfblUN5C5omG3gZLUaGDIiyuTCzCSNRcdx1vkiyw==
X-Received: by 2002:a05:600c:1f0a:b0:397:7161:d3bf with SMTP id
 bd10-20020a05600c1f0a00b003977161d3bfmr1609365wmb.27.1653559513012; 
 Thu, 26 May 2022 03:05:13 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 n4-20020a7bc5c4000000b003974d0d981dsm4227187wmk.35.2022.05.26.03.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 03:05:12 -0700 (PDT)
Date: Thu, 26 May 2022 11:05:10 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH 2/2] backlight: rt4831: Add the property parsing for ocp
 level selection
Message-ID: <20220526100510.3utwh5bov4ax2jmg@maple.lan>
References: <1653534995-30794-1-git-send-email-u0084500@gmail.com>
 <1653534995-30794-3-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653534995-30794-3-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lucas_tsai@richtek.com,
 jingoohan1@gmail.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, robh+dt@kernel.org,
 pavel@ucw.cz, lee.jones@linaro.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 26, 2022 at 11:16:35AM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add the property parsing for ocp level selection.

Isn't this just restating the Subject: line?

It would be better to provide information useful to the reviewer here.
Something like:

"Currently this driver simply inherits whatever over-current protection
level is programmed into the hardware when it is handed over. Typically
this will be the reset value, <whatever>A, although the bootloader could
have established a different value.

Allow the correct OCP value to be provided by the DT."

BTW please don't uncritically copy the above into the patch header. It is
just made something up as an example and I did no fact checking...


> 
> Reported-by: Lucas Tsai <lucas_tsai@richtek.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  drivers/video/backlight/rt4831-backlight.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/video/backlight/rt4831-backlight.c b/drivers/video/backlight/rt4831-backlight.c
> index 42155c7..c81f7d9 100644
> --- a/drivers/video/backlight/rt4831-backlight.c
> +++ b/drivers/video/backlight/rt4831-backlight.c
> @@ -12,6 +12,7 @@
>  #define RT4831_REG_BLCFG	0x02
>  #define RT4831_REG_BLDIML	0x04
>  #define RT4831_REG_ENABLE	0x08
> +#define RT4831_REG_BLOPT2	0x11
>  
>  #define RT4831_BLMAX_BRIGHTNESS	2048
>  
> @@ -23,6 +24,8 @@
>  #define RT4831_BLDIML_MASK	GENMASK(2, 0)
>  #define RT4831_BLDIMH_MASK	GENMASK(10, 3)
>  #define RT4831_BLDIMH_SHIFT	3
> +#define RT4831_BLOCP_MASK	GENMASK(1, 0)
> +#define RT4831_BLOCP_SHIFT	0
>  
>  struct rt4831_priv {
>  	struct device *dev;
> @@ -120,6 +123,16 @@ static int rt4831_parse_backlight_properties(struct rt4831_priv *priv,
>  	if (ret)
>  		return ret;
>  
> +	ret = device_property_read_u8(dev, "richtek,bled-ocp-sel", &propval);
> +	if (ret)
> +		propval = RT4831_BLOCPLVL_1P2A;

Is 1.2A the reset value for the register?

Additionally, it looks like adding a hard-coded default would cause
problems for existing platforms where the bootloader doesn't use
richtek,bled-ocp-sel and pre-configures a different value itself.

Would it be safer (in terms of working nicely with older bootloaders)
to only write to the RT4831_BLOCP_MASK if the new property is set?


Daniel.



> +
> +	propval = min_t(u8, propval, RT4831_BLOCPLVL_1P8A);
> +	ret = regmap_update_bits(priv->regmap, RT4831_REG_BLOPT2, RT4831_BLOCP_MASK,
> +				 propval << RT4831_BLOCP_SHIFT);
> +	if (ret)
> +		return ret;
> +
>  	ret = device_property_read_u8(dev, "richtek,channel-use", &propval);
>  	if (ret) {
>  		dev_err(dev, "richtek,channel-use DT property missing\n");
> -- 
> 2.7.4
> 
