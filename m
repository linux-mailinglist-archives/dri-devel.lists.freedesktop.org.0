Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2BF702816
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 11:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B1910E17A;
	Mon, 15 May 2023 09:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234DF10E17A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 09:16:09 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pyUJJ-0003bq-GO; Mon, 15 May 2023 11:16:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pyUJH-000KQ7-QJ; Mon, 15 May 2023 11:16:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pyUJG-004cSX-RM; Mon, 15 May 2023 11:16:02 +0200
Date: Mon, 15 May 2023 11:16:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH 18/53] drm/exynos: Convert to platform remove callback
 returning void
Message-ID: <20230515091602.7tyzortaowrzmqqo@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-19-u.kleine-koenig@pengutronix.de>
 <CAAQKjZN0DpnjpybZaEYz=eS4khTbY7RdS4i0-rC_-O_jk1iY-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y5vle46a7hdut33r"
Content-Disposition: inline
In-Reply-To: <CAAQKjZN0DpnjpybZaEYz=eS4khTbY7RdS4i0-rC_-O_jk1iY-g@mail.gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kernel@pengutronix.de,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--y5vle46a7hdut33r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 04:32:00PM +0900, Inki Dae wrote:
> Hi,
>=20
> 2023=EB=85=84 5=EC=9B=94 8=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 1:27, =
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>=EB=8B=98=EC=9D=B4 =
=EC=9E=91=EC=84=B1:
> >
> > The .remove() callback for a platform driver returns an int which makes
> > many driver authors wrongly assume it's possible to do error handling by
> > returning an error code. However the value returned is (mostly) ignored
> > and this typically results in resource leaks. To improve here there is a
> > quest to make the remove callback return void. In the first step of this
> > quest all drivers are converted to .remove_new() which already returns
> > void.
> >
> > Trivially convert the exynos drm drivers from always returning zero in
> > the remove callback to the void returning variant.
>=20
> Could you please update exynos_drm_vidi.c also? Seems you missed.

This one cannot be trivially converted as vidi_remove() doensn't return
zero in all cases. I didn't grok the details about ctx->raw_edid and
don't know if skipping component_del() is right or not.

If you know the driver, feel free to address this.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--y5vle46a7hdut33r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRh+FEACgkQj4D7WH0S
/k6HRgf9HY3yWZaML7K5a0dBuvYi0q/tvr4cD6GAN3/3VjillX69yUO9eJ5wtDHs
E05ob9kgXrZc4xfVy5F1lMb5rgsPWah4W6Fsr4SOtxXP/bTNZrgeyMngZK6pp0R+
NRwwX7mlsxZNIBavnlBPw9ytlIwCG9uI4TPd51v+Gk/jN87D+PoPVoRx171/bW5n
DlJh6NiINGvkmx+pjnAqHEG5DechPRrL/yDoxNGG7pnvNnx+/kwic4FgU1GrNS3/
s0GLO5l8LiVpa4k5s1/mUPDruK9I3v7W8ryO3/DZhgfnzKunQSkEKNFEkD8JREft
2PDkIu9zfWBYm0QKt1aOYSyCjM7g/w==
=leeg
-----END PGP SIGNATURE-----

--y5vle46a7hdut33r--
