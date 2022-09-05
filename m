Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FDB5AD9FC
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931EB10E321;
	Mon,  5 Sep 2022 19:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4B510E321
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:56:07 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id k2so9692436vsk.8
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=TxtKuUqRxkHzFdFIsdOfwVRYln8Ru/gjD+KQXu9iPWk=;
 b=oOTNddka/G5MmOs10MprjSwOych3GIj7p+oXSDb0g7K+MumOQ7dZI9fvJZbh5v/ZDF
 DkO1HuuP77CxrZ+nX3N/Lzhn/vUJoUctJFw7B5StarCr4bF9V9vn6OWirRi6MzdQqj30
 RSw/5Gc1rkcPkllIbByQHmgIVNflrb//j8OILQCPlm+kfxjDVj7A+Lyb1H1czT3F4/xi
 bz15Ht8yFZoqUyi30wGVEJqKiyzB6caNlhd6ZUpR1ANYxl8eNvELSRuii9PJ3S+s4ley
 Rp+HaIIqJfxdvV1TQotcVRJ+vu/DyoG1JpVG2rEiNSh0BPI5uNW/2ybVsLc3YOQ/Kl+P
 cZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=TxtKuUqRxkHzFdFIsdOfwVRYln8Ru/gjD+KQXu9iPWk=;
 b=BxNUSTgPf4XftrNllbhTdQpYmsKzdt+7bpBuLBq+rlX+iXGqSAts/vTQDkDP4UyFsa
 8oZx8KTXf1MzKP3vjO42Ph8SqzW+Dq1XAl6wotIQLpZ32+xjMtAzO+0GDjblX9Lwu3+w
 tmUtcsJ4evh5ZewTDAd+4SJJvX1BsUqTHiJDdhCR2XQkI3x0XTR/Ywh5qXXhCPoaALl8
 oAxZSGTtCjNat0NwKqdPRQW/o+UVIBsycfOp7FO8h70bTxlu5XFzIu+XlI7/eoQzdTqi
 Xw8txbDKd3M7tldKcxNHy+IuRr97VkVwz74MsSoEQMEIR4d4E9tOeF18YsMMHCYHlz4r
 3vIA==
X-Gm-Message-State: ACgBeo0dyirvD3F22oZOHo77uApZKyz14QIBQ35VFYIHGR7YvyB3iNXz
 ldEO1GUZegN+Fvm6T/2B3H6ACCfsJgfIbQm3U+w=
X-Google-Smtp-Source: AA6agR40buubTfPsstG80DF+s22ldT4F+qiWGt4P8UBWfLfejzg6ynm6XI4ScnPvxtGB0Oeq1Upf5TBcnrM6rSa5o+Y=
X-Received: by 2002:a67:e058:0:b0:390:e62d:8976 with SMTP id
 n24-20020a67e058000000b00390e62d8976mr11716363vsl.31.1662407766752; Mon, 05
 Sep 2022 12:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-4-b29adfb27a6c@gmail.com>
 <CAHp75VdMr7wru-2hD1HH3OS5JTNdzt6VRqB6OFoCp2JkiuiTjw@mail.gmail.com>
 <YxZQj8bwJCx5rqDv@google.com>
 <CAHp75VdHJS4YgrTK15OuY5sxodxKObUtzturL+YPXFQ3_wpxig@mail.gmail.com>
 <YxZTS3Nl1YaMGoBC@google.com>
In-Reply-To: <YxZTS3Nl1YaMGoBC@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 22:55:30 +0300
Message-ID: <CAHp75VeNajcf-Y6xvDDVwZijg6U53ggg1HQox1AZ74=wRut+1Q@mail.gmail.com>
Subject: Re: [PATCH v1 04/11] usb: phy: tegra: switch to using devm_gpiod_get()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci <linux-pci@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 5, 2022 at 10:51 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, Sep 05, 2022 at 10:41:40PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 10:40 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > > On Mon, Sep 05, 2022 at 01:59:44PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:

...

> > > > > -               gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
> > > > > -                                                   "nvidia,phy-reset-gpio",
> > > > > -                                                   0, GPIOD_OUT_HIGH,
> > > > > -                                                   "ulpi_phy_reset_b");
> > > > > +               gpiod = devm_gpiod_get(&pdev->dev, "nvidia,phy-reset",
> > > > > +                                      GPIOD_OUT_HIGH);
> > > > >                 err = PTR_ERR_OR_ZERO(gpiod);
> > > >
> > > > What does _OR_ZERO mean now?
> > >
> > > This converts a pointer to an error code if a pointer represents
> > > ERR_PTR() encoded error, or 0 to indicate success.
> >
> > Yes, I know that. My point is, how is it useful now (or even before)?
> > I mean that devm_gpio_get() never returns NULL, right?
>
> What does returning NULL have to do with anything.

It has to do with a dead code. If defm_gpiod_get() does not return
NULL, then why do we even bother to check?

> It converts a pointer
> to a "classic" return code, with negative errors and 0 on success.
>
> It allows to not use multiple IS_ERR/PTR_ERR in the code (I'd need 1
> IS_ERR and 2 PTR_ERR, one in dev_err() and another to return).

I don't see how this is relevant.

-- 
With Best Regards,
Andy Shevchenko
