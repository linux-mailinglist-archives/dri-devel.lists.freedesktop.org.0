Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2C4557D30
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 15:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CBE112B96;
	Thu, 23 Jun 2022 13:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCB5112B96
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 13:43:21 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id g18so2212762wrb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 06:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eRK+unsPW70xNn5MF8+19eCG7D3AK/lgynWxuPdsIyE=;
 b=KC804tV7q8m5lKxx02VfQNPyCFRxbLo+UN5MqQqk1P+QbuQa4VcB2DrqvkkpPc4wLh
 s8YD9o2Eiw8erHMZ6g3Ia7a0hyCPKQt3dQhrWjxY7MVQ+N+R6b5WlLXKQYsrlnRxHzog
 E2sf54tTcmTN6YbXT+A5UHQ5N/d1dBEzbXYSl58xn/DSXDKRHGikl18c1Dewu5+tmqAo
 JWR2R+BecqmGJdKOoqPajDcTtrvcsivMLPCP1TsgqwJCt60ewBhMWun7q+A0t7wb6Fa5
 u7SPQBBJb5LqETPHZT7BjI6j+0AwxO054RkyMDT9jgCAOSDplPJobh2EkUOEu7PwvTVI
 nrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eRK+unsPW70xNn5MF8+19eCG7D3AK/lgynWxuPdsIyE=;
 b=g8OmdSnkqy9qsKz78Hl8aPEJudsGec9sEdW958AsNTgYBNFWY6uyWeCeT8DDemlRAm
 bSVT/AwXeqtQKZ/GB9TPgISEC3+4cjJqOs17qKNf/6J/Am0+fRex0oyAAksDnYkjb3TF
 iMOcYrvRfmgFxwpJYeG+MSYc/NhHcDmrz1jhaELwW4ZP0g0/n4bj5IDKojYR4NjU4cnD
 4Qytp1TryoD5u9QXCBrPwL4pD1Adnm6QHXw61lxlXCCvMTHLM7q+oyiJhAGxT3t8PWSx
 He+Ytf3ebOd93OcqVbMpy3VipNh7TtJlMHwv4RMfWEnysJ+wdi2OiBJn+zKjcLiXNh4h
 KWXA==
X-Gm-Message-State: AJIora96a5CCiVului6zaPVflii/aR3/9+XdPuC+ojDsl5W7hFlWjWnj
 5PGNOqSluyRVcGLxVS7ypBin4Q==
X-Google-Smtp-Source: AGRyM1vjF4PN7klzy0olb9rrzdVMRPfVzufgs3EKRfc33dNmi33WjI/0td30uX34aWiNQWi+iEa1Yg==
X-Received: by 2002:a05:6000:10b:b0:21b:88ca:9abf with SMTP id
 o11-20020a056000010b00b0021b88ca9abfmr8191539wrx.694.1655991799771; 
 Thu, 23 Jun 2022 06:43:19 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 p129-20020a1c2987000000b003974cb37a94sm3313906wmp.22.2022.06.23.06.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 06:43:18 -0700 (PDT)
Date: Thu, 23 Jun 2022 14:43:16 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v3 14/14] video: backlight: mt6370: Add Mediatek MT6370
 support
Message-ID: <20220623134316.rg3adyobz3hkgflt@maple.lan>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-15-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623115631.22209-15-peterwu.pub@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, cy_huang@richtek.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, deller@gmx.de, robh+dt@kernel.org,
 chunfeng.yun@mediatek.com, linux@roeck-us.net, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, szunichen@gmail.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 chiaen_wu@richtek.com, gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 23, 2022 at 07:56:31PM +0800, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> Add Mediatek MT6370 Backlight support.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index a003e02..7cd823d 100644
> <snip>
> +static int mt6370_init_backlight_properties(struct mt6370_priv *priv,
> +					    struct backlight_properties *props)
> +{
> +	struct device *dev = priv->dev;
> +	u8 prop_val;
> +	u32 brightness, ovp_uV, ocp_uA;
> +	unsigned int mask, val;
> +	int ret;
> +
> +	/* Vendor optional properties */
> +	val = 0;
> +	if (device_property_read_bool(dev, "mediatek,bled-pwm-enable"))
> +		val |= MT6370_BL_PWM_EN_MASK;
> +
> +	if (device_property_read_bool(dev, "mediatek,bled-pwm-hys-enable"))
> +		val |= MT6370_BL_PWM_HYS_EN_MASK;
> +
> +	ret = device_property_read_u8(dev,
> +				      "mediatek,bled-pwm-hys-input-th-steps",
> +				      &prop_val);
> +	if (!ret) {
> +		prop_val = clamp_val(prop_val,
> +				     MT6370_BL_PWM_HYS_TH_MIN_STEP,
> +				     MT6370_BL_PWM_HYS_TH_MAX_STEP);
> +		/*
> +		 * prop_val =  1      -->  1 steps --> 0x00
> +		 * prop_val =  2 ~  4 -->  4 steps --> 0x01
> +		 * prop_val =  5 ~ 16 --> 16 steps --> 0x10
> +		 * prop_val = 17 ~ 64 --> 64 steps --> 0x11

                                                      ^^^^^
These numbers are binary, not hex, right? If so, the comments
should be 0b00 to 0b03 .


> +		 */
> +		prop_val = (ilog2(roundup_pow_of_two(prop_val)) + 1) >> 1;
> +		val |= prop_val << (ffs(MT6370_BL_PWM_HYS_SEL_MASK) - 1);
> +	}
> +
> +	ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_PWM,
> +				 val, val);
> +	if (ret)
> +		return ret;

Overall, I like this approach! Easy to read and understand.


> <snip>
> +static int mt6370_bl_probe(struct platform_device *pdev)
> +{
> +	struct mt6370_priv *priv;
> +	struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.scale = BACKLIGHT_SCALE_LINEAR,

Sorry, I missed this before but the KConfig comment says that the
backlight can support both linear and exponential curves.

Is there a good reason to default to linear?


Daniel.
> 
