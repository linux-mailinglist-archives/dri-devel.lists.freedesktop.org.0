Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DED3045DB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 19:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4EF6E0B6;
	Tue, 26 Jan 2021 18:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3355 seconds by postgrey-1.36 at gabe;
 Tue, 26 Jan 2021 18:00:42 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8E36E0B6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 18:00:42 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l4SaJ-00032e-0a; Tue, 26 Jan 2021 18:56:59 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l4SaD-0007NA-AL; Tue, 26 Jan 2021 18:56:53 +0100
Date: Tue, 26 Jan 2021 18:56:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 4/5] amba: Make the remove callback return void
Message-ID: <20210126175652.3caoqfnsky2es42f@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
 <3e42b2ea-c713-31b2-9c86-c49a70d8e1f4@arm.com>
MIME-Version: 1.0
In-Reply-To: <3e42b2ea-c713-31b2-9c86-c49a70d8e1f4@arm.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Mike Leach <mike.leach@linaro.org>,
 alsa-devel@alsa-project.org, coresight@lists.linaro.org,
 Vladimir Zapolskiy <vz@mleia.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-fbdev@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 linux-watchdog@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Leo Yan <leo.yan@linaro.org>,
 dmaengine@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0830422069=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0830422069==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2x4mwcdrgqmlamtu"
Content-Disposition: inline


--2x4mwcdrgqmlamtu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jan 26, 2021 at 05:08:40PM +0000, Suzuki K Poulose wrote:
> On 1/26/21 4:58 PM, Uwe Kleine-K=F6nig wrote:
> > All amba drivers return 0 in their remove callback. Together with the
> > driver core ignoring the return value anyhow, it doesn't make sense to
> > return a value here.
> >=20
> > Change the remove prototype to return void, which makes it explicit that
> > returning an error value doesn't work as expected. This simplifies chan=
ging
> > the core remove callback to return void, too.
> >=20
> > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org> # for drivers/memory
> > Acked-by: Mark Brown <broonie@kernel.org>
>  > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
>=20
> >   drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 +---
>=20
> You are most likely to have a conflict for the above file, with what is
> in coresight/next. It should be easy to resolve.

I'm surprised to see that the remove callback introduced in 2952ecf5df33
("coresight: etm4x: Refactor probing routine") has an __exit annotation.

With .suppress_bind_attrs =3D true you don't need a remove callback at
all. (And without .suppress_bind_attrs =3D true the remove callback must
have no __exit annotation.)

This make me looking at commit 45fe7befe0db ("coresight: remove broken
__exit annotations") by Arnd. Unless I miss something the better change
would have been to remove the unused remove callbacks instead of dropping
their __exit annotation?!

Anyhow, my conflict resolution looks as follows:

diff --cc drivers/hwtracing/coresight/coresight-etm4x-core.c
index 82787cba537d,473ab7480a36..000000000000
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@@ -1703,6 -1903,28 +1903,27 @@@ static int __exit etm4_remove_dev(struc
  	cpus_read_unlock();
 =20
  	coresight_unregister(drvdata->csdev);
+=20
+ 	return 0;
+ }
+=20
 -static int __exit etm4_remove_amba(struct amba_device *adev)
++static void __exit etm4_remove_amba(struct amba_device *adev)
+ {
+ 	struct etmv4_drvdata *drvdata =3D dev_get_drvdata(&adev->dev);
+=20
+ 	if (drvdata)
 -		return etm4_remove_dev(drvdata);
 -	return 0;
++		etm4_remove_dev(drvdata);
+ }
+=20
+ static int __exit etm4_remove_platform_dev(struct platform_device *pdev)
+ {
+ 	int ret =3D 0;
+ 	struct etmv4_drvdata *drvdata =3D dev_get_drvdata(&pdev->dev);
+=20
+ 	if (drvdata)
+ 		ret =3D etm4_remove_dev(drvdata);
+ 	pm_runtime_disable(&pdev->dev);
+ 	return ret;
  }
 =20
  static const struct amba_id etm4_ids[] =3D {

If this series should make it in for 5.12 we probably need an immutable
branch between hwtracing and amba.

> Otherwise, the changes look good for the drivers/hwtracing/coresight/*
>=20
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2x4mwcdrgqmlamtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAQV+EACgkQwfwUeK3K
7AmVuQf6AtGutKPgbsyG3MlTDGKL2CFRBxCLR4sxog0b3QoNLrxr97ZAm+29XP+R
/C9AgAEdBYZEp/2H2BkQe8cuBFS4UgHD/WEPZ5cI+JN475DZiqoF6T0qdSyCMF8m
zEDDLZljJzggeci88eRuo1WxD4fyaD//srG7TdZYqXjasRvJ7uKPN4yTi7TrbMtU
ECXScjnQQcZQPBSaUSqOzJfFs5iGDejv5lIG/emf+7QYEDD+AftUvKNVv/FyQYmL
2jPJY9rLusZQGMxlZWQMyo5AzhkjmMkXv3GJVOiLzAUiEZ6WfU0kdtrZuzScshOW
IRo6dRIxQLZOE4k2D+rDx3M/+KGaZQ==
=Ozgm
-----END PGP SIGNATURE-----

--2x4mwcdrgqmlamtu--

--===============0830422069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0830422069==--
