Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6FA57FBB4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 10:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90FF18B8DC;
	Mon, 25 Jul 2022 08:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A01B18B8DC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:51:44 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id j22so19318547ejs.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 01:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sRH3Ko4u3nUzP+XsjQZDkgCAeoY72VHZaoe9ljYtNKk=;
 b=b1ttEgokmKJ5jDFSHg4C3qui+lCgzhMb1cFI+vnFX9/Qaqz5wXWkN7XbXTCmQ3rbX8
 /3TN1NF7tN2a41ftKlXShOS7XLz6vjt/dE/JoVvRFVa7TBsRv37MEJRyEWP7V4gtObN8
 DWOlJaAA+IaENb1E9U2bsj5iMsc5NaHbap/4bNNdkO+vyaoG6bExWIwrQG9s7uFg7Baj
 s+FY3gPXBy8r3qaYg0AV960MNBWHc4g/ppm+fVbr7FGTau4bS6hbfDOGbOOSslhkiqHB
 4edKEq3lX1FHBOVPE941JMEmpBIHu6i/Z5b0c8XziqmaTyViSW8bxZxzR+/rVIJcM7jV
 un+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sRH3Ko4u3nUzP+XsjQZDkgCAeoY72VHZaoe9ljYtNKk=;
 b=3sBA6mRyormHPfVGhRZDjQUU6DspTbweoEYpDpKIXXC1iv7p61iCGD1TLZ2lXWQWP6
 lW1BhsH1icHp8HvC6fCnLdB/21rJeJOrZkGFYlc0r9ZpTFcIxmj/fQX+FLE1IzxwCOlo
 umiceikYYPJ6MkjJR6QIWTuPJGmPPZSkgnwC9lrEyvjZ9XNJduTpFR9bBn4eA6sJMGv6
 t0SCIhyg+is5kHi8WYxiPPlRHvLROyCl2vA6qcoM5/7NQS9Mz+zWbOXCvSGpE4ZFCU2B
 YBv60/XeRCHOnqdFaxi7DXJGaZU0so7u7G3DDhJE/EDQ+ey+1Y9Yv6fnWWTuIXaJCbeT
 onxw==
X-Gm-Message-State: AJIora/dN9go5aGti8WKUQLgJCcJ5Sc8YL/keeZv8wtyOwkvqsJsDof7
 LKiQKCP2OouSXlebQ7QOIi6cn0creehIz1UIy8E=
X-Google-Smtp-Source: AGRyM1t++SIdSmibdfYzJgTAAGzjzRMgfSGJttBagInbaOHb+Jia4m43oDM7a3cRNSWK7OUMOrpRHLsW33nuUHySItE=
X-Received: by 2002:a17:907:1c8d:b0:6f2:eb2:1cd6 with SMTP id
 nb13-20020a1709071c8d00b006f20eb21cd6mr9106852ejc.568.1658739102757; Mon, 25
 Jul 2022 01:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-13-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-13-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 10:51:06 +0200
Message-ID: <CAHp75Vf85_uzA9fRxTizbPJxODcXFpM4wuU6DxP2j9UA47B_2g@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Krogerus,
 Heikki" <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang <cy_huang@richtek.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, szuni chen <szunichen@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 12:25 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: Alice Chen <alice_chen@richtek.com>
>
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>
> The Flash LED in MT6370 has 2 channels and support torch/strobe mode.
> Add the support of MT6370 FLASH LED.
>
> Signed-off-by: Alice Chen <alice_chen@richtek.com>

This SoB chain is wrong. Prioritize and read Submitting Patches!

...

> +static int mt6370_torch_brightness_set(struct led_classdev *lcdev,
> +                                      enum led_brightness level)
> +{
> +       struct mt6370_led *led = to_mt6370_led(lcdev, flash.led_cdev);
> +       struct mt6370_priv *priv = led->priv;
> +       u32 led_enable_mask = (led->led_no == MT6370_LED_JOINT) ?
> +                             MT6370_FLCSEN_MASK_ALL :
> +                             MT6370_FLCSEN_MASK(led->led_no);
> +       u32 enable_mask = MT6370_TORCHEN_MASK | led_enable_mask;
> +       u32 val = level ? led_enable_mask : 0;

> +       u32 prev = priv->fled_torch_used, curr;

Here and in the other functions with similar variables it seems you
never use prev after assigning curr.
Just define a single variable and use it accordingly.

> +       int ret, i;
> +
> +       mutex_lock(&priv->lock);
> +
> +       /*
> +        * Only one set of flash control logic,
> +        * use the flag to avoid strobe is currently used.
> +        */
> +       if (priv->fled_strobe_used) {
> +               dev_warn(lcdev->dev, "Please disable strobe first [%d]\n",
> +                        priv->fled_strobe_used);
> +               ret = -EBUSY;
> +               goto unlock;
> +       }
> +
> +       if (level)
> +               curr = prev | BIT(led->led_no);
> +       else
> +               curr = prev & ~BIT(led->led_no);
> +
> +       if (curr)
> +               val |= MT6370_TORCHEN_MASK;
> +
> +       if (level) {
> +               level -= 1;
> +               if (led->led_no == MT6370_LED_JOINT) {
> +                       int flevel[MT6370_MAX_LEDS];
> +
> +                       flevel[0] = level / 2;
> +                       flevel[1] = level - flevel[0];
> +                       for (i = 0; i < MT6370_MAX_LEDS; i++) {
> +                               ret = regmap_update_bits(priv->regmap,
> +                                               MT6370_REG_FLEDITOR(i),
> +                                               MT6370_ITORCH_MASK, flevel[i]);
> +                               if (ret)
> +                                       goto unlock;
> +                       }
> +               } else {
> +                       ret = regmap_update_bits(priv->regmap,
> +                                       MT6370_REG_FLEDITOR(led->led_no),
> +                                       MT6370_ITORCH_MASK, level);
> +                       if (ret)
> +                               goto unlock;
> +               }
> +       }
> +
> +       ret = regmap_update_bits(priv->regmap, MT6370_REG_FLEDEN,
> +                                enable_mask, val);
> +       if (ret)
> +               goto unlock;
> +
> +       priv->fled_torch_used = curr;
> +
> +unlock:
> +       mutex_unlock(&priv->lock);
> +       return ret;
> +}

...

> +       struct v4l2_flash_config v4l2_config = {0};

0 is not needed.

-- 
With Best Regards,
Andy Shevchenko
