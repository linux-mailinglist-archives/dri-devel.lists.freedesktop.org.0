Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74599889CC4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 12:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA6110E13F;
	Mon, 25 Mar 2024 11:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ULhwDbZu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D0610E13F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 11:28:28 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4148a581d3fso3162685e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 04:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711366106; x=1711970906; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7PkuvMLKJsiJtypoy3shfvrIyPp1wECQoiUOUJHPvWE=;
 b=ULhwDbZu1o2WHLTwrQiZs/CA4lLojxsIjIt3bM7odWayRN2IE7+gCOVfZeKWl5uCyT
 1/BnI+J/rC7mFsI6Qzvgfd01s2MpUH3sUCV09kfZMqUSFqLSKyzQzZWCqdYmToCInRK3
 YqIpja3aMqynuPyhvpdgCp4qgfY3ih653T3UmCPwpVKTv8qzS7GOzEUBsS8k8lEsYNHp
 Xtb4hTi/bc+GL/vBiXFddsgnBRBy44IE/YeU29L4iQppufhogvOPplxa6DFqmfVVL0Nh
 8xa/2h5gmlfix8Et3HEmb4EkGsian0IpQX8kimaSffDAc/NbvwGBwAjtX5pUB39gtiFu
 U0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711366106; x=1711970906;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7PkuvMLKJsiJtypoy3shfvrIyPp1wECQoiUOUJHPvWE=;
 b=eKmT+LWIigx4YCug6yj4BAk1jr+O78Rm9m6ivw65aCh+2y2SzkxhhYiqz5DhHSEU8g
 AMDmuQn8z8gfydCFykhRTDOILEr2ISBiAThEp6Uy3rjaIm8cUObcXu6wUqa10zLVFGGz
 8vJnT68MyAVNmUn1K56vnwwFy0CXYor88GTyiA15jrIU2OEnqe0TqaxDv9BTODgqBh47
 ouDrlVuqKVBGZCnupGAOyfLFxKTn3iyNVTkCn2EITl8e+HNB0JKlaA81ccpGeEVnNKHX
 6ZVImz9MPJTyuUaycW9jIPt8sIpisG8FIhvzNKujVmi9QDie4L1mUCFSMBWf1IVf3HMy
 F3ZA==
X-Gm-Message-State: AOJu0Yz6fetOxD4rMWPOu3kfqPNWKyH2BDeAhK8u4I1Z1cNdWchtSOfp
 f7LpCOEelSgdT06al9KEe6s4R5kG9dIgM7t8ru0BZHE8Z7gSI0YzxeZ0wTSyqwk=
X-Google-Smtp-Source: AGHT+IGdPOEsKK08n8+zv8VWhqXsgYa4DkSPuzYOZZysyCPuYv1EFKvN2PJp6ZKDBFxCKijxETmBsQ==
X-Received: by 2002:a05:600c:35d2:b0:412:ea4c:dc4b with SMTP id
 r18-20020a05600c35d200b00412ea4cdc4bmr4589807wmq.6.1711366106448; 
 Mon, 25 Mar 2024 04:28:26 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 iv16-20020a05600c549000b0041409cabb39sm8112451wmb.18.2024.03.25.04.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 04:28:25 -0700 (PDT)
Date: Mon, 25 Mar 2024 11:28:24 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Patrick Gansterer <paroga@paroga.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 2/2] backlight: Add new lm3509 backlight driver
Message-ID: <20240325112824.GA190706@aspen.lan>
References: <20240310135344.3455294-1-paroga@paroga.com>
 <20240310135344.3455294-2-paroga@paroga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240310135344.3455294-2-paroga@paroga.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

^^^
Also not copied to LKML...


On Sun, Mar 10, 2024 at 02:52:57PM +0100, Patrick Gansterer wrote:
> This is a general driver for LM3509 backlight chip of TI.
> LM3509 is High Efficiency Boost for White LEDs and/or OLED Displays with
> Dual Current Sinks. This driver supports OLED/White LED select, brightness
> control and sub/main control.
> The datasheet can be found at http://www.ti.com/product/lm3509.
>
> Signed-off-by: Patrick Gansterer <paroga@paroga.com>

Overall looks good but there are some review comments inline below.


