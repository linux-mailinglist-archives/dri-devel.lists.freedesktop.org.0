Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 779312451D4
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 23:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A156E0A1;
	Sat, 15 Aug 2020 21:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F1A6E0A1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 21:08:10 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1EC0D8053D;
 Sat, 15 Aug 2020 23:08:03 +0200 (CEST)
Date: Sat, 15 Aug 2020 23:08:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 2/3] dt-bindings: Add Mantix MLAF057WE51-X panel bindings
Message-ID: <20200815210802.GA1242831@ravnborg.org>
References: <cover.1597412076.git.agx@sigxcpu.org>
 <9345739df02b8b8630e7dccb61a80a7a7f692526.1597412076.git.agx@sigxcpu.org>
 <20200815083917.GA993113@ravnborg.org>
 <20200815164737.GA3640@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200815164737.GA3640@bogon.m.sigxcpu.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=ze386MxoAAAA:8 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8
 a=6yzhs6WGAAAA:8 a=e5mUnYsNAAAA:8 a=XmuwC6Cl6KIseVqJuPgA:9
 a=wPNLvfGTeEIA:10 a=iBZjaW-pnkserzjvUTHh:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=AjGcO6oz07-iQ99wixmX:22 a=j5F3_G_i7ziBYwdlbqZG:22
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

Hi Guido.

On Sat, Aug 15, 2020 at 06:47:37PM +0200, Guido G=FCnther wrote:
> Hi Sam,
> On Sat, Aug 15, 2020 at 10:39:17AM +0200, Sam Ravnborg wrote:
> > Hi Guido.
> > =

> > On Fri, Aug 14, 2020 at 03:36:22PM +0200, Guido G=FCnther wrote:
> > > The panel uses a Focaltech FT8006p, the touch part is handled by the
> > > already existing edt-ft5x06.
> > > =

> > > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> > =

> > A few trivialities.
> =

> Thanks for having a look. One remark inline:
> =

> > =

> > > ---
> > >  .../display/panel/mantix,mlaf057we51-x.yaml   | 73 +++++++++++++++++=
++
> > >  1 file changed, 73 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/panel/m=
antix,mlaf057we51-x.yaml
> > > =

> > > diff --git a/Documentation/devicetree/bindings/display/panel/mantix,m=
laf057we51-x.yaml b/Documentation/devicetree/bindings/display/panel/mantix,=
mlaf057we51-x.yaml
> > > new file mode 100644
> > > index 0000000000000..349f3380ac940
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/mantix,mlaf057w=
e51-x.yaml
> > > @@ -0,0 +1,73 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/mantix,mlaf057we51-=
x.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Mantix MLAF057WE51-X 5.7" 720x1440 TFT LCD panel
> > > +
> > > +maintainers:
> > > +  - Guido G=FCnther <agx@sigxcpu.org>
> > > +
> > > +description: |
> > > +             Mantix MLAF057WE51 X is a 720x1440 TFT LCD panel
> > > +             connected using a MIPI-DSI video interface.
> > Indent text with two spaces only.
> > And I have learned that '|' is only needed to preserve formatting - so
> > it can be dropped.
> > =

> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mantix,mlaf057we51-x
> > This is a list - so needs an extra 2 spaces indent.
> > See https://lore.kernel.org/linux-devicetree/f1963eb9-283f-e903-2a3a-4f=
324d71d418@lucaceresoli.net/T/#m65900317fb948f6c40e8fb521f2201fba3c301a7
> > for examples where Rob fixes this.
> =

> Doesn't this only apply if the 'outer element' is a list too so e.g.:
> =

>    - enum
>      - foo
> =

> trips up yamllint but
> =

>    enum
>      - foo
> =

> doesn't. Since yamllint was happy i kept it as is (looking at your
> reference suggests that too).

You are right, I missed that this was not a list (no '-' in front of
enum).
I would not be able to do this right without tool assistance.

	Sam

> =

> All the rest made sense and i fixed that for the upcoming v2.
> Thanks for having a look!
>  -- Guido
> =

> > =

> > > +
> > > +  port: true
> > > +  reg:
> > > +    maxItems: 1
> > > +    description: DSI virtual channel
> > > +
> > > +  avdd-supply:
> > > +    description: Positive analog power supply
> > > +
> > > +  avee-supply:
> > > +    description: Negative analog power supply
> > > +
> > > +  vddi-supply:
> > > +    description: 1.8V I/O voltage supply
> > > +
> > > +  reset-gpios:
> > > +    description: GPIO used for the reset pin
> > > +    maxItems: 1
> > Use reset-gpios: true as we already have it in panel-common.yaml
> > =

> > > +
> > > +  backlight:
> > > +    description: Backlight used by the panel
> > > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> > Use backlight from panel-common.yaml.
> > =

> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - avdd-supply
> > > +  - avee-supply
> > > +  - vddi-supply
> > > +  - reset-gpios
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    dsi {
> > My personal preference is indent with 4 spaces in examples but there are
> > no rules so feel free to ignore.
> > > +      #address-cells =3D <1>;
> > > +      #size-cells =3D <0>;
> > > +      panel@0 {
> > > +        compatible =3D "mantix,mlaf057we51-x";
> > > +        reg =3D <0>;
> > > +        avdd-supply =3D <&reg_avdd>;
> > > +        avee-supply =3D <&reg_avee>;
> > > +        vddi-supply =3D <&reg_1v8_p>;
> > > +        reset-gpios =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
> > > +        backlight =3D <&backlight>;
> > > +      };
> > > +    };
> > I think we need an ampty line here.
> > > +...
> > > -- =

> > > 2.26.2
> > > =

> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
