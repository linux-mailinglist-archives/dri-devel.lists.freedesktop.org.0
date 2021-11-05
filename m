Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB1844624B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 11:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756746E0F2;
	Fri,  5 Nov 2021 10:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC09E6E0F2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 10:40:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1miwdy-0006fX-CC; Fri, 05 Nov 2021 11:40:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1miwdw-0006uo-7K; Fri, 05 Nov 2021 11:40:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1miwdw-0002qU-5y; Fri, 05 Nov 2021 11:40:20 +0100
Date: Fri, 5 Nov 2021 11:40:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: =?utf-8?B?TWHDrXJh?= Canal <maira.canal@usp.br>
Subject: Re: [PATCH v6] backlight: lp855x: Switch to atomic PWM API
Message-ID: <20211105104017.65ysrdy5nzccfzmo@pengutronix.de>
References: <YYQfThRqabp4A7Dz@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ci2ykdunk5cwiced"
Content-Disposition: inline
In-Reply-To: <YYQfThRqabp4A7Dz@fedora>
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
Cc: linux-pwm@vger.kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com, lee.jones@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ci2ykdunk5cwiced
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Nov 04, 2021 at 02:58:38PM -0300, Ma=EDra Canal wrote:
> Remove legacy PWM interface (pwm_config, pwm_enable, pwm_disable) and
> replace it for the atomic PWM API.
>=20
> Signed-off-by: Ma=EDra Canal <maira.canal@usp.br>

LGTM,

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ci2ykdunk5cwiced
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGFCg4ACgkQwfwUeK3K
7AkWNQf/SKHSeiYd9w//qWXwmgc6r1QNVz5DIhFauWP9fpTyPfv4KUilZmt18t7E
iN+Z/4YSC+8LUj88zqTBYawZoE+DkluxSa5eVq6Uis3yynM5eEfVJVU4yyBdNJ+B
cEr3NAK0sLb49ZenYACy0MImHiDFSjTI7OPu/RBknIHsD2doU/N6kYbBI0ZxCPw/
OXbO7xH/4VMms11B+CLX6usMMh8e/yRGvVBN/y3OrjY2dY1Pl8yzKxV738slKkGi
w2Bn0Zb5pDN+fVJVUBK7mUAzp3MjA3t8QQL0L4TtJ6nvhpOWvqEGC8rVMeVfDebW
PwQqcIYSc3hRkYdQqaNkC6WwMWIfxg==
=ggPo
-----END PGP SIGNATURE-----

--ci2ykdunk5cwiced--
