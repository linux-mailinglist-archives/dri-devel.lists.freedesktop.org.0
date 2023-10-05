Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521687BAB90
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 22:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F6710E17F;
	Thu,  5 Oct 2023 20:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D075210E17F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 20:40:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9493561B8C;
 Thu,  5 Oct 2023 20:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6401DC433C8;
 Thu,  5 Oct 2023 20:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696538449;
 bh=ZiSfuU42hIkri3lX6i6qYBHumLjvADyoS7eztHiRywQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nwlPnQ1BZh93ZRxulqGf6uh1OZFga1A6nrzFv/slg6YiIbBonM9PLUy42bhBxmlNO
 40eQf+Ogdbr/d+1slQxQq4WAG6k7iNWb1QjWjqoTwKQw5psHQUAQJhzJzQPHW+k0wp
 pOeSGEtTJGhcpB7Sj3OqEbBh6pfS9Nw24WxOTi8EhwnTnUsB3D9kpgt4sSM1uzV2rT
 /fkTEYoVIN4OahNKwulmzaSXRd6hwsu12mtstLMw0rFenIXiztfq47t/FWgsVWovPk
 NKLaT+PQJjseqCibht83I5ary+udGCn18wwPJtUe8ujELVbCWPthpWe//C6SMs51Xl
 iegzjaAZqL8Iw==
Message-ID: <d7f6edd4-d797-4a6f-8df5-d25bc557c9bb@kernel.org>
Date: Thu, 5 Oct 2023 22:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] backlight: Add Kinetic KTD2801 driver
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
References: <20231005-ktd2801-v1-0-43cd85b0629a@skole.hr>
 <20231005-ktd2801-v1-2-43cd85b0629a@skole.hr>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20231005-ktd2801-v1-2-43cd85b0629a@skole.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/10/2023 20:49, Duje Mihanović wrote:
> Add driver for the Kinetic KTD2801 backlight driver.
> 
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
> ---
>  MAINTAINERS                                 |   6 ++
>  drivers/video/backlight/Kconfig             |   7 ++
>  drivers/video/backlight/Makefile            |   1 +
>  drivers/video/backlight/ktd2801-backlight.c | 151 ++++++++++++++++++++++++++++
>  4 files changed, 165 insertions(+)

...

