Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63DF40B7F4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 21:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685026E5A9;
	Tue, 14 Sep 2021 19:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBBE6E5A9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 19:23:26 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 35B0CC3D65
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 19:23:25 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7FBC3240002;
 Tue, 14 Sep 2021 19:23:01 +0000 (UTC)
Date: Tue, 14 Sep 2021 21:23:01 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee.jones@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 1/4] dt-bindings: display: Document the Xylon LogiCVC
 display controller
Message-ID: <YUD2ldi4IOrI+Wjb@aptenodytes>
References: <20201223212947.160565-1-paul.kocialkowski@bootlin.com>
 <20201223212947.160565-2-paul.kocialkowski@bootlin.com>
 <20210112151715.GA354038@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2iAkKRZEbYrnvNIT"
Content-Disposition: inline
In-Reply-To: <20210112151715.GA354038@robh.at.kernel.org>
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


--2iAkKRZEbYrnvNIT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

I just found out as I'm about to send a new revision that I had not yet
responded to your concerns here.

On Tue 12 Jan 21, 09:17, Rob Herring wrote:
> On Wed, Dec 23, 2020 at 10:29:44PM +0100, Paul Kocialkowski wrote:
> > The Xylon LogiCVC is a display controller implemented as programmable
> > logic in Xilinx FPGAs.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../display/xylon,logicvc-display.yaml        | 313 ++++++++++++++++++
> >  1 file changed, 313 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/xylon,log=
icvc-display.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/xylon,logicvc-di=
splay.yaml b/Documentation/devicetree/bindings/display/xylon,logicvc-displa=
y.yaml
> > new file mode 100644
> > index 000000000000..aca78334ad2c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/xylon,logicvc-display.y=
aml
> > @@ -0,0 +1,313 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright 2019 Bootlin
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/display/xylon,logicvc-display.yaml=
#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Xylon LogiCVC display controller
> > +
> > +maintainers:
> > +  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > +
> > +description: |
> > +  The Xylon LogiCVC is a display controller that supports multiple lay=
ers.
> > +  It is usually implemented as programmable logic and was optimized fo=
r use
> > +  with Xilinx Zynq-7000 SoCs and Xilinx FPGAs.
> > +
> > +  Because the controller is intended for use in a FPGA, most of the
> > +  configuration of the controller takes place at logic configuration b=
itstream
> > +  synthesis time. As a result, many of the device-tree bindings are me=
ant to
> > +  reflect the synthesis configuration and must not be configured diffe=
rently.
> > +  Matching synthesis parameters are provided when applicable.
> > +
> > +  Layers are declared in the "layers" sub-node and have dedicated conf=
iguration.
> > +  In version 3 of the controller, each layer has fixed memory offset a=
nd address
> > +  starting from the video memory base address for its framebuffer. In =
version 4,
> > +  framebuffers are configured with a direct memory address instead.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - xylon,logicvc-3.02.a-display
> > +      - xylon,logicvc-4.01.a-display
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 4
> > +    items:
> > +      # vclk is required and must be provided as first item.
> > +      - const: vclk
> > +      # Other clocks are optional and can be provided in any order.
> > +      - enum:
> > +          - vclk2
> > +          - lvdsclk
> > +          - lvdsclkn
> > +      - enum:
> > +          - vclk2
> > +          - lvdsclk
> > +          - lvdsclkn
> > +      - enum:
> > +          - vclk2
> > +          - lvdsclk
> > +          - lvdsclkn
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  memory-region:
> > +    maxItems: 1
> > +
> > +  xylon,display-interface:
> > +    enum:
> > +      # Parallel RGB interface (C_DISPLAY_INTERFACE =3D=3D 0)
> > +      - parallel-rgb
> > +      # ITU-T BR656 interface (C_DISPLAY_INTERFACE =3D=3D 1)
> > +      - bt656
> > +      # 4-bit LVDS interface (C_DISPLAY_INTERFACE =3D=3D 2)
> > +      - lvds-4bits
> > +      # 3-bit LVDS interface (C_DISPLAY_INTERFACE =3D=3D 4)
> > +      - lvds-3bits
> > +      # DVI interface (C_DISPLAY_INTERFACE =3D=3D 5)
> > +      - dvi
> > +    description: Display output interface (C_DISPLAY_INTERFACE).
>=20
> As I mentioned before, we have standard properties for these or you know=
=20
> the setting based on the panel/bridge attached.=20

The point here is to indicate how the bitstream was configured and not
to indicate what some run-time configuration should be. The bottomline
is to let the driver have knowledge of the bitstream configuration,
like it's done for the other properties.

This could typically be used by the driver to check if a connected panel/br=
idge
is compatible or not with the bitstream configuration.

As a result, it doesn't reflect the general "bus configuration" for which
we may have a generic property, but a bitstream configuration property that
is specific to our hardware. Hence why I think it makes sense to have it
described that way.

