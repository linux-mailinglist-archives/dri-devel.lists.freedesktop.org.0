Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2027F5AE6
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC1D10E6EF;
	Thu, 23 Nov 2023 09:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27E610E6EF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:17:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r65pm-0006Ka-3z; Thu, 23 Nov 2023 10:17:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r65pk-00B0Z3-7n; Thu, 23 Nov 2023 10:17:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r65pj-006VnS-U2; Thu, 23 Nov 2023 10:17:15 +0100
Date: Thu, 23 Nov 2023 10:17:15 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Doug Anderson <dianders@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v3 101/108] drm/bridge: ti-sn65dsi86: Make use of
 devm_pwmchip_alloc() function
Message-ID: <20231123091715.ywv6otvthlqagvny@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
 <20231121134901.208535-102-u.kleine-koenig@pengutronix.de>
 <CAD=FV=Vz7TuUH=U8t0XVhj5rzoci9KBjSZXJruMQyXiARY+Z_Q@mail.gmail.com>
 <20231121160514.feveiq2cyemwvqni@pengutronix.de>
 <CAD=FV=VK9Lz9dMFDETHyGLQRG6bWkOcF20TdnTd_jWr1u81NFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="644sqrlnnibvpbto"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VK9Lz9dMFDETHyGLQRG6bWkOcF20TdnTd_jWr1u81NFw@mail.gmail.com>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-pwm@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@pengutronix.de,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--644sqrlnnibvpbto
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Doug, hello Bjorn,

