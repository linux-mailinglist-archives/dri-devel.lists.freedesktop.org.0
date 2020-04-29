Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 544701BD16F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 02:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520B26E82E;
	Wed, 29 Apr 2020 00:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6E86E82E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 00:52:44 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id d24so179090pll.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 17:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gSv5Ifa2op+fMfGu5LlO4imojcGp9XQzh/Jmiw8SHts=;
 b=kBwC8zcBSf2IlJ3oipK32zfSZi4BAIu2UR6yoRKzt6XmBRgSFa4HUpFbeArw87KyRu
 OejEW6P7gOao026eMAclLZ4t69Cwmb3pQtYEpL8B+PuyRQyYjhLBvURdRVyYzP4X+vw+
 6KBcVR+0FhaGCOB9E596BifbsyM4HepsRUl8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gSv5Ifa2op+fMfGu5LlO4imojcGp9XQzh/Jmiw8SHts=;
 b=sE02piBj+4t/MtRVKfrs2yWezGv5MYkOpVLCAeSjT8CgZPKg2HkFpQ5/z+4mhvyww6
 mtuZjOGP4cf7cOBGD7GjDKnPVXcPw/j7xTa+yBFcGNHR+zM+UlFRc5BsznN7VT+7JPyX
 LA16BGliEdbGuX5IDQyT3XskKEdTcUOHQ/Mh+ri/vqKI5ZpjSlibITL7MMWcwDDpcMYh
 9YBDYRwJhQaPlRrYE/iBULfPZGaKaCovTPOjruYMUvn4VvIZRn2ZcxT24pAa0U/zINlL
 rGRGq6Ccm+Szk3lKxuBNtQuqMnaP5uK9ip3xT7vXneCYA30/vyvfVDhrrGGt3BNdqXGV
 Uy4Q==
X-Gm-Message-State: AGi0PuahostXL9IWaADU1CcPGzEBDwaFIFSyebU34vKviPh82GNrlcV4
 vxukzyJCeTxFk4H4ecz6BdbXccDExjw=
X-Google-Smtp-Source: APiQypIa+fiyIwbVOocj/pKw5WYnpfUVYddYCvYQ+MWwi2C2B9Wug+vIWk39oAw4kN1dxkOt5C11/w==
X-Received: by 2002:a17:90a:5648:: with SMTP id
 d8mr113383pji.163.1588121563479; 
 Tue, 28 Apr 2020 17:52:43 -0700 (PDT)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com.
 [209.85.214.169])
 by smtp.gmail.com with ESMTPSA id l64sm3332333pjb.44.2020.04.28.17.52.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2020 17:52:43 -0700 (PDT)
Received: by mail-pl1-f169.google.com with SMTP id u22so171496plq.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 17:52:43 -0700 (PDT)
X-Received: by 2002:a05:6102:4d:: with SMTP id
 k13mr24291673vsp.198.1588121113080; 
 Tue, 28 Apr 2020 17:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200423162548.129661-1-dianders@chromium.org>
 <20200423092431.v3.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
 <CACRpkdYsw1uFf_PVkRwibXUtQOwvWa7jqiw6aT9AdmkLLyqisQ@mail.gmail.com>
In-Reply-To: <CACRpkdYsw1uFf_PVkRwibXUtQOwvWa7jqiw6aT9AdmkLLyqisQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 Apr 2020 17:45:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VqD-dY=v23KYuTqy8aRNQJJzJ7h_UOcdEBYuK9X51MQQ@mail.gmail.com>
Message-ID: <CAD=FV=VqD-dY=v23KYuTqy8aRNQJJzJ7h_UOcdEBYuK9X51MQQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to
 Linux
To: Linus Walleij <linus.walleij@linaro.org>
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

Hi,

