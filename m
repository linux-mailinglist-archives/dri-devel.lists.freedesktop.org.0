Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE28203D40
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 18:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782FB6E5C8;
	Mon, 22 Jun 2020 16:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6784C6E135
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 16:57:34 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g21so283607wmg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 09:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F+nlUAhHEbsgDoArBUNdvvaIbV4AUsHI2HbfVWN8ih0=;
 b=ZiXCU+2An8ajIuIk/jVXiqjUZ6QhL/GTYo7OKI7BEariTuLskGO4iJ4u2Mmj+YpjRy
 heQ7oBLCcTWv5Liiyva55Ni+yPP9jZap/wVaIVx5TWCfhs7vwsUxsmTbfcz/NTwpoKB5
 vuYu14wLQK8OCg4x7FMkcDE7moG5zK7cLYIFEycAFEqA9Kuh1cp5kN5SLErAZ/oUe3IE
 JGNy6459N+IPwcGTWR8hYWGhey1TQGH+EIoI4CJzOr0BFqG8RcQ9/ocy3ehQut/sWPU8
 UcGk6Ygvgo+B9gq5S5MFjZ+LAJEFOLvykrKDyR/9LtZCmIjL+4AZGY+ZSAcsWmCJHmi0
 D6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F+nlUAhHEbsgDoArBUNdvvaIbV4AUsHI2HbfVWN8ih0=;
 b=iRTieDNkJz2yZuo+teEQLqS7lht2uVVZyjREY4H4y8/e7jg+DBrNLx033Wj81MEosX
 LFi5IlTRETGhCNb+m54mgDR6Uv4QzHP/Jgg5a3LRNeG6IKCgUOQWRZuhhy9IOFoM0JSh
 JgbjZTJ+U9frMQJ6M+eAatb9yE0etNyJdwLRRqK7tiWUGvUr6SJh/Cyapf1UXco08Vef
 J4LU6JPDTEXKVZj6W6fQpnMQI9KNvjmV4eldbo41UimdaOuv6CPmbbe2NbF1AfUr5CpN
 xuaCE7gHu/WdFY53yhWgUJSx1U7y+HDmQhdNFQVm5QCkyAp472VmbjqEl1G5eNPwOVfo
 LeGQ==
X-Gm-Message-State: AOAM533IiO6o0aA932iwgaFz7F5yVqHtkfNwRxW6mckI0B27pN83Dgr/
 ZRaS88Ml4sz06sORemdksrdyzB0J+DI=
X-Google-Smtp-Source: ABdhPJwC+mgtdB3qpfYTUZ3BE0gyIVx6GhzJ1K2c92QPj0jBT2j5czIy0RQw3+GtlciTGxhLBPoMoA==
X-Received: by 2002:a1c:6a01:: with SMTP id f1mr18924478wmc.52.1592845053002; 
 Mon, 22 Jun 2020 09:57:33 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s18sm20653700wra.85.2020.06.22.09.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 09:57:32 -0700 (PDT)
Date: Mon, 22 Jun 2020 17:57:30 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] dt-bindings: backlight: Convert common backlight
 bindings to DT schema
Message-ID: <20200622165730.pnx7fzbq5e6q5h4l@holly.lan>
References: <20200618224413.1115849-1-robh@kernel.org>
 <20200619215341.GA6857@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200619215341.GA6857@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 19, 2020 at 11:53:41PM +0200, Sam Ravnborg wrote:
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
> > new file mode 100644
> > index 000000000000..7e1f109a38a4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
> > @@ -0,0 +1,98 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/pwm-backlight.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: pwm-backlight bindings
> > +
> > +maintainers:
> > +  - Lee Jones <lee.jones@linaro.org>
> > +  - Daniel Thompson <daniel.thompson@linaro.org>
> > +  - Jingoo Han <jingoohan1@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: pwm-backlight
> > +
> > +  pwms:
> > +    maxItems: 1
> > +
> > +  pwm-names: true
> > +
> > +  power-supply:
> > +    description: regulator for supply voltage
> > +
> > +  enable-gpios:
> > +    description: Contains a single GPIO specifier for the GPIO which enables
> > +      and disables the backlight
> > +    maxItems: 1
> > +
> > +  post-pwm-on-delay-ms:
> > +    description: Delay in ms between setting an initial (non-zero) PWM and
> > +      enabling the backlight using GPIO.
> > +
> > +  pwm-off-delay-ms:
> > +    description: Delay in ms between disabling the backlight using GPIO
> > +      and setting PWM value to 0.
> > +
> > +  brightness-levels:
> > +    description: Array of distinct brightness levels. Typically these are
> > +      in the range from 0 to 255, but any range starting at 0 will do. The
> > +      actual brightness level (PWM duty cycle) will be interpolated from
> > +      these values. 0 means a 0% duty cycle (darkest/off), while the last
> > +      value in the array represents a 100% duty cycle (brightest).
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +  default-brightness-level:
> > +    description: The default brightness level (index into the array defined
> > +      by the "brightness-levels" property).
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> Same comment as before...

Sorry the "ditto" meant I didn't thing about PWM as much as I should
have.

The situation for PWM is a little different to LED. That's mostly
because we decided not to clutter the LED code with
"num-interpolated-steps".

The PWM code implements the default-brightness-level as an index into
the brightness array *after* it has been expanded using interpolation.
In other words today Linux treats the default-brightness-level more
like[1].

    description: The default brightness level. When
      num-interpolated-steps is not set this is simply an index into
      the array defined by the "brightness-levels" property. If
      num-interpolated-steps is set the brightness array will be
      expanded by interpolation before we index to get a default
      level.

This is the best I have come up with so far... but I concede it still
lacks elegance.


Daniel.


[1] I don't know my way round the BSD code bases to be sure what they
    do... I did a couple of web searches but didn't pull up anything
    definitive.


> 
> > +
> > +  num-interpolated-steps:
> > +    description: Number of interpolated steps between each value of brightness-levels
> > +      table. This way a high resolution pwm duty cycle can be used without
> > +      having to list out every possible value in the brightness-level array.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +dependencies:
> > +  default-brightness-level: [brightness-levels]
> > +  num-interpolated-steps: [brightness-levels]
> > +
> > +required:
> > +  - compatible
> > +  - pwms
> > +  - power-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    backlight {
> > +        compatible = "pwm-backlight";
> > +        pwms = <&pwm 0 5000000>;
> > +
> > +        brightness-levels = <0 4 8 16 32 64 128 255>;
> > +        default-brightness-level = <6>;
> > +
> > +        power-supply = <&vdd_bl_reg>;
> > +        enable-gpios = <&gpio 58 0>;
> > +        post-pwm-on-delay-ms = <10>;
> > +        pwm-off-delay-ms = <10>;
> > +    };
> > +
> > +  - |
> > +    // Example using num-interpolation-steps:
> > +    backlight {
> > +        compatible = "pwm-backlight";
> > +        pwms = <&pwm 0 5000000>;
> > +
> > +        brightness-levels = <0 2048 4096 8192 16384 65535>;
> > +        num-interpolated-steps = <2048>;
> > +        default-brightness-level = <4096>;
> > +
> > +        power-supply = <&vdd_bl_reg>;
> > +        enable-gpios = <&gpio 58 0>;
> > +    };
> > +
> > +...
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
