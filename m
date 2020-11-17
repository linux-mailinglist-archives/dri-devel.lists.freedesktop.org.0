Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C29E2B5BFB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 10:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6AC89BAE;
	Tue, 17 Nov 2020 09:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE7289BAE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 09:43:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DEAFD563;
 Tue, 17 Nov 2020 10:43:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1605606182;
 bh=eBSYqYi5GybKlUev4i0abxdfR0D/GCWTI6ryjetx6f4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xa3r5rlmwrIvuKmI6au+4sfQN+q2Uigf+AtgulorbI4m2JvvPcFYdfp0fBwlSIJmt
 cugjwpSeaBHb32KCtkAVXmpmuTrzZ25QWv7o7kFn+0Hndlv+xG3uHR9mfS5ZVNJObz
 lbq32v+Gtzwv39XvO1QGVJQ2cuArVamjIcoeD014=
Date: Tue, 17 Nov 2020 11:42:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Use OF graph schema
Message-ID: <20201117094257.GA3940@pendragon.ideasonboard.com>
References: <20201117013703.2477151-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117013703.2477151-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Thank you for the patch.

On Mon, Nov 16, 2020 at 07:37:03PM -0600, Rob Herring wrote:
> Now that we have a graph schema, rework the display related schemas to use
> it. Mostly this is adding a reference to graph.yaml and dropping duplicate
> parts from schemas.
> 
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> graph.yaml is in the dtschema repo, so this can go into drm-misc and 
> hopefully anything afterwards be fixed up to use graph.yaml.
> 
>  .../allwinner,sun4i-a10-display-backend.yaml  | 14 +---
>  .../allwinner,sun4i-a10-display-frontend.yaml | 16 +----
>  .../display/allwinner,sun4i-a10-hdmi.yaml     | 16 +----
>  .../display/allwinner,sun4i-a10-tcon.yaml     | 16 +----
>  .../allwinner,sun4i-a10-tv-encoder.yaml       |  2 +-
>  .../display/allwinner,sun6i-a31-drc.yaml      | 16 +----
>  .../display/allwinner,sun6i-a31-mipi-dsi.yaml |  6 +-
>  .../allwinner,sun8i-a83t-de2-mixer.yaml       | 16 +----
>  .../display/allwinner,sun8i-a83t-dw-hdmi.yaml | 16 +----
>  .../display/allwinner,sun8i-r40-tcon-top.yaml | 19 +-----
>  .../display/allwinner,sun9i-a80-deu.yaml      | 16 +----
>  .../bindings/display/brcm,bcm2835-dpi.yaml    |  7 +-
>  .../display/bridge/analogix,anx7625.yaml      |  5 +-
>  .../display/bridge/analogix,anx7814.yaml      | 18 +----
>  .../bindings/display/bridge/anx6345.yaml      | 15 ++--
>  .../display/bridge/cdns,mhdp8546.yaml         | 18 +----
>  .../display/bridge/chrontel,ch7033.yaml       |  3 +
>  .../display/bridge/intel,keembay-dsi.yaml     |  9 +--
>  .../bindings/display/bridge/ite,it6505.yaml   |  2 +-
>  .../display/bridge/lontium,lt9611.yaml        | 68 ++-----------------
>  .../bindings/display/bridge/lvds-codec.yaml   | 15 +---
>  .../bindings/display/bridge/nwl-dsi.yaml      | 17 +----
>  .../bindings/display/bridge/ps8640.yaml       | 21 ++----
>  .../bindings/display/bridge/renesas,lvds.yaml | 15 +---
>  .../display/bridge/simple-bridge.yaml         | 15 +---
>  .../display/bridge/snps,dw-mipi-dsi.yaml      |  5 +-
>  .../display/bridge/thine,thc63lvd1024.yaml    | 16 +----
>  .../bindings/display/bridge/ti,sn65dsi86.yaml | 27 +-------
>  .../bindings/display/bridge/ti,tfp410.yaml    | 15 +---
>  .../display/bridge/toshiba,tc358762.yaml      | 51 ++------------
>  .../display/bridge/toshiba,tc358768.yaml      | 11 +--
>  .../display/bridge/toshiba,tc358775.yaml      | 17 ++---
>  .../connector/analog-tv-connector.yaml        |  1 +
>  .../display/connector/dvi-connector.yaml      |  1 +
>  .../display/connector/hdmi-connector.yaml     |  1 +
>  .../display/connector/vga-connector.yaml      |  1 +
>  .../bindings/display/imx/nxp,imx8mq-dcss.yaml |  2 +-
>  .../bindings/display/ingenic,lcd.yaml         |  7 +-
>  .../display/intel,keembay-display.yaml        |  2 +-
>  .../display/panel/advantech,idk-2121wr.yaml   |  5 ++
>  .../bindings/display/panel/panel-common.yaml  | 11 +--
>  .../rockchip/rockchip,rk3066-hdmi.yaml        | 13 +---
>  .../display/rockchip/rockchip-vop.yaml        |  5 +-
>  .../bindings/display/st,stm32-dsi.yaml        | 13 ++--
>  .../bindings/display/st,stm32-ltdc.yaml       |  7 +-
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 16 +----
>  .../bindings/display/ti/ti,j721e-dss.yaml     | 18 +----
>  .../bindings/display/ti/ti,k2g-dss.yaml       |  4 +-
>  48 files changed, 121 insertions(+), 509 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-backend.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-backend.yaml
> index 86057d541065..7e8798b43c2a 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-backend.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-backend.yaml
> @@ -85,17 +85,9 @@ properties:
>  
>    ports:
>      type: object

