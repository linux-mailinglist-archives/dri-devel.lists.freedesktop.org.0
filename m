Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EA15AD0B1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CF810E28E;
	Mon,  5 Sep 2022 10:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D47D10E28E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:54:38 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id c6so3806510qvn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 03:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Kl0QJJuFrqWw0yrcvdhKbmcA1hZ+nxHWOs1loNonK4k=;
 b=BT3xLpeH3RjbxWQzTHtluGWFLcpz2c3gkUTiSpzfoPpU7gaIO6czvS8W4reMZ4cCO4
 3eMf/g+K3UKbJS6Jk0JxrWeNOy6+42NuOyskDMGWojnEiJoNCccaKDrBXpafZBuULjuW
 dYcA7PiA983MMDKcYZKgKx3pSqByFVARqZpiSeVPU2Zd8gAbIKhjyD904CbNMtAzjOUC
 uG1HJFkRMuzcZrZpIhoUBQgxwknWCtImNXXD19IvU58Ts2K5UQm4oyao9nlr1q38XCd5
 l4cO9hdybc4SBkJmevuxR16Y4XsOdXf+9PHct3p0BX/cs/X4ebLeTYqHTloP7bvoOCLm
 luuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Kl0QJJuFrqWw0yrcvdhKbmcA1hZ+nxHWOs1loNonK4k=;
 b=UVdd5rtPmdHsvgjibrW/lPNanlKg2fHL5B+2ltxm8RH+vsBtA+G0qfmd/T66yMq+JS
 2da+ueWlgnuJjdAp88vFPL9nMnKbkM8FPYoU8gNDQOjZf64F2KqyvMR7eP1eWNiNyOWC
 W6o5uLe4OMAostlqKEo1UUQWxi6ye8lynsc6pKN8BMDrnmzNVAxMnHzlPMbaoaEGycKT
 hc7un83WXUoLkyTsDwQXyFuII+3bvDE1+QRAH8znS+X5H/AVr2laKSfqxqzUvdkWLezv
 t6GGe+eVAbDzl6QvEupJVKIN+0dqD0Dq2jUdpkRrMrBluQV8AWdktg6P+rwLRUyF7IEi
 p0eQ==
X-Gm-Message-State: ACgBeo0LkuhUTNS69ts8flibcdH3sDlye+bKHsRqCB+LWPj+Lkhg3d9i
 idzEwJHU5urEHg55r5ahmAR6xwy8GfCqUn105yA=
X-Google-Smtp-Source: AA6agR5qY7QHGswD32uCDWcX3OPsA9Qr7QwZIbiYbOgQNRx+s2EA487X6YBau9sHW1SCIA7Zbx5vkCR0pqATT7Z+4Es=
X-Received: by 2002:ad4:5f8f:0:b0:4a9:b75a:e33c with SMTP id
 jp15-20020ad45f8f000000b004a9b75ae33cmr757802qvb.82.1662375277275; Mon, 05
 Sep 2022 03:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
 <20220905071902.fv4uozrsttk3mosu@pali>
 <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
In-Reply-To: <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:54:00 +0300
Message-ID: <CAHp75VfDZXzRQjTZSYO6tb3k6WDWmPz1Fpw8Y_RBx8cz79j2=Q@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] PCI: tegra: switch to using devm_fwnode_gpiod_get
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

On Mon, Sep 5, 2022 at 1:49 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Sep 5, 2022 at 10:23 AM Pali Roh=C3=A1r <pali@kernel.org> wrote:
> > On Sunday 04 September 2022 23:30:53 Dmitry Torokhov wrote:
>
> ...
>
> > > -             rp->reset_gpio =3D devm_gpiod_get_from_of_node(dev, por=
t,
> > > -                                                          "reset-gpi=
os", 0,
> > > -                                                          GPIOD_OUT_=
LOW,
> > > -                                                          label);
> > > +             rp->reset_gpio =3D devm_fwnode_gpiod_get(dev,
> > > +                                                    of_fwnode_handle=
(port),
> > > +                                                    "reset",
> > > +                                                    GPIOD_OUT_LOW,
> > > +                                                    label);
> >
> > Why in pci-aardvark.c for PERST# reset-gpio you have used
> > devm_gpiod_get_optional() and here in pci-tegra.c you have used
> > devm_fwnode_gpiod_get()? I think that PERST# logic is same in both
> > drivers.
>
> It's not the same dev and its node in this case. There is one reset
> for _all_ ports, here is the reset on _per port_ basis.

Actually I'm wrong, the aardvark has only one port (?) to serve there.
In any case, here dev =3D=3D dev->of_node, here dev !=3D port.


--=20
With Best Regards,
Andy Shevchenko
