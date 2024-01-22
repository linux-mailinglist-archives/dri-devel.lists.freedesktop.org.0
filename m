Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB291836B07
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6FA10F624;
	Mon, 22 Jan 2024 16:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A6410F657
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:38:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0120DB80EBC;
 Mon, 22 Jan 2024 16:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398BEC43399;
 Mon, 22 Jan 2024 16:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705941463;
 bh=8hgK250T38f/5kHPmHt9GYXt2EggjpxT0pE85p+VXu8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OOShweST2KxUmAjS2ZlYQq0GYQ5YY21DZS5geqSYsKVNJrFAqAjsOxTlf8gCbxZ4w
 74NAivmW8sun6kGcOun+M5ZAv1Q5FLXkgGC96wWOo/aI0/wocrFqYUjtP+DZYO8lYh
 hb81vvxEo/KckkOUhPgln864Kd59kQ0fV4AfK/zqnQeFeTaUOxKgE0j4oBC+0Nz8Q/
 9s//lAhRC3aATU1rE9RzoKoTWlh5BoMmRyNVTFj4YjgTwi693i3frd2w5UDtcr2jES
 zyhdMT1/c9taLfZ7xvQWrUVr93XxFcdYeKswoA84w4gpTOS/gv0ESlZKlpu3z98cli
 Vpqfmb9g8Ya0A==
Date: Mon, 22 Jan 2024 16:37:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: bridge: add sam9x7-lvds
 compatible
Message-ID: <20240122-privacy-preschool-27dc7dcc5529@spud>
References: <20240122082947.21645-1-dharma.b@microchip.com>
 <20240122082947.21645-2-dharma.b@microchip.com>
 <10a88fc6-2c4c-4f77-850f-f15b21a8ed49@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aolaLcJ2uBgrQZSo"
Content-Disposition: inline
In-Reply-To: <10a88fc6-2c4c-4f77-850f-f15b21a8ed49@kernel.org>
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
Cc: manikandan.m@microchip.com, neil.armstrong@linaro.org, conor+dt@kernel.org,
 rfoss@kernel.org, daniel@ffwll.ch, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, mripard@kernel.org,
 Dharma Balasubiramani <dharma.b@microchip.com>, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 linux4microchip@microchip.com, airlied@gmail.com, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--aolaLcJ2uBgrQZSo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 04:51:16PM +0100, Krzysztof Kozlowski wrote:
> On 22/01/2024 09:29, Dharma Balasubiramani wrote:
> > Add the 'sam9x7-lvds' compatible binding, which describes the
> > Low Voltage Differential Signaling (LVDS) Controller found on Microchip=
's
> > sam9x7 series System-on-Chip (SoC) devices. This binding will be used to
> > define the properties and configuration for the LVDS Controller in DT.
> >=20
> > Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> > ---
> >  .../display/bridge/microchip,sam9x7-lvds.yaml | 59 +++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/mi=
crochip,sam9x7-lvds.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/bridge/microchip=
,sam9x7-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/microc=
hip,sam9x7-lvds.yaml
> > new file mode 100644
> > index 000000000000..8c2c5b858c85
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/microchip,sam9x7=
-lvds.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/microchip,sam9x7-lvd=
s.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip SAM9X7 LVDS Controller
>=20
> What is the "X"?
>=20
> > +
> > +maintainers:
> > +  - Dharma Balasubiramani <dharma.b@microchip.com>
> > +
> > +description: |
>=20
> Do not need '|' unless you need to preserve formatting.
>=20
> > +  The Low Voltage Differential Signaling Controller (LVDSC) manages da=
ta
> > +  format conversion from the LCD Controller internal DPI bus to OpenLDI
> > +  LVDS output signals. LVDSC functions include bit mapping, balanced m=
ode
> > +  management, and serializer.
> > +
> > +properties:
> > +  compatible:
> > +    const: microchip,sam9x7-lvds
>=20
> What is "x"? Wildcard? Then no, don't use it and instead use proper SoC
> version number.

These SoCs actually do have an x in their name. However, and I do always
get confused here, the sam9x7 is a series of SoCs (the cover letter does
say this) rather than a specific device.
I think the series current consists of a sam9x70 sam9x72 and a sam9x75.
The devices are largely similar, but I am not sure if the sam9x70
supports LVDS at all. Having a compatible for the series does not seem
correct to me.

Cheers,
Conor.

--aolaLcJ2uBgrQZSo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa6Z0AAKCRB4tDGHoIJi
0uPJAP4t8G73AnyxZ99drqxZFn+FO/qVjy6yDxWMrS7mUlF3jAD/Rxnt2ppliico
jd+CiKF4PP7p0uU2g8BCGvHhf/51VQY=
=1151
-----END PGP SIGNATURE-----

--aolaLcJ2uBgrQZSo--