> > +
> > +  xylon,display-colorspace:
> > +    enum:
> > +      # RGB colorspace (C_DISPLAY_COLOR_SPACE =3D=3D 0)
> > +      - rgb
> > +      # YUV 4:2:2 colorspace (C_DISPLAY_COLOR_SPACE =3D=3D 1)
> > +      - yuv422
> > +      # YUV 4:4:4 colorspace (C_DISPLAY_COLOR_SPACE =3D=3D 2)
> > +      - yuv444
> > +    description: Display output colorspace (C_DISPLAY_COLOR_SPACE).
> > +
> > +  xylon,display-depth:
> > +    $ref: "/schemas/types.yaml#/definitions/uint32"
> > +    description: Display output depth (C_PIXEL_DATA_WIDTH).
> > +
> > +  xylon,row-stride:
> > +    $ref: "/schemas/types.yaml#/definitions/uint32"
> > +    description: Fixed number of pixels in a framebuffer row (C_ROW_ST=
RIDE).
> > +
> > +  xylon,syscon:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      Syscon phandle representing the top-level logicvc instance, usef=
ul when
> > +      the parent node is not the top-level logicvc instance.
>=20
> Why do you need to support both ways? Drop this and require it to be the=
=20
> parent node.

Fair enough, I guess I had seen similar things around but there's no real
use-case as far as I know.

> > +
> > +  xylon,dithering:
> > +    $ref: "/schemas/types.yaml#/definitions/flag"
> > +    description: Dithering module is enabled (C_XCOLOR)
> > +
> > +  xylon,background-layer:
> > +    $ref: "/schemas/types.yaml#/definitions/flag"
> > +    description: |
> > +      The last layer is used to display a black background (C_USE_BACK=
GROUND).
> > +      The layer must still be registered.
> > +
> > +  xylon,layers-configurable:
> > +    $ref: "/schemas/types.yaml#/definitions/flag"
> > +    description: |
> > +      Configuration of layers' size, position and offset is enabled
> > +      (C_USE_SIZE_POSITION).
> > +
> > +  layers:
> > +    type: object
> > +
> > +    properties:
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^layer@[0-9]+$":
> > +        type: object
> > +
> > +        properties:
> > +          reg:
> > +            maxItems: 1
> > +
> > +          xylon,layer-depth:
> > +            $ref: "/schemas/types.yaml#/definitions/uint32"
> > +            description: Layer depth (C_LAYER_X_DATA_WIDTH).
> > +
> > +          xylon,layer-colorspace:
> > +            enum:
> > +              # RGB colorspace (C_LAYER_X_TYPE =3D=3D 0)
> > +              - rgb
> > +              # YUV packed colorspace (C_LAYER_X_TYPE =3D=3D 0)
> > +              - yuv
> > +            description: Layer colorspace (C_LAYER_X_TYPE).
> > +
> > +          xylon,layer-alpha-mode:
> > +            enum:
> > +              # Alpha is configured layer-wide (C_LAYER_X_ALPHA_MODE =
=3D=3D 0)
> > +              - layer
> > +              # Alpha is configured per-pixel (C_LAYER_X_ALPHA_MODE =
=3D=3D 1)
> > +              - pixel
> > +            description: Alpha mode for the layer (C_LAYER_X_ALPHA_MOD=
E).
> > +
> > +          xylon,layer-base-offset:
> > +            $ref: "/schemas/types.yaml#/definitions/uint32"
> > +            description: |
> > +              Offset in number of lines (C_LAYER_X_OFFSET) starting fr=
om the
> > +              video RAM base (C_VMEM_BASEADDR), only for version 3.
> > +
> > +          xylon,layer-buffer-offset:
> > +            $ref: "/schemas/types.yaml#/definitions/uint32"
> > +            description: |
> > +              Offset in number of lines (C_BUFFER_*_OFFSET) starting f=
rom the
> > +              layer base offset for the second buffer used in double-b=
uffering.
> > +
> > +          xylon,layer-primary:
> > +            $ref: "/schemas/types.yaml#/definitions/flag"
> > +            description: |
> > +              Layer should be registered as a primary plane (exactly o=
ne is
> > +              required).
> > +
> > +        additionalProperties: false
> > +
> > +        required:
> > +          - reg
> > +          - xylon,layer-depth
> > +          - xylon,layer-colorspace
> > +          - xylon,layer-alpha-mode
> > +
> > +    required:
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - layer@0
> > +
> > +    additionalProperties: false
> > +
> > +    description: |
> > +      The description of the display controller layers, containing lay=
er
> > +      sub-nodes that each describe a registered layer.
> > +
> > +  ports:
> > +    type: object
>=20
> You have to define what each port is. If only 1, then use just 'port'.
>=20
> We now have graph.yaml (in dt-schema). You need to reference that here.=
=20
> See drm-misc-next as everything has been converted.

I will definitely switch to a single port and describe its purpose.

