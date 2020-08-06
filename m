Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC9423D533
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 03:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6716E10E;
	Thu,  6 Aug 2020 01:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD88C6E10E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 01:51:44 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMWgd3JmYz9sPC;
 Thu,  6 Aug 2020 11:51:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1596678703;
 bh=hY6aF8lk0dgBIQGUdKWk8ajvOayIoxwiR/69jIOPWKQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hpKhnU9wl7Td7ZcXPihJnaH7qY1Yh4qzlgOyVBlSv4kW4pZwcwt8EqeJUzqxIrMbE
 7qY4eUPVqKMoohurt1NR/d4XyS2PXYVbcNFFzUSwYgOTbeqJar3oBSn7k/JoXIF9b8
 hcSgVJf0JzMvaz4JGqsMMATUre2GHJGN2D8V++BsRNIz9RYlqoVIm6dmioW4zm3Hx6
 8n606zeQlkWo0cJ9xJCkVWkJLX2wOPQLyl4bPmLMF4B/1AzHQJIFidh1+EKsmcViOz
 y++AS3/Ue1z1eGP6tm6jAcF47XMVagwKV+xFSXHE8KjqMxRjB0C6LSGQbwolt6Rg4S
 dqQY2pv3dvaDA==
Date: Thu, 6 Aug 2020 11:51:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the hmm tree with the drm tree
Message-ID: <20200806115140.6aa46042@canb.auug.org.au>
In-Reply-To: <20200730192110.1466e63e@canb.auug.org.au>
References: <20200730192110.1466e63e@canb.auug.org.au>
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
Cc: Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Jason Gunthorpe <jgg@mellanox.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1015963011=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1015963011==
Content-Type: multipart/signed; boundary="Sig_/.=FcYe9T1r9uoFGqml0sKBG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.=FcYe9T1r9uoFGqml0sKBG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 30 Jul 2020 19:21:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the hmm tree got a conflict in:
>=20
>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
>=20
> between commit:
>=20
>   7763d24f3ba0 ("drm/nouveau/vmm/gp100-: fix mapping 2MB sysmem pages")
>=20
> from the drm tree and commits:
>=20
>   4725c6b82a48 ("nouveau: fix mapping 2MB sysmem pages")
>   1a77decd0cae ("nouveau: fix storing invalid ptes")
>=20
> from the hmm tree.
>=20
> 7763d24f3ba0 and 4725c6b82a48 are exactly the same patch.
>=20
> I fixed it up (I just used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/.=FcYe9T1r9uoFGqml0sKBG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8rYiwACgkQAVBC80lX
0Gw7fAf+KnSav4Q90iErqeMElDcGjnp1gxUYGWuURo7kCjZP1pw2MQ/EgcbWntQF
aSSdUltwW6YFAgG/BqQwkyVXaO/mqDEPs+v3/MKcU8TGJ9gS9OWfHCE2AyACB1P7
R6iWtR8ZLu9Dfuis0grlwIiCVDjJRzmkUVliPuQ9LXBl9iccvKtGsl9OjgQEtpwn
QMR63J1pvjJmk7I/SZkUKXR7YYn//Jou1A7B/pFQZ9vryT8u/4En8BouJreW9reP
FCHH8C/N02/HN584YBXzoeG4FCwEVd4XWVtxfj326K8mE1yLOLY2AJRkNaidwx4d
vnEievjSwAUAuvAZUboFuZhyeiAV9A==
=89ZD
-----END PGP SIGNATURE-----

--Sig_/.=FcYe9T1r9uoFGqml0sKBG--

--===============1015963011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1015963011==--