On Tue, Nov 21, 2023 at 08:14:14AM -0800, Doug Anderson wrote:
> On Tue, Nov 21, 2023 at 8:05=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Tue, Nov 21, 2023 at 07:15:51AM -0800, Doug Anderson wrote:
> > > > @@ -1585,22 +1586,28 @@ static const struct pwm_ops ti_sn_pwm_ops =
=3D {
> > > >  static int ti_sn_pwm_probe(struct auxiliary_device *adev,
> > > >                            const struct auxiliary_device_id *id)
> > > >  {
> > > > +       struct pwm_chip *chip;
> > > >         struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(adev->dev.pa=
rent);
> > > >
> > > > -       pdata->pchip.dev =3D pdata->dev;
> > > > -       pdata->pchip.ops =3D &ti_sn_pwm_ops;
> > > > -       pdata->pchip.npwm =3D 1;
> > > > -       pdata->pchip.of_xlate =3D of_pwm_single_xlate;
> > > > -       pdata->pchip.of_pwm_n_cells =3D 1;
> > > > +       /* XXX: should this better use adev->dev instead of pdata->=
dev? */
> > > > +       pdata->pchip =3D chip =3D devm_pwmchip_alloc(pdata->dev, 1,=
 sizeof(&pdata));
> > >
> > > Yes, it should be "adev->dev". See recent commits like commit
> > > 7b821db95140 ("drm/bridge: ti-sn65dsi86: Associate DSI device lifetime
> > > with auxiliary device").
> >
> > I'd do that in a separate commit and not change that hidden in patch
> > like this one. Agree? Then I'd keep that as is and not address this in
> > this series. Maybe it will take another cycle until this patch goes in
> > anyhow ...
>=20
> You could do it in a commit _before_ this one, but not a commit after
> this one. Specifically before "${SUBJECT}" commit I think it was
> benign to set pdata->pchip.dev to pdata->dev. Now you're starting to
> use it for devm and the incorrect lifetime is worse, I think. Do you
> agree?

I considered suggesting:

------>8------
=46rom 35e5050084737070686fc3e293e88e50276f0eeb Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Uwe=3D20Kleine-K=3DC3=3DB6nig?=3D <u.kleine-koenig@peng=
utronix.de>
Date: Thu, 23 Nov 2023 09:55:13 +0100
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Associate PWM device to auxiliary
 device

It's the ti_sn65dsi86.pwm auxiliary driver that creates the pwmchip, so
let the auxiliary device be the parent of the pwm device.
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge=
/ti-sn65dsi86.c
index c45c07840f64..b5d4c30c28b7 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1587,7 +1587,7 @@ static int ti_sn_pwm_probe(struct auxiliary_device *a=
dev,
 {
 	struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(adev->dev.parent);
=20
-	pdata->pchip.dev =3D pdata->dev;
+	pdata->pchip.dev =3D &adev->dev;
 	pdata->pchip.ops =3D &ti_sn_pwm_ops;
 	pdata->pchip.npwm =3D 1;
 	pdata->pchip.of_xlate =3D of_pwm_single_xlate;

base-commit: 815d8b0425ad1164e45953ac3d56a9f6f63792cc
------>8------

But I wonder if pwm lookup (e.g. in
arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts for &backlight) still
works then?

> > > I also think the size you're passing is technically wrong. The private
> > > data you're storing is a pointer to a "struct ti_sn65dsi86". The size
> > > of that is "sizeof(pdata)", not "sizeof(&pdata)".
> >
> > sizeof(*pdata)?
>=20
> No, that's also wrong. You're not storing a copy of the "struct
> ti_sn65dsi86", you're storing a pointer to "struct ti_sn65dsi86".
> That's "sizeof(pdata)".

You're right. I suggest making this simpler by adding=20

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge=
/ti-sn65dsi86.c
index 9200c41d48b6..35cf038595c8 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1370,10 +1370,14 @@ static void ti_sn_pwm_pin_release(struct ti_sn65dsi=
86 *pdata)
 	atomic_set(&pdata->pwm_pin_busy, 0);
 }
=20
+struct ti_sn_bridge_pwm_ddata {
+	struct ti_sn65dsi86 *pdata;
+};
+
 static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip *chip)
 {
-	struct ti_sn65dsi86 **pdata =3D pwmchip_priv(chip);
-	return *pdata;
+	struct ti_sn_bridge_pwm_ddata *ddata =3D pwmchip_priv(chip);
+	return ddata->pdata;
 }
=20
 static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
@@ -1587,14 +1591,16 @@ static int ti_sn_pwm_probe(struct auxiliary_device =
*adev,
 			   const struct auxiliary_device_id *id)
 {
 	struct pwm_chip *chip;
+	struct ti_sn_bridge_pwm_ddata *ddata;
 	struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(adev->dev.parent);
=20
 	/* XXX: should this better use adev->dev instead of pdata->dev? */
-	pdata->pchip =3D chip =3D devm_pwmchip_alloc(pdata->dev, 1, sizeof(*pdata=
));
+	pdata->pchip =3D chip =3D devm_pwmchip_alloc(pdata->dev, 1, sizeof(*ddata=
));
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);
=20
-	*(struct ti_sn65dsi86 **)pwmchip_priv(chip) =3D pdata;
+	ddata =3D pwmchip_priv(chip);
+	ddata->pdata =3D pdata;
=20
 	chip->ops =3D &ti_sn_pwm_ops;
 	chip->of_xlate =3D of_pwm_single_xlate;

to the patch.

Thanks for your feedback,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--644sqrlnnibvpbto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVfGJsACgkQj4D7WH0S
/k7Sogf+JJTANw2ZxFheauy1PMUBH0lo8S5NLdvIXTNrThzVMgB4YLK4IfbAZg70
EDaYhEbbYquuIH781Fvu3xL6PI13tHICkAlqGOlMU6Hn+p0bUzKq3NgbIvgFeqOs
Vdt+Q9x6VXpd0yF4nNHqJ4yod3J38KRkpEz2mPQHM7DKhOlX8izDNjm6IdgXlZLO
cIowKiU34XoP04lX9sOxflZDBO89yEBXIb5Qbd+eVspnrFUiStPuZ9vKal8Qoo0F
H3ATYHg2ZjF83D+oPiCUtwXLioNNh7Rp6kkOzPRiOgXDMbdm0FvqXIr2loxZdWih
0rhsuIDfuTXJX4wwajfz0EBTuwh/3A==
=bzDP
-----END PGP SIGNATURE-----

--644sqrlnnibvpbto--
