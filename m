Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 221AE30C04E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 14:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EB56E15F;
	Tue,  2 Feb 2021 13:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F956E15F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 13:56:21 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l6w82-0000fW-TE; Tue, 02 Feb 2021 14:54:02 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l6w7u-0006bW-5D; Tue, 02 Feb 2021 14:53:54 +0100
Date: Tue, 2 Feb 2021 14:53:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Russell King <linux+pull@armlinux.org.uk>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [GIT PULL] immutable branch for amba changes targeting v5.12-rc1
Message-ID: <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
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
Cc: linux-fbdev@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig.org@pengutronix.de>,
 linux-i2c@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Mike Leach <mike.leach@linaro.org>, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Alessandro Zummo <a.zummo@towertech.it>,
 coresight@lists.linaro.org, Vladimir Zapolskiy <vz@mleia.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 kernel@pengutronix.de, Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1123039839=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1123039839==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ofqcafd7fzy3m7fk"
Content-Disposition: inline


--ofqcafd7fzy3m7fk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

the following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.pengutronix.de/git/ukl/linux tags/amba-make-remove-return-void

for you to fetch changes up to f170b59fedd733b92f58c4d7c8357fbf7601d623:

  amba: Make use of bus_type functions (2021-02-02 14:26:02 +0100)

I expect this tag to be merged by Russell King as amba maintainer and by
Mathieu Poirier (or Greg Kroah-Hartman?) for coresight as there are some
pending conflicting changes. These are not hard to resolve but also
non-trivial. Tell me if you need assistance for resolving, also if it's onl=
y a
second pair of eyes to judge your resolution.

Best regards,
Uwe

----------------------------------------------------------------
Tag for adaptions to struct amba_driver::remove changing prototype

----------------------------------------------------------------
Uwe Kleine-K=F6nig (5):
      amba: Fix resource leak for drivers without .remove
      amba: reorder functions
      vfio: platform: simplify device removal
      amba: Make the remove callback return void
      amba: Make use of bus_type functions

 drivers/amba/bus.c                                 | 234 +++++++++++++++++=
++++++++++++++++------------------------------
 drivers/char/hw_random/nomadik-rng.c               |   3 +-
 drivers/dma/pl330.c                                |   3 +-
 drivers/gpu/drm/pl111/pl111_drv.c                  |   4 +-
 drivers/hwtracing/coresight/coresight-catu.c       |   3 +-
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |   4 +-
 drivers/hwtracing/coresight/coresight-cti-core.c   |   4 +-
 drivers/hwtracing/coresight/coresight-etb10.c      |   4 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c |   4 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c |   4 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |   4 +-
 drivers/hwtracing/coresight/coresight-replicator.c |   4 +-
 drivers/hwtracing/coresight/coresight-stm.c        |   4 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |   4 +-
 drivers/hwtracing/coresight/coresight-tpiu.c       |   4 +-
 drivers/i2c/busses/i2c-nomadik.c                   |   4 +-
 drivers/input/serio/ambakmi.c                      |   3 +-
 drivers/memory/pl172.c                             |   4 +-
 drivers/memory/pl353-smc.c                         |   4 +-
 drivers/mmc/host/mmci.c                            |   4 +-
 drivers/rtc/rtc-pl030.c                            |   4 +-
 drivers/rtc/rtc-pl031.c                            |   4 +-
 drivers/spi/spi-pl022.c                            |   5 +-
 drivers/tty/serial/amba-pl010.c                    |   4 +-
 drivers/tty/serial/amba-pl011.c                    |   3 +-
 drivers/vfio/platform/vfio_amba.c                  |  15 ++--
 drivers/video/fbdev/amba-clcd.c                    |   4 +-
 drivers/watchdog/sp805_wdt.c                       |   4 +-
 include/linux/amba/bus.h                           |   2 +-
 sound/arm/aaci.c                                   |   4 +-
 30 files changed, 157 insertions(+), 198 deletions(-)



--ofqcafd7fzy3m7fk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAZWWsACgkQwfwUeK3K
7AnMhQgAhyeAx45pa3ebR9ymvzFG1Knp32GwFPlyLYw03yZzLsNR5n+d0kvDNZ1l
vNIrU0g5WSS1SUWhs+m3WDRIcTlCHcgc3yoCKltLSNWiPXie9G9BZ0815b0gomXY
eBSKiHZg/Ie8WhIspQcl0IA0P/2nOmTXF8qJx3CFow5WowriUutdf7n1ycTDq86a
18Xpf2lW+esLut8MHM/98aHJUl6Jkj5PYfQfjgORIXKwNmNDltuK6lwvUU+pw+Vr
0bDYXdXlaKLkNtSYYHSbDrKALiQccxhXYPg404KZV3FIHpOxKlq6im8hsFHWOOlu
n9j2wq/tpGso23vYKdErmsE3GDncuQ==
=P/zp
-----END PGP SIGNATURE-----

--ofqcafd7fzy3m7fk--

--===============1123039839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1123039839==--
