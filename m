Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9144A8631
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 15:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D895E10F74F;
	Thu,  3 Feb 2022 14:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25F510F0FA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 14:29:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6D3B6182C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 14:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BD4C340F6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 14:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643898596;
 bh=5mRt1SaiP1Wjnc/EtyBH/TqPg5vXikmvyR5riccrZT0=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=GsZmpHuA7J6KBW6iMkXYA1czjT/2N5d66+nfNI97j1/ZkUNv8BQ0UH39Gteb5xExs
 KJfeQg9YSnloRcKTpFQd2sJP9n216+V6Ooz8AgH50i419TXzPtZHZWcSwqh1sJBnTK
 78rbmYgisEAioGm1bb/nF/vYyDpiRk+DlUvWPd+1+rPoEMeAK+u6DhPdWEIfJ/r6DG
 Taak/ee2A9kxxViEA264+NMhvBok6kgLdstuSmNwt+yObMrvomjqasPGfECXK+AfCU
 2iHUZbtSbzcj4RBqI+MJlX++7dGeGn+un61EgyGs9s+LxHioVnHsdj1M0JcJfyKTXI
 cThafSZB7nDDA==
Received: by mail-ed1-f45.google.com with SMTP id u24so6272566eds.11
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 06:29:56 -0800 (PST)
X-Gm-Message-State: AOAM5303GlyM+QPWaPXe4tbgxkyW9JtD2H4xUpqlZq4S7yetXsKUrGNt
 d6SlyUF59yu0L6FE9CrgXLku2i1xEX/+fY7pxg==
X-Google-Smtp-Source: ABdhPJymwYM9buOfY4EJdQqpJJxckrzFs4v+2o8RenvFywsV6AadtVL7aX7paD6KdXbLYlzw3dGG4qTQ5RacWWSEufQ=
X-Received: by 2002:a17:907:7f1a:: with SMTP id
 qf26mr23658276ejc.20.1643898583127; 
 Thu, 03 Feb 2022 06:29:43 -0800 (PST)
MIME-Version: 1.0
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
In-Reply-To: <20220202165315.18282-1-nick.hawkins@hpe.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 3 Feb 2022 08:29:31 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+K2t5WYE056so1iZgZr7CBKvDEjAwnJVTyUFQcK-VFSA@mail.gmail.com>
Message-ID: <CAL_Jsq+K2t5WYE056so1iZgZr7CBKvDEjAwnJVTyUFQcK-VFSA@mail.gmail.com>
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
To: nick.hawkins@hpe.com
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Wang Kefeng <wangkefeng.wang@huawei.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 verdun@hpe.com, Amit Kucheria <amitk@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, netdev <netdev@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Ard Biesheuvel <ardb@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, Hao Fang <fanghao11@huawei.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Corey Minyard <minyard@acm.org>, Anshuman Khandual <anshuman.khandual@arm.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-spi <linux-spi@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 2, 2022 at 10:55 AM <nick.hawkins@hpe.com> wrote:
>
> From: Nick Hawkins <nick.hawkins@hpe.com>
>
> GXP is the name of the HPE SoC.
> This SoC is used to implement BMC features of HPE servers
> (all ProLiant, Synergy, and many Apollo, and Superdome machines)
> It does support many features including:
>         ARMv7 architecture, and it is based on a Cortex A9 core
>         Use an AXI bus to which
>                 a memory controller is attached, as well as
>                  multiple SPI interfaces to connect boot flash,
>                  and ROM flash, a 10/100/1000 Mac engine which
>                  supports SGMII (2 ports) and RMII
>                 Multiple I2C engines to drive connectivity with a host infrastructure
>                 A video engine which support VGA and DP, as well as
>                  an hardware video encoder
>                 Multiple PCIe ports
>                 A PECI interface, and LPC eSPI
>                 Multiple UART for debug purpose, and Virtual UART for host connectivity
>                 A GPIO engine
> This Patch Includes:
>         Documentation for device tree bindings
>         Device Tree Bindings
>         GXP Timer Support
>         GXP Architecture Support
>
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  .../bindings/display/hpe,gxp-thumbnail.txt    |  21 +
>  .../devicetree/bindings/gpio/hpe,gxp-gpio.txt |  16 +
>  .../devicetree/bindings/i2c/hpe,gxp-i2c.txt   |  19 +
>  .../bindings/ipmi/hpegxp-kcs-bmc-cfg.txt      |  13 +
>  .../bindings/ipmi/hpegxp-kcs-bmc.txt          |  21 +
>  .../memory-controllers/hpe,gxp-srom.txt       |  13 +
>  .../devicetree/bindings/mtd/hpe,gxp.txt       |  16 +
>  .../bindings/net/hpe,gxp-umac-mdio.txt        |  21 +
>  .../devicetree/bindings/net/hpe,gxp-umac.txt  |  20 +
>  .../devicetree/bindings/pwm/hpe,gxp-fan.txt   |  15 +
>  .../bindings/serial/hpe,gxp-vuart-cfg.txt     |  17 +
>  .../bindings/serial/hpe,gxp-vuart.txt         |  23 +
>  .../bindings/soc/hpe/hpe,gxp-chif.txt         |  16 +
>  .../bindings/soc/hpe/hpe,gxp-csm.txt          |  14 +
>  .../bindings/soc/hpe/hpe,gxp-dbg.txt          |  18 +
>  .../bindings/soc/hpe/hpe,gxp-fn2.txt          |  20 +
>  .../bindings/soc/hpe/hpe,gxp-xreg.txt         |  19 +
>  .../devicetree/bindings/spi/hpe,gxp-spifi.txt |  76 +++
>  .../bindings/thermal/hpe,gxp-coretemp.txt     |  14 +
>  .../bindings/timer/hpe,gxp-timer.txt          |  18 +
>  .../devicetree/bindings/usb/hpe,gxp-udc.txt   |  21 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   4 +-
>  .../bindings/watchdog/hpe,gxp-wdt.txt         |  11 +

