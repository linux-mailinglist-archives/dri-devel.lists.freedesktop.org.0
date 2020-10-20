Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2328E28596E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36546E8B2;
	Wed,  7 Oct 2020 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5956E452
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 10:00:16 +0000 (UTC)
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 4248B9F26FE3FA31B20E;
 Tue,  6 Oct 2020 11:00:12 +0100 (IST)
Received: from localhost (10.52.123.13) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 6 Oct 2020
 11:00:10 +0100
Date: Tue, 6 Oct 2020 10:58:22 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: Use 'additionalProperties' instead of
 'unevaluatedProperties'
Message-ID: <20201006095822.00005f32@Huawei.com>
In-Reply-To: <20201005183830.486085-3-robh@kernel.org>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-3-robh@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.123.13]
X-ClientProxiedBy: lhreml716-chm.china.huawei.com (10.201.108.67) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
 linux-usb@vger.kernel.org, Peter
 Meerwald-Stadler <pmeerw@pmeerw.net>, Sam Ravnborg <sam@ravnborg.org>,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 Viresh Kumar <vireshk@kernel.org>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, "David
 S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 5 Oct 2020 13:38:28 -0500
Rob Herring <robh@kernel.org> wrote:

> In cases where we don't reference another schema, 'additionalProperties'
> can be used instead. This is preferred for now as 'unevaluatedProperties'
> support isn't implemented yet.
> 
> In a few cases, this means adding some missing property definitions of
> which most are for SPI bus properties. 'unevaluatedProperties' is not going
> to work for the SPI bus properties anyways as they are evaluated from the
> parent node, not the SPI child node.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  .../devicetree/bindings/clock/baikal,bt1-ccu-div.yaml  |  6 +++++-
>  .../devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml  |  2 +-
>  .../devicetree/bindings/clock/imx8m-clock.yaml         |  2 +-
>  .../devicetree/bindings/hwmon/baikal,bt1-pvt.yaml      |  4 ++--
>  .../devicetree/bindings/iio/accel/adi,adis16240.yaml   |  4 +++-
>  .../devicetree/bindings/iio/accel/adi,adxl345.yaml     |  4 +++-
>  .../devicetree/bindings/iio/accel/adi,adxl372.yaml     |  4 +++-
>  .../devicetree/bindings/iio/adc/adi,ad7124.yaml        |  4 +++-
>  .../devicetree/bindings/iio/adc/adi,ad7192.yaml        |  4 +++-
>  .../devicetree/bindings/iio/adc/adi,ad7292.yaml        |  4 +++-
>  .../devicetree/bindings/iio/adc/adi,ad7606.yaml        |  6 +++++-
>  .../devicetree/bindings/iio/adc/adi,ad7923.yaml        |  4 +++-
>  .../devicetree/bindings/iio/adc/maxim,max1241.yaml     |  4 +++-
>  .../devicetree/bindings/iio/dac/adi,ad5770r.yaml       | 10 +++++++++-
>  .../devicetree/bindings/iio/frequency/adf4371.yaml     |  4 +++-
>  .../devicetree/bindings/iio/imu/adi,adis16460.yaml     |  4 +++-
>  .../devicetree/bindings/iio/imu/adi,adis16475.yaml     |  2 +-
>  .../devicetree/bindings/iio/imu/bosch,bmi160.yaml      |  4 +++-
>  .../devicetree/bindings/iio/imu/nxp,fxos8700.yaml      |  4 +++-
>  .../bindings/interrupt-controller/mti,gic.yaml         |  2 +-
>  .../devicetree/bindings/mfd/cirrus,lochnagar.yaml      | 10 +++++++++-
>  .../bindings/mfd/ti,j721e-system-controller.yaml       |  5 ++++-
>  .../devicetree/bindings/misc/olpc,xo1.75-ec.yaml       |  4 +++-
>  .../opp/allwinner,sun50i-h6-operating-points.yaml      |  4 +++-
>  .../bindings/regulator/qcom-labibb-regulator.yaml      |  2 +-
>  .../devicetree/bindings/timer/snps,dw-apb-timer.yaml   |  2 +-
>  26 files changed, 82 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
> index 2821425ee445..bd4cefbb1244 100644
> --- a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
> +++ b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
> @@ -134,7 +134,11 @@ properties:
>    "#reset-cells":
>      const: 1
>  
> -unevaluatedProperties: false
> +  clocks: true
> +
> +  clock-names: true
> +
> +additionalProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml
> index 97131bfa6f87..624984d51c10 100644
> --- a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml
> @@ -101,7 +101,7 @@ properties:
>    clock-names:
>      const: ref_clk
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> index 31e7cc9693c3..625f573a7b90 100644
> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> @@ -96,7 +96,7 @@ allOf:
>              - const: clk_ext3
>              - const: clk_ext4
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    # Clock Control Module node:
> diff --git a/Documentation/devicetree/bindings/hwmon/baikal,bt1-pvt.yaml b/Documentation/devicetree/bindings/hwmon/baikal,bt1-pvt.yaml
> index 84ae4cdd08ed..00a6511354e6 100644
> --- a/Documentation/devicetree/bindings/hwmon/baikal,bt1-pvt.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/baikal,bt1-pvt.yaml
> @@ -79,7 +79,7 @@ properties:
>        minimum: 0
>        maximum: 7130
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  required:
>    - compatible
> @@ -99,7 +99,7 @@ examples:
>  
>        interrupts = <GIC_SHARED 31 IRQ_TYPE_LEVEL_HIGH>;
>  
> -      baikal,pvt-temp-trim-millicelsius = <1000>;
> +      baikal,pvt-temp-offset-millicelsius = <1000>;
>  
>        clocks = <&ccu_sys>, <&ccu_sys>;
>        clock-names = "ref", "pclk";
> diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml
> index 8589b722028d..4fcbfd93e218 100644
> --- a/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/adi,adis16240.yaml
> @@ -25,12 +25,14 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  spi-max-frequency: true
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> index 591ca32181b0..11d32a288535 100644
> --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> @@ -32,6 +32,8 @@ properties:
>  
>    spi-cpol: true
>  
> +  spi-max-frequency: true
> +
>    interrupts:
>      maxItems: 1
>  
> @@ -40,7 +42,7 @@ required:
>    - reg
>    - interrupts
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
> index 64f275c8e2d9..38b59b6454ce 100644
> --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
> @@ -25,12 +25,14 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  spi-max-frequency: true
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
> index d0d2880626c2..f1c574c896cb 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7124.yaml
> @@ -52,6 +52,8 @@ properties:
>    avdd-supply:
>      description: avdd supply can be used as reference for conversion.
>  
> +  spi-max-frequency: true
> +
>  required:
>    - compatible
>    - reg
> @@ -108,7 +110,7 @@ patternProperties:
>        - reg
>        - diff-channels
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
> index ed363a796e50..e0cc3b2e8957 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7192.yaml
> @@ -30,6 +30,8 @@ properties:
>  
>    spi-cpha: true
>  
> +  spi-max-frequency: true
> +
>    clocks:
>      maxItems: 1
>      description: phandle to the master clock (mclk)
> @@ -92,7 +94,7 @@ required:
>    - spi-cpol
>    - spi-cpha
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml
> index 55e973c6449c..108d202b288f 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7292.yaml
> @@ -30,6 +30,8 @@ properties:
>  
>    spi-cpha: true
>  
> +  spi-max-frequency: true
> +
>    '#address-cells':
>      const: 1
>  
> @@ -63,7 +65,7 @@ patternProperties:
>      required:
>        - reg
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> index 014b020ed0c2..73775174cf57 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> @@ -31,6 +31,10 @@ properties:
>  
>    spi-cpha: true
>  
> +  spi-cpol: true
> +
> +  spi-max-frequency: true
> +
>    avcc-supply: true
>  
>    interrupts:
> @@ -102,7 +106,7 @@ required:
>    - interrupts
>    - adi,conversion-start-gpios
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7923.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7923.yaml
> index 2a17641faed5..e82194974eea 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7923.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7923.yaml
> @@ -43,11 +43,13 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  spi-max-frequency: true
> +
>  required:
>    - compatible
>    - reg
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml b/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml
> index 181213b862db..4c7e0d94bff1 100644
> --- a/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/maxim,max1241.yaml
> @@ -39,13 +39,15 @@ properties:
>        thus enabling power-down mode.
>      maxItems: 1
>  
> +  spi-max-frequency: true
> +
>  required:
>    - compatible
>    - reg
>    - vdd-supply
>    - vref-supply
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5770r.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ad5770r.yaml
> index faef288b7148..fb2c48fc7ce4 100644
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5770r.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5770r.yaml
> @@ -49,6 +49,14 @@ properties:
>        asserted during driver probe.
>      maxItems: 1
>  
> +  spi-max-frequency: true
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
>    channel@0:
>      description: Represents an external channel which are
>        connected to the DAC. Channel 0 can act both as a current
> @@ -130,7 +138,7 @@ required:
>    - channel@4
>    - channel@5
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> index 11d445f7010e..6b3a611e1cf1 100644
> --- a/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> +++ b/Documentation/devicetree/bindings/iio/frequency/adf4371.yaml
> @@ -40,13 +40,15 @@ properties:
>        output stage will shut down until the ADF4371/ADF4372 achieves lock as
>        measured by the digital lock detect circuitry.
>  
> +  spi-max-frequency: true
> +
>  required:
>    - compatible
>    - reg
>    - clocks
>    - clock-names
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml b/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml
> index 07c8ed4ee0f1..340be256f283 100644
> --- a/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml
> +++ b/Documentation/devicetree/bindings/iio/imu/adi,adis16460.yaml
> @@ -25,6 +25,8 @@ properties:
>  
>    spi-cpol: true
>  
> +  spi-max-frequency: true
> +
>    interrupts:
>      maxItems: 1
>  
> @@ -33,7 +35,7 @@ required:
>    - reg
>    - interrupts
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/iio/imu/adi,adis16475.yaml b/Documentation/devicetree/bindings/iio/imu/adi,adis16475.yaml
> index c29385697bbf..79fba1508e89 100644
> --- a/Documentation/devicetree/bindings/iio/imu/adi,adis16475.yaml
> +++ b/Documentation/devicetree/bindings/iio/imu/adi,adis16475.yaml
> @@ -116,7 +116,7 @@ allOf:
>        dependencies:
>          adi,sync-mode: [ clocks ]
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/iio/imu/bosch,bmi160.yaml b/Documentation/devicetree/bindings/iio/imu/bosch,bmi160.yaml
> index 4f215399c8df..6e73cd889b5c 100644
> --- a/Documentation/devicetree/bindings/iio/imu/bosch,bmi160.yaml
> +++ b/Documentation/devicetree/bindings/iio/imu/bosch,bmi160.yaml
> @@ -46,11 +46,13 @@ properties:
>    mount-matrix:
>      description: an optional 3x3 mounting rotation matrix
>  
> +  spi-max-frequency: true
> +
>  required:
>    - compatible
>    - reg
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml b/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
> index 716731c2b794..479e7065d4eb 100644
> --- a/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
> +++ b/Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml
> @@ -36,11 +36,13 @@ properties:
>    drive-open-drain:
>      type: boolean
>  
> +  spi-max-frequency: true
> +
>  required:
>    - compatible
>    - reg
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
> index ce6aaff15214..039e08af98bb 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
> @@ -95,7 +95,7 @@ properties:
>  
>      additionalProperties: false
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml b/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
> index 7a616577ac63..c00ad3e21c21 100644
> --- a/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
> +++ b/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
> @@ -130,6 +130,14 @@ properties:
>      type: object
>      $ref: /schemas/pinctrl/cirrus,lochnagar.yaml#
>  
> +  lochnagar-hwmon:
> +    type: object
> +    $ref: /schemas/hwmon/cirrus,lochnagar.yaml#
> +
> +  lochnagar-sc:
> +    type: object
> +    $ref: /schemas/sound/cirrus,lochnagar.yaml#
> +
>    VDDCORE:
>      description:
>        Initialisation data for the VDDCORE regulator, which supplies the
> @@ -249,7 +257,7 @@ required:
>    - lochnagar-clk
>    - lochnagar-pinctrl
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml
> index da3d9ab758b9..19fcf59fd2fe 100644
> --- a/Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml
> @@ -30,6 +30,9 @@ properties:
>        - const: syscon
>        - const: simple-mfd
>  
> +  reg:
> +    maxItems: 1
> +
>    "#address-cells":
>      const: 1
>  
> @@ -54,7 +57,7 @@ required:
>    - "#size-cells"
>    - ranges
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/misc/olpc,xo1.75-ec.yaml b/Documentation/devicetree/bindings/misc/olpc,xo1.75-ec.yaml
> index e75d77beec6a..ade733cd60f7 100644
> --- a/Documentation/devicetree/bindings/misc/olpc,xo1.75-ec.yaml
> +++ b/Documentation/devicetree/bindings/misc/olpc,xo1.75-ec.yaml
> @@ -28,11 +28,13 @@ properties:
>      description: GPIO uspecifier of the CMD pin
>      maxItems: 1
>  
> +  spi-cpha: true
> +
>  required:
>    - compatible
>    - cmd-gpios
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> index aef87a33a7c9..aeff2bd774dd 100644
> --- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> +++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> @@ -31,6 +31,8 @@ properties:
>        Documentation/devicetree/bindings/nvmem/nvmem.txt and also
>        examples below.
>  
> +  opp-shared: true
> +
>  required:
>    - compatible
>    - nvmem-cells
> @@ -53,7 +55,7 @@ patternProperties:
>  
>      unevaluatedProperties: false
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> index fb111e2d5b99..53853ec20fe2 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> @@ -47,7 +47,7 @@ properties:
>  required:
>    - compatible
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  examples:
>    - |
> diff --git a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> index 7b39e3204fb3..2fc617377e2c 100644
> --- a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> @@ -45,7 +45,7 @@ properties:
>        frequency in HZ, but is defined only for the backwards compatibility
>        with the picoxcell platform.
>  
> -unevaluatedProperties: false
> +additionalProperties: false
>  
>  required:
>    - compatible


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
