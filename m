Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C95DF5734A5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 12:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6FD8DCD7;
	Wed, 13 Jul 2022 10:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D7E8ECBF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 10:53:39 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id i21so10215554qtw.12
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 03:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DtbNdnUc44YIlF6TRQBufQhc3QEyoL5MrmX0wLT8k54=;
 b=Gyo9ib/QcIdb16MTJkh9cbA18WvicHplsE0W3sU861LHrnSg07BYqH7gJMgBhngnKz
 HcevAv8xN2yoj76j2VtRiK2gtKJVtYu4yl5/zly8b+NniYgUqKX802rsbScX12+DWFC4
 f0KpI6KMxAijdVif10K4Yr7TL49g59ksBWPF+FSCOp555hmLxPKqliprXs0MwfV8RcVf
 ETobhf/JgYbtx1rqJ3zRweW6zFE9EFO0mg+t95Av28GUjrByGd6Dv732KM7J1jq47j2b
 8+Q496cjjPl2IE4bcmCDO+D9bk6yPPzE9JlJzEBLhQ3fyJGOnWiUMtJcmMXwpI3pw5T7
 noUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DtbNdnUc44YIlF6TRQBufQhc3QEyoL5MrmX0wLT8k54=;
 b=D6oI6rSBDUcPUfw5jskx05vGC23Qp0t3+J+9QPHBG+PmQQOOde/U9uvzamd15XfIb2
 gNUjq1YQAHfsSDIOVpVnlnQ4Ub1bNeOdUEBIU2XkLN83v49EfCBNckjDOgnwrqhWvDex
 M0NnWps2XLleIhMWxg/j3u3UG1vNaLsWxycLCNRNlbRsZ/on/gSRR/pKI04pogrF3a13
 IX6cZtcmlSZwZeHIuQFk4r+3WWwPiLPaeBV+C2bDWbdTbJR+/Hrqh0p6L36MRH17i6iQ
 2fegMKwjTc6YAxVwIwHLABxnle/s4WWchMeuc0IVy50DYsL5c0ay8zQNlQf1kyUQbM7S
 3ObQ==
X-Gm-Message-State: AJIora/lHJynJazLC7qCyrANLCUmI9tnRJzmZ7DJ2N+B+8Gd+1yzwuv0
 8AMZzTFkGyO6tEweeLdz01IozAi6uiUieYibdiU=
X-Google-Smtp-Source: AGRyM1tW+7suTTjQXEmy3r5fN1iawLpKRhb3LKUTHZNBYRUSHZBiLtacjGwqLvPQVKDWfDQQGVrgegFbKhRRnQe+Kts=
X-Received: by 2002:a05:622a:1755:b0:31e:cbdf:2e32 with SMTP id
 l21-20020a05622a175500b0031ecbdf2e32mr1387023qtk.548.1657709618139; Wed, 13
 Jul 2022 03:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-14-peterwu.pub@gmail.com>
 <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
In-Reply-To: <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Wed, 13 Jul 2022 18:53:26 +0800
Message-ID: <CABtFH5K-2+2hbpvpq2nPE5AsznkQxZF2r3MVC64Q39DJhVuUtA@mail.gmail.com>
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

Hi Andy,
Thanks for your reply! I have some questions want to ask you below.

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=9C=
=885=E6=97=A5 =E9=80=B1=E4=BA=8C =E6=B8=85=E6=99=A85:14=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Mon, Jul 4, 2022 at 7:43 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >
> > From: ChiaEn Wu <chiaen_wu@richtek.com>
> >
> > Add Mediatek MT6370 Backlight support.
>
> ...
>
> > +         This driver can also be built as a module. If so the module
>
> If so,
>
> > +         will be called "mt6370-backlight.ko".
>
> No ".ko" part.
>
> ...
>
> > +#include <linux/gpio/driver.h>
>
> Can you elaborate on this?
>
> > +#include <linux/kernel.h>
> > +#include <linux/log2.h>
> > +#include <linux/minmax.h>
> > +#include <linux/module.h>
>
> > +#include <linux/of.h>
>
> Can you elaborate on this?
>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
>
> Missed mod_devicetable.h.
>
> ...
>
> > +               brightness_val[0] =3D (brightness - 1) & MT6370_BL_DIM2=
_MASK;
> > +               brightness_val[1] =3D (brightness - 1)
> > +                                   >> fls(MT6370_BL_DIM2_MASK);
>
> Bad indentation. One line?

Well... if indent to one line, it will be over 80 characters(or called colu=
mns?)
From my understanding, it is not allowed, right??

>
> ...
>
> > +       if (priv->enable_gpio)
>
> Dup check.
>
> > +               gpiod_set_value(priv->enable_gpio, brightness ? 1 : 0);
>
> ...
>
> > +       brightness =3D brightness_val[1] << fls(MT6370_BL_DIM2_MASK);
> > +       brightness +=3D (brightness_val[0] & MT6370_BL_DIM2_MASK);
>
> Too many parentheses.
>
> ...
>
> > +               /*
> > +                * prop_val =3D  1      -->  1 steps --> 0x00
> > +                * prop_val =3D  2 ~  4 -->  4 steps --> 0x01
> > +                * prop_val =3D  5 ~ 16 --> 16 steps --> 0x10
> > +                * prop_val =3D 17 ~ 64 --> 64 steps --> 0x11
> > +                */
> > +               prop_val =3D (ilog2(roundup_pow_of_two(prop_val)) + 1) =
>> 1;
>
> Isn't something closer to get_order() or fls()?

I will revise it to "(get_order(prop_va * PAGE_SIZE) + 1) / 2" and
this change is meet your expectations??

>
> ...
>
> > +       props->max_brightness =3D min_t(u32, brightness,
> > +                                     MT6370_BL_MAX_BRIGHTNESS);
>
> One line?

 Ditto, it will be over 80 characters...

>
> ...
>
> > +       val =3D 0;
>
> Do you need this here?
>
> > +       prop_val =3D 0;
>
> Useless.
>
> > +       ret =3D device_property_read_u8(dev, "mediatek,bled-channel-use=
",
> > +                                     &prop_val);
> > +       if (ret) {
> > +               dev_err(dev, "mediatek,bled-channel-use DT property mis=
sing\n");
> > +               return ret;
> > +       }
> > +
> > +       if (!prop_val || prop_val > MT6370_BL_MAX_CH) {
> > +               dev_err(dev,
> > +                       "No channel specified or over than upper bound =
(%d)\n",
> > +                       prop_val);
> > +               return -EINVAL;
> > +       }
>
> ...
>
> > +static int mt6370_bl_probe(struct platform_device *pdev)
> > +{
> > +       struct mt6370_priv *priv;
> > +       struct backlight_properties props =3D {
> > +               .type =3D BACKLIGHT_RAW,
> > +               .scale =3D BACKLIGHT_SCALE_LINEAR,
> > +       };
> > +       int ret;
>
>   struct device *dev =3D &pdev->dev;
>
> will save you a few LoCs.
>
> --
> With Best Regards,
> Andy Shevchenko

Best regards,
ChiaEn Wu
