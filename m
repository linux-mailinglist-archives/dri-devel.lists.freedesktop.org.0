Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4EB7FBF90
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 17:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9A610E16A;
	Tue, 28 Nov 2023 16:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC78310E16A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 16:50:02 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r81HR-0004Ya-FO; Tue, 28 Nov 2023 17:49:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r81HP-00CDfJ-GR; Tue, 28 Nov 2023 17:49:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r81HP-00AHYB-6x; Tue, 28 Nov 2023 17:49:47 +0100
Date: Tue, 28 Nov 2023 17:49:47 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 16/16] drm/tilcdc: Convert to platform remove callback
 returning void
Message-ID: <20231128164947.3cukwog4uqua5w24@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
 <20231102165640.3307820-34-u.kleine-koenig@pengutronix.de>
 <788e0918-02d8-47c4-83c1-9e23d623f2b3@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w5acv4rjvxpkelaa"
Content-Disposition: inline
In-Reply-To: <788e0918-02d8-47c4-83c1-9e23d623f2b3@ideasonboard.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jyri Sarha <jyri.sarha@iki.fi>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--w5acv4rjvxpkelaa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 03, 2023 at 09:58:07AM +0200, Tomi Valkeinen wrote:
> On 02/11/2023 18:56, Uwe Kleine-K=F6nig wrote:
> > The .remove() callback for a platform driver returns an int which makes
> > many driver authors wrongly assume it's possible to do error handling by
> > returning an error code. However the value returned is (mostly) ignored
> > and this typically results in resource leaks. To improve here there is a
> > quest to make the remove callback return void. In the first step of this
> > quest all drivers are converted to .remove_new() which already returns
> > void.
> > [...]
>=20
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

This patch didn't make it into next yet. Who is responsible to pick this
up?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--w5acv4rjvxpkelaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVmGioACgkQj4D7WH0S
/k5qbwgAgn2Vvh+/Ld4QKUsAtyRBbf+SyRQbLc99V5qxKXJxNFPAgw2/y8SxRE8o
4aSwl7xBFnp3ydwWklk6MSKYJN+OMAWDCkfWmhM5IXq1OwJsUQtemAMAgqMml+Lo
S6tmLEXejI0V00G7r1iLZaoHREC+273pQGktrSD+HPhKT6WWXo6FpBc4//DLH3+V
xscJyYoMK9PUSS+EXfOvNUAxUMjDugfK3aogHNaXevX5QuII2QP8JZtV7d5+Zb6c
F7ZPCpmlr3dfhLsKxD3zWPL1AOFuS0mRb0vwjWCWQjhBlKX1hdHyAeaAmePx3shq
HNTT4fmE0SSAQW3u/LDzmSWt2q3rhg==
=88wS
-----END PGP SIGNATURE-----

--w5acv4rjvxpkelaa--
