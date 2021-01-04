Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D602E9957
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 17:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E776E042;
	Mon,  4 Jan 2021 16:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEAB6E03A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 16:00:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A745822509
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 16:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609776017;
 bh=AIuEZ3LHAXEEk/KvPhHnhOfNMQh/X1KomltrocF0mlU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pRJ8tSyb1fB8SAcpwXg+RNw05ab70tAJgrwk41A8nPKQSHOnaJIUj2dhVFSX7pTTt
 VsCo6DBteQcEwZdJC5mvr8L+0wUu3tGBPie6WRWl/yWFc4vUhbi/qCqbpIIYIhdFbI
 MYhLb0UU1paqzyl6fdx1e048kaW7HGIKkr4RC+gkxr97S7HF3fkYeqKs0cb4gYuS2a
 nP/QCq98XFI1+nbsHjM7vr+2t3nJRXCtdY+m+yI/6aCkvDzsg9wXxaxIKzQWsKAW4y
 LWzHP+MQVFkeS79yyKi6DNtdt6WPfpQXC9cZYmij7aIed/OWxTcU+6WJJED93Mc7gP
 KmQ1taAebDxZg==
Received: by mail-ed1-f54.google.com with SMTP id h16so27812380edt.7
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jan 2021 08:00:16 -0800 (PST)
X-Gm-Message-State: AOAM5337iDRs+UTF4+zr3VDL+gnYM2vL8/SYzBaISXHDrLLOeiFD6pkz
 sch6B0BPi8rQ5CBmurQ4PEPopl7WGxFj3DaMgg==
X-Google-Smtp-Source: ABdhPJz09bY6nrB961xN80l+39gUo+ZFgThja3sbx0kYfIMB3BU4C9ORV1WMuUDWx/iDN3uaOw6cOlCUml1MpR4z0oA=
X-Received: by 2002:a05:6402:352:: with SMTP id
 r18mr70216121edw.373.1609776014373; 
 Mon, 04 Jan 2021 08:00:14 -0800 (PST)
MIME-Version: 1.0
References: <20210104071114.23657-1-Nick.Fan@mediatek.com>
In-Reply-To: <20210104071114.23657-1-Nick.Fan@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 4 Jan 2021 09:00:02 -0700
X-Gmail-Original-Message-ID: <CAL_JsqLBCWNqkQZWNXABLffVCPPW0FQ_8G8dXP+yrzw2Xf0dUw@mail.gmail.com>
Message-ID: <CAL_JsqLBCWNqkQZWNXABLffVCPPW0FQ_8G8dXP+yrzw2Xf0dUw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: Convert Arm Mali Valhall GPU to DT
 schema
To: Nick Fan <Nick.Fan@mediatek.com>
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
Cc: devicetree@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 4, 2021 at 12:11 AM Nick Fan <Nick.Fan@mediatek.com> wrote:
>
> Convert the Arm Valhall GPU binding to DT schema format.

This is the 2nd v1 you've sent. Please address my comments on the 1st v1.

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
> index 000000000000..436294c032ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall.yaml
> @@ -0,0 +1,252 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2020 MediaTek Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/arm,mali-valhall.yaml#
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
> +      - const: arm,mali-valhall
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
> +        power-domains:
> +          description:
> +            List of phandle and PM domain specifier as documented in
> +            Documentation/devicetree/bindings/power/power_domain.txt
> +          minItems: 5
> +          maxItems: 5
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
> +      compatible = "operating-points-v2";
> +      opp-shared;
> +
> +      opp-358000000 {
> +              opp-hz = /bits/ 64 <358000000>;
> +              opp-hz-real = /bits/ 64 <358000000>,
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
