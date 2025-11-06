Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90520C39102
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 05:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B6F10E800;
	Thu,  6 Nov 2025 04:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qxo/g6Bu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49F210E800
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 04:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1762402264;
 bh=dFhmOsuufQIFucHr2acBcL8uU3+hPmDNDhhDUdAw+vA=;
 h=Date:From:To:Cc:Subject:From;
 b=qxo/g6Bu/w3eeKHcWrDeWnxE3JOes6TvN5PVmF2JZJc7HQrKaeTS88ykb+Acjs8Af
 Pq0ZhF7abAUiiqEtkzjluwET+4o91ExdUX0M+pOr/RE99jccTZdj2LXXK/sdLa4d9X
 L4ivZkh3HtWSHdKRS3QR9mUqW6n+enQxdYxLo2pZOw609ZGHf9TkelhQ5K769qkqLg
 31BiCgcAMCARoko+X7XJdiA0H7xqiw0BRQFgqcLHoOBPuoVM5APSxzHSmSDeUNzGX9
 rja55QqVu8pu/we/gpy0Yi6ASa9DZz3yNCprAh1qxpuJCXZov+pp9sS5zopXpGh85x
 /MUNxBd9avK9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4d27zD2hnCz4wc4;
 Thu, 06 Nov 2025 15:11:04 +1100 (AEDT)
Date: Thu, 6 Nov 2025 15:11:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Lyude Paul <lyude@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm tree
Message-ID: <20251106151103.2f1d5e00@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bbdBaA5aOyB_sDIilLsVTRs";
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

--Sig_/bbdBaA5aOyB_sDIilLsVTRs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
these warnings:

WARNING: drivers/gpu/drm/drm_gem_shmem_helper.c:104 function parameter 'shm=
em' ot described in 'drm_gem_shmem_init'
WARNING: drivers/gpu/drm/drm_gem_shmem_helper.c:104 function parameter 'siz=
e' not described in 'drm_gem_shmem_init'

Introduced by commit

  e3f4bdaf2c5b ("drm/gem/shmem: Extract drm_gem_shmem_init() from drm_gem_s=
hmem_create()")

--=20
Cheers,
Stephen Rothwell

--Sig_/bbdBaA5aOyB_sDIilLsVTRs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMH9cACgkQAVBC80lX
0GzmpQf9HjdhNRZjXpidtT2NggiuOAIxYfU3uPc4TDuMHocL605O232mp/STyuys
uYMmeUYxG/D3mDVV1T0IGj+9K49Kr4yajUU4dI98ODQETHMCdUZyDFSUoObvWmt4
3If6aEBeoIkC+W7Dsxve+5+Z4HatWVtXnpJzFZ/cdv8cGG9ll/Dmz2DZOMJjeMGA
EX2z4zFWz6GQQ1yCk8JIH9x79SN8SCNpGUJcnl6BUHYCXCGz2vFE2GYbf0gwgh4U
TfuJDRexsPyesh1AZGqlGzraHikvdKqgu628wKJb4EDkGNz1zXQNBcx3eMEU8lxd
CQWnKsifXzOEFntXeGxK3PByXiC8lw==
=TGZG
-----END PGP SIGNATURE-----

--Sig_/bbdBaA5aOyB_sDIilLsVTRs--
