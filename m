Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B83D76A5AC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 02:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF3110E050;
	Tue,  1 Aug 2023 00:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EA610E050
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 00:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1690850590;
 bh=UOeoP6o8nLk2lubr/P1iUVA7r8c0igQrDiDRg7uhqck=;
 h=Date:From:To:Cc:Subject:From;
 b=i8z5gH1ThEM/rpQyDHxRuBInnpf+wCP6sPpqztCO0IaUtGkv6KeoVxamg3ajLb4vI
 BnNN3EXXCzkkXn83i6eBI+WGyWh0hP+4jPyER2KHwcFA7a0Sgo3HXnm1ZEgps29+uq
 C+1hUTrBIcK1UcSOFelKuehFvBda+6pT/zpTYoXx9CaNjZIKBXWxFoqblCatzXhrEK
 qD6A2yYXC+oBmBf2LWPPDboDaKXNxBhX6PW+ttqlK9NsNgVN17AaKHQeTk5eVayHrR
 KkzwGAhkHx+cskKKC2Q3E3yVmfjSUL6p4zbYYrvQ4A7+0F2FmLc2UeTkJsgwjLGcZJ
 0jv2Cu4eM0vbg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RFGYT4X65z4wbj;
 Tue,  1 Aug 2023 10:43:09 +1000 (AEST)
Date: Tue, 1 Aug 2023 10:43:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Helge Deller <deller@gmx.de>, Dave Airlie <airlied@redhat.com>
Subject: linux-next: manual merge of the fbdev tree with the drm tree
Message-ID: <20230801104308.0de7f835@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qc/9R..mTUGHjsXvnE7TEIt";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Fabio Estevam <festevam@denx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/qc/9R..mTUGHjsXvnE7TEIt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fbdev tree got a conflict in:

  drivers/video/fbdev/mx3fb.c

between commit:

  8a4675ebbd30 ("fbdev: Remove FBINFO_FLAG_DEFAULT from framebuffer_alloc()=
'ed structs")

from the drm tree and commit:

  87ac8777d424 ("fbdev: mx3fb: Remove the driver")

from the fbdev tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/qc/9R..mTUGHjsXvnE7TEIt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTIVRwACgkQAVBC80lX
0GweYQf+Luz0E8dd76dHdVBilRIJ/GhTDZ2mwr+kQ3IkvjiFx3pT+rQPiS4HZiz9
g0SQtwEYQKKFip2scQ5O6B8kcmcNGvd1cEVSnEBVlJ0EFl3e56x/ikwXUq7YeHP7
5BdZe/6EcneTovS4S6NZS9RoxVklwnyQvChPzgtpMSqUN79uk5DBF/GdJdbC14qR
KLChDMDtR5D0teGj/nMi1e/wnuhh5fI97kU9xfFZw9Vn1NbN5ZFT3MlbkB8w3LK8
vLQhq19rTvKbRJnm+aYIuNgO2zst5VGfxUj1KAm3Ghsca6q+A1Q9WuX4Yr+EKP26
0zTMp6DamHhlmiS/vJbYaJxMojw7HQ==
=ITek
-----END PGP SIGNATURE-----

--Sig_/qc/9R..mTUGHjsXvnE7TEIt--
