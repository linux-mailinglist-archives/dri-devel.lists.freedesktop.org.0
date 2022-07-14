Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1AE574598
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 09:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FD197775;
	Thu, 14 Jul 2022 07:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367EA933D4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 07:13:32 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id mi10so858316qvb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 00:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q5UuNt5TPK0IuG39xN+NMro5LKgIqNbr9Zx7mA/mPiM=;
 b=b0E3JTU5pYWhoLa3ap7YFqzgEMsmY9DzPinFwRbVIUxY93YXyUx7ZCDKj7KmfhQ21C
 rbLfBjhA9+2Iw8+wRoHdzOZmhqnsY+50XpmOdqNkHbt1cSMSHEnAu5vgSo2cTU4Vp00E
 OzftT9WeV+jRXDaaNmeyjhArEApdAVnDvnAaK0sb17BX1/wJ+erATO6cVT2LmSg5zo1C
 AkB0gsToiInDLayKBxHHJLxYpaxBz2afFFQmHItaY08Jtmauimz5lnfp+bStbZf1nc6w
 aPm7pRJ9mU/zUvlfPRnxcyejhyXF2kYZj0eimP7+p17pN8EvNWU5/v59Wtwmk5hE8TwL
 aWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q5UuNt5TPK0IuG39xN+NMro5LKgIqNbr9Zx7mA/mPiM=;
 b=qNqRNckgA2OQNXFG0/JXVHCC9VuLEiyIRno2ZOBvsYxLCvSktC18nQgE++FzF7FzV0
 OmKvmIjsvUXY0KFk4eBvNKvfVdhXetm7sEm83eOZ7FEU9nDVTc4LjjadizTkbB9RENU1
 zSD74TuH3s0UxKdJOp9HpVn1QNf+YF22RgYR+rsy7rOfIqFi9NVkZbQlo5qoLoWM4/Ko
 C2Xdagp6mlHTo664a2V0bz8YP2ytfRAYmC4SpWwhLqO7DmZ+FAt5yeqiSC6azLsHscys
 OKGDn6UBR878o7MfnCk0d02+90xn+XhCC/o/BV38PPPx6OWUGh76D2pzsavkJr8R2POA
 XsMA==
X-Gm-Message-State: AJIora+ZGOhanKcQn+1CA04LX7l1SoYQ4kd0N7+8+NtRSdUV/VAzHgDN
 l0smXORIBV85JfnFKB8ifqXJNc33nlnfpO3sLlE=
X-Google-Smtp-Source: AGRyM1vJRbWeeJQDQ5VsDhXvc8TWmApQquCsp5U/iybMpcD3LNzACs5RVUGTHl5IJiCF7b4f25ZlvyBfRyQDbXD00iQ=
X-Received: by 2002:a0c:9a0c:0:b0:470:54d7:cfd5 with SMTP id
 p12-20020a0c9a0c000000b0047054d7cfd5mr6903769qvd.46.1657782811193; Thu, 14
 Jul 2022 00:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
 <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
 <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
In-Reply-To: <CAHp75VevDwdAKLYEWJgnMDvzuPuFibLuVqH-GKazEOT76wM6_A@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Thu, 14 Jul 2022 15:13:19 +0800
Message-ID: <CABtFH5LT1Ct_9-B_XRrGwYFmL5kGS6KHR7dNVyUO5z4sTy_6oA@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] video: backlight: mt6370: Add Mediatek MT6370
 support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=9C=
=8813=E6=97=A5 =E9=80=B1=E4=B8=89 =E6=99=9A=E4=B8=8A8:07=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Wed, Jul 13, 2022 at 12:53 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> > Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=
=9C=885=E6=97=A5 =E9=80=B1=E4=BA=8C =E6=B8=85=E6=99=A85:14=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > > On Mon, Jul 4, 2022 at 7:43 AM ChiaEn Wu <peterwu.pub@gmail.com> wrot=
e:
>
> Please, remove unneeded context when replying!
>
> ...
>
> > > > +               brightness_val[0] =3D (brightness - 1) & MT6370_BL_=
DIM2_MASK;
> > > > +               brightness_val[1] =3D (brightness - 1)
> > > > +                                   >> fls(MT6370_BL_DIM2_MASK);
> > >
> > > Bad indentation. One line?
> >
> > Well... if indent to one line, it will be over 80 characters(or called =
columns?)
> > From my understanding, it is not allowed, right??
>
> It's allowed to some extent.Use your common sense.
> Here it's obviously broken indentation.
>
> ...
>
> > > > +               prop_val =3D (ilog2(roundup_pow_of_two(prop_val)) +=
 1) >> 1;
> > >
> > > Isn't something closer to get_order() or fls()?
> >
> > I will revise it to "(get_order(prop_va * PAGE_SIZE) + 1) / 2" and
> > this change is meet your expectations??
>
> Nope. Try again. What about fls()?

I have tried two methods so far, as follows
-------------------------------------------------------------
/*
 * prop_val =3D  1      -->  1 steps --> b'00
 * prop_val =3D  2 ~  4 -->  4 steps --> b'01
 * prop_val =3D  5 ~ 16 --> 16 steps --> b'10
 * prop_val =3D 17 ~ 64 --> 64 steps --> b'11
*/

// 1. use fls() and ffs() combination
prop_val =3D ffs(prop_val) =3D=3D fls(prop_val) ? fls(prop_val) >> 1 :
(fls(prop_val) + 1) >> 1;

// 2. use one line for-loop, but without fls()
for (i =3D --prop_val, prop_val =3D 0; i >> 2 * prop_val !=3D 0; prop_val++=
);
-------------------------------------------------------------
Do these changes meet your expectations??

>
> ...
>
> > > > +       props->max_brightness =3D min_t(u32, brightness,
> > > > +                                     MT6370_BL_MAX_BRIGHTNESS);
> > >
> > > One line?
> >
> >  Ditto, it will be over 80 characters...
>
> As per above.
>
> --
> With Best Regards,
> Andy Shevchenko
