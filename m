Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D78620D599
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 21:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA41489F99;
	Mon, 29 Jun 2020 19:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1863589F97
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 19:38:00 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF7722076C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 19:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593459479;
 bh=IxP7fkKngaycJwsg21YV+tvkJ91Wj/BE51SsDiZ/4k8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sb7NGoy7T/HwxKy8QYvemUwy3DhQCubraado/xaW5kE1It/wO5zWa02cLwxkKlDun
 FNvofZFfbaECarbvSqXT5Ocyk9BDO/wT+yRsxZyh111mndxwKLBeNp2D+Nvoe98cr0
 iJ+dcVMJIHFs1G137M/dvcD5voKNYOQUl9Po0L0s=
Received: by mail-ot1-f54.google.com with SMTP id t18so3754109otq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 12:37:59 -0700 (PDT)
X-Gm-Message-State: AOAM5337BIQ2Z+9kCyookPoRWEuwj3M7mKAhgXVmkxm4v/XF5FyFiuOC
 qFecHSC66yXwZlWoWg9AHhzqmkdI5I6Kd20StQ==
X-Google-Smtp-Source: ABdhPJz6kmqtXJ1OIC7MMXmPStyq8zxaV71RF1e7y0B2HRZcYqLhuf4XSQqPFMKWaNblWCA07w8uXnCW74H/zUsItAM=
X-Received: by 2002:a05:6830:3104:: with SMTP id
 b4mr14923890ots.192.1593459479172; 
 Mon, 29 Jun 2020 12:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200618224413.1115849-1-robh@kernel.org>
 <20200619215341.GA6857@ravnborg.org>
In-Reply-To: <20200619215341.GA6857@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 29 Jun 2020 13:37:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJcL6VJXiTGyAAs-UCD24wxh4NBAs_SntLomwUTo6Qhzw@mail.gmail.com>
Message-ID: <CAL_JsqJcL6VJXiTGyAAs-UCD24wxh4NBAs_SntLomwUTo6Qhzw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: backlight: Convert common backlight bindings
 to DT schema
To: Sam Ravnborg <sam@ravnborg.org>
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
 Jingoo Han <jingoohan1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 19, 2020 at 3:53 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> Good to have these converted. A few comments in the following. One
> comment is for the backlight people as you copied the original text.
>
>         Sam
>
> On Thu, Jun 18, 2020 at 04:44:13PM -0600, Rob Herring wrote:
> > Convert the common GPIO, LED, and PWM backlight bindings to DT schema
> > format.
> >
> > Given there's only 2 common properties and the descriptions are slightly
> > different, I opted to not create a common backlight schema.
> >
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../leds/backlight/gpio-backlight.txt         | 16 ---
> >  .../leds/backlight/gpio-backlight.yaml        | 41 ++++++++
> >  .../bindings/leds/backlight/led-backlight.txt | 28 ------
> >  .../leds/backlight/led-backlight.yaml         | 58 +++++++++++
> >  .../bindings/leds/backlight/pwm-backlight.txt | 61 ------------
> >  .../leds/backlight/pwm-backlight.yaml         | 98 +++++++++++++++++++
> >  6 files changed, 197 insertions(+), 105 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/gpio-backlight.txt
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/pwm-backlight.txt
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.txt
> > deleted file mode 100644
> > index 321be6640533..000000000000
> > --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.txt
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -gpio-backlight bindings
> > -
> > -Required properties:
> > -  - compatible: "gpio-backlight"
> > -  - gpios: describes the gpio that is used for enabling/disabling the backlight.
> > -    refer to bindings/gpio/gpio.txt for more details.
> > -
> > -Optional properties:
> > -  - default-on: enable the backlight at boot.
> > -
> > -Example:
> > -     backlight {
> > -             compatible = "gpio-backlight";
> > -             gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>;
> > -             default-on;
> > -     };
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> > new file mode 100644
> > index 000000000000..75cc569b9c55
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> > @@ -0,0 +1,41 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/gpio-backlight.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: gpio-backlight bindings
> > +
> > +maintainers:
> > +  - Lee Jones <lee.jones@linaro.org>
> > +  - Daniel Thompson <daniel.thompson@linaro.org>
> > +  - Jingoo Han <jingoohan1@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: gpio-backlight
> > +
> > +  gpios:
> > +    description: The gpio that is used for enabling/disabling the backlight.
> > +    maxItems: 1
> > +
> > +  default-on:
> > +    description: enable the backlight at boot.
> > +    type: boolean
> > +
> > +required:
> > +  - compatible
> > +  - gpios
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    backlight {
> > +        compatible = "gpio-backlight";
> > +        gpios = <&gpio3 4 GPIO_ACTIVE_HIGH>;
> > +        default-on;
> > +    };
> > +
> > +...
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> > deleted file mode 100644
> > index 4c7dfbe7f67a..000000000000
> > --- a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -led-backlight bindings
> > -
> > -This binding is used to describe a basic backlight device made of LEDs.
> > -It can also be used to describe a backlight device controlled by the output of
> > -a LED driver.
> > -
> > -Required properties:
> > -  - compatible: "led-backlight"
> > -  - leds: a list of LEDs
> > -
> > -Optional properties:
> > -  - brightness-levels: Array of distinct brightness levels. The levels must be
> > -                       in the range accepted by the underlying LED devices.
> > -                       This is used to translate a backlight brightness level
> > -                       into a LED brightness level. If it is not provided, the
> > -                       identity mapping is used.
> > -
> > -  - default-brightness-level: The default brightness level.
> > -
> > -Example:
> > -
> > -     backlight {
> > -             compatible = "led-backlight";
> > -
> > -             leds = <&led1>, <&led2>;
> > -             brightness-levels = <0 4 8 16 32 64 128 255>;
> > -             default-brightness-level = <6>;
> > -     };
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> > new file mode 100644
> > index 000000000000..ae50945d2798
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/led-backlight.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: led-backlight bindings
> > +
> > +maintainers:
> > +  - Lee Jones <lee.jones@linaro.org>
> > +  - Daniel Thompson <daniel.thompson@linaro.org>
> > +  - Jingoo Han <jingoohan1@gmail.com>
> > +
> > +description:
> > +  This binding is used to describe a basic backlight device made of LEDs. It
> > +  can also be used to describe a backlight device controlled by the output of
> > +  a LED driver.
> > +
> > +properties:
> > +  compatible:
> > +    const: led-backlight
> > +
> > +  leds:
> > +    description: A list of LED nodes
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +
> > +  brightness-levels:
> > +    description: Array of distinct brightness levels. The levels must be
> > +      in the range accepted by the underlying LED devices. This is used
> > +      to translate a backlight brightness level into a LED brightness level.
> > +      If it is not provided, the identity mapping is used.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> bike-shedding. To me it is a tad easier to read when multi-line
> descriptions are on a separate line.
> So "description:" on one line, and the text on following lines.
> example-schema.yaml does both - so both are official acceptable.

I agree, but the one issue is ruamel yaml wants it the above way
unless you do '|' (or really '>' may be the correct annotation here).
That's mainly an issue if doing tree wide yaml->python
processing->yaml transformations. But if the line lengths don't match
exactly what ruamel is set to, then it reformats it anyways, so in the
end it doesn't really matter. I just have to filter out unwanted
reformatting (until ruamel can really do roundtrips with no
reformatting).

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
