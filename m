Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F1DC390BA
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 05:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E4B10E7FE;
	Thu,  6 Nov 2025 04:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i9jLbkWW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DA110E7FE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 04:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1762401932;
 bh=2Fpig3csZBsINCMTyYrR8XTaPg+0bt1jp7xHdKBUT4Q=;
 h=Date:From:To:Cc:Subject:From;
 b=i9jLbkWWPAzXDePD/X4LbVexKYrhfu7cfpIxRzA9yrIR4+IPAv65Vrm7D7kOWpLkC
 WGcfYF4rBGWArwcNDj4sEXPrUnUgQzQFGemQUtheesx2cJQOxpUQVCDB2k3mJsTyXr
 39TiZzSFqfvyIReiQH9XphCssdtHf+DFtOJ57z/XLuv3UynV5fpClegYT80eUcr+Tq
 bbQChi2NJlQ+3sRGCm6glpRjLXHxYhJyevG23b/XfdvqnNaDu8WmzSDsVSdPJzbhlm
 QCcLkSAYQRmn+ajxc2ZtQFs1MNg2LST0bHTX7haHqBEhiLqsWDec0IPzyqPmCUzvNa
 MmE7WlbZ+F3zw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4d27rr43hJz4wM7;
 Thu, 06 Nov 2025 15:05:32 +1100 (AEDT)
Date: Thu, 6 Nov 2025 15:05:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Timur =?UTF-8?B?S3Jpc3TDs2Y=?=
 <timur.kristof@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm tree
Message-ID: <20251106150532.2a269208@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QxQPfcBJt/bT31txa_C/5vb";
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

--Sig_/QxQPfcBJt/bT31txa_C/5vb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
these warnings:

WARNING: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:7309 function pa=
rameter 'connector' not described in 'amdgpu_dm_connector_detect'
WARNING: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:7309 function pa=
rameter 'force' not described in 'amdgpu_dm_connector_detect'

Introduced by commit

  8223a605744b ("drm/amd/display: Refactor amdgpu_dm_connector_detect (v2)")

--=20
Cheers,
Stephen Rothwell

--Sig_/QxQPfcBJt/bT31txa_C/5vb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMHowACgkQAVBC80lX
0Gwf7gf9GttIYkJhQfAlQ/QcywiWpF64HnoM0J2YRPcNLc8O9lyyJeDLgFIS9ITw
8IbDvEl7MdOopn6V6qZpFw8ZojJjr1qixeB4c07NVbwYg1/rdW/r29vj1qeLeoqU
h+xASZbBWar9tfMtFfNvof3Jt/hRRHcL39jpqkKQfZOq36DEahUDhRnIZt5/zVTW
ec1F/7y3UTbW0AanGJ2Q4NxyQ1cMf9qwofj088ZcWcig3DLGGLC6nd7OpZZ9oh3P
k07ZVcqMz40rAXbImHBD8nbN/jLFPtx+CW1lCfv4nTCbAqKYiUPyMzVGsvK4ENqA
BHr09Ewl0uV5GoqL5Go77/LrICswPA==
=mX/v
-----END PGP SIGNATURE-----

--Sig_/QxQPfcBJt/bT31txa_C/5vb--
