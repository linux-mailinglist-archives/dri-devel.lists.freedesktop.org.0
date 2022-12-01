Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B4A63FBA4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 00:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A176310E18D;
	Thu,  1 Dec 2022 23:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2A710E18D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 23:09:28 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id s141so3647656oie.10
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 15:09:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QMUvAy0bV18ieN366+/7XZip9ETIRj8qIxrLTpAZPXM=;
 b=MEBaSERT/DBDkWtzETzOP81Dse5J0aFPxPPoJxfSaSH7EOq254SNficEoDTfBrcTb2
 BTSFT526dnBNpX7Y36pFotAYUPHv2FhZBKU/nlKz9Kjss9JCeOAB6W+IU2DrUHUDNYp1
 LlQEKbmD4/6wPexx08ygWePGdvW2tiknP63M4wIf+nlqr6ZDFcDO7vKWcUdjXJrCWf66
 zyYBsixJCQsdQxGUOYLNfSgqRKr+eotwo+rgAwYsW/HaM5YMA0eV5zUiqfgDuUyCsb67
 jRww6iFrho10DqIzfppx+XZ4SRWYGCqjww22megI2TNTK4/gJDbXxxGKWrawX4bqeg5y
 afDA==
X-Gm-Message-State: ANoB5pnbVCozVc1YCLUY0tchDyEs3a5meEvqcWrMfg2QV7zglKuP5kFU
 Gx+NcV5dEwd/C8nn4aLtog==
X-Google-Smtp-Source: AA0mqf6qbhxDpUFt+E/w6Sz000nWXl5WW6LFCr5nYStLI8AgCjteYDfiWRTy7Ly+fC84FOB7P53coA==
X-Received: by 2002:a05:6808:85:b0:35b:bebf:f8ab with SMTP id
 s5-20020a056808008500b0035bbebff8abmr9328120oic.94.1669936167299; 
 Thu, 01 Dec 2022 15:09:27 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 17-20020a9d0611000000b006605883eae6sm2610542otn.63.2022.12.01.15.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 15:09:26 -0800 (PST)
Received: (nullmailer pid 1653603 invoked by uid 1000);
 Thu, 01 Dec 2022 23:09:25 -0000
Date: Thu, 1 Dec 2022 17:09:25 -0600
From: Rob Herring <robh@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v5 05/10] dt-bindings: display: bridge: Add MHDP HDMI for
 i.MX8MQ
Message-ID: <20221201230925.GA1615220-robh@kernel.org>
References: <cover.1669620155.git.Sandor.yu@nxp.com>
 <ee28481b28a8a38109b109956e9502221b5c97b3.1669620155.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee28481b28a8a38109b109956e9502221b5c97b3.1669620155.git.Sandor.yu@nxp.com>
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
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org,
 oliver.brown@nxp.com, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 vkoul@kernel.org, robert.foss@linaro.org, andrzej.hajda@intel.com,
 linux-phy@lists.infradead.org, linux-imx@nxp.com, kernel@pengutronix.de,
 devicetree@vger.kernel.org, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 28, 2022 at 03:36:13PM +0800, Sandor Yu wrote:
> Add bindings for i.MX8MQ MHDP HDMI.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../display/bridge/cdns,mhdp-imx8mq-hdmi.yaml | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
> new file mode 100644
> index 000000000000..cca6954a84ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence MHDP HDMI bridge
> +
> +maintainers:
> +  - Sandor Yu <Sandor.yu@nxp.com>
> +
> +description:
> +  The Cadence MHDP TX HDMI interface.

What's the difference between this block and the DP block? The binding 
looks the same other than compatible, so can they be combined?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,mhdp-imx8mq-hdmi

Same comment here on naming.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: MHDP HDMI APB clock.
> +
> +  phys:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Hotplug cable plugin.
> +      - description: Hotplug cable plugout.
> +
> +  interrupt-names:
> +    items:
> +      - const: plug_in
> +      - const: plug_out
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Input port from display controller output.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port to HDMI connector.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - interrupt-names
> +  - phys
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mq-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mhdp_hdmi: hdmi-bridge@32c00000 {
> +        compatible = "cdns,mhdp-imx8mq-hdmi";
> +        reg = <0x32c00000 0x100000>;
> +        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "plug_in", "plug_out";
> +        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
> +        phys = <&hdmi_phy>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                mhdp_in: endpoint {
> +                    remote-endpoint = <&dcss_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                mhdp_out: endpoint {
> +                    remote-endpoint = <&hdmi_con>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 
> 
