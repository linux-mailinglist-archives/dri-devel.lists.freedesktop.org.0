Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1799A30CDF6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 22:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8435A6E0F7;
	Tue,  2 Feb 2021 21:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18016E0F7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 21:35:26 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l73KK-0005G0-0Y; Tue, 02 Feb 2021 22:35:12 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l73KD-000359-6W; Tue, 02 Feb 2021 22:35:05 +0100
Date: Tue, 2 Feb 2021 22:35:02 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Russell King <linux+pull@armlinux.org.uk>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] immutable branch for amba changes targeting v5.12-rc1
Message-ID: <20210202213502.ya4luwvklbte72sz@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-watchdog@vger.kernel.org, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Mike Leach <mike.leach@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 coresight@lists.linaro.org, Vladimir Zapolskiy <vz@mleia.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-fbdev@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0653525548=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0653525548==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iy6nspqtdtxt6xyd"
Content-Disposition: inline


--iy6nspqtdtxt6xyd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Feb 02, 2021 at 02:53:50PM +0100, Uwe Kleine-K=F6nig wrote:
> the following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e=
5e:
>=20
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.pengutronix.de/git/ukl/linux tags/amba-make-remove-return-v=
oid
>=20
> for you to fetch changes up to f170b59fedd733b92f58c4d7c8357fbf7601d623:
>=20
>   amba: Make use of bus_type functions (2021-02-02 14:26:02 +0100)
>=20
> I expect this tag to be merged by Russell King as amba maintainer and by
> Mathieu Poirier (or Greg Kroah-Hartman?) for coresight as there are some
> pending conflicting changes. These are not hard to resolve but also
> non-trivial. Tell me if you need assistance for resolving, also if it's o=
nly a
> second pair of eyes to judge your resolution.

Alternatively to my additional patch sent earlier today I prepared a v2
tag at

  https://git.pengutronix.de/git/ukl/linux tags/amba-make-remove-return-voi=
d-v2

with the build fix squashed in. Iff you prefer and both Russell and Greg
agree to pull this one instead of the (implicit) v1 we can maybe prevent
introducing this build regression in mainline. Please coordinate among
you two. And sorry again for breaking the build.

Best regards
Uwe

PS: The range-diff between the original
tags/amba-make-remove-return-void and
tags/amba-make-remove-return-void-v2 is:

1:  3fd269e74f2f ! 1:  481963c91284 amba: Make the remove callback return v=
oid
    @@ Commit message
         Acked-by: Vladimir Zapolskiy <vz@mleia.com> # for memory/pl172
         Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
         Link: https://lore.kernel.org/r/20210126165835.687514-5-u.kleine-k=
oenig@pengutronix.de
    +    [ukleinek: squashed in a build fix for drivers/mailbox/arm_mhuv2.c]
         Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
    =20
      ## drivers/amba/bus.c ##
    @@ drivers/input/serio/ambakmi.c: static int amba_kmi_remove(struct amb=
a_device *de
     =20
      static int __maybe_unused amba_kmi_resume(struct device *dev)
    =20
    + ## drivers/mailbox/arm_mhuv2.c ##
    +@@ drivers/mailbox/arm_mhuv2.c: static int mhuv2_probe(struct amba_dev=
ice *adev, const struct amba_id *id)
    +   return ret;
    + }
    +=20
    +-static int mhuv2_remove(struct amba_device *adev)
    ++static void mhuv2_remove(struct amba_device *adev)
    + {
    +   struct mhuv2 *mhu =3D amba_get_drvdata(adev);
    +=20
    +   if (mhu->frame =3D=3D SENDER_FRAME)
    +           writel_relaxed(0x0, &mhu->send->access_request);
    +-
    +-  return 0;
    + }
    +=20
    + static struct amba_id mhuv2_ids[] =3D {
    +
      ## drivers/memory/pl172.c ##
     @@ drivers/memory/pl172.c: static int pl172_probe(struct amba_device *=
adev, const struct amba_id *id)
        return ret;
2:  f170b59fedd7 =3D 2:  f30d22a7bfab amba: Make use of bus_type functions

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--iy6nspqtdtxt6xyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAZxYMACgkQwfwUeK3K
7AnuCggAjiQbE+eiwx7Lq2dUAxw0U6bgjFY/EXIcLCMbTPjdEffSVExAzMT3cTCy
zISJDI3QF315/RleMFcnEXrXJl7Ft8SkoEvZfheNfz5JmPu8jPIEUp5giooDmpBi
TV/LqBdE+wmy+J7byBdoH8Chvg9RR52u6aJFyj8nzwAoqj/+YiSYcB2nsMtr962B
GLNq7i0h7Lj0cZxGVTsh75QuVSyK7yedx7gS4F5wUURJpSa5LzeeWAboWgARpg+M
/BIWHX1CAs2JGZQqzJF2hffd/HZhQCWJlgTa1x92sg2Ic62K+ufwdsHlo87Wuo42
N6jvYIoY/t/LHHL+3zxpfxM1yFao+A==
=lf3x
-----END PGP SIGNATURE-----

--iy6nspqtdtxt6xyd--

--===============0653525548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0653525548==--
