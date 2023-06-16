Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFE9733255
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 15:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA9910E0B9;
	Fri, 16 Jun 2023 13:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217C010E0B9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 13:38:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A11F6159D;
 Fri, 16 Jun 2023 13:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993F9C433C8;
 Fri, 16 Jun 2023 13:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686922687;
 bh=u9jc2dsGlg1D+RH50wK5bkx2o24kM8ZnMNyQTmP89LI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LiuIqQ3z3unGqUDxP1wAOjtP/jgeVGaJJqv8xsCAM4+v8I2T1i86HF/cRnx3WFTB1
 uMn4J9GVs9e1Q1LILktGZZ8Rm0WebLfuabzd+l5RbH8Z3/gGYG6T0Zm2xn0871W5EV
 U7bLpY2qUM85OM8Bl19PgcPppreXmJhTliwVLSFv/K/eO5anq3VTHVqFA8+SELz3z6
 fjX25nbXGkQOyFYUSSW8NIg3+mGcK62In2odfkiuYs223PymrzBGoZ3wQMdaf6AzF9
 5qkiXIfX/nJvZWTOX8gzv3gFqobhs153h17j9NyAToPk31dCk5vM+J82WZMVBotZ3K
 vHPdru+RMnLpA==
Received: by mercury (Postfix, from userid 1000)
 id C65511060BB1; Fri, 16 Jun 2023 15:38:04 +0200 (CEST)
Date: Fri, 16 Jun 2023 15:38:04 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 7/7] drm/panel: sitronix-st7789v: Check display ID
Message-ID: <20230616133804.7jhe4djj5kzzhoyg@mercury.elektranox.org>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-8-miquel.raynal@bootlin.com>
 <20230610204525.GA1042549@ravnborg.org>
 <20230614232724.yer2ikvfzmaiejrd@mercury.elektranox.org>
 <20230616121345.2501c36a@xps-13>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kjfhvwbeq6z6hchc"
Content-Disposition: inline
In-Reply-To: <20230616121345.2501c36a@xps-13>
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
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kjfhvwbeq6z6hchc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 16, 2023 at 12:13:45PM +0200, Miquel Raynal wrote:
> sre@kernel.org wrote on Thu, 15 Jun 2023 01:27:24 +0200:
> > On Sat, Jun 10, 2023 at 10:45:25PM +0200, Sam Ravnborg wrote:
> > > On Fri, Jun 09, 2023 at 04:59:51PM +0200, Miquel Raynal wrote: =20
> > > > A very basic debugging rule when a device is connected for the first
> > > > time is to access a read-only register which contains known data in
> > > > order to ensure the communication protocol is properly working. This
> > > > driver lacked any read helper which is often a critical peace for
> > > > fastening bring-ups.
> > > >=20
> > > > Add a read helper and use it to verify the communication with the p=
anel
> > > > is working as soon as possible in order to fail early if this is no=
t the
> > > > case. =20
> > >=20
> > > The read helper seems like a log of general boiler plate code.
> > > I briefly looked into the use of regmap for the spi communication,
> > > but it did not look like it supported the bit9 stuff.
> > >=20
> > > I did not stare enough to add a reviewd by, but the approach is fine
> > > and it is good to detech issues early. =20
> >=20
> > The st7789v datasheet describes a setup where SPI is connected
> > unidirectional (i.e. without MISO). In that case the ID check
> > will fail.
>=20
> Right. I'll add a (spi->mode & SPI_NO_RX) check, as the default is to
> have both lines, if there is no MISO line, I'd expect it to be
> described in the DT, otherwise the description is broken.

Checking for SPI_NO_RX sounds good to me.

-- Sebastian

--kjfhvwbeq6z6hchc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmSMZa4ACgkQ2O7X88g7
+ppOzRAAl2oIV01cduJzEkjxg4QSNuwuCEG2J6aKFijHr3TPYwwSvhxvvC2p5JWG
a+wEi/9svpJ4CGS3atrwY7VJ6ZMaXxgHIAoylW/gvqxQFaLGNJdwbLJd7Wq5Q8bR
r4SHsK9DiKcClWBSqpIuAlq04gGK8wk8jVK903fhl2Clj6PHH/f/IRLrI6Ml3wJ+
87zHS1MNKhvu/zMTygHtLFqI59h4dKcsx52Vj0wUe0jiFs0rGP/xZITIRsIjGlov
KXsINofc/dg9sCI+Uw3So2TSC19CRU/aUCVU+/H4PU2/0NTAOY9uR6Csny+W0pQF
LHmDKkbp6+3PbJMAEP1t1Rhkm2/cdKscd9bQItno7+BbTDNPSAAch7/Z8cChfiRs
AcjKEjDXEVR8Mxns1j5IkXMtUslI/TlMylommDeW22iueqf6k53iiAVzMTvJzUaB
4wyuEYkRAEYpTIzdvY15gki5zjlY/1y7W2jCm8KVuYMB9cmP69GAI64coiv63Jjs
8Uj12MudJvKpOURjm5h+Q1+vCHWsGeVWgyKqqvRf6vZD2QOBy/X3LjMfmycajezQ
HGMyvK1iaQqAX7GAYElpkAtKtFnBUYASLOpy6ESo88SdV5rc+/prvRFrPTa8dVAQ
HnaW1sOUZkCFZLQnmZQ1jOSJbrP0Rq5GJvG+Eo/KRbiZWNuBksg=
=RgJZ
-----END PGP SIGNATURE-----

--kjfhvwbeq6z6hchc--
