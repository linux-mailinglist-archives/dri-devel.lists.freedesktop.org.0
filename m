Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BA1A40126
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 21:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B5710E15E;
	Fri, 21 Feb 2025 20:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ndfbt+48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF19B10E15E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 20:38:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0C1A85C577E;
 Fri, 21 Feb 2025 20:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94787C4CED6;
 Fri, 21 Feb 2025 20:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740170285;
 bh=cZReEKvxGMFAzn2nYLfiWitsoEwnGLiU1ItJsk7GJrQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ndfbt+48L4RUb3WT78YqKEkPhF3BzDwk9jaSj6fPv91ryKts6+cOTdoQgapK2WP0j
 8s0traSuhiLn53SJu6fL4ilpCUF8Nz8CUmU7BVBo3Lzk2eprS+ah0xVQ0T4mCzTETe
 PhZMvy0gKeAA+mEoGpLNH7rx9uIsPMvC+mbfSwfYgV9/iwh1SkPucuS6HDUdCS3yON
 KN1vTiTDcNH95IeouzRup2F9LQMCJBifFZbg8Sj5HqAAQtsJLYTPB7PCUVoQMlRVtt
 HCJSPaFTSjpuD1bJaYsRx7EpyZpgQDd0itSh2KMcV9LeQWf73Z8sGW6Ge6+oVhEGze
 henAZXi/4khyA==
Date: Fri, 21 Feb 2025 14:38:03 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: Document TI LM3533 MFD
Message-ID: <20250221203803.GA24813-robh@kernel.org>
References: <20250218132702.114669-1-clamor95@gmail.com>
 <20250218132702.114669-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250218132702.114669-2-clamor95@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 18, 2025 at 03:26:59PM +0200, Svyatoslav Ryhel wrote:
> Add bindings for the LM3533 - a complete power source for
> backlight, keypad, and indicator LEDs in smartphone handsets.
> The high-voltage inductive boost converter provides the
> power for two series LED strings display backlight and keypad
> functions.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/mfd/ti,lm3533.yaml    | 231 ++++++++++++++++++
>  1 file changed, 231 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml b/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
> new file mode 100644
> index 000000000000..83542f0c7bf7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
> @@ -0,0 +1,231 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,lm3533.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI LM3533 Complete Lighting Power Solution
> +
> +description: |

Use '>' rather than '|' if only formatting is paragraphs.

> +  The LM3533 is a complete power source for backlight,
> +  keypad, and indicator LEDs in smartphone handsets. The
> +  high-voltage inductive boost converter provides the
> +  power for two series LED strings display backlight and
> +  keypad functions.

Wrap lines at 80

blank line here

> +  https://www.ti.com/product/LM3533
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: ti,lm3533
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  enable-gpios:
> +    description: GPIO to use to enable/disable the backlight (HWEN pin).
> +    maxItems: 1
> +
> +  ti,boost-ovp-microvolt:
> +    description:
> +      Boost OVP select (16V, 24V, 32V, 40V)
> +    enum: [ 16000000, 24000000, 32000000, 40000000 ]
> +    default: 16000000
> +
> +  ti,boost-freq-hz:
> +    description:
> +      Boost frequency select (500KHz or 1MHz)
> +    enum: [ 500000, 1000000 ]
> +    default: 500000
> +
> +  light-sensor@0:
> +    type: object
> +    description:
> +      Properties for an illumination sensor.
> +
> +    properties:
> +      compatible:
> +        const: ti,lm3533-als
> +
> +      reg:
> +        const: 0
> +
> +      ti,resistor-value-ohm:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |

Don't need '|'. Elsewhere too.

> +          Internal configuration resister value when ALS is in Analog Sensor
> +          mode and PWM mode is disabled.
> +        minimum: 1575
> +        maximum: 200000
> +
> +      ti,pwm-mode:
> +        type: boolean
> +        description: |
> +          Switch for mode in which ALS is running. If this propertly is
> +          set then ALS is running in PWM mode, internal resistor value is
> +          set to high-impedance (0) and resistor-value-ohm propertly is
> +          ignored.
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +    additionalProperties: false