All these must be in DT schema format (yaml json-schema). See
Documentation/devicetree/bindings/submitting-patches.rst and
Documentation/devicetree/bindings/writing-schema.rst.

>  MAINTAINERS                                   |  14 +
>  arch/arm/Kconfig                              |   2 +
>  arch/arm/boot/dts/Makefile                    |   2 +
>  arch/arm/boot/dts/hpe-bmc-dl360gen10.dts      | 207 +++++++
>  arch/arm/boot/dts/hpe-gxp.dtsi                | 555 ++++++++++++++++++

Once the schemas are in place, run 'make W=1 dtbs_check' and fix the warnings.

>  arch/arm/configs/gxp_defconfig                | 243 ++++++++
>  arch/arm/mach-hpe/Kconfig                     |  21 +
>  arch/arm/mach-hpe/Makefile                    |   1 +
>  arch/arm/mach-hpe/gxp.c                       |  62 ++
>  drivers/clocksource/Kconfig                   |   8 +
>  drivers/clocksource/Makefile                  |   1 +
>  drivers/clocksource/gxp_timer.c               | 158 +++++
>  35 files changed, 1719 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/display/hpe,gxp-thumbnail.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/hpe,gxp-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/ipmi/hpegxp-kcs-bmc-cfg.txt
>  create mode 100644 Documentation/devicetree/bindings/ipmi/hpegxp-kcs-bmc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/hpe,gxp-srom.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/hpe,gxp.txt
>  create mode 100644 Documentation/devicetree/bindings/net/hpe,gxp-umac-mdio.txt
>  create mode 100644 Documentation/devicetree/bindings/net/hpe,gxp-umac.txt
>  create mode 100644 Documentation/devicetree/bindings/pwm/hpe,gxp-fan.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/hpe,gxp-vuart-cfg.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/hpe,gxp-vuart.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/hpe/hpe,gxp-chif.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/hpe/hpe,gxp-csm.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/hpe/hpe,gxp-dbg.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/hpe/hpe,gxp-fn2.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/hpe/hpe,gxp-xreg.txt
>  create mode 100644 Documentation/devicetree/bindings/spi/hpe,gxp-spifi.txt
>  create mode 100644 Documentation/devicetree/bindings/thermal/hpe,gxp-coretemp.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/hpe,gxp-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/hpe,gxp-udc.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.txt
>  create mode 100644 arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
>  create mode 100644 arch/arm/boot/dts/hpe-gxp.dtsi
>  create mode 100644 arch/arm/configs/gxp_defconfig
>  create mode 100644 arch/arm/mach-hpe/Kconfig
>  create mode 100644 arch/arm/mach-hpe/Makefile
>  create mode 100644 arch/arm/mach-hpe/gxp.c
>  create mode 100644 drivers/clocksource/gxp_timer.c
>
> diff --git a/Documentation/devicetree/bindings/display/hpe,gxp-thumbnail.txt b/Documentation/devicetree/bindings/display/hpe,gxp-thumbnail.txt
> new file mode 100644
> index 000000000000..e6d37ecce72b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/hpe,gxp-thumbnail.txt
> @@ -0,0 +1,21 @@
> +* GXP HPE VIDEO THUMBNAIL DRIVER
> +
> +Required properties:
> +- compatible: Must be "hpe,gxp-thumbnail".

What does thumbnail mean?

> +- reg       : Physical base address and length of the controller's registers.
> +- clocks    : phandle + clock specifier pair of the FB reference clock.

> +- bits-per-pixel: Bits per pixel, must be 32.
> +- width: Width in pixels, must be 800.
> +- height: Height in pixels, must be 600.
> +
> +Optional properties:
> +- lcd-supply: Regulator for LCD supply voltage.

These are all properties of a LCD panel and therefore belong in a panel binding.

> +
> +Example:
> +       thumbnail: thumbnail@c0000500 {
> +               compatible = "hpe,gxp-thumbnail";
> +               reg = <0xc0000500 0x20>;
> +               bits-per-pixel = <32>;
> +               width = <800>;
> +               height = <600>;
> +       };
> diff --git a/Documentation/devicetree/bindings/gpio/hpe,gxp-gpio.txt b/Documentation/devicetree/bindings/gpio/hpe,gxp-gpio.txt
> new file mode 100644
> index 000000000000..568d26d785d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/hpe,gxp-gpio.txt
> @@ -0,0 +1,16 @@
> +*HPE GXP GPIO INTERFACE
> +
> +Required properties:
> +- compatible: Must be "hpe,gxp-gpio".
> +- #gpio-cells: The number of cells to describe a GPIO, this should be 2.

> +- csm: Phandle to the GXP PCI CSM Controller.
> +- vuch0_handle:        Phandle to the Virtual USB Hub Controller (VUHC).

These need a vendor prefix and drop the '_handle'.

However, this should probably be a child of the CSM node instead of
using phandle.

