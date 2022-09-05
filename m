Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8A75AD0AA
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 12:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4501110E2D2;
	Mon,  5 Sep 2022 10:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245C010E2D5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 10:53:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98186611CC;
 Mon,  5 Sep 2022 10:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD170C43141;
 Mon,  5 Sep 2022 10:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662375225;
 bh=KnM89UV/QXbr+bD5uW61IQuouhORuL6HjctA/n6mRg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YXsW4xMlqP5G1yqVn2Vnp7wQDcPAoNf58U0cr8myKFBfvUzkhpC+Iscqcyg5rEIhZ
 0PMTgWItYJNmw8Z400ucNJ5B0XE0lekJpX4qyetV4qePiVhpwNvYixfPDpcUp14ikB
 22T/9xIpoVj9aJjbUdIR8NPhsD59irNN093isONgtwU/IDqAU6CwhROyPAZqKJ3Ax2
 Sj/95TQsCXTmoey/B358xD1yE1qexDQ+Le/UUWfUT+rUg92OQbc5mebVHkcJj3e8vm
 1Cb0U86VmYuGN9CH7WKr97gNp1kG1ChXDQHt2IQgh1P4RW98tzTzb6AB6Z4u/ySvYP
 V7b5ELppG5LAQ==
Received: by pali.im (Postfix)
 id E35A67D7; Mon,  5 Sep 2022 12:53:41 +0200 (CEST)
Date: Mon, 5 Sep 2022 12:53:41 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 01/11] PCI: tegra: switch to using devm_fwnode_gpiod_get
Message-ID: <20220905105341.z2pjlpljitws3j6l@pali>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
 <20220905071902.fv4uozrsttk3mosu@pali>
 <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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

On Monday 05 September 2022 13:49:21 Andy Shevchenko wrote:
> On Mon, Sep 5, 2022 at 10:23 AM Pali Rohár <pali@kernel.org> wrote:
> > On Sunday 04 September 2022 23:30:53 Dmitry Torokhov wrote:
> 
> ...
> 
> > > -             rp->reset_gpio = devm_gpiod_get_from_of_node(dev, port,
> > > -                                                          "reset-gpios", 0,
> > > -                                                          GPIOD_OUT_LOW,
> > > -                                                          label);
> > > +             rp->reset_gpio = devm_fwnode_gpiod_get(dev,
> > > +                                                    of_fwnode_handle(port),
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

aardvark is single port controller. So it is basically same.
