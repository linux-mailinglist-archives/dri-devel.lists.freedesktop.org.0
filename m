Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC852826AD6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B7C10E1CA;
	Mon,  8 Jan 2024 09:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9054310E1CA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:37:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rMm4F-0005bn-HC; Mon, 08 Jan 2024 10:37:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rMm4D-001DLw-PW; Mon, 08 Jan 2024 10:37:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rMm4D-004kGd-2D;
 Mon, 08 Jan 2024 10:37:09 +0100
Date: Mon, 8 Jan 2024 10:37:09 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH v2 1/2] platform_device: add devres function region-reqs
Message-ID: <hywkbwwwkddbd5vye366bhz64dlpet4chv3kzwfu5dx6rvvix6@2jnk3xx6vfiy>
References: <20240108092042.16949-2-pstanner@redhat.com>
 <20240108092042.16949-3-pstanner@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="u2x5uc4opgrguykv"
Content-Disposition: inline
In-Reply-To: <20240108092042.16949-3-pstanner@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, David Gow <davidgow@google.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--u2x5uc4opgrguykv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Philipp,

the Subject is incomprehensible (to me). Maybe make it:

	platform_device: Add devm function to simplify mem and io requests

?

On Mon, Jan 08, 2024 at 10:20:42AM +0100, Philipp Stanner wrote:
> Some drivers want to use (request) a region exclusively but nevertheless
> create several mappings within that region.
>=20
> Currently, there is no managed devres function to request a region
> without mapping it.
>=20
> Add the function devm_platform_get_resource().
                             ^
Still the old function name -'

Other than that I indifferent if this is a good idea. There are so many
helpers around these functions ...

Best regards
Uwe



--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--u2x5uc4opgrguykv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWbwkQACgkQj4D7WH0S
/k6A1QgAjuIEMw9O4acMUhaTNybVbHuVhhGFNsFpYYLQ/0HVR5Gsiu2H3fVD/Zsc
W3iZjaXPDTicquu+VA8gGkvfz0/ezaFIM9Iip8x3UZ3+DsaiNtgkMSnr0hdM/7jp
xoeV44watgWfq+1SaJm+qxHX+2xKWhLbKl0BFzis70MbTiogF4H3MbwoVwf0hrV6
IAcbQOsIhLPQ9Cd0q6MeOZriNdloXPGU4N6lPAmW+4M3cl3uLzFxE78nkCBCCvm/
bVZoBAjQnqbmyJbc1GDDBebbmPZKEkLu1TufZrqJq0w8aRHpzQARJz5xpHKP2Lsj
uK/HSn+FHzyaLf3lCsonTJJailReHA==
=AVm/
-----END PGP SIGNATURE-----

--u2x5uc4opgrguykv--
