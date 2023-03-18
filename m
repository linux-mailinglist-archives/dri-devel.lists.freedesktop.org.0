Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B566BF8F8
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 09:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A648810E45D;
	Sat, 18 Mar 2023 08:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94F110E45C;
 Sat, 18 Mar 2023 08:29:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (i6DFAE836.versanet.de
 [109.250.232.54])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FE2DB6C;
 Sat, 18 Mar 2023 09:29:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1679128161;
 bh=zvyk1O+k/MiKnGzSSMhQAc136ianMKlRnS+QvoVDz8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uh9CVtc0etzdTZAnPqFl4dcKzRQNP1GaQqRk4jwek5vqSIEepTaK01pwt4V1sVQ86
 g8IlZlPenF7152NjH5cJfK7tkFDOTnVSnDGWMoTopFF1zU15T+sVrHGFwF23dsIqd+
 +FDtAq8OrCqTXYozLBriyzKFsNODXxCCfqckYqF4=
Date: Sat, 18 Mar 2023 10:29:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Drop unneeded quotes
Message-ID: <20230318082926.GA10144@pendragon.ideasonboard.com>
References: <20230317233626.3968358-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230317233626.3968358-1-robh@kernel.org>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Tomi Valkeinen <tomba@kernel.org>,
 Robin van der Gracht <robin@protonic.nl>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for the patch.

