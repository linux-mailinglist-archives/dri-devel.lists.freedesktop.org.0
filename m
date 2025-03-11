Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A011A5B68A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 03:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23B510E04E;
	Tue, 11 Mar 2025 02:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CCBWMS0b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1D310E04E;
 Tue, 11 Mar 2025 02:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1741659219;
 bh=7Qevq9QzjFUqxnBRE+w/EKgCoGRLm32xgy1oXGbBc64=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CCBWMS0b7iTrrYL+mchXz9lUfSrnkxmwqmxC+8tg68WpcRnTbJmA+Xqa14Tlo+YEm
 Tgo8O6GAgqTYsqgMAGal78N2SrRYej2Oi59XP93H0oK30ESF7BuegfwUFgbS0JNeBH
 2pvBo1B8FIKgL/QnBVa6rHf+rNVUvxouq4OTsCV7pr26QaD8xTmGzFFn7hu2gRNQXV
 nWQqLz1SaHqkhk8mHunUfyqXU2ZQ0GPWv0xFbIaTEykAd5KjNcWtl8jSVlAG6N+vlv
 FIEDJXYSIu65enIpy6h57Z7cPazDqbEYZx1FoUyylKbDumcFjemm21qT9OoV7wLrMg
 f0P9hqtDz0AnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBckW26bzz4wcw;
 Tue, 11 Mar 2025 13:13:39 +1100 (AEDT)
Date: Tue, 11 Mar 2025 13:13:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Dave Airlie <airlied@redhat.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Alistair Popple <apopple@nvidia.com>, Balbir
 Singh <balbirs@nvidia.com>, DRM XE List <intel-xe@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <20250311131338.23a27793@canb.auug.org.au>
In-Reply-To: <20250307125803.198cdedb@canb.auug.org.au>
References: <20250307125803.198cdedb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L5ZJc0WoRyhGhkChn_8Xg_x";
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

--Sig_/L5ZJc0WoRyhGhkChn_8Xg_x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 7 Mar 2025 12:58:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-xe tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/drm_gpusvm.c: In function 'drm_gpusvm_range_get_pages':
> drivers/gpu/drm/drm_gpusvm.c:1404:44: error: 'struct page' has no member =
named 'pgmap'
>  1404 |                         if (pagemap !=3D page->pgmap) {
>       |                                            ^~
> drivers/gpu/drm/drm_gpusvm.c:1410:47: error: 'struct page' has no member =
named 'pgmap'
>  1410 |                                 pagemap =3D page->pgmap;
>       |                                               ^~
>=20
> Caused by commit
>=20
>   99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
>=20
> interacting with commit
>=20
>   089b22f60a0f ("mm: allow compound zone device pages")
>=20
> from the mm-unstable branch of the mm tree.
>=20
> I have applied the following merge fix patch for today.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 7 Mar 2025 12:48:32 +1100
> Subject: [PATCH] fix up for "drm/gpusvm: Add support for GPU Shared Virtu=
al
>  Memory"
>=20
> interacting with commit
>=20
>   089b22f60a0f ("mm: allow compound zone device pages")
>=20
> from the mm-unstable branch of the mm tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index f314f5c4af0f..5e9b18ce65f8 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1401,13 +1401,13 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm =
*gpusvm,
>  				goto err_unmap;
>  			}
>  			zdd =3D page->zone_device_data;
> -			if (pagemap !=3D page->pgmap) {
> +			if (pagemap !=3D page_pgmap(page)) {
>  				if (i > 0) {
>  					err =3D -EOPNOTSUPP;
>  					goto err_unmap;
>  				}
> =20
> -				pagemap =3D page->pgmap;
> +				pagemap =3D page_pgmap(page);
>  				dpagemap =3D zdd->devmem_allocation->dpagemap;
>  				if (drm_WARN_ON(gpusvm->drm, !dpagemap)) {
>  					/*
> --=20
> 2.45.2

This is now a semantic conflict between the mm tree and the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/L5ZJc0WoRyhGhkChn_8Xg_x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPnFIACgkQAVBC80lX
0GyF+Af+PCRiooMk/aMZlisH+em5ZTPvbQy6/Y7mKiAWPVCXI0dxpFZJ/LjJnI86
k65rhtJyrfv2dsPDO1UDlFBL37EZeWX4drT9xuhI1H9UhuVF4pY3E26Q9QWPnlzw
PUOpmyo5+4jHmIJFgglhw7Fankmz4H57jzo+OlAFDqA2AobKOVEicbQ39WkNa3Cp
f90Az9m/xwh1XpWWKwSmap+LfI6GI+kGTflZZKMva5Fbwndo9feeFNQwZ01X7Slc
xHkRKX/r4V9qwGqdWwvP/Iqy5DLh49L6lpz6xGAY4w0BY2cOQ4rTeJPd38h+mF2G
tdLb76+ps9t3hlRw5gCeoTBfhU43wA==
=pgxR
-----END PGP SIGNATURE-----

--Sig_/L5ZJc0WoRyhGhkChn_8Xg_x--
