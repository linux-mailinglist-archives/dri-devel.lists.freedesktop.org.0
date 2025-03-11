Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914A1A5B690
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 03:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F130310E508;
	Tue, 11 Mar 2025 02:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="X5KhHjqq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCE010E508;
 Tue, 11 Mar 2025 02:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1741659311;
 bh=H3bE3BXEcliSsdQIHq1WNgNGjfLvX5g6Km0crdEHh7E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X5KhHjqq5iXL61SSWrpNhpaqzQCyTaS11sEHf4GE5QWM5Zes3Qv4XwKxb3T18DKfF
 IYe1giSs7SS+ubbFrfjqTAv6J7oyIoigoeaiuKvi4m0Juj8sJSNlahRmJmDSmpI5Pk
 oF9DTByMTMFq6KMqRxmW+2etwmr4oQyyJdqQnoIxsM0tiyzSnQubxyZ60tVRgP34s6
 Mt8OcFWKobL16vSJd19z7XvEzQfCqzmrlsB4eryBjI1z7NkOGqhC6eYY+eSIy61Cw0
 Z+4Ve1xyIbNcRIb9Rg7B7nc3uiIFTWQQUEEr+npOFSk4c67Z6g6Ix3stf3yWeX+KbQ
 lXeWVzXNJGuRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBcmG6ZJHz4x04;
 Tue, 11 Mar 2025 13:15:10 +1100 (AEDT)
Date: Tue, 11 Mar 2025 13:15:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Dave Airlie <airlied@redhat.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Alistair Popple
 <apopple@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, Matthew Brost
 <matthew.brost@intel.com>, DRM XE List <intel-xe@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <20250311131510.2111c8c3@canb.auug.org.au>
In-Reply-To: <20250307132112.18b6ce90@canb.auug.org.au>
References: <20250307132112.18b6ce90@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ei=AgDAf1QEyUaGu.mJ9V3O";
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

--Sig_/Ei=AgDAf1QEyUaGu.mJ9V3O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Fri, 7 Mar 2025 13:21:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the drm-xe tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> In file included from include/linux/kernel.h:22,
>                  from include/linux/cpumask.h:11,
>                  from arch/x86/include/asm/paravirt.h:21,
>                  from arch/x86/include/asm/irqflags.h:80,
>                  from include/linux/irqflags.h:18,
>                  from include/linux/spinlock.h:59,
>                  from include/linux/mmzone.h:8,
>                  from include/linux/gfp.h:7,
>                  from include/linux/mm.h:7,
>                  from include/linux/pagemap.h:8,
>                  from include/drm/ttm/ttm_tt.h:30,
>                  from drivers/gpu/drm/xe/xe_bo.h:9,
>                  from drivers/gpu/drm/xe/xe_svm.c:6:
> drivers/gpu/drm/xe/xe_svm.c: In function 'page_to_vr':
> drivers/gpu/drm/xe/xe_svm.c:344:33: error: 'struct page' has no member na=
med 'pgmap'
>   344 |         return container_of(page->pgmap, struct xe_vram_region, p=
agemap);
>       |                                 ^~
> include/linux/container_of.h:19:33: note: in definition of macro 'contain=
er_of'
>    19 |         void *__mptr =3D (void *)(ptr);                          =
         \
>       |                                 ^~~
> In file included from include/linux/init.h:5,
>                  from include/linux/printk.h:6,
>                  from include/asm-generic/bug.h:22,
>                  from arch/x86/include/asm/bug.h:99,
>                  from include/linux/bug.h:5,
>                  from include/linux/mmdebug.h:5,
>                  from include/linux/mm.h:6:
> drivers/gpu/drm/xe/xe_svm.c:344:33: error: 'struct page' has no member na=
med 'pgmap'
>   344 |         return container_of(page->pgmap, struct xe_vram_region, p=
agemap);
>       |                                 ^~
> include/linux/build_bug.h:78:56: note: in definition of macro '__static_a=
ssert'
>    78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>       |                                                        ^~~~
> include/linux/container_of.h:20:9: note: in expansion of macro 'static_as=
sert'
>    20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||=
       \
>       |         ^~~~~~~~~~~~~
> include/linux/container_of.h:20:23: note: in expansion of macro '__same_t=
ype'
>    20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||=
       \
