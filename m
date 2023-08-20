Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CAE781CD8
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 10:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F90C10E0A4;
	Sun, 20 Aug 2023 08:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A11910E0A4
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 08:01:29 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5236b2b4cdbso2899892a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 01:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692518487; x=1693123287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eeJSTKzEeD+6Ni5795ljdCrGFtA+5AfyHnPQCYLSqvE=;
 b=Mga+CC0jRHyOVZLaMsRRJopWCJC7TcFQIQMzBvTw7Qv2XM83f3kuxrATCB7FP8D243
 rLB2TADwm4asJ+tjaEcoavE+MJpsqTzpobzRbIuDLeTvdF94g1piHajkBW9aqcKXc9Nf
 7kKRCFDuXkHCnF36CIZI9xSezIQRUTBMXATnY6A2gvj+EXtt1DIcKOgXricW7UaIsZl1
 XxXrSvQcEqv/6VpDG3aV7JQUpldQJRLZgNW7WAuwQQMREgrXchsXhXbJkw7J7Ci8GfXr
 ifLxaDygSJw2fPZGr48Yl/OSRGNjqTHpUFc22VPXS503RjNESoePSV941r2SpnG6Fwou
 MsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692518487; x=1693123287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eeJSTKzEeD+6Ni5795ljdCrGFtA+5AfyHnPQCYLSqvE=;
 b=JVzMHq678WFgVRGpzzfBRVFRLt9p6C3Z8iDU4cqZayzNHw5M8oF6+2TCJZ2cH03xRa
 nocfDmvVMXIhrSZA2F43Ib+ujy2uyaOmqxUqQmQ+UWm6gZqRs5Xo24cck9jZpnIITtBr
 IOdG/FPAzSPpJ5JTtiZUoY46fzdFhcr4Hg/KZZw2TBjfnRMrDBi9B2lrn6tNwxrCKvR8
 wOXh7wFG6VONGljF3Su/eHaUlvxAKugZRBjiDE3LX/g1+pUAWBo+BSlIVZGLjoZ1OKAL
 W040RWyFnsVxi2mTgofURdiV7f2VFRkXox0R/VSQlm5rCBbniH4TF2vUXBHy07/bPyGK
 RXoQ==
X-Gm-Message-State: AOJu0YwihlI/2BX2QcUbWN7vGAPj99A3YBq4S7jdVs0vDaS8vm7GEkDI
 XCp2p6htpe0q87q/tFXNCVspXQ==
X-Google-Smtp-Source: AGHT+IHYv2pBSehDuqcsbstZO2FmGSb5ZYNe4ZdTQ3/jIHBbfy4yunWhVBEe7jT4XPv35komNvTmKA==
X-Received: by 2002:aa7:d651:0:b0:525:570c:566b with SMTP id
 v17-20020aa7d651000000b00525570c566bmr2715593edr.22.1692518487409; 
 Sun, 20 Aug 2023 01:01:27 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056402004d00b005236410a16bsm3876732edu.35.2023.08.20.01.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Aug 2023 01:01:26 -0700 (PDT)
Message-ID: <3517f2e9-d9d7-5bf8-1905-62f52d68c512@linaro.org>
Date: Sun, 20 Aug 2023 10:01:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 14/15] dt-bindings: gpu: mali-valhall-csf: Add initial
 bindings for panthor driver
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-15-boris.brezillon@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230809165330.2451699-15-boris.brezillon@collabora.com>
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
Cc: Conor Dooley <conor+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/08/2023 18:53, Boris Brezillon wrote:
> From: Liviu Dudau <liviu.dudau@arm.com>
> 
> Arm has introduced a new v10 GPU architecture that replaces the Job Manager
> interface with a new Command Stream Frontend. It adds firmware driven
> command stream queues that can be used by kernel and user space to submit
> jobs to the GPU.
> 
> Add the initial schema for the device tree that is based on support for
> RK3588 SoC. The minimum number of clocks is one for the IP, but on Rockchip
> platforms they will tend to expose the semi-independent clocks for better
> power management.

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.

Also drop "driver" form the subject. Bindings are for hardware, not drivers.

> 
> v2:
> - New commit
> 
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>

SoB chain is incomplete.

> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    | 148 ++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> new file mode 100644
> index 000000000000..2b9f77aa0b7a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -0,0 +1,148 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/arm,mali-valhall-csf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Mali Valhall GPU
> +
> +maintainers:
> +  - Liviu Dudau <liviu.dudau@arm.com>
> +  - Boris Brezillon <boris.brezillon@collabora.com>
> +
> +properties:
> +  $nodename:
> +    pattern: '^gpu@[a-f0-9]+$'
> +
> +  compatible:
> +    oneOf:

Drop oneOf.

> +      - items:
> +          - enum:
> +              - rockchip,rk3588-mali
> +          - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Job interrupt
> +      - description: MMU interrupt
> +      - description: GPU interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: job
> +      - const: mmu
> +      - const: gpu
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: core
> +      - const: coregroup
> +      - const: stacks
> +
> +  mali-supply: true
> +
> +  sram-supply: true
> +
> +  operating-points-v2: true

Missing opp-table.

> +
> +  power-domains:
> +    minItems: 1
> +    maxItems: 5
> +
> +  power-domain-names:
> +    minItems: 1
> +    maxItems: 5
> +
> +  "#cooling-cells":
> +    const: 2
> +
> +  dynamic-power-coefficient:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      A u32 value that represents the running time dynamic
> +      power coefficient in units of uW/MHz/V^2. The
> +      coefficient can either be calculated from power
> +      measurements or derived by analysis.
> +
> +      The dynamic power consumption of the GPU is
> +      proportional to the square of the Voltage (V) and
> +      the clock frequency (f). The coefficient is used to
> +      calculate the dynamic power as below -
> +
> +      Pdyn = dynamic-power-coefficient * V^2 * f
> +
> +      where voltage is in V, frequency is in MHz.
> +
> +  dma-coherent: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - mali-supply
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-mali
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: coregroup
> +            - const: stacks

This duplicates top-level. Just minItems: 3.

Please describe also power domains - constrains and names.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +
> +    gpu: gpu@fb000000 {
> +        compatible = "rockchip,rk3588-mali", "arm,mali-valhall-csf";
> +        reg = <0xfb000000 0x200000>;
> +        interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH 0>;
> +        interrupt-names = "job", "mmu", "gpu";
> +        clock-names = "core", "coregroup", "stacks";
> +        clocks = <&cru CLK_GPU>, <&cru CLK_GPU_COREGROUP>,
> +                 <&cru CLK_GPU_STACKS>;
> +        power-domains = <&power RK3588_PD_GPU>;
> +        operating-points-v2 = <&gpu_opp_table>;
> +        mali-supply = <&vdd_gpu_s0>;
> +        sram-supply = <&vdd_gpu_mem_s0>;
> +        status = "disabled";

Drop status.

> +    };
> +
> +    gpu_opp_table: opp-table {

Opp table should be inside the device node.

> +        compatible = "operating-points-v2";
> +        opp-300000000 {
> +            opp-hz = /bits/ 64 <300000000>;
> +            opp-microvolt = <675000 675000 850000>;
> +        };

Best regards,
Krzysztof

