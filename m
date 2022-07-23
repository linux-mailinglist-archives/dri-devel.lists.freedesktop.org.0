Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B341257F1D5
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jul 2022 00:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F59AF6B5;
	Sat, 23 Jul 2022 22:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFDDAF6B2
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Jul 2022 22:02:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1oFNCf-00087V-9I; Sun, 24 Jul 2022 00:02:29 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oFNCd-002n5G-I5; Sun, 24 Jul 2022 00:02:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1oFNCc-0075BI-AS; Sun, 24 Jul 2022 00:02:26 +0200
Date: Sun, 24 Jul 2022 00:02:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/4] video: fb: imxfb: Drop platform data support
Message-ID: <20220723220218.2jxejv55aix5sqra@pengutronix.de>
References: <20220723175720.76933-1-u.kleine-koenig@pengutronix.de>
 <YtxKv0ZUbg6V+a2w@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tv7wq6pmbas72eox"
Content-Disposition: inline
In-Reply-To: <YtxKv0ZUbg6V+a2w@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Helge Deller <deller@gmx.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tv7wq6pmbas72eox
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Sat, Jul 23, 2022 at 09:23:43PM +0200, Sam Ravnborg wrote:
> On Sat, Jul 23, 2022 at 07:57:17PM +0200, Uwe Kleine-K=F6nig wrote:
> > No source file but the driver itself includes the header containing the
> > platform data definition. The last user is gone since commit
> > 8485adf17a15 ("ARM: imx: Remove imx device directory").
> >=20
> > So we can safely drop platform data support.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Do imxfb offer something that is not supported by the DRM drivers?
> If yes then the clean-up is good, if not then we could drop the driver?

It's for different i.MX variants. imxfb is for i.MX2x while the DRM
drivers in mainline are for i.MX6. (Not sure about the i.MX3 and i.MX5x
variants.)

Somewhere in the middle of my todo list is to mainline an i.MX2x DRM
driver that could replace the imxfb driver. If I only had a bit more
time ...

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tv7wq6pmbas72eox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLcb+cACgkQwfwUeK3K
7AnMxQf+Prxx4qWPFfT5Rzd7sH+GpYEQAPPCq4Eeri8Rx6j8TBZeuNj2c0Mefb24
xliY410nXe9Smyu1ksXFa4w5AU3Smmd4m4JyCsagOKkAqUYnTfkkaOGtA/8HWGwj
FKcG+0uNTCawqQ5e9QhmQ4P3Vmze6q/dWml9ff10F321P/3C3wADIQub++xwQme1
t8to3N67oxncbBYOnG3KQ7Yyb40MPtWWatn6+XDJvuVMKiqPCpkxcEeFI88I7U9v
AAW2/AqZAdbU9DiGNULQv7+Rreo6MbxVeuiQX1kJkv295TH0pSLzZuE9BLZljoCZ
h1mq0c50aABMRQcIWF5p9r6r6D6bYQ==
=ClRJ
-----END PGP SIGNATURE-----

--tv7wq6pmbas72eox--
