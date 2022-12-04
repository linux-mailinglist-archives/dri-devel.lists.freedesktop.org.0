Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22BD641FBF
	for <lists+dri-devel@lfdr.de>; Sun,  4 Dec 2022 22:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3A910E080;
	Sun,  4 Dec 2022 21:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5808710E080
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Dec 2022 21:09:55 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p1wFB-0004RS-M8; Sun, 04 Dec 2022 22:09:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p1wF7-002Jx8-0o; Sun, 04 Dec 2022 22:09:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p1wF6-002aLc-HD; Sun, 04 Dec 2022 22:09:44 +0100
Date: Sun, 4 Dec 2022 22:09:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v2 03/11] drm/bridge: ti-sn65dsi86: Propagate errors in
 .get_state() to the caller
Message-ID: <20221204210940.qygblu244zvlenxz@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ffdgr3lh3jt2gccb"
Content-Disposition: inline
In-Reply-To: <20221130152148.2769768-4-u.kleine-koenig@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ffdgr3lh3jt2gccb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

my initial Cc-list wasn't optimal. So I added a few people here.

On Wed, Nov 30, 2022 at 04:21:40PM +0100, Uwe Kleine-K=F6nig wrote:
> .get_state() can return an error indication. Make use of it to propagate
> failing hardware accesses.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 6826d2423ae9..9671071490d8 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1512,19 +1512,19 @@ static int ti_sn_pwm_get_state(struct pwm_chip *c=
hip, struct pwm_device *pwm,
> =20
>  	ret =3D regmap_read(pdata->regmap, SN_PWM_EN_INV_REG, &pwm_en_inv);
>  	if (ret)
> -		return 0;
> +		return ret;
> =20
>  	ret =3D ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &scale);
>  	if (ret)
> -		return 0;
> +		return ret;
> =20
>  	ret =3D ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlight);
>  	if (ret)
> -		return 0;
> +		return ret;
> =20
>  	ret =3D regmap_read(pdata->regmap, SN_PWM_PRE_DIV_REG, &pre_div);
>  	if (ret)
> -		return 0;
> +		return ret;
> =20
>  	state->enabled =3D FIELD_GET(SN_PWM_EN_MASK, pwm_en_inv);
>  	if (FIELD_GET(SN_PWM_INV_MASK, pwm_en_inv))

It would be great to get an Ack to take this patch and patch #1 via the
PWM tree. (Both got an Ack by Douglas Anderson, I'm unsure if that is
already enough.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ffdgr3lh3jt2gccb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmONDJEACgkQwfwUeK3K
7AmaHwf/TqMkHyfp2y3GS2SFv/Ok+udiQ/9AJyglRtUIIZHASsLvNIKL5IWMh67q
QVH8zgar5I+3BbGBoJ18Or4Rg2MvEJDdXH9aCOLxDQ7k/Ae6W4QVFgSALrFaW0ry
UO0+rNnJaRUUMt2b+2YPLGlsG41lIIJUfMKQ16bl6OaHyeoXrtPtTxs78gs1I8pE
hHPUuA19h06aHgz/zTONmK9+yy1LMkVSwUTceS0G5F9EHbKH625evGn3g1aQOLg+
LWO6gNobk08uIzOJSWVyArGY4Af9oZACEKszNHTUpQqZ7RmWzljNiP+YOfF5WPok
qorTtnBiZ7knJb5SCxhmH0lWHTTc/A==
=72Cr
-----END PGP SIGNATURE-----

--ffdgr3lh3jt2gccb--
