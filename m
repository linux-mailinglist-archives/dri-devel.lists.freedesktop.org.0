Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F01705AD08C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE21210E2C7;
	Mon,  5 Sep 2022 10:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F13810E2C7
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:49:58 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id s13so2974599qvq.10
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 03:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=c2nRQWb+fQUQq5AQnrIySgvmnHVhBaOL/o7B8oGby/I=;
 b=bJcqTGACtFXLmXsUFqpw+PFDufx4FlXQ9j/RFhHUQVHKZqoTndY/JkV19g6BLOeeUo
 4hwSoSeec32Tbw+OMHEGG0r6M3e1GMJ/NJcg/FZwHW1SClzced4lWIu+/ZShrdu3JDTD
 V762GqyZZIhqeYexr860HlDH8BBXqi/Xiv+2j3KgGGGsMmOP08meZgz/a8ltQBauY42v
 3tIliUsfRb5Lb2wvCwZlmuODmHlyxQTZ+r40eHwZ7AsK+hrNiFx9jEpz+HZY8XcSMnnB
 5QEIV3Pay913kDLF3Na3+KE+sGrpwp4YFq2VvbdqUoXS9I37A0JHt+Mwwdcik+o8Vvzp
 uBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=c2nRQWb+fQUQq5AQnrIySgvmnHVhBaOL/o7B8oGby/I=;
 b=CaX2llOOn7CO1XGuD6PnPKmeiZKTas5k3xIqSlEg3ueo3U/XqSyRIeao8oJzsAtySp
 dz932YV2Nkyq5ydove0ZoMqXCaaXInSPkBW7Pss+Ii8F3O4eRQ8WZSRDAcwqHIIuPgzq
 TPug/mZYVKGMNf2l613Yv8oXA3vAUpW2/tj98vWcq1ogsxyO2ykHF4I4q8SvZBigSuhM
 r0QeX1G9iU64iaNsAu7BfCsR+30bMW0Be+HeIBeRuepzK+4g9jWg2nk/DCEceXawT8s+
 a6l5q2wqWCHNF2dhVItjbTm7lg6iGiOopTD8ZhYLf0nc3nj/EY/cDZ8zL5V7vrTGEHmj
 kNkg==
X-Gm-Message-State: ACgBeo3Q4pnffw/dLPpDnkVtoXNkBnKE5mPHuqRTu6GURkmEaLzRQb+X
 b5rNkRNBSNL95eRwKQ/W18ngTGX2ACC8ImD5cRo=
X-Google-Smtp-Source: AA6agR4zgtLgNA+6EPAv70W9Z01Gulpe7vTobIsUEmKS5Gup9hLVk95/eNnOn1IhVSGIautSBTqi9ZJMAl53duUVpgY=
X-Received: by 2002:ad4:5f8f:0:b0:4a9:b75a:e33c with SMTP id
 jp15-20020ad45f8f000000b004a9b75ae33cmr746972qvb.82.1662374997159; Mon, 05
 Sep 2022 03:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
 <20220905071902.fv4uozrsttk3mosu@pali>
In-Reply-To: <20220905071902.fv4uozrsttk3mosu@pali>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:49:21 +0300
Message-ID: <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
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

On Mon, Sep 5, 2022 at 10:23 AM Pali Roh=C3=A1r <pali@kernel.org> wrote:
> On Sunday 04 September 2022 23:30:53 Dmitry Torokhov wrote:

...

> > -             rp->reset_gpio =3D devm_gpiod_get_from_of_node(dev, port,
> > -                                                          "reset-gpios=
", 0,
> > -                                                          GPIOD_OUT_LO=
W,
> > -                                                          label);
> > +             rp->reset_gpio =3D devm_fwnode_gpiod_get(dev,
> > +                                                    of_fwnode_handle(p=
ort),
> > +                                                    "reset",
> > +                                                    GPIOD_OUT_LOW,
> > +                                                    label);
>
> Why in pci-aardvark.c for PERST# reset-gpio you have used
> devm_gpiod_get_optional() and here in pci-tegra.c you have used
> devm_fwnode_gpiod_get()? I think that PERST# logic is same in both
> drivers.

It's not the same dev and its node in this case. There is one reset
for _all_ ports, here is the reset on _per port_ basis.

--=20
With Best Regards,
Andy Shevchenko
