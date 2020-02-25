Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11EB16F91F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AD76E201;
	Wed, 26 Feb 2020 08:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D35E6EB44
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 16:24:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CB7D8AD48;
 Tue, 25 Feb 2020 16:24:06 +0000 (UTC)
Message-ID: <b411e2a675dd1b2e688815fa3eb0bd3c7c86946d.camel@suse.de>
Subject: Re: [PATCH 15/89] clk: bcm: rpi: Create a data structure for the
 clocks
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>
Date: Tue, 25 Feb 2020 17:24:02 +0100
In-Reply-To: <adc5810f9ed6400940f36be6e0a3a7255c557687.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <adc5810f9ed6400940f36be6e0a3a7255c557687.1582533919.git-series.maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============1990013003=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1990013003==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-NxrkRqtfUvDY/OjkZYGj"


--=-NxrkRqtfUvDY/OjkZYGj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-02-24 at 10:06 +0100, Maxime Ripard wrote:
> So far the driver has really only been providing a single clock, and stor=
ed
> both the data associated to that clock in particular with the data
> associated to the "controller".
>=20
> Since we will change that in the future, let's decouple the clock data fr=
om
> the provider data.
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Thanks!
Nicolas


--=-NxrkRqtfUvDY/OjkZYGj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5VSiIACgkQlfZmHno8
x/67cQf9ElW7VnzLZaFV3c8EcEp/LDyKUov3/WaAU+cOAeaQeXhBsw6PuOhDYoe4
WBbwNikei9qvSn48Vq/kH00pkXvoHQsVY2BY4O7ImbuHTEyYkeIguWeAtVHLFv0m
sP35lY0G/MeI1MZkPO8NCCNXoQPvLqyVU65gnjAAsnEvpfKe2PCzbjmGp+E85Yov
oRxeevriB34mlrTDEIDQ2cxPvku3YO2yHyPqbq+1CLHjqJV4nK1JJq/b7vcTKbue
OkhCsNJb+ddOD4J7MMJGTdiZJrfO2tPe7PyFAEuaAK7ytHLy/G0S1kvBWW/e2+XV
jOLl9CnX6QQBZoLloLB+OplaQFqj5A==
=73tJ
-----END PGP SIGNATURE-----

--=-NxrkRqtfUvDY/OjkZYGj--


--===============1990013003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1990013003==--

