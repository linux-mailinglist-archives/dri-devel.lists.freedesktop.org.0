Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8346220EDD7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 07:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E700489B95;
	Tue, 30 Jun 2020 05:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC8D89B95
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 05:50:39 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 395F620021;
 Tue, 30 Jun 2020 07:50:33 +0200 (CEST)
Date: Tue, 30 Jun 2020 07:50:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv1 1/4] dt-bindings: display: panel-dsi-cm: convert to YAML
Message-ID: <20200630055031.GA361800@ravnborg.org>
References: <20200629223315.118256-1-sebastian.reichel@collabora.com>
 <20200629223315.118256-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629223315.118256-2-sebastian.reichel@collabora.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8 a=gEfo2CItAAAA:8 a=sozttTNsAAAA:8
 a=VwQbUJbxAAAA:8 a=-GQzrfIpSBUqUdyy6uIA:9 a=idcLVWj6tIseg_aj:21
 a=ou0e1Vl_XHA3j0D6:21 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=aeg5Gbbo78KNqacMgKqU:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: devicetree@vger.kernel.org, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian.

On Tue, Jun 30, 2020 at 12:33:12AM +0200, Sebastian Reichel wrote:
> Convert panel-dsi-cm bindings to YAML and add
> missing properties while at it.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thanks, one of the few panel bindings still pending.
And you added some nice explanations too, good.

Some small comments in the folllowing.

	Sam

> ---
>  .../bindings/display/panel/panel-dsi-cm.txt   |  29 -----
>  .../bindings/display/panel/panel-dsi-cm.yaml  | 100 ++++++++++++++++++
>  2 files changed, 100 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> deleted file mode 100644
> index dce48eb9db57..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Generic MIPI DSI Command Mode Panel
> -===================================
> -
> -Required properties:
> -- compatible: "panel-dsi-cm"
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
> -lcd0: display {
> -	compatible = "tpo,taal", "panel-dsi-cm";
> -	label = "lcd0";
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
> index 000000000000..8d6a20f26470
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
> @@ -0,0 +1,100 @@
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
Later port: is required which does not really match this explanation.


> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +
> +  compatible:
> +    items:
> +      - enum:
> +        - motorola,droid4-panel        # Panel from Motorola Droid4 phone
> +        - nokia,himalaya               # Panel from Nokia N950 phone
> +        - tpo,taal                     # Panel from OMAP4 SDP board
> +      - const: panel-dsi-cm            # Generic DSI command mode panel compatible fallback
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
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
> +  te-gpios: true
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
My personal preference is indent 4 spaces.
But there is no hard rule so do what you like.

> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi-controller {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      port {
> +        dsi1_out_ep: endpoint {
> +          remote-endpoint = <&lcd0_in>;
> +          lanes = <0 1 2 3 4 5>;
> +        };
> +      };
Addding the port node here does not really help me,
I was left confused about the lanes = <...> property.

> +
> +      panel@0 {
> +        compatible = "tpo,taal", "panel-dsi-cm";
> +        label = "lcd0";
This use of label does not really match the description.
The description says label shall be used for specific names and not
generic names like "lcd".

> +        reg = <0>;
> +        reset-gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
> +
> +        port {
> +          lcd0_in: endpoint {
> +            remote-endpoint = <&dsi1_out_ep>;
> +          };
> +        };
> +      };
> +
> +    };

Add:
<empty line>
...

The latter is end of statement or soething.
You see it used often bu not always.

I expect it to become mandatory the day the tools check for it.

	Sam

> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