> +
> +Example of gpio-controller nodes for a MPC8347 SoC:

Freescale MPC8347?

> +
> +       gpio: gpio {
> +               compatible = "hpe,gxp-gpio";
> +               #gpio-cells = <2>;
> +               csm_handle = <&csm>;
> +               vuhc0_handle = <&vuhc0>;
> +       };
> diff --git a/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.txt b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.txt
> new file mode 100644
> index 000000000000..cdca203f8c3b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/hpe,gxp-i2c.txt
> @@ -0,0 +1,19 @@
> +* HPE GXP I2C Interface
> +
> +Required Properties:
> +
> +  - compatible: Must be "hpe,gxp-i2c"
> +  - reg: The I2C address of the device.

Not an I2C address here.

> +  - interrupts: The interrupt number.
> +  - interrupt-parent: Interrupt controller to which the I2C bus is reporting

interrupt-parent is never required. It could be specified in the
parent node for example.

> +  - i2cg-handle: I2C Global interrupt status register handler

Vendor prefix and drop '-handle'.

> +
> +Example:
> +
> +       i2c0: i2c@c0002000 {
> +               compatible = "hpe,gxp-i2c";
> +               reg = <0xc0002000 0x70>;
> +               interrupts = <9>;
> +               interrupt-parent = <&vic0>;
> +               i2cg-handle = <&i2cg>;
> +       };
> diff --git a/Documentation/devicetree/bindings/ipmi/hpegxp-kcs-bmc-cfg.txt b/Documentation/devicetree/bindings/ipmi/hpegxp-kcs-bmc-cfg.txt
> new file mode 100644
> index 000000000000..20deef7a6be2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/hpegxp-kcs-bmc-cfg.txt
> @@ -0,0 +1,13 @@
> +* HPE GXP KCS IPMI DRIVER

Bindings are for h/w devices, not drivers.

> +
> +Required properties:
> +- compatible : Must contain "hpe,gxp-kcs-bmc-cfg", "simple-mfd", "syscon".
> +- reg : Specifies base physical address and size of the configuration registers.
> +
> +Example:
> +
> +       kcs_conf: kcs_conf@80fc0430 {
> +                       compatible = "hpe,gxp-kcs-bmc-cfg", "simple-mfd", "syscon";

No child nodes, how is this a simple-mfd?

> +                       reg = <0x80fc0430 0x100>;
> +       };
> +
> diff --git a/Documentation/devicetree/bindings/ipmi/hpegxp-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/hpegxp-kcs-bmc.txt
> new file mode 100644
> index 000000000000..137411243f3f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/hpegxp-kcs-bmc.txt
> @@ -0,0 +1,21 @@
> +* HPE GXP KCS IPMI DRIVER
> +
> +Required properties:
> +- compatible : Must contain "hpe,gxp-kcs-bmc".
> +- interrupts : The interrupt number.
> +- reg : Specifies base physical address and size of the control registers.
> +- kcs_chan : The KCS channel number in the controller.
> +- status: The status signal from the controller.
> +- kcs-bmc-cfg = Phandle to the KCS Configuration registers.
> +
> +Example:
> +
> +       kcs_reg: kcs_reg@80fd0400 {
> +               compatible = "hpe,gxp-kcs-bmc";
> +               reg = <0x80fd0400 0x8>;
> +               interrupts = <6>;
> +               interrupt-parent = <&vic1>;
> +               kcs_chan = <1>;
> +               status = "okay";

Don't show status in examples.

> +               kcs-bmc-cfg = <&kcs_conf>;
> +       };
> diff --git a/Documentation/devicetree/bindings/memory-controllers/hpe,gxp-srom.txt b/Documentation/devicetree/bindings/memory-controllers/hpe,gxp-srom.txt
> new file mode 100644
> index 000000000000..027cb6fbc93c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/hpe,gxp-srom.txt
> @@ -0,0 +1,13 @@
> +* HPE GXP SROM CONTROLLER
> +
> +Required properties:
> +
> +- compatible: Must be one of "hpe,gxp-srom", "simple-mfd", "syscon".

How is this a simple-mfd or syscon?

Should be using nvmem binding?

> +- reg: Specifies base physical address and size of the control registers.
> +
> +Example:
> +
> +       srom@80fc0000 {
> +               compatible = "hpe,gxp-srom", "simple-mfd", "syscon";
> +               reg = <0x80fc0000 0x100>;
> +       };
> diff --git a/Documentation/devicetree/bindings/mtd/hpe,gxp.txt b/Documentation/devicetree/bindings/mtd/hpe,gxp.txt
> new file mode 100644
> index 000000000000..8c6f54af0260
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/hpe,gxp.txt
> @@ -0,0 +1,16 @@
> +
> +* HPE GXP BMC
> +
> +HPE GXP SoC definition

Wrong location for this. bindings/arm/

> +
> +Required properties:
> +  - compatible : Must contain: "HPE,GXP"
> +
> +Example:
> +/ {
> +       model = "Hewlett Packard Enterprise GXP BMC";
> +       compatible = "HPE,GXP";
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +
> +}
> diff --git a/Documentation/devicetree/bindings/net/hpe,gxp-umac-mdio.txt b/Documentation/devicetree/bindings/net/hpe,gxp-umac-mdio.txt
> new file mode 100644
> index 000000000000..fa48ecb22c92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/hpe,gxp-umac-mdio.txt
> @@ -0,0 +1,21 @@
> +* HPE GXP UMAC MDIO Interface Controller
> +
> +Required properties:
> +- compatible: Must contain "hpe,gxp-umac-mdio".
> +- reg:  Specifies base physical address and size of the registers.
> +- interrupts: The interrupt number.
> +- Cells which are configuring the external phy interfaces. Numbered through relative addressing each phy is compatible with a standard ethernet-phy-ieee802.3 phy.

