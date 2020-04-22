Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECDE1B55DD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D58B06E25E;
	Thu, 23 Apr 2020 07:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDA689F24
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 10:23:28 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id y6so697693pjc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 03:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=WRRFLMP1BZKaT01S2NP0T7yJMR9Vv9XgNrqlamOXvlk=;
 b=h2u4L54UOBk5bt6yv8RXgBBHJazXRBpDVcwKdGjQh8rJdtnaRazSV/jGVNL229gKug
 KO4ju7yXSfaW2KATsjEEa2gdlizp+eNdhoRtNbGfw/i16Vie+HMSKHFQhAPxa0WVwMz3
 dTtWlPOFZBnGd6uMIQ6/7SRFss6P5y7pOQPzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=WRRFLMP1BZKaT01S2NP0T7yJMR9Vv9XgNrqlamOXvlk=;
 b=M7yWIxaoQYvOHvXYFK9jyM+pwY2ossGaTyAhw2Pg2CgKNkkn9wXFL0M+wcGBB45DwL
 PFdxYT5NtyIkifvufBUczfBwAXBRB0KpPNJIgW1yYMB2GwjiIItHsG73uONVo42m6PwB
 C5VqRQgGF/eJsch2Gm7bOb6Nxjuioi3yU6et1dXlm3WKHkp8H1iWWYE/2m47KOyjl9qN
 NPgUVK6NL7yP6bHuF1+AZdDGNg/XZB2L9UzxfMptr6h4WsGEyUvUOZ16Ew+7PGUoQL6m
 ppCFGNeZDJA3TOW44lshIZ0J7M8g6XkYhc5UPXcQkFIFWrSoUxPuDHxs91UwtqadfXlf
 rxDQ==
X-Gm-Message-State: AGi0PuZeC7YnF7Z/9lUzLwo5DkR4UWgxKDNP1M6atVXyG4kURyh+2thV
 NwtrarX/LvgMN1sACDRVdNOq+w==
X-Google-Smtp-Source: APiQypIlibtTzWoHaOZSF9q8way5d7W2yJSRS6zaspDWYgGUnJV4TbKw4SlxZxjRNZrPc7P2cqeBag==
X-Received: by 2002:a17:90a:b10f:: with SMTP id
 z15mr9879288pjq.188.1587551008343; 
 Wed, 22 Apr 2020 03:23:28 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id x12sm4998977pfq.209.2020.04.22.03.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 03:23:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200420220458.v2.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
References: <20200421050622.8113-1-dianders@chromium.org>
 <20200420220458.v2.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
Subject: Re: [PATCH v2 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to
 Linux
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Laurent.pinchart@ideasonboard.com,
 a.hajda@samsung.com, airlied@linux.ie, bgolaszewski@baylibre.com,
 daniel@ffwll.ch, linus.walleij@linaro.org, narmstrong@baylibre.com,
 robh+dt@kernel.org, spanda@codeaurora.org
Date: Wed, 22 Apr 2020 03:23:26 -0700
Message-ID: <158755100643.159702.17904334834962681759@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jeffrey.l.hugo@gmail.com, linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2020-04-20 22:06:17)
> The ti-sn65dsi86 MIPI DSI to eDP bridge chip has 4 pins on it that can
> be used as GPIOs in a system.  Each pin can be configured as input,
> output, or a special function for the bridge chip.  These are:
> - GPIO1: SUSPEND Input
> - GPIO2: DSIA VSYNC
> - GPIO3: DSIA HSYNC or VSYNC
> - GPIO4: PWM
> 
> Let's expose these pins as GPIOs.  A few notes:
> - Access to ti-sn65dsi86 is via i2c so we set "can_sleep".
> - These pins can't be configured for IRQ.
> - There are no programmable pulls or other fancy features.
> - Keeping the bridge chip powered might be expensive.  The driver is
>   setup such that if all used GPIOs are only inputs we'll power the
>   bridge chip on just long enough to read the GPIO and then power it
>   off again.  Setting a GPIO as output will keep the bridge powered.
> - If someone releases a GPIO we'll implicitly switch it to an input so
>   we no longer need to keep the bridge powered for it.
> 
> Becaue of all of the above limitations we just need to implement a

