Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DA520D57C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 21:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CAB89DFC;
	Mon, 29 Jun 2020 19:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5AB89E11
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 19:18:51 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 5F29F20024;
 Mon, 29 Jun 2020 21:18:49 +0200 (CEST)
Date: Mon, 29 Jun 2020 21:18:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: backlight: Convert common backlight
 bindings to DT schema
Message-ID: <20200629191847.GA318506@ravnborg.org>
References: <20200618224413.1115849-1-robh@kernel.org>
 <20200619215341.GA6857@ravnborg.org>
 <20200622165730.pnx7fzbq5e6q5h4l@holly.lan>
 <CAL_JsqK1yJ09k6tKak==TjRN17VzueVkcf-WOLw2ETL2ZJv9sg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqK1yJ09k6tKak==TjRN17VzueVkcf-WOLw2ETL2ZJv9sg@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=KKAkSRfTAAAA:8 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8
 a=wNlRYuuYm4J86z4hMpcA:9 a=hv1kb02ZR_FIT1_D:21 a=XilPnIEmbnQ7gt8O:21
 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22 a=sptkURWiP4Gy88Gu7hUp:22
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

On Mon, Jun 29, 2020 at 11:57:37AM -0600, Rob Herring wrote:
> On Mon, Jun 22, 2020 at 10:57 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Fri, Jun 19, 2020 at 11:53:41PM +0200, Sam Ravnborg wrote:
> > > > diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
> > > > new file mode 100644
> > > > index 000000000000..7e1f109a38a4
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
> > > > @@ -0,0 +1,98 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/leds/backlight/pwm-backlight.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: pwm-backlight bindings
> > > > +
> > > > +maintainers:
> > > > +  - Lee Jones <lee.jones@linaro.org>
> > > > +  - Daniel Thompson <daniel.thompson@linaro.org>
> > > > +  - Jingoo Han <jingoohan1@gmail.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: pwm-backlight
> > > > +
> > > > +  pwms:
> > > > +    maxItems: 1
> > > > +
> > > > +  pwm-names: true
> > > > +
> > > > +  power-supply:
> > > > +    description: regulator for supply voltage
> > > > +
> > > > +  enable-gpios:
> > > > +    description: Contains a single GPIO specifier for the GPIO which enables
> > > > +      and disables the backlight
> > > > +    maxItems: 1
> > > > +
> > > > +  post-pwm-on-delay-ms:
> > > > +    description: Delay in ms between setting an initial (non-zero) PWM and
> > > > +      enabling the backlight using GPIO.
> > > > +
> > > > +  pwm-off-delay-ms:
> > > > +    description: Delay in ms between disabling the backlight using GPIO
> > > > +      and setting PWM value to 0.
> > > > +
> > > > +  brightness-levels:
> > > > +    description: Array of distinct brightness levels. Typically these are
> > > > +      in the range from 0 to 255, but any range starting at 0 will do. The
> > > > +      actual brightness level (PWM duty cycle) will be interpolated from
> > > > +      these values. 0 means a 0% duty cycle (darkest/off), while the last
> > > > +      value in the array represents a 100% duty cycle (brightest).
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +
> > > > +  default-brightness-level:
> > > > +    description: The default brightness level (index into the array defined
> > > > +      by the "brightness-levels" property).
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > Same comment as before...
> >
> > Sorry the "ditto" meant I didn't thing about PWM as much as I should
> > have.
> >
> > The situation for PWM is a little different to LED. That's mostly
> > because we decided not to clutter the LED code with
> > "num-interpolated-steps".
> >
> > The PWM code implements the default-brightness-level as an index into
> > the brightness array *after* it has been expanded using interpolation.
> > In other words today Linux treats the default-brightness-level more
> > like[1].
> >
> >     description: The default brightness level. When
> >       num-interpolated-steps is not set this is simply an index into
> >       the array defined by the "brightness-levels" property. If
> >       num-interpolated-steps is set the brightness array will be
> >       expanded by interpolation before we index to get a default
> >       level.
> >
> > This is the best I have come up with so far... but I concede it still
> > lacks elegance.
> 
> Happy to add this or whatever folks want if there's agreement, but I
> don't want to get bogged down on re-reviewing and re-writing the
> binding on what is just a conversion. There's a mountain of bindings
> to convert.
The original explanation is ok, as pointed out by Daniel.
So I suggest moving forward with that and then others can improve the
descriptions later as necessary.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
