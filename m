Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8102616F923
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9197F6E1E6;
	Wed, 26 Feb 2020 08:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907326EB3A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 16:11:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CA24AACB8;
 Tue, 25 Feb 2020 16:11:35 +0000 (UTC)
Message-ID: <f7d43591965dd9c5aed7af194709e15f68f63d3d.camel@suse.de>
Subject: Re: [PATCH 09/89] clk: bcm: rpi: Use clk_hw_register for pllb_arm
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>
Date: Tue, 25 Feb 2020 17:11:34 +0100
In-Reply-To: <1c47c839fda93460994d37b4c851d805a3282d5f.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <1c47c839fda93460994d37b4c851d805a3282d5f.1582533919.git-series.maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============2077866774=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2077866774==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-WxIH33aUvejlhlKylEgn"


--=-WxIH33aUvejlhlKylEgn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-02-24 at 10:06 +0100, Maxime Ripard wrote:
> The pllb_arm clock is defined as a fixed factor clock with the pllb clock
> as a parent. However, all its configuration is entirely static, and thus =
we
> don't really need to call clk_hw_register_fixed_factor but can simply cal=
l
> clk_hw_register with a static clk_fixed_factor structure.
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Thanks!
Nicolas


--=-WxIH33aUvejlhlKylEgn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5VRzYACgkQlfZmHno8
x/47yggAt8HYPSSAwxIpPsTANQ5MOmHcSrWHPtoeQ9a34zlBUUytK4V4bHUW0oXO
W1GOccGSIUHjMHxIZxvOQtiTPgQH56S9SwygQc46T1w+wk/PbuWbBIp7PD71ff1t
JM80+4P+PUb/DU45sjzNlJ7pjVf1u5TrSjcSyZsTKgvDBH871y/+bQhv2vyvCD50
tpnI/h4TdEg4J3xJjXGqqlKHJGUL9QzWUid4iUDzrWJUedsERifPTNTWGtHGuJrJ
sULf1ByFTAgzjY9rY9ss+uP1lQVcspatnr8aqU9H1Zs+fBzN4f7eLnbdC3vM9SBq
96EoI2KTjpdggc67GD/da+kMBmYCHg==
=UyQW
-----END PGP SIGNATURE-----

--=-WxIH33aUvejlhlKylEgn--


--===============2077866774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2077866774==--

