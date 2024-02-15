Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22889855AFD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 08:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84D110E10A;
	Thu, 15 Feb 2024 07:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E52C10E20C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 07:03:08 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raVlw-0007bG-QF; Thu, 15 Feb 2024 08:03:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raVlt-000pjx-12; Thu, 15 Feb 2024 08:03:01 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raVls-005CTc-31;
 Thu, 15 Feb 2024 08:03:00 +0100
Date: Thu, 15 Feb 2024 08:03:00 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Doug Anderson <dianders@chromium.org>
Cc: linux-pwm@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 kernel@pengutronix.de
Subject: Re: [PATCH v6 152/164] drm/bridge: ti-sn65dsi86: Make use of
 pwmchip_parent() accessor
Message-ID: <qh7v3e76vo4s6su4mtd4qjvbi7egpvsbzzkrpdfnnxabjwv7bj@ccmkhauli22y>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
 <10a8d55110fc48a4759e65cc19556858587e94cc.1707900770.git.u.kleine-koenig@pengutronix.de>
 <CAD=FV=WkJOd6P4f=j0BHfm+ZeHnCtMBXALDWVeypdcirSTQp1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3f2smuqkxhhnd2ar"
Content-Disposition: inline
In-Reply-To: <CAD=FV=WkJOd6P4f=j0BHfm+ZeHnCtMBXALDWVeypdcirSTQp1A@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3f2smuqkxhhnd2ar
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Wed, Feb 14, 2024 at 12:44:23PM -0800, Doug Anderson wrote:
> On Wed, Feb 14, 2024 at 1:34=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > struct pwm_chip::dev is about to change. To not have to touch this
> > driver in the same commit as struct pwm_chip::dev, use the accessor
> > function provided for exactly this purpose.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> I don't see any differences from v5, so not sure why you didn't carry
> forward my Ack [1] on this one. Maybe because of the questions I
> asked? Your answers from v5 seemed fine to me. In any case:

Indeed, I should have kept the Ack. I cannot say why I dropped it,
something wrong on my end for sure as the patch ids match:

	$ v5=3D5ff5120f2b4ef6442a1d7c05916a772ec59a8c34.1706182805.git.u.kleine-ko=
enig@pengutronix.de
	$ v6=3D10a8d55110fc48a4759e65cc19556858587e94cc.1707900770.git.u.kleine-ko=
enig@pengutronix.de
	$ $ for v in $v5 $v6; do curl -s https://lore.kernel.org/all/$v/raw | git =
patch-id; done
	9b067a056fd203dd4b37d69b5aff202f42d970f1 000000000000000000000000000000000=
0000000
	9b067a056fd203dd4b37d69b5aff202f42d970f1 000000000000000000000000000000000=
0000000

Thanks for looking again, I readded your Ack,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3f2smuqkxhhnd2ar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXNtyQACgkQj4D7WH0S
/k7LOgf+LalSJ4kgtkodt3LBnGz7X8mok71tGyvCncZ7AQjODVlcAexOxQRtgu+H
gGa1p3Yx1fzM0bDuCj7JrT5H5RXAb6PWzhEfkh753FhoIgLV4OIGrj4ubWKw5RkN
Tt6NbDgYDYGslhQdqI93dO1LtFB2EH9/u389gsPL9vYSafi5WEWaaI/tHcaPfjXJ
vZObGRxMYDB0lzthH+GzeULv85F+p0HVmgPw0fxlipPrdm4KybqKwepnV9HBgl8v
ONfIfzk4Gy9FfVesRLhOFUXh592TAAUQFzQ+VTL1xugkkIufL6jMPXwsqNDi2Id5
rZek/B/WzJzN/x131JVpbgfQx5ySgQ==
=8oXR
-----END PGP SIGNATURE-----

--3f2smuqkxhhnd2ar--
