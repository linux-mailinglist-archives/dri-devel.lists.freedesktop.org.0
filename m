Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4678162C44E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 17:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5969210E4D5;
	Wed, 16 Nov 2022 16:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC2310E4D5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 16:25:43 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id q83so19020855oib.10
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 08:25:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=59o3Mlg3Bt4WsmBYPeaPa7JMIRGNco3k9zIgaMmG37k=;
 b=ZTXOK6JiZO8cwZ250vsHN6DJCf5Qt4wgNDVJicw+Lrmt1Jxu/g7lqQ8/y9QzdHZ6jM
 0LnolskiuawoNM81PZ2mFNVI+bmKA1dd7HkrzXGVa5xvMgDMCOVgsYDAMiz8zB6a9lsl
 FUSU8Jy9UG/puQpuXxZlShPk6e8A8gGDmFdSOqq4Js7CWOWY+x5/d805jbpKtc6nEEAu
 jDrEjnMSRNCGWq4dWO4wpK0Iqo8lReia5W3eHWm9R8RdtOmQACgqLPgFxSjKjE03OtLO
 uQ6xTYE3bG+3dIN8WOlF757zKku+6offb9lbWqM8WPdxYCWJ6dzvoO3jzgkMQ8g9xdrK
 x5DA==
X-Gm-Message-State: ANoB5pkkPIRUCBAT89XcWkdS5mFuHYjV2yUOneI3u2wcs8ksHDDKeJdQ
 7qSePDZ6dOTxJwLtGnA1Dw==
X-Google-Smtp-Source: AA0mqf4IlcgAmzvLCHRHAVt7/LkJvqiP7OkXi3KiD6BfWcE1SyNP3xSxg6GNLTLHKGjFi1iLqbQAow==
X-Received: by 2002:a05:6808:18a8:b0:35a:79fd:fc8b with SMTP id
 bi40-20020a05680818a800b0035a79fdfc8bmr2040722oib.231.1668615942969; 
 Wed, 16 Nov 2022 08:25:42 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u38-20020a05687100a600b00141e56210b2sm3750550oaa.57.2022.11.16.08.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 08:25:42 -0800 (PST)
Received: (nullmailer pid 195051 invoked by uid 1000);
 Wed, 16 Nov 2022 16:25:44 -0000
Date: Wed, 16 Nov 2022 10:25:44 -0600
From: Rob Herring <robh@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: display: bridge: Add MHDP HDMI for
 i.MX8MQ
Message-ID: <20221116162544.GA193163-robh@kernel.org>
References: <cover.1667911321.git.Sandor.yu@nxp.com>
 <9ccf53cad7f735f985f4ca37b3b0159ef78a2103.1667911321.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ccf53cad7f735f985f4ca37b3b0159ef78a2103.1667911321.git.Sandor.yu@nxp.com>
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

On Tue, Nov 08, 2022 at 09:00:05PM +0800, Sandor Yu wrote:
> Add bindings for i.MX8MQ MHDP HDMI.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>  .../display/bridge/cdns,mhdp-imx8mq-hdmi.yaml | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
> new file mode 100644
> index 000000000000..8c0afef157aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-hdmi.yaml
> @@ -0,0 +1,59 @@
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
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,mhdp-imx8mq-hdmi
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

You also need an output port to an HDMI connector node.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mhdp_hdmi: hdmi-bridge@32c00000 {
> +        compatible = "cdns,mhdp-imx8mq-hdmi";
> +        reg = <0x32c00000 0x100000>;
> +        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +                <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "plug_in", "plug_out";
> +        phys = <&hdmi_phy>;
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
