Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9101E2E2B77
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 13:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A165489D84;
	Fri, 25 Dec 2020 12:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C7D89D84
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Dec 2020 12:29:06 +0000 (UTC)
X-Originating-IP: 91.165.34.75
Received: from aptenodytes (91-165-34-75.subs.proxad.net [91.165.34.75])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E0F5D60002;
 Fri, 25 Dec 2020 12:29:02 +0000 (UTC)
Date: Fri, 25 Dec 2020 13:29:01 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v8 1/4] dt-bindings: display: Document the Xylon LogiCVC
 display controller
Message-ID: <X+XbDe5/U4rk/FxS@aptenodytes>
References: <20201223212947.160565-1-paul.kocialkowski@bootlin.com>
 <20201223212947.160565-2-paul.kocialkowski@bootlin.com>
 <1608829305.375557.2966449.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1608829305.375557.2966449.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: multipart/mixed; boundary="===============0419191021=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0419191021==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="coPQJsKTER+El0UT"
Content-Disposition: inline


--coPQJsKTER+El0UT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 24 Dec 20, 10:01, Rob Herring wrote:
> On Wed, 23 Dec 2020 22:29:44 +0100, Paul Kocialkowski wrote:
> > The Xylon LogiCVC is a display controller implemented as programmable
> > logic in Xilinx FPGAs.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../display/xylon,logicvc-display.yaml        | 313 ++++++++++++++++++
> >  1 file changed, 313 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/xylon,log=
icvc-display.yaml
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/disp=
lay/xylon,logicvc-display.example.dt.yaml: logicvc@43c00000: 'display@0' do=
es not match any of the regexes: '^gpio@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree=
/bindings/mfd/xylon,logicvc.yaml
>=20
> See https://patchwork.ozlabs.org/patch/1420307

Just so you know, this specific issue is fixed in patch 2/4.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--coPQJsKTER+El0UT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/l2w0ACgkQ3cLmz3+f
v9FHVwf/aZ0gtCsvdn07c78G0BjhQepFkKpgOl+V3xroH0VbIy8Eg+7HBpTBE5fN
0Hso6uGwLF/FCsYXVAge+Bi/LWCCSBAgwyRaag1mVlDN5FXXvitTJeJ5KKOmFKa+
klOOlO6gfdpLsO2ATbacGkTTKaJqPfSLJoAflRZpndnhB/WCOmQY0gYiW35wT0IC
ePzP3Bew2vzBSJ2HbpauF6/hXvieTiLVvF/MwdrJyW9XzO0y1Rta9DUJjMbgsEH5
scRicL6o5HscTnG99RuyHDfsv11w4v0gIspjvjiMuVHwfJx9gs1pdTkxp/QnQwDz
Ig87NMhqQbdl9cFAizCXYRl7xDkLhg==
=Ecid
-----END PGP SIGNATURE-----

--coPQJsKTER+El0UT--

--===============0419191021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0419191021==--
