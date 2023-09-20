Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D48367A89AE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 18:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAC110E36D;
	Wed, 20 Sep 2023 16:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99BE10E36D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 16:43:24 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50337b43ee6so102500e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 09:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695228203; x=1695833003; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MQEJW6zv06NkEBajWL99vk6sAX7Ll9wuR8Kb5COdX+s=;
 b=QNCOA3coMohP1K57RsQY9T84dSjZxsm8mcSgh/WzCR/qRoZcIxtGtAeH5m9/xw03SX
 0g8PuU3B6fAeqSAA5Eoq+V0w81xn4nrgbtW62GpGgnhNEwkK2HAbZSMs3nGChbmBwpxL
 jdxghnBnUkti2nDOTkCD/hCqnsaFjiSU6vexXXurYNnx7RGuUAua0S/yk1ymEmdNvsop
 8wNb1CxmL9SnFjkSjHnLR0QQAd3/aQyZpFpc3gmCfeynjeDkqNoQTNuBFzZZlyE6FFFV
 oMIbx22XCrjjRqKi2RGGbHOZQlp4IZVaeORsBtFSQoE1xACCPHyqt7aa5wzC2+wVcsJ9
 MmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695228203; x=1695833003;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQEJW6zv06NkEBajWL99vk6sAX7Ll9wuR8Kb5COdX+s=;
 b=j2ZvZ297fXyaNt1EZfJRlR+yCMicUJpnU6Nbmj16bmidiCW9mUX2HDgEhJWFs3bq4K
 cZ27BDa7AKk8JtkfiEzmyRAO4glCPZIunimuaOcU6nhdhBmilXTfrjSBc35ytT+3JnRw
 I+KCRghZzdyZGqJra7c528KrbqWxWTGlJPRI9LQ+7Nt4s7C6JeoKQBrhFu065rYigHTX
 pa/9rO5IjEbJAWQdDZoVvEIowpcbzrIvtHLU0C80AxRW+zhCrhjBJaNIi+P9rajudxE6
 jvpZiM6sWCgBoVJtc0SK1ZWiQJzqL8RRGMf6mdkHGacYHY4f5X81Hc79WrwdlVquw89A
 LybQ==
X-Gm-Message-State: AOJu0YxPdXn2idnzRvBYdfs28wPaOo5SbALKWkGZAI4sYRrjKsOs7QkB
 iws//hCa3QIufXtQGjowTUZUSA==
X-Google-Smtp-Source: AGHT+IF4SftKY63aF7hO17I140HgFWGwNL1QYPGPfTT/ye3c4L7+hoZq756DMpDyutWuZZK55Xbpuw==
X-Received: by 2002:a05:6512:4885:b0:500:9a45:63b with SMTP id
 eq5-20020a056512488500b005009a45063bmr2829468lfb.13.1695228202819; 
 Wed, 20 Sep 2023 09:43:22 -0700 (PDT)
Received: from aspen.lan (static-212-193-78-212.thenetworkfactory.nl.
 [212.78.193.212]) by smtp.gmail.com with ESMTPSA id
 cz20-20020a0564021cb400b00530c46e2b32sm6496057edb.34.2023.09.20.09.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 09:43:22 -0700 (PDT)
Date: Wed, 20 Sep 2023 18:43:20 +0200
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v2 2/2] backlight: mp3309c: Add support for MPS MP3309C
Message-ID: <20230920164320.GA20969@aspen.lan>
References: <20230915140516.1294925-1-f.suligoi@asem.it>
 <20230915140516.1294925-2-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915140516.1294925-2-f.suligoi@asem.it>
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