Wrap lines at 80 chars.

> +
> +Example:
> +
> +       mdio0: mdio@c0004080 {
> +               compatible = "hpe,gxp-umac-mdio";
> +               reg = <0xc0004080 0x10>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               ext_phy0: ethernt-phy@0 {
> +                       compatible = "ethernet-phy-ieee802.3-c22";
> +                       phy-mode = "sgmii";
> +                       reg = <0>;
> +               };
> +       };
> diff --git a/Documentation/devicetree/bindings/net/hpe,gxp-umac.txt b/Documentation/devicetree/bindings/net/hpe,gxp-umac.txt
> new file mode 100644
> index 000000000000..3a620b4ad999
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/hpe,gxp-umac.txt
> @@ -0,0 +1,20 @@
> +* HPE GXP UMAC Controller
> +
> +Required properties:
> +- compatible: Must contain "hpe,gxp-umac".
> +- reg:  Specifies base physical address and size of the registers.
> +- interrupts: The interrupt number.
> +- interrupt-parent: specify main interrupt controller handler

Drop

> +- phy-handle: Phandle to a PHY on the MDIO bus.
> +- int-phy-handle: Phandle to PHY interrupt handler.

This is odd? Should be internal PHY?

> +
> +Example:
> +
> +       umac0: umac@c0004000 {

ethernet@...

> +               compatible = "hpe,gxp-umac";
> +               reg = <0xc0004000 0x80>;
> +               interrupts = <10>;
> +               interrupt-parent = <&vic0>;
> +               phy-handle = <&ext_phy0>;
> +               int-phy-handle = <&int_phy0>;
> +       };
> diff --git a/Documentation/devicetree/bindings/pwm/hpe,gxp-fan.txt b/Documentation/devicetree/bindings/pwm/hpe,gxp-fan.txt
> new file mode 100644
> index 000000000000..21446b7cafd9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/hpe,gxp-fan.txt
> @@ -0,0 +1,15 @@
> +* HPE GXP Fan Controller
> +
> +Required properties:
> +- compatible: Must contain "hpe,gxp-fan-ctrl".
> +- reg: Physical base address and length of the controller's registers.
> +- xreg_handle: Phandle to the xregister controller for fan control.
> +- fn2_handle: Phandle to the FN2 interface.
> +
> +Example:
> +       fanctrl: fanctrl@c1000c00 {
> +                       compatible = "hpe,gxp-fan-ctrl";
> +                       reg = <0xc1000c00 0x200>;
> +                       xreg_handle = <&xreg>;
> +                       fn2_handle = <&fn2>;
> +       };
> diff --git a/Documentation/devicetree/bindings/serial/hpe,gxp-vuart-cfg.txt b/Documentation/devicetree/bindings/serial/hpe,gxp-vuart-cfg.txt
> new file mode 100644
> index 000000000000..8bad8c39d044
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/hpe,gxp-vuart-cfg.txt
> @@ -0,0 +1,17 @@
> +*HPE Virtual UART Controller CONFIGURATION
> +
> +This controller is used to forward host serial to BMC chip
> +
> +Required properties:
> +
> +- compatible : Must contain "hpe,gxp-vuarta_cfg", "simple-mfd", "syscon".

Again, how is this a simple-mfd and syscon?

