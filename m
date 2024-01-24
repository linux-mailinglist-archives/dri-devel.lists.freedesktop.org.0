Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F46683A47C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 09:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A8A10F688;
	Wed, 24 Jan 2024 08:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B7710F68F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 08:46:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSYrU-0007b7-9M; Wed, 24 Jan 2024 09:43:56 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rSYrR-00211Y-V7; Wed, 24 Jan 2024 09:43:53 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rSYrR-006zr9-2i;
 Wed, 24 Jan 2024 09:43:53 +0100
Date: Wed, 24 Jan 2024 09:43:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org
Subject: Re: [PATCH 0/5] pwm: Some improvements around .of_xlate()
Message-ID: <66laypnixxg6pvl6keu3zwyzppw4iwbvz2g32euoypymiwqcmv@2pohr23hceg7>
References: <cover.1704835845.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qevj6uqvskaa6zqk"
Content-Disposition: inline
In-Reply-To: <cover.1704835845.git.u.kleine-koenig@pengutronix.de>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alexander Shiyan <shc_work@mail.ru>, Jonas Karlman <jonas@kwiboo.se>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qevj6uqvskaa6zqk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jan 09, 2024 at 10:34:30PM +0100, Uwe Kleine-K=F6nig wrote:
> the first patch is a fix for an out-of-bounds access and so should
> probably go in quickly. The other changes are merge window material.
>=20
> Best regards
> Uwe
>=20
> Uwe Kleine-K=F6nig (5):
>   pwm: Fix out-of-bounds access in of_pwm_single_xlate()
>   pwm: Drop useless member .of_pwm_n_cells of struct pwm_chip
>   pwm: Let the of_xlate callbacks accept references without period
>   pwm: clps711x: Drop custom .of_xlate() callback
>   pwm: Drop duplicate check against chip->npwm in
>     of_pwm_xlate_with_flags()
>=20
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c |  1 -
>  drivers/pwm/core.c                    | 45 +++++++--------------------
>  drivers/pwm/pwm-clps711x.c            | 11 -------
>  drivers/pwm/pwm-cros-ec.c             |  1 -
>  drivers/pwm/pwm-pxa.c                 |  4 +--
>  include/linux/pwm.h                   |  2 --
>  6 files changed, 13 insertions(+), 51 deletions(-)

The first patch is already contained in v6.8-rc1, I applied the
remaining 4 patches to my repo at

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-next

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qevj6uqvskaa6zqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWwzcgACgkQj4D7WH0S
/k6o0Qf/djY3orpg33cVxhojPEMtT+5dcT6rmUISLQymmg8t8lQqt4D+oSPu8m6i
OV6XRXMgJSKWE5TaJzPWPxQp36cKBKPmFZXoZzQD09l58GdUCTFo/3tQtUd0UJfu
BhmcfecJH+o3G8JTDqy849FCfn/fsDtbkAPjmPMJHR+aZ/H5bP3pj8O3xLRk3Qu/
bH5P/VxDTvPTBJO8Z5DfcZzU4P0p4Ah24HDorvMyV3cxzIHrmLVsrCRmkigpnASq
9yq5F5NDraP/Xta9KhFG3Vtl+69M7DfzvtFIFvZ6CXdqkDCVqf5dy6/Gv/a6Z7Vs
9ppJ7q/IyMgYZ0gaEHgOOArCw7FILA==
=xzTn
-----END PGP SIGNATURE-----

--qevj6uqvskaa6zqk--
