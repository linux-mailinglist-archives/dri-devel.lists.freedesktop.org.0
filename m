Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 387A02EBB5E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 09:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C9289D77;
	Wed,  6 Jan 2021 08:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636646E123
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 23:49:38 +0000 (UTC)
Date: Tue, 05 Jan 2021 23:49:18 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] dt-bindings: Add missing array size constraints
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Message-Id: <6IJHMQ.19OBCF0P9Z4X2@crapouillou.net>
In-Reply-To: <20210105232729.GA2864340@xps15>
References: <20210104230253.2805217-1-robh@kernel.org>
 <20210105232729.GA2864340@xps15>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 06 Jan 2021 08:52:53 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-iio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-riscv@lists.infradead.org, s-anna@ti.com, linux-clk@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Marc Zyngier <maz@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-media@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le mar. 5 janv. 2021 =E0 16:27, Mathieu Poirier =

<mathieu.poirier@linaro.org> a =E9crit :
> Adding Suman and Paul - guys please have a look.
> =

> On Mon, Jan 04, 2021 at 04:02:53PM -0700, Rob Herring wrote:
>>  DT properties which can have multiple entries need to specify what =

>> the
>>  entries are and define how many entries there can be. In the case of
>>  only a single entry, just 'maxItems: 1' is sufficient.
>> =

>>  Add the missing entry constraints. These were found with a modified
>>  meta-schema. Unfortunately, there are a few cases where the size
>>  constraints are not defined such as common bindings, so the =

>> meta-schema
>>  can't be part of the normal checks.
>> =

>>  Cc: Jens Axboe <axboe@kernel.dk>
>>  Cc: Stephen Boyd <sboyd@kernel.org>
>>  Cc: Thierry Reding <thierry.reding@gmail.com>
>>  Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
>>  Cc: Chanwoo Choi <cw00.choi@samsung.com>
>>  Cc: Linus Walleij <linus.walleij@linaro.org>
>>  Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>  Cc: Jonathan Cameron <jic23@kernel.org>
>>  Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>  Cc: Thomas Gleixner <tglx@linutronix.de>
>>  Cc: Marc Zyngier <maz@kernel.org>
>>  Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>>  Cc: Chen-Yu Tsai <wens@csie.org>
>>  Cc: Ulf Hansson <ulf.hansson@linaro.org>
>>  Cc: "David S. Miller" <davem@davemloft.net>
>>  Cc: Jakub Kicinski <kuba@kernel.org>
>>  Cc: Sebastian Reichel <sre@kernel.org>
>>  Cc: Ohad Ben-Cohen <ohad@wizery.com>
>>  Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>>  Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>  Signed-off-by: Rob Herring <robh@kernel.org>
>>  ---
>>  Cc: linux-arm-kernel@lists.infradead.org
>>  Cc: linux-ide@vger.kernel.org
>>  Cc: linux-clk@vger.kernel.org
>>  Cc: dri-devel@lists.freedesktop.org
>>  Cc: linux-gpio@vger.kernel.org
>>  Cc: linux-iio@vger.kernel.org
>>  Cc: linux-input@vger.kernel.org
>>  Cc: linux-media@vger.kernel.org
>>  Cc: linux-mmc@vger.kernel.org
>>  Cc: netdev@vger.kernel.org
>>  Cc: linux-pm@vger.kernel.org
>>  Cc: linux-remoteproc@vger.kernel.org
>>  Cc: linux-riscv@lists.infradead.org
>>  Cc: linux-serial@vger.kernel.org
>>  Cc: alsa-devel@alsa-project.org
>>  Cc: linux-spi@vger.kernel.org
>>  Cc: linux-usb@vger.kernel.org
> =

>> =

