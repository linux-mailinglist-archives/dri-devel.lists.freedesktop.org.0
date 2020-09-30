Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0AC27FB46
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E826E870;
	Thu,  1 Oct 2020 08:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0F06E833
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 23:07:12 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id n61so3522523ota.10
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 16:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Qs5V8/HF0CuXqSYMyn+PhUaoHWeJ0sbIik6Dnu+LcL4=;
 b=VSMtGINb//BRejynJ20cZCnyfWBRooaLG8BGi7NaXBImNsHZje4sQXvaq8gtd2Mahw
 EBf7CAmxXHekWGxIcT7nmGu/PiBd9dITCDqx+Zg4X33subKBvUnTPdku0MaSwPOJcO1t
 ln2ljNj41JJyMo6IkBWOASbJqyfxFaczJNKxv6E6ufaJAlkJVm4Gr61XC1usGxzFDeG3
 cF//Hec0Q2ckXNHbKKllxgLJirEaPmQEsFaTxwOdH6dbK9HAor7NXMiQupbiHE1KZhp4
 HrWp8NbDHfoJ3zawp21JgDHRJU5nVNPiKGiHW3//HUlarE4JQdIMRGBIxTcwl3++O0/j
 o/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Qs5V8/HF0CuXqSYMyn+PhUaoHWeJ0sbIik6Dnu+LcL4=;
 b=nwZknRTsc3mgCo1XBxD5FM+uTFOrn+UNrz8bjPlASsFPejjTENC1Uc2jX5sw18UL6r
 N7QrJMaFShJfBWrtdL72C3h0Y05+pV5YDzcoU27zHzAnTAkANOZbJwEmfqG6i+2pufLg
 CKH37imElexnc0PC3ticfe7aXah6HMJnNu9tpMfh5EO/x58RMxUR8RmaoI29HKBPHC7s
 +gyCPvBPNB7UcchsA4e6+Cu5juT2E0DnVyOrkq3YP0WTlq3QVUsc+avGNP4NOvglge33
 hakqI39sSqCR3Bg0SPnHp1/LuLcmD1Bm5NAZTea/fG5xL0Fb+S/m1g1umzeY9Oe10BFQ
 fpjw==
X-Gm-Message-State: AOAM532fvAAWzLsWWRk3uk6PolyTwfhHcqA7OFu0P/KNHBSaDvC79mwl
 U+Oaj7wPElAAD2g67IQwcq3BFg==
X-Google-Smtp-Source: ABdhPJzzFqulT+LjmyZ/QfPntG9KhFyN8TsSuhGAsi+qowPkNy8PekJGIUe8WrR95kHtbAqmWoWW3w==
X-Received: by 2002:a05:6830:20d5:: with SMTP id
 z21mr3172113otq.110.1601507231480; 
 Wed, 30 Sep 2020 16:07:11 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com.
 [173.175.113.3])
 by smtp.gmail.com with ESMTPSA id x15sm799711oor.33.2020.09.30.16.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 16:07:10 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi86: Expose backlight controls
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>
References: <20200930223532.77755-1-bjorn.andersson@linaro.org>
 <20200930223532.77755-3-bjorn.andersson@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Message-ID: <cee77d68-262e-e39b-bab4-a3bfbd1de6fe@kali.org>
