Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1538B3D96
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 19:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8330A112510;
	Fri, 26 Apr 2024 17:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bzEUC8Cf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCE4112510
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 17:06:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CDB7ECE1C9F;
 Fri, 26 Apr 2024 17:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAEDC116B1;
 Fri, 26 Apr 2024 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714151190;
 bh=PUvdK8u/2qpExymDyazsbUcMYN5noyr63G0MyAIPnt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bzEUC8CfAGruTab+Ero+oPa2C4hcsEfY5Y14Ue4PVxzfaP3qcYo430Qs8xnewvQvt
 qivIEQPZ0zU2mAosG7clQ4wSitDZnHqfDHB6DIly77EgD/va7P8HgnzS1d5cZ1idg3
 0i4mhil3cBDrFHnaZMtyuon85lc92QQQanngzusp2iqraWLlJhFs/FWHPlWMBwMpCE
 YjiPxj4cW7+VZ/Fas0Wc1gfaW/tJnnG00zvuJhI91GSH5JNaTJhar4MkE9wP9J1MuQ
 nYqPO/E6zTWFiDiX7+0n2FqKdkpf1wnaW+aXuIAwE8l1jdIlrW4G1mqeeFL218FKOR
 v+QnG5TKIREfQ==
Date: Fri, 26 Apr 2024 18:06:25 +0100
From: Conor Dooley <conor@kernel.org>
To: cong yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@chromium.org, linus.walleij@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 conor+dt@kernel.org, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, xuxinxiong@huaqin.corp-partner.google.com
Subject: Re: [PATCH v3 1/7] dt-bindings: display: panel: Add himax hx83102
 panel bindings
Message-ID: <20240426-fifteen-random-ff4a535ab40d@spud>
References: <20240424023010.2099949-1-yangcong5@huaqin.corp-partner.google.com>
 <20240424023010.2099949-2-yangcong5@huaqin.corp-partner.google.com>
 <20240424-spelling-float-9b881cb80992@spud>
 <CAHwB_NLb9ENfCj-oJ2mV_DwFJ0h6TGSi1byUdd6Bri3gDsCo5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KG4VLxjx13klv+v0"
Content-Disposition: inline
In-Reply-To: <CAHwB_NLb9ENfCj-oJ2mV_DwFJ0h6TGSi1byUdd6Bri3gDsCo5Q@mail.gmail.com>
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


--KG4VLxjx13klv+v0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 02:03:24PM +0800, cong yang wrote:
> Conor Dooley <conor@kernel.org> =E4=BA=8E2024=E5=B9=B44=E6=9C=8825=E6=97=
=A5=E5=91=A8=E5=9B=9B 00:55=E5=86=99=E9=81=93=EF=BC=9A
> > On Wed, Apr 24, 2024 at 10:30:04AM +0800, Cong Yang wrote:

> > > +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.y=
aml
> >
> > Filename matching a compatible please. What you've done here makes it
> > seem like there's a fallback compatible missing, given this looks like
> > the LCD panel controller and the starry compatible below is an LCD pane=
l.
>=20
> So change the filename to starry,himax83102-j02.yaml?

IDK chief, are you missing a fallback or not?

>=20
> >
> > > @@ -0,0 +1,73 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/himax,hx83102.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Himax HX83102 MIPI-DSI LCD panel controller

Because the title here makes it seem like there should be.

> > > +maintainers:
> > > +  - Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +        # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
> > > +      - starry,himax83102-j02
> > > +
> > > +  reg:
> > > +    description: the virtual channel number of a DSI peripheral
> > > +
> > > +  enable-gpios:
> > > +    description: a GPIO spec for the enable pin
> > > +
> > > +  pp1800-supply:
> > > +    description: core voltage supply
> > > +
> > > +  avdd-supply:
> > > +    description: phandle of the regulator that provides positive vol=
tage
> > > +
> > > +  avee-supply:
> > > +    description: phandle of the regulator that provides negative vol=
tage
> > > +
> > > +  backlight:
> > > +    description: phandle of the backlight device attached to the pan=
el
> >
> > I'm not sure why this was given a description when port or rotation
> > was not.
>=20
> So change it to backlight: true ?

Sure? It is just a repeat of something already described in
panel-common.

--KG4VLxjx13klv+v0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZivfEQAKCRB4tDGHoIJi
0ovXAQDGJnOsSMKJRaP2aIy/+907+rwA/s57l0E2Q/EA3qWPMAD6Aj4ASUzuPYHm
GRj7CsG1KnQPHUX0R43Qysud1+OLcQ4=
=hib7
-----END PGP SIGNATURE-----

--KG4VLxjx13klv+v0--
