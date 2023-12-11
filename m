Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4184B80CE63
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 15:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3443910E102;
	Mon, 11 Dec 2023 14:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5E610E102
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 14:31:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rChJL-00005m-1a; Mon, 11 Dec 2023 15:31:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rChJG-00F7ct-Pw; Mon, 11 Dec 2023 15:31:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rChJG-000z2u-FK; Mon, 11 Dec 2023 15:31:02 +0100
Date: Mon, 11 Dec 2023 15:30:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sean Young <sean@mess.org>
Subject: Re: [PATCH v7 1/4] pwm: Rename pwm_apply_state() to
 pwm_apply_might_sleep()
Message-ID: <20231211143059.dggelgdwjnntx7kf@pengutronix.de>
References: <cover.1702282806.git.sean@mess.org>
 <f2762a5abc13be9ec05a45927bbd84e9da5bb41c.1702282807.git.sean@mess.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kkbvgfm75p6j7s2z"
Content-Disposition: inline
In-Reply-To: <f2762a5abc13be9ec05a45927bbd84e9da5bb41c.1702282807.git.sean@mess.org>
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-input@vger.kernel.org,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kkbvgfm75p6j7s2z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 08:24:52AM +0000, Sean Young wrote:
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

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kkbvgfm75p6j7s2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV3HSIACgkQj4D7WH0S
/k7bnAf/cRTO22nABcFvyIQZ3V56at9Cfad/B9139ZFHLXIV2KYhrRI/65AlFTP2
nO0TxvG6yhZVS24t9na92aLNJYXlpQpvKScNCEXaZgKg5IOxBn3FEkChVdv0OeQh
X5nEqz71490AGYDzpQwXckFxMGo8wFhMRU98Htb8tJcn6NNIcfS8kWRy6bmSly9y
enHFBwqZ+liARBITVl3+y5Qqr1RErOtO1SZl4wxJjDduSbJfvl0ZVjGhI646k6+G
+qBYmGe9YrWshP/Foo1PClhXj1dTQUucAnB0gc9fnczRvLOTy11dbHZ66NJLcfB+
wRvN6iZVO/dLcWu5WihPzL4de3xwLg==
=C1pU
-----END PGP SIGNATURE-----

--kkbvgfm75p6j7s2z--
