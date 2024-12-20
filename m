Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728119F8B7D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4638110EEB4;
	Fri, 20 Dec 2024 04:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RsdRu2aW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8DC10EEB7;
 Fri, 20 Dec 2024 04:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1734669726;
 bh=X1sD28c5lvOZVoU2CZWWg264ZPUBOVNrYwpPBe1nkjE=;
 h=Date:From:To:Cc:Subject:From;
 b=RsdRu2aWiUAhNMBU2p/ASaTgyoCMLuZyD/op2g46lRjAWAp79BQBHZ8rBSUk3nHHO
 RcS6xDTcddqQIYkLLJit6CYG0q54cjKO5qgxZAsPpupPR6LiDccsOpMMzv8O8fFP05
 IaF/jbAYAz0OmruIAdT1SYCYhLvmBhyWYjmMM4GmdnvnUs+xHd2pbn65l8ltjNRfZm
 3C8Ijhx6ZSXIQMDwh0ZzcGkCefPZTAYeITu5+nixFKJ1E1aUt+8W0c9OrKmfCqNNyS
 rW+nCqiO3sSwgld0iVo20nVFMCd2BMENrXLVr/TvBe/znyNm5ZQAy//zzZCZLGbqra
 ALoaQC6wK4gag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YDvsB0nx3z4wc4;
 Fri, 20 Dec 2024 15:42:05 +1100 (AEDT)
Date: Fri, 20 Dec 2024 15:42:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20241220154208.720d990b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AEjIXrQB5G1FD5m3QdsPQc1";
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

--Sig_/AEjIXrQB5G1FD5m3QdsPQc1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

drivers/gpu/drm/xlnx/zynqmp_dpsub.h:86: warning: Function parameter or stru=
ct member 'audio' not described in 'zynqmp_dpsub'
drivers/gpu/drm/xlnx/zynqmp_dpsub.c:1: warning: no structured comments found

Introduced by commit

  3ec5c1579305 ("drm: xlnx: zynqmp_dpsub: Add DP audio support")

--=20
Cheers,
Stephen Rothwell

--Sig_/AEjIXrQB5G1FD5m3QdsPQc1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdk9aAACgkQAVBC80lX
0Gz/rgf/WPa2cHf9/Fh49P40jSDpH770drpcWB8/zVLnufEEGip4+d9M1+ow+N+t
voKbfrJFbUa5iNc2GLXhl1ynJidtrSB5OIVpsfpqvKOUhPQ9N1FjGWBMGFHaktoa
a4szR+KdCyOw0nML28PX0fyGHHoskaaN/rT6sIx9F/a10aQSJSODHap5r1AR3yDC
PFrwiC1s2uA+v8RJsw0Xo/R/lsu3VYpuagmvJzhCF6kUI4WbH5KIL+IBA1Qg38p8
a5TEsZdF5e3OrZ4YQvgUOv2jVogs7tdfFyV9CH66ciLDylXmkfiKNedctKEfSDzc
BKFSa0To81kw/6VNnNlS3coTcqNfJA==
=OPvd
-----END PGP SIGNATURE-----

--Sig_/AEjIXrQB5G1FD5m3QdsPQc1--
