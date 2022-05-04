Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29F1519CB4
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 12:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C859810E385;
	Wed,  4 May 2022 10:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA2A10E385
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 10:16:00 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id x17so1489692lfa.10
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 03:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3V+pN8oMHKUNlKj9u58eTU8o54/yzaIpXU4axegzWU4=;
 b=O0iyA2N+Xbsgc6hNx0h8KONIoOXh3EB1BRzzTbCSyghyvANKNkvHzkxxkymiwhM5VF
 gUDqqvD/7ydOmxqIjdBwPIDUsHo8ZEfQ1Ilq50FF2X96yODwRGCQFUaE+MkKRWyhRt0O
 qb+viMAkkQb9Qar0wdAxdXoTuqYL9iSHiJq4h7vr/iAkRV6VSbOubMB9lIzuCcq/rjep
 nrqMKnhXHN3LVBKbNsHsRAwn4VdZMqI49bmh5FbiITTNDXYSMmZtY/Wcane2W7qtgcMf
 U60KO45Ik7ayfJ9d8F0KM5pxTdxzAtIlGdk9NaZh1jCBR9+yiNKWDJnYGj5eA6mHwJ5v
 DtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3V+pN8oMHKUNlKj9u58eTU8o54/yzaIpXU4axegzWU4=;
 b=I/eiGop7Tfc43msmZ+VOLPoUUX8aPi92pd2YLcoh8DNzKRQk4WNaxtDcsQ1J3UNwnz
 6x3HSStv0FlqO6w535QRIt2Tk/2guZxVR9LEtcxqTA3G1ByCAq2KG7CV5RYErkjmM3tp
 1HbkC91VeRe788Yx51+iiFWg27QUVr9gygjriV/IlueIqPi7febbHMaWCNtWCPEaUyBu
 +KxVQBvLxse8FU0NztqhF/9dwyd8ME/+EDJ3bb7N5IcHIPGUoiwcekJ1NiKxT8Oos8tM
 bMs+WtWW8WbprNllx2xFXxuEZnPeSSNQOrGbTwHD+lK+DqWHqJ82nhShxWpjsRrrcqq8
 jS3g==
X-Gm-Message-State: AOAM532ICcq3fR0N2HAsZjoGtx5n1dTUBXdlWyK379g0rSO2+4H3S7PX
 oIEjf3zDT++IK7ECuY+6dQqr34xLF8WrJFewTFUUhQ==
X-Google-Smtp-Source: ABdhPJwb9h8a4aaMZBfvTpwSIxXOoJs2gIEhvYz0dNyx6gjfx+SYNTm3DbdWkW/qTUpl9FfbJZHecs9EuMupX9D6jWA=
X-Received: by 2002:ac2:4646:0:b0:472:108e:51af with SMTP id
 s6-20020ac24646000000b00472108e51afmr13850415lfo.184.1651659358722; Wed, 04
 May 2022 03:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220503162738.3827041-1-robh@kernel.org>
In-Reply-To: <20220503162738.3827041-1-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 May 2022 12:15:22 +0200
Message-ID: <CAPDyKFogMS3xfDKW0snsL4S-1xnvAa_0s5U5b25OV1ktX_99QA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop redundant 'maxItems/minItems' in
 if/then schemas
To: Rob Herring <robh@kernel.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>,
 Anson Huang <Anson.Huang@nxp.com>, Richard Weinberger <richard@nod.at>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-serial@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Wolfgang Grandegger <wg@grandegger.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-can@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Han Xu <han.xu@nxp.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-mmc@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Dario Binacchi <dariobin@libero.it>, netdev@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 3 May 2022 at 18:27, Rob Herring <robh@kernel.org> wrote:
>
> Another round of removing redundant minItems/maxItems when 'items' list i=
s
> specified. This time it is in if/then schemas as the meta-schema was
> failing to check this case.
>
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with t=
he
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooli=
ng
> will fixup the final schema adding any unspecified minItems/maxItems.
>
> Cc: Abel Vesa <abel.vesa@nxp.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Wolfgang Grandegger <wg@grandegger.com>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: "Niklas S=C3=B6derlund" <niklas.soderlund@ragnatech.se>
> Cc: Anson Huang <Anson.Huang@nxp.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Han Xu <han.xu@nxp.com>
> Cc: Dario Binacchi <dariobin@libero.it>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: linux-clk@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-can@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC

Kind regards
Uffe