>>  ---
>>   .../socionext,uniphier-system-cache.yaml      |  4 ++--
>>   .../bindings/ata/sata_highbank.yaml           |  1 +
>>   .../bindings/clock/canaan,k210-clk.yaml       |  1 +
>>   .../bindings/display/brcm,bcm2711-hdmi.yaml   |  1 +
>>   .../bindings/display/brcm,bcm2835-hdmi.yaml   |  1 +
>>   .../display/panel/jdi,lt070me05000.yaml       |  1 +
>>   .../display/panel/mantix,mlaf057we51-x.yaml   |  3 ++-
>>   .../display/panel/novatek,nt36672a.yaml       |  1 +
>>   .../devicetree/bindings/dsp/fsl,dsp.yaml      |  2 +-
>>   .../devicetree/bindings/eeprom/at25.yaml      |  3 +--
>>   .../bindings/extcon/extcon-ptn5150.yaml       |  2 ++
>>   .../bindings/gpio/gpio-pca95xx.yaml           |  1 +
>>   .../bindings/iio/adc/adi,ad7768-1.yaml        |  2 ++
>>   .../bindings/iio/adc/aspeed,ast2400-adc.yaml  |  1 +
>>   .../bindings/iio/adc/lltc,ltc2496.yaml        |  2 +-
>>   .../bindings/iio/adc/qcom,spmi-vadc.yaml      |  1 +
>>   .../bindings/iio/adc/st,stm32-adc.yaml        |  2 ++
>>   .../iio/magnetometer/asahi-kasei,ak8975.yaml  |  1 +
>>   .../iio/potentiometer/adi,ad5272.yaml         |  1 +
>>   .../input/touchscreen/elan,elants_i2c.yaml    |  1 +
>>   .../interrupt-controller/fsl,intmux.yaml      |  2 +-
>>   .../interrupt-controller/st,stm32-exti.yaml   |  2 ++
>>   .../allwinner,sun4i-a10-video-engine.yaml     |  1 +
>>   .../devicetree/bindings/media/i2c/imx219.yaml |  1 +
>>   .../memory-controllers/exynos-srom.yaml       |  2 ++
>>   .../bindings/misc/fsl,dpaa2-console.yaml      |  1 +
>>   .../bindings/mmc/mmc-controller.yaml          |  2 ++
>>   .../bindings/net/ti,k3-am654-cpsw-nuss.yaml   |  1 +
>>   .../bindings/net/ti,k3-am654-cpts.yaml        |  1 +
>>   .../phy/allwinner,sun4i-a10-usb-phy.yaml      |  2 ++
>>   .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  2 ++
>>   .../phy/allwinner,sun50i-h6-usb-phy.yaml      |  2 ++
>>   .../phy/allwinner,sun5i-a13-usb-phy.yaml      |  2 ++
>>   .../phy/allwinner,sun6i-a31-usb-phy.yaml      |  2 ++
>>   .../phy/allwinner,sun8i-a23-usb-phy.yaml      |  2 ++
>>   .../phy/allwinner,sun8i-a83t-usb-phy.yaml     |  2 ++
>>   .../phy/allwinner,sun8i-h3-usb-phy.yaml       |  2 ++
>>   .../phy/allwinner,sun8i-r40-usb-phy.yaml      |  2 ++
>>   .../phy/allwinner,sun8i-v3s-usb-phy.yaml      |  2 ++
>>   .../phy/allwinner,sun9i-a80-usb-phy.yaml      | 19 =

>> ++++++++-----------
>>   .../phy/socionext,uniphier-ahci-phy.yaml      |  2 +-
>>   .../phy/socionext,uniphier-pcie-phy.yaml      |  2 +-
>>   .../phy/socionext,uniphier-usb3hs-phy.yaml    |  2 +-
>>   .../phy/socionext,uniphier-usb3ss-phy.yaml    |  2 +-
>>   .../bindings/phy/ti,phy-gmii-sel.yaml         |  2 +-
>>   .../pinctrl/aspeed,ast2400-pinctrl.yaml       |  3 +--
>>   .../pinctrl/aspeed,ast2500-pinctrl.yaml       |  4 ++--
>>   .../bindings/power/supply/bq25980.yaml        |  1 +
>>   .../bindings/remoteproc/ingenic,vpu.yaml      |  2 +-
>>   .../remoteproc/ti,omap-remoteproc.yaml        |  3 +++
>>   .../bindings/riscv/sifive-l2-cache.yaml       |  1 +
>>   .../bindings/serial/renesas,hscif.yaml        |  2 ++
>>   .../bindings/serial/renesas,scif.yaml         |  2 ++
>>   .../bindings/serial/renesas,scifa.yaml        |  2 ++
>>   .../bindings/serial/renesas,scifb.yaml        |  2 ++
>>   .../sound/allwinner,sun4i-a10-codec.yaml      |  1 +
>>   .../bindings/sound/google,sc7180-trogdor.yaml |  1 +
>>   .../bindings/sound/samsung,aries-wm8994.yaml  |  3 +++
>>   .../bindings/sound/samsung,midas-audio.yaml   |  2 ++
>>   .../devicetree/bindings/sound/tas2562.yaml    |  2 ++
>>   .../devicetree/bindings/sound/tas2770.yaml    |  2 ++
>>   .../bindings/sound/tlv320adcx140.yaml         |  1 +
>>   .../devicetree/bindings/spi/renesas,rspi.yaml |  2 ++
>>   .../devicetree/bindings/sram/sram.yaml        |  2 ++
>>   .../timer/allwinner,sun4i-a10-timer.yaml      |  2 ++
>>   .../bindings/timer/intel,ixp4xx-timer.yaml    |  2 +-
>>   .../usb/allwinner,sun4i-a10-musb.yaml         |  2 +-
>>   .../bindings/usb/brcm,usb-pinmap.yaml         |  3 +++
>>   .../devicetree/bindings/usb/generic-ehci.yaml |  1 +
>>   .../devicetree/bindings/usb/generic-ohci.yaml |  1 +
>>   .../devicetree/bindings/usb/ingenic,musb.yaml |  2 +-
>>   .../bindings/usb/renesas,usbhs.yaml           |  1 +
>>   .../devicetree/bindings/usb/ti,j721e-usb.yaml |  3 ++-
>>   .../bindings/usb/ti,keystone-dwc3.yaml        |  2 ++
>>   74 files changed, 118 insertions(+), 33 deletions(-)

For bindings/remoteproc/ingenic,vpu.yaml and =

devicetree/bindings/usb/ingenic,musb.yaml:

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
