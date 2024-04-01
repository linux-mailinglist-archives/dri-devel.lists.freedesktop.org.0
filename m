Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796FB893B2B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Apr 2024 15:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3277010E4C9;
	Mon,  1 Apr 2024 13:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t9tDxF+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B89910E4C9
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Apr 2024 13:03:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D2E660B5A;
 Mon,  1 Apr 2024 13:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F3AC43390;
 Mon,  1 Apr 2024 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711976629;
 bh=6IX8cDFUlSsk6IxtbhcF68yxgznuBZCAUSinqNSI60Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t9tDxF+B/kICX01tgWTInIvIoSP9ORRRD9KOxwP84iHOUi0SKK/Ie42RUnp7t63FN
 HVqjkZ5KlC6r9xKWCl/PeAJMG/KIh5KXuih4+kiHghdkd8/st153SMr/ZNhz+ZL23p
 D6EuKGrsL+Ai1zBEWIcpOvcddijki3UnjLotM8odP4gXTf7VBLo8n3OihiTeVz6O/V
 93Vr1FFFPxCnRAvBkZ9v758Qjjkohp6VSPznDAbcnaGecnpbMEcO5WLl7vGxIXqsxs
 CUw4xRe+JpxokeW//OF/xQU0Z3nndTfOdl9EVWPpGm58X/UdaltgtXdup/n47CR6ru
 8Mu87fvXgThzg==
Date: Mon, 1 Apr 2024 08:03:47 -0500
From: Rob Herring <robh@kernel.org>
To: Patrick Gansterer <paroga@paroga.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: backlight: Add Texas Instruments
 LM3509
Message-ID: <20240401130347.GA274540-robh@kernel.org>
References: <20240330145931.729116-1-paroga@paroga.com>
 <20240330145931.729116-2-paroga@paroga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240330145931.729116-2-paroga@paroga.com>
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

On Sat, Mar 30, 2024 at 03:59:24PM +0100, Patrick Gansterer wrote:
> Add Device Tree bindings for Texas Instruments LM3509 - a
> High Efficiency Boost for White LED's and/or OLED Displays
> 
> Signed-off-by: Patrick Gansterer <paroga@paroga.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/ti,lm3509.yaml    | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml
> new file mode 100644
> index 000000000000..b67f67648852
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml
> @@ -0,0 +1,139 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/ti,lm3509.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI LM3509 High Efficiency Boost for White LED's and/or OLED Displays
> +
> +maintainers:
> +  - Patrick Gansterer <paroga@paroga.com>
> +
> +description:
> +  The LM3509 current mode boost converter offers two separate outputs.
> +  https://www.ti.com/product/LM3509
> +
> +properties:
> +  compatible:
> +    const: ti,lm3509
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  ti,brightness-rate-of-change-us:
> +    description: Brightness Rate of Change in microseconds.
> +    enum: [51, 13000, 26000, 52000]
> +
> +  ti,oled-mode:
> +    description: Enable OLED mode.
> +    type: boolean
> +
> +patternProperties:
> +  "^led@[01]$":
> +    type: object
> +    description: Properties for a string of connected LEDs.
> +
> +    allOf:

You don't need allOf here.

> +      - $ref: common.yaml#
> +
> +    properties:
> +      reg:
> +        description:
> +          The control register that is used to program the two current sinks.
> +          The LM3509 has two registers (BMAIN and BSUB) and are represented
> +          as 0 or 1 in this property. The two current sinks can be controlled
> +          independently with both registers, or register BMAIN can be
> +          configured to control both sinks with the led-sources property.
> +        minimum: 0
> +        maximum: 1
> +
> +      label: true
> +
> +      led-sources:
> +        allOf:

Or here.

> +          - minItems: 1
> +            maxItems: 2
> +            items:
> +              minimum: 0
> +              maximum: 1
