Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B36998CC04
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 06:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D1710E675;
	Wed,  2 Oct 2024 04:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="URqoEJO5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F8110E527;
 Wed,  2 Oct 2024 04:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1727843285;
 bh=wmDRlDprTlfQdF0AhvNbFdCHnpTmqbSRYeCNwFtNzS8=;
 h=Date:From:To:Cc:Subject:From;
 b=URqoEJO5t2HZoYf7Dg11L43mXX70fEXIsBgh9RCG4YgDkh6vSlUkvQ71aSObXj6Ez
 VN6KDSvn30WrHDtdl9A9Un7tYa2gRe5Zk6TCdjcSnaZZUiBUZCcE+IwlLeLqBz6EVM
 QtOhq3UFkH6KqDpWsx7wGKk+IzKlxbFRWWh0uYZVAO7KsBBYdV5UYHKABMZ78gfuPr
 ehUhOhJmRuVBpDHTIn+8dKGCAWzFi8J8BUMzFh4j5etPi/PpNJELr5Xjc2PGKsHkF2
 wzINqbiGRsjbaPfGsF8tSmjI/7vlsUcDnb15biE2sB6GjLitPTZzxBvPcv+My1kYNN
 FBqynFjAAoDfA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJMHS58tqz4wb5;
 Wed,  2 Oct 2024 14:28:04 +1000 (AEST)
Date: Wed, 2 Oct 2024 14:28:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241002142804.1d6a2ac2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TxqJ6ZYvHWnDehwAAIKtvYs";
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

--Sig_/TxqJ6ZYvHWnDehwAAIKtvYs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/drm_fbdev_ttm.c:1: warning: no structured comments found

Introduced by commit

  1000634477d8 ("drm/fbdev-ttm: Remove obsolete setup function")

--=20
Cheers,
Stephen Rothwell

--Sig_/TxqJ6ZYvHWnDehwAAIKtvYs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb8y9QACgkQAVBC80lX
0Gw57Af/bRYOXI6oAkAhGDYR6MRkafFHj6QSqVTaOLK0BUeNkcyBth623XlBjNdr
WCZ1T3xbsz0u7fcNx4ZXRf4r8tEBhOjsBtsRBLpYZDfz3DY7pUu0oNKRegys2UMg
f+L1HIsD+pJY1aQHSLa+syzxt2buxjyoj3bLVayhw5KR7qcBD6XKWCWbvDFrd4go
0ln35pxUYAxC5g1WvD1HSIrm3kdoiXwD20A7+3ClYHO57VTk+sMmMOnjNxc/01Sn
R8yIOHOHVRLn8HSnvlHiwgRcyZA3gg3ZQo67qDkyr2V8K9inTYnVhekME/cepZnk
My9eMZMwsshJlkjZo/C1NCF+dt70Wg==
=PbBS
-----END PGP SIGNATURE-----

--Sig_/TxqJ6ZYvHWnDehwAAIKtvYs--
