Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3286053B625
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 11:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D2410E12A;
	Thu,  2 Jun 2022 09:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDEE10E12A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 09:35:34 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id be31so6897802lfb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 02:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rBGjBOMnZl6to9efJaumbeOWSvKP8/DOct/QBdXnYoE=;
 b=jvY/M4TcfKUtycVJEjl3vv3zcqK0vVXzP6oHwxbhveiR6Eve6NDt0Von5+VteqUBV0
 0L333UPalxOSb+vAx5ej9FW4zDL3jiSJBKKI5g/bfbegljG05danKDxYAC1Mawnygsr8
 NfvqH2NN74NnI5rLy+2zi6GU0sJ4y2QMkIhCQuT0rdAnmGP6i+nYifRZZ1QarEQWaWqU
 1sFUjgMVvdhRWoctqpRRBSRSxoYCb/XYfFaItHlctIxH4eSOMldKOv1TbUyAo4DKKvuT
 uI9O7Tb6ZGTcE2JxUT1KvCqoqebUvm2IiT9ek+R0V9Lk4hCNqrOX4e+Amz04wcKyd1yK
 Jadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rBGjBOMnZl6to9efJaumbeOWSvKP8/DOct/QBdXnYoE=;
 b=DVahSbMTKwqJDOk6qn5XWlHvgSLpofXlmApa+sb0sRkBqLCD2d+6MexCyAX3adFSrJ
 eSMEYJZuZiRGsHTIBYuBb8452iyT/CZ4322AYIbPjJ+8W8rKTDmRWcloYANXmdrKLeKX
 6mgSwutWKH3HucowEZ2tPvCR8Hs2BB1GoBp5f6Df5GWnDNXiHo1E6IYUfnVW78aKWGyp
 TnFKp5FciUVT3SIixRhXttQwEMiTPnSxFsXCcYqVKqjaR0olVrZShkeAfU3UuCYqYgsF
 094vRpQbhWdcmhE5QGBhSfo++eKpKkq1KA6qm3e88Ft1uGhjwHU2LxtYa8NnAa6zjbbz
 +Olw==
X-Gm-Message-State: AOAM531U6AzM6GQQdZ3QsmKIG0wsctdaQYUMjQqLvH6dPGt2jyzbMmBT
 hzgeEdn2zUK6J83zjF6F+GEPm47/5urYBcDiakI=
X-Google-Smtp-Source: ABdhPJwGnEM9jHCmHkWGx92/jl3eJw4zP0SFatjlcRCflAAlB9cVfAhhX5EONP3FSiW4lO0wQLnMioV43pqGQELiTHo=
X-Received: by 2002:a05:6512:2251:b0:478:fc67:b09f with SMTP id
 i17-20020a056512225100b00478fc67b09fmr2833144lfu.196.1654162532575; Thu, 02
 Jun 2022 02:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
 <20220531102809.11976-7-peterwu.pub@gmail.com>
 <CAHp75Vd8taco19vsDmBcCv8euV1SvwSiY5=P9oMkA6zWsjwXxg@mail.gmail.com>
 <20220602062643.GA13824@cyhuang-hp-elitebook-840-g3.rt>
 <CAHp75Vd-n=oLnhRCK=pR5ybOZbC6BKXrE2jRdwDbH90E4KYFGA@mail.gmail.com>
In-Reply-To: <CAHp75Vd-n=oLnhRCK=pR5ybOZbC6BKXrE2jRdwDbH90E4KYFGA@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Thu, 2 Jun 2022 17:35:15 +0800
Message-ID: <CADiBU3-73ktYfwZD=Dgd+5kWHraOuBkz1=bU_-+NNcxP12gcrQ@mail.gmail.com>
Subject: Re: [PATCH 06/14] leds: mt6370: Add Mediatek MT6370 Indicator support
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
 Heikki" <heikki.krogerus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 alice_chen@richtek.com, linux-iio <linux-iio@vger.kernel.org>,
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
 chiaen_wu@richtek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B46=E6=9C=
=882=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:18=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Thu, Jun 2, 2022 at 8:27 AM ChiYuan Huang <u0084500@gmail.com> wrote:
> > On Wed, Jun 01, 2022 at 11:48:58AM +0200, Andy Shevchenko wrote:
> > > On Tue, May 31, 2022 at 1:16 PM ChiaEn Wu <peterwu.pub@gmail.com> wro=
te:
>
> ...
>
> > > What indicator?
> > It's RGB curent sink type LED driver (maximum supported current is only=
 24mA).
>
> Make your commit messages a slightly more verbose.
>
OK, will refine the commit message in next.
> ...
>
> > > > +#include <linux/of.h>
> > >
> > > Are you sure this is the correct header? Seems you need
> > > mod_devicetable.h instead.
> > >
> > It's the correct header and be used for the struct 'of_device_id'.
>
> Nope. Run the following command
> $ git grep -n 'struct of_device_id {' -- include/linux/
>
Got it, thanks.
> ...
>
> > > > +struct mt6370_priv {
> > > > +       struct mutex lock;
> > >
> > > Do you use regmap locking?
> > >
> > MFD regmap register already the access lock.
> >
> > This lock is just to guarantee only one user can access the RGB registe=
r
> > part.
> >
> > Sorry, from the comment, do you want us to rename or remove this lock?
>
> My point is, since you have two locks, explain why you need each of them.
>
OK, will leave a comment line to explain the usage of this lock.
> > > > +       struct device *dev;
> > >
> > > > +       struct regmap *regmap;
> > >
> > > > +       struct regmap_field *fields[F_MAX_FIELDS];
> > > > +       const struct reg_field *reg_fields;
> > > > +       const struct linear_range *ranges;
> > > > +       struct reg_cfg *reg_cfgs;
> > > > +       unsigned int leds_count;
> > > > +       unsigned int leds_active;
> > > > +       bool is_mt6372;
> > > > +       struct mt6370_led leds[];
> > > > +};
>
>
> --
> With Best Regards,
> Andy Shevchenko
