Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 039117A8681
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB7D10E4CE;
	Wed, 20 Sep 2023 14:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18AA410E4CB
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 14:25:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF18D1FB
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 07:26:20 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 87F3E3F5A1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 07:25:43 -0700 (PDT)
Date: Wed, 20 Sep 2023 15:25:36 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 14/15] dt-bindings: gpu: mali-valhall-csf: Add initial
 bindings for panthor driver
Message-ID: <ZQsA4DTuWjNwRiOk@e110455-lin.cambridge.arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-15-boris.brezillon@collabora.com>
 <3517f2e9-d9d7-5bf8-1905-62f52d68c512@linaro.org>
 <ZQr2cTMz1-PsOMRP@e110455-lin.cambridge.arm.com>
 <ed4cb30d-2eec-580f-0b4a-1b108a745a9a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed4cb30d-2eec-580f-0b4a-1b108a745a9a@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 20, 2023 at 03:51:36PM +0200, Krzysztof Kozlowski wrote:
> On 20/09/2023 15:41, Liviu Dudau wrote:
> >>> +properties:
> >>> +  $nodename:
> >>> +    pattern: '^gpu@[a-f0-9]+$'
> >>> +
> >>> +  compatible:
> >>> +    oneOf:
> >>
> >> Drop oneOf.
> > 
> > The idea was to allow for future compatible strings to be added later, but
> > I guess we can re-introduce the oneOf entry later. Will remove it.
> 
> If you already predict that new list will be added (so new fallback
> compatible!), then it's fine.
> 
> > 
> >>
> >>> +      - items:
> >>> +          - enum:
> >>> +              - rockchip,rk3588-mali
> >>> +          - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  interrupts:
> >>> +    items:
> >>> +      - description: Job interrupt
> >>> +      - description: MMU interrupt
> >>> +      - description: GPU interrupt
> >>> +
> >>> +  interrupt-names:
> >>> +    items:
> >>> +      - const: job
> >>> +      - const: mmu
> >>> +      - const: gpu
> >>> +
> >>> +  clocks:
> >>> +    minItems: 1
> >>> +    maxItems: 3
> >>> +
> >>> +  clock-names:
> >>> +    minItems: 1
> >>> +    items:
> >>> +      - const: core
> >>> +      - const: coregroup
> >>> +      - const: stacks
> >>> +
> >>> +  mali-supply: true
> >>> +
> >>> +  sram-supply: true
> >>> +
> >>> +  operating-points-v2: true
> >>
> >> Missing opp-table.
> > 
> > This is the main topic I want to clarify. See further down for the main comment,
> > but I would like to understand what you are asking here. To copy the schema
> > from bindings/opp/opp-v2.yaml and bindings/opp/opp-v2-base.yaml?
> 
> No, "opp-table" property.
> git grep "opp-table:"

You mean adding

     opp-table:
       type: object

as property? What's the difference between opp-table: true (like in
'display/msm/dp-controller.yaml') and 'opp-table: type: object' like in other
places that I can find? Does that mean you need to have an opp-table node somewhere
but it doesn't have to be inside the gpu node? 'arm,mali-midgard.yaml' that was
my original source of inspiration has an 'opp-table: type: object' in the properties
but the example still shows a separate node for table.

> 
> > 
> >>
> >>> +
> >>> +  power-domains:
> >>> +    minItems: 1
> >>> +    maxItems: 5
> >>> +
> >>> +  power-domain-names:
> >>> +    minItems: 1
> >>> +    maxItems: 5
> >>> +
> >>> +  "#cooling-cells":
> >>> +    const: 2
> >>> +
> >>> +  dynamic-power-coefficient:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description:
> >>> +      A u32 value that represents the running time dynamic
> >>> +      power coefficient in units of uW/MHz/V^2. The
> >>> +      coefficient can either be calculated from power
> >>> +      measurements or derived by analysis.
> >>> +
> >>> +      The dynamic power consumption of the GPU is
> >>> +      proportional to the square of the Voltage (V) and
> >>> +      the clock frequency (f). The coefficient is used to
> >>> +      calculate the dynamic power as below -
> >>> +
> >>> +      Pdyn = dynamic-power-coefficient * V^2 * f
> >>> +
> >>> +      where voltage is in V, frequency is in MHz.
> >>> +
> >>> +  dma-coherent: true
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - interrupts
> >>> +  - interrupt-names
> >>> +  - clocks
> >>> +  - mali-supply
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +allOf:
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: rockchip,rk3588-mali
> >>> +    then:
> >>> +      properties:
> >>> +        clocks:
> >>> +          minItems: 3
> >>> +        clock-names:
> >>> +          items:
> >>> +            - const: core
> >>> +            - const: coregroup
> >>> +            - const: stacks
> >>
> >> This duplicates top-level. Just minItems: 3.
> > 
> > Will remove the duplicated names.
> > 
> >>
> >> Please describe also power domains - constrains and names.
> > 
> > I'm not sure the power domains and how to handle them have been
> > entirely settled for Rockchip, hence why they were not included. Will
> > check with Collabora to see if they have anything to add here, but
> > for non-Rockchip platforms (like Juno with FPGAs) the constraints
> > are going to be different.
> > 
> >>
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> >>> +    #include <dt-bindings/interrupt-controller/irq.h>
> >>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>> +    #include <dt-bindings/power/rk3588-power.h>
> >>> +
> >>> +    gpu: gpu@fb000000 {
> >>> +        compatible = "rockchip,rk3588-mali", "arm,mali-valhall-csf";
> >>> +        reg = <0xfb000000 0x200000>;
> >>> +        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH 0>,
> >>> +                     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH 0>,
> >>> +                     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH 0>;
> >>> +        interrupt-names = "job", "mmu", "gpu";
> >>> +        clock-names = "core", "coregroup", "stacks";
> >>> +        clocks = <&cru CLK_GPU>, <&cru CLK_GPU_COREGROUP>,
> >>> +                 <&cru CLK_GPU_STACKS>;
> >>> +        power-domains = <&power RK3588_PD_GPU>;
> >>> +        operating-points-v2 = <&gpu_opp_table>;
> >>> +        mali-supply = <&vdd_gpu_s0>;
> >>> +        sram-supply = <&vdd_gpu_mem_s0>;
> >>> +        status = "disabled";
> >>
> >> Drop status.
> > 
> > Will do.
> > 
> >>
> >>> +    };
> >>> +
> >>> +    gpu_opp_table: opp-table {
> >>
> >> Opp table should be inside the device node.
> > 
> > I cannot find any device tree that supports your suggested usage. Most (all?) of
> 
> Really? All Qcom have it embedded.

The arm,mali-* ones seem to have them outside the gpu node. See "arm,mali-midgard.yaml"

Best regards,
Liviu

> 
> > the device trees that I can find have the opp table as a separate node from
> > the gpu and make use of the 'operating-points-v2 = <&opp_node_name>' reference
> 
> operating-points-v2 is needed anyway, I am not suggesting to drop it.
> 
> > in the board fragment. To me that makes more sense as different boards can have
> > different operating points and is no reason to make them sub-nodes of the gpu.
> 
> How boards do it, is independent. They can keep it inside, outside,
> override etc.
> 
> For majority of simple cases, the OPPs come from the SoC, thus they are
> in DTSI.
> 
> Best regards,
> Krzysztof
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
