Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A0E6E0FE9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 16:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAA210EB3A;
	Thu, 13 Apr 2023 14:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E827410E37A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 14:25:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D437A60A49;
 Thu, 13 Apr 2023 14:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F88C433D2;
 Thu, 13 Apr 2023 14:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681395904;
 bh=UWZdbqyTVYsPbq8M/wjSESSoPHtBkWccPeIp7VDalfA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I72Lssa0FBep0LjmSt3fl08OL5OeIO4QGQJNg6QVIHHMFS/wTbE+Cf02iLse4tm3V
 p5jltMR8OM0tME7Fe5TyOUNkwectYQZG6usieAVm+iTdALR9toIBwKvd8e9eDmv+79
 xrPXZIhL1vA7jsYqqJP+oW5J5Axil8IlyW8EJlk0+SRY/eQoQrS+naESgWbA5CVX2O
 3MvgbbD+VSOJ70kR5EmKNkrUnmP9ylVYxq9xFTOriU0hKX+zA3GV0xiePICfILJpfu
 Zy5WmkpPP6+gz+97ASkbEfHnoZZyN4/Fx2FAk4Mk3Ip07CeBPONhSh6gShApyxzZ+v
 veWgkn5319qlg==
Message-ID: <952a08bc-1107-32dd-3760-d99eed0af072@kernel.org>
Date: Thu, 13 Apr 2023 16:25:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH v2 2/2] dt-bindings: gpu: Add Imagination Technologies
 PowerVR GPU
Content-Language: en-US
To: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org
References: <20230413103419.293493-1-sarah.walker@imgtec.com>
 <20230413103419.293493-3-sarah.walker@imgtec.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230413103419.293493-3-sarah.walker@imgtec.com>
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
Cc: faith.ekstrand@collabora.com, gfx-opensource@list.ti.com, airlied@linux.ie,
 afd@ti.com, detheridge@ti.com, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, rs@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/04/2023 12:34, Sarah Walker wrote:
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>

NAK, multiple problems.

Missing commit msg.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Missing tests - not CCed to proper lists.

> ---
>  .../devicetree/bindings/gpu/img,powervr.yaml  | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/img,powervr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
> new file mode 100644
> index 000000000000..f722fd1d4e8f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +# Copyright (c) 2022 Imagination Technologies Ltd.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/gpu/img-powervr.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes.

> +
> +title: Imagination Technologies PowerVR GPU
> +
> +maintainers:
> +  - Sarah Walker <sarah.walker@imgtec.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - mediatek,mt8173-gpu
> +          - const: img,powervr-series6xt
> +      - items:
> +          - enum:
> +              - ti,am62-gpu
> +          - const: img,powervr-seriesaxe
> +
> +  reg:
> +    minItems: 1

Drop minItems.

> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: core_clk
> +      - const: mem_clk
> +      - const: sys_clk

Drop _clk suffixes.

> +
> +  interrupts:
> +    items:
> +      - description: GPU interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: gpu
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  operating-points-v2: true

No opp-table?

> +  power-supply: true
> +
> +  "#cooling-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8173-gpu
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 2
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: img,powervr-series6xt
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3

This is really not tested... Misisng additionalProperties:false.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    gpu@13000000 {
> +        compatible = "mediatek,mt8173-gpu", "img,powervr-series6xt";
> +        reg = <0 0x13000000 0 0xffff>, <0 0x13fff000 0 0x1000>;
> +        power-domains = <&scpsys MT8173_POWER_DOMAIN_MFG>;
> +        power-supply = <&da9211_vgpu_reg>;
> +        operating-points-v2 = <&gpu_opp_table>;
> +        clocks = <&gpu_ckgen 0>,
> +                 <&gpu_ckgen 1>,
> +                 <&gpu_ckgen 2>;
> +        clock-names = "core_clk",
> +                      "mem_clk",
> +                      "sys_clk";
> +        interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
> +        interrupt-names = "gpu";
> +    };
> +

Stray blank line.

Best regards,
Krzysztof

