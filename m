Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE474A7D69
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 02:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C81110E7C9;
	Thu,  3 Feb 2022 01:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1038 seconds by postgrey-1.36 at gabe;
 Thu, 03 Feb 2022 01:28:20 UTC
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD73E10E7C0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 01:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=5hB4xZfLGfPF68sFnaphimiyN3Dvoyj649Ifdg6NzMk=; b=2650jDKWUISCHWTrw+2qSb29hf
 Eg0kIWNamRCUEsMC3LfeWZNitulODz/nCXrDMPmXFPMUE72VH61hPSx5uwNVoOZnrOvRJe9UHfori
 IRhH/NKpS6Y8uLmfet+KJgbH4rzTYuyCthmjEIni6imLGrzK8nnQnLlUntVfmlaQkEJ0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nFQdR-0042dQ-Py; Thu, 03 Feb 2022 02:10:05 +0100
Date: Thu, 3 Feb 2022 02:10:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: nick.hawkins@hpe.com
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
Message-ID: <YfsrbcgPb5de3Bvw@lunn.ch>
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202165315.18282-1-nick.hawkins@hpe.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Wang Kefeng <wangkefeng.wang@huawei.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 verdun@hpe.com, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 netdev@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, Stanislav Jakubek <stano.jakubek@gmail.com>,
 Hao Fang <fanghao11@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-pwm@vger.kernel.org,
 linux-serial@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Corey Minyard <minyard@acm.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-gpio@vger.kernel.org,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>  .../bindings/display/hpe,gxp-thumbnail.txt    |  21 +
>  .../devicetree/bindings/gpio/hpe,gxp-gpio.txt |  16 +
>  .../devicetree/bindings/i2c/hpe,gxp-i2c.txt   |  19 +
>  .../bindings/ipmi/hpegxp-kcs-bmc-cfg.txt      |  13 +
>  .../bindings/ipmi/hpegxp-kcs-bmc.txt          |  21 +

Hi Nick

In addiiton to the other feedback also given, for new bindings you
should be using yaml, not txt. You then gain validation of the
bindings.

	Andrew

