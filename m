Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EED201D52
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 23:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404BF6EB2B;
	Fri, 19 Jun 2020 21:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F026EB2B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 21:53:46 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A37D380518;
 Fri, 19 Jun 2020 23:53:43 +0200 (CEST)
Date: Fri, 19 Jun 2020 23:53:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: backlight: Convert common backlight
 bindings to DT schema
Message-ID: <20200619215341.GA6857@ravnborg.org>
References: <20200618224413.1115849-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618224413.1115849-1-robh@kernel.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=xaQA2OYNmvnDas3ntOUA:9
 a=N7sUtPlMTdWnEY4o:21 a=Y38N-j4GBFhqJDI7:21 a=CjuIK1q_8ugA:10
 a=cvBusfyB2V15izCimMoJ:22 a=AjGcO6oz07-iQ99wixmX:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob.

Good to have these converted. A few comments in the following. One
comment is for the backlight people as you copied the original text.

	Sam

On Thu, Jun 18, 2020 at 04:44:13PM -0600, Rob Herring wrote:
> Convert the common GPIO, LED, and PWM backlight bindings to DT schema
> format.
> 
> Given there's only 2 common properties and the descriptions are slightly
> different, I opted to not create a common backlight schema.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../leds/backlight/gpio-backlight.txt         | 16 ---
>  .../leds/backlight/gpio-backlight.yaml        | 41 ++++++++
>  .../bindings/leds/backlight/led-backlight.txt | 28 ------
>  .../leds/backlight/led-backlight.yaml         | 58 +++++++++++
>  .../bindings/leds/backlight/pwm-backlight.txt | 61 ------------
>  .../leds/backlight/pwm-backlight.yaml         | 98 +++++++++++++++++++
>  6 files changed, 197 insertions(+), 105 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/gpio-backlight.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.txt
> deleted file mode 100644
> index 321be6640533..000000000000
> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -gpio-backlight bindings
> -
> -Required properties:
> -  - compatible: "gpio-backlight"
> -  - gpios: describes the gpio that is used for enabling/disabling the backlight.
> -    refer to bindings/gpio/gpio.txt for more details.
> -
> -Optional properties:
> -  - default-on: enable the backlight at boot.
> -
> -Example:
> -	backlight {
> -		compatible = "gpio-backlight";
> -		gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>;
> -		default-on;
> -	};
> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> new file mode 100644
> index 000000000000..75cc569b9c55
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/gpio-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: gpio-backlight bindings
> +
> +maintainers:
> +  - Lee Jones <lee.jones@linaro.org>
> +  - Daniel Thompson <daniel.thompson@linaro.org>
> +  - Jingoo Han <jingoohan1@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: gpio-backlight
> +
> +  gpios:
> +    description: The gpio that is used for enabling/disabling the backlight.
> +    maxItems: 1
> +
> +  default-on:
> +    description: enable the backlight at boot.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    backlight {
> +        compatible = "gpio-backlight";
> +        gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>;
> +        default-on;
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> deleted file mode 100644
> index 4c7dfbe7f67a..000000000000
> --- a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -led-backlight bindings
> -
> -This binding is used to describe a basic backlight device made of LEDs.
> -It can also be used to describe a backlight device controlled by the output of
> -a LED driver.
> -
> -Required properties:
> -  - compatible: "led-backlight"
> -  - leds: a list of LEDs
> -
> -Optional properties:
> -  - brightness-levels: Array of distinct brightness levels. The levels must be
> -                       in the range accepted by the underlying LED devices.
> -                       This is used to translate a backlight brightness level
> -                       into a LED brightness level. If it is not provided, the
> -                       identity mapping is used.
> -
> -  - default-brightness-level: The default brightness level.
> -
> -Example:
> -
> -	backlight {
> -		compatible = "led-backlight";
> -
> -		leds = <&led1>, <&led2>;
> -		brightness-levels = <0 4 8 16 32 64 128 255>;
> -		default-brightness-level = <6>;
> -	};
> diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> new file mode 100644
> index 000000000000..ae50945d2798
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/led-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: led-backlight bindings
> +
> +maintainers:
> +  - Lee Jones <lee.jones@linaro.org>
> +  - Daniel Thompson <daniel.thompson@linaro.org>
> +  - Jingoo Han <jingoohan1@gmail.com>
> +
> +description:
> +  This binding is used to describe a basic backlight device made of LEDs. It
> +  can also be used to describe a backlight device controlled by the output of
> +  a LED driver.
> +
> +properties:
> +  compatible:
> +    const: led-backlight
> +
> +  leds:
> +    description: A list of LED nodes
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +  brightness-levels:
> +    description: Array of distinct brightness levels. The levels must be
> +      in the range accepted by the underlying LED devices. This is used
> +      to translate a backlight brightness level into a LED brightness level.
> +      If it is not provided, the identity mapping is used.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
bike-shedding. To me it is a tad easier to read when multi-line
descriptions are on a separate line.
So "description:" on one line, and the text on following lines.
example-schema.yaml does both - so both are official acceptable.

> +
> +  default-brightness-level:
> +    description: The default brightness level (index into the array defined
> +      by the "brightness-levels" property).
This description does not match my understading.
The description says "index into", but in reality this is a value that
matches somewhere in the range specified by brightness-levels.
So it is not an index.

Maybe I just read it wrong and the description is fine. But when I read
index the when it says 6 I would look for brightness-levels[6] equals
128 in the example below.
And this is not how it is coded.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +dependencies:
> +  default-brightness-level: [brightness-levels]
So if we have efault-brightness-level then we must have
brightness-levels.
Sounds right.

> +
> +required:
> +  - compatible
> +  - leds
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    backlight {
> +        compatible = "led-backlight";
> +
> +        leds = <&led1>, <&led2>;
> +        brightness-levels = <0 4 8 16 32 64 128 255>;
> +        default-brightness-level = <6>;
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> deleted file mode 100644
> index 64fa2fbd98c9..000000000000
> --- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -pwm-backlight bindings
> -
> -Required properties:
> -  - compatible: "pwm-backlight"
> -  - pwms: OF device-tree PWM specification (see PWM binding[0])
> -  - power-supply: regulator for supply voltage
> -
> -Optional properties:
> -  - pwm-names: a list of names for the PWM devices specified in the
> -               "pwms" property (see PWM binding[0])
> -  - enable-gpios: contains a single GPIO specifier for the GPIO which enables
> -                  and disables the backlight (see GPIO binding[1])
> -  - post-pwm-on-delay-ms: Delay in ms between setting an initial (non-zero) PWM
> -                          and enabling the backlight using GPIO.
> -  - pwm-off-delay-ms: Delay in ms between disabling the backlight using GPIO
> -                      and setting PWM value to 0.
> -  - brightness-levels: Array of distinct brightness levels. Typically these
> -                       are in the range from 0 to 255, but any range starting at
> -                       0 will do. The actual brightness level (PWM duty cycle)
> -                       will be interpolated from these values. 0 means a 0% duty
> -                       cycle (darkest/off), while the last value in the array
> -                       represents a 100% duty cycle (brightest).
> -  - default-brightness-level: The default brightness level (index into the
> -                              array defined by the "brightness-levels" property).
> -  - num-interpolated-steps: Number of interpolated steps between each value
> -                            of brightness-levels table. This way a high
> -                            resolution pwm duty cycle can be used without
> -                            having to list out every possible value in the
> -                            brightness-level array.
> -
> -[0]: Documentation/devicetree/bindings/pwm/pwm.txt
> -[1]: Documentation/devicetree/bindings/gpio/gpio.txt
> -
> -Example:
> -
> -	backlight {
> -		compatible = "pwm-backlight";
> -		pwms = <&pwm 0 5000000>;
> -
> -		brightness-levels = <0 4 8 16 32 64 128 255>;
> -		default-brightness-level = <6>;
> -
> -		power-supply = <&vdd_bl_reg>;
> -		enable-gpios = <&gpio 58 0>;
> -		post-pwm-on-delay-ms = <10>;
> -		pwm-off-delay-ms = <10>;
> -	};
> -
> -Example using num-interpolation-steps:
> -
> -	backlight {
> -		compatible = "pwm-backlight";
> -		pwms = <&pwm 0 5000000>;
> -
> -		brightness-levels = <0 2048 4096 8192 16384 65535>;
> -		num-interpolated-steps = <2048>;
> -		default-brightness-level = <4096>;
> -
> -		power-supply = <&vdd_bl_reg>;
> -		enable-gpios = <&gpio 58 0>;
> -	};
> diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
> new file mode 100644
> index 000000000000..7e1f109a38a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/pwm-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: pwm-backlight bindings
> +
> +maintainers:
> +  - Lee Jones <lee.jones@linaro.org>
> +  - Daniel Thompson <daniel.thompson@linaro.org>
> +  - Jingoo Han <jingoohan1@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: pwm-backlight
> +
> +  pwms:
> +    maxItems: 1
> +
> +  pwm-names: true
> +
> +  power-supply:
> +    description: regulator for supply voltage
> +
> +  enable-gpios:
> +    description: Contains a single GPIO specifier for the GPIO which enables
> +      and disables the backlight
> +    maxItems: 1
> +
> +  post-pwm-on-delay-ms:
> +    description: Delay in ms between setting an initial (non-zero) PWM and
> +      enabling the backlight using GPIO.
> +
> +  pwm-off-delay-ms:
> +    description: Delay in ms between disabling the backlight using GPIO
> +      and setting PWM value to 0.
> +
> +  brightness-levels:
> +    description: Array of distinct brightness levels. Typically these are
> +      in the range from 0 to 255, but any range starting at 0 will do. The
> +      actual brightness level (PWM duty cycle) will be interpolated from
> +      these values. 0 means a 0% duty cycle (darkest/off), while the last
> +      value in the array represents a 100% duty cycle (brightest).
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  default-brightness-level:
> +    description: The default brightness level (index into the array defined
> +      by the "brightness-levels" property).
> +    $ref: /schemas/types.yaml#/definitions/uint32
Same comment as before...

> +
> +  num-interpolated-steps:
> +    description: Number of interpolated steps between each value of brightness-levels
> +      table. This way a high resolution pwm duty cycle can be used without
> +      having to list out every possible value in the brightness-level array.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +dependencies:
> +  default-brightness-level: [brightness-levels]
> +  num-interpolated-steps: [brightness-levels]
> +
> +required:
> +  - compatible
> +  - pwms
> +  - power-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    backlight {
> +        compatible = "pwm-backlight";
> +        pwms = <&pwm 0 5000000>;
> +
> +        brightness-levels = <0 4 8 16 32 64 128 255>;
> +        default-brightness-level = <6>;
> +
> +        power-supply = <&vdd_bl_reg>;
> +        enable-gpios = <&gpio 58 0>;
> +        post-pwm-on-delay-ms = <10>;
> +        pwm-off-delay-ms = <10>;
> +    };
> +
> +  - |
> +    // Example using num-interpolation-steps:
> +    backlight {
> +        compatible = "pwm-backlight";
> +        pwms = <&pwm 0 5000000>;
> +
> +        brightness-levels = <0 2048 4096 8192 16384 65535>;
> +        num-interpolated-steps = <2048>;
> +        default-brightness-level = <4096>;
> +
> +        power-supply = <&vdd_bl_reg>;
> +        enable-gpios = <&gpio 58 0>;
> +    };
> +
> +...
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
