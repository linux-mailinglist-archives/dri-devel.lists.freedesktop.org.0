Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF0890C4C9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 10:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B38D10E5CB;
	Tue, 18 Jun 2024 08:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SOCgbkuF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFA210E5C9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 08:15:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3543ECE1267;
 Tue, 18 Jun 2024 08:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077C2C3277B;
 Tue, 18 Jun 2024 08:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718698545;
 bh=ylpiGg1ul2I32meAJZPYolq2aDtWZK7OmTUHx0fbO3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SOCgbkuFLhq60WLK6FtzWOskD9poUUHUFJ3/+KV2HCZaEwzOJT1dLMtIfmZsIyzri
 OlRx9UG4OmVk28TJHi/JJ+BOK0L4cHFqpAPHDQU16pxqblkutN/bJt54Nl8X/r8bXb
 j/3rrvlOox//2ABaEWOgvyjGdWdQg4121DzIRPiUJ2e1QCB879zYNLYSbHM2Pi4eaU
 bLgxKtlevoaB+1B3QZsIJV2XkSoKSUx2R8ntn7vBCFUaNBT61ZESb7Ac9fak4Si4Oc
 DxENXY9AGMdpa5S/9OHEjJ8BreLd8uUdc376DWQMUn/22QxhRejpm5HSApr4l7yyEq
 VNrgKlHblkR6Q==
Date: Tue, 18 Jun 2024 10:15:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH 1/4] dt-bindings: display: simple-bridge: add ti,tdp158
Message-ID: <20240618-demonic-handsome-quokka-0c556c@houat>
References: <20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr>
 <20240617-tdp158-v1-1-df98ef7dec6d@freebox.fr>
 <y37rh2uulewie3mpumlznhmvrk4ileauhk6xkoafv4zt43q5wm@ftnpqit6alth>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ecwdjhoejl3hqyyr"
Content-Disposition: inline
In-Reply-To: <y37rh2uulewie3mpumlznhmvrk4ileauhk6xkoafv4zt43q5wm@ftnpqit6alth>
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


--ecwdjhoejl3hqyyr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 10:37:18PM GMT, Dmitry Baryshkov wrote:
> On Mon, Jun 17, 2024 at 06:02:59PM GMT, Marc Gonzalez wrote:
> > In default mode, this device works transparently.
> >=20
> > Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > ---
> >  Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | =
4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/bridge/simple-br=
idge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.=
yaml
> > index 43cf4df9811a5..5f0c9687538bf 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.ya=
ml
> > +++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.ya=
ml
> > @@ -31,6 +31,7 @@ properties:
> >            - ti,opa362
> >            - ti,ths8134
> >            - ti,ths8135
> > +          - ti,tdp158
> > =20
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> > @@ -52,6 +53,9 @@ properties:
> >      maxItems: 1
> >      description: GPIO controlling bridge enable
> > =20
> > +  vcc-supply:
> > +    description: Power supply for the bridge
> > +
> >    vdd-supply:
> >      description: Power supply for the bridge
>=20
> I'd suggest having a separate _bindings_ file. This way you can point
> out that it's an I2C device sitting on the I2C bus. And once somebody
> has to extend the bindings to support 'smarter' programming of this chip
> they can edit just that file. It's still fine to use the simple-bridge
> driver for the device defined in that bindings file.

Yeah, we want a separate binding for that one, that, just like we
discussed in v1, can be extended to support the other setups this bridge
can be used for.

Maxime

--ecwdjhoejl3hqyyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnFCLgAKCRDj7w1vZxhR
xXvrAQCSOV8D/KxDOTA/ca3Be29Qs+Kmhmsd+SnjHYTMwCRiHAEA9Nu1zVJ1aWk3
Q2XxMzZDOiBhGTYgYqLU2xfXWHbvhww=
=t+i/
-----END PGP SIGNATURE-----

--ecwdjhoejl3hqyyr--
