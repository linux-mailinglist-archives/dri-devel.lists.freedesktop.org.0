Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 579D953A160
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E8110EEBF;
	Wed,  1 Jun 2022 09:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD8310EEA5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:57:52 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id z7so1404643edm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8PCo0X+pMIpsY2Uf1dnrZhLPPiwDltwA+NDnzoDspis=;
 b=XhPAQhUfhBI91dCm0a95O3zad9USLtdiUcVt34raOi5ptwRCbqGza/NaTDd4EyaLX1
 v+lU4+0Cpv23sZE0fOO2N2HTBcIFXG/TrXkhJtsD7CDwNqGJypEeR7+wpAAfxQ1X488D
 dE+CRh6Hkq089m6paqTZCvDHckNRC4IMxltEdMIcZKV16VY0YAbxtda5vGAtZ+29jWIB
 wsP4WOukuw86fxqUt+VuAO/be5ZLtm8pPCExUs4n6YACXBrBBZ59DeQ84G1qh+H99nN5
 aOtK25kj0UzNDeF/Trja2mohLceUsbRjs3gvT+99D2KTbrfsm8sfvH805b8ESjdWyxOW
 REyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8PCo0X+pMIpsY2Uf1dnrZhLPPiwDltwA+NDnzoDspis=;
 b=jaMNsHbbVMm3wqJiuld55bUXiGnx84R+1rsuBJfCCQlgBTzTHZjBSv5K6n0ajxKDym
 PGUJWDBeYtE/5gcYYiaY7XWyCub6lb220txRegmleXnuZ+8XxRw2iNGkjZ4ygmWNkUIH
 ZSCYQB0CqY/bCAnhEfLAek9M9d0VYbr2iq44OQ7yvyh6ZkYqNGMfXsrVNAoM4FRlltzj
 8cOjsREACO/k1sa/hGsa5jl7Ui254rWXpcz6gmwvPecORtgsjVM8NUKVr12MtT9DaooD
 pcJJC8vwina4nhI2yT3VzuPypddU7GL+YiUPMMq7I3ZCZhcHl5Wtkij2JVE1iFyczfre
 fSVg==
X-Gm-Message-State: AOAM530N3ivgCo2zz85gycgnBzfIXYNkFhSRfEEhAuRX7S1Dh1NpPIjN
 F42hs/PvF8RHqRhYxMRsTjj3wby3vf+s11NMBMc=
X-Google-Smtp-Source: ABdhPJx5UwB9OK6uoDWwzcHechvusyUFa0L+DRuEojeZ5rXjdN4Kqx2DmQl8OM9CHARC3CjwaOQOEOHl8iMseiJla1c=
X-Received: by 2002:a05:6402:249e:b0:42d:bb88:865b with SMTP id
 q30-20020a056402249e00b0042dbb88865bmr21507509eda.141.1654077471168; Wed, 01
 Jun 2022 02:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
 <20220531102809.11976-8-peterwu.pub@gmail.com>
In-Reply-To: <20220531102809.11976-8-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Jun 2022 11:57:15 +0200
Message-ID: <CAHp75VdUQqihr=AX-wEUD05jY1ReL63hMCL+eaqmjkN8CsS_Vg@mail.gmail.com>
Subject: Re: [PATCH 07/14] leds: flashlight: mt6370: Add Mediatek MT6370
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
 alice_chen@richtek.com, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang@richtek.com,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
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

On Tue, May 31, 2022 at 1:32 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: Alice Chen <alice_chen@richtek.com>
>
> Add Mediatek MT6370 flashlight support

Same comments about the commit message.

...

> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>

+ blank line?

> +#include <media/v4l2-flash-led-class.h>

+ blank line

> +enum {
> +       MT6370_LED_FLASH1,
> +       MT6370_LED_FLASH2,
> +       MT6370_MAX_LEDS
> +};

...

> +       struct mt6370_led *led = container_of(fl_cdev, struct mt6370_led,
> +                                             flash);

> +       struct mt6370_led *led = container_of(fl_cdev, struct mt6370_led,
> +                                             flash);

Make a helper out of this

  #define to_mt637_led()  container_of()

and reuse.

...

> +       /*
> +        * For the flash turn on/off, HW rampping up/down time is 5ms/500us,

ramping

> +        * respectively

Period!

> +        */

...

> +       const char * const states[] = { "off", "keep", "on" };
> +       const char *str;
> +       int ret;
> +
> +       if (!fwnode_property_read_string(init_data->fwnode,
> +                                        "default-state", &str)) {
> +               ret = match_string(states, ARRAY_SIZE(states), str);
> +               if (ret < 0)
> +                       ret = STATE_OFF;
> +
> +               led->default_state = ret;
> +       }

fwnode_property_match_string()?

...

> +       if (!count || count > MT6370_MAX_LEDS) {
> +               dev_err(&pdev->dev,
> +               "No child node or node count over max led number %lu\n", count);
> +               return -EINVAL;

return dev_err_probe(...);

> +       }


--
With Best Regards,
Andy Shevchenko
