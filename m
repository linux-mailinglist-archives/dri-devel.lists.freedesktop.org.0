Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3013C172981
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 21:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9106E0D1;
	Thu, 27 Feb 2020 20:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC296E0D1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 20:35:27 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B126920031;
 Thu, 27 Feb 2020 21:35:22 +0100 (CET)
Date: Thu, 27 Feb 2020 21:35:21 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv2 57/56] dt-bindings: display: panel-dsi-cm: convert to
 YAML
Message-ID: <20200227203521.GC27592@ravnborg.org>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200225115341.3558245-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225115341.3558245-1-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=U1h6ImBIMqCLHhaAV2QA:9 a=GY7t_A-vK1nk_CmV:21
 a=ECjuDdCVLqgy28Y1:21 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=aeg5Gbbo78KNqacMgKqU:22
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian.

On Tue, Feb 25, 2020 at 12:53:41PM +0100, Sebastian Reichel wrote:
> Convert panel-dsi-cm bindings to YAML and add
> missing properties while at it.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

As saind in previous mail - I prefer to convert ann then patch.
But end result is the same so OK.

> ---
>  .../bindings/display/panel/panel-dsi-cm.txt   | 31 ------
>  .../bindings/display/panel/panel-dsi-cm.yaml  | 97 +++++++++++++++++++
>  2 files changed, 97 insertions(+), 31 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> deleted file mode 100644
> index f92d5c9adfc5..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Generic MIPI DSI Command Mode Panel
> -===================================
> -
> -Required properties:
> -- compatible: "panel-dsi-cm"
> -- reg: DSI channel number
> -
> -Optional properties:
> -- label: a symbolic name for the panel
> -- reset-gpios: panel reset gpio
> -- te-gpios: panel TE gpio
> -
> -Required nodes:
> -- Video port for DSI input
> -
> -Example
> --------
> -
> -lcd0: panel@0 {
> -	compatible = "tpo,taal", "panel-dsi-cm";
> -	label = "lcd0";
> -	reg = <0>;
> -
> -	reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
> -
> -	port {
> -		lcd0_in: endpoint {
> -			remote-endpoint = <&dsi1_out_ep>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
> new file mode 100644
> index 000000000000..ca61171ae145
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-dsi-cm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DSI command mode panels
> +
> +maintainers:
> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> +  - Sebastian Reichel <sre@kernel.org>
> +
> +description: |
> +  This binding file is a collection of the DSI panels that
> +  are usually driven in command mode. If no backlight is
> +  referenced via the optional backlight property, the DSI
> +  panel is assumed to have native backlight support.
> +  The panel may use an OF graph binding for the association
> +  to the display, or it may be a direct child node of the
> +  display.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +
> +  compatible:
> +    enum:
> +      # compatible must be listed in alphabetical order, ordered by compatible.
> +      # The description in the comment is mandatory for each compatible.
> +      - motorola,droid4-panel, panel-dsi-cm
> +      - nokia,himalaya, panel-dsi-cm
> +      - tpo,taal, panel-dsi-cm
Please consider to use the following syntax (from memory - may require
an enum:):

  compatible:
    description:
      Shall contain a panel specific compatible and "panel-dsi-cm"
      in that order.
    items:
      - oneOf:
          # Maybe add a short description of this panel
        - motorola,droid4-panel
          # Maybe add a short description of this panel
	- nokia,himalaya
          # Maybe add a short description of this panel
	- tpo,taal

      - const: panel-dsi-cm

Then panel-dsi-cm is always specified as a second mandatory compatible.



> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  te-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for a GPIO connected to the panel TE (tearing event) signal.
> +      The GPIO informs the system, that data should be sent to the display
> +      on rising edges of the GPIO to avoid (or reduce) tearing effects.
> +      Falling edge can be supported by inverting the GPIO specifier polarity
> +      flag.
te-gpios is used by several panels.
Please add it to panel-common with your nice description.

With the above addressed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>


	Sam

> +
> +  vddi-supply:
> +    description:
> +      Display panels require power to be supplied. While several panels need
> +      more than one power supply with panel-specific constraints governing the
> +      order and timings of the power supplies, in many cases a single power
> +      supply is sufficient, either because the panel has a single power rail, or
> +      because all its power rails can be driven by the same supply. In that case
> +      the vddi-supply property specifies the supply powering the panel as a
> +      phandle to a regulator.
> +
> +  vpnl-supply:
> +    description:
> +      When the display panel needs a second power supply, this property can be
> +      used in addition to vddi-supply. Both supplies will be enabled at the
> +      same time before the panel is being accessed.
> +
> +  width-mm: true
> +  height-mm: true
> +  label: true
> +  rotation: true
> +  panel-timing: true
> +  port: true
> +  reset-gpios: true
> +  backlight: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - port
> +  - reg
> +
> +examples:
> +  - |
> +    dsi1@12345678 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      panel@0 {
> +        compatible = "tpo,taal", "panel-dsi-cm";
> +        label = "lcd0";
> +        reg = <0>;
> +        reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
> +
> +        port {
> +          panel: endpoint {
> +            remote-endpoint = <&dsi1_out_ep>;
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.25.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