Do we need to specify the type here (and in all the locations below),
give that it's specified in /schemas/graph.yaml#/properties/ports ?

> -    description: |
> -      A ports node with endpoint definitions as defined in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> -
>        port@0:
>          type: object
>          description: |
> @@ -107,12 +99,10 @@ properties:
>            Output endpoints of the controller.
>  
>      required:
> -      - "#address-cells"
> -      - "#size-cells"
>        - port@0
>        - port@1
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml
> index 3eb1c2bbf4e7..005a550d7226 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml
> @@ -58,33 +58,21 @@ properties:
>  
>    ports:
>      type: object
> -    description: |
> -      A ports node with endpoint definitions as defined in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> -
>        port@0:
> -        type: object
>          description: |
>            Input endpoints of the controller.
>  
>        port@1:
> -        type: object
>          description: |
>            Output endpoints of the controller.
>  
>      required:
> -      - "#address-cells"
> -      - "#size-cells"
>        - port@1
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-hdmi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-hdmi.yaml
> index 75e6479397a5..2c2a582300b7 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-hdmi.yaml
> @@ -77,35 +77,23 @@ properties:
>  
>    ports:
>      type: object
> -    description: |
> -      A ports node with endpoint definitions as defined in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> -
>        port@0:
> -        type: object
>          description: |
>            Input endpoints of the controller.
>  
>        port@1:
> -        type: object
>          description: |
>            Output endpoints of the controller. Usually an HDMI
>            connector.
>  
>      required:
> -      - "#address-cells"
> -      - "#size-cells"
>        - port@0
>        - port@1
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> index 4c15a2644a7c..ce1065b46ef9 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> @@ -116,24 +116,14 @@ properties:
>  
>    ports:
>      type: object
> -    description: |
> -      A ports node with endpoint definitions as defined in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> -
>        port@0:
> -        type: object
>          description: |
>            Input endpoints of the controller.
>  
>        port@1:
> -        type: object
>          description: |
>            Output endpoints of the controller.
>  
> @@ -159,12 +149,10 @@ properties:
>              unevaluatedProperties: true
>  
>      required:
> -      - "#address-cells"
> -      - "#size-cells"
>        - port@0
>        - port@1
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tv-encoder.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tv-encoder.yaml
> index 6009324be967..9885839df5eb 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tv-encoder.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tv-encoder.yaml
> @@ -24,7 +24,7 @@ properties:
>      maxItems: 1
>  
>    port:
> -    type: object
> +    $ref: /schemas/graph.yaml#/properties/port
>      description:
>        A port node with endpoint definitions as defined in
>        Documentation/devicetree/bindings/media/video-interfaces.txt. The
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml
> index 0c1ce55940e1..287681fcde72 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml
> @@ -47,34 +47,22 @@ properties:
>  
>    ports:
>      type: object
> -    description: |
> -      A ports node with endpoint definitions as defined in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> -
>        port@0:
> -        type: object
>          description: |
>            Input endpoints of the controller.
>  
>        port@1:
> -        type: object
>          description: |
>            Output endpoints of the controller.
>  
>      required:
> -      - "#address-cells"
> -      - "#size-cells"
>        - port@0
>        - port@1
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> index 7aa330dabc44..a738d7c12a97 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> @@ -47,11 +47,9 @@ properties:
>      const: dphy
>  
>    port:
> -    type: object
> +    $ref: /schemas/graph.yaml#/properties/port
>      description:
> -      A port node with endpoint definitions as defined in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt. That
> -      port should be the input endpoint, usually coming from the
> +      The port should be the input endpoint, usually coming from the
>        associated TCON.
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> index c040eef56518..269e26681b2f 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> @@ -44,33 +44,21 @@ properties:
>  
>    ports:
>      type: object
> -    description: |
> -      A ports node with endpoint definitions as defined in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> -
>        port@0:
> -        type: object
>          description: |
>            Input endpoints of the controller.
>  
>        port@1:
> -        type: object
>          description: |
>            Output endpoints of the controller.
>  
>      required:
> -      - "#address-cells"
> -      - "#size-cells"
>        - port@1
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
> index fa4769a0b26e..37ec88d52099 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
> @@ -94,36 +94,24 @@ properties:
>  
>    ports:
>      type: object
> -    description: |
> -      A ports node with endpoint definitions as defined in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> -
>        port@0:
> -        type: object
>          description: |
>            Input endpoints of the controller. Usually the associated
>            TCON.
>  
>        port@1:
> -        type: object
>          description: |
>            Output endpoints of the controller. Usually an HDMI
>            connector.
>  
>      required:
> -      - "#address-cells"
> -      - "#size-cells"
>        - port@0
>        - port@1
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
> index b98ca609824b..ef6974510590 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
> @@ -81,21 +81,10 @@ properties:
>  
>    ports:
>      type: object
> -    description: |
> -      A ports node with endpoint definitions as defined in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt.
> -      All ports should have only one endpoint connected to
> -      remote endpoint.
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> -
>        port@0:
> -        type: object
>          description: |
>            Input endpoint for Mixer 0 mux.
>  
> @@ -132,7 +121,6 @@ properties:
>          additionalProperties: false
>  
>        port@2:
> -        type: object
>          description: |
>            Input endpoint for Mixer 1 mux.
>  
> @@ -201,19 +189,16 @@ properties:
>          additionalProperties: false
>  
>        port@5:
> -        type: object
>          description: |
>            Output endpoint for HDMI mux
>  
>      required:
> -      - "#address-cells"
> -      - "#size-cells"
>        - port@0
>        - port@1
>        - port@4
>        - port@5
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>  required:
>    - "#clock-cells"
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun9i-a80-deu.yaml b/Documentation/devicetree/bindings/display/allwinner,sun9i-a80-deu.yaml
> index 96de41d32b3e..112f9b93fe8d 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun9i-a80-deu.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun9i-a80-deu.yaml
> @@ -41,34 +41,22 @@ properties:
>  
>    ports:
>      type: object
> -    description: |
> -      A ports node with endpoint definitions as defined in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> -
>        port@0:
> -        type: object
>          description: |
>            Input endpoints of the controller.
>  
>        port@1:
> -        type: object
>          description: |
>            Output endpoints of the controller.
>  
>      required:
> -      - "#address-cells"
> -      - "#size-cells"
>        - port@0
>        - port@1
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
> index 5c1024bbc1b3..c9ad0ecc9b6d 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
> @@ -27,10 +27,9 @@ properties:
>        - const: pixel
>  
>    port:
> -    type: object
> -    description: >
> -      Port node with a single endpoint connecting to the panel, as
> -      defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Port node with a single endpoint connecting to the panel.
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 60585a4fc22b..b99cc1f028be 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -35,16 +35,15 @@ properties:
>      maxItems: 1
>  
>    ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
>      type: object