On Fri, Mar 17, 2023 at 06:36:24PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../bindings/auxdisplay/holtek,ht16k33.yaml    |  2 +-
>  .../bindings/display/bridge/nxp,ptn3460.yaml   |  2 +-
>  .../display/bridge/toshiba,tc358767.yaml       |  2 +-
>  .../bindings/display/dp-aux-bus.yaml           |  2 +-
>  .../display/mediatek/mediatek,hdmi.yaml        |  2 +-
>  .../display/msm/dsi-controller-main.yaml       |  8 ++++----
>  .../bindings/display/msm/dsi-phy-10nm.yaml     |  2 +-
>  .../bindings/display/panel/ronbo,rb070d30.yaml |  2 +-
>  .../bindings/display/renesas,du.yaml           |  4 ++--
>  .../display/tegra/nvidia,tegra114-mipi.yaml    |  2 +-
>  .../display/tegra/nvidia,tegra124-sor.yaml     | 12 ++++++------
>  .../display/tegra/nvidia,tegra186-dc.yaml      |  4 ++--
>  .../tegra/nvidia,tegra186-dsi-padctl.yaml      |  2 +-
>  .../display/tegra/nvidia,tegra20-dsi.yaml      | 12 ++++++------
>  .../display/tegra/nvidia,tegra20-hdmi.yaml     |  6 +++---
>  .../bindings/display/ti/ti,am65x-dss.yaml      |  2 +-
>  .../display/xylon,logicvc-display.yaml         | 18 +++++++++---------
>  17 files changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> index fc4873deb76f..4f6ffb8182a9 100644
> --- a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> +++ b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Robin van der Gracht <robin@protonic.nl>
>  
>  allOf:
> -  - $ref: "/schemas/input/matrix-keymap.yaml#"
> +  - $ref: /schemas/input/matrix-keymap.yaml#
>  
>  properties:
>    compatible:
> diff --git a/Documentation/devicetree/bindings/display/bridge/nxp,ptn3460.yaml b/Documentation/devicetree/bindings/display/bridge/nxp,ptn3460.yaml
> index 107dd138e6c6..cdeb67bc05f0 100644
> --- a/Documentation/devicetree/bindings/display/bridge/nxp,ptn3460.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/nxp,ptn3460.yaml
> @@ -18,7 +18,7 @@ properties:
>      maxItems: 1
>  
>    edid-emulation:
> -    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      description:
>        The EDID emulation entry to use
>        Value  Resolution  Description
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> index 140927884418..e1494b5007cb 100644
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
> @@ -23,7 +23,7 @@ properties:
>          i2c address of the bridge, 0x68 or 0x0f, depending on bootstrap pins
>  
>    clock-names:
> -    const: "ref"
> +    const: ref
>  
>    clocks:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/dp-aux-bus.yaml b/Documentation/devicetree/bindings/display/dp-aux-bus.yaml
> index 5e4afe9f98fb..0ece7b01790b 100644
> --- a/Documentation/devicetree/bindings/display/dp-aux-bus.yaml
> +++ b/Documentation/devicetree/bindings/display/dp-aux-bus.yaml
> @@ -26,7 +26,7 @@ description:
>  
>  properties:
>    $nodename:
> -    const: "aux-bus"
> +    const: aux-bus
>  
>    panel:
>      $ref: panel/panel-common.yaml#
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> index 8afdd67d6780..b90b6d18a828 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> @@ -50,7 +50,7 @@ properties:
>        - const: hdmi
>  
>    mediatek,syscon-hdmi:
> -    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>      items:
>        - items:
>            - description: phandle to system configuration registers
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index e75a3efe4dac..2188d7c9b0bb 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -74,7 +74,7 @@ properties:
>  
>    syscon-sfpb:
>      description: A phandle to mmss_sfpb syscon node (only for DSIv2).
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>  
>    qcom,dual-dsi-mode:
>      type: boolean
> @@ -105,14 +105,14 @@ properties:
>      type: object
>  
>    ports:
> -    $ref: "/schemas/graph.yaml#/properties/ports"
> +    $ref: /schemas/graph.yaml#/properties/ports
>      description: |
>        Contains DSI controller input and output ports as children, each
>        containing one endpoint subnode.
>  
>      properties:
>        port@0:
> -        $ref: "/schemas/graph.yaml#/$defs/port-base"
> +        $ref: /schemas/graph.yaml#/$defs/port-base
>          unevaluatedProperties: false
>          description: |
>            Input endpoints of the controller.
> @@ -128,7 +128,7 @@ properties:
>                    enum: [ 0, 1, 2, 3 ]
>  
>        port@1:
> -        $ref: "/schemas/graph.yaml#/$defs/port-base"
> +        $ref: /schemas/graph.yaml#/$defs/port-base
>          unevaluatedProperties: false
>          description: |
>            Output endpoints of the controller.
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> index 3ec466c3ab38..e6b00d7387ce 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -58,7 +58,7 @@ properties:
>        maximum: 31
>  
>    qcom,phy-drive-ldo-level:
> -    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      description:
>        The PHY LDO has an amplitude tuning feature to adjust the LDO output
>        for the HSTX drive. Use supported levels (mV) to offset the drive level
> diff --git a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> index d67617f6f74a..95ce22c6787a 100644
> --- a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> @@ -37,7 +37,7 @@ properties:
>  
>    backlight:
>      description: Backlight used by the panel
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index d4830f52c512..c5b9e6812bce 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -76,7 +76,7 @@ properties:
>      unevaluatedProperties: false
>  
>    renesas,cmms:
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>      items:
>        maxItems: 1
>      description:
> @@ -84,7 +84,7 @@ properties:
>        available DU channel.
>  
>    renesas,vsps:
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>      items:
>        items:
>          - description: phandle to VSP instance that serves the DU channel
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
> index d5ca8cf86e8e..f448624dd779 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
> @@ -38,7 +38,7 @@ properties:
>      description: The number of cells in a MIPI calibration specifier.
>        Should be 1. The single cell specifies a bitmask of the pads that
>        need to be calibrated for a given device.
> -    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      const: 1
>  
>  additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml
> index 907fb0baccae..70f0e45c71d6 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra124-sor.yaml
> @@ -69,12 +69,12 @@ properties:
>    # Tegra186 and later
>    nvidia,interface:
>      description: index of the SOR interface
> -    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    $ref: /schemas/types.yaml#/definitions/uint32
>  
>    nvidia,ddc-i2c-bus:
>      description: phandle of an I2C controller used for DDC EDID
>        probing
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>  
>    nvidia,hpd-gpio:
>      description: specifies a GPIO used for hotplug detection
> @@ -82,23 +82,23 @@ properties:
>  
>    nvidia,edid:
>      description: supplies a binary EDID blob
> -    $ref: "/schemas/types.yaml#/definitions/uint8-array"
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>  
>    nvidia,panel:
>      description: phandle of a display panel, required for eDP
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>  
>    nvidia,xbar-cfg:
>      description: 5 cells containing the crossbar configuration.
>        Each lane of the SOR, identified by the cell's index, is
>        mapped via the crossbar to the pad specified by the cell's
>        value.
> -    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>  
>    # optional when driving an eDP output
>    nvidia,dpaux:
>      description: phandle to a DispayPort AUX interface
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>  
>  allOf:
>    - if:
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
> index 265a60d79d89..ce4589466a18 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
> @@ -60,13 +60,13 @@ properties:
>    nvidia,outputs:
>      description: A list of phandles of outputs that this display
>        controller can drive.
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>  
>    nvidia,head:
>      description: The number of the display controller head. This
>        is used to setup the various types of output to receive
>        video data from the given head.
> -    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    $ref: /schemas/types.yaml#/definitions/uint32
>  
>  additionalProperties: false
>  
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml
> index e5a6145c8c53..da75b71e8ece 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dsi-padctl.yaml
> @@ -29,7 +29,7 @@ properties:
>        - const: dsi
>  
>  allOf:
> -  - $ref: "/schemas/reset/reset.yaml"
> +  - $ref: /schemas/reset/reset.yaml
>  
>  additionalProperties: false
>  
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
> index 511cbe74e729..59e1dc0813e7 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
> @@ -59,12 +59,12 @@ properties:
>      description: Should contain a phandle and a specifier specifying
>        which pads are used by this DSI output and need to be
>        calibrated. See nvidia,tegra114-mipi.yaml for details.
> -    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>  
>    nvidia,ddc-i2c-bus:
>      description: phandle of an I2C controller used for DDC EDID
>        probing
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>  
>    nvidia,hpd-gpio:
>      description: specifies a GPIO used for hotplug detection
> @@ -72,19 +72,19 @@ properties:
>  
>    nvidia,edid:
>      description: supplies a binary EDID blob
> -    $ref: "/schemas/types.yaml#/definitions/uint8-array"
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>  
>    nvidia,panel:
>      description: phandle of a display panel
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>  
>    nvidia,ganged-mode:
>      description: contains a phandle to a second DSI controller to
>        gang up with in order to support up to 8 data lanes
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>  
>  allOf:
> -  - $ref: "../dsi-controller.yaml#"
> +  - $ref: ../dsi-controller.yaml#
>    - if:
>        properties:
>          compatible:
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
> index f65e59cfffa7..f77197e4869f 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
> @@ -68,7 +68,7 @@ properties:
>    nvidia,ddc-i2c-bus:
>      description: phandle of an I2C controller used for DDC EDID
>        probing
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>  
>    nvidia,hpd-gpio:
>      description: specifies a GPIO used for hotplug detection
> @@ -76,11 +76,11 @@ properties:
>  
>    nvidia,edid:
>      description: supplies a binary EDID blob
> -    $ref: "/schemas/types.yaml#/definitions/uint8-array"
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>  
>    nvidia,panel:
>      description: phandle of a display panel
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>  
>    "#sound-dai-cells":
>      const: 0
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 5c7d2cbc4aac..4247280d6c3c 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -88,7 +88,7 @@ properties:
>            The DSS DPI output port node from video port 2
>  
>    ti,am65x-oldi-io-ctrl:
> -    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    $ref: /schemas/types.yaml#/definitions/phandle
>      description:
>        phandle to syscon device node mapping OLDI IO_CTRL registers.
>        The mapped range should point to OLDI_DAT0_IO_CTRL, map it and
> diff --git a/Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml b/Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
> index fc02c5d50ce4..87404d72ea37 100644
> --- a/Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
> +++ b/Documentation/devicetree/bindings/display/xylon,logicvc-display.yaml
> @@ -89,25 +89,25 @@ properties:
>      description: Display output colorspace (C_DISPLAY_COLOR_SPACE).
>  
>    xylon,display-depth:
> -    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      description: Display output depth (C_PIXEL_DATA_WIDTH).
>  
>    xylon,row-stride:
> -    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    $ref: /schemas/types.yaml#/definitions/uint32
>      description: Fixed number of pixels in a framebuffer row (C_ROW_STRIDE).
>  
>    xylon,dithering:
> -    $ref: "/schemas/types.yaml#/definitions/flag"
> +    $ref: /schemas/types.yaml#/definitions/flag
>      description: Dithering module is enabled (C_XCOLOR)
>  
>    xylon,background-layer:
> -    $ref: "/schemas/types.yaml#/definitions/flag"
> +    $ref: /schemas/types.yaml#/definitions/flag
>      description: |
>        The last layer is used to display a black background (C_USE_BACKGROUND).
>        The layer must still be registered.
>  
>    xylon,layers-configurable:
> -    $ref: "/schemas/types.yaml#/definitions/flag"
> +    $ref: /schemas/types.yaml#/definitions/flag
>      description: |
>        Configuration of layers' size, position and offset is enabled
>        (C_USE_SIZE_POSITION).
> @@ -131,7 +131,7 @@ properties:
>              maxItems: 1
>  
>            xylon,layer-depth:
> -            $ref: "/schemas/types.yaml#/definitions/uint32"
> +            $ref: /schemas/types.yaml#/definitions/uint32
>              description: Layer depth (C_LAYER_X_DATA_WIDTH).
>  
>            xylon,layer-colorspace:
> @@ -151,19 +151,19 @@ properties:
>              description: Alpha mode for the layer (C_LAYER_X_ALPHA_MODE).
>  
>            xylon,layer-base-offset:
> -            $ref: "/schemas/types.yaml#/definitions/uint32"
> +            $ref: /schemas/types.yaml#/definitions/uint32
>              description: |
>                Offset in number of lines (C_LAYER_X_OFFSET) starting from the
>                video RAM base (C_VMEM_BASEADDR), only for version 3.
>  
>            xylon,layer-buffer-offset:
> -            $ref: "/schemas/types.yaml#/definitions/uint32"
> +            $ref: /schemas/types.yaml#/definitions/uint32
>              description: |
>                Offset in number of lines (C_BUFFER_*_OFFSET) starting from the
>                layer base offset for the second buffer used in double-buffering.
>  
>            xylon,layer-primary:
> -            $ref: "/schemas/types.yaml#/definitions/flag"
> +            $ref: /schemas/types.yaml#/definitions/flag
>              description: |
>                Layer should be registered as a primary plane (exactly one is
>                required).

-- 
Regards,

Laurent Pinchart
