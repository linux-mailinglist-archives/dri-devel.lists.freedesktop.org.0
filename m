Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA47C0161
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 18:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC9410E167;
	Tue, 10 Oct 2023 16:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA4D10E167
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 16:15:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 10833CE1F21;
 Tue, 10 Oct 2023 16:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A06BC433C9;
 Tue, 10 Oct 2023 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696954519;
 bh=kQ2iDBdPLPq+PkT4qaZo/GhZJCoCv5+ORm9na2Gd43Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i06qqhVwMRaYPZiIodAKuE9bsZUzbH12d7+xwnM4CvaJ+O5dnZB57DT/8sBZHHxwm
 qvRkl9GsEHltDHyY985VYKcm3qDWnzjPcsLYRAA/78G3SkwZY96spiutPJvzzHNgg0
 myiQSGDgYBlVKRjhw6uoyEO3yWxHWeiiADQgTZ384vlFagoo5jzhFfiP4NQokLE7/1
 W9hF+snYo3h2Duisods1nD20/4PsySyOJTXAztrPH0pfYHlqC/uo0Y77oO3WdvePQh
 fByDUAUizrqKOhFYpYo9aGeieCfMvZQFAtWSLVnNCAw1zu/Gtcawbxk6YFPpVQuS8m
 8a+nqEaCkv/hg==
Received: (nullmailer pid 998583 invoked by uid 1000);
 Tue, 10 Oct 2023 16:15:12 -0000
Date: Tue, 10 Oct 2023 11:15:12 -0500
From: Rob Herring <robh@kernel.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v4 1/2] dt-bindings: backlight: Add MPS MP3309C
Message-ID: <20231010161512.GA944015-robh@kernel.org>
References: <20231010121621.3009154-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010121621.3009154-1-f.suligoi@asem.it>
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
 linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 10, 2023 at 02:16:21PM +0200, Flavio Suligoi wrote:
> The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featuring a
> programmable switching frequency to optimize efficiency.
> The brightness can be controlled either by I2C commands (called "analog"
> mode) or by a PWM input signal (PWM mode).
> This driver supports both modes.
> 
> For device driver details, please refer to:
> - drivers/video/backlight/mp3309c_bl.c
> 
> The datasheet is available at:
> - https://www.monolithicpower.com/en/mp3309c.html
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
> 
> v4:
>  - remove not more used allOf keyword
>  - add brightness-levels and default-brightness properties
>  - remove max-brightness and default-brightness from required properties
>  - update example, adding brightness-levels and default-brightness properties
> v3:
>  - add default value for mps,overvoltage-protection-microvolt property
>  - fix the example, changing from "mps,mp3309c-backlight" to "mps,mp3309c" in
>    compatible property
> v2:
>  - remove useless properties (dimming-mode, pinctrl-names, pinctrl-0,
>    switch-on-delay-ms, switch-off-delay-ms, reset-gpios, reset-on-delay-ms,
>    reset-on-length-ms)
>  - add common.yaml#
>  - remove already included properties (default-brightness, max-brightness)
>  - substitute three boolean properties, used for the overvoltage-protection
>    values, with a single enum property
>  - remove some conditional definitions
>  - remove the 2nd example
> v1:
>  - first version
> 
>  .../bindings/leds/backlight/mps,mp3309c.yaml  | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> new file mode 100644
> index 000000000000..e2f9ae2b3fb4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/mps,mp3309c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MPS MP3309C backlight
> +
> +maintainers:
> +  - Flavio Suligoi <f.suligoi@asem.it>
> +
> +description: |
> +  The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featuring a
> +  programmable switching frequency to optimize efficiency.
> +  It supports two different dimming modes:
> +
> +  - analog mode, via I2C commands, as default mode (32 dimming levels)
> +  - PWM controlled mode (optional)
> +
> +  The datasheet is available at:
> +  https://www.monolithicpower.com/en/mp3309c.html
> +
> +properties:
> +  compatible:
> +    const: mps,mp3309c
> +
> +  reg:
> +    maxItems: 1
> +
> +  pwms:
> +    description: if present, the backlight is controlled in PWM mode.
> +    maxItems: 1
> +
> +  enable-gpios:
> +    description: GPIO used to enable the backlight in "analog-i2c" dimming mode.
> +    maxItems: 1
> +
> +  brightness-levels:
> +    description:
> +      Array of distinct brightness levels, in PWM dimming mode.
> +      Typically these are in the range from 0 to 255, but any range starting
> +      at 0 will do.
> +      The 0 value means a 0% duty cycle (darkest/off), while the last value in
> +      the array represents a 100% duty cycle (brightest).
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

This already has a type defined. Please add it to backlight/common.yaml 
and remove from led-backlight.yaml and pwm-backlight.yaml.

You say 0-255 here, but your example is 0-10. One of those seems wrong. 
Anyways, don't define constraints in prose, use a schema:

items:
  maximum: 10 (or 255?)

> +
> +  default-brightness:
> +    description:
> +      The default brightness (index into the levels array).
> +    $ref: /schemas/types.yaml#/definitions/uint32

Already has a type. You need to reference backlight/common.yaml.

> +
> +  mps,overvoltage-protection-microvolt:
> +    description: Overvoltage protection (13.5V, 24V or 35.5V).
> +    enum: [ 13500000, 24000000, 35500000 ]
> +    default: 35500000
> +
> +  mps,no-sync-mode:
> +    description: disable synchronous rectification mode
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        /* Backlight with PWM control */
> +        backlight_pwm: backlight@17 {
> +            compatible = "mps,mp3309c";
> +            reg = <0x17>;
> +            pwms = <&pwm1 0 3333333 0>; /* 300 Hz --> (1/f) * 1*10^9 */
> +            brightness-levels = <0 1 2 3 4 5 6 7 8 9 10>;
> +            default-brightness = <8>;
> +            mps,overvoltage-protection-microvolt = <24000000>;
> +        };
> +    };
> -- 
> 2.34.1
> 
