Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4CB9DA306
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 08:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1695B10E1AC;
	Wed, 27 Nov 2024 07:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dkPR3K+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0CD10E1AC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 07:25:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AFD1CA4008C;
 Wed, 27 Nov 2024 07:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908BFC4CECC;
 Wed, 27 Nov 2024 07:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732692354;
 bh=pGn4kfUpOcmSqIS3vciAoVzfQoYoykNksqMjg/m4A7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dkPR3K+q9/8URcH8C1V9tbKnvOkEYNvce4wjGS+JjcSOtIg5zBrEcLGV/FjQpBoiI
 ipMIk0Tc4GMhmo6IlkpOsvurupAzoNNZHQEq+E7eCOQfXaC6JFVUstjXQkXMK4tukD
 sGMvEigQ0Ibn2NNbdGs+L3Q2e2/rJci+OmZXZjvLUYPBOE+I1Bp+4RXrhd1yBtCPdr
 YSXXYfuzl8PblXfiBkBASVJgPZHNHeJItzyM6T4Vxv+/ePAzlaPIhmJtK4GgqD/vqW
 edPmHNHnOp1pAjmOYklohnnAMTkXUVLMa+XSIFzxtaSpP4RBlyV0DUOTJkx65xXVwN
 Skzfg2Zxdd5Zg==
Date: Wed, 27 Nov 2024 08:25:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com, 
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 mripard@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v19 3/8] dt-bindings: display: bridge: Add Cadence MHDP8501
Message-ID: <b6m4c5qbjbwdwuycunhoe6hj3akmqb257havourydry4wlrmkn@hmzkyodyqz4n>
References: <cover.1732627815.git.Sandor.yu@nxp.com>
 <e495a40a0add052d4f8cdeb4a81ea7408cdccaf6.1732627815.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e495a40a0add052d4f8cdeb4a81ea7408cdccaf6.1732627815.git.Sandor.yu@nxp.com>
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

On Tue, Nov 26, 2024 at 10:11:48PM +0800, Sandor Yu wrote:
> Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
> v18->v19:
> - move data-lanes property to endpoint of port@1
> 
> v17->v18:
> - remove lane-mapping and replace it with data-lanes
> - remove r-b tag as property changed.
> 
> v16->v17:
> - Add lane-mapping property
> 
> v9->v16:
>  *No change
> 
>  .../display/bridge/cdns,mhdp8501.yaml         | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> new file mode 100644
> index 0000000000000..24abd8447a28c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence MHDP8501 DP/HDMI bridge
> +
> +maintainers:
> +  - Sandor Yu <Sandor.yu@nxp.com>
> +
> +description:
> +  Cadence MHDP8501 DisplayPort/HDMI interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mq-mhdp8501
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: MHDP8501 DP/HDMI APB clock.
> +
> +  phys:
> +    maxItems: 1
> +    description:
> +      phandle to the DP/HDMI PHY
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
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Output port to DisplayPort or HDMI connector.
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                $ref: /schemas/media/video-interfaces.yaml#/properties/data-lanes

Drop, not needed.

> +                minItems: 4
> +                maxItems: 4
> +                description: Lane reordering for HDMI or DisplayPort interface.

Blank line

> +            required:
> +              - data-lanes

Blank line

Best regards,
Krzysztof

