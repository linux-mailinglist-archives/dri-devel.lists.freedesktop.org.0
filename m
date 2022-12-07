Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99414645C2E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 15:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E47E10E3B8;
	Wed,  7 Dec 2022 14:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9232D10E3B5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 14:16:01 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p2vDC-0001ta-JR; Wed, 07 Dec 2022 15:15:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p2vD8-002wMu-SR; Wed, 07 Dec 2022 15:15:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p2vD8-003Ib5-Ip; Wed, 07 Dec 2022 15:15:46 +0100
Date: Wed, 7 Dec 2022 15:15:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH 019/606] drm/bridge: chrontel-ch7033: Convert to i2c's
 .probe_new()
Message-ID: <20221207141546.tvpbgmjej5kmoxtm@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-20-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="l2rbrpd32oap35sa"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-20-uwe@kleine-koenig.org>
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
Cc: kernel@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "linux-i2c@vger.kernel.org Doug Anderson" <dianders@chromium.org>,
 Wolfram Sang <wsa@kernel.org>, Angel Iglesias <ang.iglesiasg@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Grant Likely <grant.likely@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--l2rbrpd32oap35sa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello dear drm/bridge maintainers,

On Fri, Nov 18, 2022 at 11:35:53PM +0100, Uwe Kleine-K=F6nig wrote:
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Do you plan to pick up the drm/bridge patches in the upcoming cycle?

You could do that using:

	git pull https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c=
/client_device_id_helper-immutable
	b4 am -l -3 -P 14-35,37 20221118224540.619276-20-uwe@kleine-koenig.org
	git am -s ./20221118_uwe_i2c_complete_conversion_to_i2c_probe_new.mbx

Note that Doug Anderson already applied the patch for ti-sn65dsi86,
which is patch #36 and so this is skipped in the above range.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--l2rbrpd32oap35sa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOQoA8ACgkQwfwUeK3K
7AmTvQf+O0i7VtSADqiMoJs9sq9Fluo3k8UY/bEqNB+pOcYy235FAgJxc0E9D4gW
BxMvHSQd3ZaTGX/OsHP9M9cAnkPssVsRi8lNXJytML+PHpYzkjQMrae+tRVWbudl
coXdeL48lhc4j2vA2daJOY+yy82MK/e7HOhsa6/7wEZGwap/Xwp/hVYP5VKjCL00
fHtiMFWAhbiH3M0DLsMJHjypPOF5az87YGWHZKoAnEO/4Mmeg5NmrP2wgI1aHskG
t5xsFM7W1+6u2FLzp3Qr3J3IYkvifPJXK7cwDAgvhRHaKenW4fOhxZN7k5I9GnlT
BAE6LlxymZ7ejoDl2VDlbfdrTQ9vOg==
=rylK
-----END PGP SIGNATURE-----

--l2rbrpd32oap35sa--
