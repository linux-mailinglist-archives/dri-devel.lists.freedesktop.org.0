Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B56CD25A3D4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 05:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6A26E4CD;
	Wed,  2 Sep 2020 03:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB7D6E126;
 Wed,  2 Sep 2020 03:11:20 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bh8915lcfz9sV7;
 Wed,  2 Sep 2020 13:11:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1599016278;
 bh=fMqQBM/WSVxCFrgE4f9I7KOjhhp1KYxGJKwaQlaQgxg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ms9sZ7/h81j0dqSoC4IWiudG/R69XosP+PQZtVPtFo6dn50GXhQi0vrAP7F+yu1Og
 spqjdKdxGXaw5hsFlze9fA8PuiB5se7H80ROXJIGxYpTfHkQIq7XlHVY+HdOFUgZk7
 ggkD7q3N9zsMme+vPwC+DXJOijBkPGZuq+pOwQgws5JU3t394B+Cycr/G+hYodgb71
 usX/i9vhqcJCI+I5mImq6ivT/20elSyTzf39bYxtERKE2//FG0hoD4g4F8OLo83OjT
 07zqSlZWPQogXsuTbtIPKdCGr/PPYIJ4GYxpyHvs7LTyh8RGE1itvIzmqEeOBm2JH2
 FPBK0qmvI6dCg==
Date: Wed, 2 Sep 2020 13:11:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20200902131116.053cefe5@canb.auug.org.au>
In-Reply-To: <20200826100113.6126afad@canb.auug.org.au>
References: <20200826100113.6126afad@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0273326292=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0273326292==
Content-Type: multipart/signed; boundary="Sig_/EqPDh0qhb+x1GhuW/Hz6reS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EqPDh0qhb+x1GhuW/Hz6reS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 26 Aug 2020 10:01:13 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> Today's linux-next merge of the drm-misc tree got conflicts in:
>=20
>   drivers/video/fbdev/arcfb.c
>   drivers/video/fbdev/atmel_lcdfb.c
>   drivers/video/fbdev/savage/savagefb_driver.c
>=20
> between commit:
>=20
>   df561f6688fe ("treewide: Use fallthrough pseudo-keyword")
>=20
> from Linus' tree and commit:
>=20
>   ad04fae0de07 ("fbdev: Use fallthrough pseudo-keyword")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (they are much the same, I just used the version from Linus'
> tree) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

These conflicts now appear in the merge between the drm tree and Linus'
tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/EqPDh0qhb+x1GhuW/Hz6reS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9PDVQACgkQAVBC80lX
0GxfrQgAiYy2Uvk9WIuGe6Uh3xcidT6fayH+7qRRtkb6lJwiiHpIUfhE+GP9daT1
OGAQJluwvmxI+PnKrZFNdiWSeiiMhsQaDdjPsDfmIu1lOjw08iKv+Nt0JLQN7pV0
vNm4iLLEPaA3loIK7wEltXdO+BblFJqn6CLKx9xM8EQsQqblyENeaBaedSwBcihz
dmhHANdpk2nkekqy0Y/tciHCBg3W0+mEHKRck0sHbCqX0Hf1GqRyNmX4fY/acNCa
xitQIeiLdi1brjG3AUylzaEhkICsJbKZIK6JJwwxwjcj7V+Hsjju9qfhDA60vAo7
x8amUFStU3kPS8fbZv3nnEDH0TKgcA==
=a3CS
-----END PGP SIGNATURE-----

--Sig_/EqPDh0qhb+x1GhuW/Hz6reS--

--===============0273326292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0273326292==--
