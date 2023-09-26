Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706B77AEDBE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 15:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C02F10E3DA;
	Tue, 26 Sep 2023 13:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D317010E3DA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 13:10:43 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4053c6f0e50so80745545e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 06:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695733842; x=1696338642; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gUb8ILoSgQFCLFSqMOXdU7OSCDKaDGHaYb2wQZ5A7J8=;
 b=wWHl+TsDGeB5SlJIo6oFeghJeHqVtLly7//nY6myNU8MyxzmW/eH1tYMs/9enFeZ2W
 5ODefow3ojCeeYz5iq8Y2rjgFRKXhJq7W3IZgRH1rARN2sRbILLnkdKdI/cStiGL7LCf
 OzPo1JblPJ53dnZgZpQ3vQo+QwKv8eC42tGYb3qMk7jIszXPpd488E1QqerDg2YBkPk2
 Qfza1+uq/PXNpoidsrZzttu77lHmRiPyPgG2Uz/FCF6KrVLFRXX0H109fn0jZln+OUni
 H/bTyBTSkZ7BHwe8nuUOB90t5jRz3tRGrAwbuL8v112Oowp+3sMErul5k3pqzdrUe9ze
 ZcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695733842; x=1696338642;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gUb8ILoSgQFCLFSqMOXdU7OSCDKaDGHaYb2wQZ5A7J8=;
 b=s36Yx17kRuB5lXY6ah+hMMdSr+j1JoEXzZYie3fjwttuB2h6iuSBIYHApTjlU6uCgu
 pFoMeenLLHYJpjZBSvstJNxwuqr/jGjniQ2tQdsXkIpC6CUfDzKd25O6Oh4YG2Y8L+b1
 TGemIS1EZmoD1dd+NnHV++D1VlcFTtX/4dqYDKcQeFWjvPto2NOxmCBEzxjZnNNjCFBM
 5OUzn1uhtbaeCxU6gO2pUMgmbRhU7hcFMID9rMdabzYHK15U+XrD7delRBZmt/cJI7J4
 ALIaPVzLbpgZ+pYojq/p9HnX4HylY+ECR6yoU5BkWPUEm8rUoAleC426FTFTP8abkPMO
 VSbQ==
X-Gm-Message-State: AOJu0Yw05QNhF7w8FQ1sxSxWzC7YmiBn/3gQ/x8Kheu34lw4Pg1UHLXa
 N37DVzbFklGwfKKJo0lNrLayfA==
X-Google-Smtp-Source: AGHT+IGeSiQ3WveeVgUpyC7fww+V4WeYYuKrHSsckzOgpEr82JSyPAjlpUwHyvObx/ZUX2OzY5V6rg==
X-Received: by 2002:a05:600c:2489:b0:405:3dbc:8821 with SMTP id
 9-20020a05600c248900b004053dbc8821mr8955020wms.22.1695733842083; 
 Tue, 26 Sep 2023 06:10:42 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 j13-20020adfd20d000000b003232c2109cbsm4788764wrh.7.2023.09.26.06.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 06:10:41 -0700 (PDT)
Date: Tue, 26 Sep 2023 14:10:39 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v3 2/2] backlight: mp3309c: Add support for MPS MP3309C
Message-ID: <20230926131039.GC4356@aspen.lan>
References: <20230925122609.78849-1-f.suligoi@asem.it>
 <20230925122609.78849-2-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925122609.78849-2-f.suligoi@asem.it>
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

On Mon, Sep 25, 2023 at 02:26:09PM +0200, Flavio Suligoi wrote:
> diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
> new file mode 100644
> index 000000000000..923ac7f7b291
> --- /dev/null
> +++ b/drivers/video/backlight/mp3309c.c
> @@ -0,0 +1,398 @@
> ...
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
> +			 * After 20ms of low pwm signal level, the chip turns
> +			   off automatically. In this case, before enabling the
> +			   chip again, we must wait about 10ms for pwm signal to
> +			   stabilize.
> +			 */
> +			if (brightness > 0) {
> +				msleep(10);
> +				mp3309c_enable_device(chip);
> +				chip->pdata->status = BACKLIGHT_ON;
> +			} else {
> +				chip->pdata->status = BACKLIGHT_OFF;
> +			}
> +			break;
> +		case BACKLIGHT_ON:
> +			if (brightness == 0)
> +				chip->pdata->status = BACKLIGHT_OFF;
> +			break;
> +		}
> +	} else {
> +		/*
> +		 * Analog dimming (by I2C command) dimming mode
> +		 *
> +		 * The first time, before setting brightness, we must enable the
> +		 * device
> +		 */
> +		if (chip->pdata->status == FIRST_POWER_ON)
> +			mp3309c_enable_device(chip);
> +
> +		/*
> +		 * Dimming mode I2C command
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

Sorry to only notice after sharing a Reviewed-by:[1] but...

Scaling brightness here isn't right. When running in I2C dimming mode then
max_brightness *must* be 31 or lower, meaning the value in brightness can
be applied directly to the hardware without scaling.

Quoting the DT binding docs about how max-brightness should be
interpretted:

  Normally the maximum brightness is determined by the hardware and this
  property is not required. This property is used to put a software
  limit on the brightness apart from what the driver says, as it could
  happen that a LED can be made so bright that it gets damaged or causes
  damage due to restrictions in a specific system, such as mounting
  conditions.


Daniel.


[1] I remember checking if this code could overflow the field but I was
    so distracted by that I ended up missing the obvious!
