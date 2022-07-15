Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D634A576EB3
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B589B10F07F;
	Sat, 16 Jul 2022 14:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39A410E06A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 15:10:14 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id y195so8976176yby.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 08:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RIDFbj9Nm/Hc84YphLe1TSejCss5csMsL3XGmdeREuc=;
 b=LjTUeU/VvjExiFE7qVdoTT66INknzaksBvLAL0QX/hhMGm1S/DCmWjGAqEm1RDjTt0
 nrI4wHZo/WK5aG8U5fIPVbESm+g18hEELTujXpx69+Azj8qnUnYXhFafWvDdYrxJWF8Q
 n4alCS65LacwduwaUDBvHdbTO5eZ4k4tWaJ199RDLEdi+Nnbu8tJ4UTjcA2YPJBeHBKH
 hWc3HEBwkV0/ygom4+Ivyr3ViE5siRsP8CdzKAgWRXLBXaArht7DgMtJUJb/WrGYsYt8
 eWv+sETgNCGjxIJCtjEQJk1vVPGobtuRYELM3bihPsOKaqDcf5qzy1Ry+AVMll6TrQxi
 eYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RIDFbj9Nm/Hc84YphLe1TSejCss5csMsL3XGmdeREuc=;
 b=xzr78fAC3UzMj1PAfjDYqHy2JOUjlLcUjLNYh80RlSdLfhJpDpk2WgO4EwdNI6DetE
 lsCR8vsyxkCY+JSm82QV/Lp4opiZ9drlzmmvEIBVOwfP/00BoUWfeqeBSAmmJ1+HtWW7
 mdkOFyPsiPFU3nNHBP6whzI/hmjkUevsXfrMYFma7DE5nuRjwNDrlT8DZF55atcWc3ux
 1WuyS+s2SJi8JiuUqjofvTTu/DgukQLK48CXRMeFiI9JkjjR6zOIvnpl+U/2VavlMpM5
 /4te8DaMvjzXwzVr+zpyS0kNHZaeHkSo66BDElBFzvlr/lIolfaYlqflJLURKckked/+
 T7tg==
X-Gm-Message-State: AJIora/tSi37YptNULQpdqWswxkGg/U16FX8S+TyZHJD2w9KDS6sIQrn
 jgV2zbSbTsDHvWp86EwjpTqKg1cKulz9H85F0x4HHpC4btA=
X-Google-Smtp-Source: AGRyM1tX0Yj4hhKwKn8Wh56LVxsUs+zEZtzzOqfyiqtoMPojzsjlQH4dKqby9pg3kc6AYzvHnWHIojiIQybijv0fZ+I=
X-Received: by 2002:a25:cbcf:0:b0:66e:8893:a02c with SMTP id
 b198-20020a25cbcf000000b0066e8893a02cmr14089485ybg.460.1657891133149; Fri, 15
 Jul 2022 06:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-10-peterwu.pub@gmail.com>
In-Reply-To: <20220715112607.591-10-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 Jul 2022 15:18:16 +0200
Message-ID: <CAHp75VfiBcaSbZy67Puwb2pBW2MHN8iQj3upA=h3VkKSFJbs0g@mail.gmail.com>
Subject: Re: [PATCH v5 09/13] iio: adc: mt6370: Add MediaTek MT6370 support
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

On Fri, Jul 15, 2022 at 1:28 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
>
> This adds support the MT6370 ADC driver for system monitoring, including

This adds --> Add a

> charger current, voltage, and temperature.

...

> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/iio/iio.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/sysfs.h>

...

> +#define MT6370_AICR_400MA              0x6
> +#define MT6370_ICHG_500MA              0x4
> +#define MT6370_ICHG_900MA              0x8

_mA ?

...

> +       ret = regmap_read_poll_timeout(priv->regmap,
> +                                      MT6370_REG_CHG_ADC, reg_val,
> +                                      !(reg_val & MT6370_ADC_START_MASK),
> +                                      ADC_CONV_POLLING_TIME_US,
> +                                      ADC_CONV_TIME_MS * 1000 * 3);

1000 --> MILLI ?

...

> +static int mt6370_adc_probe(struct platform_device *pdev)
> +{

Given comment in one place in the entire series would be good to use
in another where appropriate. For example, here it would also be nice
to have a temporary variable

  struct device *dev = &pdev->dev;

It will shorten some lines.

> +       struct mt6370_adc_data *priv;
> +       struct iio_dev *indio_dev;
> +       struct regmap *regmap;
> +       int ret;

> +}

-- 
With Best Regards,
Andy Shevchenko
