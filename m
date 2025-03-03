Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D00A4C163
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 14:12:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D55810E3FC;
	Mon,  3 Mar 2025 13:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KtM8k1CG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C0E10E3FC
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:12:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8BE0A61190;
 Mon,  3 Mar 2025 13:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B42C4CEE6;
 Mon,  3 Mar 2025 13:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741007542;
 bh=DTKGQ8eC/ctsrimOWqQCAQhsg20781WA34NJR5qYxVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KtM8k1CGr2p1Z9HinZQAFkbEWOIiTsYidqc/4je/JLQoDg6C1XhF+m4L8iL8DZHUE
 rnoFQUv+HVSUlckzv6ANO30P7b6AffVyFe01K9NLhl0FXUVBIc3k0Bo3lPT8VQzqQM
 bwkVDEgerFG8+TNgyfHJ0nJKZEbqo5qlu3nhTQGz+4m1hNtl9nOcgAwO5ucmQLWhDG
 X/NjcxwdJ6zLnCZMHA7MQdTvWvGAU+DaHiLm5AgsTGtFU95i2iV7ioDwATvAKIV8RC
 v5zq2lQryTqWK4v9jw+j8iV+P0YCRz2jH1wdS8CXCBXoi8wLNmjlddiLO+V/x6eaTg
 +NX8M4RquJ3ew==
Date: Mon, 3 Mar 2025 07:12:20 -0600
From: Rob Herring <robh@kernel.org>
To: Hironori KIKUCHI <kikuchan98@gmail.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: Add some generic
 MIPI-DSI/DPI panels
Message-ID: <20250303131220.GA1437304-robh@kernel.org>
References: <20250226112552.52494-1-kikuchan98@gmail.com>
 <20250226112552.52494-3-kikuchan98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226112552.52494-3-kikuchan98@gmail.com>
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

On Wed, Feb 26, 2025 at 08:25:49PM +0900, Hironori KIKUCHI wrote:
> This is a binding for generic MIPI-DSI/DPI panels that require
> initialization with a simple command sequence before use.
> 
> The initialization of the panel requires a firmware binary which can be
> made with the Panel Firmware Generator[1] on the web.
> 
> Add 4 new panels, as they are available on the same page[1] as a preset
> (excluding already included ones).
> 
> Note that the "xx" in the panel name is taken from a product's name,
> not a wildcard.
> 
> [1]: https://kikuchan.github.io/panel-firmware-generator/
> 
> Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> ---
>  .../bindings/display/panel/panel-mipi.yaml    | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
> new file mode 100644
> index 00000000000..d70cf0063fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-mipi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic MIPI-DSI/DPI Panels Requiring Initialization
> +
> +maintainers:
> +  - Hironori KIKUCHI <kikuchan98@gmail.com>
> +
> +description: This is a binding for generic MIPI-DSI/DPI panels that require
> +  initialization with a simple command sequence before use.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              # Unknown 3.35" 720x480 24-bit IPS LCD panel
> +              # used in Anbernic RG 34XX
> +              - anbernic,rg34xx-panel
> +              # Unknown 4.00" 640x480 24-bit IPS LCD panel (YLM-LBV0400001X-V1)
> +              # used in Anbernic RG40XX series
> +              - anbernic,rg40xx-panel
> +              # Unknown 3.95" 720x720 24-bit IPS LCD panel (YLM-LBN0395004H-V1)
> +              # used in Anbernic RG CubeXX
> +              - anbernic,rgcubexx-panel
> +          - const: panel-mipi-dpi-spi

We already have a schema for this: panel-mipi-dpi-spi.yaml

> +      - items:
> +          - enum:
> +              # HOTHMI TFT-H028B23VGIST7G40-V1 2.80" 480x640 TFT LCD panel
> +              - hothmi,tft-h028b23vgist7g40-v1
> +          - const: panel-mipi-dsi

We have lots of DSI panels already and they don't have a generic 
fallback. What exactly would "panel-mipi-dsi" mean to the OS? It's got 
to be useful on its own or it should be dropped.

> +
> +  reg:
> +    description: DSI / SPI channel used by that screen
> +    maxItems: 1
> +
> +  power-supply: true
> +
> +  io-supply:
> +    description: I/O system regulator.
> +      No need to set if this is the same as polwer-supply.
> +
> +  dc-gpios:
> +    maxItems: 1
> +    description: Controller data/command selection (D/CX) in 4-line SPI mode.
> +      If not set, the controller is in 3-line SPI mode.
> +      Disallowed for DSI.
> +
> +  port: true
> +  reset-gpios: true
> +
> +  backlight: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - panel-mipi-dpi-spi
> +    then:
> +      # SPI mode
> +      $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - panel-mipi-dsi
> +    then:
> +      # DSI mode
> +      properties:
> +        dc-gpios: false
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "hothmi,tft-h028b23vgist7g40-v1", "panel-mipi-dsi";
> +            reg = <0>;
> +
> +            port {
> +                mipi_in_panel: endpoint {
> +                    remote-endpoint = <&mipi_out_panel>;
> +                };
> +            };
> +        };
> +    };
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "anbernic,rg40xx-panel", "panel-mipi-dpi-spi";
> +            reg = <0>;
> +
> +            spi-max-frequency = <40000000>;
> +
> +            dc-gpios = <&gpio 24 GPIO_ACTIVE_HIGH>;
> +            reset-gpios = <&gpio 25 GPIO_ACTIVE_LOW>;
> +
> +            backlight = <&backlight>;
> +        };
> +    };
> -- 
> 2.48.1
> 