> ---
>  .../bindings/clock/imx8m-clock.yaml           |  4 ----
>  .../bindings/display/bridge/renesas,lvds.yaml |  4 ----
>  .../bindings/display/renesas,du.yaml          | 23 -------------------
>  .../bindings/iio/adc/st,stm32-adc.yaml        |  2 --
>  .../bindings/mmc/nvidia,tegra20-sdhci.yaml    |  7 +-----
>  .../devicetree/bindings/mtd/gpmi-nand.yaml    |  2 --
>  .../bindings/net/can/bosch,c_can.yaml         |  3 ---
>  .../bindings/phy/brcm,sata-phy.yaml           | 10 ++++----
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 10 --------
>  .../bindings/serial/samsung_uart.yaml         |  4 ----
>  .../sound/allwinner,sun4i-a10-i2s.yaml        |  1 -
>  .../bindings/sound/ti,j721e-cpb-audio.yaml    |  2 --
>  .../bindings/thermal/rcar-gen3-thermal.yaml   |  1 -
>  13 files changed, 5 insertions(+), 68 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/D=
ocumentation/devicetree/bindings/clock/imx8m-clock.yaml
> index 625f573a7b90..458c7645ee68 100644
> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> @@ -55,8 +55,6 @@ allOf:
>      then:
>        properties:
>          clocks:
> -          minItems: 7
> -          maxItems: 7
>            items:
>              - description: 32k osc
>              - description: 25m osc
> @@ -66,8 +64,6 @@ allOf:
>              - description: ext3 clock input
>              - description: ext4 clock input
>          clock-names:
> -          minItems: 7
> -          maxItems: 7
>            items:
>              - const: ckil
>              - const: osc_25m
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvd=
s.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> index a51baf8a4c76..bb9dbfb9beaf 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> @@ -95,7 +95,6 @@ then:
>    properties:
>      clocks:
>        minItems: 1
> -      maxItems: 4
>        items:
>          - description: Functional clock
>          - description: EXTAL input clock
> @@ -104,7 +103,6 @@ then:
>
>      clock-names:
>        minItems: 1
> -      maxItems: 4
>        items:
>          - const: fck
>          # The LVDS encoder can use the EXTAL or DU_DOTCLKINx clocks.
> @@ -128,12 +126,10 @@ then:
>  else:
>    properties:
>      clocks:
> -      maxItems: 1
>        items:
>          - description: Functional clock
>
>      clock-names:
> -      maxItems: 1
>        items:
>          - const: fck
>
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/=
Documentation/devicetree/bindings/display/renesas,du.yaml
> index 56cedcd6d576..b3e588022082 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -109,7 +109,6 @@ allOf:
>        properties:
>          clocks:
>            minItems: 1
> -          maxItems: 3
>            items:
>              - description: Functional clock
>              - description: DU_DOTCLKIN0 input clock
> @@ -117,7 +116,6 @@ allOf:
>
>          clock-names:
>            minItems: 1
> -          maxItems: 3
>            items:
>              - const: du.0
>              - pattern: '^dclkin\.[01]$'
> @@ -159,7 +157,6 @@ allOf:
>        properties:
>          clocks:
>            minItems: 2
> -          maxItems: 4
>            items:
>              - description: Functional clock for DU0
>              - description: Functional clock for DU1
> @@ -168,7 +165,6 @@ allOf:
>
>          clock-names:
>            minItems: 2
> -          maxItems: 4
>            items:
>              - const: du.0
>              - const: du.1
> @@ -216,7 +212,6 @@ allOf:
>        properties:
>          clocks:
>            minItems: 2
> -          maxItems: 4
>            items:
>              - description: Functional clock for DU0
>              - description: Functional clock for DU1
> @@ -225,7 +220,6 @@ allOf:
>
>          clock-names:
>            minItems: 2
> -          maxItems: 4
>            items:
>              - const: du.0
>              - const: du.1
> @@ -271,7 +265,6 @@ allOf:
>        properties:
>          clocks:
>            minItems: 2
> -          maxItems: 4
>            items:
>              - description: Functional clock for DU0
>              - description: Functional clock for DU1
> @@ -280,7 +273,6 @@ allOf:
>
>          clock-names:
>            minItems: 2
> -          maxItems: 4
>            items:
>              - const: du.0
>              - const: du.1
> @@ -327,7 +319,6 @@ allOf:
>        properties:
>          clocks:
>            minItems: 2
> -          maxItems: 4
>            items:
>              - description: Functional clock for DU0
>              - description: Functional clock for DU1
> @@ -336,7 +327,6 @@ allOf:
>
>          clock-names:
>            minItems: 2
> -          maxItems: 4
>            items:
>              - const: du.0
>              - const: du.1
> @@ -386,7 +376,6 @@ allOf:
>        properties:
>          clocks:
>            minItems: 3
> -          maxItems: 6
>            items:
>              - description: Functional clock for DU0
>              - description: Functional clock for DU1
> @@ -397,7 +386,6 @@ allOf:
>
>          clock-names:
>            minItems: 3
> -          maxItems: 6
>            items:
>              - const: du.0
>              - const: du.1
> @@ -448,7 +436,6 @@ allOf:
>        properties:
>          clocks:
>            minItems: 4
> -          maxItems: 8
>            items:
>              - description: Functional clock for DU0
>              - description: Functional clock for DU1
> @@ -461,7 +448,6 @@ allOf:
>
>          clock-names:
>            minItems: 4
> -          maxItems: 8
>            items:
>              - const: du.0
>              - const: du.1
> @@ -525,7 +511,6 @@ allOf:
>        properties:
>          clocks:
>            minItems: 3
> -          maxItems: 6
>            items:
>              - description: Functional clock for DU0
>              - description: Functional clock for DU1
> @@ -536,7 +521,6 @@ allOf:
>
>          clock-names:
>            minItems: 3
> -          maxItems: 6
>            items:
>              - const: du.0
>              - const: du.1
> @@ -596,7 +580,6 @@ allOf:
>        properties:
>          clocks:
>            minItems: 3
> -          maxItems: 6
>            items:
>              - description: Functional clock for DU0
>              - description: Functional clock for DU1
> @@ -607,7 +590,6 @@ allOf:
>
>          clock-names:
>            minItems: 3
> -          maxItems: 6
>            items:
>              - const: du.0
>              - const: du.1
> @@ -666,14 +648,12 @@ allOf:
>        properties:
>          clocks:
>            minItems: 1
> -          maxItems: 2
>            items:
>              - description: Functional clock for DU0
>              - description: DU_DOTCLKIN0 input clock
>
>          clock-names:
>            minItems: 1
> -          maxItems: 2
>            items:
>              - const: du.0
>              - const: dclkin.0
> @@ -723,7 +703,6 @@ allOf:
>        properties:
>          clocks:
>            minItems: 2
> -          maxItems: 4
>            items:
>              - description: Functional clock for DU0
>              - description: Functional clock for DU1
> @@ -732,7 +711,6 @@ allOf:
>
>          clock-names:
>            minItems: 2
> -          maxItems: 4
>            items:
>              - const: du.0
>              - const: du.1
> @@ -791,7 +769,6 @@ allOf:
>              - description: Functional clock
>
>          clock-names:
> -          maxItems: 1
>            items:
>              - const: du.0
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml =
b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> index 4d6074518b5c..fa8da42cb1e6 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> @@ -138,7 +138,6 @@ allOf:
>              - const: bus
>              - const: adc
>            minItems: 1
> -          maxItems: 2
>
>          interrupts:
>            items:
> @@ -170,7 +169,6 @@ allOf:
>              - const: bus
>              - const: adc
>            minItems: 1
> -          maxItems: 2
>
>          interrupts:
>            items:
> diff --git a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.y=
aml b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
> index f3f4d5b02744..fe0270207622 100644
> --- a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
> @@ -202,22 +202,17 @@ allOf:
>          clocks:
>            items:
>              - description: module clock
> -          minItems: 1
> -          maxItems: 1
>      else:
>        properties:
>          clocks:
>            items:
>              - description: module clock
>              - description: timeout clock
> -          minItems: 2
> -          maxItems: 2
> +
>          clock-names:
>            items:
>              - const: sdhci
>              - const: tmclk
> -          minItems: 2
> -          maxItems: 2
>        required:
>          - clock-names
>
> diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml b/Docum=
entation/devicetree/bindings/mtd/gpmi-nand.yaml
> index 9d764e654e1d..849aeae319a9 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
> @@ -147,8 +147,6 @@ allOf:
>              - description: SoC gpmi io clock
>              - description: SoC gpmi bch apb clock
>          clock-names:
> -          minItems: 2
> -          maxItems: 2
>            items:
>              - const: gpmi_io
>              - const: gpmi_bch_apb
> diff --git a/Documentation/devicetree/bindings/net/can/bosch,c_can.yaml b=
/Documentation/devicetree/bindings/net/can/bosch,c_can.yaml
> index 8bad328b184d..51aa89ac7e85 100644
> --- a/Documentation/devicetree/bindings/net/can/bosch,c_can.yaml
> +++ b/Documentation/devicetree/bindings/net/can/bosch,c_can.yaml
> @@ -80,8 +80,6 @@ if:
>  then:
>    properties:
>      interrupts:
> -      minItems: 4
> -      maxItems: 4
>        items:
>          - description: Error and status IRQ
>          - description: Message object IRQ
> @@ -91,7 +89,6 @@ then:
>  else:
>    properties:
>      interrupts:
> -      maxItems: 1
>        items:
>          - description: Error and status IRQ
>
> diff --git a/Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml b/D=
ocumentation/devicetree/bindings/phy/brcm,sata-phy.yaml
> index cb1aa325336f..435b971dfd9b 100644
> --- a/Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml
> @@ -102,19 +102,17 @@ if:
>  then:
>    properties:
>      reg:
> -      maxItems: 2
> +      minItems: 2
> +
>      reg-names:
> -      items:
> -        - const: "phy"
> -        - const: "phy-ctrl"
> +      minItems: 2
>  else:
>    properties:
>      reg:
>        maxItems: 1
> +
>      reg-names:
>        maxItems: 1
> -      items:
> -        - const: "phy"
>
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rt=
c.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> index 0b767fec39d8..6b38bd7eb3b4 100644
> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> @@ -71,7 +71,6 @@ allOf:
>      then:
>        properties:
>          clock-output-names:
> -          minItems: 1
>            maxItems: 1
>
>    - if:
> @@ -102,7 +101,6 @@ allOf:
>        properties:
>          clock-output-names:
>            minItems: 3
> -          maxItems: 3
>
>    - if:
>        properties:
> @@ -113,16 +111,12 @@ allOf:
>      then:
>        properties:
>          clocks:
> -          minItems: 3
> -          maxItems: 3
>            items:
>              - description: Bus clock for register access
>              - description: 24 MHz oscillator
>              - description: 32 kHz clock from the CCU
>
>          clock-names:
> -          minItems: 3
> -          maxItems: 3
>            items:
>              - const: bus
>              - const: hosc
> @@ -142,7 +136,6 @@ allOf:
>        properties:
>          clocks:
>            minItems: 3
> -          maxItems: 4
>            items:
>              - description: Bus clock for register access
>              - description: 24 MHz oscillator
> @@ -151,7 +144,6 @@ allOf:
>
>          clock-names:
>            minItems: 3
> -          maxItems: 4
>            items:
>              - const: bus
>              - const: hosc
> @@ -174,14 +166,12 @@ allOf:
>      then:
>        properties:
>          interrupts:
> -          minItems: 1
>            maxItems: 1
>
>      else:
>        properties:
>          interrupts:
>            minItems: 2
> -          maxItems: 2
>
>  required:
>    - "#clock-cells"
> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b=
/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> index d4688e317fc5..901c1e2cea28 100644
> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> @@ -100,7 +100,6 @@ allOf:
>            maxItems: 3
>          clock-names:
>            minItems: 2
> -          maxItems: 3
>            items:
>              - const: uart
>              - pattern: '^clk_uart_baud[0-1]$'
> @@ -118,11 +117,8 @@ allOf:
>      then:
>        properties:
>          clocks:
> -          minItems: 2
>            maxItems: 2
>          clock-names:
> -          minItems: 2
> -          maxItems: 2
>            items:
>              - const: uart
>              - const: clk_uart_baud0
> diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-=
i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.=
yaml
> index c21c807b667c..34f6ee9de392 100644
> --- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yam=
l
> +++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yam=
l
> @@ -89,7 +89,6 @@ allOf:
>        properties:
>          dmas:
>            minItems: 1
> -          maxItems: 2
>            items:
>              - description: RX DMA Channel
>              - description: TX DMA Channel
> diff --git a/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.y=
aml b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
> index 6806f53a4aed..20ea5883b7ff 100644
> --- a/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,j721e-cpb-audio.yaml
> @@ -80,7 +80,6 @@ allOf:
>      then:
>        properties:
>          clocks:
> -          minItems: 6
>            items:
>              - description: AUXCLK clock for McASP used by CPB audio
>              - description: Parent for CPB_McASP auxclk (for 48KHz)
> @@ -107,7 +106,6 @@ allOf:
>      then:
>        properties:
>          clocks:
> -          maxItems: 4
>            items:
>              - description: AUXCLK clock for McASP used by CPB audio
>              - description: Parent for CPB_McASP auxclk (for 48KHz)
> diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.=
yaml b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
> index f963204e0b16..1368d90da0e8 100644
> --- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
> @@ -67,7 +67,6 @@ then:
>    properties:
>      reg:
>        minItems: 2
> -      maxItems: 3
>        items:
>          - description: TSC1 registers
>          - description: TSC2 registers
> --
> 2.34.1
>
