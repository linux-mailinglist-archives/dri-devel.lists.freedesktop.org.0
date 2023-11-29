Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F37FD8BE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 14:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F55410E1E2;
	Wed, 29 Nov 2023 13:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A268310E1E2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 13:56:14 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r8L2o-0006OC-Ua; Wed, 29 Nov 2023 14:56:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r8L2m-00CPwz-6f; Wed, 29 Nov 2023 14:56:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r8L2l-00AuX5-TC; Wed, 29 Nov 2023 14:55:59 +0100
Date: Wed, 29 Nov 2023 14:55:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: About resuming in the remove callback
Message-ID: <20231129135556.r5f4342vm4ylv4lo@pengutronix.de>
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
 <20231123175425.496956-2-u.kleine-koenig@pengutronix.de>
 <20231129003955.GB8171@pendragon.ideasonboard.com>
 <20231129095137.of52hb7bc3ht3t6j@pengutronix.de>
 <20231129101150.GC18109@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3vlqtt27eif5p4gk"
Content-Disposition: inline
In-Reply-To: <20231129101150.GC18109@pendragon.ideasonboard.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3vlqtt27eif5p4gk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Laurent,

On Wed, Nov 29, 2023 at 12:11:50PM +0200, Laurent Pinchart wrote:
> On Wed, Nov 29, 2023 at 10:51:37AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Wed, Nov 29, 2023 at 02:39:55AM +0200, Laurent Pinchart wrote:
> > > On Thu, Nov 23, 2023 at 06:54:27PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > pm_runtime_resume_and_get() already drops the runtime PM usage coun=
ter
> > > > in the error case. So a call to pm_runtime_put_sync() can be droppe=
d.
> > > >=20
> > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > >=20
> > > I wonder if checkpatch should warn about usage of pm_runtime_get_sync=
().
> >=20
> > It should not warn in general. There are cases where
> > pm_runtime_get_sync() is the right function to use. See for example
>=20
> Sure, the function most likely has some valid use cases (otherwise it
> should just be removed), but I think those are are a minority. I was
> just thinking out loud anyway.
>=20
> > commit aec488051633 ("crypto: stm32 - Properly handle pm_runtime_get
> > failing").
>=20
> I don't know much about that device, but wouldn't the best option be to
> avoid resuming the device at remove time ? In any case, that's getting
> out of topic for the sn65dsi86 :-)

Agreed for off-topic, I adapted the Subject to make this more obvious
and added Greg and Rafael to Cc:.

Without waking the device in .remove() it's harder to properly free
resources. OTOH if you properly handle a failure to wake the device, you
cope for most of that difficulty already anyhow. Hmm.

One thing that makes this (IMHO) worse is that __device_release_driver()
calls pm_runtime_put_sync() just before device_remove() (which triggers
calling the driver's remove function). See
https://lore.kernel.org/linux-kernel/20230511073428.10264-1-u.kleine-koenig=
@pengutronix.de
for an earlier discussion about that topic.

Best regards
Uwe
--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3vlqtt27eif5p4gk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVnQuwACgkQj4D7WH0S
/k67kggAulbaSEKcK8aQP4ogKPnVfbD7cwM+x9Kv4gHyCb/61l6nQAXBYPRczpO7
8rDSOh0mpCmueNY0suEN1IE4SjxoKyQnZU7Z2Q2BdBpxbsNlTmSXl7qCTRnx2j+o
1T41lhdpYjUZiMtJwjK17yCg0RGzxHPV8T6MRgaYrRMCLvsBa+D3Unl7XZvCmvRI
mxqUh96BFPdUTTScJFOtAX61k2kLngd2IoDn1HGSKXuzUd7CkxAsk66KyMOGaaVQ
6xjC4yhOKpQ11ipgzpz+w1eUWWgi6rlmn632qqTKHynmz9n3wEvbgRHJ279MPu89
mrHMtZ3xcYf0rNWywcbG+WQAtkX/Fw==
=JFJH
-----END PGP SIGNATURE-----

--3vlqtt27eif5p4gk--
