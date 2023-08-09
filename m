Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E3D774FE3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 02:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412DF10E3F2;
	Wed,  9 Aug 2023 00:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 169182 seconds by postgrey-1.36 at gabe;
 Wed, 09 Aug 2023 00:36:39 UTC
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B122010E3F2;
 Wed,  9 Aug 2023 00:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1691541393;
 bh=6ettLlgLL+lNbJJyfC10IQ5aBlfsZGk/KbPDEESsreM=;
 h=Date:From:To:Cc:Subject:From;
 b=okMGYQ047vUFeZphNjsDnfTDdQUDUptnl5PBICJ4BFtXkqXkCqHNwKgt5JiypgmHT
 ilmye8lyqRdWZD7UNCAJy4prVtZp7Anj6GY4HErR4r1XAjYNMx9lEz1167gn/6BQBI
 KYyYHCvXnJezfmx1FNHjw39PWkHEBs1d6LXySXnOxSJ8XJJ3d351cAi7qwXlnNy3qs
 aiTj6qt9kqnzHN9kexD90SoEk/gczV40srC0QS80a4quUWjM99EPeF7yjxqqE2Gx5a
 iEQ7VScmNvA2W+b4cCWU/LYdZE10hUKvClhsDmYOfZNEJaTjB8L0gT34f0Vt+LNyC7
 F2LZoJo3Kc7NQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RLB272Y6sz4wxR;
 Wed,  9 Aug 2023 10:36:30 +1000 (AEST)
Date: Wed, 9 Aug 2023 10:36:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Helge Deller <deller@gmx.de>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: manual merge of the fbdev tree with the drm-misc tree
Message-ID: <20230809103626.782dd87d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uUTjO8dq1.Wer9rHpScu0yz";
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
Cc: Fabio Estevam <festevam@denx.de>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/uUTjO8dq1.Wer9rHpScu0yz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fbdev tree got a conflict in:

  drivers/video/fbdev/Kconfig

between commit:

  8c47895b70a2 ("fbdev/mx3fb: Use fbdev I/O helpers")

from the drm-misc tree and commit:

  87ac8777d424 ("fbdev: mx3fb: Remove the driver")

from the fbdev tree.

I fixed it up (the latter removed the lines modified by the former,
so I just used the latter) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/uUTjO8dq1.Wer9rHpScu0yz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTS34sACgkQAVBC80lX
0GzqZwf9G9a0aUJYQDBMvEb2vlFiUPD+t6Zy9Cpfrhpvuu36cFqeVgWcFzT+MQd1
Zh2uVYaJ/TTEmJSJiaFH1W0j6QSzNmjTN9mm+HMPtipdG887FO4uwGGJQ0MrQ0Ob
FqPL7NV9xkkqQisXzAgLUkhgGDnU8rbA2qbwHx3hjbptRiOf25lDLVxb7UmqzcTc
T6Gm+sm3HB8yCS94G83Wn2r9NCiwZYkFvXeUXTK2aggIHoHFzh2bWH72yKjnubc7
5PgF7rPPOMwgkeTGngB9D8A1cM9rEkIP5uliqgSTSE1e0CGxYWlscUk9ZB2Dq3cw
EBLTOf61NvBrKOCjWadD7P7+E713qA==
=mfCY
-----END PGP SIGNATURE-----

--Sig_/uUTjO8dq1.Wer9rHpScu0yz--
