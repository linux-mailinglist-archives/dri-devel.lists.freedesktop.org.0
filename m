Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 065B078C9A1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390F010E3DC;
	Tue, 29 Aug 2023 16:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B57410E3DC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 16:28:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-401da71b83cso5161055e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 09:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693326496; x=1693931296;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rpqa6ldHA7+s03xx4g9dxalk6uI6N/wZjkRdFsn+Mzw=;
 b=KnmcT3f4tVKSrqfCvp4riPVv63u5NlCU3AyN1khUxhpySjV3IVDDE8W8eXge76a1Pm
 6VXcNXVjPqGvzFLXTz4QGSyIEDIxaoFhfQnu4PI3ARFdL/0WRG0jhFZFmBJMLPQ2vSjr
 LQCWdLnf6nwhPF+of9zRRtocUu0UFOxOvGuXEH7OBbyeySBhlt5UHHL2KtjVzJAO3a2d
 yJF7/gCM+5/wsTGoLIJpXiLKLd3cWEKGizMSL/lHcTQNPp3IPRSb84ov3vojrJtscU7p
 gIUKBC0l79dwzNOcRYsvkdkJ4/0Afkni/8BwNud1r1hZdVVotmJuz96XZya/IfZ/9m7F
 Scfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693326496; x=1693931296;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rpqa6ldHA7+s03xx4g9dxalk6uI6N/wZjkRdFsn+Mzw=;
 b=Vi0+VxxLcFKpnfMZOutGTDz1INWznEzQIXYb53vxWK7I05v4GVG5sy/P5ivT12Bn03
 EObBMAXzv9zA3YBxVLnBfW2WuMvNyJNxJF9K64KlGC6DxlAvbWrUhIS/+6oG4vr5kNGz
 Visuu9kjCpU+37GcqdRVLbvjPhiKj+SF5W6+qvE9oOGQEFdJj+bYCrpzKsxdsTPENYr/
 zg/MQsSpc33yJfK3iJlYLzmwB04sJhMMURz1X8yyoAi0AxftzsNTCPL73bhg7XzDjkv7
 Q96ReEb/WgBCsEabSNjp+5v60SYCXCVeIEwUGrj626719R04nodHWdOzrWQsJ0AgylBY
 G4cg==
X-Gm-Message-State: AOJu0YwnXlDx3gC5jVyzYC6eCWT6WKPF7C+mjP2XVgzrixkEa5sWRK3m
 cb8kdAp3c0vL7QdFYyP6W6NLvg==
X-Google-Smtp-Source: AGHT+IEfJSUBL42nyBdyLW7ZL/n8wPUN1nrSlKl/LyAkDJ2R2cEWy2EjLFUTZblF2ciDwd/UsdyPjQ==
X-Received: by 2002:a7b:cbcd:0:b0:3fe:25b3:951d with SMTP id
 n13-20020a7bcbcd000000b003fe25b3951dmr21965260wmi.5.1693326496479; 
 Tue, 29 Aug 2023 09:28:16 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a7bc408000000b003fe23b10fdfsm17577866wmi.36.2023.08.29.09.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 09:28:16 -0700 (PDT)
Date: Tue, 29 Aug 2023 17:28:14 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v1 2/2] backlight: mp3309c: Add support for MPS MP3309C
Message-ID: <20230829162814.GA56339@aspen.lan>
References: <20230829101546.483189-1-f.suligoi@asem.it>
 <20230829101546.483189-2-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829101546.483189-2-f.suligoi@asem.it>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 12:15:46PM +0200, Flavio Suligoi wrote:
> The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featuring a
> programmable switching frequency to optimize efficiency.
> The brightness can be controlled either by I2C commands (called "analog"
> mode) or by a PWM input signal (PWM mode).
> This driver supports both modes.
>
> For DT configuration details, please refer to:
> - Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
>
> The datasheet is available at:
> - https://www.monolithicpower.com/en/mp3309c.html
>
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>

> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 51387b1ef012..65d0ac9f611d 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -389,6 +389,19 @@ config BACKLIGHT_LM3639
>  	help
>  	  This supports TI LM3639 Backlight + 1.5A Flash LED Driver
>
> +config BACKLIGHT_MP3309C
> +	tristate "Backlight Driver for MPS MP3309C"
> +	depends on I2C
> +	select REGMAP_I2C
> +	select NEW_LEDS
> +	select LEDS_CLASS

This doesn't seem right.

Shouldn't PWM and GPIOLIB be listed here? Why are NEW_LEDS and
LEDS_CLASS needed?

> +	help
> +	  This supports MPS MP3309C backlight WLED Driver in both PWM and
> +	  analog/I2C dimming modes.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called mp3309c_bl.
> +
>  config BACKLIGHT_LP855X
>  	tristate "Backlight driver for TI LP855X"
>  	depends on I2C && PWM

> +static int mp3309c_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mp3309c_chip *chip = bl_get_data(bl);
> +	int brightness = backlight_get_brightness(bl);
> +	struct pwm_state pwmstate;
> +	unsigned int analog_val, bits_val;
> +	int i, ret;
> +
> +	if (chip->pdata->dimming_mode == DIMMING_PWM) {
> +		/*
> +		 * PWM dimming mode
> +		 */
> +		pwm_init_state(chip->pwmd, &pwmstate);
> +		pwm_set_relative_duty_cycle(&pwmstate, brightness,
> +					    chip->pdata->max_brightness);
> +		pwmstate.enabled = true;
> +		ret = pwm_apply_state(chip->pwmd, &pwmstate);
> +		if (ret)
> +			return ret;
> +	} else {
> +		/*
> +		 * Analog dimming mode by I2C commands
> +		 *
> +		 * The 5 bits of the dimming analog value D4..D0 is allocated
> +		 * in the I2C register #0, in the following way:
> +		 *
> +		 *     +--+--+--+--+--+--+--+--+
> +		 *     |EN|D0|D1|D2|D3|D4|XX|XX|
> +		 *     +--+--+--+--+--+--+--+--+
> +		 */
> +		analog_val = DIV_ROUND_UP(ANALOG_MAX_VAL * brightness,
> +					  chip->pdata->max_brightness);
> +		bits_val = 0;
> +		for (i = 0; i <= 5; i++)
> +			bits_val += ((analog_val >> i) & 0x01) << (6 - i);
> +		ret = regmap_update_bits(chip->regmap, REG_I2C_0,
> +					 ANALOG_REG_MASK, bits_val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (brightness > 0) {
> +		switch (chip->pdata->status) {
> +		case FIRST_POWER_ON:
> +			/*
> +			 * Only for the first time, wait for the optional
> +			 * switch-on delay and then enable the device.
> +			 * Otherwise enable the backlight immediately.
> +			 */
> +			schedule_delayed_work(&chip->enable_work,
> +					      msecs_to_jiffies(chip->pdata->switch_on_delay_ms));

Delaying this work makes no sense to me, especially when it is only
going to happen at initial power on.

If you are (ab)using this property to try and sequence the backlight
power-on with display initialization then this is not the way to do it.
Normally backlight drivers that support sequencing versus the panel
work by having a backlight property set on the panel linking it to the
backlight. When the panel is ready this power status of the backlight
will be updated accordingly.

All the backlight driver need do is make sure that is the initial
power status is "powerdown" on systems when the link is present (e.g.
leave the backlight off and wait to be told the display has settled).


> +			/*
> +			 * Optional external device GPIO reset, with
> +			 * delay pulse length
> +			 */
> +			if (chip->pdata->reset_pulse_enable)
> +				schedule_delayed_work(&chip->reset_gpio_work,
> +						      msecs_to_jiffies(chip->pdata->reset_on_delay_ms));

Similarly I don't understand what this property is for. A backlight is
directly perceivable by the user. There is nothing downstream of a
light that needs to be reset!

What is this used for?


Daniel.
