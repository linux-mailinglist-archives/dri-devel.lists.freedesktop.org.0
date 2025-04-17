Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7234BA91428
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 08:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2085310EA0F;
	Thu, 17 Apr 2025 06:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="PHJjEX2Z";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="biMYgslo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DFF10EA0F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 06:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1744871884; x=1776407884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0uoJATyqcQrQSMZvw44Xp0gRE9A+lcSGKNpT/0B43S8=;
 b=PHJjEX2Z9jyX6yXBgBZhNJpACTkWi11yUvWm9zynTpYkYJ0cPNztrQPn
 IKeQyWtv2jqCa3yZLgxb30+jnqVp6nlJ55fqbaYqnwC0ciZmSB0AJvYn/
 hQ8IaeGEYUT0sYTAT3ENB5hG398Emge2Qc33osRFq2X3v4JTS9vKxXMQz
 w2zpKkd0w+5h7TTEfKi7inmVP23GQTfxtPcNOnS4vgXKZXv+AKOKbNyx7
 Wcvke5cpt6B2sNYpg7rP7Hjw4yhzkbZ0A6Fn/SG3xly5WUOxcP0Zsgrm7
 IiLHmOqSQ0Avp1NAZRJ7RkITGme+IWHGY66G8MtjxwyZDC8rY3FsNSjPq w==;
X-CSE-ConnectionGUID: hqLQ5uwsTgyys5AiJv9tPA==
X-CSE-MsgGUID: iEj/ubU5TvmL4Wi3uOYGvA==
X-IronPort-AV: E=Sophos;i="6.15,218,1739833200"; d="scan'208";a="43583950"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 17 Apr 2025 08:37:59 +0200
X-CheckPoint: {6800A1C6-29-7141A0B0-E6EDEC14}
X-MAIL-CPID: 36C074C3F2A1B9B0CE2A889E02FB02E6_3
X-Control-Analysis: str=0001.0A006378.6800A1C6.0038, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50B7116169D; Thu, 17 Apr 2025 08:37:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1744871873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0uoJATyqcQrQSMZvw44Xp0gRE9A+lcSGKNpT/0B43S8=;
 b=biMYgslofK0d6rk0y53PzqwfBiViYBM2gICLIMa3h5u0Ghqtpuc95VnxPn5ZTiHQhJiUH3
 7EnblQ8k0d2Rgst1bUtjDmzR2EQqpSINcdDUugieb94ue/X2W80uvHAxPyzRJ+LZlFy33V
 LCkZieAN53FPBHCAEhsla6WFzX8Is1+drdjJIH5bjETWHPenGrdNxr0UM8iQQzuRjeKxJ/
 iLpHdm1Y6cPdVJO/gQD3lb3A2VEcyy0lc4/U2GzOk/V2Pjyozrramp0X0Yu9UPPnnUS5eV
 rSk0QPASFgGKRzJe7sHMQkQjs72W+av3SG9EeoTq17FJcIkVDlpY+ZdmiF+tAQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:DRM DRIVERS FOR FREESCALE IMX 5/6"
 <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: convert ldb.txt to yaml
 format
Date: Thu, 17 Apr 2025 08:37:49 +0200
Message-ID: <2987529.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250416211929.3502902-1-Frank.Li@nxp.com>
References: <20250416211929.3502902-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Am Mittwoch, 16. April 2025, 23:19:27 CEST schrieb Frank Li:
> Convert ldb.txt to yaml format.
>=20
> Additional changes
> - fix clock-names order to match existed dts file.
> - remove lvds-panel and iomuxc-gpr node in examples.
> - fsl,imx6q-ldb fail back to fsl,imx53-ldb.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/display/imx/fsl,imx6q-ldb.yaml   | 182 ++++++++++++++++++
>  .../devicetree/bindings/display/imx/ldb.txt   | 146 --------------
>  2 files changed, 182 insertions(+), 146 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx=
6q-ldb.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/imx/ldb.txt
>=20
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.=
yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
> new file mode 100644
> index 0000000000000..7edd5f28b1372
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6q-ldb.yaml
> @@ -0,0 +1,182 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx6q-ldb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale LVDS Display Bridge (ldb)
> +
> +description:
> +  The LVDS Display Bridge device tree node contains up to two lvds-chann=
el
> +  nodes describing each of the two LVDS encoder channels of the bridge.
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,imx53-ldb
> +      - items:
> +          - const: fsl,imx6q-ldb
> +          - const: fsl,imx53-ldb

My DT bindings foo is not that great, but I would have expected something l=
ike this:
oneOf:
  - items:
      - const: fsl,imx53-ldb
  - items:
      - enum:
          - fsl,imx6q-ldb
      - const: fsl,imx53-ldb

