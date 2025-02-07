Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC87A2B9A5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 04:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB1210EA14;
	Fri,  7 Feb 2025 03:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="smm/e1U5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA23C10EA13;
 Fri,  7 Feb 2025 03:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1738898513;
 bh=XmN+jcCj+jUFOZ3QBM+zG9UgpSQDqQDhocEgZlDHscc=;
 h=Date:From:To:Cc:Subject:From;
 b=smm/e1U5MxpZJw7m92b57PXM9qlTYd79MnE7y7pKSk7Oqea/06ELnJaEpY4MTQu1J
 2DAPN7rRYMqSokcFMSx7Pwu1Racx2IVgwmawQUGbuC7k2mLEKXFCFICoCEbf3bph5t
 57HvGOD7otDpGCNtovgUfCSlH386YuXVZTTvdYaelEVCuurL1RyGd7Eydq8WqIO/4s
 95SX4GSFcWjJWKW4NCALFg+Ir6PrXHs0+gcOG/U5zsLiHJTsoetSWfkv4IOgBFi/rK
 ZW+j7r1lB2DY3Dzf08YJMVUHYRcisv4k7fionoteCTLE3/N597TLZR63aTTQkcHLkQ
 lXYqQH/GHXpmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ypzm06XMLz4wc4;
 Fri,  7 Feb 2025 14:21:52 +1100 (AEDT)
Date: Fri, 7 Feb 2025 14:22:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20250207142201.550ce870@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CO13eDYE2hSrQzooTNLi81+";
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

--Sig_/CO13eDYE2hSrQzooTNLi81+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

/home/sfr/next/next/drivers/gpu/drm/drm_writeback.c:243: warning: expecting=
 prototype for drm_writeback_connector_init_with_encoder(). Prototype was f=
or __drm_writeback_connector_init() instead

Introduced by commit

  135d8fc7af44 ("drm: writeback: Create an helper for drm_writeback_connect=
or initialization")

--=20
Cheers,
Stephen Rothwell

--Sig_/CO13eDYE2hSrQzooTNLi81+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmelfFkACgkQAVBC80lX
0GxOswf/Q0ZqJRSFGLds1Zw6WvqNfVNgDGFqUiCGDvQ+/uoLJgxlN1BrZ2srXEK8
2hcTn6gWE8r7syqa8crjQlLfDQZyPx+l/KBFs+8Or20jsBpXQQTbd/Koy5IALnwm
C7/n70kWcPHUoAaZY9l9KimnjROgaMRO9RdvKHZz2/3J1kTxm60aIUVMEVPaZRYl
8RjtEcsnCEB/A14bR6L5Z8lCikNwBU/ghJvCUDpIp2y+/gpPCNyS5mRLEdIXruFd
g3H1ggVluOM8TQUMZbB6GmjDDBsNxep2MgoU8oqODuXOWcXYfUAsIdGbWUlMd6jE
zzAZdAOktfD1FqOPCPNw76LB6t+bKg==
=J2Az
-----END PGP SIGNATURE-----

--Sig_/CO13eDYE2hSrQzooTNLi81+--
