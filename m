Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D002C8F3A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 21:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CC089F92;
	Mon, 30 Nov 2020 20:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49C889F92
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 20:31:34 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B29F20855
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 20:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606768294;
 bh=NwPcsFEjbNyY/ouVugtXO20GqSg8HWDN6+VcCBveOAU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SR7ZkoZv//e8Rr2MI8incv+RSKaK6MUgjDBPHuChc4S8ccUzjoLFW+t0+daAtLnY1
 SqYbDrYS8dYhiX+CepaaShUnVv1CeGaGHsbc4QAuJRvS6z+jQdm/9v10N+xrOL9WHD
 nqyQe3QPg7eAFUhtEBGbEyEdhKs31+dyn8RbCcUY=
Received: by mail-ej1-f54.google.com with SMTP id f23so24489064ejk.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:31:34 -0800 (PST)
X-Gm-Message-State: AOAM531mITJDCKckmKMooBR0lzsceS04JQ0yN+SeKprZtlwhzy5TyV24
 vXTWDiAgjnJQCtHFHP4gpqPKW4t2OKZ98LQMQg==
X-Google-Smtp-Source: ABdhPJzOyRnvhTUG1wVjmRjjD/72200LQeSI4rA1YHraXcVhW2RDPQSkd9+VWH8PVxdJFuXOPLDqbrGlZqmnrnhK6nI=
X-Received: by 2002:a17:906:a418:: with SMTP id
 l24mr10169508ejz.360.1606768292568; 
 Mon, 30 Nov 2020 12:31:32 -0800 (PST)
MIME-Version: 1.0
References: <1606746513-30909-1-git-send-email-kevin3.tang@gmail.com>
 <1606746513-30909-6-git-send-email-kevin3.tang@gmail.com>
In-Reply-To: <1606746513-30909-6-git-send-email-kevin3.tang@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Nov 2020 13:31:21 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKZKZtOaduTEuu2dgD9sFf5YDvcSkQfBVA9Ssn4n_mDsg@mail.gmail.com>
Message-ID: <CAL_JsqKZKZtOaduTEuu2dgD9sFf5YDvcSkQfBVA9Ssn4n_mDsg@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: display: add Unisoc's mipi dsi&dphy
 bindings
To: Kevin Tang <kevin3.tang@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 Lyra Zhang <zhang.lyra@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 30, 2020 at 7:29 AM Kevin Tang <kevin3.tang@gmail.com> wrote:
>
> From: Kevin Tang <kevin.tang@unisoc.com>
>
> Adds MIPI DSI Master and MIPI DSI-PHY (D-PHY)
> support for Unisoc's display subsystem.
>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
> ---
>  .../display/sprd/sprd,sharkl3-dsi-host.yaml        | 107 +++++++++++++++++++++
>  .../display/sprd/sprd,sharkl3-dsi-phy.yaml         |  84 ++++++++++++++++
>  2 files changed, 191 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
> new file mode 100644
> index 0000000..fe0e89d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dsi-host.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Unisoc MIPI DSI Controller
> +
> +maintainers:
> +  - Kevin Tang <kevin.tang@unisoc.com>
> +
> +properties:
> +  compatible:
> +    const: sprd,sharkl3-dsi-host
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Physical base address and length of the registers set for the device.
> +
> +  interrupts:
> +    maxItems: 2
> +    description:
> +      Should contain DSI interrupt.
> +
> +  clocks:
> +    minItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: clk_src_96m
> +
> +  power-domains:
> +    maxItems: 1
> +    description: A phandle to DSIM power domain node
> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description:
> +          A port node with endpoint definitions as defined in
> +          Documentation/devicetree/bindings/media/video-interfaces.txt.
> +          That port should be the input endpoint, usually coming from
> +          the associated DPU.
> +      port@1:
> +        type: object
> +        description:
> +          A port node with endpoint definitions as defined in
> +          Documentation/devicetree/bindings/media/video-interfaces.txt.
> +          That port should be the output endpoint, usually output to
> +          the associated DPHY.
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/sprd,sc9860-clk.h>
> +    dsi: dsi@63100000 {
> +        compatible = "sprd,sharkl3-dsi-host";
> +        reg = <0x63100000 0x1000>;
> +        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> +          <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +        clock-names = "clk_src_96m";
> +        clocks = <&pll CLK_TWPLL_96M>;
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@0 {
> +                reg = <0>;
> +                dsi_in: endpoint {
> +                    remote-endpoint = <&dpu_out>;
> +                };
> +            };
> +            port@1 {
> +                reg = <1>;
> +                dsi_out: endpoint {
> +                    remote-endpoint = <&dphy_in>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yaml
> new file mode 100644
> index 0000000..b4715d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/sprd/sprd,sharkl3-dsi-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Unisoc MIPI DSI-PHY (D-PHY)
> +
> +maintainers:
> +  - Kevin Tang <kevin.tang@unisoc.com>
> +
> +properties:
> +  compatible:
> +    const: sprd,sharkl3-dsi-phy
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Must be the dsi controller base address.
> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description:
> +          A port node with endpoint definitions as defined in
> +          Documentation/devicetree/bindings/media/video-interfaces.txt.
> +          That port should be the output endpoint, usually output to
> +          the associated panel.
> +      port@1:

For PHYs, we use the PHY binding, not the graph binding. Please follow
what practically every other DSI PHY does.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