> diff --git a/drivers/video/backlight/lm3509_bl.c b/drivers/video/backlight/lm3509_bl.c
> new file mode 100644
> index 000000000000..696ec8aab6aa
> --- /dev/null
> +++ b/drivers/video/backlight/lm3509_bl.c
> @@ -0,0 +1,338 @@
> <snip>
> +struct lm3509_bl {
> +	struct regmap *regmap;
> +	struct backlight_device *bl_main;
> +	struct backlight_device *bl_sub;
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +struct lm3509_bl_led_pdata {

What does the p stand for here?

(only asking because pdata was the idiomatic form for platform data and
this driver only uses DT-only so I'm finding pdata values everywhere
really confusing)


> +	const char *label;
> +	int led_sources;
> +	u32 brightness;
> +	u32 max_brightness;
> +};
> +
> +static void lm3509_reset(struct lm3509_bl *data)
> +{
> +	if (data->reset_gpio) {
> +		gpiod_set_value(data->reset_gpio, 1);
> +		udelay(1);
> +		gpiod_set_value(data->reset_gpio, 0);
> +		udelay(10);
> +	}
> +}
> +
> <snip>
> +
> +static struct backlight_device *
> +lm3509_backlight_register(struct device *dev, const char *name_suffix,
> +			  struct lm3509_bl *data,
> +			  const struct backlight_ops *ops,
> +			  const struct lm3509_bl_led_pdata *pdata)
> +
> +{
> +	struct backlight_device *bd;
> +	struct backlight_properties props;
> +	const char *label = pdata->label;
> +	char name[64];
> +
> +	memset(&props, 0, sizeof(props));
> +	props.type = BACKLIGHT_RAW;
> +	props.brightness = pdata->brightness;
> +	props.max_brightness = pdata->max_brightness;

Please set props.scale appropriately for this device (given it only has
32 brightness levels I assume it is non-linear?).


> +
> +	if (!label) {
> +		snprintf(name, sizeof(name), "lm3509-%s-%s", dev_name(dev),
> +			 name_suffix);
> +		label = name;
> +	}
> +
> +	bd = devm_backlight_device_register(dev, label, dev, data, ops, &props);
> +	if (bd)
> +		backlight_update_status(bd);
> +
> +	return bd;
> +}
> +
> <snip>
> +
> +static int lm3509_probe(struct i2c_client *client)
> +{
> +	struct lm3509_bl *data;
> +	struct device *dev = &client->dev;
> +	int ret;
> +	bool oled_mode = false;
> +	unsigned int reg_gp_val = 0;
> +	struct lm3509_bl_led_pdata pdata[LM3509_NUM_SINKS];
> +	u32 rate_of_change = 0;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		dev_err(dev, "i2c functionality check failed\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	data = devm_kzalloc(dev, sizeof(struct lm3509_bl), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap = devm_regmap_init_i2c(client, &lm3509_regmap);
> +	if (IS_ERR(data->regmap))
> +		return PTR_ERR(data->regmap);
> +	i2c_set_clientdata(client, data);
> +
> +	data->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(data->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(data->reset_gpio),
> +				     "Failed to get 'reset' gpio\n");
> +
> +	lm3509_reset(data);
> +
> +	memset(pdata, 0, sizeof(pdata));
> +	ret = lm3509_parse_dt_node(dev, pdata);
> +	if (ret)
> +		return ret;
> +
> +	oled_mode = of_property_read_bool(dev->of_node, "ti,oled-mode");
> +
> +	if (!of_property_read_u32(dev->of_node,
> +				  "ti,brightness-rate-of-change-us",
> +				  &rate_of_change)) {
> +		switch (rate_of_change) {
> +		case 51:
> +			reg_gp_val = 0;
> +			break;
> +		case 13000:
> +			reg_gp_val = BIT(REG_GP_RMP1_BIT);
> +			break;
> +		case 26000:
> +			reg_gp_val = BIT(REG_GP_RMP0_BIT);
> +			break;
> +		case 52000:
> +			reg_gp_val = BIT(REG_GP_RMP0_BIT) |
> +				     BIT(REG_GP_RMP1_BIT);
> +			break;
> +		default:
> +			dev_warn(dev, "invalid rate of change %u\n",
> +				 rate_of_change);
> +			break;
> +		}
> +	}
> +
> +	if (pdata[0].led_sources ==
> +	    (BIT(LM3509_SINK_MAIN) | BIT(LM3509_SINK_SUB)))
> +		reg_gp_val |= BIT(REG_GP_UNI_BIT);
> +	if (oled_mode)
> +		reg_gp_val |= BIT(REG_GP_OLED_BIT);
> +
> +	ret = regmap_write(data->regmap, REG_GP, reg_gp_val);
> +	if (ret < 0)
> +		return ret;

Is this the first time we write to the peripheral? If so the error path
is probably worth a dev_err_probe() (I don't think regmap_write() logs
anything on failure to write).


> +	if (pdata[0].led_sources) {
> +		data->bl_main = lm3509_backlight_register(
> +			dev, "main", data, &lm3509_main_ops, &pdata[0]);
> +		if (IS_ERR(data->bl_main)) {
> +			dev_err(dev, "failed to register main backlight\n");
> +			return PTR_ERR(data->bl_main);

This should use dev_err_probe().


> +		}
> +	}
> +
> +	if (pdata[1].led_sources) {
> +		data->bl_sub = lm3509_backlight_register(
> +			dev, "sub", data, &lm3509_sub_ops, &pdata[1]);
> +		if (IS_ERR(data->bl_sub)) {
> +			dev_err(dev,
> +				"failed to register secondary backlight\n");
> +			return PTR_ERR(data->bl_sub);

Another good place for dev_err_probe().


Daniel.