> +- reg : Specifies base physical address and size of the configuration register.
> +- reg-io-width: io register width in bytes, must be 1.
> +
> +Example:
> +
> +       vuart_a_cfg: vuarta_cfg@80fc0230 {
> +               compatible = "hpe,gxp-vuarta_cfg", "simple-mfd", "syscon";
> +               reg = <0x80fc0230 0x100>;
> +               reg-io-width = <1>;
> +       };
> diff --git a/Documentation/devicetree/bindings/serial/hpe,gxp-vuart.txt b/Documentation/devicetree/bindings/serial/hpe,gxp-vuart.txt
> new file mode 100644
> index 000000000000..9c5cc14d9474
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/hpe,gxp-vuart.txt
> @@ -0,0 +1,23 @@
> +*HPE VUART Controller port
> +
> +Required properties:
> +
> +- compatible :  Must contain "hpe,gxp-vuart".
> +- reg        :  Specifies base physical address and size of the registers.
> +- interrupts :  The interrupt number.
> +- clock-frequency: The frequency of the clock input to the UART in Hz.
> +- status: The status signal from the controller.
> +
> +Example:
> +
> +       vuart_a: vuart_a@80fd0200 {

serial@...

> +               compatible = "hpe,gxp-vuart";
> +               reg = <0x80fd0200 0x100>;
> +               interrupts = <2>;
> +               interrupt-parent = <&vic1>;
> +               clock-frequency = <1846153>;
> +               reg-shift = <0>;
> +               status = "okay";
> +               serial-line = <3>;
> +               vuart_cfg = <&vuart_a_cfg>;
> +       };
> diff --git a/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-chif.txt b/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-chif.txt
> new file mode 100644
> index 000000000000..9d5a8763ca22
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-chif.txt
> @@ -0,0 +1,16 @@
> +* HPE GXP CHIF INTERFACE
> +
> +Define the basic CHannel InterFace (CHIF) communication path between BMC and Host through PCI.
> +Interrupts are handled through PCI function 2
> +
> +Required parent device properties:
> +- compatible : Should be "hpe,gxp-chif".
> +- interrupts : The interrupt number.
> +
> +Example:
> +
> +       chif {
> +                       compatible = "hpe,gxp-chif";
> +                       interrupts = <12>;

This h/w has an interrupt and no other way to interact with it?

> +               };
> +       };
> diff --git a/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-csm.txt b/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-csm.txt
> new file mode 100644
> index 000000000000..8d28fd1ec46a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-csm.txt
> @@ -0,0 +1,14 @@
> +* HPE GXP PCI CSM INTERFACE
> +
> +Required parent device properties:
> +- compatible : Should be "hpe,gxp-csm", "simple-mfd", "syscon".
> +- reg : Specifies base physical address and size of control registers.
> +
> +Example:
> +
> +       csm: csm@8000005c {
> +               compatible = "hpe,gxp-csm", "simple-mfd", "syscon";
> +               reg = <0x8000005c 0x2>, <0x800000de 0x1>, <0x800000e7 0x1>;

Need to define what each entry is.

> +       };
> +
> +
> diff --git a/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-dbg.txt b/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-dbg.txt
> new file mode 100644
> index 000000000000..39e3ed68a34d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-dbg.txt
> @@ -0,0 +1,18 @@
> +* HPE GXP DBG INTERFACE
> +
> +Specify host debug interface. Used presently to report ROM POST code during host initialization phases
> +
> +Required parent device properties:
> +- compatible : Should be "hpe,gxp-dbg".
> +- reg : Specifies base physical address and size of the control/data registers.
> +- interrupts: The interrupt number.
> +- interrupt-parent: The interrupt controller to which the interface is wired to
> +
> +Example:
> +
> +       post@800000a0 {
> +               compatible = "hpe,gxp-dbg";
> +               reg = <0x800000a0 0x20>;
> +               interrupts = <10>;
> +               interrupt-parent = <&vic1>;
> +       };
> diff --git a/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-fn2.txt b/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-fn2.txt
> new file mode 100644
> index 000000000000..eb8328f59eda
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-fn2.txt
> @@ -0,0 +1,20 @@
> +* HPE GXP PCI FN2 INTERFACE CONTROLLER
> +
> +Required parent device properties:
> +- compatible : Should be "hpe,gxp-fn2", "simple-mfd", "syscon".
> +- reg : Specifies base physical address and size of the control/data/memory mapped registers.
> +- xreg_handle : Phandle to the xregister controller interface.
> +- #gpio-cells : The number of cells to describe a GPIO, this should be 2.
> +- interrupts : interrupt number to which PCI FN2 is connected to
> +- interrupt-parets : interrupt controller to which PCI FN2 is connected to
> +
> +Example:
> +
> +       fn2: fn2@80200000 {
> +               compatible = "hpe,gxp-fn2", "simple-mfd", "syscon";
> +               reg = <0x80200000 0x100000>;
> +               xreg_handle = <&xreg>;
> +               interrupts = <0>;
> +               interrupt-parent = <&vic1>;
> +               #gpio-cells = <2>;
> +       };
> diff --git a/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-xreg.txt b/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-xreg.txt
> new file mode 100644
> index 000000000000..3ec86a478302
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/hpe/hpe,gxp-xreg.txt
> @@ -0,0 +1,19 @@
> +* HPE GXP XREG INTERFACE
> +
> +Required parent device properties:
> +- compatible : Should be "hpe,gxp-fn2", "simple-mfd", "syscon".
> +- reg : Specifies base physical address and size of the control registers.
> +- interrupts: The interrupt number.
> +- interrupt-parent: main interrupt controller to which xreg is connected to
> +- #gpio-cells : The number of cells to describe a GPIO, this should be 2.
> +
> +Example:
> +
> +       xreg: xreg@d1000300 {
> +               compatible = "hpe,gxp-xreg", "simple-mfd", "syscon";
> +               reg = <0xd1000300 0xFF>;
> +               interrupts = <26>;
> +               interrupt-parent = <&vic0>;
> +               #gpio-cells = <2>;
> +       };
> +
> diff --git a/Documentation/devicetree/bindings/spi/hpe,gxp-spifi.txt b/Documentation/devicetree/bindings/spi/hpe,gxp-spifi.txt
> new file mode 100644
> index 000000000000..78eac0ac82f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/hpe,gxp-spifi.txt
> @@ -0,0 +1,76 @@
> +* HPE GXP SPI FLASH INTERFACE
> +
> +Required properties:
> +  - compatible : Must contain: "hpe,gxp-spifi"
> +  - reg : the first contains the control register location and length,
> +          the second contains the memory window mapping address and length,
> +                 the third contains the configuration register location and length
> +  - interrupts: The interrupt number.
> +  - #address-cells : must be 1 corresponding to chip select child binding
> +  - #size-cells : must be 0 corresponding to chip select child binding
> +
> +The child nodes are the SPI flash modules which must have a compatible
> +property as specified in bindings/mtd/jedec,spi-nor.txt
> +
> +Example:
> +       spifi0: spifi@c0000200 {

spi@...

> +               compatible = "hpe,gxp-spifi";
> +               reg = <0xc0000200 0x80>, <0xc000c000 0x100>, <0xf8000000 0x8000000>;
> +               interrupts = <20>;
> +               interrupt-parent = <&vic0>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               flash@0 {
> +                       compatible = "jedec,spi-nor";
> +                       reg = <0>;
> +                       partitions {
> +                               compatible = "fixed-partitions";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +
> +                               u-boot@0 {
> +                                       label = "u-boot";
> +                                       reg = <0x0 0x60000>;
> +                               };
> +                               u-boot-env@60000 {
> +                                       label = "u-boot-env";
> +                                       reg = <0x60000 0x20000>;
> +                               };
> +                               kernel@80000 {
> +                                       label = "kernel";
> +                                       reg = <0x80000 0x4c0000>;
> +                               };
> +                               rofs@540000 {
> +                                       label = "rofs";
> +                                       reg = <0x540000 0x1740000>;
> +                               };
> +                               rwfs@1c80000 {
> +                                       label = "rwfs";
> +                                       reg = <0x1c80000 0x250000>;
> +                               };
> +                               section@1edf000{
> +                                       label = "section";
> +                                       reg = <0x1ed0000 0x130000>;
> +                               };
> +                       };
> +               };
> +
> +               flash@1 {
> +                       compatible = "jedec,spi-nor";
> +                       reg = <1>;
> +                       partitions {
> +                               compatible = "fixed-partitions";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               host-prime@0 {
> +                                       label = "host-prime";
> +                                       reg = <0x0 0x02000000>;
> +                               };
> +                               host-second@2000000 {
> +                                       label = "host-second";
> +                                       reg = <0x02000000 0x02000000>;
> +                               };
> +                       };
> +               };
> +       };
> diff --git a/Documentation/devicetree/bindings/thermal/hpe,gxp-coretemp.txt b/Documentation/devicetree/bindings/thermal/hpe,gxp-coretemp.txt
> new file mode 100644
> index 000000000000..bc83db03166a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/hpe,gxp-coretemp.txt
> @@ -0,0 +1,14 @@
> +* HPE GXP CORETEMP INTERFACE
> +
> +Required parent device properties:
> +- compatible : Should be "hpe,gxp-coretemp".
> +- reg : Specifies base physical address and size of the control register.
> +
> +Example:
> +
> +       coretemp: coretemp@c0000130 {
> +               compatible = "hpe,gxp-coretemp";
> +               reg = <0xc0000130 0x8>;

A couple of registers at a un-aligned address. This appears to be part
of some larger block. It should be a child node of that block. Same
thing applies elsewhere.

> +       };
> +
> +
> diff --git a/Documentation/devicetree/bindings/timer/hpe,gxp-timer.txt b/Documentation/devicetree/bindings/timer/hpe,gxp-timer.txt
> new file mode 100644
> index 000000000000..3e491b8ea740
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/hpe,gxp-timer.txt
> @@ -0,0 +1,18 @@
> +*HPE GXP TIMER
> +
> +Required properties:
> +
> +- compatible : Must be "hpe,gxp-timer"
> +- reg : The GXP Timer Control Registers (Addresses + size) tuples list.
> +- interrupts : The interrupt number.
> +- clock-frequency : The frequency of the clock that drives the counter, in Hz.
> +
> +Example:
> +
> +       timer0: timer@c0000080 {
> +               compatible = "hpe,gxp-timer";
> +               reg = <0xc0000080 0x1>, <0xc0000094 0x01>, <0xc0000088 0x08>;
> +               interrupts = <0>;
> +               interrupt-parent = <&vic0>;
> +               clock-frequency = <400000000>;
> +       };
> diff --git a/Documentation/devicetree/bindings/usb/hpe,gxp-udc.txt b/Documentation/devicetree/bindings/usb/hpe,gxp-udc.txt
> new file mode 100644
> index 000000000000..ed764d64a169
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/hpe,gxp-udc.txt
> @@ -0,0 +1,21 @@
> +* HPE USB Device Port Controller
> +
> +Required properties:
> +- compatible: Must be "hpe,gxp-udc".
> +- reg: Specifies base physical address and size of the registers.
> +- interrupts: The interrupt number.
> +- vdevnum: The particular usb device controller port.
> +- fepnum: The particular usb device controller options.
> +- udcg-handle: The usb device controller hub.
> +
> +Example:
> +
> +       udc0: udc@80401000 {
> +               compatible = "hpe,gxp-udc";
> +               reg = <0x80401000 0x1000>;
> +               interrupts = <13>;
> +               interrupt-parent = <&vic1>;
> +               vdevnum = <0>;
> +               fepnum = <7>;
> +               udcg-handle = <&udcg>;
> +       };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 294093d45a23..913f722a6b8d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -514,7 +514,9 @@ patternProperties:
>    "^hoperun,.*":
>      description: Jiangsu HopeRun Software Co., Ltd.
>    "^hp,.*":
> -    description: Hewlett Packard
> +    description: Hewlett Packard Inc.

