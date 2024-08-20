Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF91958C20
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 18:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEB910E132;
	Tue, 20 Aug 2024 16:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DwZ905sq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 423 seconds by postgrey-1.36 at gabe;
 Tue, 20 Aug 2024 16:21:39 UTC
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E816E10E132
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 16:21:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CFC7FA40154;
 Tue, 20 Aug 2024 12:14:28 -0400 (EDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC941C4AF0F;
 Tue, 20 Aug 2024 16:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724170475;
 bh=dpdsDm+bLI5JQDul4V/gUcZOykImVDR9fxONqr/1ozA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DwZ905sqtX/74jPtmeqSSunbpwyzbbzZZ8kGXXBKCzKzcCnndUKMQnonufnWBz4oX
 KBmh8vENLBl76NV/tfxMEebtnE/WWYmJGTvlAjPz4XP7zEmDC4upBaqr9KG+h6NaHp
 0CierElW5i5I7eobDRTJNUzEWT9zFAReBSEG8V+KUIHpg6DxWE2e/mw/80Oi/cJa9N
 QMdzQeEK6jCtUzjxrYaP8FRp8/qNzEYOUntYvF4lZZh15hQtZE6vx5sD/mXYhOpVel
 G/Ci72mT1xEWFGwGIg7+4qlDv1LyQ4sufEQERdeGi/HXo8geBx9ItnCjdcYaUp3ePG
 KwPc5PZn7SVFw==
Date: Tue, 20 Aug 2024 17:14:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: display: rockchip: Add schema for
 RK3588 HDMI TX Controller
Message-ID: <20240820-tropics-hunchback-6fdcd0b37f91@spud>
References: <20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com>
 <20240819-b4-rk3588-bridge-upstream-v4-3-6417c72a2749@collabora.com>
 <20240819-bobbing-purplish-99e48baa2304@spud>
 <ec84bc0b-c4c2-4735-9f34-52bc3a852aaf@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WIjEHvGhr8+cRBp+"
Content-Disposition: inline
In-Reply-To: <ec84bc0b-c4c2-4735-9f34-52bc3a852aaf@collabora.com>
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


--WIjEHvGhr8+cRBp+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 03:37:44PM +0300, Cristian Ciocaltea wrote:
> On 8/19/24 7:53 PM, Conor Dooley wrote:
> > On Mon, Aug 19, 2024 at 01:29:30AM +0300, Cristian Ciocaltea wrote:
> >> Rockchip RK3588 SoC integrates the Synopsys DesignWare HDMI 2.1
> >> Quad-Pixel (QP) TX controller IP.
> >>
> >> Since this is a new IP block, quite different from those used in the
> >> previous generations of Rockchip SoCs, add a dedicated binding file.
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  .../display/rockchip/rockchip,dw-hdmi-qp.yaml      | 170 ++++++++++++=
+++++++++
> >>  1 file changed, 170 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockch=
ip,dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/roc=
kchip,dw-hdmi-qp.yaml
> >> new file mode 100644
> >> index 000000000000..de470923d823
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-h=
dmi-qp.yaml
> >=20
> > Filename matching the compatible please.
>=20
> RK3588 happens to be the first Rockchip SoC using the QP TX controller, b=
ut
> more are expected to come, e.g. RK3576.  Should we add 'rk3588-' to the
> filename and let it being dropped when the 2nd SoC is added?

Yes to the former, no to the latter.

>=20
> >> @@ -0,0 +1,170 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi-=
qp.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Rockchip DW HDMI QP TX Encoder
> >> +
> >> +maintainers:
> >> +  - Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> +
> >> +description:
> >> +  Rockchip RK3588 SoC integrates the Synopsys DesignWare HDMI QP TX c=
ontroller
> >> +  IP and a HDMI/eDP TX Combo PHY based on a Samsung IP block.
> >> +
> >> +allOf:
> >> +  - $ref: /schemas/display/bridge/synopsys,dw-hdmi-qp.yaml#
> >> +  - $ref: /schemas/sound/dai-common.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - rockchip,rk3588-dw-hdmi-qp
> >> +
> >> +  clocks:
> >> +    minItems: 4
> >> +    items:
> >> +      - {}
> >> +      - {}
> >> +      - {}
> >> +      - {}
> >=20
> > Why have you chosen to do things like this?  I find it makes things less
> > clear than reiterating the names of the required clocks.
>=20
> I've just followed the approach used in rockchip,dw-hdmi.yaml.  Personall=
y,
> I preferred this for making a clear distinction between common and custom
> items, in addition to reducing content dupplication.=20
>=20
> If readability is more important/desired, I will expand the items.  For
> consistency, I assume clock-names, interrupts and interrupt-names below
> should be treated similarly.

I don't feel particularly strongly here FWIW. If you chose to do it, do
it for all properties, yes.

> >> +      # The next clocks are optional, but shall be specified in this
> >> +      # order when present.
> >> +      - description: TMDS/FRL link clock
> >> +      - description: Video datapath clock
> >=20
> > I don't get what you mean by optional. You have one SoC, either they are
> > or are not connected, unless there's multiple instances of this IP block
> > on the SoC and some do and some do not have these clocks?
> > Ditto for the interrupts.
>=20
> They were handled as such in vendor tree, probably assuming other SoC
> variants might not need them.  I agree it doesn't make sense to have them
> optional at this point.  Will fix this in the next revision.
>=20
> >> +
> >> +  clock-names:
> >> +    minItems: 4
> >> +    items:
> >> +      - {}
> >> +      - {}
> >> +      - {}
> >> +      - {}
> >> +      - enum: [hdp, hclk_vo1]
> >> +      - const: hclk_vo1
> >> +
> >> +  interrupts:
> >> +    items:
> >> +      - {}
> >> +      - {}
> >> +      - {}
> >> +      - {}
> >> +      - description: HPD interrupt
> >> +
> >> +  interrupt-names:
> >> +    items:
> >> +      - {}
> >> +      - {}
> >> +      - {}
> >> +      - {}
> >> +      - const: hpd
> >> +
> >> +  phys:
> >> +    maxItems: 1
> >> +    description: The HDMI/eDP PHY.
> >> +
> >> +  phy-names:
> >> +    const: hdmi
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  resets:
> >> +    minItems: 2
> >> +    maxItems: 2
> >> +
> >> +  reset-names:
> >> +    items:
> >> +      - const: ref
> >> +      - const: hdp
> >> +
> >> +  "#sound-dai-cells":
> >> +    const: 0
> >> +
> >> +  rockchip,grf:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      Most HDMI QP related data is accessed through SYS GRF regs.
> >> +
> >> +  rockchip,vo1-grf:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      Additional HDMI QP related data is accessed through VO1 GRF reg=
s.
> >=20
> > Why are these required? What prevents you looking up the syscons by
> > compatible?
>=20
> That is for getting the proper instance:

Ah, that makes sense. I am, however, curious why these have the same
compatible when they have different sized regions allocated to them.

> 	vo0_grf: syscon@fd5a6000 {
> 		compatible =3D "rockchip,rk3588-vo-grf", "syscon";
> 		reg =3D <0x0 0xfd5a6000 0x0 0x2000>;
> 		clocks =3D <&cru PCLK_VO0GRF>;
> 	};
>=20
> 	vo1_grf: syscon@fd5a8000 {
> 		compatible =3D "rockchip,rk3588-vo-grf", "syscon";
> 		reg =3D <0x0 0xfd5a8000 0x0 0x100>;
> 		clocks =3D <&cru PCLK_VO1GRF>;
> 	};
>=20
> Thanks for reviewing,
> Cristian

--WIjEHvGhr8+cRBp+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsTA4wAKCRB4tDGHoIJi
0nV8AP96gaUNJensDkrW5IXMKbs1E7j8608g8NJuWpUI2Z0BFwEApF0W+cODYufQ
cQcnuTAOqAcS/MvN8IuqYHrI+fzo8A4=
=xCAE
-----END PGP SIGNATURE-----

--WIjEHvGhr8+cRBp+--
