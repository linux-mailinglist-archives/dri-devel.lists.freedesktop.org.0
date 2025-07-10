Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9FFB00DF1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 23:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3805A10E977;
	Thu, 10 Jul 2025 21:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XyWvPxWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A29410E977
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 21:38:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C414F5C4CB6;
 Thu, 10 Jul 2025 21:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49943C4CEE3;
 Thu, 10 Jul 2025 21:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752183510;
 bh=D1bZ/Il7ClQbNgydrqEk47MOWGKSp56gk3dIrmpod44=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XyWvPxWpzr3Y27zk/fyu3o7TM1kx++cAl6ZeITndjwQxP9dwrOL+P1pc3HdcvLSLD
 RoCuBNlTT8gzXDzNWZhQ9g+IifLoKN3omRdOO5yJ15erOgy1xFz65e9BY7CK03O/Jr
 a6FDmtWrZ7Z9UgJBFSAEIQOwhI+/OAWHDf6BSCnErvpoPihXDBX3GHSLEnrrcEDQVj
 QqBcIAzjfg54w5PCL/tGdJScxepBu8JYz3JS9vvI6LIn6FSn3t/K8dAu71U8MnbTmN
 kyGhdkBFyE4G3r+tzLkn4Ta9K3J2ZFwZuuC3FTY+sYb4IxE55a7hzvKbM76vbIAurT
 pXccyGvEvgK9w==
Message-ID: <504f6660-4938-47b4-b1db-0a6fe0214e5f@kernel.org>
Date: Thu, 10 Jul 2025 23:38:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 4/9] dt-bindings: soc: xilinx: Add AI engine DT binding
To: "Williams, Gregory" <gregoryw@amd.com>,
 Gregory Williams <gregory.williams@amd.com>, ogabbay@kernel.org,
 michal.simek@amd.com, robh@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702155630.1737227-1-gregory.williams@amd.com>
 <20250702155630.1737227-5-gregory.williams@amd.com>
 <7533fd56-aeef-4685-a25f-d64b3f6a2d78@kernel.org>
 <eb3c843a-6762-4ac0-b863-3f500fb15b6f@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <eb3c843a-6762-4ac0-b863-3f500fb15b6f@amd.com>
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

On 10/07/2025 21:03, Williams, Gregory wrote:
> On 7/3/2025 12:48 AM, Krzysztof Kozlowski wrote:
>> On 02/07/2025 17:56, Gregory Williams wrote:
>>> In the device tree, there will be device node for the AI engine device,
>>> and device nodes for the statically configured AI engine apertures.
>>
>> No, describe the hardware, not DTS.
>>
>>> Apertures are an isolated set of columns with in the AI engine device
>>> with their own address space and interrupt.
>>>
>>> Signed-off-by: Gregory Williams <gregory.williams@amd.com>
>>> ---
>>>  .../bindings/soc/xilinx/xlnx,ai-engine.yaml   | 151 ++++++++++++++++++
>>>  1 file changed, 151 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>>> new file mode 100644
>>> index 000000000000..7d9a36c56366
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>>
>> Filename matching compatible.
>>
>>> @@ -0,0 +1,151 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/soc/xilinx/xlnx,ai-engine.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: AMD AI Engine
>>
>> That's really too generic...

You did not answer to other comments here and other patches, so I just
assume you did not ignore them.

>>
>>> +
>>> +maintainers:
>>> +  - Gregory Williams <gregory.williams@amd.com>
>>> +
>>> +description:
>>> +  The AMD AI Engine is a tile processor with many cores (up to 400) that
>>> +  can run in parallel. The data routing between cores is configured through
>>> +  internal switches, and shim tiles interface with external interconnect, such
>>> +  as memory or PL. One AI engine device can have multiple apertures, each
>>> +  has its own address space and interrupt. At runtime application can create
>>> +  multiple partitions within an aperture which are groups of columns of AI
>>> +  engine tiles. Each AI engine partition is the minimum resetable unit for an
>>> +  AI engine application.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: xlnx,ai-engine-v2.0
>>
>> What does v2.0 stands for? Versioning is discouraged, unless mapping is
>> well documented.
> 
> Sure, I will remove the versioning in V2 patch.

This should be specific to product, so use the actual product/model name.

Is this part of a Soc? Then standard rules apply... but I could not
deduce it from the descriptions or commit msgs.


> 
>>
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  '#address-cells':
>>> +    const: 2
>>> +
>>> +  '#size-cells':
>>> +    const: 2
>>> +
>>> +  power-domains:
>>
>> Missing constraints.
>>
>>> +    description:
>>> +      Platform management node id used to request power management services
>>> +      from the firmware driver.
>>
>> Drop description, redundant.
>>
>>> +
>>> +  xlnx,aie-gen:
>>> +    $ref: /schemas/types.yaml#/definitions/uint8
>>
>> Why uint8?
>>
>>> +    description:
>>> +      Hardware generation of AI engine device. E.g. the current values supported
>>> +      are 1 (AIE) and 2 (AIEML).
>>
>> No clue what's that, but it is implied by compatible, isn't it?
> 
> The driver supports multiple hardware generations. During driver probe, this value is read from the device tree and hardware generation specific

Bindings are about hardware, not driver, so your driver arguments are
not valid.

> data structures are loaded based on this value. The compatible string is the same between devices.

No. See writing bindings.

> 
>>
>> Missing constraints.
>>
>>> +
>>> +  xlnx,shim-rows:
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    description:
>>> +      start row and the number of rows of SHIM tiles of the AI engine device
>>
>> Implied by compatible.
> 
> The AI Engine device can have different configurations for number of rows and column (even if it is the same hardware generation). This property
> tells the driver the size and layout of the array, this is not implied by compatible.

Wrap your emails correctly.

Again driver.. no, please describe the hardware, not your drivers.


Best regards,
Krzysztof
