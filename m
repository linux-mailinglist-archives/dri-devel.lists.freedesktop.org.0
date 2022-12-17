Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EE964FB96
	for <lists+dri-devel@lfdr.de>; Sat, 17 Dec 2022 19:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D947410E0CD;
	Sat, 17 Dec 2022 18:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63DA10E0CD
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Dec 2022 18:40:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p6c4c-0002Zx-A4; Sat, 17 Dec 2022 19:38:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p6c4Z-005FEd-4z; Sat, 17 Dec 2022 19:38:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p6c4Z-005tG6-3s; Sat, 17 Dec 2022 19:38:11 +0100
Date: Sat, 17 Dec 2022 19:38:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 0/2] drm/imx/lcdc: Implement DRM driver for imx21
Message-ID: <20221217183806.bvo5vypm6axycdte@pengutronix.de>
References: <20221216175006.456831-1-u.kleine-koenig@pengutronix.de>
 <20221216235758.GA88372-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q2u25vyd556sobl5"
Content-Disposition: inline
In-Reply-To: <20221216235758.GA88372-robh@kernel.org>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--q2u25vyd556sobl5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2022 at 05:57:58PM -0600, Rob Herring wrote:
> On Fri, Dec 16, 2022 at 06:50:04PM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > Changes since v2:
> >=20
> >  - added allOf as Krzysztof requested
> >  - reworked driver based on Philipp's comments
> >    (improved error handling, different selects, moved driver to a subdi=
rectory,
> >    header sorting, drm_err instead of DRM_ERROR, inlined
> >    imx_lcdc_check_mode_change, make use of dev_err_probe())
> > =20
> > Krzysztof also pointed out that we're now having two compatibles for a
> > single hardware. Admittedly this is unusual, but this is the chance that
> > the (bad) compatible identifier imx21-fb gets deprecated. The hardware
> > is called LCDC and only the linux (framebuffer) driver is called imxfb.
>=20
> The problem is you can't have firmware (with the DTB) that supports=20
> both. Well, you can if you want to have some firmware setting that=20
> selects which one. Otherwise, it's really an OS problem to decide what=20
> to use.=20

I don't understand what you intend to say here. The same applies if the
compatible is the same for both binding alternatives, isn't it? Do you
consider a firmware problem better or an OS problem?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--q2u25vyd556sobl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOeDIwACgkQwfwUeK3K
7AlIUQgAg24Wp5qaDVZinPOUhU3yor5qWrUl7VQeNiY1eUq8fVJGbkSjM7rOA3lc
pldAThh4DuYhR4vmnoK8NJYvc+IFc36BoohLO6qCGAVIMR8vsPbslzDk+U6JuubP
Xpn7P92Yrtn9BjrFLDgk0okGiic3Z5fEqGaBTC0QAQjfOqo1CRJ4Ac/sI1Wp8OpM
fey+UMiFXal6hragjzFHq64cV0Qws9vwPVWRMZ2/8SXBaGtHuWUvv0N/LTnmBnJm
PRoeqWQSuTggOEpZV9TQVjBMOfxFyPkYANQ1PpsnBTOi8TVqIeyL7qI3oeZzrtbG
vEjsLpR5kCPsaoQxKHmDin/BfA1YOQ==
=BqGT
-----END PGP SIGNATURE-----

--q2u25vyd556sobl5--
