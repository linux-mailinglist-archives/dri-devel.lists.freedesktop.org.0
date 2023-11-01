Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 747717DE778
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 22:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB01610E040;
	Wed,  1 Nov 2023 21:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AC310E7BC;
 Wed,  1 Nov 2023 21:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1698874640;
 bh=TWYa5K9/yZGo0dWefhyN/y52uF+cU7stI6Yiq66HcRg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eJf4eiRUphvAJPCc+YE4nhCHyUh7xChuIvXvGdttfXu2vplj7trKKeMHqo5WoCxCr
 FhUD1MLuHNjQm9Bga0VzvLRcyGgTZQxmOqUSkFEsrQYrJCme/8oyPEuYSATHEQ3OvY
 Z5qS10hXFba3/Xr4BHmoujK/UTP7QE+3LSQcu8+BAl3GGSitofGRd+kU9g77QHQn1A
 8CKb8EuraeOCfHdIF2uDOXuAi8TsGITMAiX4FlrvmJCMmmiu4qfHGJQFf9hZxBBnXj
 wBuJnuFlN3agz58iGDXh6bcIjEBej5xg6iy5HsvEcG/xsIjIiWMeNAfNDIf2Ht9OFb
 6SOdYM/zu5IQw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SLL275H1Qz4wcj;
 Thu,  2 Nov 2023 08:37:19 +1100 (AEDT)
Date: Thu, 2 Nov 2023 08:37:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the drm-misc tree with the
 asm-generic tree
Message-ID: <20231102083718.0036fea2@canb.auug.org.au>
In-Reply-To: <20231018124636.4a973762@canb.auug.org.au>
References: <20231013114602.4cea19d1@canb.auug.org.au>
 <20231018124636.4a973762@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dgdxoDFng=1cPgzrqV7RqPu";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/dgdxoDFng=1cPgzrqV7RqPu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 18 Oct 2023 12:46:36 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 13 Oct 2023 11:46:02 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the drm-misc tree got a conflict in:
> >=20
> >   arch/ia64/include/asm/fb.h
> >=20
> > between commit:
> >=20
> >   cf8e8658100d ("arch: Remove Itanium (IA-64) architecture")
> >=20
> > from the asm-generic tree and commit:
> >=20
> >   052ddf7b86d2 ("fbdev: Replace fb_pgprotect() with pgprot_framebuffer(=
)")
> >=20
> > from the drm-misc tree.
> >=20
> > I fixed it up (I just removed the file) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts. =20
>=20
> This is now a conflict between the asm-generic tree and the drm tree.

And now between the asm-generic tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/dgdxoDFng=1cPgzrqV7RqPu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVCxQ4ACgkQAVBC80lX
0GzYZwgAhIHEwFgqish6zxEbyETPuf+e/L3yLSrzFY3vROPhCb7MElNT0Aur2DCt
7lbhzVoC9N0Y+jgxHVzC3tZfGYHVtyyg+f6g5IEFQzDma2wigpf9u+ockyp2X5FO
oSIjB23CeS5zEb/C9+ve+FaIkhvjBYX9iNty/r7PkTQbHtMoLNLhrlih8RF0e431
IkEw0U14a8NKaLU+zOUyTwjPH0NcQJOulUYjdIhuM91F2jaE4zFclf/cxPGV3uyS
tQWnTUAIO5QuLgvLwM1ZR8+EKJvg/gyKfJA38J+XzLLJdeU/yT3W6P7BeRtn8gDG
zTyNNGevgemC77Xd/yEPPWPVEeYE/A==
=UFiq
-----END PGP SIGNATURE-----

--Sig_/dgdxoDFng=1cPgzrqV7RqPu--
