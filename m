Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6917F9CAC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 10:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110F810E210;
	Mon, 27 Nov 2023 09:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2964C10E210
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 09:33:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r7Xz6-0003V4-JK; Mon, 27 Nov 2023 10:32:56 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r7Xz4-00BuSQ-CC; Mon, 27 Nov 2023 10:32:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r7Xz4-009BX7-2D; Mon, 27 Nov 2023 10:32:54 +0100
Date: Mon, 27 Nov 2023 10:32:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Doug Anderson <dianders@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v3 101/108] drm/bridge: ti-sn65dsi86: Make use of
 devm_pwmchip_alloc() function
Message-ID: <20231127093253.wz4kf7nmvkvgt3ow@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
 <20231121134901.208535-102-u.kleine-koenig@pengutronix.de>
 <CAD=FV=Vz7TuUH=U8t0XVhj5rzoci9KBjSZXJruMQyXiARY+Z_Q@mail.gmail.com>
 <20231121160514.feveiq2cyemwvqni@pengutronix.de>
 <CAD=FV=VK9Lz9dMFDETHyGLQRG6bWkOcF20TdnTd_jWr1u81NFw@mail.gmail.com>
 <20231123091715.ywv6otvthlqagvny@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iwj3hs2zxfpxbnhz"
Content-Disposition: inline
In-Reply-To: <20231123091715.ywv6otvthlqagvny@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Maxime Ripard <mripard@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--iwj3hs2zxfpxbnhz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Nov 23, 2023 at 10:17:15AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Nov 21, 2023 at 08:14:14AM -0800, Doug Anderson wrote:
> > On Tue, Nov 21, 2023 at 8:05=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > > On Tue, Nov 21, 2023 at 07:15:51AM -0800, Doug Anderson wrote:
> > > > > @@ -1585,22 +1586,28 @@ static const struct pwm_ops ti_sn_pwm_ops=
 =3D {
> > > > >  static int ti_sn_pwm_probe(struct auxiliary_device *adev,
> > > > >                            const struct auxiliary_device_id *id)
> > > > >  {
> > > > > +       struct pwm_chip *chip;
> > > > >         struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(adev->dev.=
parent);
> > > > >
> > > > > -       pdata->pchip.dev =3D pdata->dev;
> > > > > -       pdata->pchip.ops =3D &ti_sn_pwm_ops;
> > > > > -       pdata->pchip.npwm =3D 1;
> > > > > -       pdata->pchip.of_xlate =3D of_pwm_single_xlate;
> > > > > -       pdata->pchip.of_pwm_n_cells =3D 1;
> > > > > +       /* XXX: should this better use adev->dev instead of pdata=
->dev? */
> > > > > +       pdata->pchip =3D chip =3D devm_pwmchip_alloc(pdata->dev, =
1, sizeof(&pdata));
> > > >
> > > > Yes, it should be "adev->dev". See recent commits like commit
> > > > 7b821db95140 ("drm/bridge: ti-sn65dsi86: Associate DSI device lifet=
ime
> > > > with auxiliary device").
> > >
> > > I'd do that in a separate commit and not change that hidden in patch
> > > like this one. Agree? Then I'd keep that as is and not address this in
> > > this series. Maybe it will take another cycle until this patch goes in
> > > anyhow ...
> >=20
> > You could do it in a commit _before_ this one, but not a commit after
> > this one. Specifically before "${SUBJECT}" commit I think it was
> > benign to set pdata->pchip.dev to pdata->dev. Now you're starting to
> > use it for devm and the incorrect lifetime is worse, I think. Do you
> > agree?
>=20
> I considered suggesting:
>=20
> ------>8------
> From 35e5050084737070686fc3e293e88e50276f0eeb Mon Sep 17 00:00:00 2001
> From: =3D?UTF-8?q?Uwe=3D20Kleine-K=3DC3=3DB6nig?=3D <u.kleine-koenig@peng=
utronix.de>
> Date: Thu, 23 Nov 2023 09:55:13 +0100
> Subject: [PATCH] drm/bridge: ti-sn65dsi86: Associate PWM device to auxili=
ary
>  device
>=20
> It's the ti_sn65dsi86.pwm auxiliary driver that creates the pwmchip, so
> let the auxiliary device be the parent of the pwm device.
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index c45c07840f64..b5d4c30c28b7 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1587,7 +1587,7 @@ static int ti_sn_pwm_probe(struct auxiliary_device =
*adev,
>  {
>  	struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(adev->dev.parent);
> =20
> -	pdata->pchip.dev =3D pdata->dev;
> +	pdata->pchip.dev =3D &adev->dev;
>  	pdata->pchip.ops =3D &ti_sn_pwm_ops;
>  	pdata->pchip.npwm =3D 1;
>  	pdata->pchip.of_xlate =3D of_pwm_single_xlate;
>=20
> base-commit: 815d8b0425ad1164e45953ac3d56a9f6f63792cc
> ------>8------
>=20
> But I wonder if pwm lookup (e.g. in
> arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts for &backlight) still
> works then?

I checked the source and I think it works fine because
ti_sn65dsi86_add_aux_device() calls
device_set_of_node_from_dev(&aux->dev, dev); and so the
auxiliary_device's of_node points to the node with the #pwm-cells
property. I'll send a proper patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--iwj3hs2zxfpxbnhz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVkYkUACgkQj4D7WH0S
/k5HOAgAiavlP6Cf0z9RNm6AMMC4AQrv14uK68V5AUS9u6hSFpQu0GXFQ3SCZT5v
qCaV6sJ7oMZ6XxPMpnbd+jY1LPA9KV4xdPVziusr0lx+5VIPIAQ35dxsUQ5ksrxJ
jUoaZKTzn93jUAvuJjaHDA5bnmjHPjO/MYh6d0BcA8SA55e1OCgsr7arvfpFLFjK
iTJb8wsJgtUMaTJy0jG7QKa9LFvEgYqq0BvcUM+LxsgBCrbp5daltsv76QuWraG3
TkQbMcYmt0H5TDKgNLaZtBLTVBELrFqLus2JCQs5UM3A8/wgm6cQ9DVIfMe2FPK3
zJNhdgYq9aL11hijfgv6/pL0cWYa7Q==
=aw2U
-----END PGP SIGNATURE-----

--iwj3hs2zxfpxbnhz--
