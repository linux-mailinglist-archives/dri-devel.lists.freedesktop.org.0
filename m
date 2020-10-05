Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B38EE283E67
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 20:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA69D89B06;
	Mon,  5 Oct 2020 18:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1808489AB6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 18:38:36 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id 16so2083853oix.9
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 11:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FKBuvtLQAdMRryG6abzok93hEZkfxfk1NvbdtZDThTc=;
 b=ZCPO21sf7l5y5ajtoiStpMFBADkXpUvYZbfjJUGHmoQWDbsQdoyGMeOeSfiEbTsJ0G
 AbDz4EQfjnZ8mSIiOJJ9pvMqgcnRKbzyioiCrQwdvD5OYL7ymxQI5DgxNrx4bdtknII+
 Hsh73rN/tZetZueTjfJlWisbMkZJ7PvcO49S0ujGBMq7ysDeKCCtorTHYFVyKXUPF3PN
 l8c4oqlDprKROxIyoBX1BNWd8pxzFSEM3xpQdqyzLBJeLQrGwNGIjuX4fl2/b+Aet55U
 XOIGkU083Xe+CoUMU8h24rnZHBrdt0L7cR6NQj27c8pbefXLJyvX43Jih0JZhdJyzi6J
 pJ4Q==
X-Gm-Message-State: AOAM5324FBC5jZVOvBntDsnIkHy2+MPSJJzDCRYtcEns84rDTexJ2MH3
 oKC2UHZLjY7ldP/lu4Ck9A==
X-Google-Smtp-Source: ABdhPJwtSa8Y/I6DT15kFb+c+yKVzbdUj3v7XcBfx5+TPJ0mpN3ESYoYQunOScJs66Yn+dcB/iKTAA==
X-Received: by 2002:aca:50d2:: with SMTP id e201mr416333oib.31.1601923115204; 
 Mon, 05 Oct 2020 11:38:35 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id z25sm143140otq.31.2020.10.05.11.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 11:38:34 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] dt-bindings: additional/unevaluatedProperties clean-ups
Date: Mon,  5 Oct 2020 13:38:26 -0500
Message-Id: <20201005183830.486085-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-usb@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-rtc@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The default behavior for json-schema is any unknown property is allowed.
That is generally not the behavior we want for DT. In order to disallow
extra properties, schemas need to define 'additionalProperties: false'
typically. Ideally, we'd just add that automatically with the tools, but
there are some exceptions so only making things explicit everywhere
really works. Missing 'additionalProperties' or 'unevaluatedProperties'
has been a constant source of review comments, so a meta-schema check is
really needed here.

Once this series is in place, the meta-schema can be updated with a
check. The rule is if there's a $ref to another schema, then either
'additionalProperties' or 'unevaluatedProperties' is required. If not,
then 'additionalProperties' is required.

Rob


