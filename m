Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD055732AD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60A698AB9;
	Wed, 13 Jul 2022 09:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A935898ACA
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 09:31:21 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id y22so7071513qki.7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 02:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0xyK6QWRYvAYrb/+63rjLZQAcRtIxgLcrB33g+2KqSs=;
 b=FPtWrLSybq5/JRcq7btvHeJWMCsXvX/CM2akEZ98w5Xhrqo5RiIk+io9a9kvidBbko
 rD98ifKAkq2HQKbAZQtZUBYWAYRF/ZB2JgjqaJYu/u8t/7x4N2ZYB8gZATQtovzJzSvA
 o3dWO87hqrObabvw3it/HpfFSXxC98KBVo3PpXVLGH+CgExY7y0lQcZbQDXsaV9OOb8j
 MrkI6gK5FcldXAP+tuHXT0nqQ5anw3evL0O6kJDWNtiNB5BjDOBuchzIh9JLzIf2DXQF
 JujWd1jAyefR6kqA5vMjO8gTQ/Lm8neut7PL7nIKcg/SZxCqpx8WHofnonnog7Y1lvkR
 qZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0xyK6QWRYvAYrb/+63rjLZQAcRtIxgLcrB33g+2KqSs=;
 b=XsbCFOLBugjExsyI7+Iu1G0aEZmE/2tfThWdZb7Tl2nQ69CwWZ8wQAyzE/kpcTZHny
 YIkpgn9cDxji+byicWEAoOU+n1WU8bwaQmhMzjqO/Cip8r1SRc5LA9/jFE+beDePHrSF
 kQ2a4t8NPTIASYbdpdy9Va0OQjLmsTK5+MoCna+aOoH4upXKapR4XzbpJR5cCI7OEe4H
 9B+xlUAAepMn0Gn5nQCAycbfnnra4RQblyYprBgOpva0hTjo4crCkOajUtUj/RDGdc99
 Fvbzy7njlHWt3vyOMYBSu5ai1AABcLn6UbA4QsqodIMJwfZKd/mavYuGJgWKOTsm7tfP
 b6Yg==
X-Gm-Message-State: AJIora+HnlbJV/q3y1PHu7srCVcjUOOqupCrHmfHSq8v8VW48kIqnzVr
 tBya86g/qQdqw99JbdEouBn146E2P7OlzRn6nWs=
X-Google-Smtp-Source: AGRyM1tNsl8p/tCqsOZvpybXx5aQhHuu6sUOAU1YdLQtCXJYEQpEi36ZexKVhnKPkG6l8H1xdXwMDaKMQpxPJUuM4pM=
X-Received: by 2002:a05:620a:450c:b0:6b2:59b8:985 with SMTP id
 t12-20020a05620a450c00b006b259b80985mr1639127qkp.328.1657704680484; Wed, 13
 Jul 2022 02:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-8-peterwu.pub@gmail.com>
 <Ys2TTsv1oU8n1fUE@google.com>
 <CABtFH5LMHrfOdLZZxpjwsHmyHZsHUmevpQJYDFqZtvfpC6AVxg@mail.gmail.com>
 <Ys58hr3AK/p/4/ng@google.com>
In-Reply-To: <Ys58hr3AK/p/4/ng@google.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Wed, 13 Jul 2022 17:31:08 +0800
Message-ID: <CABtFH5KoHGFC1KfbRYJndrkTHoABEf8xs5jAZVjQwJ_G=6TsgA@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] mfd: mt6370: Add Mediatek MT6370 support
To: Lee Jones <lee.jones@linaro.org>
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
 Liam Girdwood <lgirdwood@gmail.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Pavel Machek <pavel@ucw.cz>, Linux LED Subsystem <linux-leds@vger.kernel.org>,
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

Hi Lee,

