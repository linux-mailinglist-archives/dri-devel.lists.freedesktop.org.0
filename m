Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F655580AF9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 08:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4CB10E10C;
	Tue, 26 Jul 2022 06:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D949810E382
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 06:11:33 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id f15so8042672edc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5iTBFaujydfzjNtZ+tuEW42yh94kmq7eTQthHnu+Umc=;
 b=DFreK31JfLkd3fAd0uB7CR6gjxpG6yBsGmnlSdQdVK9K9Iop3MmbjSc5l5Mqska/9F
 6zDsLVWtd4iSJbART2yOrMPnU6eocnuJbVN14OsRvUxL4fHsO7Wrgfc2UhIcTUjufoph
 2DxioqWBkat/Lt1MPd86qgmI4fJ9X5pOYvgIQ3L8XLGI4V6pl/+7xrFDCD36BkcmbO3v
 msDZGsDArMOOY56AIoIP2Boyoi0IybH+bd3McBS1U0EmQcx61Apt04nGaujtweQDBRAO
 5Sbq2NspvHrUHv6ggNUA5i+nF0w1W6dwyWvXZUzuukyS0Uo/f8jv4B+Fz7jfoW/fM0P7
 F9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5iTBFaujydfzjNtZ+tuEW42yh94kmq7eTQthHnu+Umc=;
 b=M5gZa6/FViMTaJZIvFyMhUaNePgfH2ugfqze7BberuwcI3kRUUMWgM8iz0+PpgyLIT
 MXa5eAjZl2/7sOUuWceinz1X6cPbclSjvAdyUgNM8X+ThVNP1pZDv6R2VaJEhLuE6l0a
 LoMCy28Qfb2nfvJp5MQD/4trAOHX2f3PaycMOxHDu8s0BAeUJEfFj2C0aUx4Zg9Ps7rf
 /j/yOn0kPAhsDgMXeBPqksVRR7LkYDwGQlo8vmw95GKTkje6nX5Pfgcr0g8fwtS7Du5q
 fB5Hct0ED6G9SobEEkSVfp5aiAfLwj17IjCbpY8YYe6m6FLPK8Ma1cA7W/asnC4tv/gt
 eEmQ==
X-Gm-Message-State: AJIora8UvzTAWaMqOlwNJgX7sYRpra+GLSkcTArCkZEm+diS3nijSEfD
 ruT3O8b0Fq91Yb3WEg00IlQhSqOKY+qpjdUBNis=
X-Google-Smtp-Source: AGRyM1sDJR+2SWBXIadraV+/yk5L7Vs9denzeP6s+Yyxwc5C8W1vNP4hRGI/bOS7pUxW1lVGaWNV5mppOqxOjOJF8tE=
X-Received: by 2002:a05:6402:d05:b0:435:b2a6:94eb with SMTP id
 eb5-20020a0564020d0500b00435b2a694ebmr16409469edb.87.1658815891980; Mon, 25
 Jul 2022 23:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-13-peterwu.pub@gmail.com>
 <CAHp75VfgiK87VwWu2bTJ_mR0=g0sa0LPJ+H16OGcUdARmzFRSA@mail.gmail.com>
 <CA+hk2fYpDRw+DRRU3m=EDOP6UEQNpJLyNBHe8Zi0qOfUObTb4Q@mail.gmail.com>
In-Reply-To: <CA+hk2fYpDRw+DRRU3m=EDOP6UEQNpJLyNBHe8Zi0qOfUObTb4Q@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Jul 2022 08:10:55 +0200
Message-ID: <CAHp75VdxWfo0QW=SXc0v+Ue92VO1TbpTqAqHT6mAK=GA606oFg@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: szuni chen <szunichen@gmail.com>
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
 Alice Chen <alice_chen@richtek.com>, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, cy_huang <cy_huang@richtek.com>,
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
 ChiaEn Wu <chiaen_wu@richtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 26, 2022 at 6:15 AM szuni chen <szunichen@gmail.com> wrote:

...

> > > +#define MT6370_ITORCH_MIN_UA           25000
> > > +#define MT6370_ITORCH_STEP_UA          12500
> > > +#define MT6370_ITORCH_MAX_UA           400000
> > > +#define MT6370_ITORCH_DOUBLE_MAX_UA    800000
> > > +#define MT6370_ISTRB_MIN_UA            50000
> > > +#define MT6370_ISTRB_STEP_UA           12500
> > > +#define MT6370_ISTRB_MAX_UA            1500000
> > > +#define MT6370_ISTRB_DOUBLE_MAX_UA     3000000
> >
> > Perhaps _uA would be better and consistent across your series
> > regarding current units.
>
> Yes, _uA will be more consistent, but in general, using upper case in
> the define macro is a convention, doesn't it?

There is general convention, but there are also:
1) common sense;
2) usage in practice (e.g. _US, etc for *seconds and _HZ for *frequency).

My common sense tells me that it is convenient to use mA,uA, etc.
Plus "in practice" it's related to use as in your series and elsewhere.

But of course it's minor to me, decide yourself.

...

> > > +       /*
> > > +        * For the flash to turn on/off, need to wait for HW ramping up/down time
> >
> > we need
> >
> > > +        * 5ms/500us to prevent the unexpected problem.
> > > +        */
> > > +       if (!prev && curr)
> > > +               usleep_range(5000, 6000);
> > > +       else if (prev && !curr)
> > > +               udelay(500);
> >
> > This still remains unanswered, why in the first place we allow
> > switching, and a busy loop in the other place?
>
> If I refine the description to
> "For the flash to turn on/off, need to wait for 5ms/500us analog settling time.
> If any flash led is already used, then the analog is settled done, we
> don't need to wait again."
> is it answer the question?

No. I'm talking from the Linux APIs perspective. There is a huge
difference between those branches. Please, conduct research, read
documentation to understand what my question is about.

-- 
With Best Regards,
Andy Shevchenko
