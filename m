Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A6B544732
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 11:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDAF1123ED;
	Thu,  9 Jun 2022 09:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208231123E8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 09:18:53 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nzEJW-0000Sh-T3; Thu, 09 Jun 2022 11:18:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nzEJX-007M2P-5C; Thu, 09 Jun 2022 11:18:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nzEJV-00F9we-5u; Thu, 09 Jun 2022 11:18:49 +0200
Date: Thu, 9 Jun 2022 11:18:47 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i2c/sil164: Drop no-op remove function
Message-ID: <20220609091847.fqqmgmot5mbjlu6o@pengutronix.de>
References: <20220526202538.1723142-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k4vqafpu6ey3kkgg"
Content-Disposition: inline
In-Reply-To: <20220526202538.1723142-1-u.kleine-koenig@pengutronix.de>
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
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--k4vqafpu6ey3kkgg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, May 26, 2022 at 10:25:38PM +0200, Uwe Kleine-K=F6nig wrote:
> A remove callback that just returns 0 is equivalent to no callback at all
> as can be seen in i2c_device_remove(). So simplify accordingly.

I intend to change the prototype of i2c remove callbacks to return void
after the next merge window. This patch is a preparation for that quest.

So I ask you to either take this patch to sil164_drv.c before (my
preferred option), or accept that I send it as part of a bigger series
that will probably be merged via the i2c tree.

See
https://lore.kernel.org/linux-i2c/20220609091018.q52fhowlsdbdkct5@pengutron=
ix.de
for some more details.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--k4vqafpu6ey3kkgg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKhuvQACgkQwfwUeK3K
7AlWDQgAhn0+t9WnD2edezZEl1fzwvjIgpbxeSMGE3tua6S6HUbbqbuiqtkmL4jz
x1512R0QpdKf1IS/Jo5w13f9vTLKctsENcBPSnNuPVpH64h1l3jeJNNDqyA8MOVa
fDhWsSwIjYcbnjxZ/69ej2pgCVj2X40OP6IBQh0FPU1W1Uc/Hwet4RaxeWg/y1ox
I/NEv7kTea8pyxEYFTepS2asMJHCs9b46EhddUG9kmA3gnbKMenwFd0TknqcMXCO
fKjs9kMzjuXQv0vud80YW0oKgtzYLO8JmkCvpJxm05mQ01G680zCcOQ/YvbFghmZ
EC96AkXieMzQMgmsRgx/udyjZ94UlA==
=Tpl1
-----END PGP SIGNATURE-----

--k4vqafpu6ey3kkgg--
