Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD31B3F5FA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 08:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E64310E5BC;
	Tue,  2 Sep 2025 06:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oLMoUTaF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8B010E5BC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:54:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 09917601FF;
 Tue,  2 Sep 2025 06:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E57C4CEED;
 Tue,  2 Sep 2025 06:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756796038;
 bh=x2x3SnSKVvJVv3s4/yWgywKxKMJHOQ8RIYjZEfRYGl0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oLMoUTaFmYvyv5ivEDZ6JxzrlEqkLnU54G0icnWI7GYPUiNNczVaQYq6/AozkqOUO
 FIwWkJrZITT7h4/N6CefdGBe7yoxKk6ybtzHlpn54cuDQpNID4M6kWhBX0s/nyfmAP
 9zXIECVdzmYei5Bf3x6h40aews96iobv60+aNmg659j7mqPph2ti9Tsjta0pL8Y4+l
 phQ+rIP6UBjWNKutAcus4awAMRaxTc7JTe66HF8M+Qnd1oOsvmAhxzrck0qi9kmdtR
 VbtLyYjNfML8aGRGXAn5ncC60v+pRYH50eKsXZkQsearNRoXbWWQE76dyPcaM46oCu
 0ApB/3oZ8Z6tA==
Date: Tue, 2 Sep 2025 08:53:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI
 TMDS181 and SN65DP159 bindings
Message-ID: <20250902-hasty-spry-nautilus-c05c6a@kuoka>
References: <20250901142958.843678-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.edc18686-244f-441e-a6ac-0b62492b96c8@emailsignatures365.codetwo.com>
 <20250901142958.843678-2-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250901142958.843678-2-mike.looijmans@topic.nl>
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

On Mon, Sep 01, 2025 at 04:29:01PM +0200, Mike Looijmans wrote:
>  .../bindings/display/bridge/ti,tmds181.yaml   | 152 ++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
> new file mode 100644
> index 000000000000..c6387c482431
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,tmds181.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TMDS181 and SN65DP159 HDMI retimer/redriver chips
> +
> +maintainers:
> +  - Mike Looijmans <mike.looijmans@topic.nl>
> +
> +description: |
> +  Texas Instruments TMDS181 and SN65DP159 retimer and redriver chips.
> +  https://www.ti.com/product/TMDS181
> +  https://www.ti.com/product/SN65DP159
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: ti,tmds181
> +      - items:
> +          - const: ti,sn65dp159
> +          - const: ti,tmds181
> +
> +  reg:
> +    enum:
> +      - 0x5b
> +      - 0x5c
> +      - 0x5d
> +      - 0x5e
> +
> +  oe-gpios:
> +    maxItems: 1
> +    description: GPIO specifier for OE pin (active high).

So that's reset-gpios or powerdown-gpios (see gpio-consumer-common). At
least datasheet calls them that in one place.

> +
> +  vdd-supply:
> +    description: Core power supply, 1.1V
> +
> +  vcc-supply:
> +    description: IO power supply, 3.3V
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Video port for HDMI (ish) input
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Video port for HDMI output (panel or bridge)
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +  ti,source-mode:
> +    type: boolean
> +    description:
> +      Force chip to operate in "source" mode. Allows to use
> +      a TMDS181 chip (which defaults to sink) as cable driver.
> +
> +  ti,sink-mode:

Aren't these two mutually exclusive? Can same device operate in source
and in sink mode simultaneously?


> +    type: boolean
> +    description:
> +      Force chip to operate in "sink" mode. Allows to use
> +      a DP159 chip (defaults to source) for incoming signals.
> +
> +  ti,retimer-threshold-hz:
> +    minimum: 25000000
> +    maximum: 600000000
> +    default: 200000000
> +    description:
> +      Cross-over point. Up until this pixel clock frequency
> +      the chip remains in the low-power redriver mode. Above
> +      the threshold the chip should operate in retimer mode.
> +
> +  ti,dvi-mode:
> +    type: boolean
> +    description: Makes the DP159 chip operate in DVI mode.

This suggest it is not applicable to TMDS, so you need to restrict it to
disallow it there (see example-schema).

Actually several other properties say they are applicable only to DP159.

> +
> +  ti,slew-rate:

Common property is "slew-rate" - see pincfg-node.yaml

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 3
> +    default: 3
> +    description: Set slew rate, 0 is slowest, 3 is fastest.
> +
> +  ti,disable-equalizer:
> +    type: boolean
> +    description: Disable the equalizer (to save power).
> +
> +  ti,adaptive-equalizer:
> +    type: boolean
> +    description: Set the equalizer to adaptive mode.

Can equalizer be disabled and adaptive the same time?

> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false

Best regards,
Krzysztof

