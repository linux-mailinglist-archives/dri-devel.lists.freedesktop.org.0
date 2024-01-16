Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6452B82F6F4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 21:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99DBC10E199;
	Tue, 16 Jan 2024 20:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09A910E199
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 20:12:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 24392C524C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 20:11:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2233040004;
 Tue, 16 Jan 2024 20:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1705435856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=boLTDxiJRvuGbhONOmfvkdNsFpD/vXpoBMU87w5mD8k=;
 b=WbvBWDaHd/y7DH+O+mClgauo0TFfzW4s+WOGBo3FcocXlI/MIYyhppWOD2/Z6hylV41+k9
 GdwSS39jouA2y9ffGk+8N1/TzyZr53wdHTLznzIIWSQWmlGuPZwcP8BHW0TuIkrmnSGd5y
 +sfyhiB7D65S7C8N0437c5c0D3+wavBZuQPPOmQLNX7hQfBJvKsRwBGg0lg9sAHuFvOEJ+
 St5QGEKDC7/D9tK16XhPFi+F0QsWJY/1vqCQkvl0FaFR4Se7bneP64Bh53ZuMoRlwRByCC
 +C/rbOd1tQ8R42DeSxsRApcjsCqf/AuCTGf1KEz1VaKynENntWKecBLyifB2sQ==
Date: Tue, 16 Jan 2024 21:10:52 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: atmel, hlcdc: convert pwm bindings to
 json-schema
Message-ID: <20240116201052544a0791@mail.local>
References: <20240116113800.82529-1-dharma.b@microchip.com>
 <20240116113800.82529-3-dharma.b@microchip.com>
 <20240116-rising-gap-df4124f191a0@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116-rising-gap-df4124f191a0@spud>
X-GND-Sasl: alexandre.belloni@bootlin.com
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
Cc: linux4microchip@microchip.com, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas.ferre@microchip.com,
 conor.dooley@microchip.com, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, claudiu.beznea@tuxon.dev, airlied@gmail.com,
 sam@ravnborg.org, lee@kernel.org,
 Dharma Balasubiramani <dharma.b@microchip.com>, u.kleine-koenig@pengutronix.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/01/2024 18:03:19+0000, Conor Dooley wrote:
> On Tue, Jan 16, 2024 at 05:07:59PM +0530, Dharma Balasubiramani wrote:
> > Convert device tree bindings for Atmel's HLCDC PWM controller to YAML
> > format.
> > 
> > Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> > ---
> > changelog
> > v1 -> v2
> > - Remove the explicit copyrights.
> > - Modify title (not include words like binding/driver).
> > - Modify description actually describing the hardware and not the driver.
> > - Remove pinctrl properties which aren't required.
> > - Drop parent node and it's other sub-device node which are not related here.
> > ---
> >  .../bindings/pwm/atmel,hlcdc-pwm.yaml         | 47 +++++++++++++++++++
> >  .../bindings/pwm/atmel-hlcdc-pwm.txt          | 29 ------------
> >  2 files changed, 47 insertions(+), 29 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml b/Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml
> > new file mode 100644
> > index 000000000000..751122309fa9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> 
> The original file has no license, but was originally written by a
> free-electrons employee, so the relicensing here is fine.
> 

I confirm relicensing is fine, even assigning the copyright to
Microchip (note that Bootlin is legally the same entity as
free-electrons)

> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pwm/atmel,hlcdc-pwm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Atmel's HLCDC's PWM controller
> > +
> > +maintainers:
> > +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> > +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> > +  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
> > +
> > +description: |
> 
> Again, the | is not needed here.
> 
> > +  The LCDC integrates a Pulse Width Modulation (PWM) Controller. This block
> > +  generates the LCD contrast control signal (LCD_PWM) that controls the
> > +  display's contrast by software. LCDC_PWM is an 8-bit PWM signal that can be
> > +  converted to an analog voltage with a simple passive filter. LCD display
> > +  panels have different backlight specifications in terms of minimum/maximum
> > +  values for PWM frequency. If the LCDC PWM frequency range does not match the
> > +  LCD display panel, it is possible to use the standalone PWM Controller to
> > +  drive the backlight.
> > +
> > +properties:
> > +  compatible:
> > +    const: atmel,hlcdc-pwm
> > +
> > +  "#pwm-cells":
> > +    const: 3
> > +    description: |
> > +      This PWM chip uses the default 3 cells bindings defined in pwm.yaml in
> > +      this directory.
> 
> I would delete this description tbh.
> 
> > +
> > +required:
> > +  - compatible
> > +  - "#pwm-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pwm: pwm {
> > +      compatible = "atmel,hlcdc-pwm";
> > +      pinctrl-names = "default";
> > +      pinctrl-0 = <&pinctrl_lcd_pwm>;
> > +      #pwm-cells = <3>;
> > +    };
> 
> The label here is not used and can be dropped. Otherwise,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> 
> Cheers,
> Conor.
> 
> > diff --git a/Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.txt b/Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.txt
> > deleted file mode 100644
> > index afa501bf7f94..000000000000
> > --- a/Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.txt
> > +++ /dev/null
> > @@ -1,29 +0,0 @@
> > -Device-Tree bindings for Atmel's HLCDC (High-end LCD Controller) PWM driver
> > -
> > -The Atmel HLCDC PWM is subdevice of the HLCDC MFD device.
> > -See ../mfd/atmel-hlcdc.txt for more details.
> > -
> > -Required properties:
> > - - compatible: value should be one of the following:
> > -   "atmel,hlcdc-pwm"
> > - - pinctr-names: the pin control state names. Should contain "default".
> > - - pinctrl-0: should contain the pinctrl states described by pinctrl
> > -   default.
> > - - #pwm-cells: should be set to 3. This PWM chip use the default 3 cells
> > -   bindings defined in pwm.yaml in this directory.
> > -
> > -Example:
> > -
> > -	hlcdc: hlcdc@f0030000 {
> > -		compatible = "atmel,sama5d3-hlcdc";
> > -		reg = <0xf0030000 0x2000>;
> > -		clocks = <&lcdc_clk>, <&lcdck>, <&clk32k>;
> > -		clock-names = "periph_clk","sys_clk", "slow_clk";
> > -
> > -		hlcdc_pwm: hlcdc-pwm {
> > -			compatible = "atmel,hlcdc-pwm";
> > -			pinctrl-names = "default";
> > -			pinctrl-0 = <&pinctrl_lcd_pwm>;
> > -			#pwm-cells = <3>;
> > -		};
> > -	};
> > -- 
> > 2.25.1
> > 



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
