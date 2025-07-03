Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7323FAF6ABE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 08:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050DB10E0AE;
	Thu,  3 Jul 2025 06:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CcZLcNHZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC3410E0AE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 06:48:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 818645C5587;
 Thu,  3 Jul 2025 06:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF0BC4CEE3;
 Thu,  3 Jul 2025 06:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751525328;
 bh=1VQPJiHQXABe30NmXGDefMBoLl0++oujbjecxGtPiv4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CcZLcNHZATmd7QcNs9h4sELglH7lOXLc1XnA1G9lMwxIwZFYQiugjplH3jEGaqSZs
 XgJCSJf68iEP6N4hLX7FZ8h+WAkjUjNpEVl5Ei1AzOogimbjWaqTFcqT4fv5zyHHSO
 jmCCcZiQlGs0+HAfKv8RIxmymET3WyDM/4OlZvOlLTCJnoGIm1TOsfqF4G6mv5mVDs
 yUkq614EIazqmKQ9XsaZGWhgD9QeeDfDJUFyiBLAK5cebDS+zfK5S+SH/QKvuq6TTA
 yqR63795AmuIioGDusooUrRVd2cTetDm36XPkeS4N6KzmwWTNVNPbhZetuPn1fQBl6
 a7dQRhx+9/GEg==
Message-ID: <7533fd56-aeef-4685-a25f-d64b3f6a2d78@kernel.org>
Date: Thu, 3 Jul 2025 08:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 4/9] dt-bindings: soc: xilinx: Add AI engine DT binding
To: Gregory Williams <gregory.williams@amd.com>, ogabbay@kernel.org,
 michal.simek@amd.com, robh@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702155630.1737227-1-gregory.williams@amd.com>
 <20250702155630.1737227-5-gregory.williams@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250702155630.1737227-5-gregory.williams@amd.com>
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

On 02/07/2025 17:56, Gregory Williams wrote:
> In the device tree, there will be device node for the AI engine device,
> and device nodes for the statically configured AI engine apertures.

No, describe the hardware, not DTS.

> Apertures are an isolated set of columns with in the AI engine device
> with their own address space and interrupt.
> 
> Signed-off-by: Gregory Williams <gregory.williams@amd.com>
> ---
>  .../bindings/soc/xilinx/xlnx,ai-engine.yaml   | 151 ++++++++++++++++++
>  1 file changed, 151 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
> new file mode 100644
> index 000000000000..7d9a36c56366
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml

Filename matching compatible.

> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/xilinx/xlnx,ai-engine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AMD AI Engine

That's really too generic...

> +
> +maintainers:
> +  - Gregory Williams <gregory.williams@amd.com>
> +
> +description:
> +  The AMD AI Engine is a tile processor with many cores (up to 400) that
> +  can run in parallel. The data routing between cores is configured through
> +  internal switches, and shim tiles interface with external interconnect, such
> +  as memory or PL. One AI engine device can have multiple apertures, each
> +  has its own address space and interrupt. At runtime application can create
> +  multiple partitions within an aperture which are groups of columns of AI
> +  engine tiles. Each AI engine partition is the minimum resetable unit for an
> +  AI engine application.
> +
> +properties:
> +  compatible:
> +    const: xlnx,ai-engine-v2.0

What does v2.0 stands for? Versioning is discouraged, unless mapping is
well documented.

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  power-domains:

Missing constraints.

> +    description:
> +      Platform management node id used to request power management services
> +      from the firmware driver.

Drop description, redundant.

> +
> +  xlnx,aie-gen:
> +    $ref: /schemas/types.yaml#/definitions/uint8

Why uint8?

> +    description:
> +      Hardware generation of AI engine device. E.g. the current values supported
> +      are 1 (AIE) and 2 (AIEML).

No clue what's that, but it is implied by compatible, isn't it?

Missing constraints.

> +
> +  xlnx,shim-rows:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description:
> +      start row and the number of rows of SHIM tiles of the AI engine device

Implied by compatible.

Missing constraints.


> +
> +  xlnx,core-rows:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description:
> +      start row and the number of rows of core tiles of the AI engine device
> +
> +  xlnx,mem-rows:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description:
> +      start row and the number of rows of memory tiles of the AI engine device
> +

Same comments everywhere.

> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - xlnx,aie-gen
> +  - xlnx,shim-rows
> +  - xlnx,core-rows
> +  - xlnx,mem-rows
> +
> +patternProperties:

This goes after properties.

> +  "^aperture@[0-9]+$":
> +    type: object
> +    description:
> +      AI engine aperture which is a group of column based tiles of the
> +      AI engine device. Each AI engine apertures isolated from the
> +      other AI engine apertures. An AI engine aperture is defined by
> +      AMD/Xilinx platform design tools.
> +
> +    properties:
> +      compatible:
> +        const: xlnx,ai-engine-aperture
> +
> +      reg:
> +        description:
> +          Physical base address and length of the aperture registers.
> +          The AI engine address space assigned to Linux is defined by
> +          Xilinx/AMD platform design tool.

Missing constraints. Description is redundant - can it be anything else?

Plus you clearly miss ranges.


> +
> +      interrupts:
> +        maxItems: 3
> +
> +      interrupt-names:
> +        items:
> +          - const: interrupt1
> +          - const: interrupt2
> +          - const: interrupt3

Useless names, drop entirely.

> +
> +      xlnx,columns:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          It describes the location of the aperture. It specifies the start
> +          column and the number of columns. E.g. an aperture starts from
> +          column 0 and there are 50 columns, it will be presented as <0 50>.

Same comments as before

> +
> +      xlnx,node-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          AI engine aperture node ID, which is defined by AMD/Xilinx platform
> +          design tool to identify the AI engine aperture in the firmware.

No, you do not get node ID. Recently every day a patch comes for that...

> +
> +    required:
> +      - compatible
> +      - reg
> +      - xlnx,columns
> +      - xlnx,node-id
> +
> +    additionalProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/power/xlnx-versal-power.h>
> +    bus {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      ai_engine: ai-engine@20000000000 {
> +        compatible = "xlnx,ai-engine-v2.0";
> +        reg = <0x200 0x00 0x01 0x00>;
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        power-domains = <&versal_firmware PM_DEV_AI>;
> +        xlnx,aie-gen = /bits/ 8 <0x1>;
> +        xlnx,core-rows = /bits/ 8 <1 8>;
> +        xlnx,mem-rows = /bits/ 8 <0 0>;
> +        xlnx,shim-rows = /bits/ 8 <0 1>

This cannot be without ranges... I am surprised it actually works, but
for sure was not tested and produces warnings.

> +
> +        aperture0: aperture@200000000000 {
> +          /* 50 columns and 8 core tile rows + 1 SHIM row */
> +          compatible = "xlnx,ai-engine-aperture";
> +          reg = <0x200 0x0 0x1 0x0>;
> +          interrupts = <0x0 0x94 0x4>,
> +                       <0x0 0x95 0x4>,
> +                       <0x0 0x96 0x4>;
Use proper flags.

Best regards,
Krzysztof
