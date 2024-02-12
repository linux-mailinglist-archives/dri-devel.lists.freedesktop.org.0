Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE55850C93
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 02:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B2310E695;
	Mon, 12 Feb 2024 01:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="n1Af6FLm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDBF10E27A;
 Mon, 12 Feb 2024 01:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1707701116;
 bh=OWesm9ZaPP1Ioi7rhwLGfscD4uWjzx5qKU5sLm4C0BU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n1Af6FLmpP5iUjXjnwQj9zU0gwLvuidHJ1gB2y5cYiGTabr+qRn5yWzmoEO2guwVL
 HQu3rSc/BIMZsif+RMDGOcE6eE5Ph8U2BsNlBeM+fprVdW/87UzA+xMvG2vCrA+/zH
 a3ACJLgcrDYW2u+2tLYkjsNQt22QS2Q1ZUxor9vORzI5+dBvVCeEmwOdUpQK9YU1Gy
 E51+yhMhtCiHK3EqzovlxuSXMJoroFhaCwKXabXlyD6fJL21GOl/8VWd4wXs/oEzNd
 6cpv0LX1wdCrDQnJQDCU+dJgeKWVeH2S7D230gUJ7pBPO3brtMH2YPp5W7PxS/xfIV
 kNXFF7L3PSrRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TY6G32QKhz4wcY;
 Mon, 12 Feb 2024 12:25:15 +1100 (AEDT)
Date: Mon, 12 Feb 2024 12:25:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Somalapuram
 Amaranath <Amaranath.Somalapuram@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20240212122513.062a3b35@canb.auug.org.au>
In-Reply-To: <20240206152850.333f620d@canb.auug.org.au>
References: <20240206152850.333f620d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x585PivuSvMebdPb5YpnyzL";
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

--Sig_/x585PivuSvMebdPb5YpnyzL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 6 Feb 2024 15:28:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-misc tree, today's linux-next build (i386 defconfig)
> failed like this:
>=20
> In function 'i915_ttm_placement_from_obj',
>     inlined from 'i915_ttm_get_pages' at drivers/gpu/drm/i915/gem/i915_ge=
m_ttm.c:847:2:
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:165:18: error: 'places[0].flags' =
is used uninitialized [-Werror=3Duninitialized]
>   165 |         places[0].flags |=3D TTM_PL_FLAG_DESIRED;
>       |         ~~~~~~~~~^~~~~~
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c: In function 'i915_ttm_get_pages':
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:837:26: note: 'places' declared h=
ere
>   837 |         struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1];
>       |                          ^~~~~~
>=20
> Caused by commit
>=20
>   a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")
>=20
> I applied the following hack for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 6 Feb 2024 15:17:54 +1100
> Subject: [PATCH] drm/ttm: initialise places
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index 80c6cafc8887..34e699e67c25 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -834,7 +834,7 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_o=
bject *obj,
> =20
>  static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
>  {
> -	struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1];
> +	struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1] =3D {};
>  	struct ttm_placement placement;
> =20
>  	/* restricted by sg_alloc_table */
> --=20
> 2.43.0

I am still applying the above patch :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/x585PivuSvMebdPb5YpnyzL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXJc3kACgkQAVBC80lX
0GzyWQf8DEwy3D9cj8T/rxk2jdAB76rQVtp4C8LU3BXNWH9jjryjtoepjKDPtkcW
txcB8O417p3T5fX/UHxamm0B/rWKYqIzdMWxwUpFb0s1MAIt3BxAGrdlH3TaS9BN
u6OrWNQo/3W7ixjuGT5jJJwuEPnGVGPOSlDRswUPON711II3epDR7zuEX/isqByJ
HjXh2DK8vJR4TFX559KwJfM7i7yhOKaleGks1I1t2+iE4zEInibmaCbXAKVYG4i9
OccXLh2o18szdq6feUSts4BzZAIav+tZp9BdcvM9XGphJZvLMbwwqpy8sZcTrAJl
I8cfLQdibIufuKx9+v6vwhQlySWBsw==
=dfOJ
-----END PGP SIGNATURE-----

--Sig_/x585PivuSvMebdPb5YpnyzL--
