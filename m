Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A9D708FF2
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 08:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FD110E5CE;
	Fri, 19 May 2023 06:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADB110E5CE
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 06:38:39 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pztl2-00040k-Ib; Fri, 19 May 2023 08:38:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pztl0-001Fj3-Eh; Fri, 19 May 2023 08:38:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pztkz-005sNI-N9; Fri, 19 May 2023 08:38:29 +0200
Date: Fri, 19 May 2023 08:38:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: =?utf-8?B?64yA7J246riw?= <inki.dae@samsung.com>
Subject: Re: [PATCH 18/53] drm/exynos: Convert to platform remove callback
 returning void
Message-ID: <20230519063829.kl43rtbl5j5hdofh@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-19-u.kleine-koenig@pengutronix.de>
 <CAAQKjZN0DpnjpybZaEYz=eS4khTbY7RdS4i0-rC_-O_jk1iY-g@mail.gmail.com>
 <CGME20230515091619epcas1p28a77f182aecebba1f59acd4ee31af377@epcas1p2.samsung.com>
 <20230515091602.7tyzortaowrzmqqo@pengutronix.de>
 <045001d989e6$86eb6f00$94c24d00$@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="e6qq2vj7pvymm6pj"
Content-Disposition: inline
In-Reply-To: <045001d989e6$86eb6f00$94c24d00$@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
 'Jingoo Han' <jingoohan1@gmail.com>, 'Seung-Woo Kim' <sw0312.kim@samsung.com>,
 'Kyungmin Park' <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
 'Alim Akhtar' <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--e6qq2vj7pvymm6pj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Inki Dae,

On Fri, May 19, 2023 at 09:11:58AM +0900, =EB=8C=80=EC=9D=B8=EA=B8=B0 wrote:
> > On Mon, May 15, 2023 at 04:32:00PM +0900, Inki Dae wrote:
> > > 2023=EB=85=84 5=EC=9B=94 8=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 1:=
27, Uwe Kleine-K=C3=B6nig <u.kleine-
> > koenig@pengutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> > > Could you please update exynos_drm_vidi.c also? Seems you missed.
> >=20
> > This one cannot be trivially converted as vidi_remove() doensn't return
> > zero in all cases. I didn't grok the details about ctx->raw_edid and
> > don't know if skipping component_del() is right or not.
> >=20
> > If you know the driver, feel free to address this.
>=20
> I just posted one patch[1] which drops error return line from vidi_remove=
() because it's not an error case so it shouldn't return an error.
> If you subscribed dri-devel then the patch must be in your mail box. On t=
op of this, you could update it.

I'm not subscribed, but I'll care to convert the driver once your patch
has landed in the mainline.

Thanks for the assist,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--e6qq2vj7pvymm6pj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRnGWQACgkQj4D7WH0S
/k4PPAf+Ndp/wi4ft1tCbH28d/ZiSRX4o5DPJ3m2BXjclIDPWCBAYkv8poAkAv/s
An4ZNdpfx/NSSqo4ykI89A/vfJdS7wPLF8BcxkCBkD9RkOZ3JrDRlERuNv2IrchS
l83MhJ393YvqV+SPKVGPzH8N++PI3jy/N1X/xixGD5xnmxDjpRX1kttG9Aye6cdw
IM9qHHbhmeVh6FRzUT7rcBuy0pt1pCsoWNpv5XX0efXL+s3FBAtgAyVoRt0xvqE6
Ny7DcjGTXpyi1C8lqE48lDFaMJbRimq1lF0g6iCyVECYC+IYXx33OUGqRFrmaRLO
2vkq3tRdHfA1m6zwkWHJsZhqoMjYaA==
=911b
-----END PGP SIGNATURE-----

--e6qq2vj7pvymm6pj--
