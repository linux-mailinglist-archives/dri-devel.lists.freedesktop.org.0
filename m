Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE22C222AA2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 20:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB9A6ECB7;
	Thu, 16 Jul 2020 18:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFCC6ECB7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 18:07:12 +0000 (UTC)
Received: from earth.universe (dyndsl-095-033-172-209.ewe-ip-backbone.de
 [95.33.172.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3F8A2070E;
 Thu, 16 Jul 2020 18:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594922831;
 bh=HlSaSCiEPNOBTSTBuAMOcLv7ffieEP5NgVQyzwP20Ac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mjVECEpSB2yxv9DKO7aACQ0pHBLNljhbrS6vKrmslrHHE8ODmKsqCqbNr4JpwFs8k
 n6po3ACtQnLAxWuVts1SgT0MMS0xjlzBvY/ymjMJdC2w8Bgcg62o54CCdcVYoEfMht
 qjt+KOwImQGQp0hTgVjWRIvpgyllWpjqlWHoJO84=
Received: by earth.universe (Postfix, from userid 1000)
 id 350E93C08CE; Thu, 16 Jul 2020 20:07:10 +0200 (CEST)
Date: Thu, 16 Jul 2020 20:07:10 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCHv2 1/4] dt-bindings: display: panel-dsi-cm: convert to YAML
Message-ID: <20200716180710.u6pqe6fvn4usuidf@earth.universe>
References: <20200716125733.83654-1-sebastian.reichel@collabora.com>
 <20200716125733.83654-2-sebastian.reichel@collabora.com>
 <20200716175258.GE2235355@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200716175258.GE2235355@ravnborg.org>
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
 Rob Herring <robh+dt@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, linux-omap@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1803017608=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1803017608==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cl2alezg7yxsq6tn"
Content-Disposition: inline


--cl2alezg7yxsq6tn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 16, 2020 at 07:52:58PM +0200, Sam Ravnborg wrote:
> On Thu, Jul 16, 2020 at 02:57:30PM +0200, Sebastian Reichel wrote:
> > Convert panel-dsi-cm bindings to YAML and add
> > missing properties while at it.
> >=20
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> Hi Sebastian.
>=20
> Look good now. Applied this patch to drm-misc-next.

Thanks!

> $ ls Documentation/devicetree/bindings/display/panel/*.txt
> Documentation/devicetree/bindings/display/panel/display-timing.txt
>=20
> Nice :-)

Indeed.

> The DTS file changes needs to go in via another route.

No worries. I guess Tony will queue them up when he finds some time.

-- Sebastian

>=20
> 	Sam
>=20
> > ---
> >  .../bindings/display/panel/panel-dsi-cm.txt   | 29 -------
> >  .../bindings/display/panel/panel-dsi-cm.yaml  | 86 +++++++++++++++++++
> >  2 files changed, 86 insertions(+), 29 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/panel/pan=
el-dsi-cm.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/pan=
el-dsi-cm.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-=
cm.txt b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> > deleted file mode 100644
> > index dce48eb9db57..000000000000
> > --- a/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
> > +++ /dev/null
> > @@ -1,29 +0,0 @@
> > -Generic MIPI DSI Command Mode Panel
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -Required properties:
> > -- compatible: "panel-dsi-cm"
> > -
> > -Optional properties:
> > -- label: a symbolic name for the panel
> > -- reset-gpios: panel reset gpio
> > -- te-gpios: panel TE gpio
> > -
> > -Required nodes:
> > -- Video port for DSI input
> > -
> > -Example
> > --------
> > -
> > -lcd0: display {
> > -	compatible =3D "tpo,taal", "panel-dsi-cm";
> > -	label =3D "lcd0";
> > -
> > -	reset-gpios =3D <&gpio4 6 GPIO_ACTIVE_HIGH>;
> > -
> > -	port {
> > -		lcd0_in: endpoint {
> > -			remote-endpoint =3D <&dsi1_out_ep>;
> > -		};
> > -	};
> > -};
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dsi-=
cm.yaml b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
> > new file mode 100644
> > index 000000000000..d766c949c622
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/panel-dsi-cm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: DSI command mode panels
> > +
> > +maintainers:
> > +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> > +  - Sebastian Reichel <sre@kernel.org>
> > +
> > +description: |
> > +  This binding file is a collection of the DSI panels that
> > +  are usually driven in command mode. If no backlight is
> > +  referenced via the optional backlight property, the DSI
> > +  panel is assumed to have native backlight support.
> > +  The panel may use an OF graph binding for the association
> > +  to the display, or it may be a direct child node of the
> > +  display.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +
> > +  compatible:
> > +    items:
> > +      - enum:
> > +        - motorola,droid4-panel        # Panel from Motorola Droid4 ph=
one
> > +        - nokia,himalaya               # Panel from Nokia N950 phone
> > +        - tpo,taal                     # Panel from OMAP4 SDP board
> > +      - const: panel-dsi-cm            # Generic DSI command mode pane=
l compatible fallback
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: DSI virtual channel
> > +
> > +  vddi-supply:
> > +    description:
> > +      Display panels require power to be supplied. While several panel=
s need
> > +      more than one power supply with panel-specific constraints gover=
ning the
> > +      order and timings of the power supplies, in many cases a single =
power
> > +      supply is sufficient, either because the panel has a single powe=
r rail, or
> > +      because all its power rails can be driven by the same supply. In=
 that case
> > +      the vddi-supply property specifies the supply powering the panel=
 as a
> > +      phandle to a regulator.
> > +
> > +  vpnl-supply:
> > +    description:
> > +      When the display panel needs a second power supply, this propert=
y can be
> > +      used in addition to vddi-supply. Both supplies will be enabled a=
t the
> > +      same time before the panel is being accessed.
> > +
> > +  width-mm: true
> > +  height-mm: true
> > +  label: true
> > +  rotation: true
> > +  panel-timing: true
> > +  port: true
> > +  reset-gpios: true
> > +  te-gpios: true
> > +  backlight: true
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dsi-controller {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        panel@0 {
> > +            compatible =3D "tpo,taal", "panel-dsi-cm";
> > +            reg =3D <0>;
> > +            reset-gpios =3D <&gpio4 6 GPIO_ACTIVE_HIGH>;
> > +        };
> > +    };
> > +
> > +...
> > --=20
> > 2.27.0

--cl2alezg7yxsq6tn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl8Ql0oACgkQ2O7X88g7
+preABAAgkV9HVYAck0qetl7wnYhWxP8E2jkCpXkwayunf9Z0HqMEZXXKwky0BHm
ehDVmkpO0aNUBkrJWWjBsiR/F61UlwPpD+YU91EWCv5nYS0+PIqBM/Qy9NaU0gId
BcGvoDrcTgQFbeSfxM75jDRvdS6klvpGf+1CQCgfs/PzWB+PifeXX0BKavrpArD/
SFZqfNzSQZy5zMDXPQaJH0VfVXLlequ1wJcZOR+5jCKyGqh0wbfT28BAvqqg/Z4v
hmqI9llRv5rSD/gXHU5Dc0tGwrijq4sXQWQ0PGRkKifNM1Dd2BW2JmV9MywJi6W2
jVK46kFJfY/GZDH3SveuLGDOgynMKGjENbRI2BAuUz+WMBVf6rktIG+N6EQZUcjp
ok/V7g8HPTMa/CXohVPc/4rK5iVdJW3QDB2GErr3A0daTzM5KM/9LTury8MQo6Y7
dLEM0LjUjInYaKlE4rCVsiYbm5t7EZRRCdOPRHY/nZakAs5ciRH6W5zXgtkEzqPP
9v2iyzWY81fcFPtzBQ9LYrF0ZWOoXCGZrkBsdpTYtqJ5CXN6QKxNuPBrGEsc56vy
5W0vNzsyHszbdpwwybJ9rjSnoOcmbKekXQaspu5YMt7GNcTR9vtX2XhvGaFPAiAI
SsLbQBegMh2Odapmp9vY8YAzYSGkG+3g2W6hD2Z8W5oquCSFrf8=
=ZJ4X
-----END PGP SIGNATURE-----

--cl2alezg7yxsq6tn--

--===============1803017608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1803017608==--
