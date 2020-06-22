Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AA5203904
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 16:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B906E817;
	Mon, 22 Jun 2020 14:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457C16E817
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 14:22:20 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t194so15916663wmt.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 07:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bJSKL8sfjoItMlLZIHvSZPyc9+WORmnIJIkfFHS/Uhc=;
 b=feZREHIMAeCKCnPPAFWeIamudTiI2hndBHx8gCPufSriYMHHewVeh8yLFbdjBYhuS/
 A7GFYLPR5RoZndfJUADG4GY/2u8/Uia7jurvKStBl3zH6uZRkywjEoVw01+kE0NChzOc
 VN05+Rp1Sm0iCKvlcmDNjItZq1FNxg3So8FZSWXsKC9bHlU417QwWol6je2VQmdoVK1u
 h/iuxoXJnWtiXbi76Ddc5mT8jtZKGWInHVYFSgp4KEQGCcVQNiGx01PmlHOThUnGGGWR
 5ycd2gUnQ5/GOeZJkSZF4P2Xt4++bax/z9Y374W5fF6tYepk4CwEEDjmj/dB1HSPxPMS
 rNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bJSKL8sfjoItMlLZIHvSZPyc9+WORmnIJIkfFHS/Uhc=;
 b=VwSs5mKOMfonMDwfAtuA93jkyctUoOdyG7JT4+eyDNvpBGgnK0cKf8hxPX7IWiNd+3
 2dokoLkaYPz1BnsWZyYhrq559V3LhkPi3HWmd8VQ6ixJkbOIgjEPQuFU5Nz/WzJjABN/
 1yev6pIQuZC3g/RmxHvfOLTmMYSCAwv1+zuff0GmYT2u/7j1tuyKBhwiqmpNYFXBJsD/
 JBJj4m1trZVgNmTjLV32y4V+3pytVjRbpMpg97gGHIn7mK/erLuAkBj6EqJk0C6J1ceQ
 ol53yXVSGg5DCzZgmvgWvhWcGQiF/nL9ijoN8+LoZed12OmgAwrx2UE8oXJJTvqznecv
 X5Rg==
X-Gm-Message-State: AOAM5307uoWfxGOZWUpZNzWC3bdlPQsobrfU0XusWB4oPBYmfepPhYD3
 pU5outbDIyUmnQsKw+afhleEkA==
X-Google-Smtp-Source: ABdhPJwa0y5j0FoupL7KxiiKxqCc0LORL3TMqBTcZBpU8Hjnw6rSwhmgMhnha+I5P52T/2yZa/ljwg==
X-Received: by 2002:a1c:e303:: with SMTP id a3mr1000199wmh.26.1592835738837;
 Mon, 22 Jun 2020 07:22:18 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id v24sm20804558wrd.92.2020.06.22.07.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 07:22:17 -0700 (PDT)
Date: Mon, 22 Jun 2020 15:22:15 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: backlight: Convert common backlight
 bindings to DT schema
Message-ID: <20200622142215.biy2g6sd44czky4u@holly.lan>
References: <20200618224413.1115849-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618224413.1115849-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jingoo Han <jingoohan1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

...


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
> +
> +  default-brightness-level:
> +    description: The default brightness level (index into the array defined
> +      by the "brightness-levels" property).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +dependencies:
> +  default-brightness-level: [brightness-levels]

I don't think there is a dependency here. default-brightness-level still
makes sense with there is no mapping table present.

Based on Sam's feedback perhaps adding ("if one is provided") to the
parenthetic text.


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

Just for the record, these dependencies are OK. Iit isn't really a good
idea to map 1:1 to a PWM since we end up with a gazillion
indistinguishable levels so the bindings (and the driver) to not allow
such a mode.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
