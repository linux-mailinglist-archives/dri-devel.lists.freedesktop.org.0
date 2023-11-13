Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20187EA57D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 22:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD25F10E419;
	Mon, 13 Nov 2023 21:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8A610E419
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 21:28:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r2eTZ-0006K4-SL; Mon, 13 Nov 2023 22:28:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r2eTV-008qY8-9X; Mon, 13 Nov 2023 22:28:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r2eTU-0015Of-Vv; Mon, 13 Nov 2023 22:28:05 +0100
Date: Mon, 13 Nov 2023 22:28:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jilin Yuan <yuanjilin@cdjrlc.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/3] pwm: Drop useless member "pwm" from struct pwm_device
Message-ID: <20231113212801.v4nh6njrog5q2hxe@pengutronix.de>
References: <20230728145824.616687-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6j3bhefnu7emb5lk"
Content-Disposition: inline
In-Reply-To: <20230728145824.616687-1-u.kleine-koenig@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6j3bhefnu7emb5lk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jul 28, 2023 at 04:58:21PM +0200, Uwe Kleine-K=F6nig wrote:
> there are only two users of struct pwm_device::pwm in the tree; both use
> it for some dev_dbg output. While this number allows to identify the
> PWM, it's not trivial, for example the data currently available in
> /sys/kernel/debug/pwm isn't enough. (You have to look in /sys/class/pwm,
> pick the pwmchip with the highest number that isn't bigger than the
> PWM's number.)
>=20
> To be honest the label isn't always usefull either, but it's easy to use
> and should be enough to identify the used PWM. The parent device + hwid
> might be more useful?! On the other hand using that for a dev_dbg that
> is probably only looked at by someone debugging the driver and thus
> knowing the used PWM anyhow is of little value either.
>=20
> Assuming this change is still considered worthwile I suggest that patches=
 #1
> and #2 go in via their respective maintainer trees and I resend patch #3 =
to go
> via the pwm tree once these two are "in".
>=20
> Best regards
> Uwe
>=20
> Uwe Kleine-K=F6nig (3):
>   drm/ssd130x: Print the PWM's label instead of its number
>   video: fbdev: ssd1307fb: Print the PWM's label instead of its number
>   pwm: Drop unused member "pwm" from struct pwm_device

The two patches to stop making use of struct pwm_device::pwm are now in
Linus's tree (as of v6.7-rc1). The third patch is still "new" in
patchwork, so I don't resend.

It's great if patch #3 goes in during the next merge window.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6j3bhefnu7emb5lk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVSlOEACgkQj4D7WH0S
/k7u7AgAg4xtAcglUYH0v23q8qHBO4gYPTdvMPn/Oao+/72FDmpW7/Q9wT9kaMfh
6K/ZhDJiOQ/9p3ek+P8uUKl8g5JdFEH0+luqF5QIOg2iwH//uu0UppmkEBprmNg+
pWTJUxUsD13AuyquMp0yIqLT3hsEzh9N/803NWp/98kXxMOLjvGNYLKZFsH6KKkl
er2+4/XxV1oyq/an4DlTIjIAO9pQr3G14gb9AUdT/UGmkzipqTNHBaiA8ykOPjGO
tcgfXBDi9OM56y6R8syM6c0iP6GQSlY3y4Hqk3jfZ3hKF2Q/C5bdsyosRTet/Dmg
FrwZ/snIa4f2oQV6Bd+rpYjwetsegA==
=YvtS
-----END PGP SIGNATURE-----

--6j3bhefnu7emb5lk--