Lee Jones <lee.jones@linaro.org> =E6=96=BC 2022=E5=B9=B47=E6=9C=8813=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:04=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, 13 Jul 2022, ChiaEn Wu wrote:
>
> > Hi Lee,
> >
> > Thanks for your reply.
> >
> > Lee Jones <lee.jones@linaro.org> =E6=96=BC 2022=E5=B9=B47=E6=9C=8812=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E6=99=9A=E4=B8=8A11:29=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > On Thu, 23 Jun 2022, ChiaEn Wu wrote:
> > >
> > > > From: ChiYuan Huang <cy_huang@richtek.com>
> > > >
> > > > Add Mediatek MT6370 MFD support.
> > >
> > > No such thing as "MFD support".
> > >
> > > And you're not getting away with submitting a 370 line patch with a 5
> > > word change log either. :)
> > >
> > > Please at least tell us what the device is and what it's used for.
> >
> > I sincerely apologize.
> > We will add more descriptions of the MT6370 feature in the v5 patch.
> >
> > >
> > > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > > ---
> > > >
> > > > v3
> > > > - Refine Kconfig help text
> > > > - Refine error message of unknown vendor ID in
> > > >   mt6370_check_vendor_info()
> > > > - Refine return value handling of mt6370_regmap_read()
> > > > - Refine all probe error by using dev_err_probe()
> > > > - Refine "bank_idx" and "bank_addr" in mt6370_regmap_read() and
> > > >   mt6370_regmap_write()
> > > > - Add "#define VENID*" and drop the comments in
> > > >   mt6370_check_vendor_info()
> > > > - Drop "MFD" in MODULE_DESCRIPTION()
> > > > ---
> > > >  drivers/mfd/Kconfig  |  13 ++
> > > >  drivers/mfd/Makefile |   1 +
> > > >  drivers/mfd/mt6370.c | 358 +++++++++++++++++++++++++++++++++++++++=
++++++++++++
> > > >  3 files changed, 372 insertions(+)
> > > >  create mode 100644 drivers/mfd/mt6370.c
>
> [...]
>
> > > > +static const struct mfd_cell mt6370_devices[] =3D {
> > > > +     MFD_CELL_OF("adc", NULL, NULL, 0, 0, "mediatek,mt6370-adc"),
> > > > +     MFD_CELL_OF("charger", NULL, NULL, 0, 0, "mediatek,mt6370-cha=
rger"),
> > > > +     MFD_CELL_OF("backlight", NULL, NULL, 0, 0, "mediatek,mt6370-b=
acklight"),
> > > > +     MFD_CELL_OF("flashlight", NULL, NULL, 0, 0, "mediatek,mt6370-=
flashlight"),
> > > > +     MFD_CELL_OF("indicator", NULL, NULL, 0, 0, "mediatek,mt6370-i=
ndicator"),
> > > > +     MFD_CELL_OF("tcpc", NULL, NULL, 0, 0, "mediatek,mt6370-tcpc")=
,
> > > > +     MFD_CELL_RES("regulator", mt6370_regulator_irqs)
> > >
> > > The first parameters here should be prepended with something, perhaps
> > > "mt6370_"?
>
> > OK, we will add the prefix in the next patch.

Sorry, I forgot to ask a question in the last mail.
I wonder if using "mt6370-xxx" (dash) is better than using "mt6370_"
(underline) ??
Thanks.

> [...]
>
> > > > +static int mt6370_probe(struct i2c_client *i2c)
> > > > +{
> > > > +     struct mt6370_info *info;
> > > > +     struct i2c_client *usbc_i2c;
> > > > +     int ret;
> > > > +
> > > > +     info =3D devm_kzalloc(&i2c->dev, sizeof(*info), GFP_KERNEL);
> > > > +     if (!info)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     info->dev =3D &i2c->dev;
> > > > +
> > > > +     usbc_i2c =3D devm_i2c_new_dummy_device(&i2c->dev, i2c->adapte=
r,
> > > > +                                          MT6370_USBC_I2CADDR);
> > > > +     if (IS_ERR(usbc_i2c))
> > > > +             return dev_err_probe(&i2c->dev, PTR_ERR(usbc_i2c),
> > > > +                                  "Failed to register USBC I2C cli=
ent\n");
> > > > +
> > > > +     /* Assign I2C client for PMU and TypeC */
> > > > +     info->i2c[MT6370_PMU_I2C] =3D i2c;
> > > > +     info->i2c[MT6370_USBC_I2C] =3D usbc_i2c;
> > > > +
> > > > +     info->regmap =3D devm_regmap_init(&i2c->dev, &mt6370_regmap_b=
us, info,
> > > > +                                     &mt6370_regmap_config);
> > >
> > > Apart from in mt6370_check_vendor_info() where is this actually used?
> >
> > Well... from my understanding, we use this MFD driver to make other
> > drivers of MT6370 (e.g. charger, ADC, led...) use the same regmap
> > settings.
> > Thus, this regmap is not only used in mt6370_check_vendor_info().
>
> Well for that to happen you need to store the data somewhere for the
> child devices to fetch from.  I don't see that happening in this
> patch?  What did I miss?

hmmm... I got your point... I will let regmap be a local var in
probe() in the next patch.
Thank you so much!

>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Principal Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog

Best regards,
ChiaEn Wu
