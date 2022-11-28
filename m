Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC7163ADF8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 17:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A9A10E2F3;
	Mon, 28 Nov 2022 16:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7075710E2F3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 16:39:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ozhAZ-0006Vm-1K; Mon, 28 Nov 2022 17:39:47 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ozhAW-000sfQ-O7; Mon, 28 Nov 2022 17:39:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ozhAW-0010uK-OG; Mon, 28 Nov 2022 17:39:44 +0100
Date: Mon, 28 Nov 2022 17:39:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm: Only select I2C_ALGOBIT for drivers that
 actually need it
Message-ID: <20221128163944.l6xtzlnytj3dxckv@pengutronix.de>
References: <20220912091505.149423-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="guyvdswikc57lpd5"
Content-Disposition: inline
In-Reply-To: <20220912091505.149423-1-u.kleine-koenig@pengutronix.de>
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--guyvdswikc57lpd5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 12, 2022 at 11:15:05AM +0200, Uwe Kleine-K=F6nig wrote:
> While working on a drm driver that doesn't need the i2c algobit stuff I
> noticed that DRM selects this code even tough only 8 drivers actually use
> it. While also only some drivers use i2c, keep the select for I2C for the
> next cleanup patch. Still prepare this already by also selecting I2C for
> the individual drivers.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

ping! Is there anything I do wrong to not get any attention here?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--guyvdswikc57lpd5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOE5E0ACgkQwfwUeK3K
7AnyGwf/fC3bEniJMPRUE3P18qlBrBUiUxt9yjA5hk2ZiWZHbtbAJO3gfTCaDVQx
xrDtmX/3FMX4TYPynhiEgAzJtiNKAT7/Cjfdx5V+eWpJgxIILVbOoqgicicBwkQ/
o6REu2wR7f+AoAI3kQTOZ8iHT+RWDc0UAtBMMGtF63KYKhVRMbxvk6WF86Af+yy5
01Dpa6z0niXRhTGpU4m1dMA9Fr6efT6P58H9AP3usaHKFs1XvtDyCckFJ45r5NSr
3eBJsCxuCXMJawejfS9cZGfpKNgs3VI2l6Gp838KxmtTkNNYrU4uXjOP2gC2wRD2
GxyDdodiQVxUhcssAQ6deYKUJpX0Uw==
=gzqB
-----END PGP SIGNATURE-----

--guyvdswikc57lpd5--
