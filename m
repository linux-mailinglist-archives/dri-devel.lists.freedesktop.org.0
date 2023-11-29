Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D03B7FD33F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 10:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF39F10E3F3;
	Wed, 29 Nov 2023 09:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9483110E3F3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 09:51:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r8HEJ-0005df-KK; Wed, 29 Nov 2023 10:51:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r8HEH-00CNFl-Po; Wed, 29 Nov 2023 10:51:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r8HEH-00Akd7-GF; Wed, 29 Nov 2023 10:51:37 +0100
Date: Wed, 29 Nov 2023 10:51:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: Simplify using
 pm_runtime_resume_and_get()
Message-ID: <20231129095137.of52hb7bc3ht3t6j@pengutronix.de>
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
 <20231123175425.496956-2-u.kleine-koenig@pengutronix.de>
 <20231129003955.GB8171@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5q63my4qu5atbldb"
Content-Disposition: inline
In-Reply-To: <20231129003955.GB8171@pendragon.ideasonboard.com>
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


--5q63my4qu5atbldb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Laurent,

On Wed, Nov 29, 2023 at 02:39:55AM +0200, Laurent Pinchart wrote:
> On Thu, Nov 23, 2023 at 06:54:27PM +0100, Uwe Kleine-K=F6nig wrote:
> > pm_runtime_resume_and_get() already drops the runtime PM usage counter
> > in the error case. So a call to pm_runtime_put_sync() can be dropped.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> I wonder if checkpatch should warn about usage of pm_runtime_get_sync().

It should not warn in general. There are cases where
pm_runtime_get_sync() is the right function to use. See for example
commit aec488051633 ("crypto: stm32 - Properly handle pm_runtime_get
failing").

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5q63my4qu5atbldb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVnCagACgkQj4D7WH0S
/k7WiQf/fN9Xs5W02kuxq+1RF/lLRHhOAyvMNo19radEY2KAH+lLtkLWGJV8934M
51VMxBrWAtzOpLmsPODimvQoQSEwRDpjp3F6cTCbOahYoCUuttN4ErzcFHVyeNBq
no+A8ugCKuFRzYgoxoo9P9EqHdb3jjBvhtnzpaxgu+GCQnQl+N3dQigPc8MS11MU
8XqTGQR/siqW/brXKU2+P/w/ObMGZVKxVDTpZLhw+sc88HSc+AnKgmqf6zkGgDLK
PfoYDBisk+K7dBDmIc9QpL0DqAkrXN4GHw0TyVDlDKAtsYMMjYZ9IFYOb/V/v1B+
1/DqA0O8zMuMBtD8rUZkAJ3gMFdz3Q==
=8rue
-----END PGP SIGNATURE-----

--5q63my4qu5atbldb--
