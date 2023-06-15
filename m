Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA4573195C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 14:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BA110E199;
	Thu, 15 Jun 2023 12:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DC810E199
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 12:58:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D12F6210F;
 Thu, 15 Jun 2023 12:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF66C433C0;
 Thu, 15 Jun 2023 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686833933;
 bh=ccxDZt57UBSH1sxdXOV0n93Dnuc15sNkgcTBE5CdvzE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TnMpG/53UVxwOXp8PCOuqXRMf6dMLbwFvlOVbowGBa9wEizJ0u7DceWbsPe8CaPrk
 Ikoo7o4VeU6TJTbLYBtw9F62/7c2LJqKB0axFAqZEsQzeplsOCigbfUZtCvI64W2aw
 f26KZ6doZ4qliKCmn6/44JnHWuhArDsXXaTDCgv2hed633Vtqx0pSEig6v6GFQak/o
 /k7q/1KU7pQ4QqKR6hh4LB8cepK1zhCqGs0fWRUvmQSSx/evpjekRaxP8oArQJ+V0S
 xNgyG3vcK81UbNqw6aL6l4JqlE2E8kAJN/+XiSIxswD96xIeidublOwgGWvlCERWSt
 8CAOZIkkiYz9A==
Received: by mercury (Postfix, from userid 1000)
 id A9D4610609DA; Thu, 15 Jun 2023 14:58:50 +0200 (CEST)
Date: Thu, 15 Jun 2023 14:58:50 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/7] drm/panel: sitronix-st7789v: Prevent core spi warnings
Message-ID: <20230615125850.cbqsmilwnpnabkta@mercury.elektranox.org>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-2-miquel.raynal@bootlin.com>
 <b4ae6e9c-b548-b1e3-42f9-e24aacaf2b38@wolfvision.net>
 <20230613085630.4a48fa8b@xps-13>
 <20230614232217.d7lf4l3y7oqmjisy@mercury.elektranox.org>
 <20230615054346.GA1537028@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w5ch2vgmwtmjx2xk"
Content-Disposition: inline
In-Reply-To: <20230615054346.GA1537028@ravnborg.org>
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
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--w5ch2vgmwtmjx2xk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Thu, Jun 15, 2023 at 07:43:46AM +0200, Sam Ravnborg wrote:
> On Thu, Jun 15, 2023 at 01:22:17AM +0200, Sebastian Reichel wrote:
> > > > May I point to you Sebastian Reichel's series that features a parti=
al
> > > > overlap with your work? [0]
> > >=20
> > > Woow. That driver has been untouched for years and now two
> > > contributions at the same time.
> >=20
> > Three actually. Michael also submitted a series :)
> >=20
> > > Sebastian, what is the current state of your series?
> >=20
> > The DT changes got Ack'd by Rob and I have the R-B from Michael
> > (minus a minor comment to make the panel struct 'static const').
> > It's mainly waiting for a review from Sam.
> >=20
> > I was a bit distracted by a boot regression on the devices and
> > some other projects. The boot regression got solved, so I can
> > prepare a new version if that makes things easier.
> >=20
> > > Shall I base my work on top of yours? Or is it still too
> > > premature and we shall instead try to merge both and contribute a new
> > > version of the series bringing support for the two panels?
> >=20
> > I suppose whatever is easier for Sam to review.
>=20
> Hi Sebastian.
>=20
> Too much panel stuff going on, so I miss the most and I am happy
> to see other people do a lot of good work here. Can i get a
> pointer to lore or so, then I will try to take a look.

Sure,=20

Michael Riesch already referenced it earlier in this thread:

[0] https://lore.kernel.org/dri-devel/20230422205012.2464933-1-sre@kernel.o=
rg/

Thanks for taking a look,

-- Sebastian

--w5ch2vgmwtmjx2xk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmSLCwMACgkQ2O7X88g7
+prCFA/+NhuQowxKUGtxGxCe/TCI7qwL3TxYz/Wg3ETAderx1cFkGoWk1M543V4n
vQJasNms5VPUBJFvTsp9n++02X1uY+Kk1Ps7XKvKSrjV24n/ORutcYZrhLKYX9oz
qOgmES22rQonRORkR0rRCg5IUTm4gOZBquciswvgaEalmi6yFimPorUrroJzTi7d
tTZ3TmKGsj4OLKS0BkiSi4uj9adYf+j3yvnJHJzg64NIWyjio90kDJpqr3sFRmMA
Slu9EDYoZfQvq5rv/AFxGvKf7X3FswN3YD7c+z7/pl3qRDxuiiGxWoUVOEhHhwNE
pauc8xOB8thOr5G6oICTvBiELG0+5ptSSxRRMTg1dZCT6PvwJMKtzG73s46winvZ
Fy4TlCjiLKfkJYz+OE0y8rxY+bsBy/cXoEorMHKj5ih/S1Z5IeCHybnwwMScibcb
KuaHSjNNAnOQrKIjbSWZJa5j+0Qjj9w/6+DkIm2DyePl6N4QarIDDgjCvf3zpTjH
NJ6lyp0/3p6KMEerEEaadxM+gRNyAZBwj+el8KTqsomDlXarmoCuqvGDXmUJE6HX
/WyKetCXWZoGLWJ1csj0Gxg54DoHF2aQiGCd6s/rQR7jq8scl4tZWJffQsnVNkzO
r5EKeVdrotlHZzuViu4TP7iyPUyG7W2+xgtlQs0i4SKVGrNqPlo=
=98k+
-----END PGP SIGNATURE-----

--w5ch2vgmwtmjx2xk--
