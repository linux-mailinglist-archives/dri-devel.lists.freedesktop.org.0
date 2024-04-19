Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246C48AA905
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 09:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790EF10FDA4;
	Fri, 19 Apr 2024 07:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284F310F8F1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 07:20:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rxiYB-0005ps-9Y; Fri, 19 Apr 2024 09:20:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rxiY9-00D7BW-2B; Fri, 19 Apr 2024 09:20:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rxiY8-003uPa-36;
 Fri, 19 Apr 2024 09:20:44 +0200
Date: Fri, 19 Apr 2024 09:20:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/4] gpu: Convert to platform remove callback returning
 void
Message-ID: <xqwcrxfrg3ogplh35c5etl6nbzw6zueilm4h6euh7bnpszyir4@6dtn5qdvijv3>
References: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zqtl7cbpfineoepn"
Content-Disposition: inline
In-Reply-To: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zqtl7cbpfineoepn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Apr 09, 2024 at 07:02:47PM +0200, Uwe Kleine-K=F6nig wrote:
> with some patches sent earlier[1], this series converts all platform
> drivers below drivers/gpu to not use struct platform_device::remove()
> any more.
>=20
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
>=20
> All conversations are trivial, because the driver's .remove() callbacks
> returned zero unconditionally.
>=20
> There are no interdependencies between these patches. This is merge
> window material.

I wonder how this series will make it in. While I would prefer these
patches to go in together (that I can consider this thread completed in
one go), I think with how drm maintenace works, it's best if the patches
are picked up by their individual maintainers. I guess that's:

 - Frank Binns + Matt Coster for imagination

 - Chun-Kuang Hu + Philipp Zabel for mediatek

 - Thierry Reding + Mikko Perttunen for the host1x driver
   (Note there is another patch for this driver set at
    20240409165043.105137-2-u.kleine-koenig@pengutronix.de that is
    relevant for the same quest.)

 - Philipp Zabel for ipu-v3

I plan to send a patch changing struct platform_driver::remove after the
end of the merge window leading to 6.10-rc1 for inclusion in next via
Greg's driver core. So please either care the patches land in 6.10-rc1
or ack that I include them in the submission to Greg.

Thanks for your cooperation,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zqtl7cbpfineoepn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYiG0sACgkQj4D7WH0S
/k5uYwf/bmP6h2EDhf4HeD6t6iH04mtOMqGj0P+x7unUIW9fwa+06Vtnjj0TW/DR
WgWu8rFS3I02j3D51b14SGZRNrIEXwSkNNVQLPZbe8pu9akVVYtymL7xxNM4ksLk
83PrwKdtdx2khdWfc7kOWM+zu2IkKTkHvRQqrx/jCrz9OpAA+2DJpqtt0CnYOMgu
eF4ev9d7wG7VdP8jks1/anWuqbDAIVStCnA1MaCISsXl2e2ZGZfSE99Mg1h94eLd
AX2IRPASplCkOA1L2Klfkye65Pqyfi1gnxnawcUbhkcZ4ffdg7jFAEaCXPqfHEKP
w+LYkIVZlBBGdz0EuoGrVlGwPo7Ixg==
=stkl
-----END PGP SIGNATURE-----

--zqtl7cbpfineoepn--
