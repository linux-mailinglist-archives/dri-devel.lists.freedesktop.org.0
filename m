Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48533B3C1E9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36A610EC19;
	Fri, 29 Aug 2025 17:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u0gF4l6g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E7310EC19
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 17:38:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CC91446B2;
 Fri, 29 Aug 2025 17:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2BDEC4CEF0;
 Fri, 29 Aug 2025 17:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756489086;
 bh=L5QOuOSEv9g6+gvzQ1RcLIv6NONgTjAIFzcmQ/bnMBc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u0gF4l6gWaRtgs50hiD/Br1pg2DZkaAezQPMRZt7QljBwcaz/LHif/lqQ8mpwCYQ9
 lCBPixgxsGKryPAjEw1gD/np4t14UBI/CHUksYruTIRlCnUKJkJeqyCYSqFm2DYWK6
 Jk1VB+hDKkfqZ7o2P+qrYFfZPDneWSbbC2Kj8NJL+5gY8tXiTVwRKqgl+fuZOTHKz7
 wIPPg0l39rHbWEyQ0WOdDpQVY1MMWN7V9qe+rdn4U6Fo4Vl4ga7/wWtSX+3Nqo+uVw
 cQD5JWT3xhzcYhMdfPhXGINJTE8j9AlN70CFS5VKJAg0YGuUfbnz5w94Yf9PyJLCKC
 ayyFqqUmMTxRw==
Date: Fri, 29 Aug 2025 12:38:05 -0500
From: Rob Herring <robh@kernel.org>
To: Pet Weng <pet.weng@ite.com.tw>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hermes Wu <hermes.Wu@ite.com.tw>, Kenneth Hung <kenneth.Hung@ite.com.tw>,
 Pin-yen Lin <treapking@google.com>
Subject: Re: [PATCH v2 1/3] dt-binding: display: Add ITE IT61620 MIPI DSI to
 HDMI bridge
Message-ID: <20250829173805.GA1030887-robh@kernel.org>
References: <20250828-it61620-0714-v2-0-586f5934d5f8@ite.com.tw>
 <20250828-it61620-0714-v2-1-586f5934d5f8@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-it61620-0714-v2-1-586f5934d5f8@ite.com.tw>
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

On Thu, Aug 28, 2025 at 12:01:18PM +0800, Pet Weng wrote:
> This chip receives MIPI DSI input and outputs HDMI, and is commonly
> connected to SoCs via I2C and DSI.
> 
> Signed-off-by: Pet Weng <pet.weng@ite.com.tw>
> ---
>  .../bindings/display/bridge/ite,it61620.yaml       | 143 +++++++++++++++++++++
>  1 file changed, 143 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..dd8a54a1e0aa9bbbd9d02e68398bb5df65b821a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
> @@ -0,0 +1,143 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ite,it61620.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE IT61620 MIPI DSI to HDMI Bridge
> +
> +maintainers:
> +  - Pet Weng <pet.weng@ite.com.tw>
> +
> +description: |
> +  The ITE IT61620 is a high-performance, low-power HDMI bridge that converts
> +  MIPI DSI input to HDMI 1.4b TMDS output. It supports up to 4 lanes of MIPI
> +  D-PHY 2.0 input at 2.5Gbps per lane (10Gbps total), compatible with DSI-2 v2.0.

Wrap lines at 80 char.

> +
> +  The HDMI transmitter side supports up to 4Kx2K@30Hz resolutions, and is
> +  compliant with HDMI 1.4b and HDCP 1.4.
> +
> +  For audio, the IT61620 supports up to 8-channel LPCM via I2S (multi-line or
> +  TDM mode), with optional S/PDIF or DSD (for SACD). It supports audio
> +  sampling rates up to 192kHz.
> +
> +allOf:
> +  - $ref: /schemas/sound/dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: ite,it61620
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description: interrupt specifier of INT pin
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO specifier of RESET pin
> +
> +  ivdd-supply:
> +    description: core voltage
> +
> +  ovdd-supply:
> +    description: I/O voltage
> +
> +  ovdd1833-supply:
> +    description: flexible I/O votage
> +
> +  pinctrl-names:
> +    items:
> +      - const: default
> +
> +  pinctrl-0:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: Input port for MIPI DSI
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes: true
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output port for HDMI output
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - reset-gpios
> +  - ivdd-supply
> +  - ovdd-supply
> +  - ovdd1833-supply
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ite61620@58 {

bridge@58

> +                compatible = "ite,it61620";
> +                reg = <0x58>;
> +                #sound-dai-cells = <0>;
> +                interrupt-parent = <&pio>;
> +                interrupts = <128 IRQ_TYPE_LEVEL_LOW>;
> +                pinctrl-names = "default";
> +                pinctrl-0 = <&it61620_pins>;
> +                reset-gpios = <&pio 127 GPIO_ACTIVE_LOW>;
> +                ivdd-supply = <&pp1000_hdmi_x>;
> +                ovdd-supply = <&pp3300_vio28_x>;
> +                ovdd1833-supply = <&pp1800_vcamio_x>;
> +
> +                ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +
> +                        port@0 {
> +                                reg = <0>;
> +                                it61620_dsi_in: endpoint {
> +                                        data-lanes = <0 1 2 3>;
> +                                        remote-endpoint = <&dsi_out>;
> +                                };
> +                        };
> +
> +                        port@1 {
> +                                reg = <1>;
> +                                it61620_hdmi_out: endpoint {
> +                                        remote-endpoint = <&hdmi_connector_in>;
> +                                };
> +                        };
> +                };
> +        };
> +    };
> 
> -- 
> 2.34.1
> 
