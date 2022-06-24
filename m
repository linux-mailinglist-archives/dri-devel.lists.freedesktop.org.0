Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D7F5597E3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 12:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B28E10E909;
	Fri, 24 Jun 2022 10:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1812910E91E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 10:33:02 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id w10so1209726ilj.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 03:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U226G+gJXjVu8Couc5Qv56p1SRGwVv16nFZEn3RxVtU=;
 b=WZpsM51CgSRUFkewgWRiMqQCwdfKsPxTQTY1/FdwFAv5v1w7p4JLgRHq9illM8ReYx
 z2I4w1oylu873NcQ0QfYk817rCiBPB0mGufQXo76zV/Icu9IEwOjioYXN0WrZaKX6cL9
 07Rb+d983LgBkl7ZA2fWK1F/kNdQF9BiZL9Ob4HxWbn3065/DVrpR2hnCisuhiIvh29F
 a1SdXgqZZPfRMBvTu2ZBrFXqF+/UDBm+1z8lmHXxgxBO4vl/CMvHhqBbS1k+4Bl/Ubp3
 3Gnny6BLEYiAhqOwP9WZrt/sWfajs0WI0/NMdBj55eW9CetTpTBVfPJIFkRQKlBHknZx
 L3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U226G+gJXjVu8Couc5Qv56p1SRGwVv16nFZEn3RxVtU=;
 b=L7SXDCDftiDbKXhQzPz3r3kdPWk1ZobCFJiupMDV7/cSRiSP/mQMp6GMjQdYMcDrvk
 iKOf93BCPozhPgmUipIhXnCMKTolXwzWBRiLvm+BIA2igkMtvYgpsSfR5Fs56Ipk6NJz
 IALB61vJrAiP9s10B7/XGvpJ37jLJrvpI9YOCF3w3V8i2d4z5/P3vQVXOptoc1ex5Xsl
 xrQkAGxsTaWwdFByKfqrXsd1fEZ9NP7H1yB9cdiE2iYx5b09tXnPIWxroab/Nw835DGJ
 MJw5/EdcZVlYMCaQpvSduvDH17NLvYoEEnyqHrmNSA77R1DBHZhN+FF++iz7S4tlqok7
 LXHQ==
X-Gm-Message-State: AJIora/QsFuQxqeCi420WkGYgXu+I/WSMwYzDNSyAPZEaXN2CDdfQ+sX
 P2ur/+e8pzOfQztVs7lPYILepucYKbNyvDVdRRI=
X-Google-Smtp-Source: AGRyM1vwKPbWsq2euM9m6UqA1rwAUWYo4r1L6FV6jbw4QbMXoRJS9w4dpuFfMGm93LZs8AZ6tCdsbCCLj6aHRPRFCko=
X-Received: by 2002:a05:6e02:1bc6:b0:2d3:dba7:f626 with SMTP id
 x6-20020a056e021bc600b002d3dba7f626mr8034868ilv.299.1656066780324; Fri, 24
 Jun 2022 03:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-10-peterwu.pub@gmail.com>
 <CAHp75VdgxR9aFQmi_MPrX=t7RMnKDiLAwWMvxbpW9OoQMJkKyw@mail.gmail.com>
In-Reply-To: <CAHp75VdgxR9aFQmi_MPrX=t7RMnKDiLAwWMvxbpW9OoQMJkKyw@mail.gmail.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 24 Jun 2022 18:32:49 +0800
Message-ID: <CABtFH5+YLpYdWNsy1DwkKf19L6THo5NYvQ8e3rpo9wkTS9HxwQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] regulator: mt6370: Add mt6370 DisplayBias and
 VibLDO support
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

Thanks for your helpful comments!

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B46=E6=9C=
=8824=E6=97=A5 =E9=80=B1=E4=BA=94 =E5=87=8C=E6=99=A82:19=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Thu, Jun 23, 2022 at 2:00 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add mt6370 DisplayBias and VibLDO support.
>
> ...
>
> > +#include <linux/bits.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
>
> > +#include <linux/of.h>
>
> Any users of this? (See below)
>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/driver.h>
> > +#include <linux/regulator/machine.h>
>
> ...
>
> > +#define MT6370_LDO_MINUV       1600000
> > +#define MT6370_LDO_STPUV       200000
> > +#define MT6370_LDO_N_VOLT      13
> > +#define MT6370_DBVBOOST_MINUV  4000000
> > +#define MT6370_DBVBOOST_STPUV  50000
> > +#define MT6370_DBVBOOST_N_VOLT 45
> > +#define MT6370_DBVOUT_MINUV    4000000
> > +#define MT6370_DBVOUT_STPUV    50000
> > +#define MT6370_DBVOUT_N_VOLT   41
>
> If UV is a unit suffix, make it _UV.
>
> ...
>
> > +               .of_match =3D of_match_ptr("dsvbst"),
>
> Would it even be called / used if CONFIG_OF=3Dn?

We got a notification from Mark telling us that this patch has been
applied to git.
( https://lore.kernel.org/linux-arm-kernel/165599931844.321775.808555909233=
7130067.b4-ty@kernel.org/
)
So, should we need to make any other changes in the next submission?

>
> ...
>
> > +               .regulators_node =3D of_match_ptr("regulators"),
>
> Ditto.
>
> ...
>
> > +       for (i =3D 0; i < ARRAY_SIZE(mt6370_irqs); i++) {
> > +               irq =3D platform_get_irq_byname(pdev, mt6370_irqs[i].na=
me);
> > +
> > +               rdev =3D priv->rdev[mt6370_irqs[i].rid];
> > +
> > +               ret =3D devm_request_threaded_irq(priv->dev, irq, NULL,
> > +                                               mt6370_irqs[i].handler,=
 0,
> > +                                               mt6370_irqs[i].name, rd=
ev);
> > +               if (ret) {
>
> > +                       dev_err(priv->dev,
> > +                               "Failed to register (%d) interrupt\n", =
i);
> > +                       return ret;
>
> return dev_err_probe(...); ?
>
> > +               }
> > +       }
>
> ...
>
> > +       for (i =3D 0; i < MT6370_MAX_IDX; i++) {
> > +               rdev =3D devm_regulator_register(priv->dev,
> > +                                              mt6370_regulator_descs +=
 i,
> > +                                              &cfg);
> > +               if (IS_ERR(rdev)) {
>
> > +                       dev_err(priv->dev,
> > +                               "Failed to register (%d) regulator\n", =
i);
> > +                       return PTR_ERR(rdev);
>
> return dev_err_probe(...); ?
>
> > +               }
> > +
> > +               priv->rdev[i] =3D rdev;
> > +       }
>
> ...
>
> > +       if (!priv->regmap) {
> > +               dev_err(&pdev->dev, "Failed to init regmap\n");
> > +               return -ENODEV;
> > +       }
>
> return dev_err_probe(...);
>
> --
> With Best Regards,
> Andy Shevchenko

Best regards,
ChiaEn Wu