>       |                       ^~~~~~~~~~~
> drivers/gpu/drm/xe/xe_svm.c:344:16: note: in expansion of macro 'containe=
r_of'
>   344 |         return container_of(page->pgmap, struct xe_vram_region, p=
agemap);
>       |                ^~~~~~~~~~~~
> drivers/gpu/drm/xe/xe_svm.c:344:33: error: 'struct page' has no member na=
med 'pgmap'
>   344 |         return container_of(page->pgmap, struct xe_vram_region, p=
agemap);
>       |                                 ^~
> include/linux/build_bug.h:78:56: note: in definition of macro '__static_a=
ssert'
>    78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>       |                                                        ^~~~
> include/linux/container_of.h:20:9: note: in expansion of macro 'static_as=
sert'
>    20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||=
       \
>       |         ^~~~~~~~~~~~~
> include/linux/container_of.h:21:23: note: in expansion of macro '__same_t=
ype'
>    21 |                       __same_type(*(ptr), void),                 =
       \
>       |                       ^~~~~~~~~~~
> drivers/gpu/drm/xe/xe_svm.c:344:16: note: in expansion of macro 'containe=
r_of'
>   344 |         return container_of(page->pgmap, struct xe_vram_region, p=
agemap);
>       |                ^~~~~~~~~~~~
> include/linux/compiler_types.h:483:27: error: expression in static assert=
ion is not an integer
>   483 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a),=
 typeof(b))
>       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/build_bug.h:78:56: note: in definition of macro '__static_a=
ssert'
>    78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>       |                                                        ^~~~
> include/linux/container_of.h:20:9: note: in expansion of macro 'static_as=
sert'
>    20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||=
       \
>       |         ^~~~~~~~~~~~~
> include/linux/container_of.h:20:23: note: in expansion of macro '__same_t=
ype'
>    20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||=
       \
>       |                       ^~~~~~~~~~~
> drivers/gpu/drm/xe/xe_svm.c:344:16: note: in expansion of macro 'containe=
r_of'
>   344 |         return container_of(page->pgmap, struct xe_vram_region, p=
agemap);
>       |                ^~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   11bbe0d9aa96 ("drm/xe: Add drm_pagemap ops to SVM")
>=20
> interacting with commit
>=20
>   089b22f60a0f ("mm: allow compound zone device pages")
>=20
> from the mm-unstable branch of the mm tree.
>=20
> I have applied the following merge fix patch for today
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 7 Mar 2025 13:14:37 +1100
> Subject: [PATCH] fixup for "drm/xe: Add drm_pagemap ops to SVM"
>=20
>   089b22f60a0f ("mm: allow compound zone device pages")
>=20
> from the mm-unstable branch of the mm tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 516898e99b26..3e829c87d7b4 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -341,7 +341,7 @@ static void xe_svm_garbage_collector_work_func(struct=
 work_struct *w)
> =20
>  static struct xe_vram_region *page_to_vr(struct page *page)
>  {
> -	return container_of(page->pgmap, struct xe_vram_region, pagemap);
> +	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
>  }
> =20
>  static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
> --=20
> 2.45.2

This is now a semantic conflict between the mm tree and the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ei=AgDAf1QEyUaGu.mJ9V3O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPnK4ACgkQAVBC80lX
0Gwt3Qf/QFt6K+0NCWbthrLa8s60vX/xuO9fu+5KuBS7ZE1FChOFbgbRi/z/xflf
MqKqfVskxJoSaGTobKNqKdD0/Of4FrwGo63+14/kGbl3Hj1/9QEzBE5MOYjb7DsJ
t3+uVHgJlxF8lWUEu9TTeS05bHpPB/CdoPehgOQYzYTvQE78ATfTbjhPf0M+fA6n
VKVHWDyALxC7XsVdVM8yY5JuETLpd7144Gxaw+wMuh9rNCECT9G2Y1KKJBZggejf
609UZHsk99f47i5s8HkF0i6VwSiiOjgsTgMz7CS8dbjMSQ1tYAoQetjTQswAQuIB
z615n52fVlxyO405j0SOnz9zskx8gw==
=akB5
-----END PGP SIGNATURE-----

--Sig_/Ei=AgDAf1QEyUaGu.mJ9V3O--