Best regards,
Alexander

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  gpr:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle points to the iomuxc-gpr region containing the LVDS
> +      control register.
> +
> +  clocks:
> +    minItems: 6
> +    maxItems: 8
> +
> +  clock-names:
> +    items:
> +      - const: di0_pll
> +      - const: di1_pll
> +      - const: di0_sel
> +      - const: di1_sel
> +      - const: di0
> +      - const: di1
> +      - const: di2_sel
> +      - const: di3_sel
> +    minItems: 6
> +
> +  fsl,dual-channel:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      if it exists, only LVDS channel 0 should
> +      be configured - one input will be distributed on both outputs in d=
ual
> +      channel mode
> +
> +patternProperties:
> +  '^lvds-channel@[0-1]$':
> +    type: object
> +    description:
> +      Each LVDS Channel has to contain either an of graph link to a pane=
l device node
> +      or a display-timings node that describes the video timings for the=
 connected
> +      LVDS display as well as the fsl,data-mapping and fsl,data-width pr=
operties.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      display-timings:
> +        $ref: /schemas/display/panel/display-timings.yaml#
> +
> +      fsl,data-mapping:
> +        enum:
> +          - spwg
> +          - jeida
> +
> +      fsl,data-width:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: should be <18> or <24>
> +        enum:
> +          - 18
> +          - 24
> +
> +    patternProperties:
> +      '^port@[0-4]$':
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          On i.MX5, the internal two-input-multiplexer is used. Due to h=
ardware
> +          limitations, only one input port (port@[0,1]) can be used for =
each channel
> +          (lvds-channel@[0,1], respectively).
> +          On i.MX6, there should be four input ports (port@[0-3]) that c=
orrespond
> +          to the four LVDS multiplexer inputs.
> +          A single output port (port@2 on i.MX5, port@4 on i.MX6) must b=
e connected
> +          to a panel input port. Optionally, the output port can be left=
 out if
