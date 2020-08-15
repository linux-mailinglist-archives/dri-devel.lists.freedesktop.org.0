Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5B824517F
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 18:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181BB6E3BC;
	Sat, 15 Aug 2020 16:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5C06E3BC
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 16:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 6788EFB05;
 Sat, 15 Aug 2020 18:47:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYMbM5R8wXQP; Sat, 15 Aug 2020 18:47:37 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 4A9304576F; Sat, 15 Aug 2020 18:47:37 +0200 (CEST)
Date: Sat, 15 Aug 2020 18:47:37 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/3] dt-bindings: Add Mantix MLAF057WE51-X panel bindings
Message-ID: <20200815164737.GA3640@bogon.m.sigxcpu.org>
References: <cover.1597412076.git.agx@sigxcpu.org>
 <9345739df02b8b8630e7dccb61a80a7a7f692526.1597412076.git.agx@sigxcpu.org>
 <20200815083917.GA993113@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200815083917.GA993113@ravnborg.org>
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
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Mark Brown <broonie@kernel.org>, allen <allen.chen@ite.com.tw>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,
On Sat, Aug 15, 2020 at 10:39:17AM +0200, Sam Ravnborg wrote:
> Hi Guido.
> =

> On Fri, Aug 14, 2020 at 03:36:22PM +0200, Guido G=FCnther wrote:
> > The panel uses a Focaltech FT8006p, the touch part is handled by the
> > already existing edt-ft5x06.
> > =

> > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> =

> A few trivialities.

Thanks for having a look. One remark inline:

> =

> > ---
> >  .../display/panel/mantix,mlaf057we51-x.yaml   | 73 +++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/man=
tix,mlaf057we51-x.yaml
> > =

> > diff --git a/Documentation/devicetree/bindings/display/panel/mantix,mla=
f057we51-x.yaml b/Documentation/devicetree/bindings/display/panel/mantix,ml=
af057we51-x.yaml
> > new file mode 100644
> > index 0000000000000..349f3380ac940
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we5=
1-x.yaml
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/mantix,mlaf057we51-x.=
yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mantix MLAF057WE51-X 5.7" 720x1440 TFT LCD panel
> > +
> > +maintainers:
> > +  - Guido G=FCnther <agx@sigxcpu.org>
> > +
> > +description: |
> > +             Mantix MLAF057WE51 X is a 720x1440 TFT LCD panel
> > +             connected using a MIPI-DSI video interface.
> Indent text with two spaces only.
> And I have learned that '|' is only needed to preserve formatting - so
> it can be dropped.
> =

> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mantix,mlaf057we51-x
> This is a list - so needs an extra 2 spaces indent.
> See https://lore.kernel.org/linux-devicetree/f1963eb9-283f-e903-2a3a-4f32=
4d71d418@lucaceresoli.net/T/#m65900317fb948f6c40e8fb521f2201fba3c301a7
> for examples where Rob fixes this.

Doesn't this only apply if the 'outer element' is a list too so e.g.:

   - enum
     - foo

trips up yamllint but

   enum
     - foo

doesn't. Since yamllint was happy i kept it as is (looking at your
reference suggests that too).

All the rest made sense and i fixed that for the upcoming v2.
Thanks for having a look!
 -- Guido

> =

> > +
> > +  port: true
> > +  reg:
> > +    maxItems: 1
> > +    description: DSI virtual channel
> > +
> > +  avdd-supply:
> > +    description: Positive analog power supply
> > +
> > +  avee-supply:
> > +    description: Negative analog power supply
> > +
> > +  vddi-supply:
> > +    description: 1.8V I/O voltage supply
> > +
> > +  reset-gpios:
> > +    description: GPIO used for the reset pin
> > +    maxItems: 1
> Use reset-gpios: true as we already have it in panel-common.yaml
> =

> > +
> > +  backlight:
> > +    description: Backlight used by the panel
> > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> Use backlight from panel-common.yaml.
> =

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - avdd-supply
> > +  - avee-supply
> > +  - vddi-supply
> > +  - reset-gpios
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dsi {
> My personal preference is indent with 4 spaces in examples but there are
> no rules so feel free to ignore.
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +      panel@0 {
> > +        compatible =3D "mantix,mlaf057we51-x";
> > +        reg =3D <0>;
> > +        avdd-supply =3D <&reg_avdd>;
> > +        avee-supply =3D <&reg_avee>;
> > +        vddi-supply =3D <&reg_1v8_p>;
> > +        reset-gpios =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
> > +        backlight =3D <&backlight>;
> > +      };
> > +    };
> I think we need an ampty line here.
> > +...
> > -- =

> > 2.26.2
> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
