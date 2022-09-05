Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20285AD084
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4F210E2C4;
	Mon,  5 Sep 2022 10:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B8610E2B5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:48:18 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id a22so5847157qtw.10
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 03:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=ocC0mA23fnRz/a4YbrfNwFrDwQYg+GSA5oW5v/yTckg=;
 b=KeR2rGIjPnYKiKG2aILzh6gWMDTnViE8fXPWXXXixLovTbpx00/oSEAU+Q4L2OCzAK
 GRraxIbhCS4mi4IuRHOlRDlrrUGLqMd7GLM+J1Hc2/d7WSNIQDHGywQYnYEyBYPDgjiz
 uY13i1u0RDIQGheVM8QVFqtoKIkC9biCE4wbzSZrKtBJ1m2pvxKw60ny4f6bBZ/B8u0u
 Zr23UPD2YvAu/KuN+tEjHJX9M8xugOLPnNs4g2YR3PzTM6X60zVPevAOqAjIm6WKdYct
 vHLBCofCn+v7V2zJuE2kdbx3Wmz7GLi7XsxEmH7dNee6uir7hoWh+8c0e9HZN2r8BTuM
 JH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ocC0mA23fnRz/a4YbrfNwFrDwQYg+GSA5oW5v/yTckg=;
 b=d4jWMZ9JGl8/OTDiL81kCWjA05XGQSXQodTON9WRQuW5R3QfAMOwO4lOB+O/is9d9p
 jhG9gkuC+Qb3tRzLI0JDJ8um8KkRZbKitW+TINWDzHESuqMEWiNCo96QYCAjsHJIuzW2
 LxyWOFY9OD+jQFZBnxqCD44BVyHcS2HCvpQGv1o4L5Jxro65gqZaiRq/Ru06EB+GqfXs
 hb7HuPBuAe1fosWOcVveLiI8iAS8ZaAfuFGVuYu7jdE+KumK14S4EaKX0A8gfivbRhCW
 ieu426j+BwOtI1oB/682dFH5dmaxAu8fHQ3IHDOrbFDbJjLK6P04k27HLXLZ4rZj2KYR
 co8Q==
X-Gm-Message-State: ACgBeo21SHN4ndaUcBcPi21qfgF1x6fMBdUSBX5R81JntS2l/Vzko2T9
 0KYihd/nFvKsrL/1Rqzkej3bcCyEb139F+KH5is=
X-Google-Smtp-Source: AA6agR6PNo2Qc8lpj2itrEExN36xqc7ZpSaZEm3ZnHtwljImH3P9PTPtYv87hNYI8E9dEPcysm+pNwOsTzObwqbdpdc=
X-Received: by 2002:ac8:5786:0:b0:343:3051:170d with SMTP id
 v6-20020ac85786000000b003433051170dmr38497148qta.429.1662374897323; Mon, 05
 Sep 2022 03:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
 <20220905070046.46nlhczkck2ufr4x@pali>
In-Reply-To: <20220905070046.46nlhczkck2ufr4x@pali>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:47:41 +0300
Message-ID: <CAHp75VcFv7ipLqXmOwbXpY-_ccYNA9PgF0h4T8RY1Z-UNNpaTg@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] PCI: aardvark: switch to using
 devm_gpiod_get_optional()
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 USB <linux-usb@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 David Airlie <airlied@linux.ie>, linux-pci <linux-pci@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
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
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 5, 2022 at 10:02 AM Pali Roh=C3=A1r <pali@kernel.org> wrote:
> On Sunday 04 September 2022 23:30:58 Dmitry Torokhov wrote:
> > I would like to stop exporting OF-specific devm_gpiod_get_from_of_node(=
)
> > so that gpiolib can be cleaned a bit, so let's switch to the generic
> > device property API.
> >
> > I believe that the only reason the driver, instead of the standard
> > devm_gpiod_get_optional(), used devm_gpiod_get_from_of_node() is
> > because it wanted to set up a pretty consumer name for the GPIO,
>
> IIRC consumer name is not used at all.

It's. The user space tools use it as a label. So, GPIO line can have
"name" (this is provider specific) and "label" (which is consumer
specific, i.o.w. how we use this line).

...

> > +             if (ret !=3D -EPROBE_DEFER)
> > +                     dev_err(dev, "Failed to get reset-gpio: %i\n",
> > +                             ret);
> > +             return ret;

I understand that in the input subsystem maintainer's hat you don't
like dev_err_probe(), but it's a good case to have it here.

...

> > +     ret =3D gpiod_set_consumer_name(pcie->reset_gpio, "pcie1-reset");
> > +     if (ret) {
> > +             dev_err(dev, "Failed to set reset gpio name: %d\n", ret);
> > +             return ret;
> >       }

Ditto.


--=20
With Best Regards,
Andy Shevchenko