Because

> bare-bones GPIO driver.  The device tree bindings already account for
> this device being a GPIO controller so we only need the driver changes
> for it.
> 
> NOTE: Despite the fact that these pins are nominally muxable I don't
> believe it makes sense to expose them through the pinctrl interface as
> well as the GPIO interface.  The special functions are things that the
> bridge chip driver itself would care about and it can just configure
> the pins as needed.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> 

Cool patch.

> Changes in v2:
> - ("Export...GPIOs") is 1/2 of replacement for ("Allow...bridge GPIOs")
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 165 ++++++++++++++++++++++++++
>  1 file changed, 165 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 6ad688b320ae..d04c2b83d699 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -874,6 +886,153 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn_bridge *pdata)
>         return 0;
>  }
>  
> +static struct ti_sn_bridge *gchip_to_pdata(struct gpio_chip *chip)
> +{
> +       return container_of(chip, struct ti_sn_bridge, gchip);
> +}
> +
> +static int ti_sn_bridge_gpio_get_direction(struct gpio_chip *chip,
> +                                          unsigned int offset)
> +{
> +       struct ti_sn_bridge *pdata = gchip_to_pdata(chip);
> +
> +       return (atomic_read(&pdata->gchip_output) & BIT(offset)) ?

Any reason this isn't a bitmap?

> +               GPIOF_DIR_OUT : GPIOF_DIR_IN;

And why can't we read the hardware to figure out if it's in output or
input mode?

> +}
> +
[...]
> +static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
> +                                             unsigned int offset, int val)
> +{
> +       struct ti_sn_bridge *pdata = gchip_to_pdata(chip);
> +       int shift = offset * 2;
> +       int old_gchip_output;
> +       int ret;
> +
> +       old_gchip_output = atomic_fetch_or(BIT(offset), &pdata->gchip_output);

I presume gpiolib is already preventing a gpio from being modified twice
at the same time. So is this atomic stuff really necessary?

> +       if (old_gchip_output & BIT(offset))
> +               return 0;
> +
> +       pm_runtime_get_sync(pdata->dev);
> +
> +       /* Set value first to avoid glitching */
> +       ti_sn_bridge_gpio_set(chip, offset, val);
> +
> +       /* Set direction */
> +       ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> +                                0x3 << shift, SN_GPIO_MUX_OUTPUT << shift);
> +       if (ret) {
> +               atomic_andnot(BIT(offset), &pdata->gchip_output);
> +               pm_runtime_put(pdata->dev);
> +       }
> +
> +       return ret;
> +}
> +
> +static void ti_sn_bridge_gpio_free(struct gpio_chip *chip, unsigned int offset)
> +{
> +       /* We won't keep pm_runtime if we're input, so switch there on free */
> +       ti_sn_bridge_gpio_direction_input(chip, offset);
> +}
> +
> +static const char * const ti_sn_bridge_gpio_names[] = {
> +       "GPIO1", "GPIO2", "GPIO3", "GPIO4"
> +};
> +
> +static int ti_sn_setup_gpio_controller(struct ti_sn_bridge *pdata)
> +{
[...]
> +       pdata->gchip.names = ti_sn_bridge_gpio_names;
> +       pdata->gchip.ngpio = ARRAY_SIZE(ti_sn_bridge_gpio_names);
> +       ret = devm_gpiochip_add_data(pdata->dev, &pdata->gchip, pdata);
> +       if (ret) {
> +               dev_err(pdata->dev, "can't add gpio chip\n");
> +               return ret;
> +       }
> +
> +       return 0;

return ret?

> +}
> +
>  static int ti_sn_bridge_probe(struct i2c_client *client,
>                               const struct i2c_device_id *id)
>  {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
