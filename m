Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA506C7C51A
	for <lists+dri-devel@lfdr.de>; Sat, 22 Nov 2025 04:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E73310E021;
	Sat, 22 Nov 2025 03:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tVoIRY2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA3410E021
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Nov 2025 03:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1763783182;
 bh=wNOkLSzojhQ1ZFLrlyHfJzdv169QnCIrn+vZOSuHhWo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tVoIRY2wNZz7o9pEZyakifAKu9S0iCA8glZJD+XtCG1YcJgLZ+/dUVCngOwWG2NBQ
 ejFvYOdPzrARz7lmJWjp/5fDvHyjzCF/pxzCZAUg8rfoIA1tvvp+RcVH7HGHZnHfSE
 Nj+Kbxa5lveGBZMbSs9xKbvbrCd3CnOr8ei1lg1ks58kq48poEsotzqEFJePTu9v7y
 U6gAYsLGwzf8r1StFgt5gDrounJzwlOQu1Tw/uNCEOmQPocKxOJxDrtoOkOYxYkSIT
 RXOTzv4AYAMda03lG/ERFyguCSUZId4GYHhnD7wibEdfdGyuASfYf1eC8WApYVnaLc
 9ux+0KP4AqoFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCygK2RL1z4w93;
 Sat, 22 Nov 2025 14:46:21 +1100 (AEDT)
Date: Sat, 22 Nov 2025 14:46:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, Alessio Belle
 <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-next@vger.kernel.org>
Subject: Re: [PATCH v2] drm/imagination: Document pvr_device.power member
Message-ID: <20251122144619.73fa991d@canb.auug.org.au>
In-Reply-To: <20251121-device-power-doc-fix-v2-1-3417779f36c7@imgtec.com>
References: <20251121-device-power-doc-fix-v2-1-3417779f36c7@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Cm/GPoMjwyc8_m+4cR7fODW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/Cm/GPoMjwyc8_m+4cR7fODW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Fri, 21 Nov 2025 15:20:31 +0000 Matt Coster <matt.coster@imgtec.com> wro=
te:
>
> Based on the build target indicated in the report, I tried (and failed)
> to reproduce the reported warning using:
>=20
>    make W=3D1 htmldocs
>=20
> I was, however, able to get the reported warning (and verify that this
> patch clears it) using:
>=20
>    scripts/kernel-doc -none drivers/gpu/drm/imagination/pvr_device.h
>=20
> Does anyone have any ideas why my invocation of htmldocs didn't seem to
> have the same effect? Is it just simply that the relevant doc comment
> isn't pulled into any of the rst docs; in which case how did the
> linux-next build catch this warning?

I just do "make htmldocs" on the final linux-next tree each day, so I
have no idea what makes a difference, sorry.

--=20
Cheers,
Stephen Rothwell

--Sig_/Cm/GPoMjwyc8_m+4cR7fODW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkhMgsACgkQAVBC80lX
0Gy2Vgf3et90wX9wzyf8/OHK4kFQbn0dqj9uWfZr8X7qKrJXo1N2B4RIF2izCDHo
I1W0TrbQS4BVlMggKbiYuy9cmYDUmhCPPC5KCyf0XM39+sbEjV0dzzM3OU1yifyy
kwiE7QesfVsCt4a4JIRiWLErnHjQICxcPcxMzIQirPYNHezHYC9LqA3emLBU7WCR
haLhQYNRUQJ+gZugT9xAoSiRUiRchymH4YEUvfiIrgaF1DG1pwx3SbUz135YnZIW
9UXba+CrVLwVgk5iOJUVw4ZA1v1ei26S9ysJFriJpNrSGiO+hZb0WmcSmFvwjj1u
Xzax5hXklXMAQUUws/fTZp4qHhAg
=hEPY
-----END PGP SIGNATURE-----

--Sig_/Cm/GPoMjwyc8_m+4cR7fODW--
