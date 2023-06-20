Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7B87370E4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 17:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E198C10E190;
	Tue, 20 Jun 2023 15:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F7010E190
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 15:49:00 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3426e9a9c3eso7209275ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 08:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687276140; x=1689868140;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+0ykOBJR6ph5fJ8NMKMPGXouH5kisW0kpvuVSufTKw=;
 b=e4p+9WXVxV12uq0ntoEQ4nCI1pMGKh3ANnwn87AsnXvFzNiipVm5uF8NMHFGZbULxb
 CjaIjHCaCyil429w/gK36MUVMN0GLypYQvbV7zXpmgW/gylfIUMxqYEkDdiJsJids4m3
 pnLPT0jidsxs1/y+9zxmuVFNcJDkoIlUwkYXLyZJ3Xycq2qMnUUpEmaBQn4FUXyB2lbD
 LrPz594tOaaAgWEaTgZhMLgpXYElM8AFgwgIkizFguGOV2Z7Eo/JrBD8EV3wdPdRx5sm
 zBA+GoTWIV2Nhj3Ju3A9LRmpuwYHct6lTALbt9HsjvWlk4vyxCYmQcAHLxAje5s8bj/q
 UMTw==
X-Gm-Message-State: AC+VfDyDjuw4C4nYIrSPvFUcUGlmMUaM0xUu5FWMFpFe9nKKiSXmL476
 DRriNdLS53GX1NXj0wyaNg==
X-Google-Smtp-Source: ACHHUZ4JlCQgBFv4N8BMZuj7200KFd3rbLgtWgjlVsH/bI15MOlDE4V78j/2LXyWh0HIt2u6z6aoxQ==
X-Received: by 2002:a05:6e02:927:b0:33c:2a80:3721 with SMTP id
 o7-20020a056e02092700b0033c2a803721mr7722596ilt.4.1687276139985; 
 Tue, 20 Jun 2023 08:48:59 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a029713000000b004161fafff97sm701453jai.136.2023.06.20.08.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 08:48:59 -0700 (PDT)
Received: (nullmailer pid 3655727 invoked by uid 1000);
 Tue, 20 Jun 2023 15:48:56 -0000
Date: Tue, 20 Jun 2023 09:48:56 -0600
From: Rob Herring <robh@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v6 2/8] dt-bindings: display: bridge: Add Cadence
 MHDP8501 HDMI and DP
Message-ID: <20230620154856.GB3637514-robh@kernel.org>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <8687f2221299b120e12f29fdccf264e120227bd7.1686729444.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8687f2221299b120e12f29fdccf264e120227bd7.1686729444.git.Sandor.yu@nxp.com>
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

On Thu, Jun 15, 2023 at 09:38:12AM +0800, Sandor Yu wrote:
> Add bindings for Cadence MHDP8501 DisplayPort and HDMI driver.

Bindings are for h/w, not a driver.

> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../display/bridge/cdns,mhdp8501.yaml         | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> new file mode 100644
> index 000000000000..a54756815e6f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence MHDP8501 Displayport bridge
> +
> +maintainers:
> +  - Sandor Yu <Sandor.yu@nxp.com>
> +
> +description:
> +  The Cadence MHDP8501 Displayport/HDMI TX interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,mhdp8501-dp
> +      - cdns,mhdp8501-hdmi
> +      - fsl,imx8mq-mhdp8501-dp
> +      - fsl,imx8mq-mhdp8501-hdmi

Is DP vs. HDMI fixed for a particular SoC implementation or it's a board 
level decision. In the latter case, the type of connector should 
determine the mode, not compatible.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: MHDP8501 DP/HDMI APB clock.

Seems odd there's no clock tied to the pixel/serdes clock.

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
> +          Output port to DP/HDMI connector.
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
> +        compatible = "fsl,imx8mq-mhdp8501-dp";
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
