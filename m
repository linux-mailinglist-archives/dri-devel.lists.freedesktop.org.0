Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B20F121120B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 19:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72C56E991;
	Wed,  1 Jul 2020 17:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163456E991
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 17:36:02 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0D60980575;
 Wed,  1 Jul 2020 19:36:00 +0200 (CEST)
Date: Wed, 1 Jul 2020 19:35:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display: Convert connectors to DT schema
Message-ID: <20200701173558.GA1106008@ravnborg.org>
References: <20200630200216.1172566-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630200216.1172566-1-robh@kernel.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=P1BnusSwAAAA:8 a=VwQbUJbxAAAA:8
 a=gEfo2CItAAAA:8 a=v9MTcrhFrrVzZmTFnlcA:9 a=mZ8UhpUad26fvTgo:21
 a=b3PhPxD7qVPbVGwQ:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=D0XLA9XvdZm18NrgonBM:22 a=AjGcO6oz07-iQ99wixmX:22
 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob

On Tue, Jun 30, 2020 at 02:02:16PM -0600, Rob Herring wrote:
> Convert the analog TV, DVI, HDMI, and VGA connector bindings to DT schema
> format.
> 
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> v2:
> - Make Laurent maintainer
> - Add missing port and compatible required
> - Drop copy-n-paste 'type' from dvi-connector
> - Use 4 space indent on examples
I assume you take this via the DT tree.

	Sam