This is my OCD speaking, assuming we need to keep the type, $ref is
after type in most other locations (there are a few other occurrences
below).

>  
>      properties:
>        port@0:
> -        type: object
>          description:
>            Video port for MIPI DSI input.
>  
>        port@1:
> -        type: object
>          description:
>            Video port for panel or connector.
>  
> @@ -52,6 +51,8 @@ properties:
>          - port@0
>          - port@1
>  
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> index 3ba477aefdd7..ae1c01d85c7e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> @@ -43,34 +43,22 @@ properties:
>  
>    ports:
>      type: object
> -    description:
> -      A node containing input and output port nodes with endpoint
> -      definitions as documented in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt
> -      Documentation/devicetree/bindings/graph.txt
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
>        port@0:
> -        type: object
>          description: Video port for HDMI input.
>  
> -        properties:
> -          reg:
> -            const: 0
> -
>        port@1:
> -        type: object
>          description:
>            Video port for SlimPort, DisplayPort, eDP or MyDP output.
>  
> -        properties:
> -          reg:
> -            const: 1
> -
>      required:
>        - port@0
>        - port@1
>  
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/display/bridge/anx6345.yaml b/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
> index 8c0e4f285fbc..9eaa680d98bc 100644
> --- a/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
> @@ -35,29 +35,22 @@ properties:
>  
>    ports:
>      type: object
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      '#address-cells':
> -        const: 1
> -
> -      '#size-cells':
> -        const: 0
> -
>        port@0:
> -        type: object
> -        description: |
> +        description:
>            Video port for LVTTL input
>  
>        port@1:
> -        type: object
> -        description: |
> +        description:
>            Video port for eDP output (panel or connector).
>            May be omitted if EDID works reliably.
>  
>      required:
>        - port@0
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> index 74d675fc6e7b..d197bae48c8a 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> @@ -58,46 +58,34 @@ properties:
>  
>    ports:
>      type: object
> -    description:
> -      Ports as described in Documentation/devicetree/bindings/graph.txt.
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      '#address-cells':
> -        const: 1
> -
> -      '#size-cells':
> -        const: 0
> -
>        port@0:
> -        type: object
>          description:
>            First input port representing the DP bridge input.
>  
>        port@1:
> -        type: object
>          description:
>            Second input port representing the DP bridge input.
>  
>        port@2:
> -        type: object
>          description:
>            Third input port representing the DP bridge input.
>  
>        port@3:
> -        type: object
>          description:
>            Fourth input port representing the DP bridge input.
>  
>        port@4:
> -        type: object
>          description:
>            Output port representing the DP bridge output.
>  
>      required:
>        - port@0
>        - port@4
> -      - '#address-cells'
> -      - '#size-cells'
> +
> +    unevaluatedProperties: false
>  
>  allOf:
>    - if:
> diff --git a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> index 9f38f55fc990..6f478020014d 100644
> --- a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> @@ -20,6 +20,7 @@ properties:
>  
>    ports:
>      type: object
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
>        port@0:
> @@ -37,6 +38,8 @@ properties:
>        - port@0
>        - port@1
>  
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
> index ab5be2625224..d83e21ec0fb3 100644
> --- a/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/intel,keembay-dsi.yaml
> @@ -35,15 +35,10 @@ properties:
>        - const: clk_mipi_cfg
>  
>    ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
>      type: object

