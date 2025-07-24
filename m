Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F770B104CD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 10:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0E510E03F;
	Thu, 24 Jul 2025 08:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zfjmgph9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEA110E03F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:52:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CD4D7A55E64;
 Thu, 24 Jul 2025 08:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FCDC4CEED;
 Thu, 24 Jul 2025 08:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753347156;
 bh=lEUiukjpItIZOMLZybq8zVOV0E1VI31HPjpcqCCRXw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zfjmgph9vyQJ1Z52UaLvbtnXWS2GVe1JpGrut3ak0bCBBZw1wZjVZ//VT4dmUdI/2
 QoR2MDn1JkBNI121S3rhq4WChb5c/yoECIBnvhmPNxchnBFyOduvyiuUfaOr7BeCWb
 VXclpmlMokvspHjFgJBGkIMDxcpDqccxZY8BHMRBOidJpTAEGAJd/TjOQJoqTQDH9V
 8rjK97IQM5/zJ+lFH87y9FNJHqKKs93eG9to7basm5n/ECtEawU4o2JAxDERNzUDSa
 nW5V6aiTXZ/s2/89kJp6Trv+Cf+xHdyulQGLn/d6Je+d8oscg1CiDmqoM+oKXuGgLb
 J65mC6IVet3wA==
Date: Thu, 24 Jul 2025 10:52:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, victor.liu@nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 
 p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: display: imx: add HDMI PAI for i.MX8MP
Message-ID: <20250724-straight-lorikeet-of-novelty-9124f8@kuoka>
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
 <20250724072248.1517569-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250724072248.1517569-2-shengjiu.wang@nxp.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 24, 2025 at 03:22:43PM +0800, Shengjiu Wang wrote:
> Add binding for the i.MX8MP HDMI parallel Audio interface block.
> 
> In fsl,imx8mp-hdmi-tx.yaml, add port@2 that linked to pai_to_hdmi_tx.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> index 05442d437755..6211ab8bbb0e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> @@ -49,6 +49,10 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: HDMI output port
>  
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Parallel audio input port

Which data path this represents? Feels like you are duplicating ASoC
dai-links/cells...


> +
>      required:
>        - port@0
>        - port@1
> @@ -98,5 +102,13 @@ examples:
>                      remote-endpoint = <&hdmi0_con>;
>                  };
>              };
> +
> +            port@2 {
> +                reg = <2>;
> +
> +                endpoint {
> +                    remote-endpoint = <&pai_to_hdmi_tx>;
> +                };
> +            };
>          };
>      };
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> new file mode 100644
> index 000000000000..4f99682a308d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8MP HDMI Parallel Audio Interface
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +description:
> +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> +  Audio Subsystem to the HDMI TX Controller.

What is Audio Subsystem? Like Linux Audio or some name matching actual
hardware?


> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-hdmi-pai
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: apb
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Output to the HDMI TX controller.

And how do you plug it into sound card? Where are any DAI links?

Best regards,
Krzysztof

