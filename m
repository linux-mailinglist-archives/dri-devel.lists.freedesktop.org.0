Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A39E565EC6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 23:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44FA10E87E;
	Mon,  4 Jul 2022 21:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CC210ED3D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 21:14:41 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3137316bb69so91450837b3.10
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 14:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HpdquBLgwxS+q6MF90ETAqdi+gZ5jGI/bw3VMe7+rpM=;
 b=pisWhvytYZKcu+6yG4fRYH2VSnfWPvpTWA+gGM2H9VsDnz1Nib2CFiFmg3pHrwfMLA
 jDwEDffpRMjn8/A+wioAF9Cq2+qv8EhBQqcsEuO3EMmu14Zw8HGGpmsNHlSX+BjaPIYz
 v9swYPqNcfcEpwpvhj9RHrNU7Kr3NnRhPDvVKnrmzZYXLtriCDIeXN+U0W9ia0fF5mRC
 Fs4O7JBhbxC04sxj2Jq4uzhG+waPhMmluTQCcYWdp949oDqMk74B2o8JYRErDbJgojw7
 iC21Q1WweofBJD8188y54cG3nP/c8Wr4aV16mZq9v2Xdu0smJbbPholxpaf2ZKiPz9cp
 KVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HpdquBLgwxS+q6MF90ETAqdi+gZ5jGI/bw3VMe7+rpM=;
 b=d+kIVRTQi/7oz7Sbh0Ei7DfvJelITI8qeWMAfDF1L43wNKgy7qLz3izurFrBD8r94O
 xe1T/4rnMiQFggOu6GS3pFQkYn8pJZrYPxOKVunTRTk8bxbuJHag1eZ9n0aVDQkstCXC
 n3TiFg26kKV0gePBzK28QcPptrPmQxPUGZP5s/0eXk4U3jdUUy6ACfd3/u5K05pfmPmb
 8CGZufQkpEqwESaDMCoVDn5IgtJ+leJ0aXK3lovOQF8ltSRcte910A9UgUOTHRhTKmhc
 /M5LRmVH4zxAB8cWLURz/IXD4t3VW76X38yQGNB7wVBXYLB3FTeErtHaY4MwkR3+Wvdf
 WYAA==
X-Gm-Message-State: AJIora+EyH/x8nmHsDqfBkN343c33ABLgbHE4I79lDxoBbgMCme4gga/
 hSkpQ+9ewoPAvz6gvUkL+yH3pPkF7KrIk9Lmq0I=
X-Google-Smtp-Source: AGRyM1vYxguLbsBOzRTVw1vvx756PgfmGkkRGrCT+1/7YzT9o6SbOC3eiybdUymDSM+qqhALtY73LfI5pY/jFLAqsJ8=
X-Received: by 2002:a81:468b:0:b0:318:4cac:6576 with SMTP id
 t133-20020a81468b000000b003184cac6576mr34256097ywa.277.1656969280331; Mon, 04
 Jul 2022 14:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-14-peterwu.pub@gmail.com>
In-Reply-To: <20220704053901.728-14-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Jul 2022 23:14:03 +0200
Message-ID: <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] video: backlight: mt6370: Add Mediatek MT6370
 support
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

On Mon, Jul 4, 2022 at 7:43 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> Add Mediatek MT6370 Backlight support.

...

> +         This driver can also be built as a module. If so the module

If so,

> +         will be called "mt6370-backlight.ko".

No ".ko" part.

...

> +#include <linux/gpio/driver.h>

Can you elaborate on this?

> +#include <linux/kernel.h>
> +#include <linux/log2.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>

> +#include <linux/of.h>

Can you elaborate on this?

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

Missed mod_devicetable.h.

...

> +               brightness_val[0] = (brightness - 1) & MT6370_BL_DIM2_MASK;
> +               brightness_val[1] = (brightness - 1)
> +                                   >> fls(MT6370_BL_DIM2_MASK);

Bad indentation. One line?

...

> +       if (priv->enable_gpio)

Dup check.

> +               gpiod_set_value(priv->enable_gpio, brightness ? 1 : 0);

...

> +       brightness = brightness_val[1] << fls(MT6370_BL_DIM2_MASK);
> +       brightness += (brightness_val[0] & MT6370_BL_DIM2_MASK);

Too many parentheses.

...

> +               /*
> +                * prop_val =  1      -->  1 steps --> 0x00
> +                * prop_val =  2 ~  4 -->  4 steps --> 0x01
> +                * prop_val =  5 ~ 16 --> 16 steps --> 0x10
> +                * prop_val = 17 ~ 64 --> 64 steps --> 0x11
> +                */
> +               prop_val = (ilog2(roundup_pow_of_two(prop_val)) + 1) >> 1;

Isn't something closer to get_order() or fls()?

...

> +       props->max_brightness = min_t(u32, brightness,
> +                                     MT6370_BL_MAX_BRIGHTNESS);

One line?

...

> +       val = 0;

Do you need this here?

> +       prop_val = 0;

Useless.

> +       ret = device_property_read_u8(dev, "mediatek,bled-channel-use",
> +                                     &prop_val);
> +       if (ret) {
> +               dev_err(dev, "mediatek,bled-channel-use DT property missing\n");
> +               return ret;
> +       }
> +
> +       if (!prop_val || prop_val > MT6370_BL_MAX_CH) {
> +               dev_err(dev,
> +                       "No channel specified or over than upper bound (%d)\n",
> +                       prop_val);
> +               return -EINVAL;
> +       }

...

> +static int mt6370_bl_probe(struct platform_device *pdev)
> +{
> +       struct mt6370_priv *priv;
> +       struct backlight_properties props = {
> +               .type = BACKLIGHT_RAW,
> +               .scale = BACKLIGHT_SCALE_LINEAR,
> +       };
> +       int ret;

  struct device *dev = &pdev->dev;

will save you a few LoCs.

-- 
With Best Regards,
Andy Shevchenko