Why are you changing this one?

> +  "^hpe,.*":

You used HPE elsewhere... Lowercase is preferred.

> +    description: Hewlett Packard Enterprise
>    "^hsg,.*":
>      description: HannStar Display Co.
>    "^holtek,.*":
> diff --git a/Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.txt b/Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.txt
> new file mode 100644
> index 000000000000..3f17c1a00a5c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.txt
> @@ -0,0 +1,11 @@
> +* HPE GXP Controlled Watchdog
> +
> +Required Properties:
> +- compatible: Should contain "hpe,gxp-wdt".
> +- reg: The GXP Watchdog Control Registers (Addresses + size) tuples list.
> +
> +Example:
> +       watchdog: watchdog@c0000090 {
> +               compatible = "hpe,gxp-wdt";
> +               reg = <0xc0000090 0x02>, <0xc0000096 0x01>;
> +       };

[...]

> index 000000000000..cc63f2be6c9c
> --- /dev/null
> +++ b/arch/arm/mach-hpe/Kconfig
> @@ -0,0 +1,21 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menuconfig ARCH_HPE
> +       bool "HPE SoC support"
> +       help
> +         This enables support for HPE ARM based SoC chips
> +if ARCH_HPE
> +
> +config ARCH_HPE_GXP
> +       bool "HPE GXP SoC"
> +       select ARM_VIC
> +       select PINCTRL
> +       select IRQ_DOMAIN
> +       select GENERIC_IRQ_CHIP