On Tue, Apr 28, 2020 at 5:44 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Apr 23, 2020 at 6:26 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> > The ti-sn65dsi86 MIPI DSI to eDP bridge chip has 4 pins on it that can
> > be used as GPIOs in a system.  Each pin can be configured as input,
> > output, or a special function for the bridge chip.  These are:
> > - GPIO1: SUSPEND Input
> > - GPIO2: DSIA VSYNC
> > - GPIO3: DSIA HSYNC or VSYNC
> > - GPIO4: PWM
> >
> > Let's expose these pins as GPIOs.  A few notes:
> > - Access to ti-sn65dsi86 is via i2c so we set "can_sleep".
> > - These pins can't be configured for IRQ.
> > - There are no programmable pulls or other fancy features.
> > - Keeping the bridge chip powered might be expensive.  The driver is
> >   setup such that if all used GPIOs are only inputs we'll power the
> >   bridge chip on just long enough to read the GPIO and then power it
> >   off again.  Setting a GPIO as output will keep the bridge powered.
> > - If someone releases a GPIO we'll implicitly switch it to an input so
> >   we no longer need to keep the bridge powered for it.
> >
> > Because of all of the above limitations we just need to implement a
> > bare-bones GPIO driver.  The device tree bindings already account for
> > this device being a GPIO controller so we only need the driver changes
> > for it.
> >
> > NOTE: Despite the fact that these pins are nominally muxable I don't
> > believe it makes sense to expose them through the pinctrl interface as
> > well as the GPIO interface.  The special functions are things that the
> > bridge chip driver itself would care about and it can just configure
> > the pins as needed.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Pretty cool.
>
> I wonder if this chip could use the generic regmap GPIO helpers
> that we are working on when they come around?
> https://lore.kernel.org/linux-gpio/20200423174543.17161-11-michael@walle.cc/

An important part of my patch is the handling of power management.
Specifically:
* If the GPIO is an input we don't need to keep the device powered,
just power it temporarily to read the pin.
* If the GPIO is an output we do need to keep the device powered.

I suppose that could be common for other similar devices so as long as
the generic interfaces can handle this concept we can try to use it.


> > +#include <linux/gpio/driver.h>
> > +#include <linux/gpio.h>
>
> Only <linux/gpio/driver.h> should be needed else you are doing
> something wrong.

It's because I needed GPIOF_DIR_OUT / GPIOF_DIR_IN which was
apparently wrong.  See below.


