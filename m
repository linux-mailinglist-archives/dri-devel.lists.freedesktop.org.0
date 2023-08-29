Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3618078C287
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 12:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985C610E1F7;
	Tue, 29 Aug 2023 10:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E9110E1F7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:46:59 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99bed101b70so523261266b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 03:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693306018; x=1693910818;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZquQGH3YlkI7GcHQlQ+NoYufrmiWxvCLzebRk+1WfNA=;
 b=PkEFbmKD5uma/JBHqsP6/bofddHmNMN6CD9jvliy74vDRBfO4tdCkdnDcsKA35Txai
 4rIJoj826f8gDvIqF03KZiDLdnPrzV+0iBTzFoQB0Vd3dNyIsSUKuDIeXEdTuLQHPYDi
 VKv6D8SBCbAIKeDZZFSa6BO1iTAnBIDKA5RYQC4q6/z3eo2pk79gcGq17djdhtIWGSIh
 +e4E+ZH1ts3RiSEAITZvFzJAfcCcafcPzBIyOEb5MhJqpeR+qcvGTMsV5fssXp5FvpCf
 s7NBkVyXZpwHSYDnzRmokFnADXourtpGMXx2Yr0xQ0rTp4H8hNHfErnwSEnkjiMJW8Da
 llTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693306018; x=1693910818;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZquQGH3YlkI7GcHQlQ+NoYufrmiWxvCLzebRk+1WfNA=;
 b=Gpp1sWCCsPc7s1fDU8Sjg9NunhESK10vDhSD02/bdxYvV3yEkUbFiqy4z+5eZU56Ly
 TnX+P5Bxi1+CGRhj2L27ow5siNgiSFkkXvYZi74ox6vJ3YPjgu91uElltcj1jvN6s6w7
 jOp3eBwbhXAKxUilge1zRka3/x0ov7aqYQBFmgRKPFenozLAaDyxyCobkGnbgawBqNvm
 IKJvCoFav/wylV0swqWzlf1jX7jSckH+B9W2gn+3/HKJaAOZDDSb0cyCR2XVU1dFIpdX
 ac2G+8fwhorxZlTiRpnm8jRHBq5UIbSrS9tXCAow2zmO6ynti9F+Dn6BhTBbrgpbwpow
 MkMQ==
X-Gm-Message-State: AOJu0YwjyoiPRdu5HbcMG28dcFDrEiLT0yjaOLpsSBv91L1kl5ihIx3X
 Gw12bdfq7uMCUBwwCS9ZDPKz+w==
X-Google-Smtp-Source: AGHT+IGtUs0X+65jo71fTdUePj61g8XHcY50jM3qd8wBrwjGtJJIyOztbqpenthC6XK4vZ7GXIQn4w==
X-Received: by 2002:a17:906:76d1:b0:9a3:c4f4:12de with SMTP id
 q17-20020a17090676d100b009a3c4f412demr9130372ejn.37.1693306017829; 
 Tue, 29 Aug 2023 03:46:57 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a1709063e0b00b009a1a653770bsm5768558eji.87.2023.08.29.03.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 03:46:57 -0700 (PDT)
Message-ID: <6dfae492-5533-df97-5c72-373d5e89444f@linaro.org>
Date: Tue, 29 Aug 2023 12:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 1/2] dt-bindings: backlight: Add MPS MP3309C
Content-Language: en-US
To: Flavio Suligoi <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230829101546.483189-1-f.suligoi@asem.it>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829101546.483189-1-f.suligoi@asem.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 12:15, Flavio Suligoi wrote:
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
>  .../bindings/leds/backlight/mps,mp3309c.yaml  | 202 ++++++++++++++++++
>  1 file changed, 202 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> new file mode 100644
> index 000000000000..a58904f2a271
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> @@ -0,0 +1,202 @@
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
> +  It supports both analog (via I2C commands) and PWM dimming mode.
> +
> +  The datasheet is available at:
> +  https://www.monolithicpower.com/en/mp3309c.html
> +
> +properties:
> +  compatible:
> +    const: mps,mp3309c-backlight

Drop "-backlight". Can it be anything else?

> +
> +  reg:
> +    maxItems: 1
> +
> +  mps,dimming-mode:
> +    description: The dimming mode (PWM or analog by I2C commands).
> +    $ref: '/schemas/types.yaml#/definitions/string'

Drop quotes, you should see warnings for this.

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

> +    enum:
> +      - pwm
> +      - analog-i2c

