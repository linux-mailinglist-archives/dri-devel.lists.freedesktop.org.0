Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34F855876C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 20:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB9510E7BD;
	Thu, 23 Jun 2022 18:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A6410E7BD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 18:26:26 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id w20so366023lfa.11
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WFXpnCRvpVBhsuNFE1ahfBGJsqNDQt8dQxVvfN6MrL0=;
 b=DalKGI6li9osCh4k7iO37g3v5OUCWoMlA9lcg8wxp3/qi5HIMenhTTdp7lkfmkxaFO
 5i56DaW7feuRINiq2kOC05AY8brpkmge87NEOdDGkcHQCABHBrM/lR06xLa/uYNXD2JN
 HByhcVabc+qx2jAze76QRQrmHqJQ43fznNb6YOxVQdupQu3sbTr5FFXwdhK74fJl0jvb
 eciLddbEjTkpfnvpSmNtkeUy899xl8kuFlza0mCjMLlY6mqMYFafWfL0HXdzY9mmrBbl
 tiYMDiQrKJpSB3DVDSB21zZOwwu+OGmacE6r0lbpRpEmfZUo1aV2LD7kFZYuIORe47QB
 7iCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WFXpnCRvpVBhsuNFE1ahfBGJsqNDQt8dQxVvfN6MrL0=;
 b=UygecWZy85UvZhHJ72qTPtyw8ae8Wo3KqPS9sBgxCBbC2AgRYSc+8tyaG/fqsITA9F
 NDY8kDtDskfq91hRDGqgm1Rcb/Y41yndkcw4PTYgwdocEiU1EQjCZtp3U7JNU+tp5Kn5
 LOpqvnA6n60+ELWaKVsVU/DlXypDDBgsMSNUPC3h+hut+TNaq+xibVPisiMANqgAEvjS
 kujgq8IBy7bc85Vg2QMkkFca0ASJ/ZpsCMwEpJVQZd5Xqq+85oSQjzGN/S5tTeQ+cuiU
 xR/KsA+KWSyYTA3C3tnVkUbxwWwwZ9BBuHUMuMSUwXMt1n3fRMkFCZI8yAEwJ8kD73tQ
 VYRA==
X-Gm-Message-State: AJIora8Sc4tcvwuSkq8q/v/i47Rs/pCaLbLQXSoBAfbhL41DOhAeicxt
 Qx9bqThk6HsG9/iLeBGvtTJ9gq3tG7xJBDQI6ko=
X-Google-Smtp-Source: AGRyM1v7QBH+pV6lYrEVLjv5TY6/p8FX2jSroN/uPAnqjFf8QnXVnznfAY6JW5aADd3D+pMmLcYkM8NpE0OLf3DC0nc=
X-Received: by 2002:a05:6512:348f:b0:47f:8b25:e9f9 with SMTP id
 v15-20020a056512348f00b0047f8b25e9f9mr6543451lfr.512.1656008785046; Thu, 23
 Jun 2022 11:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-11-peterwu.pub@gmail.com>
In-Reply-To: <20220623115631.22209-11-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 23 Jun 2022 20:25:48 +0200
Message-ID: <CAHp75VexwvAVeY4MtwKfpNY96eJ1C9eqadd-L+20O2sg2+gYNg@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] iio: adc: mt6370: Add Mediatek MT6370 support
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
 alice_chen@richtek.com, linux-iio <linux-iio@vger.kernel.org>,
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
 chiaen_wu@richtek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 23, 2022 at 2:00 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> Add Mediatek MT6370 ADC support.

...

> +config MEDIATEK_MT6370_ADC
> +       tristate "Mediatek MT6370 ADC driver"
> +       depends on MFD_MT6370
> +       help
> +         Say yes here to enable Mediatek MT6370 ADC support.
> +
> +         This ADC driver provides 9 channels for system monitoring (charger
> +         current, voltage, and temperature).

What will be the module name?

...

> +#include <dt-bindings/iio/adc/mediatek,mt6370_adc.h>

Usually this goes after linux/* asm/* as it's not so generic.

> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/iio/iio.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>

> +#include <linux/mod_devicetable.h>

I believe the order should be otherwise, this is first followed by module.h.

> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

...

> +#define ADC_CONV_POLLING_TIME          1000

If it's time, add a unit suffix, if it's a counter, make it clear.

...

> +       msleep(ADC_CONV_TIME_US / 1000);

Why define microseconds if milliseconds are in use?

...

> +       ret = regmap_read_poll_timeout(priv->regmap,
> +                                      MT6370_REG_CHG_ADC, reg_val,
> +                                      !(reg_val & MT6370_ADC_START_MASK),
> +                                      ADC_CONV_POLLING_TIME,
> +                                      ADC_CONV_TIME_US * 3);
> +       if (ret) {
> +               if (ret == -ETIMEDOUT)
> +                       dev_err(priv->dev, "Failed to wait ADC conversion\n");

wait for

> +               else
> +                       dev_err(priv->dev,
> +                               "Failed to read ADC register (%d)\n", ret);

Do you really need to differentiate the errors here? I believe the
latter one covers all cases.

> +               goto adc_unlock;
> +       }

...

> +#define MT6370_ADC_CHAN(_idx, _type, _addr, _extra_info) {     \
> +       .type = _type,                                          \
> +       .channel = MT6370_CHAN_##_idx,                          \
> +       .address = _addr,                                       \
> +       .scan_index = MT6370_CHAN_##_idx,                       \
> +       .indexed = 1,                                           \
> +       .info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |          \
> +                             BIT(IIO_CHAN_INFO_SCALE) |        \
> +                             _extra_info                       \

Leave a comma after the last member as well.

> +}

...

> +       regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       if (!regmap) {

> +               dev_err(&pdev->dev, "Failed to get regmap\n");
> +               return -ENODEV;

return dev_err_probe(...);

> +       }

...

> +       ret = regmap_write(priv->regmap, MT6370_REG_CHG_ADC, 0);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to reset ADC\n");
> +               return ret;
> +       }

Ditto.

-- 
With Best Regards,
Andy Shevchenko