The irq chip that uses this should select it.

> +       select MULTI_IRQ_HANDLER
> +       select SPARSE_IRQ
> +       select CLKSRC_MMIO

Same here.

> +       depends on ARCH_MULTI_V7
> +       help
> +         Support for GXP SoCs
> +
> +endif
> diff --git a/arch/arm/mach-hpe/Makefile b/arch/arm/mach-hpe/Makefile
> new file mode 100644
> index 000000000000..8b0a91234df4
> --- /dev/null
> +++ b/arch/arm/mach-hpe/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_ARCH_HPE_GXP) += gxp.o
> diff --git a/arch/arm/mach-hpe/gxp.c b/arch/arm/mach-hpe/gxp.c
> new file mode 100644
> index 000000000000..a37838247948
> --- /dev/null
> +++ b/arch/arm/mach-hpe/gxp.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2022 Hewlett-Packard Enterprise Development Company, L.P.
> + *
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +
> +#include <linux/init.h>
> +#include <asm/mach/arch.h>
> +#include <asm/mach/map.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clocksource.h>
> +
> +#define IOP_REGS_PHYS_BASE 0xc0000000
> +#define IOP_REGS_VIRT_BASE 0xf0000000
> +#define IOP_REGS_SIZE (240*SZ_1M)

You just mapped 240M into lowmem of which there is only about 700M.
Depending on your RAM size, you won't have much vmalloc space.

In any case, don't create static mappings unless you need the mapping
before ioremap is available. That doesn't appear to be the case here.

> +
> +#define IOP_EHCI_USBCMD 0x0efe0010
> +
> +static struct map_desc gxp_io_desc[] __initdata = {
> +       {
> +       .virtual        = (unsigned long)IOP_REGS_VIRT_BASE,
> +       .pfn            = __phys_to_pfn(IOP_REGS_PHYS_BASE),
> +       .length         = IOP_REGS_SIZE,
> +       .type           = MT_DEVICE,
> +       },
> +};
> +
> +void __init gxp_map_io(void)
> +{
> +       iotable_init(gxp_io_desc, ARRAY_SIZE(gxp_io_desc));
> +}
> +
> +static void __init gxp_dt_init(void)
> +{
> +       /*reset EHCI host controller for clear start*/
> +       __raw_writel(0x00080002,
> +               (void __iomem *)(IOP_REGS_VIRT_BASE + IOP_EHCI_USBCMD));

Maybe you should use the reset controller binding and subsystem. Or
make the bootloader do this.

> +       of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);

You don't need to call this, the core code already does.

> +}
> +
> +static void gxp_restart(enum reboot_mode mode, const char *cmd)
> +{
> +       __raw_writel(1, (void __iomem *) IOP_REGS_VIRT_BASE);
> +}
> +
> +static const char * const gxp_board_dt_compat[] = {
> +       "HPE,GXP",
> +       NULL,
> +};
> +
> +DT_MACHINE_START(GXP_DT, "HPE GXP")
> +       .init_machine   = gxp_dt_init,
> +       .map_io         = gxp_map_io,
> +       .restart        = gxp_restart,
> +       .dt_compat      = gxp_board_dt_compat,
> +MACHINE_END
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index cfb8ea0df3b1..5916dade7608 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -617,6 +617,14 @@ config CLKSRC_ST_LPC
>           Enable this option to use the Low Power controller timer
>           as clocksource.
>
> +config GXP_TIMER
> +       bool "GXP timer driver"
> +       depends on ARCH_HPE

|| COMPILE_TEST

(And check !arm builds)

> +       default y
> +       help
> +         Provides a driver for the timer control found on HPE
> +         GXP SOCs. This is required for all GXP SOCs.
> +
>  config ATCPIT100_TIMER
>         bool "ATCPIT100 timer driver"
>         depends on NDS32 || COMPILE_TEST
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index fa5f624eadb6..ffca09ec34de 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -89,3 +89,4 @@ obj-$(CONFIG_GX6605S_TIMER)           += timer-gx6605s.o
>  obj-$(CONFIG_HYPERV_TIMER)             += hyperv_timer.o
>  obj-$(CONFIG_MICROCHIP_PIT64B)         += timer-microchip-pit64b.o
>  obj-$(CONFIG_MSC313E_TIMER)            += timer-msc313e.o
> +obj-$(CONFIG_GXP_TIMER)                        += gxp_timer.o
> diff --git a/drivers/clocksource/gxp_timer.c b/drivers/clocksource/gxp_timer.c
> new file mode 100644
> index 000000000000..e3c617036e0d
> --- /dev/null
> +++ b/drivers/clocksource/gxp_timer.c
> @@ -0,0 +1,158 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2022 Hewlett-Packard Enterprise Development Company, L.P.
> + *
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clockchips.h>
> +#include <linux/clocksource.h>
> +#include <linux/interrupt.h>
> +#include <linux/irqreturn.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/sched_clock.h>
> +
> +#include <asm/irq.h>

