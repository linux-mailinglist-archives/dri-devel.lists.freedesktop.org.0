Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2219C6C0D20
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 10:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F09BC10E29B;
	Mon, 20 Mar 2023 09:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7977210E29B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 09:22:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1peBix-0008TG-Nn; Mon, 20 Mar 2023 10:22:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1peBit-005QLn-Vh; Mon, 20 Mar 2023 10:22:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1peBit-006P91-09; Mon, 20 Mar 2023 10:22:35 +0100
Date: Mon, 20 Mar 2023 10:22:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm/imx/lcdc: Fix compilation with CONFIG_OF=n
Message-ID: <20230320092234.knm2nbdcvrmyhbev@pengutronix.de>
References: <20230318221027.260115-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c2urlhry2xy4zieu"
Content-Disposition: inline
In-Reply-To: <20230318221027.260115-1-u.kleine-koenig@pengutronix.de>
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
Cc: kernel test robot <lkp@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--c2urlhry2xy4zieu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Mar 18, 2023 at 11:10:27PM +0100, Uwe Kleine-K=F6nig wrote:
> The driver needs the include <drm/drm_bridge.h>. WIth CONFIG_OF enabled

Just noticed: s/WIth/With/. Assuming no further review comments make a
v2 necessary: Should I resend for that, or can you fixup when you apply
this patch?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--c2urlhry2xy4zieu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQYJdkACgkQj4D7WH0S
/k7prgf/STzFKVt5QbkUa07jMZ/UYtTf/xJUzRGoZVtCzT+XOyHFQayMZk5ujsKX
hxWuZrcFPpaAprWeO/WRIMZtpY7opfElUn9JBI4hkzlEElvYhGTUk4fq5R3VeXs9
mUWLcVsXHiPGsr5mLvOZJBjEpDhXVJX7dEVrsdTCgRT8CK8vL4VuuqNkpSNfqF8B
MEL2EL0uyoIntyVMejBPMoeZatd9jf/JXl2ZWRX6uJFTF+eAgEXlGg5cxJtLTDXj
t6puBS02P37U0AbEaUwsjlKyZwDfByR0FS1Ohl0wqR/2i1aRBNOpusSMrekS3vhY
1qA413t36oFKtFiUutfQeg/y2JiScw==
=PhSN
-----END PGP SIGNATURE-----

--c2urlhry2xy4zieu--