Another case of $ref before type.

>  
>      properties:
> -      '#address-cells':
> -       const: 1
> -
> -      '#size-cells':
> -       const: 0
> -
>        port@0:
>          type: object
>          description: MIPI DSI input port.
> @@ -56,7 +51,7 @@ properties:
>        - port@0
>        - port@1
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> index efbb3d0117dc..eedf8b7f5173 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> @@ -55,7 +55,7 @@ properties:
>      description: extcon specifier for the Power Delivery
>  
>    port:
> -    type: object
> +    $ref: /schemas/graph.yaml#/properties/port
>      description: A port node pointing to DPI host port node
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> index 7a1c89b995e2..840d7f9b19bb 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> @@ -39,84 +39,28 @@ properties:
>  
>    ports:
>      type: object
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> -
>        port@0:
> -        type: object
> -        description: |
> +        description:
>            Primary MIPI port-1 for MIPI input
>  
> -        properties:
> -          reg:
> -            const: 0
> -
> -        patternProperties:
> -          "^endpoint(@[0-9])$":
> -            type: object
> -            additionalProperties: false
> -
> -            properties:
> -              remote-endpoint:
> -                $ref: /schemas/types.yaml#/definitions/phandle
> -
> -        required:
> -          - reg
> -
>        port@1:
> -        type: object
> -        description: |
> +        description:
>            Additional MIPI port-2 for MIPI input, used in combination
>            with primary MIPI port-1 to drive higher resolution displays
>  
> -        properties:
> -          reg:
> -            const: 1
> -
> -        patternProperties:
> -          "^endpoint(@[0-9])$":
> -            type: object
> -            additionalProperties: false
> -
> -            properties:
> -              remote-endpoint:
> -                $ref: /schemas/types.yaml#/definitions/phandle
> -
> -        required:
> -          - reg
> -
>        port@2:
> -        type: object
> -        description: |
> +        description:
>            HDMI port for HDMI output
>  
> -        properties:
> -          reg:
> -            const: 2
> -
> -        patternProperties:
> -          "^endpoint(@[0-9])$":
> -            type: object
> -            additionalProperties: false
> -
> -            properties:
> -              remote-endpoint:
> -                $ref: /schemas/types.yaml#/definitions/phandle
> -
> -        required:
> -          - reg
> -
>      required:
> -      - "#address-cells"
> -      - "#size-cells"
>        - port@0
>        - port@2
>  
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index e5e3c72630cf..517baf661ee5 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -46,24 +46,15 @@ properties:
>  
>    ports:
>      type: object
> -    description: |
> -      This device has two video ports. Their connections are modeled using the
> -      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt
> -    properties:
> -      '#address-cells':
> -        const: 1
> -
> -      '#size-cells':
> -        const: 0
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
> +    properties:
>        port@0:
> -        type: object
>          description: |
>            For LVDS encoders, port 0 is the parallel input
>            For LVDS decoders, port 0 is the LVDS input
>  
>        port@1:
> -        type: object
>          description: |
>            For LVDS encoders, port 1 is the LVDS output
>            For LVDS decoders, port 1 is the parallel output
> @@ -72,7 +63,7 @@ properties:
>        - port@0
>        - port@1
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>    powerdown-gpios:
>      description:
> diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> index a125b2dd3a2f..9664ba22afa1 100644
> --- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> @@ -85,10 +85,8 @@ properties:
>  
>    ports:
>      type: object
> -    description:
> -      A node containing DSI input & output port nodes with endpoint
> -      definitions as documented in
> -      Documentation/devicetree/bindings/graph.txt.
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
>      properties:
>        port@0:
>          type: object