Using 'asm' includes is often wrong.

> +
> +#define TIMER0_FREQ 1000000
> +#define TIMER1_FREQ 1000000
> +
> +#define MASK_TCS_ENABLE                0x01
> +#define MASK_TCS_PERIOD                0x02
> +#define MASK_TCS_RELOAD                0x04
> +#define MASK_TCS_TC            0x80
> +
> +struct gxp_timer {
> +       void __iomem *counter;
> +       void __iomem *control;
> +       struct clock_event_device evt;
> +};
> +
> +static void __iomem *system_clock __read_mostly;
> +
> +static u64 notrace gxp_sched_read(void)
> +{
> +       return readl_relaxed(system_clock);
> +}
> +
> +static int gxp_time_set_next_event(unsigned long event,
> +                                       struct clock_event_device *evt_dev)
> +{
> +       struct gxp_timer *timer = container_of(evt_dev, struct gxp_timer, evt);
> +       /*clear TC by write 1 and disable timer int and counting*/
> +       writeb_relaxed(MASK_TCS_TC, timer->control);
> +       /*update counter value*/
> +       writel_relaxed(event, timer->counter);
> +       /*enable timer counting and int*/
> +       writeb_relaxed(MASK_TCS_TC|MASK_TCS_ENABLE, timer->control);
> +
> +       return 0;
> +}
> +
> +static irqreturn_t gxp_time_interrupt(int irq, void *dev_id)
> +{
> +       struct gxp_timer *timer = dev_id;
> +       void (*event_handler)(struct clock_event_device *timer);
> +
> +
> +       if (readb_relaxed(timer->control) & MASK_TCS_TC) {
> +               writeb_relaxed(MASK_TCS_TC, timer->control);
> +
> +               event_handler = READ_ONCE(timer->evt.event_handler);
> +               if (event_handler)
> +                       event_handler(&timer->evt);
> +               return IRQ_HANDLED;
> +       } else {
> +               return IRQ_NONE;
> +       }
> +}
> +
> +static int __init gxp_timer_init(struct device_node *node)
> +{
> +       void __iomem *base_counter;
> +       void __iomem *base_control;
> +       u32 freq;
> +       int ret, irq;
> +       struct gxp_timer *gxp_timer;
> +
> +       base_counter = of_iomap(node, 0);
> +       if (!base_counter) {
> +               pr_err("Can't remap counter registers");
> +               return -ENXIO;
> +       }
> +
> +       base_control = of_iomap(node, 1);
> +       if (!base_control) {
> +               pr_err("Can't remap control registers");
> +               return -ENXIO;
> +       }
> +
> +       system_clock = of_iomap(node, 2);
> +       if (!system_clock) {
> +               pr_err("Can't remap control registers");
> +               return -ENXIO;
> +       }
> +
> +       if (of_property_read_u32(node, "clock-frequency", &freq)) {
> +               pr_err("Can't read clock-frequency\n");
> +               goto err_iounmap;
> +       }
> +
> +       sched_clock_register(gxp_sched_read, 32, freq);
> +       clocksource_mmio_init(system_clock, node->name, freq,
> +                               300, 32, clocksource_mmio_readl_up);
> +
> +       irq = irq_of_parse_and_map(node, 0);
> +       if (irq <= 0) {
> +               ret = -EINVAL;
> +               pr_err("GXP Timer Can't parse IRQ %d", irq);
> +               goto err_iounmap;
> +       }
> +
> +       gxp_timer = kzalloc(sizeof(*gxp_timer), GFP_KERNEL);
> +       if (!gxp_timer) {
> +               ret = -ENOMEM;
> +               goto err_iounmap;
> +       }
> +
> +       gxp_timer->counter = base_counter;
> +       gxp_timer->control = base_control;
> +       gxp_timer->evt.name = node->name;
> +       gxp_timer->evt.rating = 300;
> +       gxp_timer->evt.features = CLOCK_EVT_FEAT_ONESHOT;
> +       gxp_timer->evt.set_next_event = gxp_time_set_next_event;
> +       gxp_timer->evt.cpumask = cpumask_of(0);
> +
> +       if (request_irq(irq, gxp_time_interrupt, IRQF_TIMER | IRQF_SHARED,
> +               node->name, gxp_timer)) {
> +               pr_err("%s: request_irq() failed\n", "GXP Timer Tick");
> +               goto err_timer_free;
> +       }
> +
> +       clockevents_config_and_register(&gxp_timer->evt, TIMER0_FREQ,
> +                                       0xf, 0xffffffff);
> +
> +       pr_info("gxp: system timer (irq = %d)\n", irq);
> +       return 0;
> +
> +
> +err_timer_free:
> +       kfree(gxp_timer);
> +
> +err_iounmap:
> +       iounmap(system_clock);
> +       iounmap(base_control);
> +       iounmap(base_counter);
> +       return ret;
> +}
> +
> +TIMER_OF_DECLARE(gxp, "hpe,gxp-timer", gxp_timer_init);
> --
> 2.17.1
>