> ---
>  .../display/connector/analog-tv-connector.txt | 31 --------
>  .../connector/analog-tv-connector.yaml        | 52 ++++++++++++++
>  .../display/connector/dvi-connector.txt       | 36 ----------
>  .../display/connector/dvi-connector.yaml      | 70 +++++++++++++++++++
>  .../display/connector/hdmi-connector.txt      | 31 --------
>  .../display/connector/hdmi-connector.yaml     | 64 +++++++++++++++++
>  .../display/connector/vga-connector.txt       | 36 ----------
>  .../display/connector/vga-connector.yaml      | 46 ++++++++++++
>  8 files changed, 232 insertions(+), 134 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
>  create mode 100644 Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/connector/dvi-connector.txt
>  create mode 100644 Documentation/devicetree/bindings/display/connector/dvi-connector.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/connector/hdmi-connector.txt
>  create mode 100644 Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/connector/vga-connector.txt
>  create mode 100644 Documentation/devicetree/bindings/display/connector/vga-connector.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> deleted file mode 100644
> index 883bcb2604c7..000000000000
> --- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -Analog TV Connector
> -===================
> -
> -Required properties:
> -- compatible: "composite-video-connector" or "svideo-connector"
> -
> -Optional properties:
> -- label: a symbolic name for the connector
> -- sdtv-standards: limit the supported TV standards on a connector to the given
> -                  ones. If not specified all TV standards are allowed.
> -                  Possible TV standards are defined in
> -                  include/dt-bindings/display/sdtv-standards.h.
> -
> -Required nodes:
> -- Video port for TV input
> -
> -Example
> --------
> -#include <dt-bindings/display/sdtv-standards.h>
> -
> -tv: connector {
> -	compatible = "composite-video-connector";
> -	label = "tv";
> -	sdtv-standards = <(SDTV_STD_PAL | SDTV_STD_NTSC)>;
> -
> -	port {
> -		tv_connector_in: endpoint {
> -			remote-endpoint = <&venc_out>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
> new file mode 100644
> index 000000000000..eebe88fed999
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/connector/analog-tv-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog TV Connector
> +
> +maintainers:
> +  - Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - composite-video-connector
> +      - svideo-connector
> +
> +  label: true
> +
> +  sdtv-standards:
> +    description:
> +      Limit the supported TV standards on a connector to the given ones. If
> +      not specified all TV standards are allowed. Possible TV standards are
> +      defined in include/dt-bindings/display/sdtv-standards.h.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  port:
> +    description: Connection to controller providing analog TV signals
> +
> +required:
> +  - compatible
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/display/sdtv-standards.h>
> +
> +    connector {
> +        compatible = "composite-video-connector";
> +        label = "tv";
> +        sdtv-standards = <(SDTV_STD_PAL | SDTV_STD_NTSC)>;
> +
> +        port {
> +            tv_connector_in: endpoint {
> +                remote-endpoint = <&venc_out>;
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/display/connector/dvi-connector.txt b/Documentation/devicetree/bindings/display/connector/dvi-connector.txt
> deleted file mode 100644
> index 207e42e9eba0..000000000000
> --- a/Documentation/devicetree/bindings/display/connector/dvi-connector.txt
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -DVI Connector
> -==============
> -
> -Required properties:
> -- compatible: "dvi-connector"
> -
> -Optional properties:
> -- label: a symbolic name for the connector
> -- ddc-i2c-bus: phandle to the i2c bus that is connected to DVI DDC
> -- analog: the connector has DVI analog pins
> -- digital: the connector has DVI digital pins
> -- dual-link: the connector has pins for DVI dual-link
> -- hpd-gpios: HPD GPIO number
> -
> -Required nodes:
> -- Video port for DVI input
> -
> -Note: One (or both) of 'analog' or 'digital' must be set.
> -
> -Example
> --------
> -
> -dvi0: connector@0 {
> -	compatible = "dvi-connector";
> -	label = "dvi";
> -
> -	digital;
> -
> -	ddc-i2c-bus = <&i2c3>;
> -
> -	port {
> -		dvi_connector_in: endpoint {
> -			remote-endpoint = <&tfp410_out>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml b/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml
> new file mode 100644
> index 000000000000..71cb9220fa59
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/connector/dvi-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DVI Connector
> +
> +maintainers:
> +  - Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> +
> +properties:
> +  compatible:
> +    const: dvi-connector
> +
> +  label: true
> +
> +  hpd-gpios:
> +    description: A GPIO line connected to HPD
> +    maxItems: 1
> +
> +  ddc-i2c-bus:
> +    description: phandle link to the I2C controller used for DDC EDID probing
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  analog:
> +    type: boolean
> +    description: the connector has DVI analog pins
> +
> +  digital:
> +    type: boolean
> +    description: the connector has DVI digital pins
> +
> +  dual-link:
> +    type: boolean
> +    description: the connector has pins for DVI dual-link
> +
> +  port:
> +    description: Connection to controller providing DVI signals
> +
> +required:
> +  - compatible
> +  - port
> +
> +anyOf:
> +  - required:
> +      - analog
> +  - required:
> +      - digital
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    connector {
> +        compatible = "dvi-connector";
> +        label = "dvi";
> +
> +        digital;
> +
> +        ddc-i2c-bus = <&i2c3>;
> +
> +        port {
> +            dvi_connector_in: endpoint {
> +                remote-endpoint = <&tfp410_out>;
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/display/connector/hdmi-connector.txt b/Documentation/devicetree/bindings/display/connector/hdmi-connector.txt
> deleted file mode 100644
> index aeb07c4bd703..000000000000
> --- a/Documentation/devicetree/bindings/display/connector/hdmi-connector.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -HDMI Connector
> -==============
> -
> -Required properties:
> -- compatible: "hdmi-connector"
> -- type: the HDMI connector type: "a", "b", "c", "d" or "e"
> -
> -Optional properties:
> -- label: a symbolic name for the connector
> -- hpd-gpios: HPD GPIO number
> -- ddc-i2c-bus: phandle link to the I2C controller used for DDC EDID probing
> -- ddc-en-gpios: signal to enable DDC bus
> -
> -Required nodes:
> -- Video port for HDMI input
> -
> -Example
> --------
> -
> -hdmi0: connector@1 {
> -	compatible = "hdmi-connector";
> -	label = "hdmi";
> -
> -	type = "a";
> -
> -	port {
> -		hdmi_connector_in: endpoint {
> -			remote-endpoint = <&tpd12s015_out>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
> new file mode 100644
> index 000000000000..14d7128af592
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/connector/hdmi-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: HDMI Connector
> +
> +maintainers:
> +  - Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> +
> +properties:
> +  compatible:
> +    const: hdmi-connector
> +
> +  type:
> +    description: The HDMI connector type
> +    enum:
> +      - a   # Standard full size
> +      - b   # Never deployed?
> +      - c   # Mini
> +      - d   # Micro
> +      - e   # automotive
> +
> +  label: true
> +
> +  hpd-gpios:
> +    description: A GPIO line connected to HPD
> +    maxItems: 1
> +
> +  ddc-i2c-bus:
> +    description: phandle link to the I2C controller used for DDC EDID probing
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  ddc-en-gpios:
> +    description: GPIO signal to enable DDC bus
> +    maxItems: 1
> +
> +  port:
> +    description: Connection to controller providing HDMI signals
> +
> +required:
> +  - compatible
> +  - port
> +  - type
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    connector {
> +        compatible = "hdmi-connector";
> +        label = "hdmi";
> +
> +        type = "a";
> +
> +        port {
> +            hdmi_connector_in: endpoint {
> +                remote-endpoint = <&tpd12s015_out>;
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/display/connector/vga-connector.txt b/Documentation/devicetree/bindings/display/connector/vga-connector.txt
> deleted file mode 100644
> index c727f298e7ad..000000000000
> --- a/Documentation/devicetree/bindings/display/connector/vga-connector.txt
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -VGA Connector
> -=============
> -
> -Required properties:
> -
> -- compatible: "vga-connector"
> -
> -Optional properties:
> -
> -- label: a symbolic name for the connector corresponding to a hardware label
> -- ddc-i2c-bus: phandle to the I2C bus that is connected to VGA DDC
> -
> -Required nodes:
> -
> -The VGA connector internal connections are modeled using the OF graph bindings
> -specified in Documentation/devicetree/bindings/graph.txt.
> -
> -The VGA connector has a single port that must be connected to a video source
> -port.
> -
> -
> -Example
> --------
> -
> -vga0: connector@0 {
> -	compatible = "vga-connector";
> -	label = "vga";
> -
> -	ddc-i2c-bus = <&i2c3>;
> -
> -	port {
> -		vga_connector_in: endpoint {
> -			remote-endpoint = <&adv7123_out>;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/connector/vga-connector.yaml b/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
> new file mode 100644
> index 000000000000..5782c4bb3252
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/connector/vga-connector.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/connector/vga-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: VGA Connector
> +
> +maintainers:
> +  - Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> +
> +properties:
> +  compatible:
> +    const: vga-connector
> +
> +  label: true
> +
> +  ddc-i2c-bus:
> +    description: phandle link to the I2C controller used for DDC EDID probing
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  port:
> +    description: Connection to controller providing VGA signals
> +
> +required:
> +  - compatible
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    connector {
> +        compatible = "vga-connector";
> +        label = "vga";
> +
> +        ddc-i2c-bus = <&i2c3>;
> +
> +        port {
> +            vga_connector_in: endpoint {
> +                remote-endpoint = <&adv7123_out>;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
