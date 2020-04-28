Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 103D21BBDCD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1ED96E250;
	Tue, 28 Apr 2020 12:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AC46E339
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 12:44:22 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f11so16714055ljp.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 05:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YYJpKvgRNwf06GUmtJtBJkQp9t7R4gewPU7zZ78LA+s=;
 b=mk2RHuyP1dBXuBJrfAOgE4aTk4QCMyQynOZyfN/yKbZbhy4BXeuLtNyFWDHODwzeiC
 cZKJ0bVU4Ila7ewhdJekO1M+Wqxfp716yNDK2+Og+KI5m2rbWx57Aj0V6nqGLaBXph2W
 OOWSF68o4YAQpct91VaidNWsvZj83lArAOLnjGwMYsGxnFxHmNa1YdAlCpfR0tj5XxK+
 8MKWraI/EYHPVVtw/vaaxx5bFK2CH81c2JV2yoSEurhiT6jz1zgMS6zL/d5sszc6eENO
 TiWgE8A9eEXIojHW3wV6d8AZ7FuUF2mtZstIdmwW+DMcv/BWbMcxHYBhFddLM/NuQGIy
 vd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YYJpKvgRNwf06GUmtJtBJkQp9t7R4gewPU7zZ78LA+s=;
 b=TnJxh6r79zOR/qubDVgXZ6OQNif8/H+Mpn3hQ+UsMHknrd2NXY/TXpApkT8PuCGeXG
 GVvxwoE1kIYA3cpSlF29XTqOdIFC4B9GLNwHrGNr+XGxn0P7W2iHp2eUIGz/QOy8FQlQ
 ztqv5iIeo5xu7w8R1v8qPyjNaBCS7xXdqG1RgkZ2rt1JgDReNp3FVrSKltNQ3HOW1PrU
 vJ1vReVFslmUaQm5lOjjDGHtLdekYnksISMfzbZgvo6urD6JWzgtIryLMWZbilZO2tOQ
 D95tadvrrHg5UZbHt+bsSDpcasIejyE9fc9CCBK/+MnF9iqRNLxEaSc1rY0uV3favknr
 0pkw==
X-Gm-Message-State: AGi0PubcSLw994iY0+5pztdn63ed6TmzsHxTlhFPYjxGYYe3PXCCH+qe
 c9MJDRALJBiWyhDNmItP9UL0xXpaIe3vsqYRx3Z2Ww==
X-Google-Smtp-Source: APiQypLwu6uj/vOvGPr2x0PmORxYHaK42JWpzfvhR7IaWOGGQ5sMKsweb+hLcKNmLiQz6ikMd8hEcH9LBAJglrU6wZE=
X-Received: by 2002:a05:651c:32e:: with SMTP id
 b14mr17623187ljp.277.1588077860337; 
 Tue, 28 Apr 2020 05:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200423162548.129661-1-dianders@chromium.org>
 <20200423092431.v3.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
In-Reply-To: <20200423092431.v3.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Apr 2020 14:44:09 +0200
Message-ID: <CACRpkdYsw1uFf_PVkRwibXUtQOwvWa7jqiw6aT9AdmkLLyqisQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to
 Linux
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Hajda <a.hajda@samsung.com>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Sandeep Panda <spanda@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 23, 2020 at 6:26 PM Douglas Anderson <dianders@chromium.org> wrote:

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
> Because of all of the above limitations we just need to implement a
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

Pretty cool.

I wonder if this chip could use the generic regmap GPIO helpers
that we are working on when they come around?
https://lore.kernel.org/linux-gpio/20200423174543.17161-11-michael@walle.cc/

> +#include <linux/gpio/driver.h>
> +#include <linux/gpio.h>

Only <linux/gpio/driver.h> should be needed else you are doing
something wrong.

> + * @gchip:        If we expose our GPIOs, this is used.
> + * @gchip_output: A cache of whether we've set GPIOs to output.  This
> + *                serves double-duty of keeping track of the direction and
> + *                also keeping track of whether we've incremented the
> + *                pm_runtime reference count for this pin, which we do
> + *                whenever a pin is configured as an output.

That sounds a bit hairy but I guess it's fine.

> + */
>  struct ti_sn_bridge {
>         struct device                   *dev;
>         struct regmap                   *regmap;
> @@ -102,6 +136,9 @@ struct ti_sn_bridge {
>         struct gpio_desc                *enable_gpio;
>         struct regulator_bulk_data      supplies[SN_REGULATOR_SUPPLY_NUM];
>         int                             dp_lanes;
> +
> +       struct gpio_chip                gchip;
> +       DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);

Do you really need a bitmap for 4 bits? Can't you just have something
like an u8 and check bit 0,1,2,3 ... well I suppose it has some elegance to
it as well but... hm.

> +static struct ti_sn_bridge *gchip_to_pdata(struct gpio_chip *chip)
> +{
> +       return container_of(chip, struct ti_sn_bridge, gchip);
> +}
> +
> +static int ti_sn_bridge_gpio_get_direction(struct gpio_chip *chip,
> +                                          unsigned int offset)
> +{
> +       struct ti_sn_bridge *pdata = gchip_to_pdata(chip);

Is there some specific reason why you don't just use
gpiochip_get_data()?

> +       /*
> +        * We already have to keep track of the direction because we use
> +        * that to figure out whether we've powered the device.  We can
> +        * just return that rather than (maybe) powering up the device
> +        * to ask its direction.
> +        */
> +       return test_bit(offset, pdata->gchip_output) ?
> +               GPIOF_DIR_OUT : GPIOF_DIR_IN;
> +}

Don't use these legacy defines, they are for consumers.
Use GPIO_LINE_DIRECTION_IN  and GPIO_LINE_DIRECTION_OUT.
from <linux/gpio/driver.h>

> +       ret = regmap_read(pdata->regmap, SN_GPIO_IO_REG, &val);
> +       pm_runtime_put(pdata->dev);
> +
> +       if (ret)
> +               return ret;
> +
> +       return (val >> (SN_GPIO_INPUT_SHIFT + offset)) & 1;

My preferred way to do this is:

#include <linux/bits.h>

return !!(val & BIT(SN_GPIO_INPUT_SHIFT + offset));

> +static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +                                 int val)
> +{
> +       struct ti_sn_bridge *pdata = gchip_to_pdata(chip);
> +       int ret;
> +
> +       if (!test_bit(offset, pdata->gchip_output)) {
> +               dev_err(pdata->dev, "Ignoring GPIO set while input\n");
> +               return;
> +       }
> +
> +       val &= 1;
> +       ret = regmap_update_bits(pdata->regmap, SN_GPIO_IO_REG,
> +                                BIT(SN_GPIO_OUTPUT_SHIFT + offset),
> +                                val << (SN_GPIO_OUTPUT_SHIFT + offset));

Looks like a job for the generic helper library.

> +static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
> +                                            unsigned int offset)
> +{
> +       struct ti_sn_bridge *pdata = gchip_to_pdata(chip);
> +       int shift = offset * 2;
> +       int ret;
> +
> +       if (!test_and_clear_bit(offset, pdata->gchip_output))
> +               return 0;
> +
> +       ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> +                                0x3 << shift, SN_GPIO_MUX_INPUT << shift);

But this 0x03 does not look very generic, it's not just 1 bit but 2.

Overall it looks good, just the minor things above need fixing or
looking into.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