Move this above 'properties'.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +  - enable-gpios
> +
> +patternProperties:
> +  "^backlight@[01]$":
> +    type: object
> +    description:
> +      Properties for a backlight device.
> +
> +    $ref: /schemas/leds/backlight/common.yaml#
> +
> +    properties:
> +      compatible:
> +        const: ti,lm3533-backlight
> +
> +      reg:
> +        description: |
> +          The control bank that is used to program the two current sinks. The
> +          LM3533 has two control banks (A and B) and are represented as 0 or 1
> +          in this property. The two current sinks can be controlled
> +          independently with both banks, or bank A can be configured to control
> +          both sinks with the led-sources property.
> +        minimum: 0
> +        maximum: 1
> +
> +      default-brightness: true
> +
> +      ti,max-current-microamp:
> +        description:
> +          Maximum current in µA with a 800 µA step.
> +        enum: [ 5000, 5800, 6600, 7400, 8200, 9000, 9800,
> +                10600, 11400, 12200, 13000, 13800, 14600,
> +                15400, 16200, 17000, 17800, 18600, 19400,
> +                20200, 21000, 21800, 22600, 23400, 24200,
> +                25000, 25800, 26600, 27400, 28200, 29000,
> +                29800 ]
> +        default: 5000
> +
> +      ti,pwm-config-mask:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Control Bank PWM Configuration Register mask that allows to configure
> +          PWM input in Zones 0-4
> +          BIT(0) - PWM Input is enabled
> +          BIT(1) - PWM Input is enabled in Zone 0
> +          BIT(2) - PWM Input is enabled in Zone 1
> +          BIT(3) - PWM Input is enabled in Zone 2
> +          BIT(4) - PWM Input is enabled in Zone 3
> +          BIT(5) - PWM Input is enabled in Zone 4
> +
> +      ti,linear-mapping-mode:
> +        description: |
> +          Enable linear mapping mode. If disabled, then it will use exponential
> +          mapping mode in which the ramp up/down appears to have a more uniform
> +          transition to the human eye.
> +        type: boolean
> +
> +      ti,hardware-controlled:
> +        description: |
> +          Each backlight has its own voltage Control Bank (A and B) and there are
> +          two HVLED sinks which by default are linked to respective Bank. Setting
> +          this property will link both sinks to a Control Bank of backlight where
> +          property is defined.
> +        type: boolean
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +    additionalProperties: false
> +
> +  "^led@[0-3]$":
> +    type: object
> +    description:
> +      Properties for a led device.
> +
> +    $ref: /schemas/leds/common.yaml#
> +
> +    properties:
> +      compatible:
> +        const: ti,lm3533-leds
> +
> +      reg:
> +        description:
> +          4 led banks
> +        minimum: 0
> +        maximum: 3
> +
> +      linux,default-trigger: true
> +
> +      ti,max-current-microamp:
> +        description:
> +          Maximum current in µA with a 800 µA step.
> +        enum: [ 5000, 5800, 6600, 7400, 8200, 9000, 9800,
> +                10600, 11400, 12200, 13000, 13800, 14600,
> +                15400, 16200, 17000, 17800, 18600, 19400,
> +                20200, 21000, 21800, 22600, 23400, 24200,
> +                25000, 25800, 26600, 27400, 28200, 29000,
> +                29800 ]
> +        default: 5000
> +
> +      ti,pwm-config-mask:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Same descryption and function as for backlight.
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +    additionalProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@36 {
> +            compatible = "ti,lm3533";
> +            reg = <0x36>;
> +
> +            enable-gpios = <&gpio 110 GPIO_ACTIVE_HIGH>;
> +
> +            ti,boost-ovp-microvolt = <24000000>;
> +            ti,boost-freq-hz = <500000>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            backlight@0 {
> +                compatible = "ti,lm3533-backlight";
> +                reg = <0>;
> +
> +                ti,max-current-microamp = <23400>;
> +                default-brightness = <113>;
> +                ti,hardware-controlled;
> +            };

Please make the example complete.

> +        };
> +    };
> +...
> -- 
> 2.43.0
> 