Should type be dropped here ?

> @@ -128,24 +126,15 @@ properties:
>          additionalProperties: false
>  
>        port@1:
> -        type: object
>          description:
>            DSI output port node to the panel or the next bridge
>            in the chain
>  
> -      '#address-cells':
> -        const: 1
> -
> -      '#size-cells':
> -        const: 0
> -
>      required:
> -      - '#address-cells'
> -      - '#size-cells'
>        - port@0
>        - port@1
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>  required:
>    - '#address-cells'
> diff --git a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> index 7e27cfcf770d..c9cf781ee7b2 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> @@ -44,32 +44,21 @@ properties:
>  
>    ports:
>      type: object
> -    description:
> -      A node containing DSI input & output port nodes with endpoint
> -      definitions as documented in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt
> -      Documentation/devicetree/bindings/graph.txt
> -    properties:
> -      '#address-cells':
> -        const: 1
> -
> -      '#size-cells':
> -        const: 0
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
> +    properties:
>        port@0:
> -        type: object
> -        description: |
> +        description:
>            Video port for DSI input
>  
>        port@1:
> -        type: object
> -        description: |
> +        description:
>            Video port for eDP output (panel or connector).
>  
>      required:
>        - port@0
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> index e5b163951b91..b3993300b335 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> @@ -50,31 +50,20 @@ properties:
>  
>    ports:
>      type: object
> -    description: |
> -      This device has two video ports. Their connections are modelled using the
> -      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> -      Each port shall have a single endpoint.
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      '#address-cells':
> -        const: 1
> -
> -      '#size-cells':
> -        const: 0
> -
>        port@0:
> -        type: object
>          description: Parallel RGB input port
>  
>        port@1:
> -        type: object
>          description: LVDS output port
>  
>      required:
>        - port@0
>        - port@1
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>    power-domains:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> index 3ddb35fcf0a2..96dd457a26c1 100644
> --- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> @@ -31,29 +31,20 @@ properties:
>  
>    ports:
>      type: object
> -    description: |
> -      This device has two video ports. Their connections are modeled using the
> -      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> -    properties:
> -      '#address-cells':
> -        const: 1
> -
> -      '#size-cells':
> -        const: 0
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
> +    properties:
>        port@0:
> -        type: object
>          description: The bridge input
>  
>        port@1:
> -        type: object
>          description: The bridge output
>  
>      required:
>        - port@0
>        - port@1
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>    enable-gpios:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
> index e42cb610f545..c04771d01137 100644
> --- a/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml
> @@ -47,20 +47,21 @@ properties:
>      const: apb
>  
>    ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
>      type: object

OCD again :-)

