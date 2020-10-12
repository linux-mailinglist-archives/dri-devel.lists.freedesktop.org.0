Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C8628ACFA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 06:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A473A6E40F;
	Mon, 12 Oct 2020 04:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFBB6E40F;
 Mon, 12 Oct 2020 04:26:21 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C8lx65jg2z9sTf;
 Mon, 12 Oct 2020 15:26:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1602476779;
 bh=JaoueffLPiqe0vVFbNDyshuQW42Vb35P3hSNJmElmMw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=etiFfRjPep5aCsL5z9RKGh4Bey53GqVtc0RutV4WEoB8f6ghuNvGVDq0rj3o6CP/G
 atWk4UOwfFeXUlKtrMbtyHKwOoqmbRgtKX0b4xfmlPjhG1omOMC0G5DKTCj4ak/3Ou
 n9SIkAo1C1VCIa9nHp4UxtcTKG2xG/iMxkoZ2T2ULT3t3QS9yk4j0c8QHtyll/XdZf
 YvjcaQASdt7Dr17ZI2DsJLuXRobfMm8mf2mXMHCJW9wVjbQtm7XLzys9PX/3u5x/Lw
 bmexy1Cxo76Axl5Fm0N8F6wypRqV4oQLP1vpy5xDsEHtYdxUwu+nfAgp4xLy1iFFRR
 v2NGN7HCbQipw==
Date: Mon, 12 Oct 2020 15:26:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201012152618.5e3116ca@canb.auug.org.au>
In-Reply-To: <20201012152452.432c4867@canb.auug.org.au>
References: <20201008140903.12a411b8@canb.auug.org.au>
 <20201008154202.175fbec7@canb.auug.org.au>
 <20201012152452.432c4867@canb.auug.org.au>
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
Cc: Paul Cercueil <paul@crapouillou.net>, Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1589138908=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1589138908==
Content-Type: multipart/signed; boundary="Sig_/PsBqT+2U+eGmb+1a29SSGu/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PsBqT+2U+eGmb+1a29SSGu/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Just adding Dave to cc's]

On Mon, 12 Oct 2020 15:24:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> On Thu, 8 Oct 2020 15:42:02 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > On Thu, 8 Oct 2020 14:09:03 +1100 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote: =20
> > >
> > > After merging the drm-misc tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:   =20
> >=20
> > In file included from include/linux/clk.h:13,
> >                  from drivers/gpu/drm/ingenic/ingenic-drm-drv.c:10:
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 'ingenic_drm_upd=
ate_palette':
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct ingeni=
c_drm' has no member named 'dma_hwdescs'; did you mean 'dma_hwdesc_f0'?
> >   448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++)=
 {
> >       |                                   ^~~~~~~~~~~
> > include/linux/kernel.h:47:33: note: in definition of macro 'ARRAY_SIZE'
> >    47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __mus=
t_be_array(arr))
> >       |                                 ^~~
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct ingeni=
c_drm' has no member named 'dma_hwdescs'; did you mean 'dma_hwdesc_f0'?
> >   448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++)=
 {
> >       |                                   ^~~~~~~~~~~
> > include/linux/kernel.h:47:48: note: in definition of macro 'ARRAY_SIZE'
> >    47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __mus=
t_be_array(arr))
> >       |                                                ^~~
> > In file included from include/linux/bits.h:22,
> >                  from include/linux/bitops.h:5,
> >                  from drivers/gpu/drm/ingenic/ingenic-drm.h:10,
> >                  from drivers/gpu/drm/ingenic/ingenic-drm-drv.c:7:
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct ingeni=
c_drm' has no member named 'dma_hwdescs'; did you mean 'dma_hwdesc_f0'?
> >   448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++)=
 {
> >       |                                   ^~~~~~~~~~~
> > include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BU=
G_ON_ZERO'
> >    16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)=
); })))
> >       |                                                              ^
> > include/linux/compiler.h:224:46: note: in expansion of macro '__same_ty=
pe'
> >   224 | #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &=
(a)[0]))
> >       |                                              ^~~~~~~~~~~
> > include/linux/kernel.h:47:59: note: in expansion of macro '__must_be_ar=
ray'
> >    47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __mus=
t_be_array(arr))
> >       |                                                           ^~~~~=
~~~~~~~~~~
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in expansion of=
 macro 'ARRAY_SIZE'
