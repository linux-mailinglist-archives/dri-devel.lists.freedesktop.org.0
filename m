Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 152F62E811F
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 16:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C9E89B55;
	Thu, 31 Dec 2020 15:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E1789B55
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Dec 2020 15:57:18 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id d20so18313173otl.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Dec 2020 07:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ByUTKTXYsaKBw8iUInn/Gs7vPhqgWrVkrRV5lDm+3Hs=;
 b=CsoIvmt0EyiBl0VMHZhot69x5N479IenOtqJonvlspVDKJe6j4GSghA8+EIrifgSsa
 jIY4YcW/bWy9Dbplk8Kq32sstrFAPn3RIBjtk/WeM0o0IPBSadkoESPhDXenuYBKVpch
 9HD9yXTEG710Qkm2KKKCN3n7y8rdpVgBkX0SPB7v3tWG+++fNUS4fqcj+XKtyE+tHWUJ
 oLC6JeG6rB/037E0bhV6EatuxmmU3EdaYYlHOgZjWfrIl1Ud9s5zF66PfAtYhW2lSUcL
 bpm+zyH9tveNRKSbJjO46Dhn+Qb42o9HkOtFKGYJdZN+H+B6FPQuzBeM2jXDWwC3AVJF
 3H+w==
X-Gm-Message-State: AOAM532zXSMpawuWhcEMhw/NYeb5BASIK8GCjK+ovnWt1k3r2RrC5v1m
 awBjb12XCPPs68yBNq7dUQ==
X-Google-Smtp-Source: ABdhPJwmNEpry9jqQG2UErzq8jVGMxSNohDp/TpPtIPfqvpyd+3br4Z6s3jrNEp0ERAQ63zsjbI3Yw==
X-Received: by 2002:a9d:7cc9:: with SMTP id r9mr18633469otn.283.1609430237889; 
 Thu, 31 Dec 2020 07:57:17 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id l5sm11198656otj.57.2020.12.31.07.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 07:57:17 -0800 (PST)
Received: (nullmailer pid 1863518 invoked by uid 1000);
 Thu, 31 Dec 2020 15:57:15 -0000
Date: Thu, 31 Dec 2020 08:57:15 -0700
From: Rob Herring <robh@kernel.org>
To: Nick Fan <Nick.Fan@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: Convert Arm Mali Valhall GPU to DT schema
Message-ID: <20201231155715.GA1852831@robh.at.kernel.org>
References: <20201224123119.26504-1-Nick.Fan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201224123119.26504-1-Nick.Fan@mediatek.com>
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 24, 2020 at 08:31:18PM +0800, Nick Fan wrote:
> Convert the Arm Valhall GPU binding to DT schema format.

Convert? There's no existing binding.

> 
> Define a compatible string for the Mali Valhall GPU
> for Mediatek's SoC platform.
> 
> Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
> ---
>  .../bindings/gpu/arm,mali-valhall.yaml        | 252 ++++++++++++++++++
>  1 file changed, 252 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> new file mode 100644
> index 000000000000..3dba202bec95
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> @@ -0,0 +1,252 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/arm,mali-vallhall.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Mali Valhall GPU
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>
> +
> +properties:
> +  $nodename:
> +    pattern: '^gpu@[a-f0-9]+$'
> +
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8192-mali
> +      - const: arm,mali-valhall # Mali Valhall GPU model/revision is fully discoverable
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: GPU interrupt
> +      - description: MMU interrupt
> +      - description: Job interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: gpu
> +      - const: mmu
> +      - const: job
> +
> +  clocks:
> +    minItems: 1
> +
> +  power-domains:
> +    minItems: 1
> +    maxItems: 5
> +
> +  mali-supply: true
> +  sram-supply: true
> +
> +  operating-points-v2: true
> +
> +  "#cooling-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8192-mali
> +    then:
> +      properties:
> +        sram-supply: true

No need for this line.

> +        power-domains:
> +          description:
> +            List of phandle and PM domain specifier as documented in
> +            Documentation/devicetree/bindings/power/power_domain.txt

No need re-describe a common property.

> +          minItems: 5
> +          maxItems: 5

blank line between DT properties.

