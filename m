Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5BC80C959
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 13:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E3A10E0E5;
	Mon, 11 Dec 2023 12:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56D510E0E5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 12:18:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rCfEf-0001H0-4X; Mon, 11 Dec 2023 13:18:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rCfEe-00F5z5-AI; Mon, 11 Dec 2023 13:18:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rCfEe-000tY1-0P; Mon, 11 Dec 2023 13:18:08 +0100
Date: Mon, 11 Dec 2023 13:18:07 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 000/115] pwm: Fix lifetime issues for pwm_chips
Message-ID: <20231211121807.zzlgf3alcoo6lrw7@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <ZXM4CdJxg-XrYhkn@orome.fritz.box>
 <20231208185033.e6ty2cajcfle6dgk@pengutronix.de>
 <ZXbzcFTnDTKoZAta@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yyef2a7pj6vk5dry"
Content-Disposition: inline
In-Reply-To: <ZXbzcFTnDTKoZAta@orome.fritz.box>
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 asahi@lists.linux.dev, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yyef2a7pj6vk5dry
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Mon, Dec 11, 2023 at 12:33:04PM +0100, Thierry Reding wrote:
> On Fri, Dec 08, 2023 at 07:50:33PM +0100, Uwe Kleine-K=F6nig wrote:
> > The TL;DR; is essentially what I already wrote in my last reply to Bart
> > in the v3 thread[1]:
> >=20
> >  - My approach needs more changes to the individual drivers (which I
> >    don't consider a relevant disadvantage given that the resulting code
> >    is better);
> >  - My approach works with less pointer dereferences which IMHO also
> >    simplifies understanding the code as all relevant data is in a single
> >    place.
> >  - My approach has a weaker separation between the core and the lowlevel
> >    drivers. That's ok in my book given that this doesn't complicate the
> >    lowlevel drivers and that hiding details considerably better doesn't
> >    work anyhow (see the drivers that need internal.h in your patch).
> >=20
> > For me the single allocation issue is only an added bonus. The relevant
> > advantage of my approach is that the code is easier and (probably) more
> > efficient.
>=20
> I happen to disagree. I think adding pwmchip_alloc() makes things much
> more complicated for low level drivers.

Looking at e.g.
https://lore.kernel.org/linux-pwm/2dda818b8bbbe8ba4b9df5ab54f960ff4a4f1ab5.=
1701860672.git.u.kleine-koenig@pengutronix.de/
I wonder where you see "much more complication". OK, there are two
pointers now for chip and private data, but I'd call that at most a
"mild" complication[1] which is more than balanced out by the
simplifications in the remaining parts of that patch.

Best regards
Uwe

[1] I'm not sure I'd refuse someone suggesting the following patch on
    top of today's next:

	diff --git a/drivers/pwm/pwm-microchip-core.c b/drivers/pwm/pwm-microchip-=
core.c
	index c0c53968f3e9..d32e65914599 100644
	--- a/drivers/pwm/pwm-microchip-core.c
	+++ b/drivers/pwm/pwm-microchip-core.c
	@@ -448,12 +448,14 @@ MODULE_DEVICE_TABLE(of, mchp_core_of_match);
	 static int mchp_core_pwm_probe(struct platform_device *pdev)
	 {
		struct mchp_core_pwm_chip *mchp_core_pwm;
	+	struct pwm_chip *chip;
		struct resource *regs;
		int ret;
	=20
		mchp_core_pwm =3D devm_kzalloc(&pdev->dev, sizeof(*mchp_core_pwm), GFP_KE=
RNEL);
		if (!mchp_core_pwm)
			return -ENOMEM;
	+	chip =3D &mchp_core_pwm->chip;
	=20
		mchp_core_pwm->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &=
regs);
		if (IS_ERR(mchp_core_pwm->base))
	@@ -470,9 +472,9 @@ static int mchp_core_pwm_probe(struct platform_device =
*pdev)
	=20
		mutex_init(&mchp_core_pwm->lock);
	=20
	-	mchp_core_pwm->chip.dev =3D &pdev->dev;
	-	mchp_core_pwm->chip.ops =3D &mchp_core_pwm_ops;
	-	mchp_core_pwm->chip.npwm =3D 16;
	+	chip->dev =3D &pdev->dev;
	+	chip->ops =3D &mchp_core_pwm_ops;
	+	chip->npwm =3D 16;
	=20
		mchp_core_pwm->channel_enabled =3D readb_relaxed(mchp_core_pwm->base + MC=
HPCOREPWM_EN(0));
		mchp_core_pwm->channel_enabled |=3D
	@@ -485,7 +487,7 @@ static int mchp_core_pwm_probe(struct platform_device =
*pdev)
		writel_relaxed(1U, mchp_core_pwm->base + MCHPCOREPWM_SYNC_UPD);
		mchp_core_pwm->update_timestamp =3D ktime_get();
	=20
	-	ret =3D devm_pwmchip_add(&pdev->dev, &mchp_core_pwm->chip);
	+	ret =3D devm_pwmchip_add(&pdev->dev, chip);
		if (ret)
			return dev_err_probe(&pdev->dev, ret, "Failed to add pwmchip\n");
=20
    With that applied before the above mentioned patch there is no
    complication at all in my eyes.


--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yyef2a7pj6vk5dry
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV2/f8ACgkQj4D7WH0S
/k7QwQgApfQEvhd6se+a8+O5GDdTfjV+EObXMDS2kvZsRHCAmatVaTePkn/Zg6Fo
ZwGiGr9Ttfcjwf0hpLEmy7G2QP38HPZySu1f9Xo4V6NtkIvo4iPm3o60vDqF3mZM
i+2779oY7aNOanR7E1KyDs7WfAZowpslVZ9qaXlDs6Pa1Hrz4Z7Wn6sF4gVV0SnX
Qq2kKClfhZCuWBwwSDHS72BKOj2GRkgP32YIDH1LcEP9iemoZqFJivwMh3VGvIXv
DocnmNO9JXrr3vx5UTcRHZfakEXbIfGOTtibtXwJDI48rHzGcXYRbYGi5B5Sssx/
SHrVw/Ghy9VDfrcrkb+gLBfpz7JxyA==
=RAtQ
-----END PGP SIGNATURE-----

--yyef2a7pj6vk5dry--