Why do you think this is a property of a board? Is PWM signal optional?
If so, its presence would define it. Otherwise it seems you want to
control the driver.

> +
> +  pinctrl-names:
> +    items:
> +      - const: default

Drop

> +
> +  pinctrl-0: true

Drop

> +
> +  pwms:
> +    description: PWM channel used for controlling the backlight in "pwm" dimming
> +      mode.
> +    maxItems: 1
> +
> +  default-brightness:
> +    minimum: 0

0 is minimum. Provide rather maximum? or just skip the property.

> +
> +  max-brightness:
> +    minimum: 1

Same concerns.

> +
> +  enable-gpios:
> +    description: GPIO used to enable the backlight in "analog-i2c" dimming mode.
> +    maxItems: 1
> +
> +  mps,switch-on-delay-ms:
> +    description: delay (in ms) before switch on the backlight, to wait for image
> +      stabilization.
> +    default: 10
> +
> +  mps,switch-off-delay-ms:
> +    description: delay (in ms) after the switch off command to the backlight.
> +    default: 0
> +
> +  mps,overvoltage-protection-13v:
> +    description: overvoltage protection set to 13.5V.
> +    type: boolean
> +  mps,overvoltage-protection-24v:
> +    description: overvoltage protection set to 24V.
> +    type: boolean
> +  mps,overvoltage-protection-35v:
> +    description: overvoltage protection set to 35.5V.
> +    type: boolean

Nope for these three. Use -microvolt suffix for one property.

> +
> +  mps,reset-gpios:
> +    description: optional GPIO to reset an external device (LCD panel, FPGA,
> +      etc.) when the backlight is switched on.
> +    maxItems: 1

No, you should not add here GPIOs for other devices.

> +
> +  mps,reset-on-delay-ms:
> +    description: delay (in s) before generating the reset-gpios.

in ms

> +    default: 10
> +
> +  mps,reset-on-length-ms:
> +    description: pulse length (in ms) for reset-gpios.
> +    default: 10
> +
> +oneOf:
> +  - required:
> +      - mps,overvoltage-protection-13v
> +  - required:
> +      - mps,overvoltage-protection-24v
> +  - required:
> +      - mps,overvoltage-protection-35.5v
> +
> +allOf:
> +  - $ref: common.yaml#
> +  - if:
> +      properties:
> +        mps,dimming-mode:
> +          contains:
> +            enum:
> +              - pwm
> +    then:
> +      required:
> +        - pwms

So this proves the point - mps,dimming-mode looks redundant and not
hardware related.

> +      not:
> +        required:
> +          - enable-gpios
> +
> +  - if:
> +      properties:
> +        mps,dimming-mode:
> +          contains:
> +            enum:
> +              - analog-i2c
> +    then:
> +      required:
> +        - enable-gpios
> +      not:
> +        required:
> +          - pwms
> +
> +required:
> +  - compatible
> +  - reg
> +  - mps,dimming-mode
> +  - max-brightness
> +  - default-brightness
> +
> +additionalProperties: false

Instead:
unevaluatedProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c3 {

i2c

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        clock-frequency = <100000>;

Drop

> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_i2c3>;
> +        status = "okay";

Drop all except of cells.

> +
> +        /* Backlight with PWM control */
> +        backlight_pwm: backlight@17 {
> +            compatible = "mps,mp3309c-backlight";
> +            reg = <0x17>;
> +            mps,dimming-mode = "pwm";
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&pinctrl_fpga_reset>;
> +            pwms = <&pwm1 0 3333333 0>; /* 300 Hz --> (1/f) * 1*10^9 */
> +            max-brightness = <100>;
> +            default-brightness = <80>;
> +            mps,switch-on-delay-ms = <800>;
> +            mps,switch-off-delay-ms = <10>;
> +            mps,overvoltage-protection-24v;
> +
> +            /*
> +             * Enable an FPGA reset pulse when MIPI data are stable,
> +             * before switch on the backlight
> +             */
> +            mps,reset-gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;

Nope, nope. FPGA reset pin is not related to this device.

> +            mps,reset-on-delay-ms = <100>;
> +            mps,reset-on-length-ms = <10>;
> +        };
> +    };
> +
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    /* Backlight with analog control via I2C bus */
> +    i2c3 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        clock-frequency = <100000>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_i2c3>;
> +        status = "okay";

Drop entire example. It differs by one property - missing pwms.


Best regards,
Krzysztof