> +        power-domain-names:
> +          items:
> +            - const: core0
> +            - const: core1
> +            - const: core2
> +            - const: core3
> +            - const: core4
> +
> +      required:
> +        - sram-supply
> +        - power-domains
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpu@13000000 {
> +           compatible = "mediatek,mt8192-mali", "arm,mali-valhall";
> +           reg = <0x13000000 0x4000>;
> +           interrupts =
> +                   <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
> +                   <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
> +                   <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>;
> +           interrupt-names =
> +                   "gpu",
> +                   "mmu",
> +                   "job";
> +
> +           clocks = <&mfgcfg 0>;
> +
> +           power-domains =
> +                   <&scpsys 4>,
> +                   <&scpsys 5>,
> +                   <&scpsys 6>,
> +                   <&scpsys 7>,
> +                   <&scpsys 8>;
> +
> +           operating-points-v2 = <&gpu_opp_table>;
> +           mali-supply = <&mt6315_7_vbuck1>;
> +           sram-supply = <&mt6359_vsram_others_ldo_reg>;
> +    };
> +
> +    gpu_opp_table: opp_table0 {

Make this a child of the gpu node. Node name should be just 'opp-table'.

> +      compatible = "operating-points-v2";
> +      opp-shared;
> +
> +      opp-358000000 {
> +              opp-hz = /bits/ 64 <358000000>;
> +              opp-hz-real = /bits/ 64 <358000000>,

I don't recall this being an OPP property.

> +                            /bits/ 64 <358000000>;
> +              opp-microvolt = <606250>,
> +                              <750000>;
> +      };
> +
> +      opp-399000000 {
> +              opp-hz = /bits/ 64 <399000000>;
> +              opp-hz-real = /bits/ 64 <399000000>,
> +                            /bits/ 64 <399000000>;
> +              opp-microvolt = <618750>,
> +                              <750000>;
> +      };
> +
> +      opp-440000000 {
> +              opp-hz = /bits/ 64 <440000000>;
> +              opp-hz-real = /bits/ 64 <440000000>,
> +                            /bits/ 64 <440000000>;
> +              opp-microvolt = <631250>,
> +                              <750000>;
> +      };
> +
> +      opp-482000000 {
> +              opp-hz = /bits/ 64 <482000000>;
> +              opp-hz-real = /bits/ 64 <482000000>,
> +                            /bits/ 64 <482000000>;
> +              opp-microvolt = <643750>,
> +                              <750000>;
> +      };
> +
> +      opp-523000000 {
> +              opp-hz = /bits/ 64 <523000000>;
> +              opp-hz-real = /bits/ 64 <523000000>,
> +                            /bits/ 64 <523000000>;
> +              opp-microvolt = <656250>,
> +                              <750000>;
> +      };
> +
> +      opp-564000000 {
> +              opp-hz = /bits/ 64 <564000000>;
> +              opp-hz-real = /bits/ 64 <564000000>,
> +                            /bits/ 64 <564000000>;
> +              opp-microvolt = <668750>,
> +                              <750000>;
> +      };
> +
> +      opp-605000000 {
> +              opp-hz = /bits/ 64 <605000000>;
> +              opp-hz-real = /bits/ 64 <605000000>,
> +                            /bits/ 64 <605000000>;
> +              opp-microvolt = <681250>,
> +                              <750000>;
> +      };
> +
> +      opp-647000000 {
> +              opp-hz = /bits/ 64 <647000000>;
> +              opp-hz-real = /bits/ 64 <647000000>,
> +                            /bits/ 64 <647000000>;
> +              opp-microvolt = <693750>,
> +                              <750000>;
> +      };
> +
> +      opp-688000000 {
> +              opp-hz = /bits/ 64 <688000000>;
> +              opp-hz-real = /bits/ 64 <688000000>,
> +                            /bits/ 64 <688000000>;
> +              opp-microvolt = <706250>,
> +                              <750000>;
> +      };
> +
> +      opp-724000000 {
> +              opp-hz = /bits/ 64 <724000000>;
> +              opp-hz-real = /bits/ 64 <724000000>,
> +                            /bits/ 64 <724000000>;
> +              opp-microvolt = <725000>,
> +                              <750000>;
> +      };
> +
> +      opp-760000000 {
> +              opp-hz = /bits/ 64 <760000000>;
> +              opp-hz-real = /bits/ 64 <760000000>,
> +                            /bits/ 64 <760000000>;
> +              opp-microvolt = <743750>,
> +                              <750000>;
> +      };
> +
> +      opp-795000000 {
> +              opp-hz = /bits/ 64 <795000000>;
> +              opp-hz-real = /bits/ 64 <795000000>,
> +                            /bits/ 64 <795000000>;
> +              opp-microvolt = <762500>,
> +                              <762500>;
> +      };
> +
> +      opp-831000000 {
> +              opp-hz = /bits/ 64 <831000000>;
> +              opp-hz-real = /bits/ 64 <831000000>,
> +                            /bits/ 64 <831000000>;
> +              opp-microvolt = <781250>,
> +                              <781250>;
> +      };
> +
> +      opp-855000000 {
> +              opp-hz = /bits/ 64 <855000000>;
> +              opp-hz-real = /bits/ 64 <855000000>,
> +                            /bits/ 64 <855000000>;
> +              opp-microvolt = <793750>,
> +                              <793750>;
> +      };
> +
> +      opp-902000000 {
> +              opp-hz = /bits/ 64 <902000000>;
> +              opp-hz-real = /bits/ 64 <902000000>,
> +                            /bits/ 64 <902000000>;
> +              opp-microvolt = <818750>,
> +                              <818750>;
> +      };
> +
> +      opp-950000000 {
> +              opp-hz = /bits/ 64 <950000000>;
> +              opp-hz-real = /bits/ 64 <950000000>,
> +                            /bits/ 64 <950000000>;
> +              opp-microvolt = <843750>,
> +                              <843750>;
> +      };
> +    };
> +...
> -- 
> 2.18.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
