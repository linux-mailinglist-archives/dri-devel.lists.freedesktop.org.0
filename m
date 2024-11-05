Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A132F9BD487
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 19:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48D410E42B;
	Tue,  5 Nov 2024 18:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KP6DyBP6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D994710E42B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 18:28:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 80F005C48D9;
 Tue,  5 Nov 2024 18:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0600AC4CECF;
 Tue,  5 Nov 2024 18:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730831280;
 bh=jAP3GW7r+LYfHeNe78IMVIHvCpq6zsC+fpPsRxm+kUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KP6DyBP6FYQuXObKCAicdrL3sNZf09qhW5mZxQneUWN2Ekru0Qs5FMLysQfPe8m8T
 AhhzVSllmmE/5ESZuWqzYrB1aPD6ZO7Yj5FGMEQjBJgYYR2t9BF/NUQdQcMDdk8P60
 QrB+FLOQ/LL3R+Z/OJiJ00QXA++FLM8jhf6jA60JAD6C6Zg8GhF0kA2TfKxH3DOi7b
 23aWyNctjGRJEqkJx+1Vqa8R3g2Pbdfj+wkxyQPhMwGJtxT6uHTwPvUP77LMKJX3rT
 CeAcPFs66EaIWxV8IULsfuI/TJgVrVpEvztyZ/npGUpBDBLDSez3PaHFiMb3bm2gDH
 ie8pSdyXuD5xg==
Date: Tue, 5 Nov 2024 18:27:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: display: panel: Rename
 rg35xx-plus-panel back to WL-355608-A8
Message-ID: <20241105-maybe-chamomile-7505214f737e@spud>
References: <20241105055239.1577275-1-kikuchan98@gmail.com>
 <20241105055239.1577275-2-kikuchan98@gmail.com>
 <20241105141900.GA3110982-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KWrKfl/izLTBZfq2"
Content-Disposition: inline
In-Reply-To: <20241105141900.GA3110982-robh@kernel.org>
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


--KWrKfl/izLTBZfq2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 08:19:00AM -0600, Rob Herring wrote:
> On Tue, Nov 05, 2024 at 02:52:29PM +0900, Hironori KIKUCHI wrote:
> > A panel assembly is changed in the recent revision of Anbernic RG35XX
> > Plus, so the `anbernic,rg35xx-plus-panel` identifier is neither suitable
> > nor unique for the panel anymore.
> >=20
> > Fortunately, the panel can be distinguished by a label printed on the
> > FPC cable, so use the label "WL-355608-A8" as an identifier instead.
> >=20
> > Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
> > ---
> >  ...rg35xx-plus-panel.yaml =3D> anbernic,wl-355608-a8.yaml} | 9 +++++--=
--
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >  rename Documentation/devicetree/bindings/display/panel/{anbernic,rg35x=
x-plus-panel.yaml =3D> anbernic,wl-355608-a8.yaml} (83%)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,r=
g35xx-plus-panel.yaml b/Documentation/devicetree/bindings/display/panel/anb=
ernic,wl-355608-a8.yaml
> > similarity index 83%
> > rename from Documentation/devicetree/bindings/display/panel/anbernic,rg=
35xx-plus-panel.yaml
> > rename to Documentation/devicetree/bindings/display/panel/anbernic,wl-3=
55608-a8.yaml
> > index 1d67492ebd3..5e8afbea690 100644
> > --- a/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-p=
lus-panel.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/anbernic,wl-35560=
8-a8.yaml
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >  %YAML 1.2
> >  ---
> > -$id: http://devicetree.org/schemas/display/panel/anbernic,rg35xx-plus-=
panel.yaml#
> > +$id: http://devicetree.org/schemas/display/panel/anbernic,wl-355608-a8=
=2Eyaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > =20
> >  title: Anbernic RG35XX series (WL-355608-A8) 3.5" 640x480 24-bit IPS L=
CD panel
> > @@ -16,13 +16,14 @@ allOf:
> >  properties:
> >    compatible:
> >      oneOf:
> > -      - const: anbernic,rg35xx-plus-panel
> > +      - const: anbernic,wl-355608-a8
> >        - items:
> >            - enum:
> >                - anbernic,rg35xx-2024-panel
> >                - anbernic,rg35xx-h-panel
> >                - anbernic,rg35xx-sp-panel
> > -          - const: anbernic,rg35xx-plus-panel
> > +              - anbernic,rg35xx-plus-panel
> > +          - const: anbernic,wl-355608-a8
> > =20
> >    reg:
> >      maxItems: 1
> > @@ -47,7 +48,7 @@ examples:
> >          #size-cells =3D <0>;
> > =20
> >          panel@0 {
> > -            compatible =3D "anbernic,rg35xx-plus-panel";
> > +            compatible =3D "anbernic,wl-355608-a8";
>=20
> This is an ABI break. You can't just change compatibles.
>=20
> The old panel should correspond to the existing compatible. Add a new=20
> compatible for the new panel. The names might not be ideal, but you are=
=20
> stuck with them.
>=20
> There's exceptions if things are new and not yet in use, but you have to=
=20
> explain that in the commit msg.

We already had one faff over renaming this panel a few months ago:
d682eef93ebf ("dt-bindings: display: panel: Rename WL-355608-A8 panel to rg=
35xx-*-panel")
I don't agree with renaming it again.

--KWrKfl/izLTBZfq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZypjqwAKCRB4tDGHoIJi
0kZvAQDGlp5m873rhBYpE0YeWZx2FSdOgrOC4C1DUcYPF4TqsAD9EPDcRf3IgiHj
xIFBQes+LtwbDJ9M0Ycx3wE/F34rqQ8=
=gldU
-----END PGP SIGNATURE-----

--KWrKfl/izLTBZfq2--
