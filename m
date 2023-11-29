Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 027BA7FD36C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 11:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4585610E41B;
	Wed, 29 Nov 2023 10:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA09610E41B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 10:00:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r8HMs-0006wu-DR; Wed, 29 Nov 2023 11:00:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r8HMq-00CNH0-FK; Wed, 29 Nov 2023 11:00:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r8HMq-00AkrZ-5e; Wed, 29 Nov 2023 11:00:28 +0100
Date: Wed, 29 Nov 2023 11:00:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/3] drm/bridge: ti-sn65dsi86: Some updates
Message-ID: <20231129100028.6nfenfnpvhfeter5@pengutronix.de>
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
 <b1fde098-edde-4c44-b73f-a429f5d62f8a@linaro.org>
 <20231129004533.GD8171@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7h4xss346h7hr234"
Content-Disposition: inline
In-Reply-To: <20231129004533.GD8171@pendragon.ideasonboard.com>
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
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7h4xss346h7hr234
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Laurent,

On Wed, Nov 29, 2023 at 02:45:33AM +0200, Laurent Pinchart wrote:
> On Fri, Nov 24, 2023 at 09:56:55AM +0100, Neil Armstrong wrote:
> > On 23/11/2023 18:54, Uwe Kleine-K=F6nig wrote:
> > > Hello,
> > >=20
> > > this is a series I created while starring at the ti-sn65dsi86 driver =
in
> > > the context of my pwm-lifetime series.
> > >=20
> > > The first patch should be fine. The last one has a few rough edges, b=
ut
> > > maybe you like the direction this is going to? The 2nd patch probably
> > > only makes sense if you also take the third.
> > >=20
> > > Best regards
> > > Uwe
> > >=20
> > > Uwe Kleine-K=F6nig (3):
> > >    drm/bridge: ti-sn65dsi86: Simplify using pm_runtime_resume_and_get=
()
> > >    drm/bridge: ti-sn65dsi86: Change parameters of
> > >      ti_sn65dsi86_{read,write}_u16
> > >    drm/bridge: ti-sn65dsi86: Loosen coupling of PWM to ti-sn65dsi86 c=
ore
> > >=20
> > >   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 146 +++++++++++++++--------=
---
> > >   1 file changed, 83 insertions(+), 63 deletions(-)
> > >=20
> > > base-commit: 4e87148f80d198ba5febcbcc969c6b9471099a09
> >=20
> > It looks fine to me, even without the goal to move the driver to driver=
s/pwm
> > I think it's same to move the pwm ddata out of the main pdata ans assoc=
iate
> > it to the pwm aux device lifetime.
> >=20
> > I don't anything wrong, and so far it's of for me, let's see if there's=
 comments
> > for other people before applying!
>=20
> I like 1/3 very much, but as mentioned in a reply to 3/3, I'm not
> convinced by that one at all.

OK, I also wasn't completely sure that patches #2 and #3 are a good
idea. The benefit I see is only better separation of the two drivers
(which is very subjective) and making the main driver struct a bit
smaller, saving some memory if the PWM isn't bound (which (maybe) saves
very little memory in some corner cases only).

> Not only does it make the driver more
> complex for, I believe, very little gain (if any), usage of
> devm_kzalloc() in ti_sn_pwm_probe() is most likely wrong.

It's not more wrong that the same construct in nearly every other pwm
driver. With my big life-time series for pwm[1] that idiom is fine.

Best regards
Uwe

[1] https://lore.kernel.org/linux-pwm/20231121134901.208535-1-u.kleine-koen=
ig@pengutronix.de

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7h4xss346h7hr234
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVnC7sACgkQj4D7WH0S
/k6NbQgAhSWqcgG25699n7spBhEC5RquDcprOasqPi7APEJcH58Y/8N6WVO4hcbJ
mOl9hQAEzBeWp77fxKqTqa8Larr56pzkB4ktbq2jo7R3Wy8kcO0LNo4X8jguj8PN
7Y6MYJqYwD88z+GWuFeNMfAeS1hnObvHARnp6GSjTU7qS3jdvHrs4w8kZvxsHnPW
JEch2j+gz4yNa/FH8PvtUgO8TYutFw3QsYgH8aNUOD5v2dlPvo3YUPUTjLQ7Phld
XkqjhJeoJuIH7Xnzi4t25rrOK/I5LFGd+6TgAQDx4xG01lTOxWLiVP6udMmSrhFl
M8PisDWf7JSady5cWEfGYmgI0BcuAw==
=LQJ6
-----END PGP SIGNATURE-----

--7h4xss346h7hr234--
