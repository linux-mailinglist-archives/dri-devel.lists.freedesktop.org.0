Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C350BA18D64
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 09:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B12610E689;
	Wed, 22 Jan 2025 08:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2B210E689
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 08:09:43 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1taVnm-00037x-Et; Wed, 22 Jan 2025 09:09:30 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1taVnk-001Fbs-23;
 Wed, 22 Jan 2025 09:09:28 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 3FAD33AE29B;
 Wed, 22 Jan 2025 08:09:28 +0000 (UTC)
Date: Wed, 22 Jan 2025 09:09:27 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Arnd Bergmann <arnd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>, 
 Jocelyn Falempe <jfalempe@redhat.com>, Jani Nikula <jani.nikula@intel.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: select DRM_KMS_HELPER from DRM_GEM_SHMEM_HELPER
Message-ID: <20250122-thundering-groovy-alpaca-5dcc32-mkl@pengutronix.de>
References: <20250122064655.1095176-1-arnd@kernel.org>
 <2a62b147-4ce2-485e-ba51-421c82decc81@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yp6oylcpoarmftlk"
Content-Disposition: inline
In-Reply-To: <2a62b147-4ce2-485e-ba51-421c82decc81@suse.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yp6oylcpoarmftlk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: select DRM_KMS_HELPER from DRM_GEM_SHMEM_HELPER
MIME-Version: 1.0

On 22.01.2025 08:53:40, Thomas Zimmermann wrote:
[...]

> I think this patch fixes
>=20
> =C2=A0https://lore.kernel.org/dri-devel/a5a98971-405e-496b-89a4-75a61fd6d=
898@suse.de/T/#mcc9fa26b2980b93dc688061884119a3dd0277dc5

Yes it does! \o/

> Could you please add Closes and Reported-by tags?

Closes: https://lore.kernel.org/all/20250121-greedy-flounder-of-abundance-4=
d2ee8-mkl@pengutronix.de
Reported-by: Marc Kleine-Budde <mkl@pengutronix.de>
Tested-by: Marc Kleine-Budde <mkl@pengutronix.de>

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--yp6oylcpoarmftlk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmeQp7UACgkQKDiiPnot
vG8Pwgf7BaQlFRhX1BICGdPv6qJPk+j4dZeCDdrmop0+m3d9DOR/X3wI6j/P7cYR
yW/KlKl7hDmTThUJK5xwYoWNOo9bt8hs5iU6pdKq6lcBSoqu84qCkDE1cOVR8CFl
1C45zjgaXEQvPpkSahTzeR3SdKh0Py/Rm+3ZpVkIV9he3542xU9/4WWNMLFI6g9S
ng6A6c3J9SdatPCoqlmGl8Sz+tLfVrxNO7ueAnoYM4V1Xdz+PMqmG+nYmBBouqjC
iZg+2TvCxYVVgfrZ9AvkvlmekRUTeNWNmywbpy0lCsWjBz/w6C6RKZ4+nri7uloZ
o9kFG3fganZRVA0A0NvPaxoRf9jFew==
=dvvW
-----END PGP SIGNATURE-----

--yp6oylcpoarmftlk--
