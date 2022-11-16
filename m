Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B70C62C459
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 17:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1304D10E4D6;
	Wed, 16 Nov 2022 16:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1BD10E4D6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 16:27:00 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id m204so19056637oib.6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 08:27:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T7R0vGsL7LQXAd+8RrIgaa2Mm2aDxGNcrTPJcHCRSSc=;
 b=JWNdUAqXsGLfPnkRnGLikGC3ABWyPHnENIDeYupO/IXfw5cGLDe2MEGO5ZRXBlI3Ob
 kqF5qp83jXZ6X4fI2GLhSVXh+kSiH/BHp+jwtAT3cFl7zNNMCN8OBv7N0c5iHZ3XZXXF
 ArwiXXN3tfjVHccIdcaORAEMNjqhsmkeormMQyzuwvfNcOihn2hyS5Ldh1qDRSrmFLSB
 K1uhwWu/KsxR8mtNjobnY5bUiLL4ozWHk6yGV6sYKTKkZz+wHqJze5kJGH5U5b5APYGA
 xKUA5QSIeNiZqdk97mCC8KymFsL71z2lq1iFLkn80XzDvsCpVMaf6yrSvgb4DSGLvvOE
 m59w==
X-Gm-Message-State: ANoB5pmsUFKSwn62pe5OLxXt/6BRKgZW2Zpy7aBoE7Yt4pYBdHsjSvM8
 48B8TK5EvM9LCxFR/aRx7w==
X-Google-Smtp-Source: AA0mqf6DuVjSc+cQ/7WdXNB0o3vYI1ZmEO1IYWfqq/XpJfoZgtGhCe/tYutIIhoKvZH3xOlKIRWMGA==
X-Received: by 2002:aca:db06:0:b0:359:e535:84a2 with SMTP id
 s6-20020acadb06000000b00359e53584a2mr2020406oig.59.1668616019885; 
 Wed, 16 Nov 2022 08:26:59 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m13-20020a9d73cd000000b006621427ecc7sm6667434otk.60.2022.11.16.08.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 08:26:59 -0800 (PST)
Received: (nullmailer pid 196659 invoked by uid 1000);
 Wed, 16 Nov 2022 16:27:01 -0000
Date: Wed, 16 Nov 2022 10:27:01 -0600
From: Rob Herring <robh@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v3 05/10] dt-bindings: display: bridge: Add MHDP DP for
 i.MX8MQ
Message-ID: <20221116162701.GA195244-robh@kernel.org>
References: <cover.1667911321.git.Sandor.yu@nxp.com>
 <71c504aeb11f55e9dca533cc1b490b8e069c7b7b.1667911321.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71c504aeb11f55e9dca533cc1b490b8e069c7b7b.1667911321.git.Sandor.yu@nxp.com>
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
Cc: andrzej.hajda@intel.com, penguin-kernel@i-love.sakura.ne.jp,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 sam@ravnborg.org, javierm@redhat.com, jernej.skrabec@gmail.com,
 linux-imx@nxp.com, devicetree@vger.kernel.org, kernel@pengutronix.de,
 jonas@kwiboo.se, jani.nikula@intel.com, s.hauer@pengutronix.de,
 maxime@cerno.tech, linux-arm-kernel@lists.infradead.org, oliver.brown@nxp.com,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, vkoul@kernel.org, tzimmermann@suse.de,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 08, 2022 at 09:00:08PM +0800, Sandor Yu wrote:
> Add bindings for i.MX8MQ MHDP DisplayPort.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../display/bridge/cdns,mhdp-imx8mq-dp.yaml   | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
> new file mode 100644
> index 000000000000..c4d5362db2b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
> @@ -0,0 +1,59 @@
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
> +
> +  reg:
> +    maxItems: 1
> +
> +  phys:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: Hotplug detect interrupter for cable plugin event.
> +      - description: Hotplug detect interrupter for cable plugout event.
> +
> +  interrupt-names:
> +    items:
> +      - const: plug_in
> +      - const: plug_out
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      A port node pointing to the output port of a display controller.

Similarly, you need an output port to DP (or USB-C) connector.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mhdp_dp: dp-bridge@32c00000 {
> +        compatible = "cdns,mhdp-imx8mq-dp";
> +        reg = <0x32c00000 0x100000>;
> +        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +                <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "plug_in", "plug_out";
> +        phys = <&dp_phy>;
> +
> +        port {
> +            mhdp_in: endpoint {
> +                remote-endpoint = <&dcss_out>;
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 
> 
