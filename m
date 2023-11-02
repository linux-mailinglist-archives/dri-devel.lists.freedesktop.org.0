Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B201A7DF84E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 18:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CA010E950;
	Thu,  2 Nov 2023 17:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68ADA10E950
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 17:05:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb8k-0005yf-TP; Thu, 02 Nov 2023 18:05:54 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb8k-0067JM-78; Thu, 02 Nov 2023 18:05:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qyb8j-00Bjue-UE; Thu, 02 Nov 2023 18:05:53 +0100
Date: Thu, 2 Nov 2023 18:05:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 07/16] drm/etnaviv: Convert to platform remove
 callback returning void
Message-ID: <20231102170553.kbisn27fcrtkriyj@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
 <20231102165640.3307820-25-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iqlls336rpe34npl"
Content-Disposition: inline
In-Reply-To: <20231102165640.3307820-25-u.kleine-koenig@pengutronix.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Christian Gmeiner <christian.gmeiner@gmail.com>, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--iqlls336rpe34npl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Nov 02, 2023 at 05:56:48PM +0100, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert the etnaviv drm driver from always returning zero in
> the remove callback to the void returning variant.
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I failed to pick up the tag

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

that this patch got in v2 at https://lore.kernel.org/dri-devel/CAH9NwWdzVPr=
ZD3Uo04fWXR0Cv=3DokK+P+njAR81gprCxKqp5icw@mail.gmail.com

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--iqlls336rpe34npl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVD1vEACgkQj4D7WH0S
/k6/NggApCOipv//K76A/vhQFXTYOKM4Cf1Afeg8xCd7DbM2Ht3brjrFQ9Oacoru
/+ZgdUGKroNl0noC8NN49lconxvWCAnL7OuvY5wM/ihJvRlF17VJpLEPEQB9+dg4
3Q3vYJRfbI/Vdfb0FzI8uB0nIVNMn1XtJei/g+eHdNxo+3BArGw4WNRlt6Ft9nK9
UKzg60OvqS0GbqrSYeZkZqLO71SgMR8R4+0Vlo58vX3JIXQxbXgYX+6vkx+RfPAT
rIKqq8sBOF+b1wvO5evyNWXz7gJXGtyPMxy5SIfagUp6hTwNBGE6xRrlp1wnHG9T
yR1h1KvwqTGRcr07NfRAVwsHpyYs/A==
=i/fR
-----END PGP SIGNATURE-----

--iqlls336rpe34npl--
