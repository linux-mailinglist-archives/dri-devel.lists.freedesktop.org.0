Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F332833385
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 11:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496CD10EB37;
	Sat, 20 Jan 2024 10:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C3F10EB36
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 10:06:00 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rR8CU-0004RC-U0; Sat, 20 Jan 2024 11:03:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rR8CS-0017A8-2m; Sat, 20 Jan 2024 11:03:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rR8CR-003wrX-39;
 Sat, 20 Jan 2024 11:03:39 +0100
Date: Sat, 20 Jan 2024 11:03:39 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: atmel, hlcdc: convert pwm bindings to
 json-schema
Message-ID: <xv5nv2tzenkuppfhcrhkfv3ntc5n5p5pt5mka33dwd26jkkdda@agskejqaabwk>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118092612.117491-3-dharma.b@microchip.com>
 <kht2fxv2fbeod4pakk6q6m4gthftdr6asjqjojgb45kqlsrxpl@37umfctsorhs>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hn4duuuau4xew7c5"
Content-Disposition: inline
In-Reply-To: <kht2fxv2fbeod4pakk6q6m4gthftdr6asjqjojgb45kqlsrxpl@37umfctsorhs>
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
Cc: alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 linux4microchip@microchip.com, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, conor.dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, sam@ravnborg.org, lee@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hn4duuuau4xew7c5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jan 18, 2024 at 11:16:49AM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Jan 18, 2024 at 02:56:11PM +0530, Dharma Balasubiramani wrote:
> > Convert device tree bindings for Atmel's HLCDC PWM controller to YAML
> > format.
> >=20
> > Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> I will update the short log to
>=20
> 	dt-bindings: pwm: atmel,hlcdc: Convert bindings to json-schema
>=20
> to match my preferences (unless you object) and apply for next after the
> merge window.

Dropped from my todo-list after Rob's feedback.

Best regards
Uwe


--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hn4duuuau4xew7c5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWrmnsACgkQj4D7WH0S
/k4Evwf+JZJx7peQB9ZNaNwVOaGScaRce7jQlkr6TZUH+fszttEseyB/tucPO6F1
wwQR5xcoJ3OTeAhwycSX5D8DTn6fvaT4Dj8CSxoHdVQ+VxilKSw93Pf0F7Bu/BJ5
+24zWaEiBkUj3LuAubJ6p2uvec+BLZ8iS+iD8s93fXsst0P4Rxn6D3NMawIZdRfY
pZlJLBFY1jG4oqulbJZkVHCKz+tm2D/Prn6M/156bqvhXmAdSL6nDSU8hWwUGgsR
KTwbMOAfYM97UTx6ejOmH/ZEeDwQioDl30OYLluBRCu0A0og5v7Rf7Tj2IBLjqfW
V3c4Jy3A6Uoy4+MMynVotSSuwwmlAw==
=P0ik
-----END PGP SIGNATURE-----

--hn4duuuau4xew7c5--
