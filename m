Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31AD832F7F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 20:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB20510EA6B;
	Fri, 19 Jan 2024 19:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A3F10EA5F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 19:45:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 110FECE1D6E;
 Fri, 19 Jan 2024 19:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FBCC433C7;
 Fri, 19 Jan 2024 19:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705693536;
 bh=ZLRFh8jAtCz6PPqki5bAxQzNfDJr0iQNBuuoCLP1jyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i8qlEF5lFfm1rnknBphId32t07uJ2nWjZ0/vbiPRCdIJBTGH3RGmYFFCigwhoDjuK
 pGvDBpEd3bg9kRqQBr2nd2+zOlbXyEQMy1eEDclTbGqmNl1sL5vngXy3TvavH1eG5K
 t83Sb2pV54FQfxvF4wf/dzRlharZnoV7WWdmB2/dzUKd0BXalzqIFCSxcGN23ujhTK
 iGVUrXYmcIySuzr6IIKdxbbqup7CATqsBYPI1ozLYJZPxapqjL1MTfLuSkQvJUdb6x
 YDIEwjUvntaq11XQmZBCDnqRJuFqa9/nPYX2DFSYHq7BWK3+WJiaGmofo2U+O0vmA5
 9HAR7B0e5IcWQ==
Date: Fri, 19 Jan 2024 13:45:34 -0600
From: Rob Herring <robh@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: atmel, hlcdc: convert pwm bindings to
 json-schema
Message-ID: <20240119194534.GA938671-robh@kernel.org>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118092612.117491-3-dharma.b@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118092612.117491-3-dharma.b@microchip.com>
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
 alexandre.belloni@bootlin.com, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, conor.dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, sam@ravnborg.org, lee@kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 02:56:11PM +0530, Dharma Balasubiramani wrote:
> Convert device tree bindings for Atmel's HLCDC PWM controller to YAML
> format.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> changelog
> v2 -> v3
> - Remove '|' in description, as there is no formatting to preserve.
> - Delete the description for pwm-cells.
> - Drop the label for pwm node as it not used.
> v1 -> v2
> - Remove the explicit copyrights.
> - Modify title (not include words like binding/driver).
> - Modify description actually describing the hardware and not the driver.
> - Remove pinctrl properties which aren't required.
> - Drop parent node and it's other sub-device node which are not related here.
> ---
>  .../bindings/pwm/atmel,hlcdc-pwm.yaml         | 44 +++++++++++++++++++
>  .../bindings/pwm/atmel-hlcdc-pwm.txt          | 29 ------------
>  2 files changed, 44 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pwm/atmel-hlcdc-pwm.txt
> 
> diff --git a/Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml b/Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml
> new file mode 100644
> index 000000000000..4f4cc21fe4f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/atmel,hlcdc-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel's HLCDC's PWM controller
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
> +
> +description:
> +  The LCDC integrates a Pulse Width Modulation (PWM) Controller. This block
> +  generates the LCD contrast control signal (LCD_PWM) that controls the
> +  display's contrast by software. LCDC_PWM is an 8-bit PWM signal that can be
> +  converted to an analog voltage with a simple passive filter. LCD display
> +  panels have different backlight specifications in terms of minimum/maximum
> +  values for PWM frequency. If the LCDC PWM frequency range does not match the
> +  LCD display panel, it is possible to use the standalone PWM Controller to
> +  drive the backlight.
> +
> +properties:
> +  compatible:
> +    const: atmel,hlcdc-pwm
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +required:
> +  - compatible
> +  - "#pwm-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pwm {
> +      compatible = "atmel,hlcdc-pwm";
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&pinctrl_lcd_pwm>;
> +      #pwm-cells = <3>;
> +    };

Move the example to the MFD schema. Or just drop if already there.

Rob
