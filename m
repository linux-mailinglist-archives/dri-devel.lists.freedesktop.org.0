Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DECA2A2E8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 09:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F3B10E7E9;
	Thu,  6 Feb 2025 08:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="cLgXJWLA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 560 seconds by postgrey-1.36 at gabe;
 Wed, 05 Feb 2025 14:50:14 UTC
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69EE910E1E4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 14:50:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2FF991038193F; Wed,  5 Feb 2025 15:40:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1738766451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cEiBKmEICWctotPHCUAWGTwbH/Iy+hrCjjP5QKi/9Lo=;
 b=cLgXJWLAdAMZvNv+TCbu3Fl/9FxjBS8zH7YHTKts/CjAxxH5YGIV4eGxb6BU2yIjt7+yb+
 8r/EGuxZtRCFA3dYOFw6yk1NU56YSKX6LfoV5/780QCG0fKpirmzFbkP8DbsZe6jBsySVU
 AJFeXmosGVZHKGIpRNa9CVZp0b4ibN8O6DoL7nV7+BCCs9gBRwXyoi5WLcYQ5JA84kmyJc
 A+3cCN08MaudaM2OTRcqq2aN1oP4Bqfr2dusv+piah0EYAPetkqzo2L8arhp0CL0a68szQ
 8DIlW9B5/EY+xjYxFvBYC5IQPGrV6Ap58bCHAgvnnZgt0zXWui0SYxrKdhu1sQ==
Date: Wed, 5 Feb 2025 15:40:44 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan
 Wahren <wahrenst@gmx.net>
Subject: Re: [RESEND PATCH v11 1/3] dt-bindings: display: Add
 powertip,{st7272|hx8238a} as DT Schema description
Message-ID: <20250205154044.7b1fd2c5@wsk>
In-Reply-To: <20250203132108.77f2123c@wsk>
References: <20250109154149.1212631-1-lukma@denx.de>
 <20250203132108.77f2123c@wsk>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NX.kk_nUKqVaGcqUC8c2=oO";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Thu, 06 Feb 2025 08:05:28 +0000
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

--Sig_/NX.kk_nUKqVaGcqUC8c2=oO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear Community,

> Dear Community,
>=20
> > This patch provides the DT Schema description of:
> > - powertip,st7272  320 x 240 LCD display
> > - powertip,hx8238a 320 x 240 LCD display
> >=20
> > Used with the different HW revisions of btt3 devices.
> >  =20
>=20
> Gentle ping on this window... I hope that it will make it into

Not "ping on this window" :-) but on this patch :-)

> upstream during this merge window.
>=20
> Thanks in advance.
>=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >=20
> > Changes for v9:
> > - New patch
> >=20
> > Changes for v10:
> > - None
> >=20
> > Changes for v11:
> > - Combine both separate dt-bindings patches for powertip,st7272 and
> >   powertip,hx8238a into one
> > - Drop the quotes for in "title" entry of powertip*.yaml files
> > ---
> >  .../display/panel/powertip,hx8238a.yaml       | 29
> > +++++++++++++++++++ .../display/panel/powertip,st7272.yaml        |
> > 29 +++++++++++++++++++ 2 files changed, 58 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> > create mode 100644
> > Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> > b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> > new file mode 100644 index 000000000000..b7d74faeb5d5 --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> > @@ -0,0 +1,29 @@ +# SPDX-License-Identifier: GPL-2.0-only OR
> > BSD-2-Clause +%YAML 1.2
> > +---
> > +$id:
> > http://devicetree.org/schemas/display/panel/powertip,hx8238a.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml# +
> > +title: Powertip Electronic Technology Co. 320 x 240 LCD panel
> > +
> > +maintainers:
> > +  - Lukasz Majewski <lukma@denx.de>
> > +
> > +allOf:
> > +  - $ref: panel-dpi.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: powertip,hx8238a
> > +      - {} # panel-dpi, but not listed here to avoid false select
> > +
> > +  height-mm: true
> > +  panel-timing: true
> > +  port: true
> > +  power-supply: true
> > +  width-mm: true
> > +
> > +additionalProperties: false
> > +
> > +...
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > new file mode 100644 index 000000000000..f3622800f13f --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > @@ -0,0 +1,29 @@ +# SPDX-License-Identifier: GPL-2.0-only OR
> > BSD-2-Clause +%YAML 1.2
> > +---
> > +$id:
> > http://devicetree.org/schemas/display/panel/powertip,st7272.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml# +
> > +title: Powertip Electronic Technology Co. 320 x 240 LCD panel
> > +
> > +maintainers:
> > +  - Lukasz Majewski <lukma@denx.de>
> > +
> > +allOf:
> > +  - $ref: panel-dpi.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: powertip,st7272
> > +      - {} # panel-dpi, but not listed here to avoid false select
> > +
> > +  height-mm: true
> > +  panel-timing: true
> > +  port: true
> > +  power-supply: true
> > +  width-mm: true
> > +
> > +additionalProperties: false
> > +
> > +... =20
>=20
>=20
>=20
>=20
> Best regards,
>=20
> Lukasz Majewski
>=20
> --
>=20
> DENX Software Engineering GmbH,      Managing Director: Erika Unter
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> lukma@denx.de




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/NX.kk_nUKqVaGcqUC8c2=oO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmejeGwACgkQAR8vZIA0
zr26xggAneqSbPpy5mv8Ai9RLDSjNCc66Zdwn6xEQ1QHl2zwo2neclEt7RRCRXC1
k8e5eu/5fagPSCCrZLJbMSYLENWkdYfx/RG5WMjaAeypsLKTpbHHfp3R1RWihe+f
TppC0mjbvF+a3Yu1y80L2myhIaWFPZtgjW0cx50h5CRtSFeopgrpUB7aXNGanyGR
JrL4/OiQ65yKiyewwjRVPSHsqfvq7RnhKFR9znVSiUgnhgv81QgGRybI8GtrwLST
NvSbxfelBlFeBQ1G8cqhXbfX3efIo/wy/P1C/ILRU0fVgBiUIz1Y68s3CuySnA52
3/EsVzfwOo3PpqQQpY0xecKeZtHlhg==
=Z4og
-----END PGP SIGNATURE-----

--Sig_/NX.kk_nUKqVaGcqUC8c2=oO--
