Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1A64EABB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 12:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14C010E5B1;
	Fri, 16 Dec 2022 11:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8431110E113
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 11:38:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p692x-0007kU-FG; Fri, 16 Dec 2022 12:38:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p692u-004uXs-HA; Fri, 16 Dec 2022 12:38:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p692u-005WRG-EK; Fri, 16 Dec 2022 12:38:32 +0100
Date: Fri, 16 Dec 2022 12:38:32 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: imx: Describe drm binding
 for fsl,imx-lcdc
Message-ID: <20221216113832.6qvyzlrwfzrlhker@pengutronix.de>
References: <20221214115921.1845994-1-u.kleine-koenig@pengutronix.de>
 <20221214115921.1845994-2-u.kleine-koenig@pengutronix.de>
 <0f3e755f-954a-9722-6898-181170deb2c3@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vomqdkuv5b6duabq"
Content-Disposition: inline
In-Reply-To: <0f3e755f-954a-9722-6898-181170deb2c3@linaro.org>
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
Cc: devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vomqdkuv5b6duabq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 16, 2022 at 11:41:30AM +0100, Krzysztof Kozlowski wrote:
> On 14/12/2022 12:59, Uwe Kleine-K=F6nig wrote:
> > Modify the existing (fb-like) binding to support the drm-like binding in
> > parallel.
>=20
> Aren't you now adding two compatibles to the same hardware, just for two
> Linux drivers? One hardware should have one compatible, regardless of
> Linux display implementation.

The (up to now unopposed) idea was to use the opportunity to pick a
better name for the compatible. The hardware component is called LCDC
and I guess fsl,imx21-fb was only picked because the linux driver is
called imxfb. Unless I understood Rob wrong, he insisted to describe
both variants in a single binding document only.

> > +if:
>=20
> Put it under allOf. It grows pretty often so this would avoid future
> re-indents.

ok.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vomqdkuv5b6duabq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOcWLUACgkQwfwUeK3K
7Al9/wf/ZOo18OuIXv1lM+hxI9+4bUYsHMvey+G65EOqkXqkRZfOFZjeVsypRYEX
rk9Ws23MqhB6lYN7sUVwxiwtFJxtgJJ4rzwSisF83nCfnEnTiA1nkj1N5aJLAoEy
nzBN4aWkSmUisjB1dUgz702jYUAdEwaPqf7Mbe+jqTKFhm99A4pPCCfYWqJSGDKI
c8IupblZq2X59wlWnRKRbfIJQXujGomVE/lTzBdLvQDuiyYpXTqDVjM/bx7DTwtF
k2U8AEDM/DSl5ByO5esfQcCDV1Z/jjZh1F+OI1IFn60cI7j194c34m6cK5uIENPu
D6XB0+QlReZYOa72RW/ejUDOTgpyQA==
=tu0Y
-----END PGP SIGNATURE-----

--vomqdkuv5b6duabq--