>  
>      properties:
>        port@0:
> -        type: object
>          description: Input node to receive pixel data.
>        port@1:
> -        type: object
>          description: DSI output node to panel.
>  
>      required:
>        - port@0
>        - port@1
>  
> +    unevaluatedProperties: false
> +
>  required:
>    - clock-names
>    - clocks
> diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
> index 469ac4a34273..eed984e08d7c 100644
> --- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
> @@ -26,10 +26,8 @@ properties:
>  
>    ports:
>      type: object
> +    $ref: /schemas/graph.yaml#/properties/ports
>      description: |
> -      This device has four video ports. Their connections are modeled using the
> -      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> -
>        The device can operate in single-link mode or dual-link mode. In
>        single-link mode, all pixels are received on port@0, and port@1 shall not
>        contain any endpoint. In dual-link mode, even-numbered pixels are
> @@ -37,33 +35,23 @@ properties:
>        port@1 shall contain endpoints.
>  
>      properties:
> -      '#address-cells':
> -        const: 1
> -
> -      '#size-cells':
> -        const: 0
> -
>        port@0:
> -        type: object
>          description: First LVDS input port
>  
>        port@1:
> -        type: object
>          description: Second LVDS input port
>  
>        port@2:
> -        type: object
>          description: First digital CMOS/TTL parallel output
>  
>        port@3:
> -        type: object
>          description: Second digital CMOS/TTL parallel output
>  
>      required:
>        - port@0
>        - port@2
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>    oe-gpios:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index f8622bd0f61e..d69b38270f78 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -72,35 +72,14 @@ properties:
>  
>    ports:
>      type: object
> -    additionalProperties: false
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    unevaluatedProperties: false

Maybe after 'required' for consistency ?

>  
>      properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> -
>        port@0:
> -        type: object
> -        additionalProperties: false
> -
>          description:
>            Video port for MIPI DSI input
>  
> -        properties:
> -          reg:
> -            const: 0
> -
> -          endpoint:
> -            type: object
> -            additionalProperties: false
> -            properties:
> -              remote-endpoint: true
> -
> -        required:
> -          - reg
> -
>        port@1:
>          type: object

Should type be dropped ?

>          additionalProperties: false

You drop additionalProperties for port@0 but not for port@1, is that
intentional ?

> @@ -175,8 +154,6 @@ properties:
>            - reg
>  
>      required:
> -      - "#address-cells"
> -      - "#size-cells"
>        - port@0
>        - port@1
>  
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> index 605831c1e836..ffc6540f58e4 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> @@ -31,11 +31,8 @@ properties:
>      maximum: 7
>  
>    ports:
> -    description:
> -      A node containing input and output port nodes with endpoint
> -      definitions as documented in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt
>      type: object
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
>        port@0:
> @@ -68,19 +65,13 @@ properties:
>  
>        port@1:
>          description: DVI output port.
> -        type: object
> -
> -        properties:
> -          reg:
> -            const: 1
> -
> -          endpoint:
> -            type: object
>  
>      required:
>        - port@0
>        - port@1
>  
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - ports
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
> index 195025e6803c..b622c6d489fd 100644
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358762.yaml
> @@ -26,64 +26,23 @@ properties:
>  
>    ports:
>      type: object
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> -
>        port@0:
> -        type: object
> -        additionalProperties: false
> -
> -        description: |
> +        description:
>            Video port for MIPI DSI input
>  
> -        properties:
> -          reg:
> -            const: 0
> -
> -        patternProperties:
> -          endpoint:
> -            type: object
> -            additionalProperties: false
> -
> -            properties:
> -              remote-endpoint: true
> -
> -        required:
> -          - reg
> -
>        port@1:
> -        type: object
> -        additionalProperties: false
> -
> -        description: |
> +        description:
>            Video port for MIPI DPI output (panel or connector).
>  
> -        properties:
> -          reg:
> -            const: 1
> -
> -        patternProperties:
> -          endpoint:
> -            type: object
> -            additionalProperties: false
> -
> -            properties:
> -              remote-endpoint: true
> -
> -        required:
> -          - reg
> -
>      required:
> -      - "#address-cells"
> -      - "#size-cells"
>        - port@0
>        - port@1
>  
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> index c036a75db8f7..6dfe7293420d 100644
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> @@ -43,14 +43,9 @@ properties:
>  
>    ports:
>      type: object
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> -
>        port@0:
>          type: object

Dropping type here too (as well as for port@1) ?