> +
> +#define EW_DELAY	150
> +#define EW_DET		270
> +#define LOW_BIT_HIGH	5
> +#define LOW_BIT_LOW	(4 * HIGH_BIT_LOW)
> +#define HIGH_BIT_LOW	5
> +#define HIGH_BIT_HIGH	(4 * HIGH_BIT_LOW)
> +#define DS		5
> +#define EOD_L		10
> +#define EOD_H		350
> +#define PWR_DOWN_DELAY	2600
> +
> +#define KTD2801_DEFAULT_BRIGHTNESS	100
> +#define KTD2801_MAX_BRIGHTNESS		255
> +
> +struct ktd2801_backlight {
> +	struct device *dev;
> +	struct backlight_device *bd;
> +	struct gpio_desc *desc;

s/desc/enable_gpio/ or something similar. desc is totally not related.

> +	bool was_on;
> +};
> +
> +static int ktd2801_update_status(struct backlight_device *bd)
> +{
> +	struct ktd2801_backlight *ktd2801 = bl_get_data(bd);
> +	u8 brightness = (u8) backlight_get_brightness(bd);
> +
> +	if (backlight_is_blank(bd)) {
> +		gpiod_set_value(ktd2801->desc, 1);
> +		udelay(PWR_DOWN_DELAY);
> +		ktd2801->was_on = false;
> +		return 0;
> +	}
> +
> +	if (!ktd2801->was_on) {
> +		gpiod_set_value(ktd2801->desc, 0);
> +		udelay(EW_DELAY);
> +		gpiod_set_value(ktd2801->desc, 1);
> +		udelay(EW_DET);
> +		gpiod_set_value(ktd2801->desc, 0);
> +		ktd2801->was_on = true;
> +	}
> +
> +	gpiod_set_value(ktd2801->desc, 0);
> +	udelay(DS);
> +
> +	for (int i = 0; i < 8; i++) {
> +		u8 next_bit = (brightness & 0x80) >> 7;
> +
> +		if (!next_bit) {
> +			gpiod_set_value(ktd2801->desc, 1);
> +			udelay(LOW_BIT_LOW);
> +			gpiod_set_value(ktd2801->desc, 0);
> +			udelay(LOW_BIT_HIGH);
> +		} else {
> +			gpiod_set_value(ktd2801->desc, 1);
> +			udelay(HIGH_BIT_LOW);
> +			gpiod_set_value(ktd2801->desc, 0);
> +			udelay(HIGH_BIT_HIGH);
> +		}
> +		brightness <<= 1;
> +	}
> +	gpiod_set_value(ktd2801->desc, 1);
> +	udelay(EOD_L);
> +	gpiod_set_value(ktd2801->desc, 0);
> +	udelay(EOD_H);

Hm, why device is kept off after this? Setting 0 means enable GPIO is
logical 0.

> +	return 0;
> +}
> +
> +static const struct backlight_ops ktd2801_backlight_ops = {
> +	.update_status = ktd2801_update_status,
> +};
> +
> +static int ktd2801_backlight_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct backlight_device *bd;
> +	struct ktd2801_backlight *ktd2801;
> +	u32 brightness, max_brightness;
> +	int ret;
> +
> +	ktd2801 = devm_kzalloc(dev, sizeof(*ktd2801), GFP_KERNEL);
> +	if (!ktd2801)
> +		return -ENOMEM;
> +	ktd2801->dev = dev;
> +	ktd2801->was_on = true;
> +
> +	ret = device_property_read_u32(dev, "max-brightness", &max_brightness);
> +	if (ret)
> +		max_brightness = KTD2801_MAX_BRIGHTNESS;
> +	if (max_brightness > KTD2801_MAX_BRIGHTNESS) {
> +		dev_err(dev, "illegal max brightness specified\n");
> +		max_brightness = KTD2801_MAX_BRIGHTNESS;
> +	}
> +
> +	ret = device_property_read_u32(dev, "default-brightness", &brightness);
> +	if (ret)
> +		brightness = KTD2801_DEFAULT_BRIGHTNESS;
> +	if (brightness > max_brightness) {
> +		dev_err(dev, "default brightness exceeds max\n");
> +		brightness = max_brightness;
> +	}
> +
> +	ktd2801->desc = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);

OUT_LOW is keep it disabled, so is this intentional?

> +	if (IS_ERR(ktd2801->desc))
> +		return dev_err_probe(dev, PTR_ERR(ktd2801->desc),
> +				"failed to get backlight GPIO");
> +	gpiod_set_consumer_name(ktd2801->desc, dev_name(dev));
> +
> +	bd = devm_backlight_device_register(dev, dev_name(dev), dev, ktd2801,
> +			&ktd2801_backlight_ops, NULL);
> +	if (IS_ERR(bd))
> +		return dev_err_probe(dev, PTR_ERR(bd),
> +				"failed to register backlight");
> +
> +	bd->props.max_brightness = max_brightness;
> +	bd->props.brightness = brightness;
> +
> +	ktd2801->bd = bd;
> +	platform_set_drvdata(pdev, bd);
> +	backlight_update_status(bd);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ktd2801_of_match[] = {
> +	{ .compatible = "kinetic,ktd2801" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ktd2801_of_match);
> +
> +static struct platform_driver ktd2801_backlight_driver = {
> +	.driver = {
> +		.name = "ktd2801-backlight",
> +		.of_match_table = ktd2801_of_match,
> +	},
> +	.probe = ktd2801_backlight_probe,
> +};
> +module_platform_driver(ktd2801_backlight_driver);
> +
> +MODULE_AUTHOR("Duje Mihanović <duje.mihanovic@skole.hr>");
> +MODULE_DESCRIPTION("Kinetic KTD2801 Backlight Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:ktd2801-backlight");

You should not need MODULE_ALIAS() in normal cases. If you need it,
usually it means your device ID table is wrong.

> 

Best regards,
Krzysztof

