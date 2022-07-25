Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A180A57FB99
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 10:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA428D744;
	Mon, 25 Jul 2022 08:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C878D744
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:43:42 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z15so1136804edc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 01:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gBUjOXPSyxIp/ssA5bMpYCLKWAJ3HGf2reVDfO9yM3o=;
 b=ZcloaGBXNWKgwFGhN0tBCVgGN7mKJ0l57wi/gxiOCcQ3btK6lq9SuR+ZDWopqPFJwr
 QtH+fUQor4bu6z6i3Onr2HRzeQyO9JOs9GcWZvML3s9jvPJQnd/sk2l56CU4eOkmNXQj
 LqLK8afv+vA1SA6f+pxw6kwJwYDOpRk9RKfUzqG3YfKkkTmnHl6JN0Bgs4bLgrYJH4/G
 DwVst0E8Wq+wDqCv4Rf6WiAWX6k8ZbwXfY2/046oEtgbBla5lc4gNBqV8JGbD5c944lY
 EL1jChoaIjqEM9Bwbv2uv0Do0n4Vre3jmkyldcj0zTNhXTJcj/3JcVpHUBK+rQNRfl5E
 JX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gBUjOXPSyxIp/ssA5bMpYCLKWAJ3HGf2reVDfO9yM3o=;
 b=U5n+lDOFrKRsg7ZB/ntoHmkfJ40sl2P9XKk8k1PzTEu1H0iS41t/JkYrWE0/DIXJib
 Xl5LYJbHh2z39H0y+i33m7M3g5gJrthBN87nNBIzFDgfx9UFBRsovM5A3dNlQB4g5u1l
 AqosHKQD1hCu7LL6DCVgX+J2JH/C58tlM1En8yetzbhwIKMXwOoAzMVtrTIcIf7S5RM5
 K/GQetriYM66hCSZ39DYwAAcQku/zN19HNTIYYU+ttJJRbdxuoo7NUQhpB6IwoUyUom9
 pjj20sb4RIMz1n+pPTpuTKSODJTdzQoiuyFk7a/GvaUopN/kPIqJ3RkZ+2GFEvy0dgv3
 n3wA==
X-Gm-Message-State: AJIora+N4mjKBoUtaQtYTGxmL6FjyZBY3guhVQL22PrDkfaPgmJstC4Z
 /uhFRW0qjegfD+EOyc8sHUE5hIvRIP9URm+xuzk=
X-Google-Smtp-Source: AGRyM1soQCq75MmbI4ONQXkzNoXoyDLrEe84HYxRimv6nF0nPZqyoEzx4IbLZDEZCEsYL6EGcqoDhOkMKbKf9dD+JE4=
X-Received: by 2002:a05:6402:254b:b0:43b:d6c3:dd96 with SMTP id
 l11-20020a056402254b00b0043bd6c3dd96mr11626028edb.406.1658738620885; Mon, 25
 Jul 2022 01:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-8-peterwu.pub@gmail.com>
 <CAHp75VfiKMROzxeEaCH6qCthK9qanJPqbjADLMVH-V0upKf+9Q@mail.gmail.com>
 <CABtFH5++4N1mECJ0vN-79WsJJWcBTVxLFgvkiouPf1qev7LHHQ@mail.gmail.com>
In-Reply-To: <CABtFH5++4N1mECJ0vN-79WsJJWcBTVxLFgvkiouPf1qev7LHHQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 10:43:04 +0200
Message-ID: <CAHp75VfKihBLjUFqe_Sj5dqTO7-wjLehAF+9_8-sbUeyJ-ZAmg@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] mfd: mt6370: Add MediaTek MT6370 support
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

On Mon, Jul 25, 2022 at 10:30 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> On Mon, Jul 25, 2022 at 4:00 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:

...

> > > +#define MT6370_REG_DEV_INFO    0x100
> > > +#define MT6370_REG_CHG_IRQ1    0x1C0
> > > +#define MT6370_REG_CHG_MASK1   0x1E0
> > > +
> > > +#define MT6370_VENID_MASK      GENMASK(7, 4)
> > > +
> > > +#define MT6370_NUM_IRQREGS     16
> > > +#define MT6370_USBC_I2CADDR    0x4E
> >
> > > +#define MT6370_REG_ADDRLEN     2
> > > +#define MT6370_REG_MAXADDR     0x1FF
> >
> > These two more logically to have near to other _REG_* definitions above.
>
> Hi Andy,
> Thanks for your review.
> Do you mean that we should move '#define MT6370_USBC_I2CADDR' and
> '#define MT6370_REG_MAXADDR' after the line '#define
> MT6370_REG_CHG_MASK1'?
> -------------------------------------------------------------------
> #define MT6370_REG_DEV_INFO    0x100
> #define MT6370_REG_CHG_IRQ1    0x1C0
> #define MT6370_REG_CHG_MASK1   0x1E0
> #define MT6370_USBC_I2CADDR    0x4E
> #define MT6370_REG_MAXADDR     0x1FF
>
> #define MT6370_VENID_MASK      GENMASK(7, 4)
>
> #define MT6370_NUM_IRQREGS     16
> #define MT6370_REG_ADDRLEN     2
> -------------------------------------------------------------------
> Like this?

You lost me. Namespace has a meaning, i.e. grouping items of a kind.
In your proposal I don't see that. If REG_MAXADDR and REG_ADDRLEN are
_not_ of the _REG_ kind as per above, why do they have this namespace
in the first place?

-- 
With Best Regards,
Andy Shevchenko
