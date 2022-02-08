Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455464AD3C5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB4C10E5DC;
	Tue,  8 Feb 2022 08:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34DE10E5DA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 08:43:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nHM5r-0002Xc-Q8; Tue, 08 Feb 2022 09:43:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nHM5q-00FGOF-Re; Tue, 08 Feb 2022 09:43:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nHM5o-00Bgwf-VR; Tue, 08 Feb 2022 09:43:20 +0100
Date: Tue, 8 Feb 2022 09:43:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] backlight: pwm_bl: Avoid open coded arithmetic in memory
 allocation
Message-ID: <20220208084318.pkfs6xtpe4cz77sd@pengutronix.de>
References: <bd3d74acfa58d59f6f5f81fc5a9fb409edb8d747.1644046817.git.christophe.jaillet@wanadoo.fr>
 <20220207080128.xmvommcddjfgz7ey@pengutronix.de>
 <YgDm1FWtlneMLCTS@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pdixcmr5l2jhzb4h"
Content-Disposition: inline
In-Reply-To: <YgDm1FWtlneMLCTS@google.com>
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pdixcmr5l2jhzb4h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 07, 2022 at 09:31:00AM +0000, Lee Jones wrote:
> On Mon, 07 Feb 2022, Uwe Kleine-K=F6nig wrote:
>=20
> > On Sat, Feb 05, 2022 at 08:40:48AM +0100, Christophe JAILLET wrote:
> > > kmalloc_array()/kcalloc() should be used to avoid potential overflow =
when
> > > a multiplication is needed to compute the size of the requested memor=
y.
> > >=20
> > > So turn a kzalloc()+explicit size computation into an equivalent kcal=
loc().
> > >=20
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >=20
> > LGTM
> >=20
> > Acked-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >=20
> > Thanks
> > Uwe
>=20
> I am totally confused!

An rightfully so. Copy-paste-fail, this was supposed to be

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Sorry!

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pdixcmr5l2jhzb4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmICLSMACgkQwfwUeK3K
7AkbYgf/RNIxNrujniat17dztKQmOsg7ALfQgtXaD7tJg70b7hHEABMPGSfUeTD4
NmvXDBOnN1LiF8tOP/wJQlsM+vQzWJfIT4IQkiravbjwlUW4dgP7791/tH96r0uk
S5Cz5KuSYksD6aj/RnsSC5lGtXQzjX2u7zC/H0oIMdOQ7VotZMSsKYVkkayAukP4
HY6htMhSXDfTLemlM0oVWGOwMzO+LvG1szPEKsUdaOTiT0qMMozlRBd+gt/4Panz
OnodFwSXAmgEH9IH+s/wH8xsVe5TYibaqhPnsj9JBaMRjGVNnCf7ziwL+BSC3P1m
6guPRpOxNHkPy8j+kGt+RekqdmL/QQ==
=Iulx
-----END PGP SIGNATURE-----

--pdixcmr5l2jhzb4h--
