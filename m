Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560624391D5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 10:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E438588697;
	Mon, 25 Oct 2021 08:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9B088697
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 08:58:29 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mevoA-0002sk-Ad; Mon, 25 Oct 2021 10:58:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mevo7-00029q-84; Mon, 25 Oct 2021 10:58:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mevo7-0007eQ-6e; Mon, 25 Oct 2021 10:58:15 +0200
Date: Mon, 25 Oct 2021 10:58:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Doug Anderson <dianders@google.com>
Subject: Re: [PATCH v6 1/3] pwm: Introduce single-PWM of_xlate function
Message-ID: <20211025085815.wrvifi3kmviw7jpw@pengutronix.de>
References: <20210930030557.1426-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="muvk4bp3iyxkfh5l"
Content-Disposition: inline
In-Reply-To: <20210930030557.1426-1-bjorn.andersson@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--muvk4bp3iyxkfh5l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 29, 2021 at 10:05:55PM -0500, Bjorn Andersson wrote:
> The existing pxa driver and the upcoming addition of PWM support in the
> TI sn565dsi86 DSI/eDP bridge driver both has a single PWM channel and
> thereby a need for a of_xlate function with the period as its single
> argument.
>=20
> Introduce a common helper function in the core that can be used as
> of_xlate by such drivers and migrate the pxa driver to use this.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I'm OK with this patch, in the long run I'd like to share more code with
of_pwm_xlate_with_flags, but this shouldn't be a stopper here.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--muvk4bp3iyxkfh5l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmF2caQACgkQwfwUeK3K
7Alt7Af/a8nhxh/xMENHkzBDVn57d2C7qsBdAEnOKYmtoLJheJpFRCDPP1lNm54d
6qlewUjuQAAwqO93kCcufhzwIHrgl73SVvr4iqgw8P8fmwM/xrkovALRkeL771xD
veid1BSxIOJtJDjbYNf0rEBSXMkhN4I5LUDahJzezG1be5ULwexNiBpibDnPnR2L
jseYVX2ipv6L4FVf2TceJAP5TuLRRVCGzRGxAfKvIG3WA71Z+EhsjurvKEbKvBSi
qW68/MIFahttoB5VF3PQZ8mYUF+lbOOnnO4uT+i+fLF4unm9rLu+6pmnp69V95QV
Sd1y58/frTRWk7Vo38MBuwav2HXo3g==
=BOeX
-----END PGP SIGNATURE-----

--muvk4bp3iyxkfh5l--
