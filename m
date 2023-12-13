Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 914EF810BB3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 08:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8511010E083;
	Wed, 13 Dec 2023 07:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D8510E083
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 07:43:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rDJtY-0004Gd-0a; Wed, 13 Dec 2023 08:43:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rDJtU-00FWLL-P0; Wed, 13 Dec 2023 08:43:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rDJtU-002ABM-E7; Wed, 13 Dec 2023 08:43:00 +0100
Date: Wed, 13 Dec 2023 08:43:00 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Message-ID: <20231213074300.4bq7wkfqd4jhhcr4@pengutronix.de>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kisx23oblvlyq6g2"
Content-Disposition: inline
In-Reply-To: <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-arm-kernel@lists.infradead.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de, linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Johan Hovold <johan+linaro@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Georgi Djakov <djakov@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kisx23oblvlyq6g2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Maxime,

On Wed, Dec 13, 2023 at 08:16:04AM +0100, Maxime Ripard wrote:
> On Tue, Dec 12, 2023 at 06:26:37PM +0100, Uwe Kleine-K=F6nig wrote:
> > clk_rate_exclusive_get() returns zero unconditionally. Most users "know"
> > that and don't check the return value. This series fixes the four users
> > that do error checking on the returned value and then makes function
> > return void.
> >=20
> > Given that the changes to the drivers are simple and so merge conflicts
> > (if any) should be easy to handle, I suggest to merge this complete
> > series via the clk tree.
>=20
> I don't think it's the right way to go about it.
>=20
> clk_rate_exclusive_get() should be expected to fail. For example if
> there's another user getting an exclusive rate on the same clock.
>=20
> If we're not checking for it right now, then it should probably be
> fixed, but the callers checking for the error are right to do so if they
> rely on an exclusive rate. It's the ones that don't that should be
> modified.

If some other consumer has already "locked" a clock that I call
clk_rate_exclusive_get() for, this isn't an error. In my bubble I call
this function because I don't want the rate to change e.g. because I
setup some registers in the consuming device to provide a fixed UART
baud rate or i2c bus frequency (and that works as expected). In this
case I won't be able to change the rate of the clock, but that is
signalled by clk_set_rate() failing (iff and when I need awother rate)
which also seems the right place to fail to me.

It's like that since clk_rate_exclusive_get() was introduced in 2017
(commit 55e9b8b7b806ec3f9a8817e13596682a5981c19c).

BTW, I just noticed that my assertion "Most users \"know\" that
[clk_rate_exclusive_get() returns zero unconditionally]" is wrong. As of
next-20231213 there are 3 callers ignoring the return value of
clk_rate_exclusive_get() and 4 that handle (imaginary) returned errors.
I expected this function to be used more extensively. (In fact I think
it should be used more as several drivers rely on the clk rate not
changing.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kisx23oblvlyq6g2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV5YIMACgkQj4D7WH0S
/k7/RggAjp1m69DfJuvZJPTz1BVN/QlcAYFKE67kz4Lu/Vi8sPzVy1FXzAAykl2u
Q7T74qF7Vldxi+bO7DXnFWZ2VHr2x+sLPrXGLe/88Utp2wTY7MOhc7V1HdRMPE1v
wrwLKcLJMUrrHtCCr++moQSXMriYDcAI/bbfNfSZyVlM+J5NM6p+Cpbh34CqGpoT
5uC+HCwX3YDR1Tb17muwRNq+mUOy3kcmvcYwJEaVn33oIkL8e8wjGu5pdS14Jc1y
+eOosCPjbshViy380fMM3E5EY+mLR7xBux0GyNpiXzdKlSbtFptF+nVwgB7u6FgF
+PM61W3oCo4oQRqlCO74T0dDOoV9yA==
=Ss4M
-----END PGP SIGNATURE-----

--kisx23oblvlyq6g2--
