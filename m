Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78D66FA101
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 09:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406DB10E084;
	Mon,  8 May 2023 07:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D4F10E084
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 07:28:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvvIh-0008OP-Qa; Mon, 08 May 2023 09:28:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvvIg-001w70-3z; Mon, 08 May 2023 09:28:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvvIf-002KpC-93; Mon, 08 May 2023 09:28:49 +0200
Date: Mon, 8 May 2023 09:28:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 48/53] drm/tiny: Convert to platform remove callback
 returning void
Message-ID: <20230508072849.x3h3gxxi4tu7devm@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-49-u.kleine-koenig@pengutronix.de>
 <61e936c4-6e24-4ea5-03b5-942821a30fa3@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v3gmy66ozwubjoco"
Content-Disposition: inline
In-Reply-To: <61e936c4-6e24-4ea5-03b5-942821a30fa3@suse.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: kernel@pengutronix.de, Alexey Brodkin <abrodkin@synopsys.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--v3gmy66ozwubjoco
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2023 at 09:03:30AM +0200, Thomas Zimmermann wrote:
> Hi,
>=20
> the subject line is a bit ugly. You may want to change the it to say eith=
er
> 'drm/tiny/arcgpu' or just 'drm/arcgpu'. Same for the other tiny/-related
> patches.

Oh, indeed non-optimal. There is this patch touching arcpgu and the next
touching ofdrm + simpledrm; both have the same commit log.

The obvious possibilities are: Squash them together and keep "drm/tiny"
as prefix, or split in three and use "drm/arcpgu", "drm/ofdrm" and
"drm/simpledrm" as prefix respectively (with or without "tiny/"). If I
don't hear back about this, I'll go for splitting and no "tiny/" (which
seems to be the more common one in the past).

Best regards and thanks for your feedback,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--v3gmy66ozwubjoco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRYpLAACgkQj4D7WH0S
/k6HKgf/dbQ+Pbqr/hsvhldI4iv3dSfMbN5CBaklevnGxx9uu8UJ1t0Tqe44QQOs
OVXiYVzbKfHCqVOgD5wVc6p+iIKi3ZSwY2JDN/ixLaoB9c1w2Q2lucqYtcIHmrCw
LH1gYKPmkOFDm6YH6bFG/dUynHW3/DjADrRLQkkEJ2XBL9z9O+Wva5pqoBqbJxF5
JZNwj+GHQZh11MA2iJf8olbPKBl6S25Zy2euJ13EXectQgp7OCaLelMxLKLQ9kCl
ykFn+PhMzUBytEEOmr2nrduUJYkhyQgW5aOBD1sPmBLt+EW4Hyl6Clq4LmHtu4oa
1I+BJCTyEE/NfoAnhOc8wE1kuUK8jg==
=a7RM
-----END PGP SIGNATURE-----

--v3gmy66ozwubjoco--
