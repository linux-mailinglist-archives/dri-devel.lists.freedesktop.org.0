Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E403FE525
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 00:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40B289F2A;
	Wed,  1 Sep 2021 22:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C79889F2A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 22:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1630533689;
 bh=BmOhYKXE2qZFZfsXd4GE6m5wy+5xaYYXRavSABb85Xs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kUwMjkpmDxp1jp8EEC09mKkUmAD9D3u9tYzRrriQKkS+NEZp6cCQptNKJrwXuxmd3
 eteZmx9YIlArV8ZB5EfrqELziHixzMr2r4SBWY5g5FgxUzpJiWEtD2Rq4fYaBfC3ar
 5HjndCDuTSUAUoj2q6QpPTBddHSUsXXYvsGH3/hZzJtpkNekSnZj6p6PiWMNunC7l0
 MkfjC0abHs5wXF2P5Y0Sp398obMONd5bfXzfV9Q+81a3eTdr/3E8oxR+kaMmXmqpvX
 XxNJiQw2umgHwKQW9wWw/VKaJi9rDH4pUwwhytcAcER6kJYiqaSnGUFEpMjqcolvAF
 bBLww/9GNtZQA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H0J126w99z9sPf;
 Thu,  2 Sep 2021 08:01:26 +1000 (AEST)
Date: Thu, 2 Sep 2021 08:01:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon
 Romanovsky <leonro@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: build failure after merge of the hmm tree
Message-ID: <20210902080125.2872628b@canb.auug.org.au>
In-Reply-To: <20210823175027.3f3fabd7@canb.auug.org.au>
References: <20210823175027.3f3fabd7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/stlCEP4gLQ3cyH/reb0cPfS";
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

--Sig_/stlCEP4gLQ3cyH/reb0cPfS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi ,

On Mon, 23 Aug 2021 17:50:27 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the hmm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c: In function 'i915_ttm_tt_get_st':
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:396:7: error: implicit declaratio=
n of function '__sg_alloc_table_from_pages'; did you mean 'sg_alloc_table_f=
rom_pages'? [-Werror=3Dimplicit-function-declaration]
>   396 |  sg =3D __sg_alloc_table_from_pages
>       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |       sg_alloc_table_from_pages
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:396:5: warning: assignment to 'st=
ruct scatterlist *' from 'int' makes pointer from integer without a cast [-=
Wint-conversion]
>   396 |  sg =3D __sg_alloc_table_from_pages
>       |     ^
>=20
> Caused by commit
>=20
>   fcbfe956561b ("lib/scatterlist: Provide a dedicated function to support=
 table append")
>=20
> interacting with commit
>=20
>   213d50927763 ("drm/i915/ttm: Introduce a TTM i915 gem object backend")
>=20
> from the drm tree.
>=20
> I have applied the following merge resolution patch.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 23 Aug 2021 17:46:27 +1000
> Subject: [PATCH] drm/i915/ttm: fix up for "lib/scatterlist: Provide a
>  dedicated function to support tableappend"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i9=
15/gem/i915_gem_ttm.c
> index 771eb2963123..d3d95934a047 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -382,7 +382,6 @@ i915_ttm_region(struct ttm_device *bdev, int ttm_mem_=
type)
>  static struct sg_table *i915_ttm_tt_get_st(struct ttm_tt *ttm)
>  {
>  	struct i915_ttm_tt *i915_tt =3D container_of(ttm, typeof(*i915_tt), ttm=
);
> -	struct scatterlist *sg;
>  	struct sg_table *st;
>  	int ret;
> =20
> @@ -393,13 +392,13 @@ static struct sg_table *i915_ttm_tt_get_st(struct t=
tm_tt *ttm)
>  	if (!st)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	sg =3D __sg_alloc_table_from_pages
> +	ret =3D sg_alloc_table_from_pages_segment
>  		(st, ttm->pages, ttm->num_pages, 0,
>  		 (unsigned long)ttm->num_pages << PAGE_SHIFT,
> -		 i915_sg_segment_size(), NULL, 0, GFP_KERNEL);
> -	if (IS_ERR(sg)) {
> +		 i915_sg_segment_size(), GFP_KERNEL);
> +	if (ret) {
>  		kfree(st);
> -		return ERR_CAST(sg);
> +		return ERR_PTR(ret);
>  	}
> =20
>  	ret =3D dma_map_sgtable(i915_tt->dev, st, DMA_BIDIRECTIONAL, 0);

I am now applying this merge fix patch to the merge of the rdma tree
(since that has merged the hmm tree and the drm tree has been merged
upstream).

--=20
Cheers,
Stephen Rothwell

--Sig_/stlCEP4gLQ3cyH/reb0cPfS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEv+DUACgkQAVBC80lX
0Gx9WAf9EPASlxghM4C7XRvD7i/Ap/naEcc9lkxTPGlLfZuyg+sevCTU2HTadYNq
7e4QNotQV8nHaXvCzSwwJ83uYHtVf85mKVgXb+w5cV48E0lk0ASVX5w6KGLOAdpo
WkJUu2CCkxCTPXFrPeK4gBvSLw4Xekv0QskQB/nAon2jfJmQkYXtBPWf2VULegsN
Rp6xj4txXVGj4MEBhGZpFQF2q3D1a+6h/JcbpMUJKTo7n7QEjgzlP6gsLlWng5Qh
FUIYW8GAAZrqcDBaaHsmJHUr/Y5Ow3Jjw4f1imTy72hRHpaF2cn12G+uyK0N39A6
EEc2mV+4nQ1YqrfUC2a1qb1yZlOhjw==
=iXH5
-----END PGP SIGNATURE-----

--Sig_/stlCEP4gLQ3cyH/reb0cPfS--
