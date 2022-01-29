Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B7D4A2D94
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 11:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171A210FE94;
	Sat, 29 Jan 2022 10:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8063510FE94
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 10:19:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nDkpi-0007Rq-MI; Sat, 29 Jan 2022 11:19:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nDkpe-00DBWu-QZ; Sat, 29 Jan 2022 11:19:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nDkpd-00298t-El; Sat, 29 Jan 2022 11:19:45 +0100
Date: Sat, 29 Jan 2022 11:19:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] drm/imx/lcdc: Implement DRM driver for imx21
Message-ID: <20220129101941.aqzgnt2q2e7bl34v@pengutronix.de>
References: <20220128105849.368438-3-u.kleine-koenig@pengutronix.de>
 <202201290646.48sNgWm1-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ffc4mrc4dti4l5lm"
Content-Disposition: inline
In-Reply-To: <202201290646.48sNgWm1-lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ffc4mrc4dti4l5lm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 29, 2022 at 06:25:53AM +0800, kernel test robot wrote:
> Hi "Uwe,
>=20
> Thank you for the patch! Yet something to improve:
>=20
> [auto build test ERROR on shawnguo/for-next]
> [also build test ERROR on robh/for-next pza/reset/next v5.17-rc1 next-202=
20128]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>=20
> url:    https://github.com/0day-ci/linux/commits/Uwe-Kleine-K-nig/drm-imx=
-lcdc-drm-driver-for-imx21-25-27/20220128-190002
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.gi=
t for-next
> config: arc-randconfig-r012-20220128 (https://download.01.org/0day-ci/arc=
hive/20220129/202201290646.48sNgWm1-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 11.2.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/cba99931972f752a7b3105a=
3697b0cda88fe54d4
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Uwe-Kleine-K-nig/drm-imx-lcdc-dr=
m-driver-for-imx21-25-27/20220128-190002
>         git checkout cba99931972f752a7b3105a3697b0cda88fe54d4
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cro=
ss O=3Dbuild_dir ARCH=3Darc distclean
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
> >> scripts/Makefile.clean:15: drivers/gpu/drm/imx/imx21-lcdc/Makefile: No=
 such file or directory
> >> make[6]: *** No rule to make target 'drivers/gpu/drm/imx/imx21-lcdc/Ma=
kefile'.

Argh, yes, I forgot to commit that one. I'll add it in the next round,
but wait a bit for more feedback (mainly by Rob). The Makefile just
contains:

	obj-$(CONFIG_DRM_IMX21_LCDC) +=3D imx21-lcdc.o

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ffc4mrc4dti4l5lm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmH1FLoACgkQwfwUeK3K
7Alfygf/XoDt+5FxRAsb8RIqizLhXbCLECrrgy93atHMIe4/oLzVUpPSM9iMzMjz
h2MclKELGmWbXMkGFsFyu1hQvo7rb0gpiV/Lc1RDufjf10ZIfeCWl9nlcESfLpon
PbDtS5WjiFcsYw7r2Lc04aWBDryXFZkS8G0hfVWUcDQuZ5WWm4iOVa7m3By19xd5
efyF5QtTRGnPI6xX2EkMghR/9R6lGisAkgEcVsauvyHVAntvGbKz48Dvida6zH7D
MjcymZT6JCxmRF+VX+wOOMmAdj3Ehhh7AYpbWAVguD+dm2QU+PYliAaBpqadeatn
eNA5IjVDrUawufvrtf4pNJkR5qXM+Q==
=XDbC
-----END PGP SIGNATURE-----

--ffc4mrc4dti4l5lm--
