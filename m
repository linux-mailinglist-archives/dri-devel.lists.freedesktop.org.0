Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A30E91AEA1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 19:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB50410E2A6;
	Thu, 27 Jun 2024 17:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nk7JdKex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FAA10E31A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 17:59:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 67C5D61EF4;
 Thu, 27 Jun 2024 17:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B265C2BBFC;
 Thu, 27 Jun 2024 17:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719511165;
 bh=lBEClSvwhghoIa9OYDcLoHFN4V4Z8etu4uaix2/Obyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nk7JdKexzCOJMLqs59XvkQmR/jraHn7BaxzgNJF7mRNo0EGdxc/Tai5sTAu022jRU
 S0B3Yz9QVGbnxV4mBzOoZy+ZhQZZAEJUGVSEsbIFXVdo62jEWOW6F/dYarOYC2Z8iw
 7GGGxBwZ/uaGpAHktoWhUm+5JY+nGyl5izqS773SK1Jo2TWfgfQVX4ctPLPiEIQLYA
 lluX0XmDAJ6LvKQx4wlWBXjpANLXr5vnlQLxQ5GAfuea9J7tGlmWs9J0l6yD94gZXd
 50reWxpYrZPuRWGI76x+rkhvgsg4oLsOnKwFZn/CzjdpxRztKv7Eowdyz9t98MVc1h
 PlchxoRT3YcFA==
Date: Thu, 27 Jun 2024 19:59:22 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hironori KIKUCHI <kikuchan98@gmail.com>, 
 Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Rename WL-355608-A8 panel
Message-ID: <20240627-muskox-of-nonconcrete-art-e4bcfd@houat>
References: <20240626112005.248576-1-ryan@testtoast.com>
 <20240626112005.248576-2-ryan@testtoast.com>
 <a4d33da3-2a2a-48ce-874d-95a5889f2f1f@linaro.org>
 <20240626-loyal-squirrel-of-charisma-4e784f@houat>
 <20240626-procreate-goldmine-800179f909e9@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="el265p2nem5547d2"
Content-Disposition: inline
In-Reply-To: <20240626-procreate-goldmine-800179f909e9@spud>
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


--el265p2nem5547d2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 04:34:11PM GMT, Conor Dooley wrote:
> On Wed, Jun 26, 2024 at 05:04:19PM +0200, Maxime Ripard wrote:
> > On Wed, Jun 26, 2024 at 02:25:54PM GMT, Neil Armstrong wrote:
> > > On 26/06/2024 13:17, Ryan Walklin wrote:
> > > > The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display from an unk=
nown
> > > > OEM used in a number of handheld gaming devices made by Anbernic.
> > > > Previously committed using the OEM serial without a vendor prefix,
> > > > however the preference is to use the integrating device vendor and =
name
> > > > where the OEM is unknown.
> > > >=20
> > > > Alter the filename and compatible string to reflect the convention.
> > > >=20
> > > > Fixes: f08aac40639c ("drm: panel: nv3052c: Add WL-355608-A8 panel")
> > > > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> > > > ---
> > > >   .../{wl-355608-a8.yaml =3D> anbernic,rg35xx-panel.yaml}     | 8 +=
+++----
> > > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > >   rename Documentation/devicetree/bindings/display/panel/{wl-355608=
-a8.yaml =3D> anbernic,rg35xx-panel.yaml} (81%)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/wl-355=
608-a8.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,rg35=
xx-panel.yaml
> > > > similarity index 81%
> > > > rename from Documentation/devicetree/bindings/display/panel/wl-3556=
08-a8.yaml
> > > > rename to Documentation/devicetree/bindings/display/panel/anbernic,=
rg35xx-panel.yaml
> > > > index 397c26be9bda5..a7d5ad0f29389 100644
> > > > --- a/Documentation/devicetree/bindings/display/panel/wl-355608-a8.=
yaml
> > > > +++ b/Documentation/devicetree/bindings/display/panel/anbernic,rg35=
xx-panel.yaml
> > > > @@ -1,10 +1,10 @@
> > > >   # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > >   %YAML 1.2
> > > >   ---
> > > > -$id: http://devicetree.org/schemas/display/panel/wl-355608-a8.yaml#
> > > > +$id: http://devicetree.org/schemas/display/panel/anbernic,rg35xx-p=
anel.yaml#
> > > >   $schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > -title: WL-355608-A8 3.5" (640x480 pixels) 24-bit IPS LCD panel
> > > > +title: Anbernic RG35XX (WL-355608-A8) 3.5" 640x480 24-bit IPS LCD =
panel
> > > >   maintainers:
> > > >     - Ryan Walklin <ryan@testtoast.com>
> > > > @@ -15,7 +15,7 @@ allOf:
> > > >   properties:
> > > >     compatible:
> > > > -    const: wl-355608-a8
> > > > +    const: anbernic,rg35xx-panel
> > > >     reg:
> > > >       maxItems: 1
> > > > @@ -41,7 +41,7 @@ examples:
> > > >           #size-cells =3D <0>;
> > > >           panel@0 {
> > > > -            compatible =3D "wl-355608-a8";
> > > > +            compatible =3D "anbernic,rg35xx-panel";
> > >=20
> > > Can it be more specific ? because there's a lot of rg35xx defined in =
bindings:
> > >  anbernic,rg351m
> > >  anbernic,rg351v
> > >  anbernic,rg353p
> > >  anbernic,rg353ps
> > >  anbernic,rg353v
> > >  anbernic,rg353vs
> > >  anbernic,rg35xx-2024
> > >  anbernic,rg35xx-plus
> > >  anbernic,rg35xx-h
> >=20
> > Yeah, if we have an identified model name, we should probably use that,
> > with a comment that we couldn't figure out what the vendor was and thus
> > went for anbernic.
>=20
> What's wrong with using the wl name that already exists as the model?
> Using rg<whatever>-panel is total invention on our part, especially
> seeing as the commit message says that multiple models can use it.

Yeah, that makes sense, sorry for the noise

Maxime

--el265p2nem5547d2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZn2oeQAKCRDj7w1vZxhR
xfSPAP0fC7twyZuMau+OeqZZt/CLvx2Bog6ZZvkm018Vna3gHgD+Mu54nJHKF//5
/A3hb+LcU4obG0pCB2XPESr4pfbKyQc=
=CbuO
-----END PGP SIGNATURE-----

--el265p2nem5547d2--
