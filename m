Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F2C573604
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 14:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B5512ABB8;
	Wed, 13 Jul 2022 12:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8E912A757
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 12:07:53 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id l11so18832595ybu.13
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 05:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=H60c6BQz+0PUGxMp0vbXoiihGTO7ZBPYPm+08N4mLfI=;
 b=cFwaO0bDU4Rlt7N9UDqzRHYc/L/LXwPsecY5KlQfSKmfeHbUGfJju92GNvM+QXRy/A
 MfFCd9EiEFbUqGG0Dk3UDyeTjK2mKB+J26YUCLsjwjV1AqSW8ALXoZ+QUWDjp8FbHEeY
 dwnLTjlohJXN4MlqdlflbgJKO0LHlSOv3alwCbci2ARAUzjG69r4BZ9OGDCDuqQtQA7F
 3fzpmlRGWBNYqAxA0gsKxiBlo4ApaOY7UboYG9JKS2cowDCyOJujzJrS984DN9KyXzOA
 PlokWUEqgVaq6a1qwFa+85+pBBg3DMQ+qHXOl22B3dO6jAPN+bwQ7BsHm3cmgJ/HPnXL
 vfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H60c6BQz+0PUGxMp0vbXoiihGTO7ZBPYPm+08N4mLfI=;
 b=ftlOSlrX86od0oT7l9i0gsSY8HSIafPwFuEO25Yny6ApDdUkykHXYWHxYQbq6wCuU/
 /3sIQiF6bbemhPO70D+T5i+SzuVCnl3KGpDOzOBn26FpN+ZQmRLVzlqWAhpXpb4dS9TN
 Q2BcgnFiLe9t75ymlwZdxp+DFE3PeM5ac3MA8/S+/rXPT0PeWAwa1fMM1GSwqOFkcDeJ
 Z1H8q5x6nQD7F9e9sLxMr9G+MbltKYIadxeYwppQsGmkTCkBvfpvfyEFR+uStMauYHl4
 AA1JRs2EyhkCKlfzVTcvnCrS7dc1CWoDrNvpznjIiqHHTZwPq1imjkMtqEDtms/vDQ3+
 Izaw==
X-Gm-Message-State: AJIora+tA6ZgaiTTHzbtaNQRI/nLPKbdElUmlX9k2c33d1ETZa5xPv9j
 XCWkJ/i8yNdilnWvhRnet6RijphHrvyd26ppUApREmo1j96xkQ==
X-Google-Smtp-Source: AGRyM1sbQCBjmYhKYL+xb2AwlOmpuB0R1EP+WnPrRn0L3M4TSuIwm0awKcRUCK7kwFw6PIL77qpLuzj23J+O5rqZCJA=
X-Received: by 2002:a25:858e:0:b0:66e:4898:63e2 with SMTP id
 x14-20020a25858e000000b0066e489863e2mr3559399ybk.296.1657714072552; Wed, 13
 Jul 2022 05:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
 <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
In-Reply-To: <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 Jul 2022 14:07:15 +0200
Message-ID: <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] video: backlight: mt6370: Add Mediatek MT6370
 support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 13, 2022 at 12:53 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=
=9C=885=E6=97=A5 =E9=80=B1=E4=BA=8C =E6=B8=85=E6=99=A85:14=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > On Mon, Jul 4, 2022 at 7:43 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

Please, remove unneeded context when replying!

...

> > > +               brightness_val[0] =3D (brightness - 1) & MT6370_BL_DI=
M2_MASK;
> > > +               brightness_val[1] =3D (brightness - 1)
> > > +                                   >> fls(MT6370_BL_DIM2_MASK);
> >
> > Bad indentation. One line?
>
> Well... if indent to one line, it will be over 80 characters(or called co=
lumns?)
> From my understanding, it is not allowed, right??

It's allowed to some extent.Use your common sense.
Here it's obviously broken indentation.

...

> > > +               prop_val =3D (ilog2(roundup_pow_of_two(prop_val)) + 1=
) >> 1;
> >
> > Isn't something closer to get_order() or fls()?
>
> I will revise it to "(get_order(prop_va * PAGE_SIZE) + 1) / 2" and
> this change is meet your expectations??

Nope. Try again. What about fls()?

...

> > > +       props->max_brightness =3D min_t(u32, brightness,
> > > +                                     MT6370_BL_MAX_BRIGHTNESS);
> >
> > One line?
>
>  Ditto, it will be over 80 characters...

As per above.

--=20
With Best Regards,
Andy Shevchenko
