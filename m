Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33373806D00
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 11:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0740E10E099;
	Wed,  6 Dec 2023 10:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1AB4110E099
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 10:59:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 783E4153B
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 03:00:27 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2C1943F5A1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 02:59:41 -0800 (PST)
Date: Wed, 6 Dec 2023 10:59:38 +0000
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 13/14] dt-bindings: gpu: mali-valhall-csf: Add support
 for Arm Mali CSF GPUs
Message-ID: <ZXBUGhL6utV15-Yx@e110455-lin.cambridge.arm.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-14-boris.brezillon@collabora.com>
 <20231205204827.GA3761421-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231205204827.GA3761421-robh@kernel.org>
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
 kernel@collabora.com, Daniel Stone <daniels@collabora.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thanks for reviewing this!

On Tue, Dec 05, 2023 at 02:48:27PM -0600, Rob Herring wrote:
> On Mon, Dec 04, 2023 at 06:33:06PM +0100, Boris Brezillon wrote:
> > From: Liviu Dudau <liviu.dudau@arm.com>
> > 
> > Arm has introduced a new v10 GPU architecture that replaces the Job Manager
> > interface with a new Command Stream Frontend. It adds firmware driven
> > command stream queues that can be used by kernel and user space to submit
> > jobs to the GPU.
> > 
> > Add the initial schema for the device tree that is based on support for
> > RK3588 SoC. The minimum number of clocks is one for the IP, but on Rockchip
> > platforms they will tend to expose the semi-independent clocks for better
> > power management.
> > 
> > v3:
> > - Cleanup commit message to remove redundant text
> > - Added opp-table property and re-ordered entries
> > - Clarified power-domains and power-domain-names requirements for RK3588.
> > - Cleaned up example
> > 
> > Note: power-domains and power-domain-names requirements for other platforms
> > are still work in progress, hence the bindings are left incomplete here.
> > 
> > v2:
> > - New commit
> > 
> > Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > ---
> >  .../bindings/gpu/arm,mali-valhall-csf.yaml    | 147 ++++++++++++++++++
> >  1 file changed, 147 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > new file mode 100644
> > index 000000000000..d72de094c8ea
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > @@ -0,0 +1,147 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpu/arm,mali-valhall-csf.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ARM Mali Valhall GPU
> > +
> > +maintainers:
> > +  - Liviu Dudau <liviu.dudau@arm.com>
> > +  - Boris Brezillon <boris.brezillon@collabora.com>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^gpu@[a-f0-9]+$'
> > +
> > +  compatible:
> > +    oneOf:
> 
> Don't need oneOf.

This has come up on the review of the previous version. We're planning on adding support for more
SoCs once the initial panthor driver gets merged, but I don't think it's worth advertising it now.
Krzyszof raised the same point and then agreed to keep it, as seen here[1].

> 
> > +      - items:
> > +          - enum:
> > +              - rockchip,rk3588-mali
> > +          - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Job interrupt
> > +      - description: MMU interrupt
> > +      - description: GPU interrupt
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: job
> > +      - const: mmu
> > +      - const: gpu
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 3
> 
> The function of each clock based on just the names below aren't too 
> evident. 'core' is, but then what is 'stacks'? Please add some 
> descriptions.
> 
The names match the hardware architecture, where the core clock powers
most of the GPU, the 'stacks' clock is for shader core stacks and the
'coregroup' is used by stacks and tilers. All this is defined as "logical
power domains" and the implementer of the IP can decide to map them to
individual physical power domains or to group everything into a minimum of
one power domain. Hence the flexibility in describing the hardware.

As for describing what the function of each power domain is, I'm afraid we
need to keep it at "matches the architecture" for now and I will look into
what more information can be added later. At the high level, the more
power domains you have the more you can fine tune the power consumption of
the GPU.

> I expect there is better visibility into what's correct here than we had 
> on earlier h/w. IOW, I don't want to see different clocks for every SoC. 
> Same applies to power-domains.

Afraid that's up to the SoC implementation to decide how they wire the
power domains. Hardware is capable to automatically powering up the domains
needed, as long as the relevant clocks are provided.

Best regards,
Liviu

> 
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: core
> > +      - const: coregroup
> > +      - const: stacks
> > +
> > +  mali-supply: true
> > +
> > +  operating-points-v2: true
> > +  opp-table:
> > +    type: object
> > +
> > +  power-domains:
> > +    minItems: 1
> > +    maxItems: 5
> > +
> > +  power-domain-names:
> > +    minItems: 1
> > +    maxItems: 5
> > +
> > +  sram-supply: true
> > +
> > +  "#cooling-cells":
> > +    const: 2
> > +
> > +  dynamic-power-coefficient:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      A u32 value that represents the running time dynamic
> > +      power coefficient in units of uW/MHz/V^2. The
> > +      coefficient can either be calculated from power
> > +      measurements or derived by analysis.
> > +
> > +      The dynamic power consumption of the GPU is
> > +      proportional to the square of the Voltage (V) and
> > +      the clock frequency (f). The coefficient is used to
> > +      calculate the dynamic power as below -
> > +
> > +      Pdyn = dynamic-power-coefficient * V^2 * f
> > +
> > +      where voltage is in V, frequency is in MHz.
> > +
> > +  dma-coherent: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - mali-supply
> > +
> > +additionalProperties: false
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: rockchip,rk3588-mali
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 3
> > +	power-domains:
> > +	  maxItems: 1
> > +	power-domain-names: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/rk3588-power.h>
> > +
> > +    gpu: gpu@fb000000 {
> > +        compatible = "rockchip,rk3588-mali", "arm,mali-valhall-csf";
> > +        reg = <0xfb000000 0x200000>;
> > +        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH 0>,
> > +                     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH 0>,
> > +                     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        interrupt-names = "job", "mmu", "gpu";
> > +        clock-names = "core", "coregroup", "stacks";
> > +        clocks = <&cru CLK_GPU>, <&cru CLK_GPU_COREGROUP>,
> > +                 <&cru CLK_GPU_STACKS>;
> > +        power-domains = <&power RK3588_PD_GPU>;
> > +        operating-points-v2 = <&gpu_opp_table>;
> > +        mali-supply = <&vdd_gpu_s0>;
> > +        sram-supply = <&vdd_gpu_mem_s0>;
> > +    };
> > +
> > +    gpu_opp_table: opp-table {
> > +        compatible = "operating-points-v2";
> > +        opp-300000000 {
> > +            opp-hz = /bits/ 64 <300000000>;
> > +            opp-microvolt = <675000 675000 850000>;
> > +        };
> > +        opp-400000000 {
> > +            opp-hz = /bits/ 64 <400000000>;
> > +            opp-microvolt = <675000 675000 850000>;
> > +        };
> > +    };
> > +
> > +...
> > -- 
> > 2.43.0
> > 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