> +          display-timings are used instead.
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - gpr
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx5-clock.h>
> +
> +    ldb@53fa8008 {
> +        compatible =3D "fsl,imx53-ldb";
> +        reg =3D <0x53fa8008 0x4>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        gpr =3D <&gpr>;
> +        clocks =3D <&clks IMX5_CLK_LDB_DI0_SEL>,
> +                 <&clks IMX5_CLK_LDB_DI1_SEL>,
> +                 <&clks IMX5_CLK_IPU_DI0_SEL>,
> +                 <&clks IMX5_CLK_IPU_DI1_SEL>,
> +                 <&clks IMX5_CLK_LDB_DI0_GATE>,
> +                 <&clks IMX5_CLK_LDB_DI1_GATE>;
> +        clock-names =3D "di0_pll", "di1_pll",
> +                      "di0_sel", "di1_sel",
> +                      "di0", "di1";
> +
> +        /* Using an of-graph endpoint link to connect the panel */
> +        lvds-channel@0 {
> +                reg =3D <0>;
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    reg =3D <0>;
> +
> +                    endpoint {
> +                        remote-endpoint =3D <&ipu_di0_lvds0>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg =3D <2>;
> +
> +                    endpoint {
> +                        remote-endpoint =3D <&panel_in>;
> +                    };
> +               };
> +        };
> +
> +        /* Using display-timings and fsl,data-mapping/width instead */
> +        lvds-channel@1 {
> +                reg =3D <1>;
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +                fsl,data-mapping =3D "spwg";
> +                fsl,data-width =3D <24>;
> +
> +                display-timings {/* ... */
> +                };
> +
> +                port@1 {
> +                     reg =3D <1>;
> +
> +                     endpoint {
> +                         remote-endpoint =3D <&ipu_di1_lvds1>;
> +                     };
> +                };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/display/imx/ldb.txt b/Docu=
mentation/devicetree/bindings/display/imx/ldb.txt
> deleted file mode 100644
> index 03653a291b549..0000000000000
> --- a/Documentation/devicetree/bindings/display/imx/ldb.txt
> +++ /dev/null
> @@ -1,146 +0,0 @@
> -Device-Tree bindings for LVDS Display Bridge (ldb)
> -
> -LVDS Display Bridge
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -The LVDS Display Bridge device tree node contains up to two lvds-channel
> -nodes describing each of the two LVDS encoder channels of the bridge.
> -
> -Required properties:
> - - #address-cells : should be <1>
> - - #size-cells : should be <0>
> - - compatible : should be "fsl,imx53-ldb" or "fsl,imx6q-ldb".
> -                Both LDB versions are similar, but i.MX6 has an addition=
al
> -                multiplexer in the front to select any of the four IPU d=
isplay
> -                interfaces as input for each LVDS channel.
> - - gpr : should be <&gpr> on i.MX53 and i.MX6q.
> -         The phandle points to the iomuxc-gpr region containing the LVDS
> -         control register.
> -- clocks, clock-names : phandles to the LDB divider and selector clocks =
and to
> -                        the display interface selector clocks, as descri=
bed in
> -                        Documentation/devicetree/bindings/clock/clock-bi=
ndings.txt
> -        The following clocks are expected on i.MX53:
> -                "di0_pll" - LDB LVDS channel 0 mux
> -                "di1_pll" - LDB LVDS channel 1 mux
> -                "di0" - LDB LVDS channel 0 gate
> -                "di1" - LDB LVDS channel 1 gate
> -                "di0_sel" - IPU1 DI0 mux
> -                "di1_sel" - IPU1 DI1 mux
> -        On i.MX6q the following additional clocks are needed:
> -                "di2_sel" - IPU2 DI0 mux
> -                "di3_sel" - IPU2 DI1 mux
> -        The needed clock numbers for each are documented in
> -        Documentation/devicetree/bindings/clock/imx5-clock.yaml, and in
> -        Documentation/devicetree/bindings/clock/imx6q-clock.yaml.
> -
> -Optional properties:
> - - pinctrl-names : should be "default" on i.MX53, not used on i.MX6q
> - - pinctrl-0 : a phandle pointing to LVDS pin settings on i.MX53,
> -               not used on i.MX6q
> - - fsl,dual-channel : boolean. if it exists, only LVDS channel 0 should
> -   be configured - one input will be distributed on both outputs in dual
> -   channel mode
> -
> -LVDS Channel
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Each LVDS Channel has to contain either an of graph link to a panel devi=
ce node
> -or a display-timings node that describes the video timings for the conne=
cted
> -LVDS display as well as the fsl,data-mapping and fsl,data-width properti=
es.
> -
> -Required properties:
> - - reg : should be <0> or <1>
> - - port: Input and output port nodes with endpoint definitions as define=
d in
> -   Documentation/devicetree/bindings/graph.txt.
> -   On i.MX5, the internal two-input-multiplexer is used. Due to hardware
> -   limitations, only one input port (port@[0,1]) can be used for each ch=
annel
> -   (lvds-channel@[0,1], respectively).
> -   On i.MX6, there should be four input ports (port@[0-3]) that correspo=
nd
> -   to the four LVDS multiplexer inputs.
> -   A single output port (port@2 on i.MX5, port@4 on i.MX6) must be conne=
cted
> -   to a panel input port. Optionally, the output port can be left out if
> -   display-timings are used instead.
> -
> -Optional properties (required if display-timings are used):
> - - display-timings : A node that describes the display timings as define=
d in
> -   Documentation/devicetree/bindings/display/panel/display-timing.txt.
> - - fsl,data-mapping : should be "spwg" or "jeida"
> -                      This describes how the color bits are laid out in =
the
> -                      serialized LVDS signal.
> - - fsl,data-width : should be <18> or <24>
> -
> -example:
> -
> -gpr: iomuxc-gpr@53fa8000 {
> -	/* ... */
> -};
> -
> -ldb: ldb@53fa8008 {
> -	#address-cells =3D <1>;
> -	#size-cells =3D <0>;
> -	compatible =3D "fsl,imx53-ldb";
> -	gpr =3D <&gpr>;
> -	clocks =3D <&clks IMX5_CLK_LDB_DI0_SEL>,
> -		 <&clks IMX5_CLK_LDB_DI1_SEL>,
> -		 <&clks IMX5_CLK_IPU_DI0_SEL>,
> -		 <&clks IMX5_CLK_IPU_DI1_SEL>,
> -		 <&clks IMX5_CLK_LDB_DI0_GATE>,
> -		 <&clks IMX5_CLK_LDB_DI1_GATE>;
> -	clock-names =3D "di0_pll", "di1_pll",
> -		      "di0_sel", "di1_sel",
> -		      "di0", "di1";
> -
> -	/* Using an of-graph endpoint link to connect the panel */
> -	lvds-channel@0 {
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -		reg =3D <0>;
> -
> -		port@0 {
> -			reg =3D <0>;
> -
> -			lvds0_in: endpoint {
> -				remote-endpoint =3D <&ipu_di0_lvds0>;
> -			};
> -		};
> -
> -		port@2 {
> -			reg =3D <2>;
> -
> -			lvds0_out: endpoint {
> -				remote-endpoint =3D <&panel_in>;
> -			};
> -		};
> -	};
> -
> -	/* Using display-timings and fsl,data-mapping/width instead */
> -	lvds-channel@1 {
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -		reg =3D <1>;
> -		fsl,data-mapping =3D "spwg";
> -		fsl,data-width =3D <24>;
> -
> -		display-timings {
> -			/* ... */
> -		};
> -
> -		port@1 {
> -			reg =3D <1>;
> -
> -			lvds1_in: endpoint {
> -				remote-endpoint =3D <&ipu_di1_lvds1>;
> -			};
> -		};
> -	};
> -};
> -
> -panel: lvds-panel {
> -	/* ... */
> -
> -	port {
> -		panel_in: endpoint {
> -			remote-endpoint =3D <&lvds0_out>;
> -		};
> -	};
> -};
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


