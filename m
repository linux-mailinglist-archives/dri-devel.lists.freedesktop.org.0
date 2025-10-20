Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EDCBF410E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 01:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB81F10E53B;
	Mon, 20 Oct 2025 23:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LHnt3nwT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5EB10E53B;
 Mon, 20 Oct 2025 23:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1761004255;
 bh=6WMm8tGMXSN99Y/9sHUeDqO796wa8ktuH4la28PIJ0E=;
 h=Date:From:To:Cc:Subject:From;
 b=LHnt3nwTHf2Fvf8j63TUEzOs8SSfIN6RLWlt0tY8CVVMBxSBogc1qtPJ04FrupIxT
 X9DhsgkyrYLyZ2AMPpkDsagxOzzj5CRH864VvrDEUmI+LyzTEHoTs/ZtOoF2vf2G53
 Qt7s5ona2efMhcS2+mmgHC3zkaU94cMvmaOvONY0olcnIpEoeAbR09k7Ol5UyiIhSs
 2iUyMQZ99lt3VT3fUfjfKpbu/NI6VghjnhzPSHuSfeqlsrehQnHwqR9n8AI7ZQ+rHu
 w3+o/PWT4Tefv7cH7fJ6x4oMz+sDdfDzpq82NWfNsBOdUMcl7DxfWUj8x1lhVvBFan
 xC+2e75l6O+2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4crByQ2FJ3z4w9y;
 Tue, 21 Oct 2025 10:50:54 +1100 (AEDT)
Date: Tue, 21 Oct 2025 10:50:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alok Tiwari <alok.a.tiwari@oracle.com>, Daniel Stone
 <daniels@collabora.com>, Heiko Stuebner <heiko@sntech.de>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20251021105053.54ff847e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tJIz+ZoMW=1Eb8W2GTxasgC";
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

--Sig_/tJIz+ZoMW=1Eb8W2GTxasgC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

between commit:

  7f38a1487555 ("drm/rockchip: vop2: use correct destination rectangle heig=
ht check")

from Linus' tree and commit:

  4e39740d77e9 ("drm/rockchip: Use temporary variables")

from the drm-misc tree.

I fixed it up (the latter includes a fixe for the same bug as the former,
so I just used the latter) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/tJIz+ZoMW=1Eb8W2GTxasgC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj2yt0ACgkQAVBC80lX
0GwRPAf/aMgl2aVqnn3/SwRSgh4vAs86r4ROY28j+VG56aN4uv2MP7plXxSXDvxf
9EwcbFpKK0ARXt45X4YzwhIO3It3pNUa9qR4CJ2UR+qxBX8JsbEXbiixS1BzZCha
2LWrYoBaKrprGoSkH3xkjNDZBfqdrarRnaHH8GQhMY4hMGKGxaiTfsGlDkuWzAoY
Va1FEnM4dOiTGuI4yE4P57oZ6TpeksIAMpkIftseseZcOiNz2soPdQSD9eCWl3kN
KpL6n6AGKwJn4A6uZfql4wIVU3Am3TJIEhiS6BmwvKJ0aXQlr/Gfa8vIWu01pbzn
toiPHIcG+rchJiCI26zFOaGwV1MkEA==
=pG4z
-----END PGP SIGNATURE-----

--Sig_/tJIz+ZoMW=1Eb8W2GTxasgC--
