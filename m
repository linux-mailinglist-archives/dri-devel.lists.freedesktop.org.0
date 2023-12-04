Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5CE803B17
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 18:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC0610E38F;
	Mon,  4 Dec 2023 17:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625A810E38F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 17:05:08 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rACNO-0006PN-QJ; Mon, 04 Dec 2023 18:04:58 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rACNM-00DYo1-TV; Mon, 04 Dec 2023 18:04:56 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rACNM-00EB9g-Jz; Mon, 04 Dec 2023 18:04:56 +0100
Date: Mon, 4 Dec 2023 18:04:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: sarha@kapsi.fi
Subject: Re: [PATCH v3 16/16] drm/tilcdc: Convert to platform remove callback
 returning void
Message-ID: <20231204170456.p4qrxg7jurun6txy@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
 <20231102165640.3307820-34-u.kleine-koenig@pengutronix.de>
 <788e0918-02d8-47c4-83c1-9e23d623f2b3@ideasonboard.com>
 <7829c53bd17db3a1142e9b84a900e60d2855a7fa@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vrqymo73zwrxgh62"
Content-Disposition: inline
In-Reply-To: <7829c53bd17db3a1142e9b84a900e60d2855a7fa@kapsi.fi>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jyri Sarha <jyri.sarha@iki.fi>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vrqymo73zwrxgh62
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 07:54:31PM +0000, sarha@kapsi.fi wrote:
> November 28, 2023 at 6:49 PM, "Uwe Kleine-K=F6nig" <u.kleine-koenig@pengu=
tronix.de mailto:u.kleine-koenig@pengutronix.de?to=3D%22Uwe%20Kleine-K%C3%B=
6nig%22%20%3Cu.kleine-koenig%40pengutronix.de%3E > wrote:
>=20
> >=20
> > On Fri, Nov 03, 2023 at 09:58:07AM +0200, Tomi Valkeinen wrote:
> >=20
> > >=20
> > > On 02/11/2023 18:56, Uwe Kleine-K=F6nig wrote:
> > > The .remove() callback for a platform driver returns an int which mak=
es
> > > many driver authors wrongly assume it's possible to do error handling=
 by
> > > returning an error code. However the value returned is (mostly) ignor=
ed
> > > and this typically results in resource leaks. To improve here there i=
s a
> > > quest to make the remove callback return void. In the first step of t=
his
> > > quest all drivers are converted to .remove_new() which already returns
> > > void.
> > > [...]
> > >=20
> > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > >=20
> >=20
> > This patch didn't make it into next yet. Who is responsible to pick this
> > up?
> >=20
>=20
> I expected the whole series had been applied at once. But yes, I can appl=
y this patch.

Thanks.

Thomas wrote in
https://lore.kernel.org/dri-devel/250b5d51-93f8-4d8c-8507-0c47adbf7237@suse=
=2Ede:

	Except for patches 8 and 16, I've pushed this patchset into drm-misc-next.

=2E I understand he skipped patch 8, but for patch 16 I guess that's just
an oversight.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vrqymo73zwrxgh62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVuBrcACgkQj4D7WH0S
/k6tWAgAhyCIYrCAVcZkYptXZvLY/sTYNVJROdWmRYeTT/HZwgT/fYKii/pIektR
kghmKz6dCCKYwFhzJpTdPturIJQwoBALrrYNcjpyfYtNDLpCbeSbbzsKau/G6G1u
NeyVMKP64m/qQMFc1d+4hWqPh2LIfqS7TNu3A8sMzRkZH3c2jrbUy9FaBVefaFhl
hGdypM61o92iZ2xGZh4r+FXnlhqRnMspQZmvmvQeMo9Xo9s2++JEk3NGpweb8hSA
Xmv53NO2jMM8SuqlqIbUez9K/fygAYgt6sv3M7jM/a4bur5qDvJ7pfuLIQX9CEZ7
4fq6sJRpQIOjAJKzMPNABddVnQWiNA==
=HXhs
-----END PGP SIGNATURE-----

--vrqymo73zwrxgh62--
