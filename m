Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C528ACF6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 06:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1146E417;
	Mon, 12 Oct 2020 04:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1B46E40D;
 Mon, 12 Oct 2020 04:24:58 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C8lvV5YHWz9sTr;
 Mon, 12 Oct 2020 15:24:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1602476696;
 bh=V42sruk0+lv2KrynPMxQFmIBmqyCNPJsMXYMk6z+xUs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pEu8KRyuzcu0JerpjF/Dod+RgU5S9805mP5dJOyncw8NE942wFoYfqXMA6UL15RqF
 1ds6SjHv8fk/De4eL7WOwjILSYj3fnzHVzpe3Za2jxYc1o6LH5kR2OQQt19WH4q3nD
 J3oWYRfU6ZVur9u0hzbx6ZyszPEmLFF/eR4Ab9Rbn96COFZDR+zYor/bNvKwYzrL3M
 HzCY06ulR2lm7q9Kgm6aheimun8YJl4RJ7bW7bzChybrwcvZN6SGaM/9jThvhCWImP
 LxK8dHypm9NraldhduDQG53uiTZIBqiR8Wmo49prk0Ecyipi80qavVmhBeQNNWQI4a
 /li+fNC9oeuWA==
Date: Mon, 12 Oct 2020 15:24:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201012152452.432c4867@canb.auug.org.au>
In-Reply-To: <20201008154202.175fbec7@canb.auug.org.au>
References: <20201008140903.12a411b8@canb.auug.org.au>
 <20201008154202.175fbec7@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0032848248=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0032848248==
Content-Type: multipart/signed; boundary="Sig_/mU+rg28WViFZLTuKkAevgnd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mU+rg28WViFZLTuKkAevgnd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 8 Oct 2020 15:42:02 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Thu, 8 Oct 2020 14:09:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this: =20
>=20
> In file included from include/linux/clk.h:13,
>                  from drivers/gpu/drm/ingenic/ingenic-drm-drv.c:10:
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 'ingenic_drm_updat=
e_palette':
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct ingenic_=
drm' has no member named 'dma_hwdescs'; did you mean 'dma_hwdesc_f0'?
>   448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
>       |                                   ^~~~~~~~~~~
> include/linux/kernel.h:47:33: note: in definition of macro 'ARRAY_SIZE'
>    47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_=
be_array(arr))
>       |                                 ^~~
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct ingenic_=
drm' has no member named 'dma_hwdescs'; did you mean 'dma_hwdesc_f0'?
>   448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
>       |                                   ^~~~~~~~~~~
> include/linux/kernel.h:47:48: note: in definition of macro 'ARRAY_SIZE'
>    47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_=
be_array(arr))
>       |                                                ^~~
> In file included from include/linux/bits.h:22,
>                  from include/linux/bitops.h:5,
>                  from drivers/gpu/drm/ingenic/ingenic-drm.h:10,
>                  from drivers/gpu/drm/ingenic/ingenic-drm-drv.c:7:
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct ingenic_=
drm' has no member named 'dma_hwdescs'; did you mean 'dma_hwdesc_f0'?
>   448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
>       |                                   ^~~~~~~~~~~
> include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_=
ON_ZERO'
>    16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e));=
 })))
>       |                                                              ^
> include/linux/compiler.h:224:46: note: in expansion of macro '__same_type'
>   224 | #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a=
)[0]))
>       |                                              ^~~~~~~~~~~
> include/linux/kernel.h:47:59: note: in expansion of macro '__must_be_arra=
y'
>    47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_=
be_array(arr))
>       |                                                           ^~~~~~~=
~~~~~~~~
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in expansion of m=
acro 'ARRAY_SIZE'
>   448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
>       |                  ^~~~~~~~~~
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct ingenic_=
drm' has no member named 'dma_hwdescs'; did you mean 'dma_hwdesc_f0'?
>   448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
>       |                                   ^~~~~~~~~~~
> include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_=
ON_ZERO'
>    16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e));=
 })))
>       |                                                              ^
> include/linux/compiler.h:224:46: note: in expansion of macro '__same_type'
>   224 | #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a=
)[0]))
>       |                                              ^~~~~~~~~~~
> include/linux/kernel.h:47:59: note: in expansion of macro '__must_be_arra=
y'
>    47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_=
be_array(arr))
>       |                                                           ^~~~~~~=
~~~~~~~~
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in expansion of m=
acro 'ARRAY_SIZE'
>   448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
>       |                  ^~~~~~~~~~
> include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not=
 an integer constant
>    16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e));=
 })))
>       |                                                   ^
> include/linux/compiler.h:224:28: note: in expansion of macro 'BUILD_BUG_O=
N_ZERO'
>   224 | #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a=
)[0]))
>       |                            ^~~~~~~~~~~~~~~~~
> include/linux/kernel.h:47:59: note: in expansion of macro '__must_be_arra=
y'
>    47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_=
be_array(arr))
>       |                                                           ^~~~~~~=
~~~~~~~~
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in expansion of m=
acro 'ARRAY_SIZE'
>   448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++) {
>       |                  ^~~~~~~~~~
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:453:9: error: 'struct ingenic_d=
rm' has no member named 'dma_hwdescs'; did you mean 'dma_hwdesc_f0'?
>   453 |   priv->dma_hwdescs->palette[i] =3D color;
>       |         ^~~~~~~~~~~
>       |         dma_hwdesc_f0
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 'ingenic_drm_plane=
_atomic_update':
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:467:3: error: 'crtc_state' unde=
clared (first use in this function); did you mean 'ctx_state'?
>   467 |   crtc_state =3D state->crtc->state;
>       |   ^~~~~~~~~~
>       |   ctx_state
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:467:3: note: each undeclared id=
entifier is reported only once for each function it appears in
> At top level:
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c:443:13: warning: 'ingenic_drm_u=
pdate_palette' defined but not used [-Wunused-function]
>   443 | static void ingenic_drm_update_palette(struct ingenic_drm *priv,
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> > I noticed that the ingenic driver revert I had been waiting for appeared
> > in hte drm-misc tree, so I removed the BROKEN dependency for it, but it
> > produced the above errors, so I have marked it BROKEN again. =20

Any progress on this?  I am still marking CONFIG_DRM_INGENIC as BROKEN
in the drm and drm-misc trees.
--=20
Cheers,
Stephen Rothwell

--Sig_/mU+rg28WViFZLTuKkAevgnd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+D2pQACgkQAVBC80lX
0GwWswgAoQjqIMp6/EDG0a9l7HrawiqW+u8IT7Kz2YF8D2exgrPek75c0eSKWjHm
Tgs0l9NVHZ/QQ1AZxwu2N9jwDZlJIgSUr7Y7jRsCOfAgkgi6Whdd0fIsJI4psgsf
8m6Hbjl6zErvkxDGk2MMA7xUjxkzft7r8SC9gt6yViCAerbVvsCkYFCpdyiEY1ll
Vsm9EQFF4NH5wZS4PcAfNn4kYv47h8rFRDvyToMjvWONPZYWutJ8D4LeBOFhTxCH
+d0Iod6poifszGtp/VJrub1C/f5Ue8lp2Nf/htLcg2DH0FFhA1tGr2wB3dn0dT3D
0N1kL0EBG+N/Guiljcd8xEpaPRBh7Q==
=3cru
-----END PGP SIGNATURE-----

--Sig_/mU+rg28WViFZLTuKkAevgnd--

--===============0032848248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0032848248==--