> > + * @gchip:        If we expose our GPIOs, this is used.
> > + * @gchip_output: A cache of whether we've set GPIOs to output.  This
> > + *                serves double-duty of keeping track of the direction and
> > + *                also keeping track of whether we've incremented the
> > + *                pm_runtime reference count for this pin, which we do
> > + *                whenever a pin is configured as an output.
>
> That sounds a bit hairy but I guess it's fine.
>
> > + */
> >  struct ti_sn_bridge {
> >         struct device                   *dev;
> >         struct regmap                   *regmap;
> > @@ -102,6 +136,9 @@ struct ti_sn_bridge {
> >         struct gpio_desc                *enable_gpio;
> >         struct regulator_bulk_data      supplies[SN_REGULATOR_SUPPLY_NUM];
> >         int                             dp_lanes;
> > +
> > +       struct gpio_chip                gchip;
> > +       DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
>
> Do you really need a bitmap for 4 bits? Can't you just have something
> like an u8 and check bit 0,1,2,3 ... well I suppose it has some elegance to
> it as well but... hm.

Doing so requires adding a lock to this driver to handle concurrent
users of the different GPIOs.  I can go back and do that but I'd
rather not.

Some prior discussion:

https://lore.kernel.org/r/CAD=FV=WJONhm4ukwZa2vGtozrz_SmLuTCLxVimnGba7wRPPzgQ@mail.gmail.com

...if you want me to change this to a u8 + a mutex then please let me
know, otherwise I'll assume keeping it a bitmap is fine.


> > +static struct ti_sn_bridge *gchip_to_pdata(struct gpio_chip *chip)
> > +{
> > +       return container_of(chip, struct ti_sn_bridge, gchip);
> > +}
> > +
> > +static int ti_sn_bridge_gpio_get_direction(struct gpio_chip *chip,
> > +                                          unsigned int offset)
> > +{
> > +       struct ti_sn_bridge *pdata = gchip_to_pdata(chip);
>
> Is there some specific reason why you don't just use
> gpiochip_get_data()?

I guess I'm used to interfaces that don't have a data pointer.  I'll
change it to gpiochip_get_data() at your suggestion, though (I think)
it might be slightly less efficient (a function call and a pointer
dereference compared to a subtract operation).


> > +       /*
> > +        * We already have to keep track of the direction because we use
> > +        * that to figure out whether we've powered the device.  We can
> > +        * just return that rather than (maybe) powering up the device
> > +        * to ask its direction.
> > +        */
> > +       return test_bit(offset, pdata->gchip_output) ?
> > +               GPIOF_DIR_OUT : GPIOF_DIR_IN;
> > +}
>
> Don't use these legacy defines, they are for consumers.
> Use GPIO_LINE_DIRECTION_IN  and GPIO_LINE_DIRECTION_OUT.
> from <linux/gpio/driver.h>

That's what I get for reading the comments.  I'll change this in the
next version.  I've also sent the following patch to help keep other
people from falling into my trap:

https://lore.kernel.org/r/20200428172322.1.I396f351e364f3c09df7c7606e79abefb8682c092@changeid/


> > +       ret = regmap_read(pdata->regmap, SN_GPIO_IO_REG, &val);
> > +       pm_runtime_put(pdata->dev);
> > +
> > +       if (ret)
> > +               return ret;
> > +
> > +       return (val >> (SN_GPIO_INPUT_SHIFT + offset)) & 1;
>
> My preferred way to do this is:
>
> #include <linux/bits.h>
>
> return !!(val & BIT(SN_GPIO_INPUT_SHIFT + offset));

Somehow I think of "!!" as being a bool and this function as returning
something that's logically an int.  It really doesn't matter a whole
lot and I'm happy to change it, so I'll change it in the next version.


> > +static void ti_sn_bridge_gpio_set(struct gpio_chip *chip, unsigned int offset,
> > +                                 int val)
> > +{
> > +       struct ti_sn_bridge *pdata = gchip_to_pdata(chip);
> > +       int ret;
> > +
> > +       if (!test_bit(offset, pdata->gchip_output)) {
> > +               dev_err(pdata->dev, "Ignoring GPIO set while input\n");
> > +               return;
> > +       }
> > +
> > +       val &= 1;
> > +       ret = regmap_update_bits(pdata->regmap, SN_GPIO_IO_REG,
> > +                                BIT(SN_GPIO_OUTPUT_SHIFT + offset),
> > +                                val << (SN_GPIO_OUTPUT_SHIFT + offset));
>
> Looks like a job for the generic helper library.

I think that (for now) this comment is a no-op since the generic
helper library isn't landed yet, right?  ...and it wouldn't handle the
power management I need?  If I'm confused and I need to act on this
comment, please let me know.


> > +static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
> > +                                            unsigned int offset)
> > +{
> > +       struct ti_sn_bridge *pdata = gchip_to_pdata(chip);
> > +       int shift = offset * 2;
> > +       int ret;
> > +
> > +       if (!test_and_clear_bit(offset, pdata->gchip_output))
> > +               return 0;
> > +
> > +       ret = regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> > +                                0x3 << shift, SN_GPIO_MUX_INPUT << shift);
>
> But this 0x03 does not look very generic, it's not just 1 bit but 2.

Sure, I can add #define SN_GPIO_MUX_MASK 0x3.  Basically the mux is:

* 0: input
* 1: output
* 2: special function

As talked about in the patch comments, I don't define this as an
official pinmux driver because that seems overkill.  I'll assume it's
OK to just do the #define and use it.  If you want something more, let
me know.


> Overall it looks good, just the minor things above need fixing or
> looking into.

Thank you very much for the review!  I'll plan to send a new patch out
in the next day or two with minor comments addressed and making the
assumptions I've documented above.  If I got something wrong then
please yell.  ...or yell after I send the next version and I'll send
yet another version after that!  :-)

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
