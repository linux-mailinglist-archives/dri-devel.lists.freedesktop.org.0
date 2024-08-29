Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E284D963720
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 03:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F304D10E16D;
	Thu, 29 Aug 2024 01:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="o3Yf+kIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B97A10E16A;
 Thu, 29 Aug 2024 01:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1724893221;
 bh=t6GVX6srBa6sfGXGzxHDIXcl1PJ8YiIr8GKD0wNw9zs=;
 h=Date:From:To:Cc:Subject:From;
 b=o3Yf+kINEyQY8SM10LbQH3rUAT2CmbBayAnK6wPaWubMoKQG7a7IYrUpheEZ2yZVA
 u4whmTilAfojEzy6Kz1KZ0qTk+MVAF5xcJNyTnil8tlKlRp9heaWjWNVcuvkZDR9np
 ECb+VJ4CJzUOr3IND/MKncVFOp8tK28w8/H3BXf96t1n5M+e3CxTKuomujB81B/m5C
 mce5yvWK5te/QzvNGGQcqrvg0l5Mji0EChhlLbM9ZqUks3f1EwMPutxmpuZybM3t+t
 UU9q3lZv/McGhwghWK84KgOAWAox0+cjx1tTweFWpBAX1T3rJVBhswnsbXtwsJqN8g
 kf0OxnxLI29qQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WvNHS69yhz4wxJ;
 Thu, 29 Aug 2024 11:00:20 +1000 (AEST)
Date: Thu, 29 Aug 2024 11:00:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Ulf Hansson
 <ulf.hansson@linaro.org>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thierry Reding <treding@nvidia.com>
Subject: linux-next: manual merge of the drm-misc tree with the pmdomain tree
Message-ID: <20240829110020.4c57cc46@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wUzKVJtthUU5ZLDz4vYnon=";
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

--Sig_/wUzKVJtthUU5ZLDz4vYnon=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/tegra/gr3d.c

between commit:

  606cb5b75827 ("drm/tegra: gr3d: Convert into devm_pm_domain_attach_list()=
")

from the pmdomain tree and commit:

  f790b5c09665 ("drm/tegra: gr3d: Convert into dev_pm_domain_attach|detach_=
list()")

from the drm-misc tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/wUzKVJtthUU5ZLDz4vYnon=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbPyCQACgkQAVBC80lX
0GwxcAf+Kx/Gz67b6DAP9B1auUz4ZoGPkH5RVSNk1kU26C5TqIIH0uYHRmAdB0bN
4yXf9IgOldE82w7/8if2ksupEOV92CDNPvGjjhVH++ftgHDgfFF9+I0a/WD4b7js
2xanWUOMouJbmy/pwP+AfZ80a51ajv67SIyT048gk4+nGLxCbGs5G5Nw/wzS3+Zj
n7ZvzFX2RLmCUdIRSBJBTEbdnMj0xWl6cu3isAQ0oBYlVSZqbsrMPfEe9ynx6PSd
7BGu2supWiQp+dwoErGhD18TErmYbfHsY2vvuYEPFVfAsxHtd5ZNdK9ArMVubBGU
zc8u5ypPPMD0oI3lDMLkJEabzLBqrA==
=ZS+H
-----END PGP SIGNATURE-----

--Sig_/wUzKVJtthUU5ZLDz4vYnon=--