Rob Herring (4):
  dt-bindings: Add missing 'unevaluatedProperties'
  dt-bindings: Use 'additionalProperties' instead of
    'unevaluatedProperties'
  dt-bindings: Explicitly allow additional properties in board/SoC
    schemas
  dt-bindings: Explicitly allow additional properties in common schemas

 Documentation/devicetree/bindings/arm/actions.yaml     |  2 ++
 Documentation/devicetree/bindings/arm/altera.yaml      |  3 +++
 Documentation/devicetree/bindings/arm/amazon,al.yaml   |  2 ++
 Documentation/devicetree/bindings/arm/amlogic.yaml     |  3 +++
 .../devicetree/bindings/arm/arm,integrator.yaml        |  2 ++
 .../devicetree/bindings/arm/arm,realview.yaml          |  2 ++
 .../devicetree/bindings/arm/arm,versatile.yaml         |  2 ++
 .../devicetree/bindings/arm/arm,vexpress-juno.yaml     |  2 ++
 Documentation/devicetree/bindings/arm/atmel-at91.yaml  |  2 ++
 Documentation/devicetree/bindings/arm/axxia.yaml       |  2 ++
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,bcm11351.yaml     |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,bcm21664.yaml     |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,bcm23550.yaml     |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,bcm4708.yaml      |  3 +++
 .../devicetree/bindings/arm/bcm/brcm,cygnus.yaml       |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,hr2.yaml          |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,ns2.yaml          |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,nsp.yaml          |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,stingray.yaml     |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml   |  2 ++
 Documentation/devicetree/bindings/arm/bitmain.yaml     |  3 +++
 Documentation/devicetree/bindings/arm/calxeda.yaml     |  2 ++
 .../devicetree/bindings/arm/coresight-cti.yaml         |  2 ++
 Documentation/devicetree/bindings/arm/cpus.yaml        |  2 ++
 Documentation/devicetree/bindings/arm/digicolor.yaml   |  2 ++
 Documentation/devicetree/bindings/arm/fsl.yaml         |  2 ++
 .../devicetree/bindings/arm/hisilicon/hisilicon.yaml   |  3 +++
 .../devicetree/bindings/arm/intel,keembay.yaml         |  3 +++
 .../devicetree/bindings/arm/intel-ixp4xx.yaml          |  2 ++
 .../bindings/arm/keystone/ti,k3-sci-common.yaml        |  2 ++
 .../devicetree/bindings/arm/marvell/armada-7k-8k.yaml  |  2 ++
 Documentation/devicetree/bindings/arm/mediatek.yaml    |  3 +++
 .../devicetree/bindings/arm/microchip,sparx5.yaml      |  2 ++
 Documentation/devicetree/bindings/arm/moxart.yaml      |  1 +
 Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml   |  3 +++
 Documentation/devicetree/bindings/arm/mstar/mstar.yaml |  2 ++
 .../bindings/arm/nvidia,tegra194-ccplex.yaml           |  2 ++
 Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml |  2 ++
 Documentation/devicetree/bindings/arm/qcom.yaml        |  2 ++
 Documentation/devicetree/bindings/arm/rda.yaml         |  2 ++
 Documentation/devicetree/bindings/arm/realtek.yaml     |  3 +++
 Documentation/devicetree/bindings/arm/renesas.yaml     |  2 ++
 Documentation/devicetree/bindings/arm/rockchip.yaml    |  3 +++
 .../bindings/arm/samsung/samsung-boards.yaml           |  2 ++
 Documentation/devicetree/bindings/arm/sirf.yaml        |  3 +++
 .../devicetree/bindings/arm/socionext/milbeaut.yaml    |  3 +++
 .../devicetree/bindings/arm/socionext/uniphier.yaml    |  2 ++
 Documentation/devicetree/bindings/arm/spear.yaml       |  3 +++
 Documentation/devicetree/bindings/arm/sprd/sprd.yaml   |  2 ++
 Documentation/devicetree/bindings/arm/sti.yaml         |  3 +++
 .../devicetree/bindings/arm/stm32/st,mlahb.yaml        |  2 ++
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml |  3 +++
 Documentation/devicetree/bindings/arm/sunxi.yaml       |  2 ++
 Documentation/devicetree/bindings/arm/tegra.yaml       |  2 ++
 Documentation/devicetree/bindings/arm/ti/nspire.yaml   |  3 +++
 .../devicetree/bindings/arm/ti/ti,davinci.yaml         |  3 +++
 Documentation/devicetree/bindings/arm/ux500.yaml       |  2 ++
 Documentation/devicetree/bindings/arm/vt8500.yaml      |  3 +++
 Documentation/devicetree/bindings/arm/xilinx.yaml      |  2 ++
 Documentation/devicetree/bindings/arm/zte.yaml         |  2 ++
 .../devicetree/bindings/ata/faraday,ftide010.yaml      |  2 ++
 Documentation/devicetree/bindings/ata/pata-common.yaml |  2 ++
 Documentation/devicetree/bindings/ata/sata-common.yaml |  2 ++
 Documentation/devicetree/bindings/bus/renesas,bsc.yaml |  2 ++
 .../devicetree/bindings/bus/simple-pm-bus.yaml         |  2 ++
 .../bindings/chrome/google,cros-ec-typec.yaml          |  2 ++
 .../devicetree/bindings/clock/baikal,bt1-ccu-div.yaml  |  6 +++++-
 .../devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml  |  2 +-
 .../devicetree/bindings/clock/imx8m-clock.yaml         |  2 +-
 .../devicetree/bindings/connector/usb-connector.yaml   |  2 ++
 .../bindings/display/bridge/snps,dw-mipi-dsi.yaml      |  2 ++
 .../devicetree/bindings/display/dsi-controller.yaml    |  2 ++
 .../devicetree/bindings/display/panel/lvds.yaml        |  2 ++
 .../bindings/display/panel/panel-common.yaml           |  2 ++
 .../devicetree/bindings/display/panel/tpo,tpg110.yaml  |  2 ++
 Documentation/devicetree/bindings/dma/dma-common.yaml  |  2 ++
 .../devicetree/bindings/dma/dma-controller.yaml        |  2 ++
 Documentation/devicetree/bindings/dma/dma-router.yaml  |  2 ++
 Documentation/devicetree/bindings/dma/ingenic,dma.yaml |  2 ++
 .../devicetree/bindings/dma/st,stm32-dma.yaml          |  2 ++
 .../devicetree/bindings/dma/st,stm32-dmamux.yaml       |  2 ++
 .../devicetree/bindings/dma/st,stm32-mdma.yaml         |  2 ++
 Documentation/devicetree/bindings/dma/ti/k3-udma.yaml  |  2 ++
 .../devicetree/bindings/extcon/wlf,arizona.yaml        |  2 ++
 .../devicetree/bindings/hwmon/baikal,bt1-pvt.yaml      |  4 ++--
 .../devicetree/bindings/i2c/amlogic,meson6-i2c.yaml    |  2 ++
 .../devicetree/bindings/i2c/cdns,i2c-r1p10.yaml        |  2 ++
 Documentation/devicetree/bindings/i2c/i2c-gpio.yaml    |  2 ++
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml    |  2 ++
 .../bindings/i2c/socionext,uniphier-fi2c.yaml          |  2 ++
 .../bindings/i2c/socionext,uniphier-i2c.yaml           |  2 ++
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml          |  2 ++
 .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml   |  2 ++
 .../devicetree/bindings/iio/accel/adi,adis16240.yaml   |  4 ++++
 .../devicetree/bindings/iio/accel/adi,adxl345.yaml     |  4 ++++
 .../devicetree/bindings/iio/accel/adi,adxl372.yaml     |  4 ++++
 .../devicetree/bindings/iio/adc/adi,ad7124.yaml        |  4 ++++
 .../devicetree/bindings/iio/adc/adi,ad7192.yaml        |  4 ++++
 .../devicetree/bindings/iio/adc/adi,ad7292.yaml        |  4 ++++
 .../devicetree/bindings/iio/adc/adi,ad7606.yaml        |  6 ++++++
 .../devicetree/bindings/iio/adc/adi,ad7923.yaml        |  4 ++++
 .../devicetree/bindings/iio/adc/maxim,max1241.yaml     |  4 ++++
 .../bindings/iio/adc/samsung,exynos-adc.yaml           |  5 ++++-
 Documentation/devicetree/bindings/iio/common.yaml      |  2 ++
 .../devicetree/bindings/iio/dac/adi,ad5770r.yaml       | 10 ++++++++++
 .../devicetree/bindings/iio/frequency/adf4371.yaml     |  4 ++++
 .../devicetree/bindings/iio/imu/adi,adis16460.yaml     |  4 ++++
 .../devicetree/bindings/iio/imu/adi,adis16475.yaml     |  2 ++
 .../devicetree/bindings/iio/imu/bosch,bmi160.yaml      |  4 ++++
 .../devicetree/bindings/iio/imu/nxp,fxos8700.yaml      |  4 ++++
 .../devicetree/bindings/input/fsl,mpr121-touchkey.yaml |  2 ++
 Documentation/devicetree/bindings/input/input.yaml     |  2 ++
 .../devicetree/bindings/input/matrix-keymap.yaml       |  2 ++
 .../bindings/input/touchscreen/touchscreen.yaml        |  2 ++
 .../bindings/interrupt-controller/loongson,htpic.yaml  |  2 ++
 .../interrupt-controller/loongson,liointc.yaml         |  2 ++
 .../bindings/interrupt-controller/mti,gic.yaml         |  2 +-
 Documentation/devicetree/bindings/leds/common.yaml     |  2 ++
 .../bindings/leds/leds-class-multicolor.yaml           |  3 +++
 .../devicetree/bindings/leds/trigger-source.yaml       |  2 ++
 Documentation/devicetree/bindings/media/rc.yaml        |  2 ++
 .../bindings/memory-controllers/renesas,rpc-if.yaml    |  2 ++
 .../devicetree/bindings/mfd/cirrus,lochnagar.yaml      | 10 +++++++++-
 Documentation/devicetree/bindings/mfd/syscon.yaml      |  2 +-
 .../bindings/mfd/ti,j721e-system-controller.yaml       |  5 ++++-
 .../devicetree/bindings/mips/ingenic/devices.yaml      |  3 +++
 .../devicetree/bindings/mips/loongson/devices.yaml     |  3 +++
 .../devicetree/bindings/misc/olpc,xo1.75-ec.yaml       |  4 +++-
 .../devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml |  2 ++
 Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml  |  2 ++
 Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml |  2 ++
 .../devicetree/bindings/mmc/mmc-controller.yaml        |  2 ++
 Documentation/devicetree/bindings/mmc/owl-mmc.yaml     |  2 ++
 .../devicetree/bindings/mmc/rockchip-dw-mshc.yaml      |  2 ++
 Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml   |  2 ++
 .../devicetree/bindings/mmc/socionext,uniphier-sd.yaml |  2 ++
 .../bindings/mmc/synopsys-dw-mshc-common.yaml          |  2 ++
 .../devicetree/bindings/mmc/synopsys-dw-mshc.yaml      |  2 ++
 Documentation/devicetree/bindings/mtd/denali,nand.yaml |  2 ++
 .../devicetree/bindings/mtd/ingenic,nand.yaml          |  2 ++
 .../devicetree/bindings/mtd/nand-controller.yaml       |  2 ++
 .../devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml    |  2 ++
 Documentation/devicetree/bindings/net/adi,adin.yaml    |  2 ++
 .../devicetree/bindings/net/amlogic,meson-dwmac.yaml   |  2 ++
 .../devicetree/bindings/net/aspeed,ast2600-mdio.yaml   |  2 ++
 .../devicetree/bindings/net/can/can-transceiver.yaml   |  2 ++
 Documentation/devicetree/bindings/net/dsa/dsa.yaml     |  2 ++
 .../devicetree/bindings/net/ethernet-controller.yaml   |  2 ++
 .../devicetree/bindings/net/ethernet-phy.yaml          |  2 ++
 .../devicetree/bindings/net/marvell,mvusb.yaml         |  2 ++
 Documentation/devicetree/bindings/net/mdio.yaml        |  2 ++
 .../devicetree/bindings/net/mediatek,star-emac.yaml    |  2 ++
 Documentation/devicetree/bindings/net/nxp,tja11xx.yaml |  2 ++
 Documentation/devicetree/bindings/net/qca,ar71xx.yaml  |  2 ++
 Documentation/devicetree/bindings/net/qca,ar803x.yaml  |  2 ++
 .../devicetree/bindings/net/qcom,ipq4019-mdio.yaml     |  2 ++
 .../devicetree/bindings/net/qcom,ipq8064-mdio.yaml     |  2 ++
 .../devicetree/bindings/net/renesas,ether.yaml         |  2 ++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  |  2 ++
 Documentation/devicetree/bindings/net/stm32-dwmac.yaml |  2 ++
 .../devicetree/bindings/net/ti,davinci-mdio.yaml       |  2 ++
 Documentation/devicetree/bindings/net/ti,dp83867.yaml  |  2 ++
 Documentation/devicetree/bindings/net/ti,dp83869.yaml  |  2 ++
 Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml |  2 ++
 .../devicetree/bindings/nvmem/nvmem-consumer.yaml      |  2 ++
 Documentation/devicetree/bindings/nvmem/nvmem.yaml     |  2 ++
 .../devicetree/bindings/nvmem/qcom,qfprom.yaml         |  2 ++
 .../devicetree/bindings/nvmem/qcom,spmi-sdam.yaml      |  2 ++
 .../devicetree/bindings/nvmem/rockchip-efuse.yaml      |  2 ++
 .../devicetree/bindings/nvmem/st,stm32-romem.yaml      |  2 ++
 .../opp/allwinner,sun50i-h6-operating-points.yaml      |  4 +++-
 .../devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml     |  2 ++
 .../devicetree/bindings/pci/cdns,cdns-pcie-host.yaml   |  2 ++
 .../devicetree/bindings/pci/cdns-pcie-ep.yaml          |  2 ++
 .../devicetree/bindings/pci/cdns-pcie-host.yaml        |  2 ++
 Documentation/devicetree/bindings/pci/cdns-pcie.yaml   |  2 ++
 .../devicetree/bindings/pci/host-generic-pci.yaml      |  2 ++
 Documentation/devicetree/bindings/pci/loongson.yaml    |  2 ++
 Documentation/devicetree/bindings/pci/pci-ep.yaml      |  2 ++
 .../devicetree/bindings/pci/ti,j721e-pci-ep.yaml       |  2 ++
 .../devicetree/bindings/pci/ti,j721e-pci-host.yaml     |  2 ++
 Documentation/devicetree/bindings/pci/versatile.yaml   |  2 ++
 .../devicetree/bindings/pinctrl/cirrus,madera.yaml     |  2 ++
 .../devicetree/bindings/pinctrl/pincfg-node.yaml       |  2 ++
 .../devicetree/bindings/pinctrl/pinmux-node.yaml       |  2 ++
 .../devicetree/bindings/power/pd-samsung.yaml          |  2 ++
 .../devicetree/bindings/power/power-domain.yaml        |  2 ++
 .../devicetree/bindings/power/supply/power-supply.yaml |  2 ++
 Documentation/devicetree/bindings/pwm/pwm.yaml         |  2 ++
 .../devicetree/bindings/regulator/fixed-regulator.yaml |  2 ++
 .../bindings/regulator/google,cros-ec-regulator.yaml   |  2 ++
 .../devicetree/bindings/regulator/gpio-regulator.yaml  |  2 ++
 .../bindings/regulator/qcom-labibb-regulator.yaml      |  2 +-
 .../devicetree/bindings/regulator/regulator.yaml       |  2 ++
 .../bindings/regulator/st,stm32-booster.yaml           |  2 ++
 .../bindings/regulator/st,stm32-vrefbuf.yaml           |  2 ++
 .../bindings/regulator/vqmmc-ipq4019-regulator.yaml    |  2 ++
 .../devicetree/bindings/regulator/wlf,arizona.yaml     |  2 ++
 Documentation/devicetree/bindings/riscv/cpus.yaml      |  2 ++
 Documentation/devicetree/bindings/riscv/sifive.yaml    |  3 +++
 Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml |  2 ++
 Documentation/devicetree/bindings/rtc/rtc.yaml         |  2 ++
 Documentation/devicetree/bindings/rtc/s3c-rtc.yaml     |  2 ++
 .../devicetree/bindings/serial/ingenic,uart.yaml       |  5 +++++
 .../devicetree/bindings/serial/renesas,hscif.yaml      |  2 ++
 .../devicetree/bindings/serial/renesas,sci.yaml        |  2 ++
 .../devicetree/bindings/serial/renesas,scif.yaml       |  2 ++
 .../devicetree/bindings/serial/renesas,scifa.yaml      |  2 ++
 .../devicetree/bindings/serial/renesas,scifb.yaml      |  2 ++
 Documentation/devicetree/bindings/serial/rs485.yaml    |  3 +++
 Documentation/devicetree/bindings/serial/serial.yaml   |  2 ++
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml   |  2 ++
 .../devicetree/bindings/soc/imx/fsl,aips-bus.yaml      |  2 ++
 .../devicetree/bindings/sound/amlogic,aiu.yaml         |  2 ++
 .../devicetree/bindings/sound/cirrus,madera.yaml       |  2 ++
 .../bindings/sound/nvidia,tegra210-ahub.yaml           |  3 +++
 .../devicetree/bindings/sound/wlf,arizona.yaml         |  2 ++
 .../bindings/soundwire/soundwire-controller.yaml       |  2 ++
 .../bindings/spi/amlogic,meson-gx-spicc.yaml           |  2 ++
 .../devicetree/bindings/spi/amlogic,meson6-spifc.yaml  |  2 ++
 .../devicetree/bindings/spi/mikrotik,rb4xx-spi.yaml    |  2 ++
 .../devicetree/bindings/spi/qca,ar934x-spi.yaml        |  2 ++
 .../devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml    |  2 ++
 .../devicetree/bindings/spi/renesas,hspi.yaml          |  2 ++
 .../devicetree/bindings/spi/renesas,rspi.yaml          |  2 ++
 .../devicetree/bindings/spi/renesas,sh-msiof.yaml      |  2 ++
 .../bindings/spi/socionext,uniphier-spi.yaml           |  2 ++
 .../devicetree/bindings/spi/spi-controller.yaml        |  2 ++
 Documentation/devicetree/bindings/spi/spi-gpio.yaml    |  2 ++
 Documentation/devicetree/bindings/spi/spi-mux.yaml     |  2 ++
 Documentation/devicetree/bindings/spi/spi-pl022.yaml   |  2 ++
 .../devicetree/bindings/spi/spi-rockchip.yaml          |  2 ++
 Documentation/devicetree/bindings/spi/spi-sifive.yaml  |  2 ++
 .../devicetree/bindings/spi/st,stm32-qspi.yaml         |  2 ++
 .../devicetree/bindings/spi/st,stm32-spi.yaml          |  2 ++
 Documentation/devicetree/bindings/spmi/spmi.yaml       |  2 ++
 .../bindings/thermal/thermal-cooling-devices.yaml      |  2 ++
 .../devicetree/bindings/thermal/thermal-sensor.yaml    |  2 ++
 .../devicetree/bindings/timer/snps,dw-apb-timer.yaml   |  2 +-
 Documentation/devicetree/bindings/usb/ti,tps6598x.yaml |  2 ++
 Documentation/devicetree/bindings/usb/usb-hcd.yaml     |  2 ++
 .../bindings/watchdog/amlogic,meson-gxbb-wdt.yaml      |  2 ++
 .../devicetree/bindings/watchdog/arm-smc-wdt.yaml      |  2 ++
 .../devicetree/bindings/watchdog/qcom-wdt.yaml         |  2 ++
 .../devicetree/bindings/watchdog/samsung-wdt.yaml      |  2 ++
 .../devicetree/bindings/watchdog/st,stm32-iwdg.yaml    |  2 ++
 .../devicetree/bindings/watchdog/ti,rti-wdt.yaml       |  2 ++
 .../devicetree/bindings/watchdog/watchdog.yaml         |  2 ++
 249 files changed, 570 insertions(+), 14 deletions(-)

--
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
