Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C5554998F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89E310F3BD;
	Mon, 13 Jun 2022 17:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9A510F3BB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:08:58 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id e24so6229983pjt.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 10:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AZWAPWwrm8+A0CgIBwRq++T65dkqg+V1CymCWTXMIwM=;
 b=LIOySr/baoj4EAyTjKf+aH+Qatb2p3UHDovP+gotSlTiSN1yTcg4GCjyqC3fyUX7wl
 npmmJtdNhVDNh5XKGkUnpjvg/YJI9/ZyQwGvcnz/SS0pPOuUekmDMJRnmbvEUG9D+H7+
 BZM1DLAMJ8q+I+4MvG2IfeZzZu5Z2p2pmZvJH76I7ELfeoqXCbnsuzr33o2epyIJ5WeO
 vlWeMTh3YdX80pJSfJHrPWOfpq4BMQV7PRBFhgbMKMVtr4faZ0ISbwZoAbpm/guz5Lxu
 3Q1Lh7nmkcWUV2iquou5G8hgE2UlhX7m7htGh4cx10X02rbX81xYSe5d64L24n5jYZOT
 up1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AZWAPWwrm8+A0CgIBwRq++T65dkqg+V1CymCWTXMIwM=;
 b=qlBpN/Rk/svQG1szc6BBX07rg3vgu5OHZAA99VIErcW/Qtq3f+yEkQ+1eFwLvFehNf
 IGYy+Jhxpx4zDtH4v83xJhrHB3THgoJbAED28OyAf3kWhp2WS7NmkK3tVqqaEVYU7M6S
 JA3hvJ5IGbKCdza3MSxMflJpihD/u/7fgNAaB6+z9jjlhcyjYMVdFVhLeFUrslkaWCMv
 3eoRa7LP4nXcmBX3uJYTq6/pD0kqT5t3+TBjbyOFZQCp0kD/9Y4rhj4Jp4WVTbvftvJV
 40EK8frMavK41JxZqqFu5MN1gUoT7caKRAmpujJbXrFaYuq1g4kutOWh90scxbk5YGjT
 2lwA==
X-Gm-Message-State: AJIora/bPW1sGDrbNS8w69BLMAC2B1FYyxTRn8Wv0hvhvUuiczYN3ii/
 TYU7CNw2on8PepiSLPbVili3FA==
X-Google-Smtp-Source: AGRyM1sELmzXAHQOaDg6BJ3FBShrRSur5yPmIKoRf1jf9G2G72yJQERR+jxqILTIiQmADcP/b1HsAg==
X-Received: by 2002:a17:902:c94b:b0:166:4f65:cffb with SMTP id
 i11-20020a170902c94b00b001664f65cffbmr14965pla.103.1655140137656; 
 Mon, 13 Jun 2022 10:08:57 -0700 (PDT)
Received: from ash.lan ([192.77.111.2]) by smtp.gmail.com with ESMTPSA id
 142-20020a621994000000b00518b4cfbbe0sm5632766pfz.203.2022.06.13.10.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:08:56 -0700 (PDT)
Date: Mon, 13 Jun 2022 18:08:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v2 15/15] video: backlight: mt6370: Add Mediatek MT6370
 support
Message-ID: <20220613170853.bffuwkcmflfgg4gt@ash.lan>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-16-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613111146.25221-16-peterwu.pub@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, jingoohan1@gmail.com,
 ChiaEn Wu <chiaen_wu@richtek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 szunichen@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, pavel@ucw.cz, matthias.bgg@gmail.com,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 13, 2022 at 07:11:46PM +0800, ChiaEn Wu wrote:
> +static int mt6370_init_backlight_properties(struct mt6370_priv *priv,
> +					    struct backlight_properties *props)

Most of the changes in this version looks good... but it looks the new
code in this function has a number of problems. See below...


> +{
> +	struct device *dev = priv->dev;
> +	u8 prop_val;
> +	u32 brightness;
> +	unsigned int mask, val;
> +	int ret;
> +
> +	/* Vendor optional properties
> +	 * if property not exist, keep value in default.
> +	 */

That's not the right strategy for booleans. Not existing means false
(e.g. flags should actively be unset).


> +	if (device_property_read_bool(dev, "mediatek,bled-pwm-enable")) {
> +		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_PWM,
> +					 MT6370_BL_PWM_EN_MASK,
> +					 MT6370_BL_PWM_EN_MASK);
> +		if (ret)
> +			return ret;
> +	}

As above comment... all of the boolean properties are now being read
incorrectly.


> +
> +	if (device_property_read_bool(dev, "mediatek,bled-pwm-hys-enable")) {
> +		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_PWM,
> +					 MT6370_BL_PWM_HYS_EN_MASK,
> +					 MT6370_BL_PWM_HYS_EN_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = device_property_read_u8(dev, "mediatek,bled-pwm-hys-input-bit",
> +				      &prop_val);
> +	if (!ret) {
> +		val = min_t(u8, prop_val, 3)
> +		      << (ffs(MT6370_BL_PWM_HYS_SEL_MASK) - 1);
> +		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_PWM,
> +					 MT6370_BL_PWM_HYS_SEL_MASK, val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = device_property_read_u8(dev, "mediatek,bled-ovp-microvolt",
> +				      &prop_val);
> +	if (!ret) {
> +		val = min_t(u8, prop_val, 3)
> +		      << (ffs(MT6370_BL_OVP_SEL_MASK) - 1);

This has been renamed but still seems to the using 0, 1, 2, 3 rather
than an actual value in microvolts.


> +		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_BSTCTRL,
> +					 MT6370_BL_OVP_SEL_MASK, val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "mediatek,bled-ovp-shutdown")) {
> +		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_BSTCTRL,
> +					 MT6370_BL_OVP_EN_MASK,
> +					 MT6370_BL_OVP_EN_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = device_property_read_u8(dev, "mediatek,bled-ocp-microamp",
> +				      &prop_val);
> +	if (!ret) {
> +		val = min_t(u8, prop_val, 3)
> +		      << (ffs(MT6370_BL_OC_SEL_MASK) - 1);

Likewise, should this be accepting a value in microamps?


> +		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_BSTCTRL,
> +					 MT6370_BL_OC_SEL_MASK, val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "mediatek,bled-ocp-shutdown")) {
> +		ret = regmap_update_bits(priv->regmap, MT6370_REG_BL_BSTCTRL,
> +					 MT6370_BL_OC_EN_MASK,
> +					 MT6370_BL_OC_EN_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Common properties */
> +	ret = device_property_read_u32(dev, "max-brightness", &brightness);
> +	if (ret)
> +		brightness = MT6370_BL_MAX_BRIGHTNESS;
> +
> +	props->max_brightness = min_t(u32, brightness,
> +				      MT6370_BL_MAX_BRIGHTNESS);
> +
> +	ret = device_property_read_u32(dev, "default-brightness", &brightness);
> +	if (ret)
> +		brightness = props->max_brightness;
> +
> +	props->brightness = min_t(u32, brightness, props->max_brightness);
> +
> +
> +	ret = device_property_read_u8(dev, "mediatek,bled-channel-use",
> +				      &prop_val);
> +	if (ret) {
> +		dev_err(dev, "mediatek,bled-channel-use DT property missing\n");
> +		return ret;
> +	}
> +
> +	if (!prop_val || prop_val > MT6370_BL_MAX_CH) {
> +		dev_err(dev, "No channel specified (ch_val:%d)\n", prop_val);

Error string has not been updated to match condition that triggers it.


> +		return -EINVAL;
> +	}


Daniel.
