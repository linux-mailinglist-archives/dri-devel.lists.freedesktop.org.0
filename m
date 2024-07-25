Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9494693BC6C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 08:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9305F10E144;
	Thu, 25 Jul 2024 06:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RNfMQL5f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CE910E7CF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 06:17:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D3F46126D;
 Thu, 25 Jul 2024 06:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F83CC116B1;
 Thu, 25 Jul 2024 06:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721888229;
 bh=q273AXt1JvTfVCM18v/YNq/93jQjSSbTmR0umy4+TYY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RNfMQL5f34LWnomlvoD+/oAHVE/CcOlIADrUL48eO+etjkiaND9Wg9AlXThe71jll
 x0joozyNCYrVzo91gI6qUL0z0ira1heLkUVQ2SWh5EwpWNELpPbdVcoAri4nP4xvJN
 oYx2hZJBrwUqCHeO5rdnboAb4D+0TH/wBSBVblYDHlePR5HZREuLyaY6Gktt/GqU/Y
 DwkslgIkgbIibFePXUp0SVmlwFIlbT+/Q+d+t6YYtcmuCpw2qB9o7evPD7OiKRgq6o
 7GrzZ77OnFy9ZkxuwG5DvfDQesasXKJm3aEWiV8KszPhUv3oXk3UWcJmc/zG3EDc3S
 +/EPRsjQE9eWg==
Message-ID: <c7bf08aa-e7a0-4b60-b9fe-b43215ce3fb9@kernel.org>
Date: Thu, 25 Jul 2024 08:17:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
To: Alex Lanzano <lanzano.alex@gmail.com>, mehdi.djait@bootlin.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240725004734.644986-2-lanzano.alex@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240725004734.644986-2-lanzano.alex@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/07/2024 02:47, Alex Lanzano wrote:
> Add device tree bindings for the monochrome Sharp Memory LCD
> 
> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> ---
>  .../bindings/display/sharp,sharp-memory.yaml  | 97 +++++++++++++++++++
>  include/dt-bindings/display/sharp-memory.h    |  9 ++
>  2 files changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml
>  create mode 100644 include/dt-bindings/display/sharp-memory.h
> 
> diff --git a/Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml b/Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml
> new file mode 100644
> index 000000000000..a79edd97c857
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml

Filename based on compatible, so e.g. sharp,ls010b7dh04.yaml.

> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sharp,sharp-memory.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sharp Memory LCD panels
> +
> +maintainers:
> +  - Alex Lanzano <lanzano.alex@gmail.com>
> +
> +description:
> +  This binding is for the Sharp Memory LCD monochrome displays.

Do not say that binding is a binding... instead describe hardware.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - sharp,ls010b7dh04
> +      - sharp,ls011b7dh03
> +      - sharp,ls012b7dd01
> +      - sharp,ls013b7dh03
> +      - sharp,ls013b7dh05
> +      - sharp,ls018b7dh02
> +      - sharp,ls027b7dh01
> +      - sharp,ls027b7dh01a
> +      - sharp,ls032b7dd02
> +      - sharp,ls044q7dh01
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-cs-high: true

You can drop it.

> +
> +  spi-max-frequency:
> +    maximum: 2000000
> +
> +  vcom-mode:

Missing vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      VCOM is a signal that prevents DC bias from being built up in
> +      the panel resulting in pixels being forever stuck in one state.
> +      vcom-mode can be set to one of three modes
> +
> +      SHARP_MEMORY_SOFTWARE_VCOM - This method uses a kthread to periodically send a
> +      "maintain display" message to the display, toggling the vcom
> +      bit on and off with each message

You described Linux, this is not suitable for bindings.

> +
> +      SHARP_MEMORY_EXTERNAL_VCOM - This method relies on an external clock to generate
> +      the signal on the EXTCOMM pin
> +
> +      SHARP_MEMORY_PWM_VCOM - This method uses a pwm device to generate the signal
> +      on the EXTCOMM pin

I don't see why do you even need this property. Just choose the best
option based on available connections/pins.

> +
> +    enum: [ 0, 1, 2 ]

Here 0/1/2 but above something entirely else. Just use strings.

> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: Enables display

Drop description and maxItems. :true is enough

> +
> +  pwms:
> +    maxItems: 1
> +    description: External VCOM signal
> +
> +required:
> +  - compatible
> +  - reg
> +  - spi-cs-high
> +  - vcom-mode
> +

allOf:

and missing ref to spi peripheral props

> +if:
> +  properties:
> +    vcom-mode:
> +      # SHARP_MEMORY_PWM_VCOM
> +      enum: [2]
> +then:
> +  required:
> +    - pwms
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/display/sharp-memory.h>
> +
> +    spi {
> +            #address-cells = <1>;
> +            #size-cells = <0>;

Mess indentation.

Use 4 spaces for example indentation.

> +
> +            display@0{
> +                    compatible = "sharp,ls013b7dh03";
> +                    reg = <0>;
> +                    spi-cs-high;
> +                    spi-max-frequency = <1000000>;
> +                    vcom-mode = <SHARP_MEMORY_SOFTWARE_VCOM>;
> +            };
> +    };
> +...
> diff --git a/include/dt-bindings/display/sharp-memory.h b/include/dt-bindings/display/sharp-memory.h
> new file mode 100644
> index 000000000000..dea14c7bd7ec
> --- /dev/null
> +++ b/include/dt-bindings/display/sharp-memory.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +#ifndef _DT_BINDINGS_SHARP_MEMORY
> +#define _DT_BINDINGS_SHARP_MEMORY
> +
> +#define SHARP_MEMORY_SOFTWARE_VCOM	0
> +#define SHARP_MEMORY_EXTERNAL_VCOM	1
> +#define SHARP_MEMORY_PWM_VCOM		2

Nope, drop the binding.


Best regards,
Krzysztof

