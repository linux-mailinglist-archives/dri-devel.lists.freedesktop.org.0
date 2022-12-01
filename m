Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33663FB93
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 00:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE5910E0CE;
	Thu,  1 Dec 2022 23:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37AD10E0CE
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 23:05:22 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 t15-20020a4a96cf000000b0049f7e18db0dso479329ooi.10
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 15:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYxFCZnowr65DbHcfQhWYnFpeX0olFgDD4k93tsTiVw=;
 b=pi3Ebn7MUfYzvZ9SS7T0wdeLcMpkwyVoPpEIU3XPdDf5BopaxjmR+t7GD3kyZyan/6
 Zqo1TX/li29IxVbNbtIAQqMpQMyjCz/1wLAXVNfe5g6/5E9n1oET/f1mXTKOk4WB+G8q
 fDPRGzB6h0fQIuvM8NOK5lnmGwIkcHk9yJLvLL77lsfZN6+EEZMFw7+1HqKORAJTljTM
 trp9c0E7bS8pTekS7M/cBOB9HRxp8W0Dka6e0r2w8LBVP06DevEjGlgbf81zv0jXi0jL
 jz2gvZ7JjUOWPzAmCUnsQf6b70keIYwQ8tauTTPVNqDFhOxbue98J9inDwqMwUzOMNCf
 w9qg==
X-Gm-Message-State: ANoB5pkHgAFLmtU74jR4N5WMlJXaLHjA8+EvF63Tl6lV3vLijMEedtiq
 NGJCL99urZ6YL1uK5Do2Fw==
X-Google-Smtp-Source: AA0mqf4rQVpySWq13aBh3qdWe0uXeRim3blDGaHbZwBQtc79suwZOY9htr6rpJmE7Vl3pqXpRBwzdQ==
X-Received: by 2002:a4a:4486:0:b0:49a:a7a9:8435 with SMTP id
 o128-20020a4a4486000000b0049aa7a98435mr29020119ooa.28.1669935922089; 
 Thu, 01 Dec 2022 15:05:22 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g13-20020a056870c14d00b001375188dae9sm3304996oad.16.2022.12.01.15.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 15:05:21 -0800 (PST)
Received: (nullmailer pid 1615063 invoked by uid 1000);
 Thu, 01 Dec 2022 23:05:20 -0000
Date: Thu, 1 Dec 2022 17:05:20 -0600
From: Rob Herring <robh@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v5 02/10] dt-bindings: display: bridge: Add MHDP DP for
 i.MX8MQ
Message-ID: <20221201230520.GA1600786-robh@kernel.org>
References: <cover.1669620155.git.Sandor.yu@nxp.com>
 <f5ab57311a0dc197ec25bde415271c4b4b85635a.1669620155.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5ab57311a0dc197ec25bde415271c4b4b85635a.1669620155.git.Sandor.yu@nxp.com>
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

On Mon, Nov 28, 2022 at 03:36:10PM +0800, Sandor Yu wrote:
> Add bindings for i.MX8MQ MHDP DisplayPort.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../display/bridge/cdns,mhdp-imx8mq-dp.yaml   | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
> new file mode 100644
> index 000000000000..21cf87c79766
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp-imx8mq-dp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence MHDP Displayport bridge
> +
> +maintainers:
> +  - Sandor Yu <Sandor.yu@nxp.com>
> +
> +description:
> +  The Cadence MHDP Displayport TX interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,mhdp-imx8mq-dp

nxp,ixm8mq-mhdp

Cadence is not the vendor for imx8mq. It is doubtful that every vendor 
using this IP block will be the same because that rarely/never happens.

And I assume the 'dp in 'mhdp' stands for DisplayPort, so we don't need 
it twice.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: MHDP DP APB clock.

Seems like there would be more than just a bus clock unless all the 
function clocks come from the display controller or phy.

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
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port to DP connector.
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
> +
> +    mhdp_dp: dp-bridge@32c00000 {
> +        compatible = "cdns,mhdp-imx8mq-dp";
> +        reg = <0x32c00000 0x100000>;
> +        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "plug_in", "plug_out";
> +        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
> +        phys = <&dp_phy>;
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
> +                    remote-endpoint = <&dp_con>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 
> 
