Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE7835FAA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 11:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368D810EC62;
	Mon, 22 Jan 2024 10:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC41A10EC62
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 10:29:09 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-337d90030bfso2643274f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 02:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705919287; x=1706524087; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cTCtw5roejauRZb1rW/DubsmSIQ5L20XK+iYbkTVegQ=;
 b=Ri59UgCuGR86N08L4nm6vQpuuc68zSOkCwruLSKumjSmY31hHOc12GeZHpl8TDKK/y
 JfmSoYaq6ygPRhJKQJPS1RcpJOpp0eUIb8orPokMx9vPDGwOMlCOyhItHXxSlnycafLu
 FbWJZDYF8mnEI5Wcdpu55/ypt2TztSpz9WDghRlT3/fe7HokMyZ6r/NITdu19lEd5TQh
 Gbn945RYw5SoSuVkrmm/BaPbjkI8qXShKmK001r9P1U1HnYJVh3NFwglbCNlbzxjWRqk
 N4BuAYVTNnqNVOwioTtTmZRfXt7FVrP9RIJ6flfuzzJxQf7M/sxTDUvkgw376XHgqcnw
 /j8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705919287; x=1706524087;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cTCtw5roejauRZb1rW/DubsmSIQ5L20XK+iYbkTVegQ=;
 b=RQV7XiSaZVaNNS+v5ChYBtPB+Va1SaQYvoOBnAG5ncxhg/Cz9CPUKYanUyiS0EniD1
 bL1rQySUIH4XOqjjuDGlUKOWw0BlaYhLVrRf6TIxVUe9bcwR9GDLEWTtgoYzaRgXtW81
 lDT+Edf6z4gvQ9Im+E88Sfqk7iaUQZD36Rw2ogscNkc4/0GtFuqoz1/rqBRcdHAwtVzs
 4rLE6zmFAX26OUhJXmcDiv02DoqupXmElPHm7cWzsVWcy8pPa/E/cnBI0yPGkpZNwKRy
 O/hTVgASa4Y1X3kZG0t+zkITxt6U7mq+aLqN84KQo80RDpmgWJQSVOVOkOQ/UG/JvQMz
 d3Eg==
X-Gm-Message-State: AOJu0YwvLpqaQXYi8+D8thjA9Rag/dHlVL1llkFy9457Tt9MTmtS+2nN
 lhdt0ZEOgMj9YyJ3WZ49xxYMvZooZthuF8Fh5GQvEqMuQqqge8sj7CuegU0f2CY=
X-Google-Smtp-Source: AGHT+IFJN44C0XBmIhDGOu0CvPL9d8S5H/kcyzcz9lspP4Nm5ugoGJW4ka/39Dgy0iB6yMbk94G+Nw==
X-Received: by 2002:a05:6000:104:b0:337:ac2c:cfd9 with SMTP id
 o4-20020a056000010400b00337ac2ccfd9mr1170855wrx.196.1705919287545; 
 Mon, 22 Jan 2024 02:28:07 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a5d67d1000000b003392f229b60sm3819885wrw.40.2024.01.22.02.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 02:28:07 -0800 (PST)
Date: Mon, 22 Jan 2024 10:28:05 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v3 3/3] backlight: Add Kinetic KTD2801 backlight support
Message-ID: <20240122102805.GB8596@aspen.lan>
References: <20240120-ktd2801-v3-0-fe2cbafffb21@skole.hr>
 <20240120-ktd2801-v3-3-fe2cbafffb21@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240120-ktd2801-v3-3-fe2cbafffb21@skole.hr>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Karel Balej <balejk@matfyz.cz>, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 20, 2024 at 10:26:45PM +0100, Duje Mihanović wrote:
> KTD2801 is a LED backlight driver IC found in samsung,coreprimevelte.
> The brightness can be set using PWM or the ExpressWire protocol. Add
> support for the KTD2801.
>
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

As Linus W. said, this is looking really nice now. Thanks!

Just a couple of nits below.


> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 51387b1ef012..585a5a713759 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -183,6 +183,14 @@ config BACKLIGHT_KTD253
>  	  which is a 1-wire GPIO-controlled backlight found in some mobile
>  	  phones.
>
> +config BACKLIGHT_KTD2801
> +	tristate "Backlight Driver for Kinetic KTD2801"
> +	depends on GPIOLIB || COMPILE_TEST

