Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179669442FE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 08:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B4310E897;
	Thu,  1 Aug 2024 06:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Fa5EysRO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF2710E895;
 Thu,  1 Aug 2024 06:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1722492238;
 bh=uVarZMcOO5cTR+tIOWbqIQxx78Q5RYUZs/Sn8X/szxI=;
 h=Date:From:To:Cc:Subject:From;
 b=Fa5EysROkmNcCbdiutsZFnJJ8L2aV/qiLint8zW4hwAKtqenAHSXrXmCUAM6lf4HR
 acAio9ATcAp1jPSLjqS+M7yNOzZk2CiNHcdg88vn0C6SYU8ppVdw5ile39N80jllqW
 Aap8FrTxDN8XldoFrrhIJbpUg7JZ4QshA1hIqrb9IuksOeZR/SLxcMH1h9j/6CFdtf
 Dvqtss2U++zjHKb3TfGRbTRlk54+Xnf8wBebdjOOhcVa89RPu7X+43Rw5JXA9gphJx
 mXdWbrWuYfOhkkWxCts06mAyGlgWeCUB1qo2OG4SZb1PGWcbBuXuYkaPBNStBQl1QO
 sLqz8rpx2ZZPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZJLk0Lqjz4wc1;
 Thu,  1 Aug 2024 16:03:57 +1000 (AEST)
Date: Thu, 1 Aug 2024 16:03:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maxime Ripard <mripard@kernel.org>, Sebastian Wick
 <sebastian.wick@redhat.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20240801160357.7ac5f111@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JhW2nqM.dTPOZCGAkE51VId";
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

--Sig_/JhW2nqM.dTPOZCGAkE51VId
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/gpu/drm-kms:538: drivers/gpu/drm/drm_connector.c:1641: ERROR:=
 Unexpected indentation.
Documentation/gpu/drm-kms:538: drivers/gpu/drm/drm_connector.c:1643: WARNIN=
G: Block quote ends without a blank line; unexpected unindent.
Documentation/gpu/drm-kms:538: drivers/gpu/drm/drm_connector.c:2388: WARNIN=
G: Definition list ends without a blank line; unexpected unindent.
Documentation/gpu/drm-kms:538: drivers/gpu/drm/drm_connector.c:2390: ERROR:=
 Unexpected indentation.
Documentation/gpu/drm-kms:538: drivers/gpu/drm/drm_connector.c:2412: WARNIN=
G: Block quote ends without a blank line; unexpected unindent.
Documentation/gpu/drm-kms:538: drivers/gpu/drm/drm_connector.c:2425: ERROR:=
 Unexpected indentation.

Introduced by commits

  f592e01664b4 ("drm/drm_connector: Document Colorspace property variants")
  76299a557f36 ("drm: Introduce 'power saving policy' drm property")

--=20
Cheers,
Stephen Rothwell

--Sig_/JhW2nqM.dTPOZCGAkE51VId
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmarJU0ACgkQAVBC80lX
0GxPrAf+LZrPefWc8mKaoShDOh3Tvk+rQMIg4gnwDKmg+7sczKv7NGgsA2h9Jc0K
FhUFGLQJ/AGRJwPnVwLDu+j2zj0CPCXQtxebncJnpb/0gBVeFXBpJtzYiT2urv08
YQQ7MgDQLZZk47JNAYJTUdihVy+gZlORW2AnM8E/vHHqK1wPIPQJ0t2oveXH5jMl
2xtDgdJB30oTg2kXq0W86ZxsWxNWqOKNTmITP34tkZ1EoPa1TWxdvTsQRBOBBx2g
JEo1hJJil2hf/Jav18Y875mtoxC915se64ewU5rASnEcCfID94j+Sbz0trxVxtur
2L432PU6JN+mPG1pGG/mGvaHakxPpQ==
=W8co
-----END PGP SIGNATURE-----

--Sig_/JhW2nqM.dTPOZCGAkE51VId--
