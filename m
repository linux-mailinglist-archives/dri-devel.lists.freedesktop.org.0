Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5457281D0F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 22:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57556E9CB;
	Fri,  2 Oct 2020 20:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21E86E9CB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 20:43:02 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id d2so542605vkd.13
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 13:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oH2IuyJXkJ1EymE28KST/lfUbPTq/MguUoQDeaf9X/A=;
 b=f4ddM9o0HoyR2qHPNs+JOjY3teqYwTHoazjRh97xTRWxJHHFB9odVE2FunznsuHQMJ
 rZ0s/jT5xM/BKOu0D4YyFhbktO2Mpgz+ciHPDoxxkQRYfxKKOtdHenUSUyfTpUoevqVx
 3PSbxF++REzZ/XFpL6Mx3n4Bwgl1x4E9bmkEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oH2IuyJXkJ1EymE28KST/lfUbPTq/MguUoQDeaf9X/A=;
 b=pWjEK+HzM90+D5wxwIfOg1eRH+eObWM2FK8p2AlmHzqjHfNcD1O7HeEdSsj9mnGHo2
 Ehiilp+6al0dt1ZxPPx0cd8AFecjqNKSu91du19twMsRnGrX1WiZm4yOS7xOxuiyApD9
 2A+SnOeLRV+U+sEbD3Ocdnm4uE1v3T0yzk2s7Be++gQVKv7kR5JG/rrh+EOXRwgOeJBH
 HfXhVK6ruhgkcmzntjT/3hLtu2xBd1UAHqKEjMKMCIoxf/cUMSlMqdhvkqoDcoyGm4eL
 wmLnjvrGWCa8QbxR9eWx09IJRwRkdXVlZQ4EcmCFfDVRcm5OEDJFrLnfqw7Gl1jG+iMC
 NrJg==
X-Gm-Message-State: AOAM532c5Xz06vf5414sBnMoP2h5A5Jf03UvtrtAHuT8m2yirLQ7rG9M
 gmdGUp0TAVVnWcfj+8LY6DIoAA/DVOpLWw==
X-Google-Smtp-Source: ABdhPJzGAPo+G3IgQefV2Axks9ie8lgApQIAuu2kGvgcxidgnsQ7hfGYNSVBhNeFpHNDi3J3ndILCw==
X-Received: by 2002:a1f:a3cc:: with SMTP id m195mr2506451vke.16.1601671381332; 
 Fri, 02 Oct 2020 13:43:01 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id p3sm415497vkd.41.2020.10.02.13.42.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 13:43:00 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id z46so724721uac.13
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 13:42:59 -0700 (PDT)
X-Received: by 2002:ab0:29d7:: with SMTP id i23mr2429826uaq.121.1601671379400; 
 Fri, 02 Oct 2020 13:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200930223532.77755-1-bjorn.andersson@linaro.org>
 <20200930223532.77755-3-bjorn.andersson@linaro.org>
In-Reply-To: <20200930223532.77755-3-bjorn.andersson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 2 Oct 2020 13:42:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbEMi-xviVfJCY4U5ncSUU8-9_Q_VMHZn5uDAp1pNH+g@mail.gmail.com>
Message-ID: <CAD=FV=XbEMi-xviVfJCY4U5ncSUU8-9_Q_VMHZn5uDAp1pNH+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi86: Expose backlight controls
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Sep 30, 2020 at 3:40 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
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
>         select REGMAP_I2C
>         select DRM_PANEL
>         select DRM_MIPI_DSI
> +       select BACKLIGHT_CLASS_DEVICE
>         help
>           Texas Instruments SN65DSI86 DSI to eDP Bridge driver
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 5b6e19ecbc84..41e24d0dbd18 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -68,6 +68,7 @@
>  #define  SN_GPIO_MUX_OUTPUT                    1
>  #define  SN_GPIO_MUX_SPECIAL                   2
>  #define  SN_GPIO_MUX_MASK                      0x3
> +#define  SN_GPIO_MUX_SHIFT(gpio)               ((gpio) * 2)
>  #define SN_AUX_WDATA_REG(x)                    (0x64 + (x))
>  #define SN_AUX_ADDR_19_16_REG                  0x74
>  #define SN_AUX_ADDR_15_8_REG                   0x75
> @@ -86,6 +87,12 @@
>  #define SN_ML_TX_MODE_REG                      0x96
>  #define  ML_TX_MAIN_LINK_OFF                   0
>  #define  ML_TX_NORMAL_MODE                     BIT(0)
> +#define SN_PWM_PRE_DIV_REG                     0xA0
> +#define SN_BACKLIGHT_SCALE_REG                 0xA1
> +#define SN_BACKLIGHT_REG                       0xA3
> +#define SN_PWM_CTL_REG                         0xA5
> +#define  SN_PWM_ENABLE                         BIT(1)
> +#define  SN_PWM_INVERT                         BIT(0)
>  #define SN_AUX_CMD_STATUS_REG                  0xF4
>  #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT          BIT(3)
>  #define  AUX_IRQ_STATUS_AUX_SHORT              BIT(5)
> @@ -155,6 +162,8 @@ struct ti_sn_bridge {
>         struct gpio_chip                gchip;
>         DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
>  #endif
> +       u32                             brightness;
> +       u32                             max_brightness;

You missed adding to the docstring for brightness and max_brightness.

Also: why do you need your own copy of these two values?  Couldn't you
just store the "struct backlight_device *" that came back from
"devm_backlight_device_register()" and then reference
bl->props.brightness / bl->props.max_brightness?


>  };
>
>  static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
> @@ -173,6 +182,18 @@ static const struct regmap_config ti_sn_bridge_regmap_config = {
>         .cache_type = REGCACHE_NONE,
>  };
>
> +static void ti_sn_bridge_read_u16(struct ti_sn_bridge *pdata,
> +                                 unsigned int reg, u16 *val)
> +{
> +       unsigned int high;
> +       unsigned int low;
> +
> +       regmap_read(pdata->regmap, reg, &low);
> +       regmap_read(pdata->regmap, reg + 1, &high);
> +
> +       *val = high << 8 | low;
> +}

