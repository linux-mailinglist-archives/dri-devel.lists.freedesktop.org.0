Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265DA7AE85A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 10:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7F610E376;
	Tue, 26 Sep 2023 08:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE31210E37B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:53:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ql3p4-0005wb-AJ; Tue, 26 Sep 2023 10:53:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ql3p3-00945a-Cn; Tue, 26 Sep 2023 10:53:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1ql3p3-004v36-3L; Tue, 26 Sep 2023 10:53:37 +0200
Date: Tue, 26 Sep 2023 10:53:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH v2] backlight: pwm_bl: Disable PWM on shutdown and suspend
Message-ID: <20230926085336.czgrztefbrstzbw7@pengutronix.de>
References: <20230926084612.2074692-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ro2xmibwou7jbzrx"
Content-Disposition: inline
In-Reply-To: <20230926084612.2074692-1-u.kleine-koenig@pengutronix.de>
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
Cc: Aisheng Dong <aisheng.dong@nxp.com>, linux-pwm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ro2xmibwou7jbzrx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 10:46:12AM +0200, Uwe Kleine-K=F6nig wrote:
> Since commit 00e7e698bff1 ("backlight: pwm_bl: Configure pwm only once
> per backlight toggle") calling pwm_backlight_power_off() doesn't disable
> the PWM any more. However this is necessary to suspend because PWM
> drivers usually refuse to suspend if they are still enabled.
>=20
> Also adapt shutdown to disable the PWM for similar reasons.
>=20
> Fixes: 00e7e698bff1 ("backlight: pwm_bl: Configure pwm only once per back=
light toggle")
> Reported-by: Aisheng Dong <aisheng.dong@nxp.com>
> Tested-by: Aisheng Dong <asheng.dong@nxp.com>

The two email addresses should actually be identical, the first one is
the right one. (Failure introduced by
https://lore.kernel.org/dri-devel/DB9PR04MB8477D4BBF1B31035789DA08680869@DB=
9PR04MB8477.eurprd04.prod.outlook.com
and picked up by b4.) Lee, can you fixup or should I resend?

Best regards
Uwe


--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ro2xmibwou7jbzrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUSnBAACgkQj4D7WH0S
/k7WRwf/dDvCWEj1/FZjZuftRTudNH5aYZhao+yFHsI9uQuvf/PLyPG3vfZA0Qk4
URqDl1t9VHxqXecZBVjn00ymGJWMckdlldfEHNeXZVkZEOc12mUmhvZO+IChSzjy
/ToNGWiPdExYacOsb4ik8yJd6T4Q8KqtHSl1oAQEpvHYuUZw1m58ZeYJe4AWCz6s
TawOMN6cLAVpnHZDWVn0IoaQ0v5BDg8gim85FQok1wCY8ClLh+JSTw2YeV3DDTMS
lSj6xRnU7VyzOZrkrU4EQnkrI8Cqg8hwAKLH5XWVes+1Cn2F7eAqxv7YmdVoC4UO
0pRys4XYeYpdAHI2rHefNPO/TclY3w==
=SNgM
-----END PGP SIGNATURE-----

--ro2xmibwou7jbzrx--
