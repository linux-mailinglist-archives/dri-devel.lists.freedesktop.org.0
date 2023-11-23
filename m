Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 418517F5BF9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 11:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD1D10E714;
	Thu, 23 Nov 2023 10:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A3410E714
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 10:10:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r66f6-0006pw-FM; Thu, 23 Nov 2023 11:10:20 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r66f4-00B0kL-Pg; Thu, 23 Nov 2023 11:10:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r66f4-006YOP-G5; Thu, 23 Nov 2023 11:10:18 +0100
Date: Thu, 23 Nov 2023 11:10:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 101/108] drm/bridge: ti-sn65dsi86: Make use of
 devm_pwmchip_alloc() function
Message-ID: <20231123101018.u6c6nymmkam5ltir@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
 <20231121134901.208535-102-u.kleine-koenig@pengutronix.de>
 <20231123094652.GH15697@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m7basmppiqka5heb"
Content-Disposition: inline
In-Reply-To: <20231123094652.GH15697@pendragon.ideasonboard.com>
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
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-pwm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--m7basmppiqka5heb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Laurent,

On Thu, Nov 23, 2023 at 11:46:52AM +0200, Laurent Pinchart wrote:
> (CC'ing Bartosz)

I'm already in discussion with Bart :-)

> On Tue, Nov 21, 2023 at 02:50:43PM +0100, Uwe Kleine-K=F6nig wrote:
> > This prepares the pwm driver of the ti-sn65dsi86 to further changes of
> > the pwm core outlined in the commit introducing devm_pwmchip_alloc().
> > There is no intended semantical change and the driver should behave as
> > before.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 25 ++++++++++++++++---------
> >  1 file changed, 16 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/br=
idge/ti-sn65dsi86.c
> > index c45c07840f64..cd40530ffd71 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -197,7 +197,7 @@ struct ti_sn65dsi86 {
> >  	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
> >  #endif
> >  #if defined(CONFIG_PWM)
> > -	struct pwm_chip			pchip;
> > +	struct pwm_chip			*pchip;
>=20
> Dynamic allocation with devm_*() isn't the right solution for lifetime
> issues related to cdev. See my talk at LPC 2022
> (https://www.youtube.com/watch?v=3DkW8LHWlJPTU, slides at
> https://lpc.events/event/16/contributions/1227/attachments/1103/2115/2022=
0914-lpc-devm_kzalloc.pdf),
> and Bartosz's talk at LPC 2023
> (https://lpc.events/event/17/contributions/1627/attachments/1258/2725/Lin=
ux%20Plumbers%20Conference%202023.pdf).

Once the series is completely applied, the pwm_chip isn't allocated
using devm_kzalloc any more. You're only looking at an intermediate
state where I push the broken lifetime tracking from all drivers into a
single function in the core that is then fixed after all drivers are
converted to it.

If you find issues with the complete series applied, please tell me.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--m7basmppiqka5heb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVfJQkACgkQj4D7WH0S
/k5UBAf9Hx7Bo4lGarW2XdUD9TsnQJcmEETxGAcjdrs9FKRie0l4wxFjKljLyx1v
nzb81eJFS35tnvRtoNK9/EpZqmBRtyRSjrvZC6yxydcmwQ+IJGE9JRkF54qTGWop
SnbKCVu733TLmcfBdSBQQHeTu3McsQx0tVJEJvQxGn7a1EtoyDQfJrm0VNNb5dMg
FquLZyWJG6Kjy5s9ijmG26NVVaZeu5Mq//+ah4F0g6Pe/hDQWTyh539/rH1Lub1A
bRFWvyAn37q0bVieDUSw0MPaoD67acU7ohBqR7QIuD1aCCHiSquHgJIoIaWVZiVf
vsh19UgImk4ZPtRK0Bpx/9LjXfxjSQ==
=bRsh
-----END PGP SIGNATURE-----

--m7basmppiqka5heb--
