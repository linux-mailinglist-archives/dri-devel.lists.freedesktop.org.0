Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E5253B5D8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 11:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B06610E734;
	Thu,  2 Jun 2022 09:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B6E10E734
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 09:18:18 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id f9so8847041ejc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0d9LPcPl2z82dxOAeBz8oaTNCeFfF1mrJ8xfIO9HyHE=;
 b=lfLh9e2Zec+kRfUbieDqxaSJGfE2gK5tVDQL4/AlpgVcAAIBNipxqiaQ9KaF31NRoL
 p4XLfqqfzJDaVnItedh+uY7WOZo9GWfO9EDs7Kwtb9g1ep7F/2s8jmC8C+5HKoB8mmqm
 5+MnNkvj0n3QFu1KLRgu4qmE4FZpPqT/FxCabwWRio16T/tBO5n8YQs39umvhQZU1izc
 kmND1i4pFf63FZslDTQd5TX2paKc+iavMXEEIfxzCgFARk5C9xBN1i2j5XO5tazLpbL3
 wIlyYfmxX1H8YiEs73O3/gKRJfzGSjM99weIY/3wRiXAWXYqSVXb5yR9RaF0dJyLJck3
 HKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0d9LPcPl2z82dxOAeBz8oaTNCeFfF1mrJ8xfIO9HyHE=;
 b=DIeA82b5wCZ1PnD4eVt6TV4RtHUYaQMVL12LmxZcS9nyBRATguPZFMBMahfeQOapkU
 v7XW4fbYctRhNHzOyXlwUOqXIuxYxuUHc4gmyFZa4c8fAF1ugGz4uF5H1Onir37U6wQp
 ZT1sUWo55AXKrkzVDdtAvAMNq1RpUTbv6dQLBy0NpI9J4Q3evSzxz6tIPC8jOnqw7umH
 9wUXUqy2R7CrKVbilWXEyZfsJlrUx3aXXUyArcKDHoJZgL828C54ziDzQ7X5biSIDeLD
 +wqgwLUfeyLTYlJGb9S0sEW0cUMqqgehv6w0ixUuMO70zT9QrAiIwV4oJ/JUZ9oTvGep
 BAaw==
X-Gm-Message-State: AOAM533efyV5nEEWI978Btgb7JcQ3wIYl/rk82ryh9sFwYdRYSJCJuwX
 xRVVzXR1g6LMSuDEPO5t/1bGKY/AcjDZ5k5jFuKj0sG8bN3ixCjd
X-Google-Smtp-Source: ABdhPJxRg1MZXl/SkbIUuNBrRuGNQldHFdLPZxE+GhC/BiCEKh8oflGlAj5dFnKQFyQ9Ns7hxKjhAhvcKy/fq3rTsjo=
X-Received: by 2002:a17:907:6e04:b0:6f4:d6f3:c72a with SMTP id
 sd4-20020a1709076e0400b006f4d6f3c72amr3415411ejc.636.1654161497069; Thu, 02
 Jun 2022 02:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
 <20220531102809.11976-7-peterwu.pub@gmail.com>
 <CAHp75Vd8taco19vsDmBcCv8euV1SvwSiY5=P9oMkA6zWsjwXxg@mail.gmail.com>
 <20220602062643.GA13824@cyhuang-hp-elitebook-840-g3.rt>
In-Reply-To: <20220602062643.GA13824@cyhuang-hp-elitebook-840-g3.rt>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 2 Jun 2022 11:17:40 +0200
Message-ID: <CAHp75Vd-n=oLnhRCK=pR5ybOZbC6BKXrE2jRdwDbH90E4KYFGA@mail.gmail.com>
Subject: Re: [PATCH 06/14] leds: mt6370: Add Mediatek MT6370 Indicator support
To: ChiYuan Huang <u0084500@gmail.com>
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
 Heikki" <heikki.krogerus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 alice_chen@richtek.com, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang@richtek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ChiaEn Wu <peterwu.pub@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 chiaen_wu@richtek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 2, 2022 at 8:27 AM ChiYuan Huang <u0084500@gmail.com> wrote:
> On Wed, Jun 01, 2022 at 11:48:58AM +0200, Andy Shevchenko wrote:
> > On Tue, May 31, 2022 at 1:16 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

...

> > What indicator?
> It's RGB curent sink type LED driver (maximum supported current is only 24mA).

Make your commit messages a slightly more verbose.

...

> > > +#include <linux/of.h>
> >
> > Are you sure this is the correct header? Seems you need
> > mod_devicetable.h instead.
> >
> It's the correct header and be used for the struct 'of_device_id'.

Nope. Run the following command
$ git grep -n 'struct of_device_id {' -- include/linux/

...

> > > +struct mt6370_priv {
> > > +       struct mutex lock;
> >
> > Do you use regmap locking?
> >
> MFD regmap register already the access lock.
>
> This lock is just to guarantee only one user can access the RGB register
> part.
>
> Sorry, from the comment, do you want us to rename or remove this lock?

My point is, since you have two locks, explain why you need each of them.

> > > +       struct device *dev;
> >
> > > +       struct regmap *regmap;
> >
> > > +       struct regmap_field *fields[F_MAX_FIELDS];
> > > +       const struct reg_field *reg_fields;
> > > +       const struct linear_range *ranges;
> > > +       struct reg_cfg *reg_cfgs;
> > > +       unsigned int leds_count;
> > > +       unsigned int leds_active;
> > > +       bool is_mt6372;
> > > +       struct mt6370_led leds[];
> > > +};


-- 
With Best Regards,
Andy Shevchenko