>          additionalProperties: false
> @@ -99,11 +94,11 @@ properties:
>            - reg
>  
>      required:
> -      - "#address-cells"
> -      - "#size-cells"
>        - port@0
>        - port@1
>  
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
> index fd3113aa9ccd..89e5641df643 100644
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
> @@ -45,30 +45,19 @@ properties:
>  
>    ports:
>      type: object
> -    description:
> -      A node containing input and output port nodes with endpoint definitions
> -      as documented in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt
> -    properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
> +    properties:
>        port@0:
> -        type: object
>          description: |
>            DSI Input. The remote endpoint phandle should be a
>            reference to a valid mipi_dsi_host device node.
>  
>        port@1:
> -        type: object
>          description: |
>            Video port for LVDS output (panel or connector).
>  
>        port@2:
> -        type: object
>          description: |
>            Video port for Dual link LVDS output (panel or connector).
>  
> @@ -76,6 +65,8 @@ properties:
>        - port@0
>        - port@1
>  
> +    unevaluatedProperties: false
> +
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
> index eebe88fed999..a31ca2d52b86 100644
> --- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
> +++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
> @@ -25,6 +25,7 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>  
>    port:
> +    $ref: /schemas/graph.yaml#/properties/port
>      description: Connection to controller providing analog TV signals
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml b/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml
> index 71cb9220fa59..93eb14294e68 100644
> --- a/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml
> +++ b/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml
> @@ -36,6 +36,7 @@ properties:
>      description: the connector has pins for DVI dual-link
>  
>    port:
> +    $ref: /schemas/graph.yaml#/properties/port
>      description: Connection to controller providing DVI signals
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
> index 14d7128af592..83c0d008265b 100644
> --- a/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
> +++ b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
> @@ -37,6 +37,7 @@ properties:
>      maxItems: 1
>  
>    port:
> +    $ref: /schemas/graph.yaml#/properties/port
>      description: Connection to controller providing HDMI signals
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/display/connector/vga-connector.yaml b/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
> index 5782c4bb3252..25f868002000 100644
> --- a/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
> +++ b/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
> @@ -20,6 +20,7 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>  
>    port:
> +    $ref: /schemas/graph.yaml#/properties/port
>      description: Connection to controller providing VGA signals
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> index f1f25aa794d9..0091df9dd73b 100644
> --- a/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
> @@ -74,7 +74,7 @@ properties:
>        - description: Must be 400 MHz
>  
>    port:
> -    type: object
> +    $ref: /schemas/graph.yaml#/properties/port
>      description:
>        A port node pointing to the input port of a HDMI/DP or MIPI display bridge.
>  
> diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> index 768050f30dba..2f252e8d5389 100644
> --- a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> +++ b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> @@ -39,18 +39,17 @@ properties:
>      minItems: 1
>  
>    port:
> -    description: OF graph bindings (specified in bindings/graph.txt).
> +    $ref: /schemas/graph.yaml#/properties/port
>  
>    ports:
> -    description: OF graph bindings (specified in bindings/graph.txt).
>      type: object
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
>      properties:
>        port@0:
> -        type: object
>          description: DPI output, to interface with TFT panels.
>  
>        port@8:
> -        type: object
>          description: Link to the Image Processing Unit (IPU).
>            (See ingenic,ipu.yaml).
>  
> diff --git a/Documentation/devicetree/bindings/display/intel,keembay-display.yaml b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> index 0a697d45c2ad..bc6622b010ca 100644
> --- a/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> +++ b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> @@ -36,7 +36,7 @@ properties:
>      maxItems: 1
>  
>    port:
> -    type: object
> +    $ref: /schemas/graph.yaml#/properties/port
>      description: Display output node to DSI.
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> index 6b7fddc80c41..1261b061169e 100644
> --- a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> @@ -38,6 +38,7 @@ properties:
>  
>    ports:
>      type: object
> +    $ref: /schemas/graph.yaml#/properties/ports
>      properties:
>        port@0:
>          type: object

Same comment about the type property here.

> @@ -65,6 +66,10 @@ properties:
>            - reg
>            - dual-lvds-even-pixels
>  
> +    required:
> +      - port@0
> +      - port@1
> +
>  additionalProperties: false
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index cd6dc5461721..5b38dc89cb21 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -68,16 +68,7 @@ properties:
>  
>    # Connectivity
>    port:
> -    type: object
> -
> -  ports:
> -    type: object
> -    description:
> -      Panels receive video data through one or multiple connections. While
> -      the nature of those connections is specific to the panel type, the
> -      connectivity is expressed in a standard fashion using ports as specified
> -      in the device graph bindings defined in
> -      Documentation/devicetree/bindings/graph.txt.
> +    $ref: /schemas/graph.yaml#/properties/port

This drops "ports", is it intentional ?