> >   448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++)=
 {
> >       |                  ^~~~~~~~~~
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:35: error: 'struct ingeni=
c_drm' has no member named 'dma_hwdescs'; did you mean 'dma_hwdesc_f0'?
> >   448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++)=
 {
> >       |                                   ^~~~~~~~~~~
> > include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BU=
G_ON_ZERO'
> >    16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)=
); })))
> >       |                                                              ^
> > include/linux/compiler.h:224:46: note: in expansion of macro '__same_ty=
pe'
> >   224 | #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &=
(a)[0]))
> >       |                                              ^~~~~~~~~~~
> > include/linux/kernel.h:47:59: note: in expansion of macro '__must_be_ar=
ray'
> >    47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __mus=
t_be_array(arr))
> >       |                                                           ^~~~~=
~~~~~~~~~~
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in expansion of=
 macro 'ARRAY_SIZE'
> >   448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++)=
 {
> >       |                  ^~~~~~~~~~
> > include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width n=
ot an integer constant
> >    16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)=
); })))
> >       |                                                   ^
> > include/linux/compiler.h:224:28: note: in expansion of macro 'BUILD_BUG=
_ON_ZERO'
> >   224 | #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &=
(a)[0]))
> >       |                            ^~~~~~~~~~~~~~~~~
> > include/linux/kernel.h:47:59: note: in expansion of macro '__must_be_ar=
ray'
> >    47 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __mus=
t_be_array(arr))
> >       |                                                           ^~~~~=
~~~~~~~~~~
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.c:448:18: note: in expansion of=
 macro 'ARRAY_SIZE'
> >   448 |  for (i =3D 0; i < ARRAY_SIZE(priv->dma_hwdescs->palette); i++)=
 {
> >       |                  ^~~~~~~~~~
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.c:453:9: error: 'struct ingenic=
_drm' has no member named 'dma_hwdescs'; did you mean 'dma_hwdesc_f0'?
> >   453 |   priv->dma_hwdescs->palette[i] =3D color;
> >       |         ^~~~~~~~~~~
> >       |         dma_hwdesc_f0
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.c: In function 'ingenic_drm_pla=
ne_atomic_update':
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.c:467:3: error: 'crtc_state' un=
declared (first use in this function); did you mean 'ctx_state'?
> >   467 |   crtc_state =3D state->crtc->state;
> >       |   ^~~~~~~~~~
> >       |   ctx_state
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.c:467:3: note: each undeclared =
identifier is reported only once for each function it appears in
> > At top level:
> > drivers/gpu/drm/ingenic/ingenic-drm-drv.c:443:13: warning: 'ingenic_drm=
_update_palette' defined but not used [-Wunused-function]
> >   443 | static void ingenic_drm_update_palette(struct ingenic_drm *priv,
> >       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >  =20
> > > I noticed that the ingenic driver revert I had been waiting for appea=
red
> > > in hte drm-misc tree, so I removed the BROKEN dependency for it, but =
it
> > > produced the above errors, so I have marked it BROKEN again.   =20
>=20
> Any progress on this?  I am still marking CONFIG_DRM_INGENIC as BROKEN
> in the drm and drm-misc trees.

--=20
Cheers,
Stephen Rothwell

--Sig_/PsBqT+2U+eGmb+1a29SSGu/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+D2uoACgkQAVBC80lX
0Gwnowf9G2Odj/qp8Y+TBepUYlByT5rgvdUQpll2T8YtC8laneNWjNSd6w2d+rtR
wqP0fL4IMOePhZ1Zq09hkfe57IFja+2U2/D2Ra/4nWJvVkpkTDgNoBj9nnfvuX6I
YIG+J5AERsCer5RPUB6XO5SOag4oyDa+jxt9LCQkKSzUfbrY7Z1a7mBwtXBBv824
ba5hdJz4QKnGvXP+yYGNLXEVP10LHZFpLhhf1XG+tzwv+aslBY/i38+CwZn39XX4
dgH0iykSfgFqkX9DpBeyfWRwR0wuclFXG1nwmSzihasWklMZDRlaNYb6gliuz9B0
3HCguHgn29KaYpLj39ZDymKuWyQO5w==
=pQfj
-----END PGP SIGNATURE-----

--Sig_/PsBqT+2U+eGmb+1a29SSGu/--

--===============1589138908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1589138908==--
