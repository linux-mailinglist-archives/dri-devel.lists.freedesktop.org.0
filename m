Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE08B04F2B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 05:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8AC10E128;
	Tue, 15 Jul 2025 03:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tl75DOYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5708710E128
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 03:37:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2293F5C54A9;
 Tue, 15 Jul 2025 03:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A461EC4CEE3;
 Tue, 15 Jul 2025 03:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752550666;
 bh=Rkk7eiU2CwcRmA8MjdsTBRMax51MEvSwX1y1cEEqIt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tl75DOYAqtd6wf5RCZoHDiA9dvZ9d9Qrd8WQG3LUmUJXgoMXTnWyMK5et+9a/uGJ0
 2q6VT1dUCaNjI9iRoLJfcTy1MOVILpvC4Vg26BnpR8FkQGmWDO7CKmrWLyAsyMGHty
 eYAzk4ClVbEPRifDPT3Ng39fYwLb9eV5QDqpcNJxh3r5COsTtTY9gvRZNSE30VD52d
 IW8G00zJ0uJButNW38meO7bZlgVO/M4P9qxCOuX+Yws9Z8GFV/EGlVGuwzCqLjQzKI
 FWep5j2rOUDrT4+fhwzXGqWN8WGH6iPuLgPlmctjrlODWQPPxvyp6pmH/tAhI8/pbQ
 SYr9ninaI+Ceg==
Date: Mon, 14 Jul 2025 22:37:45 -0500
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
Subject: Re: [PATCH 1/3] dt-binding: display: Add a device tree binding for
 the ITE IT61620 MIPI DSI to HDMI bridge
Message-ID: <20250715033745.GA4178590-robh@kernel.org>
References: <20250714-it61620-0714-v1-0-3761164d0b98@ite.com.tw>
 <20250714-it61620-0714-v1-1-3761164d0b98@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714-it61620-0714-v1-1-3761164d0b98@ite.com.tw>
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

On Mon, Jul 14, 2025 at 11:14:32AM +0800, Pet Weng wrote:
> This chip receives MIPI DSI input and outputs HDMI, and is commonly
> connected to SoCs via I2C and DSI.

Drop "a device tree binding for " in the subject. You already said this 
is a binding at the start.

> 
> Signed-off-by: Pet Weng <pet.weng@ite.com.tw>
> ---
>  .../bindings/display/bridge/ite,it61620.yaml       | 138 +++++++++++++++++++++
>  1 file changed, 138 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ff8ff390a1c0c31bb05ba0e237490cff2942cd05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
> @@ -0,0 +1,138 @@
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
> +  interrupts-extended:

Just 'interrupts' in bindings. Either works in .dts files.

> +    maxItems: 1
> +    description: interrupt specifier of INT pin
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: gpio specifier of RESET pin
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
> +  dsi-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Number of DSI input lanes used (1, 2 or 4)
> +    minimum: 1
> +    maximum: 4
> +    default: 4

There's a standard property for this in the graph binding. Use it.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base

"#/properties/port" if you don't have extra properties.

> +        description: A port node pointing to DSI host port node
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base

Same here.

> +        description: Video port for HDMI output
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
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
> +        hdmibrdg: ite61620@58 {

Drop unused labels and "hdmi" for the node name.

> +                compatible = "ite,it61620";
> +                reg = <0x58>;
> +                #sound-dai-cells = <0>;
> +                interrupts-extended = <&pio 128 IRQ_TYPE_LEVEL_LOW>;
> +                pinctrl-names = "default";
> +                pinctrl-0 = <&it61620_pins>;
> +                reset-gpios = <&pio 127 GPIO_ACTIVE_LOW>;
> +                ivdd-supply = <&pp1000_hdmi_x>;
> +                ovdd-supply = <&pp3300_vio28_x>;
> +                ovdd1833-supply = <&pp1800_vcamio_x>;
> +                dsi-lanes = <4>;
> +                status = "okay";

Drop status.

> +
> +                ports {
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +
> +                        port@0 {
> +                                reg = <0>;
> +                                it61620_dsi_in: endpoint {
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