Date: Wed, 30 Sep 2020 18:07:09 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930223532.77755-3-bjorn.andersson@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/30/20 5:35 PM, Bjorn Andersson wrote:
> The TI SN65DSI86 can be configured to generate a PWM pulse on GPIO4,
> to be used to drive a backlight driver.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/bridge/Kconfig        |   1 +
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 143 +++++++++++++++++++++++++-
>  2 files changed, 140 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 43271c21d3fc..eea310bd88e1 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -195,6 +195,7 @@ config DRM_TI_SN65DSI86
>  	select REGMAP_I2C
>  	select DRM_PANEL
>  	select DRM_MIPI_DSI
> +	select BACKLIGHT_CLASS_DEVICE
>  	help
>  	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
>  
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 5b6e19ecbc84..41e24d0dbd18 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -68,6 +68,7 @@
>  #define  SN_GPIO_MUX_OUTPUT			1
>  #define  SN_GPIO_MUX_SPECIAL			2
>  #define  SN_GPIO_MUX_MASK			0x3
> +#define  SN_GPIO_MUX_SHIFT(gpio)		((gpio) * 2)
>  #define SN_AUX_WDATA_REG(x)			(0x64 + (x))
>  #define SN_AUX_ADDR_19_16_REG			0x74
>  #define SN_AUX_ADDR_15_8_REG			0x75
> @@ -86,6 +87,12 @@
>  #define SN_ML_TX_MODE_REG			0x96
>  #define  ML_TX_MAIN_LINK_OFF			0
>  #define  ML_TX_NORMAL_MODE			BIT(0)
> +#define SN_PWM_PRE_DIV_REG			0xA0
> +#define SN_BACKLIGHT_SCALE_REG			0xA1
> +#define SN_BACKLIGHT_REG			0xA3
> +#define SN_PWM_CTL_REG				0xA5
> +#define  SN_PWM_ENABLE				BIT(1)
> +#define  SN_PWM_INVERT				BIT(0)
>  #define SN_AUX_CMD_STATUS_REG			0xF4
>  #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
>  #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
> @@ -155,6 +162,8 @@ struct ti_sn_bridge {
>  	struct gpio_chip		gchip;
>  	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
>  #endif
> +	u32				brightness;
> +	u32				max_brightness;
>  };
>  
>  static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
> @@ -173,6 +182,18 @@ static const struct regmap_config ti_sn_bridge_regmap_config = {
>  	.cache_type = REGCACHE_NONE,
>  };
>  
> +static void ti_sn_bridge_read_u16(struct ti_sn_bridge *pdata,
> +				  unsigned int reg, u16 *val)
> +{
> +	unsigned int high;
> +	unsigned int low;
> +
> +	regmap_read(pdata->regmap, reg, &low);
> +	regmap_read(pdata->regmap, reg + 1, &high);
> +
> +	*val = high << 8 | low;
> +}
> +
>  static void ti_sn_bridge_write_u16(struct ti_sn_bridge *pdata,
>  				   unsigned int reg, u16 val)
>  {
> @@ -180,6 +201,50 @@ static void ti_sn_bridge_write_u16(struct ti_sn_bridge *pdata,
>  	regmap_write(pdata->regmap, reg + 1, val >> 8);
>  }
>  
> +static int ti_sn_backlight_update(struct ti_sn_bridge *pdata)
> +{
> +	unsigned int pre_div;
> +
> +	if (!pdata->max_brightness)
> +		return 0;
> +
> +	/* Enable PWM on GPIO4 */
> +	regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> +			   SN_GPIO_MUX_MASK << SN_GPIO_MUX_SHIFT(4 - 1),
> +			   SN_GPIO_MUX_SPECIAL << SN_GPIO_MUX_SHIFT(4 - 1));
> +
> +	if (pdata->brightness) {
> +		/* Set max brightness */
> +		ti_sn_bridge_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, pdata->max_brightness);
> +
> +		/* Set brightness */
> +		ti_sn_bridge_write_u16(pdata, SN_BACKLIGHT_REG, pdata->brightness);
> +
> +		/*
> +		 * The PWM frequency is derived from the refclk as:
> +		 * PWM_FREQ = REFCLK_FREQ / (PWM_PRE_DIV * BACKLIGHT_SCALE + 1)
> +		 *
> +		 * A hand wavy estimate based on 12MHz refclk and 500Hz desired
> +		 * PWM frequency gives us a pre_div resulting in a PWM
> +		 * frequency of between 500 and 1600Hz, depending on the actual
> +		 * refclk rate.
> +		 *
> +		 * One is added to avoid high BACKLIGHT_SCALE values to produce
> +		 * a pre_div of 0 - which cancels out the large BACKLIGHT_SCALE
> +		 * value.
> +		 */
> +		pre_div = 12000000 / (500 * pdata->max_brightness) + 1;
> +		regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
> +
> +		/* Enable PWM */
> +		regmap_update_bits(pdata->regmap, SN_PWM_CTL_REG, SN_PWM_ENABLE, SN_PWM_ENABLE);
> +	} else {
> +		regmap_update_bits(pdata->regmap, SN_PWM_CTL_REG, SN_PWM_ENABLE, 0);
> +	}
> +
> +	return 0;
> +}
> +
>  static int __maybe_unused ti_sn_bridge_resume(struct device *dev)
>  {
>  	struct ti_sn_bridge *pdata = dev_get_drvdata(dev);
> @@ -193,7 +258,7 @@ static int __maybe_unused ti_sn_bridge_resume(struct device *dev)
>  
>  	gpiod_set_value(pdata->enable_gpio, 1);
>  
> -	return ret;
> +	return ti_sn_backlight_update(pdata);
>  }
>  
>  static int __maybe_unused ti_sn_bridge_suspend(struct device *dev)
> @@ -1010,7 +1075,7 @@ static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
>  					     unsigned int offset)
>  {
>  	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
> -	int shift = offset * 2;
> +	int shift = SN_GPIO_MUX_SHIFT(offset);
>  	int ret;
>  
>  	if (!test_and_clear_bit(offset, pdata->gchip_output))
> @@ -1038,7 +1103,7 @@ static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
>  					      unsigned int offset, int val)
>  {
>  	struct ti_sn_bridge *pdata = gpiochip_get_data(chip);
> -	int shift = offset * 2;
> +	int shift = SN_GPIO_MUX_SHIFT(offset);
>  	int ret;
>  
>  	if (test_and_set_bit(offset, pdata->gchip_output))
> @@ -1073,12 +1138,17 @@ static const char * const ti_sn_bridge_gpio_names[SN_NUM_GPIOS] = {
>  
>  static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
>  {
> +	int ngpio = SN_NUM_GPIOS;
>  	int ret;
>  
>  	/* Only init if someone is going to use us as a GPIO controller */
>  	if (!of_property_read_bool(pdata->dev->of_node, "gpio-controller"))
>  		return 0;
>  
> +	/* If GPIO4 is used for backlight, reduce number of gpios */
> +	if (pdata->max_brightness)
> +		ngpio--;
> +
>  	pdata->gchip.label = dev_name(pdata->dev);
>  	pdata->gchip.parent = pdata->dev;
>  	pdata->gchip.owner = THIS_MODULE;
> @@ -1092,7 +1162,7 @@ static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
>  	pdata->gchip.set = ti_sn_bridge_gpio_set;
>  	pdata->gchip.can_sleep = true;
>  	pdata->gchip.names = ti_sn_bridge_gpio_names;
> -	pdata->gchip.ngpio = SN_NUM_GPIOS;
> +	pdata->gchip.ngpio = ngpio;
>  	pdata->gchip.base = -1;
>  	ret = devm_gpiochip_add_data(pdata->dev, &pdata->gchip, pdata);
>  	if (ret)
> @@ -1159,6 +1229,65 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn_bridge *pdata,
>  	pdata->ln_polrs = ln_polrs;
>  }
>  
> +static int ti_sn_backlight_update_status(struct backlight_device *bl)
> +{
> +	struct ti_sn_bridge *pdata = bl_get_data(bl);
> +	int brightness = bl->props.brightness;
> +
> +	if (bl->props.power != FB_BLANK_UNBLANK ||
> +	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
> +	    bl->props.state & BL_CORE_FBBLANK) {
> +		pdata->brightness = 0;
> +	}
> +
> +	pdata->brightness = brightness;
> +
> +	return ti_sn_backlight_update(pdata);
> +}
> +
> +static int ti_sn_backlight_get_brightness(struct backlight_device *bl)
> +{
> +	struct ti_sn_bridge *pdata = bl_get_data(bl);
> +	u16 val;
> +
> +	ti_sn_bridge_read_u16(pdata, SN_BACKLIGHT_REG, &val);
> +
> +	return val;
> +}
> +
> +const struct backlight_ops ti_sn_backlight_ops = {
> +	.update_status = ti_sn_backlight_update_status,
> +	.get_brightness = ti_sn_backlight_get_brightness,
> +};
> +
> +static int ti_sn_backlight_init(struct ti_sn_bridge *pdata)
> +{
> +	struct backlight_properties props = {};
> +	struct backlight_device	*bl;
> +	struct device *dev = pdata->dev;
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +
> +	ret = of_property_read_u32(np, "ti,backlight-scale", &pdata->max_brightness);
> +	if (ret == -EINVAL) {
> +		return 0;
> +	} else if (ret || pdata->max_brightness >= 0xffff) {
> +		DRM_ERROR("invalid max-brightness\n");
> +		return -EINVAL;
> +	}
> +
> +	props.type = BACKLIGHT_RAW;
> +	props.max_brightness = pdata->max_brightness;
> +	bl = devm_backlight_device_register(dev, "sn65dsi86", dev, pdata,
> +					    &ti_sn_backlight_ops, &props);
> +	if (IS_ERR(bl)) {
> +		DRM_ERROR("failed to register backlight device\n");
> +		return PTR_ERR(bl);
> +	}
> +
> +	return 0;
> +}
> +
>  static int ti_sn_bridge_probe(struct i2c_client *client,
>  			      const struct i2c_device_id *id)
>  {
> @@ -1224,6 +1353,12 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  
>  	pm_runtime_enable(pdata->dev);
>  
> +	ret = ti_sn_backlight_init(pdata);
> +	if (ret) {
> +		pm_runtime_disable(pdata->dev);
> +		return ret;
> +	}
> +
>  	ret = ti_sn_setup_gpio_controller(pdata);
>  	if (ret) {
>  		pm_runtime_disable(pdata->dev);


Tested-By: Steev Klimaszewski <steev@kali.org>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