On Fri, Sep 15, 2023 at 04:05:16PM +0200, Flavio Suligoi wrote:
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
> ---
>
> v2:
>  - fix dependecies in Kconfig
>  - fix Kconfig MP3309C entry order
>  - remove switch-on-delay-ms property
>  - remove optional gpio property to reset external devices
>  - remove dimming-mode property (the analog-i2c dimming mode is the default; the
>    presence of the pwms property, in DT, selects automatically the pwm dimming
>    mode)
>  - substitute three boolean properties, used for the overvoltage-protection
>    values, with a single enum property
>  - drop simple tracing messages
>  - use dev_err_probe() in probe function
>  - change device name from mp3309c_bl to the simple mp3309c
>  - remove shutdown function
> v1:
>  - first version
>
>  MAINTAINERS                       |   6 +
>  drivers/video/backlight/Kconfig   |  11 +
>  drivers/video/backlight/Makefile  |   1 +
>  drivers/video/backlight/mp3309c.c | 395 ++++++++++++++++++++++++++++++
>  4 files changed, 413 insertions(+)
>  create mode 100644 drivers/video/backlight/mp3309c.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3be1bdfe8ecc..f779df433af1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14333,6 +14333,12 @@ S:	Maintained
>  F:	Documentation/driver-api/tty/moxa-smartio.rst
>  F:	drivers/tty/mxser.*
>
> +MP3309C BACKLIGHT DRIVER
> +M:	Flavio Suligoi <f.suligoi@asem.it>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> +F:	drivers/video/backlight/mp3309c.c
> +
>  MR800 AVERMEDIA USB FM RADIO DRIVER
>  M:	Alexey Klimov <klimov.linux@gmail.com>
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 51387b1ef012..1144a54a35c0 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -402,6 +402,17 @@ config BACKLIGHT_LP8788
>  	help
>  	  This supports TI LP8788 backlight driver.
>
> +config BACKLIGHT_MP3309C
> +	tristate "Backlight Driver for MPS MP3309C"
> +	depends on I2C && PWM
> +	select REGMAP_I2C
> +	help
> +	  This supports MPS MP3309C backlight WLED driver in both PWM and
> +	  analog/I2C dimming modes.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called mp3309c.
> +
>  config BACKLIGHT_PANDORA
>  	tristate "Backlight driver for Pandora console"
>  	depends on TWL4030_CORE
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index f72e1c3c59e9..1af583de665b 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_BACKLIGHT_LP855X)		+= lp855x_bl.o
>  obj-$(CONFIG_BACKLIGHT_LP8788)		+= lp8788_bl.o
>  obj-$(CONFIG_BACKLIGHT_LV5207LP)	+= lv5207lp.o
>  obj-$(CONFIG_BACKLIGHT_MAX8925)		+= max8925_bl.o
> +obj-$(CONFIG_BACKLIGHT_MP3309C)		+= mp3309c.o
>  obj-$(CONFIG_BACKLIGHT_MT6370)		+= mt6370-backlight.o
>  obj-$(CONFIG_BACKLIGHT_OMAP1)		+= omap1_bl.o
>  obj-$(CONFIG_BACKLIGHT_PANDORA)		+= pandora_bl.o
> diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
> new file mode 100644
> index 000000000000..470c960d7438
> --- /dev/null
> +++ b/drivers/video/backlight/mp3309c.c
> @@ -0,0 +1,395 @@
> +// SPDX-License-Identifier: GPL-2.0+

This is an obsolete spelling. Should be:
https://spdx.org/licenses/GPL-2.0-or-later.html


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
> +		pwm_get_state(chip->pwmd, &pwmstate);
> +		pwm_set_relative_duty_cycle(&pwmstate, brightness,
> +					    chip->pdata->max_brightness);
> +		pwmstate.enabled = true;
> +		ret = pwm_apply_state(chip->pwmd, &pwmstate);
> +		if (ret)
> +			return ret;
> +
> +		switch (chip->pdata->status) {
> +		case FIRST_POWER_ON:
> +		case BACKLIGHT_OFF:
> +			/*
> +			 * After 20ms of pwm off, we must enable the chip again
> +			 */
> +			if (brightness > 0) {
> +				msleep_interruptible(10);

This is either missing a return code check (and working bail-out logic)
or, more likely, shouldn't be interruptible.

Also it looks like the delay time and the comment do not match.

However, when these and the license comment is addressed please add my:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
