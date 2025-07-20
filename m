Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8605EB0B8F9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 00:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAE610E0E6;
	Sun, 20 Jul 2025 22:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SACH0dhn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E4F10E0E6
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 22:52:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 84951A52778;
 Sun, 20 Jul 2025 22:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D939C4CEE7;
 Sun, 20 Jul 2025 22:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753051972;
 bh=69EFAAHfaG2pfc1QkZ0KW3szZY+hPcbifoyUatFEqFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SACH0dhntm3asf6vjiFhYqOVT8TlUpDC1YIJ4Y/oUit1p6d3TCqfdEs/40IseTdn7
 Is/SnqaK3cfP/7TRjcaVaVdg7GlGWGX14b3WUtTmgcFmmciAS7rkNWGWzstlas47aU
 5BhtdXuYBl7vVaAeSyGD8hr1Xj7AspsN7giSdQGRZLw3Rh6Ufr6LpLa0qy07BiBLyE
 SA6njqRTHGPhBdDWHQMxxYZABxX/XSQWDtfJFq2MLftv/NHLjUcg+ARJPcBrdMRdU5
 6a+THdqXUng2kCSSQFaTfivd2x+8NjuxPCj1AWpjottL7CsE2rR6SfDLaMUhTofDFi
 4n66Sg/hARtdw==
Date: Sun, 20 Jul 2025 17:52:51 -0500
From: Rob Herring <robh@kernel.org>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com
Subject: Re: [PATCH 1/3] dt-bindings: display: bridge: Add waveshare DSI2DPI
 unit support
Message-ID: <20250720225251.GA2952017-robh@kernel.org>
References: <20250716-waveshare-v1-0-81cb03fb25a3@nxp.com>
 <20250716-waveshare-v1-1-81cb03fb25a3@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716-waveshare-v1-1-81cb03fb25a3@nxp.com>
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

On Wed, Jul 16, 2025 at 04:08:29PM +0900, Joseph Guo wrote:
> Add dt-binding documentation for waveshare DSI2DPI unit
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
>  .../bindings/display/bridge/waveshare,dsi2dpi.yaml | 103 +++++++++++++++++++++
>  1 file changed, 103 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml b/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..678922ebe138ec2fa7bd05902947a86ec73fc644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/waveshare,dsi2dpi.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/waveshare,dsi2dpi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Waveshare MIPI-DSI to DPI Converter bridge
> +
> +maintainers:
> +  - Joseph Guo <qijian.guo@nxp.com>
> +
> +description:
> +  Waveshare bridge board is part of Waveshare panel which converts DSI to DPI.
> +
> +properties:
> +  compatible:
> +    const: waveshare,dsi2dpi
> +
> +  reg:
> +    maxItems: 1
> +    description: base I2C address of the device
> +
> +  power-supply: true
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Video port for MIPI DSI input
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                description: array of physical DSI data lane indexes.
> +                items:
> +                  - const: 1
> +                  - const: 2
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Video port for MIPI DPI output panel.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +  - power-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +
> +    i2c0 {

i2c {

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
