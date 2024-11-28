Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B47B79DB5B8
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 11:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F7C10E32D;
	Thu, 28 Nov 2024 10:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vLmuCLCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D10010E32D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 10:29:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AE9205C59FD;
 Thu, 28 Nov 2024 10:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C5CC4CECE;
 Thu, 28 Nov 2024 10:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732789763;
 bh=UN9E/IslKJJ6kXg07JlJB5mwNZgSYgjjqJXv+tdg8to=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vLmuCLCjnYq+kiQoVtx+OI6vriP/NyPLzBqvfhzYve/l4WNpbc1wYdDQssVor5zdt
 p5KtJ1sm9eTKXSYshjV2SkAmRd2LCrMJwq890kcxask80KqdRBvGJ7ABwVAP42ztkp
 kh0u1amEpZ7e+XlAmgQYbDL3QhpVrbm7sHWPw7dJAaVUEZc6Og232TsDsyV5Y2BBsJ
 T7lrV9F+V1tHkasuVo5nhpjqYgLc7V4P3enqP+dX4UXJwbqeb5uQZhUZ/Xmn7l8aWx
 1XsM9pjx8udc9EV2jBiSUdvch42d6NKcruq7zzYhGoMRw04jX4HlIjkWokSNcZTWQ8
 fB+i97A77k18w==
Date: Thu, 28 Nov 2024 11:29:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: Rob Herring <robh@kernel.org>, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, krzk+dt@kernel.org,
 conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, marex@denx.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add optional
 property ti,lvds-vcom
Message-ID: <20241128-mottled-nostalgic-oriole-be31ce@houat>
References: <20241127103031.1007893-1-andrej.picej@norik.com>
 <20241127103031.1007893-2-andrej.picej@norik.com>
 <20241127151630.GA3515396-robh@kernel.org>
 <3b5768e5-dcb6-436d-837c-418676e13b2e@norik.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="tvgn3pzm6x2sclac"
Content-Disposition: inline
In-Reply-To: <3b5768e5-dcb6-436d-837c-418676e13b2e@norik.com>
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


--tvgn3pzm6x2sclac
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add optional
 property ti,lvds-vcom
MIME-Version: 1.0

On Thu, Nov 28, 2024 at 09:46:33AM +0100, Andrej Picej wrote:
> On 27. 11. 24 16:16, Rob Herring wrote:
> > On Wed, Nov 27, 2024 at 11:30:29AM +0100, Andrej Picej wrote:
> > > From: Janine Hagemann <j.hagemann@phytec.de>
> > >=20
> > > Add an optional property to change LVDS output voltage. This depends =
on
> > > the connected display specifications. With this property we directly =
set
> > > the LVDS_VCOM (0x19) register.
> > > Better register property mapping would be quite tricky. Please check
> > > bridge's datasheet for details on how register values set the LVDS
> > > data lines and LVDS clock output voltage.
> > >=20
> > > Signed-off-by: Janine Hagemann <j.hagemann@phytec.de>
> > > Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> > > ---
> > >   .../bindings/display/bridge/ti,sn65dsi83.yaml      | 14 +++++++++++=
++-
> > >   1 file changed, 13 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65=
dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.=
yaml
> > > index 48a97bb3e2e0..5b2c0c281824 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.y=
aml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.y=
aml
> > > @@ -58,6 +58,12 @@ properties:
> > >                     - const: 2
> > >                     - const: 3
> > >                     - const: 4
> > > +              ti,lvds-vcom:
> > > +                $ref: /schemas/types.yaml#/definitions/uint32
> > > +                description: LVDS output voltage configuration. This=
 defines
> > > +                  LVDS_VCOM (0x19) register value. Check bridge's da=
tasheet for
> > > +                  details on how register values set the LVDS data l=
ines and
> > > +                  LVDS clock output voltage.
> >=20
> > Constraints? 0 - 2^32 are all valid values?
>=20
> Not really, only first 6 bits, which also means that this can be uint8 th=
en.
> Will fix with other issues.

Also, generally speaking directly using register values is really
frowned upon, even more so when they match a value expressed in a
standard unit.

Maxime

--tvgn3pzm6x2sclac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0hF9wAKCRAnX84Zoj2+
dhSoAX9Uu3UcKpopfFbkrgWp56OEJeL/hrbtsgKELqjxdDABI0ujjZDWXpMg1rM8
FxDYFLkBgMOgSjdgLtFASjWYBF1ZOJauobTk1LyMFCHiK30f0SS5gjfI+r7wL/pr
FqWXHi0wAw==
=sZjc
-----END PGP SIGNATURE-----

--tvgn3pzm6x2sclac--
