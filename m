Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E680483CDBF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 21:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FD010E33E;
	Thu, 25 Jan 2024 20:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED0D10E33E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 20:45:37 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rT6bO-0000cb-DM; Thu, 25 Jan 2024 21:45:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rT6bM-002MaM-I6; Thu, 25 Jan 2024 21:45:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rT6bM-00884U-1V;
 Thu, 25 Jan 2024 21:45:32 +0100
Date: Thu, 25 Jan 2024 21:45:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 037/111] drm/bridge: ti-sn65dsi86: Make use of
 pwmchip_parent() macro
Message-ID: <fsc44v7ej7rxx665zhv4cwkjvwomrc2l7ftaxmaz64xf4bmrd3@5piztmopbkjo>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <5ff5120f2b4ef6442a1d7c05916a772ec59a8c34.1706182805.git.u.kleine-koenig@pengutronix.de>
 <CAD=FV=VqPCbfTP86Wewf+-o9_v5oLsQUu1Dqb5EMLZZEsqGmRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rcofwwvse4ezlayv"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VqPCbfTP86Wewf+-o9_v5oLsQUu1Dqb5EMLZZEsqGmRw@mail.gmail.com>
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
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, kernel@pengutronix.de,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rcofwwvse4ezlayv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Doug,

On Thu, Jan 25, 2024 at 09:47:42AM -0800, Doug Anderson wrote:
> On Thu, Jan 25, 2024 at 4:11=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > struct pwm_chip::dev is about to change. To not have to touch this
> > driver in the same commit as struct pwm_chip::dev, use the macro
> > provided for exactly this purpose.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> This seems OK with me. Unless someone more senior in the drm-misc
> community contradicts me, feel free to take this through your tree.
>=20
> Acked-by: Douglas Anderson <dianders@chromium.org>

Thanks.
=20
> NOTE: though the patch seems OK to me, I have one small concern. If I
> understand correctly, your eventual goal is to add a separate "dev"
> for the PWM chip without further changes to the ti-sn65dsi86 driver.
> If that's true, you'll have to find some way to magically call
> devm_pm_runtime_enable() on the new "dev" since the code you have here
> is calling pm_runtime functions on what will eventually be this new
> "dev". Maybe you'll do something like enabling runtime PM on it
> automatically if its parent had runtime PM enabled?

The idea is that the pwmchip_parent macro always returns the pwmchip's
parent. So when this patch gets applied, we have

	+static inline struct device *pwmchip_parent(struct pwm_chip *chip)
	{
	       return chip->dev;
	}

and when the pwmchip gets its own struct device, it is adapted to return
chip->dev.parent (and not &chip->dev). See patches #3 and #109.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rcofwwvse4ezlayv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWyyGsACgkQj4D7WH0S
/k6o7AgAnsCiQ0+N575dR/KxpoPhQDum10GgDz2qB5Ahj2ScUIGjc7TuCrSMrgb1
ZhSWiKHwGfRJzvQJWkWZ99I2A8Oi1D8u6h0SQRGv9q8F6Badv9cFUbeWLhgMfwe8
WkbE/qyBKaVuUo8xpgqhynhtiMeKcHvLghaRJZA4weeR8fOF0BckC92la57sVRcY
Cfls3OxmvBPyG2xB4MbZux8o66UTAU1kfd7sgyN4eE9lUvTeV2wl9Y8hjG71Shwa
R+RC3bzMWlrMzK8VdAO7zlfvcvYyWmp6Oge7u5nA2WpFjHU1Yes4jJrEjATuNBKV
X5MvejjFqZalgciz2OrnQFTntoeliw==
=gqK3
-----END PGP SIGNATURE-----

--rcofwwvse4ezlayv--
