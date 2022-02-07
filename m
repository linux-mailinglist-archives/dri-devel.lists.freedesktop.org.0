Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445F04AB61A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 09:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0292A10E6B2;
	Mon,  7 Feb 2022 08:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4649B10E6B2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 08:01:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nGyxw-0003Oz-Pw; Mon, 07 Feb 2022 09:01:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nGyxo-00F3Bq-Ev; Mon, 07 Feb 2022 09:01:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nGyxn-00AMWQ-2y; Mon, 07 Feb 2022 09:01:31 +0100
Date: Mon, 7 Feb 2022 09:01:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] backlight: pwm_bl: Avoid open coded arithmetic in memory
 allocation
Message-ID: <20220207080128.xmvommcddjfgz7ey@pengutronix.de>
References: <bd3d74acfa58d59f6f5f81fc5a9fb409edb8d747.1644046817.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uk5prupw6c7p3eyw"
Content-Disposition: inline
In-Reply-To: <bd3d74acfa58d59f6f5f81fc5a9fb409edb8d747.1644046817.git.christophe.jaillet@wanadoo.fr>
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-fbdev@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uk5prupw6c7p3eyw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 05, 2022 at 08:40:48AM +0100, Christophe JAILLET wrote:
> kmalloc_array()/kcalloc() should be used to avoid potential overflow when
> a multiplication is needed to compute the size of the requested memory.
>=20
> So turn a kzalloc()+explicit size computation into an equivalent kcalloc(=
).
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

LGTM

Acked-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--uk5prupw6c7p3eyw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIA0dUACgkQwfwUeK3K
7Akisgf+KATEEZW9EvLtoWYOICsrIUedN6ABItVv/WiMhk+x+Eba9XEgyus6wzIc
/pEpQB/9sngfUC7oZDdM7xZVmAn2c7CZOoQzYQKAdusOeXUSLwD+5PMS1WYfjIoK
WGwZB6/Ghy/7TtpsljHKHei7DdwMsTz4l5N3e0pdjqpk106LPmcNXAL9QwmQzWKU
IHkz9zPH+2KS0XtB4/kgHfCL8hz+gBMyCnC8spbzs1gGdXsqaldoAQmCFOPDxVTf
V+3qfJITYq3tbUDjQpSHVMjJlhrg2CBbicAa0IYZHOGtsoQn+nGkmF5pA7TRX0m4
aEiCFiUcqsd4F3sKg+tZMD8bJMMbSA==
=iwgW
-----END PGP SIGNATURE-----

--uk5prupw6c7p3eyw--
