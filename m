Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9038616F906
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A856E187;
	Wed, 26 Feb 2020 08:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762936EB3A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 16:17:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 290E6B1AE;
 Tue, 25 Feb 2020 16:17:51 +0000 (UTC)
Message-ID: <343bf33c29e640241d1ca64f67b05af6d0a0bb43.camel@suse.de>
Subject: Re: [PATCH 13/89] clk: bcm: rpi: Switch to clk_hw_register_clkdev
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>
Date: Tue, 25 Feb 2020 17:17:48 +0100
In-Reply-To: <75dd8f658a253649c176509f0d8d3dd10354ce51.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <75dd8f658a253649c176509f0d8d3dd10354ce51.1582533919.git-series.maxime@cerno.tech>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1053678427=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1053678427==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-AEsyYIEmDz/ZPvq2SNJG"


--=-AEsyYIEmDz/ZPvq2SNJG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-02-24 at 10:06 +0100, Maxime Ripard wrote:
> Since we don't care about retrieving the clk_lookup structure pointer
> returned by clkdev_hw_create, we can just use the clk_hw_register_clkdev
> function.
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Thanks!
Nicolas


--=-AEsyYIEmDz/ZPvq2SNJG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5VSKwACgkQlfZmHno8
x/6pGAf/RhH46fsKWEbXOnAY4VW48kY55Oo5HIdgFz30Cf1FEHGSIbvJ5ybQk47Y
T2YNRaoxvcqqYAmOT6nB4LVHUE3HDBt4qWC/yNF7R0vfpVMCCAymZ63hDODXmn7R
kdfhBPmuUsEkJr6hxW3KzqjRjBoEt1KwRdj+Y7UMF/ufb6nt8rSiRtwX6oa7yomn
L+gIpiZY/Cz6Z3ALHkbyfIwrAeXNsoXCle8bFAVa5MENX0hlUc+NdbfYOn40Zm5f
SVl46yPakAdj0LUVEyUDzsaWESwRJfT8NHgz/4OWSnzqsrJ9zsfWvjyfqgJn1LrD
vtIuk4MlrJ50e8tCyoFLOTrEqWUgEA==
=uZJp
-----END PGP SIGNATURE-----

--=-AEsyYIEmDz/ZPvq2SNJG--


--===============1053678427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1053678427==--