Ideally you should be error checking your reads.  I know this driver
isn't very good about error checking the regmap reads in general, but
probably that should be fixed.  Certainly i2c-backed regmaps can have
failures and you will then do your math on whatever uninitialized
memory was on the stack.  That seems bad.

Presumably you'll then want to return the error code from this
function?  If for some reason you don't, your function should just
return the val instead of passing by reference.


>  static void ti_sn_bridge_write_u16(struct ti_sn_bridge *pdata,
>                                    unsigned int reg, u16 val)
>  {
> @@ -180,6 +201,50 @@ static void ti_sn_bridge_write_u16(struct ti_sn_bridge *pdata,
>         regmap_write(pdata->regmap, reg + 1, val >> 8);
>  }
>
> +static int ti_sn_backlight_update(struct ti_sn_bridge *pdata)
> +{
> +       unsigned int pre_div;
> +
> +       if (!pdata->max_brightness)
> +               return 0;
> +
> +       /* Enable PWM on GPIO4 */
> +       regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> +                          SN_GPIO_MUX_MASK << SN_GPIO_MUX_SHIFT(4 - 1),
> +                          SN_GPIO_MUX_SPECIAL << SN_GPIO_MUX_SHIFT(4 - 1));
> +
> +       if (pdata->brightness) {
> +               /* Set max brightness */
> +               ti_sn_bridge_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, pdata->max_brightness);
> +
> +               /* Set brightness */
> +               ti_sn_bridge_write_u16(pdata, SN_BACKLIGHT_REG, pdata->brightness);
> +
> +               /*
> +                * The PWM frequency is derived from the refclk as:
> +                * PWM_FREQ = REFCLK_FREQ / (PWM_PRE_DIV * BACKLIGHT_SCALE + 1)
> +                *
> +                * A hand wavy estimate based on 12MHz refclk and 500Hz desired
> +                * PWM frequency gives us a pre_div resulting in a PWM
> +                * frequency of between 500 and 1600Hz, depending on the actual
> +                * refclk rate.
> +                *
> +                * One is added to avoid high BACKLIGHT_SCALE values to produce
> +                * a pre_div of 0 - which cancels out the large BACKLIGHT_SCALE
> +                * value.
> +                */
> +               pre_div = 12000000 / (500 * pdata->max_brightness) + 1;
> +               regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);

Different panels have different requirements for PWM frequency.  Some
may also have different duty-cycle to brightness curves that differ
based on the PWM frequency and it would be nice to make sure we know
what frequency we're at rather than getting something random-ish.  It
feels like you need to be less hand-wavy.  You should presumably
specify the desired frequency in the device tree and then do the math.


> +               /* Enable PWM */
> +               regmap_update_bits(pdata->regmap, SN_PWM_CTL_REG, SN_PWM_ENABLE, SN_PWM_ENABLE);
> +       } else {
> +               regmap_update_bits(pdata->regmap, SN_PWM_CTL_REG, SN_PWM_ENABLE, 0);
> +       }

While technically it works OK to conflate brightness = 0 with
backlight disabled (the PWM driver exposed by the Chrome OS EC does,
at least), I believe the API in Linux does make a difference.  Why not
match the Linux API.  If Linux says that the backlight should be at
brightness 50 but should be off, set the brightness to 50 and turn the
backlight off.  If it says set the brightness to 0 and turn it on,
honor it.

I believe (but haven't tested) one side effect of the way you're doing
is is that:

set_brightness(50)
blank()
unblank()
get_brightness()

...will return 0, not 50.  I believe (but haven't tested) that if you
don't implement get_brightness() it would fix things,


> +static int ti_sn_backlight_update_status(struct backlight_device *bl)
> +{
> +       struct ti_sn_bridge *pdata = bl_get_data(bl);
> +       int brightness = bl->props.brightness;
> +
> +       if (bl->props.power != FB_BLANK_UNBLANK ||
> +           bl->props.fb_blank != FB_BLANK_UNBLANK ||
> +           bl->props.state & BL_CORE_FBBLANK) {

backlight_is_blank() instead of open-coding?  ...or you somehow don't
want the extra test for "BL_CORE_SUSPENDED" ?


> +               pdata->brightness = 0;

As per comments in ti_sn_backlight_update(), IMO you want to keep
enabled / disabled state separate from brightness.


> +       }
> +
> +       pdata->brightness = brightness;
> +
> +       return ti_sn_backlight_update(pdata);
> +}

Just to be neat and tidy, I'd expect something in the above would do a
pm_runtime_get_sync() when the backlight first turns on and
pm_runtime_put() when the backlight goes blank.  Right now you're
relying on the fact that the backlight is usually turned on later in
the sequence, but it shouldn't hurt to add an extra pm_runtime
reference and means you're no longer relying on the implicitness.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
