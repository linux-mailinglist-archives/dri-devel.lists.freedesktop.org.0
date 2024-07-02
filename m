Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08264924279
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 17:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCBB10E633;
	Tue,  2 Jul 2024 15:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aHlopjPf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B0510E633
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 15:34:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1265461DBB;
 Tue,  2 Jul 2024 15:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F94C116B1;
 Tue,  2 Jul 2024 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719934487;
 bh=+dYiFmhmoQq6ipJE6mlBFSYVxPXJIa9oBX8SvQ1Od/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aHlopjPfwKNLP8sg48SSnpmQ5D4dZ5ylFVdez1Wv3FlKTOo5st+VquVoSvYCuDngm
 CQQ91dB4rDedUSUmeu3oHUw84DE9Y5lZk+8YqwrLFvALUgnkXDXMF/pUDylGL7YwVt
 rDbDfwbJbaLW/YBG5xoHocFBZaoelikmsCqlrKGc872N+PgViLLKu23JsEYt6nY49g
 vmFtWis0SaLdjhp1krsTKDI7tjmLWl9TryPOlT/HidCCOlbC0+tymUcTtvBlCPAPcn
 u1odPFJgqegm0pP5tw4OU1oX15iI53gi8l83+6eIyNtAlf08aFFSO/1ZpnkrA8RTdJ
 jRsr0+ya4LRhA==
Date: Tue, 2 Jul 2024 16:34:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Hironori KIKUCHI <kikuchan98@gmail.com>
Cc: linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: st7701: Add Anbernic RG28XX
 panel
Message-ID: <20240702-magnetism-amends-d535f626e433@spud>
References: <20240628051019.975172-1-kikuchan98@gmail.com>
 <20240628051019.975172-2-kikuchan98@gmail.com>
 <20240628-splashy-slug-1d74e3fd9fe6@spud>
 <CAG40kxERY2r2cj58kjVMMg1JVOChRKraKYFo_K5C5fnx0g80Qw@mail.gmail.com>
 <20240630-babied-grill-13c840abb70a@spud>
 <CAG40kxHxnSNp1_4fX0fOWypLunPm-NnH1UEKZNQgM0g-Z1u1DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8Wkwgm2LZxTD6wYX"
Content-Disposition: inline
In-Reply-To: <CAG40kxHxnSNp1_4fX0fOWypLunPm-NnH1UEKZNQgM0g-Z1u1DQ@mail.gmail.com>
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


--8Wkwgm2LZxTD6wYX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 02:28:27AM +0900, Hironori KIKUCHI wrote:
> On Sun, Jun 30, 2024 at 11:17=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > On Sat, Jun 29, 2024 at 05:26:56PM +0900, Hironori KIKUCHI wrote:
> > > On Sat, Jun 29, 2024 at 1:27=E2=80=AFAM Conor Dooley <conor@kernel.or=
g> wrote:
> > > > On Fri, Jun 28, 2024 at 02:10:15PM +0900, Hironori KIKUCHI wrote:

> > > > >            - densitron,dmt028vghmcmi-1a
> > > > >            - elida,kd50t048a
> > > > >            - techstar,ts8550b
> > > > >        - const: sitronix,st7701
> > > > >
> > > > >    reg:
> > > > > -    description: DSI virtual channel used by that screen
> > > > > +    description: DSI / SPI channel used by that screen
> > > > >      maxItems: 1
> > > > >
> > > > >    VCC-supply:
> > > > > @@ -43,6 +41,13 @@ properties:
> > > > >    IOVCC-supply:
> > > > >      description: I/O system regulator
> > > > >
> > > > > +  dc-gpios:
> > > > > +    maxItems: 1
> > > > > +    description:
> > > > > +      Controller data/command selection (D/CX) in 4-line SPI mod=
e.
> > > > > +      If not set, the controller is in 3-line SPI mode.
> > > > > +      Disallowed for DSI.
> > > > > +
> > > > >    port: true
> > > > >    reset-gpios: true
> > > > >    rotation: true
> > > > > @@ -57,7 +62,38 @@ required:
> > > > >    - port
> > > > >    - reset-gpios
> > > > >
> > > > > -additionalProperties: false
> > > > > +allOf:
> > > > > +  - $ref: panel-common.yaml#
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          contains:
> > > > > +            # SPI connected panels
> > > > > +            enum:
> > > > > +              - anbernic,rg28xx-panel
> > > > > +    then:
> > > > > +      $ref: /schemas/spi/spi-peripheral-props.yaml
> > > >
> > > > I'm not really keen on this. I'd rather see a different binding for=
 the
> > > > SPI version compared to the MIPI ones. Is doing things like this co=
mmon
> > > > for panels? If it is, I'll turn a blind eye..
> > >
> > > This might be the first case that a driver supports both DSI and SPI
> > > for a panel.
> > > The panel can be either a DSI device or an SPI device.
> >
> > The commit message sounded like the panel was capable of doing SPI
> > instead of DSI, is that not the case and the panel is actually capable
> > of doing both, just happens to be connected as SPI in this particular
> > device?
>=20
> Sorry for the confusion.
> I think it depends on what the "panel" refers to...
> Although the "panel driver IC" (ST7701 variant) is capable of doing
> both, the "panel assy" (including its cable) of the RG28XX only has an
> SPI interface in its pinout.
> If the compatible string "rg28xx-panel" represents the assy, then I
> could say the "panel" only supports SPI, and the other panels only
> support DSI.
> But if it only represents a specific LCD panel and its driver IC with
> control parameters, then it theoretically supports both, and it might
> be sufficient to just include spi-peripheral-props, as in v1.
> v1: https://lore.kernel.org/linux-kernel/20240618081515.1215552-2-kikucha=
n98@gmail.com/

I thought about it some more, and I think what you've got for this in
the binding at present is fine. Splitting the binding I think would
require a select and wouldn't really be any "cleaner" of an
implementation.

Thanks,
Conor.

--8Wkwgm2LZxTD6wYX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQeEgAKCRB4tDGHoIJi
0vvsAP9+fpoFYD3SA3hRRGAIfCwJ3EiGoPOw3FcWVA1dtXs6FwEA7OBNrPnGxdQo
DSBupiUCLvbAS0u7Q+v/iLTAaozWdAY=
=4eFZ
-----END PGP SIGNATURE-----

--8Wkwgm2LZxTD6wYX--
