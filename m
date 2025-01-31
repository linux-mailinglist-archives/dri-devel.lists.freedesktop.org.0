Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC0AA23A47
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 08:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7897610EA27;
	Fri, 31 Jan 2025 07:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pEqKMybv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FD510EA27
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 07:47:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3A0A65C6074;
 Fri, 31 Jan 2025 07:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CEDC4CED1;
 Fri, 31 Jan 2025 07:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738309635;
 bh=ccZFHqJNBUQZKzR/Y4K1/cN5filuLBXWBcaSuM5q6BI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pEqKMybv1aBK22Pq9pmJUU6R/Yhk43HLgK4t9onviHtjLZUKtd5F87rvEwHFgN5pJ
 71aAdDpkGNpXpFGISZgejVt0DhYmXeBPeFtPw+PIsM4AnCbJGAfSkL+Tm3HWTP/qci
 9rmRJ/i2B1AxJFMD0Rh1h7jWozTVqBTODKB37Bhs8wEjqNdCLaUx7/3kKzTJhPyhsv
 NxyTvDzImyIcVbY2JVVYNkyxV9Djlg4UNG4mqqULo/i1K1WFnjD/7xySz03D5DmNeK
 LdBqHjRF6FrAhx6izwUAIWzyJc8MmTD2qwj6D/oZ/MMx9HGRceKlcUZORYJ9gm1+Mj
 vVTkoG+ujvm8Q==
Date: Fri, 31 Jan 2025 08:47:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hironori KIKUCHI <kikuchan98@gmail.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add generic
 MIPI-DSI/DPI panels
Message-ID: <20250131-whispering-ermine-of-wealth-d3d88c@krzk-bin>
References: <20250131064354.4163579-1-kikuchan98@gmail.com>
 <20250131064354.4163579-2-kikuchan98@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250131064354.4163579-2-kikuchan98@gmail.com>
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

On Fri, Jan 31, 2025 at 03:43:53PM +0900, Hironori KIKUCHI wrote:
> This is a binding for generic MIPI-DSI/DPI panels that require
> initialization with a simple command sequence before use.
> 
> Although the `panel-simple` binding exists for generic panels, it is not
> suitable for panels that require initialization via their communication
> bus, as such panels cannot be considered "simple".
> 
> While many dedicated bindings exist for such panels, the generic panels
> are not complex enough to warrant a dedicated binding because they only
> require a "simple" initialization before use.

All hardware warrants a dedicated binding. I don't get from where did
you take such rule that you can skip actual hardware specific aspects.

> 
> This binding addresses that gap.
> 
> Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> ---
>  .../bindings/display/panel/panel-mipi.yaml    | 244 ++++++++++++++++++
>  1 file changed, 244 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
> new file mode 100644
> index 00000000000..681614333d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi.yaml
> @@ -0,0 +1,244 @@
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
> +description:
> +  This is a binding for generic MIPI-DSI/DPI panels that require
> +  initialization with a simple command sequence before use.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - panel-mipi-dsi
> +          - panel-mipi-dpi-spi

Missing device specific compatibles.

> +      - items:
> +          - {}
> +          - enum:
> +              - panel-mipi-dsi
> +              - panel-mipi-dpi-spi
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
> +  width-mm: true
> +  height-mm: true
> +  panel-timing: true
> +  display-timings: true
> +
> +  reset-delay:
> +    description: Delay (in ms) after the reset command

So use proper unit suffixes. Everywhere.


> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  init-delay:
> +    description: Delay (in ms) for sending the initial command sequence
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  sleep-delay:
> +    description: Delay (in ms) after the sleep command
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  backlight-delay:
> +    description: Delay (in ms) for enabling the backlight
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  port: true
> +  reset-gpios: true
> +  rotation: true
> +
> +  backlight: true
> +
> +  init-sequence:
> +    description: Encoded initial command sequence.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  dsi-mode-video:
> +    description: Enable MIPI_DSI_MODE_VIDEO.
> +      Disallowed for SPI.
> +    type: boolean
> +
> +  dsi-mode-video-burst:
> +    description: Enable MIPI_DSI_MODE_VIDEO_BURST.
> +      Disallowed for SPI.
> +    type: boolean
> +
> +  dsi-mode-video-sync-pulse:
> +    description: Enable MIPI_DSI_MODE_VIDEO_SYNC_PULSE.
> +      Disallowed for SPI.
> +    type: boolean
> +
> +  dsi-mode-video-auto-vert:
> +    description: Enable MIPI_DSI_MODE_VIDEO_AUTO_VERT.
> +      Disallowed for SPI.
> +    type: boolean
> +
> +  dsi-mode-video-hse:
> +    description: Enable MIPI_DSI_MODE_VIDEO_HSE.
> +      Disallowed for SPI.
> +    type: boolean
> +
> +  dsi-mode-video-no-hfp:
> +    description: Enable MIPI_DSI_MODE_VIDEO_NO_HFP.
> +      Disallowed for SPI.
> +    type: boolean
> +
> +  dsi-mode-video-no-hbp:
> +    description: Enable MIPI_DSI_MODE_VIDEO_NO_HBP.
> +      Disallowed for SPI.
> +    type: boolean
> +
> +  dsi-mode-video-no-hsa:
> +    description: Enable MIPI_DSI_MODE_VIDEO_NO_HSA.
> +      Disallowed for SPI.
> +    type: boolean
> +
> +  dsi-mode-vsync-flush:
> +    description: Enable MIPI_DSI_MODE_VSYNC_FLUSH.
> +      Disallowed for SPI.
> +    type: boolean
> +
> +  dsi-mode-no-eot-packet:
> +    description: Enable MIPI_DSI_MODE_NO_EOT_PACKET.
> +      Disallowed for SPI.
> +    type: boolean
> +
> +  dsi-clock-non-continuous:
> +    description: Enable MIPI_DSI_CLOCK_NON_CONTINUOUS.
> +      Disallowed for SPI.
> +    type: boolean
> +
> +  dsi-mode-lpm:
> +    description: Enable MIPI_DSI_MODE_LPM.
> +      Disallowed for SPI.
> +    type: boolean
> +
> +  dsi-hs-pkt-end-aligned:

All this must be deduced from the compatible which makes this binding
redundant.  This binding is a no-go for me for obvious reasons: is not
specific and you try to bypass the exact rule of bindings to be specific
about hardware.


> +    description: Enable MIPI_DSI_HS_PKT_END_ALIGNED.
> +      Disallowed for SPI.
> +    type: boolean
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
> +      properties:
> +        dsi-mode-video: false
> +        dsi-mode-video-burst: false
> +        dsi-mode-video-sync-pulse: false
> +        dsi-mode-video-auto-vert: false
> +        dsi-mode-video-hse: false
> +        dsi-mode-video-no-hfp: false
> +        dsi-mode-video-no-hbp: false
> +        dsi-mode-video-no-hsa: false
> +        dsi-mode-vsync-flush: false
> +        dsi-mode-no-eot-packet: false
> +        dsi-clock-non-continuous: false
> +        dsi-mode-lpm: false
> +        dsi-hs-pkt-end-aligned: false
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
> +            compatible = "vendor,some-panel", "panel-mipi-dsi";

Undocumented compatible.

Best regards,
Krzysztof

