Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BF580EA98
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 12:42:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF56210E1A8;
	Tue, 12 Dec 2023 11:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348F510E0D3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 11:42:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD18I-0005bB-Vy; Tue, 12 Dec 2023 12:41:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD18G-00FKJT-S1; Tue, 12 Dec 2023 12:41:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rD18G-001bBp-HP; Tue, 12 Dec 2023 12:41:00 +0100
Date: Tue, 12 Dec 2023 12:41:00 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sean Young <sean@mess.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v8 1/6] pwm: Rename pwm_apply_state() to
 pwm_apply_might_sleep()
Message-ID: <20231212114100.sn7nzntousql2ays@pengutronix.de>
References: <cover.1702369869.git.sean@mess.org>
 <9af7ba748fd2eb7e04208b6b183185f1daf78016.1702369869.git.sean@mess.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kqcylsquh2dgmtcq"
Content-Disposition: inline
In-Reply-To: <9af7ba748fd2eb7e04208b6b183185f1daf78016.1702369869.git.sean@mess.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Lee Jones <lee@kernel.org>,
 linux-input@vger.kernel.org,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kqcylsquh2dgmtcq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 08:34:00AM +0000, Sean Young wrote:
> In order to introduce a pwm api which can be used from atomic context,
> we will need two functions for applying pwm changes:
>=20
> 	int pwm_apply_might_sleep(struct pwm *, struct pwm_state *);
> 	int pwm_apply_atomic(struct pwm *, struct pwm_state *);
>=20
> This commit just deals with renaming pwm_apply_state(), a following
> commit will introduce the pwm_apply_atomic() function.
>=20
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Acked-by: Lee Jones <lee@kernel.org>
> Signed-off-by: Sean Young <sean@mess.org>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Several affected maintainers already acked, so I guess it's fine to take
this via the pwm tree. An Ack from the remaining maintainers would be
very welcome, an alternative would be to split the patch.

Missing Acks so far:

 - Jean Delvare / Guenter Roeck for drivers/hwmon/pwm-fan.c
 - Javier Martinez Canillas for drivers/gpu/drm/solomon/ssd130x.c
 - Liam Girdwood / Mark Brown for drivers/regulator/pwm-regulator.c
 - Helge Deller for drivers/video/fbdev/ssd1307fb.c

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kqcylsquh2dgmtcq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV4RssACgkQj4D7WH0S
/k4FvQgAhhnJ0gGDS9vNrkWmDYMBz0OOooFMMGBMTBk2URyQxiqdxXWCSQKX4pDP
4H/Hu+EbrEgXfRn0ANEzPIBDBGHQTo7W6N1NGpgxr8Bn1FoRwTzJMCbp62IGORar
Xr+m5fAJrOjprAETsdyrt8zzjkkJR8Rxg3Gs1bCjjaJGv9VND2ArWlOqwC+I1PWM
AYDVj/+/0wv8/rqAgNJbjPxdvlcfw/bnqy4/4Gs75Zn9qCRtODT3mCVtAKaWFSsh
/FMmxKBYIm9ZFhT4skjci6JscC3iWTtp/LeJnoTY2cOyMJePYeRFLT0Ys7+wlsWe
LCFShS20T2QYBWCYGmIIOHXHa7YwRQ==
=jAgf
-----END PGP SIGNATURE-----

--kqcylsquh2dgmtcq--
