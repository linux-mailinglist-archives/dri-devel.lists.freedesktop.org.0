Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E692559407
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 09:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1573111293F;
	Fri, 24 Jun 2022 07:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD0411293E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 07:20:36 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id s17so1843387iob.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 00:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T3cWuiVsBA+DxTai60AWhDn/fRpeEo8zydPZYQwQBPs=;
 b=INkRDWkgz7QnDYd6PfjGcOd+HtbGBuFAFVtHSry5oK+uSexxmKolSWc9+ahE6Bsyiy
 zARECUtXVj9Yxu3ivS1I4Ikbz9sEucWs/6ZUfMDlGUc1ip2twYgPIYULdbUypI86mIzl
 mgKyYU2J5DhoBlb4HK7R3TEsu+SHK4XuGA+Sy+iylrc+8UWz0NCSlrofWvh89/4vykAo
 bPzchCxSebnIj7stqgMYl19bvM4RMlQ20oNFDZeXuyIbbF87V3BWpZnr0GOf16WkU7KM
 cHqCSrIR2+2R/9pWLaP9povhX5tYXh1/3O3+jKfQ8vWGEl2U54uG0vtizyP5hjPfZERr
 EwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T3cWuiVsBA+DxTai60AWhDn/fRpeEo8zydPZYQwQBPs=;
 b=X/jkN5L15eOZbJAQY/8MkBfRrfSKtSVTqAOOMemVkRUAzLoaJXEo8cUQpWme8QSUVD
 JxwHlrebHsQ0t3u2+sU8MRYO1jEqP69cHeUPHphO3KOETnqkXaqb6AAPEo9dJsUv/yMt
 toc7axHRA3JraXUuzbDyeNjWMurzZ2/LTfbYnz0zsoemdNFejVa8xIGFi7r0fUN2HzmK
 RuJ16tik8wfblIJmd2AzKAUI99jCjhRR+yxz8kcDzN09yZ3hyQAxJ7nZdCIpbOloYiHT
 GbebonYKnj+abh7tnOxs7le0vLJPN5QzcsO9rlMoCd8QhejkZoSG/K4MT0OafWzvaFGf
 koTA==
X-Gm-Message-State: AJIora9sZhnY7joyYT3ycj3T/KWo446kX8s9rxbhi/I7oPI8ku+mKjzb
 EJSobitaX6Yo1RpW2TaNOwyOw8fBygrfHeB2XrU=
X-Google-Smtp-Source: AGRyM1v7K77xAmtUTEcEzoILdxRbEp2wv1joH1sI9ISqx+ur3eoSMLzrP7D8toJkzHB0bsYtmy7vVz+n8Z+nifA3RX0=
X-Received: by 2002:a05:6638:430e:b0:332:586:5182 with SMTP id
 bt14-20020a056638430e00b0033205865182mr7357424jab.225.1656055236048; Fri, 24
 Jun 2022 00:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-13-peterwu.pub@gmail.com>
 <CACRpkdZatfOFmeGXepTrjAk1or4W6KNUEaXnP+srRebfM=52AA@mail.gmail.com>
 <CACRpkdbzZqerE_2PeGMUWRbtjK=9P8V763cj83ZqjP4n6AVHAg@mail.gmail.com>
In-Reply-To: <CACRpkdbzZqerE_2PeGMUWRbtjK=9P8V763cj83ZqjP4n6AVHAg@mail.gmail.com>
From: szuni chen <szunichen@gmail.com>
Date: Fri, 24 Jun 2022 15:20:24 +0800
Message-ID: <CA+hk2fZEG0TxMGhGJY21w=MmXgKsH5mYCYynQV1jbhpOCyf3qg@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] leds: mt6370: Add Mediatek MT6370 current sink
 type LED Indicator support
To: Linus Walleij <linus.walleij@linaro.org>
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
 Heikki" <heikki.krogerus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 alice_chen@richtek.com, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree <devicetree@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 chiaen_wu@richtek.com, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ChiaEn Wu <peterwu.pub@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

Thank you for the comment.

Linus Walleij <linus.walleij@linaro.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=882=
4=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=882:25=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> On Fri, Jun 24, 2022 at 8:23 AM Linus Walleij <linus.walleij@linaro.org> =
wrote:
> > Thanks for your patch!
> >
> > On Thu, Jun 23, 2022 at 1:58 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote=
:
> >
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> > >
> > > Add Mediatek MT6370 current sink type LED Indicator driver.
> > >
> > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > (...)
> > >  drivers/leds/Kconfig       |  11 +
> > >  drivers/leds/Makefile      |   1 +
> > >  drivers/leds/leds-mt6370.c | 989 +++++++++++++++++++++++++++++++++++=
++++++++++
> >
> > There is a drivers/leds/flash subdirectory these days, put the driver
> > in that directory instead.
>
> Sorry I'm commenting on the wrong patch.
>
> I meant this one. Move that into drivers/leds/flash
>  drivers/leds/flash/leds-mt6370-flash.c             |  657 ++++++++++++

In next version, I'll use "leds: flash: ......" instead of "leds:
flashlight: ......" in subject.
May I confirm that the driver has already in the drivers/leds/flash,
so I don=E2=80=99t have to move it in next version?


Sincerely,
Alice Chen
