Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EFE86832E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E1110E0CA;
	Mon, 26 Feb 2024 21:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="J/w3HYpg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0431E10E0CA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 21:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1708983317;
 bh=pGZ4C7xBs4usQOrOhXuZzHgkH0zlwfI0Ey3yEYi9Mak=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J/w3HYpgB/3uhCQzowNVtY41+v8FcBagG/K3aJ7rLZqCEKPIQvW1OmckaSS5A7CjL
 8i25rEvP3y47ty4aOC4BBIwfpbvh1YvVy536v1R3tDKgm34zYvhWyZr3B4zpcgLovp
 /YwuLxog7jlF++9hAduY4T8ny2tA7Bt9KnfP5dxTZVrmR9tP6S9mG+iGCNXneM7wU5
 wdwnSbLWhAFCpntXXyxHpr2wIVSVxm5T+AOcfuXSxoZCH7oz6vLqGPAfI8smr6+k2j
 MHGm+6TpVTiivJlcRuiEJ+Eg6KqE5IOU6Yp6RwQ5Q7VsYeq9VZbXDmjF9C9VQeBpd6
 zIciZ3u2zMXOA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TkDRm5TK2z4wc1;
 Tue, 27 Feb 2024 08:35:16 +1100 (AEDT)
Date: Tue, 27 Feb 2024 08:35:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Stone <daniel@fooishbar.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
Message-ID: <20240227083515.53bc78f5@canb.auug.org.au>
In-Reply-To: <ZdylItWE9YyUKCKI@phenom.ffwll.local>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <akb3fluuli75vh5due5ll7t5igg7oo5vqwkal645hkjkhyqz6w@qu62f5l6joy6>
 <CAPj87rMYC3D-PYtMcTXD3=HqNSpyyVj9jp0nodO+2PebP1guAA@mail.gmail.com>
 <20240221094643.4496313a@canb.auug.org.au>
 <ZdylItWE9YyUKCKI@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qVLGter6N.4bIVnU5u0MmKb";
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

--Sig_/qVLGter6N.4bIVnU5u0MmKb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, 26 Feb 2024 15:50:10 +0100 Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > git://git.freedesktop.org/git/drm/drm.git#topic/drm-ci =20
>=20
> This one you can drop right away, it's all merged, apologies for not
> telling you earlier.

Thanks, removed now.

--=20
Cheers,
Stephen Rothwell

--Sig_/qVLGter6N.4bIVnU5u0MmKb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXdBBMACgkQAVBC80lX
0GyUPAf+K7Ahfeq4cIOCqgUkeyCG3feGUiy56o3A2W0f+R5lekdGPHrqtdPdY/Lp
sHb/r12oe4jkSVjtrnl5idX4OqkYpE8lqK8GtTU1Ae98GQruzXnicyqBskIOu/qZ
8HnkyZTAsdyVBT1LCDcX70ZK1EAHP2mzwA7PjeCvrhq+cP+0glmo5JoUR+YCSI9D
mSuWC6bCDt/xk5JRKg+gWfOcS972HRlTT2VDt2sYlDvDx7Uiq9K+vy5l+PDCtxsF
Xr/ZOfAIAI1tY1eKippczZvuRnFm6xFSd7JoQPSmSDG9n1zBssiA6cknReBfig1T
szEfMdRyQeUVNb4eeTPdxp461C5VeA==
=UNfT
-----END PGP SIGNATURE-----

--Sig_/qVLGter6N.4bIVnU5u0MmKb--
