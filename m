Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A48853A14A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4265410ED41;
	Wed,  1 Jun 2022 09:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0628910ED99
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:52:07 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id rs12so2561352ejb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y1mJGH5c1Uozsg7k4TIS92U6v6LjyV9oFoYVM0NRha8=;
 b=pDzLCrKYfqkJbuKWjOE7YKh1BjW8iuiBm1bkNBWCdyl6ZXoEh4vEn7DK+SXSpbB90U
 0mMySw+1KW+jWuSlprGFz1/ZihwNlBGfQoJ952/S65Zmwv3yE5hNf/jPQiWvymLTm2fF
 5PkFkXZAasgyv3D7SLAriP98k8PabcZr76rGv9IlXeRbm0xbiyv3vYnBL++vOmRc3YHf
 XDY8aMNfCeHWTJKIS7vTg70L9GewCHcK41H93Qqlgs6oPaArJ8adNouaJAAsPAr7X8F4
 inDdCJvjhmWW8uwlHRhS2KKJQUa9JGtgmNjDKfkuu2t5FghP5ZU/AhZiljZlz8vr07eB
 Bzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y1mJGH5c1Uozsg7k4TIS92U6v6LjyV9oFoYVM0NRha8=;
 b=H1pw9M1eFd2mtCh4xbUAWsqDsm3bzpAfVElnggcZPHJOmqpYGRLc2+qkL4mQi0wtgP
 Ww/VDA8PR+/6PMMNTlCYt1AoGxTVZog/vAZKC6yOJ+4QChJLdldsVhIQyNWXtxPHnQxM
 kWLOZE36Yovw7voVpZb36dOmz9jNEijQWbeVibpoB+wUK9UrHvBC2ZoIAShjMPmf7O38
 pEWnrgBxMuxQ7yVqXGzaQSIHZU0bGelCn4xrduOKg7pQtOh/cwExHP4TuzPTNKFHjZs+
 zSnZF3iWNGqt2DVhFfFKpfNJyV9y0J2jBoBy4Zg/zheQgPB/HDZ3JhCaezJ3vX29+EUv
 Lq6g==
X-Gm-Message-State: AOAM532kdiskV9mqzym94ikdxCxPrEpBllSrVrLpcnjQWp1aMqHJQPEV
 4j6rnQPHVJ4bS3/9MR3CLHrogv+oz1zq4a18EGM=
X-Google-Smtp-Source: ABdhPJyqf9ZHomloEdcRczicdqSM2R1J6YhdToJV6ojkEOXFybYoQ0iogidyjBJ4Et6n0VcyKxc+QBr3vsPZaac7yDU=
X-Received: by 2002:a17:906:2416:b0:6fe:a0be:91d5 with SMTP id
 z22-20020a170906241600b006fea0be91d5mr54057142eja.132.1654077125409; Wed, 01
 Jun 2022 02:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
 <20220531102809.11976-7-peterwu.pub@gmail.com>
 <CAHp75Vd8taco19vsDmBcCv8euV1SvwSiY5=P9oMkA6zWsjwXxg@mail.gmail.com>
In-Reply-To: <CAHp75Vd8taco19vsDmBcCv8euV1SvwSiY5=P9oMkA6zWsjwXxg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Jun 2022 11:51:30 +0200
Message-ID: <CAHp75Vf245Oo3wmx5rh_EkXZ4FL_nnehpfuaDAiEdG6BenXxhw@mail.gmail.com>
Subject: Re: [PATCH 06/14] leds: mt6370: Add Mediatek MT6370 Indicator support
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

On Wed, Jun 1, 2022 at 11:48 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, May 31, 2022 at 1:16 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >
> > From: Alice Chen <alice_chen@richtek.com>
>
> All below comments are applicable to the rest of the series as well
> (one way or another), so please fix all your patches where it's
> appropriate.

Forgot to mention, please consider using

  return dev_err_probe();

pattern in the ->probe() and related funcitons. It will save a lot of LOCs.

> > Add Mediatek MT6370 Indicator support
>
> What indicator?
> Please also keep attention on English punctuation (missed period).
>
> ...
>
> > +       help
> > +         Support 4 channels and reg/pwm/breath mode.
> > +         Isink4 can also use as a CHG_VIN power good Indicator.
>
> be used
>
> > +         Say Y here to enable support for
> > +         MT6370_RGB_LED device.
>
> ...
>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
>
> > +#include <linux/of.h>
>
> Are you sure this is the correct header? Seems you need
> mod_devicetable.h instead.
>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
>
> ...
>
> > +struct mt6370_priv {
> > +       struct mutex lock;
>
> Do you use regmap locking?
>
> > +       struct device *dev;
>
> > +       struct regmap *regmap;
>
> > +       struct regmap_field *fields[F_MAX_FIELDS];
> > +       const struct reg_field *reg_fields;
> > +       const struct linear_range *ranges;
> > +       struct reg_cfg *reg_cfgs;
> > +       unsigned int leds_count;
> > +       unsigned int leds_active;
> > +       bool is_mt6372;
> > +       struct mt6370_led leds[];
> > +};
>
> ...
>
> > +static const unsigned int common_tfreqs[] = {
> > +       10000, 5000, 2000, 1000, 500, 200, 5, 1
>
> Leave a comma at the end.
>
> > +};
> > +
> > +static const unsigned int mt6372_tfreqs[] = {
> > +       8000, 4000, 2000, 1000, 500, 250, 8, 4
>
> Ditto.
>
> > +};
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