Thanks!

Paul

> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - xylon,display-interface
> > +  - xylon,display-colorspace
> > +  - xylon,display-depth
> > +  - xylon,row-stride
> > +  - layers
> > +  - ports
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    logicvc: logicvc@43c00000 {
> > +      compatible =3D "xylon,logicvc-3.02.a", "syscon", "simple-mfd";
> > +      reg =3D <0x43c00000 0x6000>;
> > +
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <1>;
> > +
> > +      logicvc_display: display@0 {
> > +        compatible =3D "xylon,logicvc-3.02.a-display";
> > +        reg =3D <0x0 0x6000>;
> > +
> > +        memory-region =3D <&logicvc_cma>;
> > +
> > +        clocks =3D <&logicvc_vclk 0>, <&logicvc_lvdsclk 0>;
> > +        clock-names =3D "vclk", "lvdsclk";
> > +
> > +        interrupt-parent =3D <&intc>;
> > +        interrupts =3D <0 34 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +        xylon,display-interface =3D "lvds-4bits";
> > +        xylon,display-colorspace =3D "rgb";
> > +        xylon,display-depth =3D <16>;
> > +        xylon,row-stride =3D <1024>;
> > +
> > +        xylon,layers-configurable;
> > +
> > +        layers {
> > +          #address-cells =3D <1>;
> > +          #size-cells =3D <0>;
> > +
> > +          layer@0 {
> > +            reg =3D <0>;
> > +            xylon,layer-depth =3D <16>;
> > +            xylon,layer-colorspace =3D "rgb";
> > +            xylon,layer-alpha-mode =3D "layer";
> > +            xylon,layer-base-offset =3D <0>;
> > +            xylon,layer-buffer-offset =3D <480>;
> > +            xylon,layer-primary;
> > +          };
> > +
> > +          layer@1 {
> > +            reg =3D <1>;
> > +            xylon,layer-depth =3D <16>;
> > +            xylon,layer-colorspace =3D "rgb";
> > +            xylon,layer-alpha-mode =3D "layer";
> > +            xylon,layer-base-offset =3D <2400>;
> > +            xylon,layer-buffer-offset =3D <480>;
> > +          };
> > +
> > +          layer@2 {
> > +            reg =3D <2>;
> > +            xylon,layer-depth =3D <16>;
> > +            xylon,layer-colorspace =3D "rgb";
> > +            xylon,layer-alpha-mode =3D "layer";
> > +            xylon,layer-base-offset =3D <960>;
> > +            xylon,layer-buffer-offset =3D <480>;
> > +          };
> > +
> > +          layer@3 {
> > +            reg =3D <3>;
> > +            xylon,layer-depth =3D <16>;
> > +            xylon,layer-colorspace =3D "rgb";
> > +            xylon,layer-alpha-mode =3D "layer";
> > +            xylon,layer-base-offset =3D <480>;
> > +            xylon,layer-buffer-offset =3D <480>;
> > +          };
> > +
> > +          layer@4 {
> > +            reg =3D <4>;
> > +            xylon,layer-depth =3D <16>;
> > +            xylon,layer-colorspace =3D "rgb";
> > +            xylon,layer-alpha-mode =3D "layer";
> > +            xylon,layer-base-offset =3D <8192>;
> > +            xylon,layer-buffer-offset =3D <480>;
> > +          };
> > +        };
> > +
> > +        ports {
> > +          #address-cells =3D <1>;
> > +          #size-cells =3D <0>;
> > +
> > +          logicvc_out: port@1 {
> > +            reg =3D <1>;
> > +
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            logicvc_output: endpoint@0 {
> > +              reg =3D <0>;
> > +              remote-endpoint =3D <&panel_input>;
> > +            };
> > +          };
> > +        };
> > +      };
> > +    };
> > --=20
> > 2.29.2
> >=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--2iAkKRZEbYrnvNIT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmFA9pUACgkQ3cLmz3+f
v9Em+Af/W0JMmOr2yGSH6UssUF12OAAIb3VgVllKrag7DY4/AxE+zFErDlQoxu1/
sKfhdc5mPHjB5WSa4ijUuzjGSQs/klnrJnEpA8G70MRceOCI1f4XHX59VAZExx8e
CgbYeFriYKtZOIO6It1dKeumc/rQY1Wg8DV+XKj1SY4oDTX8ObmzgqQrKKSIdj1A
9UQmAycRA2MGOAZzDtz18o1J2UG0teXzUnP2GxIF6KdcB5bPhLWrK36+mJ+zoUuy
G/fR+O9w+ZC8ma3KTA7JdutQSTmpiqU5bD37pbYwi2UgBi8fntWRxiIvXe0yOT9V
wAwS6HIm4JJTRPbMx8/TXQcACCpYsg==
=hfQQ
-----END PGP SIGNATURE-----

--2iAkKRZEbYrnvNIT--