>  
>    ddc-i2c-bus:
>      $ref: /schemas/types.yaml#/definitions/phandle
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
> index 4110d003ce1f..524f4d786b02 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
> @@ -44,32 +44,23 @@ properties:
>  
>    ports:
>      type: object
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
>      properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> -
>        port@0:
> -        type: object
>          description:
>            Port node with two endpoints, numbered 0 and 1,
>            connected respectively to vop0 and vop1.
>  
>        port@1:
> -        type: object
>          description:
>            Port node with one endpoint connected to a hdmi-connector node.
>  
>      required:
> -      - "#address-cells"
> -      - "#size-cells"
>        - port@0
>        - port@1
>  
> -    additionalProperties: false
> +    unevaluatedProperties: false
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
> index ed8148e26e24..6f43d885c9b3 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
> @@ -70,10 +70,7 @@ properties:
>        - const: dclk
>  
>    port:
> -    type: object
> -    description:
> -      A port node with endpoint definitions as defined in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt.
> +    $ref: /schemas/graph.yaml#/properties/port
>  
>    assigned-clocks:
>      maxItems: 2
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
> index 327a14d85df8..ec0353593b22 100644
> --- a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
> @@ -52,22 +52,21 @@ properties:
>  
>    ports:
>      type: object
> -    description:
> -      A node containing DSI input & output port nodes with endpoint
> -      definitions as documented in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt
> -      Documentation/devicetree/bindings/graph.txt
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
>      properties:
>        port@0:
> -        type: object
>          description:
>            DSI input port node, connected to the ltdc rgb output port.
>  
>        port@1:
> -        type: object
>          description:
>            DSI output port node, connected to a panel or a bridge input port"
>  
> +    required:
> +      - port@0
> +      - port@1
> +
>  required:
>    - "#address-cells"
>    - "#size-cells"
> diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> index bf8ad916e9b0..c4588cd2ac7d 100644
> --- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> +++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
> @@ -36,14 +36,13 @@ properties:
>  
>    port:
>      type: object
> -    description:
> -      "Video port for DPI RGB output.
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: |
> +      Video port for DPI RGB output.
>        ltdc has one video port with up to 2 endpoints:
>        - for external dpi rgb panel or bridge, using gpios.
>        - for internal dpi input of the MIPI DSI host controller.
>        Note: These 2 endpoints cannot be activated simultaneously.
> -      Please refer to the bindings defined in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt."
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 4dc30738ee57..60ad0e8fc7c0 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -75,28 +75,18 @@ properties:
>  
>    ports:
>      type: object
> -    description:
> -      Ports as described in Documentation/devicetree/bindings/graph.txt
> -    properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
> +    properties:
>        port@0:
> -        type: object
>          description:
>            The DSS OLDI output port node form video port 1
>  
>        port@1:
> -        type: object
>          description:
>            The DSS DPI output port node from video port 2
>  
> -    required:
> -      - "#address-cells"
> -      - "#size-cells"
> +    unevaluatedProperties: false
>  
>    ti,am65x-oldi-io-ctrl:
>      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> index c9a947d55fa4..b3e0fa41180c 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> @@ -108,38 +108,26 @@ properties:
>  
>    ports:
>      type: object
> -    description:
> -      Ports as described in Documentation/devicetree/bindings/graph.txt
> -    properties:
> -      "#address-cells":
> -        const: 1
> -
> -      "#size-cells":
> -        const: 0
> +    $ref: /schemas/graph.yaml#/properties/ports
>  
> +    properties:
>        port@0:
> -        type: object
>          description:
>            The output port node form video port 1
>  
>        port@1:
> -        type: object
>          description:
>            The output port node from video port 2
>  
>        port@2:
> -        type: object
>          description:
>            The output port node from video port 3
>  
>        port@3:
> -        type: object
>          description:
>            The output port node from video port 4
>  
> -    required:
> -      - "#address-cells"
> -      - "#size-cells"
> +    unevaluatedProperties: false
>  
>    max-memory-bandwidth:
>      $ref: /schemas/types.yaml#/definitions/uint32
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> index 8f87b82c6695..74dd1ce46d00 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> @@ -55,9 +55,7 @@ properties:
>  
>    port:
>      type: object
> -    description:
> -      Port as described in Documentation/devicetree/bindings/graph.txt.
> -      The DSS DPI output port node

I think the second line of the description should be kept.

> +    $ref: /schemas/graph.yaml#/properties/port
>  
>    max-memory-bandwidth:
>      $ref: /schemas/types.yaml#/definitions/uint32

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
