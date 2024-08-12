Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78C094E688
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 08:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0904B10E0DE;
	Mon, 12 Aug 2024 06:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AfSJ/p5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85A410E0DE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 06:25:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A43CD60C03;
 Mon, 12 Aug 2024 06:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5659C32782;
 Mon, 12 Aug 2024 06:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723443936;
 bh=YHSEiOS1N62k5+Um8mFVLXfCRMZAI0Qk2aVW3CqnsdQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AfSJ/p5K7eM8m4SvS93WUiORGBnBJTVscDjUTJeDKs38oVbgk07sufeJ0VdP3lrJ8
 4+Gnpqw60RIDDHe2+FJOol1svc893jE04NSDCjt3Jz2/HKUodsphCbD0oFqZvFO6Tb
 ld2VvUoD+Neu29qVlLXvPP79x9QmFxESWZbroKyXPl2JQwceJ+/uqbSJbTuu6nzeak
 9duj9ISoTvbttYHrLZ/jsElkO89VWbWyHKF3mFm1FwIQEBDu9eSxnoRbTbPZzA3jAw
 MJx9+SCD9oSZWxHmQUuNxqtRtpNg1eMMO/sPB0npi3jkQQx3GUjSRrn+uAerkSJJj7
 RXAqQgrrmiNPA==
Message-ID: <7a8b9bdf-f4df-4da0-83ca-157175817e99@kernel.org>
Date: Mon, 12 Aug 2024 08:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
To: Hui-Ping Chen <hpchen0nvt@gmail.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240812030045.20831-1-hpchen0nvt@gmail.com>
 <20240812030045.20831-2-hpchen0nvt@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240812030045.20831-2-hpchen0nvt@gmail.com>
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

On 12/08/2024 05:00, Hui-Ping Chen wrote:
> Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.
> 
> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
> ---
>  .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
> new file mode 100644
> index 000000000000..988c43bc6e99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
> +
> +allOf:
> +  - $ref: nand-controller.yaml#

allOf goes usually just before properties.

> +
> +maintainers:
> +  - Hui-Ping Chen <hpchen0nvt@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,ma35d1-nand
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1

This cannot be min only. It's unconstrained. maxItems instead. There is
no existing code like this so this should make you wonder...

> +
> +patternProperties:
> +  "^nand@[a-f0-9]$":
> +    type: object
> +    $ref: raw-nand-chip.yaml
> +    properties:
> +      nand-ecc-mode:
> +        const: hw

No, drop the property. It does not make sense to have it const.
Compatible defines it.

> +
> +      nand-ecc-step-size:
> +        enum: [512, 1024]

No defaults? So is this required?

> +
> +      nand-ecc-strength:
> +        enum: [8, 12, 24]

No defaults? So is this required?

> +
> +      nand-bus-width:
> +        const: 8

Drop property.

> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        nand-controller@401A0000 {
> +            compatible = "nuvoton,ma35d1-nand";
> +            reg = <0x0 0x401A0000 0x0 0x1000>;
> +            interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&clk NAND_GATE>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            nand@0 {
> +                reg = <0>;
> +
> +                nand-on-flash-bbt;
> +                nand-ecc-mode = "hw";

Drop

> +                nand-ecc-step-size = <512>;
> +                nand-ecc-strength = <8>;
> +                nand-bus-width = <8>;

Drop

> +
> +                partitions {
> +                    compatible = "fixed-partitions";
> +                    #address-cells = <1>;
> +                    #size-cells = <1>;
> +
> +                    uboot@0 {
> +                        label = "nand-uboot";
> +                        read-only;
> +                        reg = <0x0 0x300000>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +...

Best regards,
Krzysztof