As patch 1 feedback, seems odd for the client to be responsible for
this. It should be managed in LEDS_EXPRESSWIRE.


> +	select LEDS_EXPRESSWIRE
> +	help
> +	  Say Y to enable the backlight driver for the Kinetic KTD2801 1-wire
> +	  GPIO-controlled backlight found in Samsung Galaxy Core Prime VE LTE.
> +
>  config BACKLIGHT_KTZ8866
>  	tristate "Backlight Driver for Kinetic KTZ8866"
>  	depends on I2C
> diff --git a/drivers/video/backlight/ktd2801-backlight.c b/drivers/video/backlight/ktd2801-backlight.c
> new file mode 100644
> index 000000000000..7b9d1a93aa71
> --- /dev/null
> +++ b/drivers/video/backlight/ktd2801-backlight.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Datasheet:
> + * https://www.kinet-ic.com/uploads/web/KTD2801/KTD2801-04b.pdf
> + */
> +#include <linux/backlight.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/leds-expresswire.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +
> +/* These values have been extracted from Samsung's driver. */
> +#define KTD2801_EXPRESSWIRE_DETECT_DELAY_US	150
> +#define KTD2801_EXPRESSWIRE_DETECT_US		270
> +#define KTD2801_SHORT_BITSET_US			5
> +#define KTD2801_LONG_BITSET_US			(3 * KTD2801_SHORT_BITSET_US)
> +#define KTD2801_DATA_START_US			5
> +#define KTD2801_END_OF_DATA_LOW_US		10
> +#define KTD2801_END_OF_DATA_HIGH_US		350
> +#define KTD2801_PWR_DOWN_DELAY_US		2600

These are a little pointless now. They are all single use constants
and have little documentary value.

The lack of documentary value is because, for example,
KTD2801_EXPRESSWIRE_DETECT_DELAY_US, is assigned to a structure
field called detect_delay_us.

Likewise I doubt that explicitly stating that long_bitset_us is 3x
bigger than short_bitset_us is important for future driver maintainance.


> +
> +#define KTD2801_DEFAULT_BRIGHTNESS	100
> +#define KTD2801_MAX_BRIGHTNESS		255
> +
> +const struct expresswire_timing ktd2801_timing = {
> +	.poweroff_us = KTD2801_PWR_DOWN_DELAY_US,
> +	.detect_delay_us = KTD2801_EXPRESSWIRE_DETECT_DELAY_US,
> +	.detect_us = KTD2801_EXPRESSWIRE_DETECT_US,
> +	.data_start_us = KTD2801_DATA_START_US,
> +	.short_bitset_us = KTD2801_SHORT_BITSET_US,
> +	.long_bitset_us = KTD2801_LONG_BITSET_US,
> +	.end_of_data_low_us = KTD2801_END_OF_DATA_LOW_US,
> +	.end_of_data_high_us = KTD2801_END_OF_DATA_HIGH_US
> +};
> +
> +struct ktd2801_backlight {
> +	struct expresswire_common_props props;
> +	struct backlight_device *bd;
> +	bool was_on;
> +};
> +
> +static int ktd2801_update_status(struct backlight_device *bd)
> +{
> +	struct ktd2801_backlight *ktd2801 = bl_get_data(bd);
> +	u8 brightness = (u8) backlight_get_brightness(bd);
> +
> +	if (backlight_is_blank(bd)) {
> +		expresswire_power_off(&ktd2801->props);
> +		ktd2801->was_on = false;
> +		return 0;
> +	}
> +
> +	if (!ktd2801->was_on) {
> +		expresswire_enable(&ktd2801->props);
> +		ktd2801->was_on = true;
> +	}
> +
> +	expresswire_start(&ktd2801->props);
> +
> +	for (int i = 7; i >= 0; i--)
> +		expresswire_set_bit(&ktd2801->props, !!(brightness & BIT(i)));

The !! is redundant... but, as previous feedback, I think writing a u8
should be in the library code anyway.

> +	expresswire_end(&ktd2801->props);
> +	return 0;
> +}
> +
> <snip>


Daniel.
