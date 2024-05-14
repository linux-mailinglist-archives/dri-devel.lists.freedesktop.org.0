Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A208C4CA6
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 09:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEA110E232;
	Tue, 14 May 2024 07:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="biuGn+mP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA0610E232
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 07:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1715670715;
 bh=q4Eq0wErkTh7xJD9VaK0xWBmBA3aSLZdJ2laHtxhuZQ=;
 h=Date:From:To:Cc:Subject:From;
 b=biuGn+mPkhwhapJcxJyBbPbYH7py3jf7xfxNokxOykvc5TDn6tH/GXGD/n4SXCa1c
 UsbX4aqlO9DyDR3U+tv+RT4PizODLBYPkGQf+QbunG7uSEjupIkTEW4Q7m9q4moWyY
 25tW4LB391yCvHHkktie/QQ2CkvN4UoPd59lSsXVCWOwM9HoXdOdamWQMK18tYetCb
 YGV0BvV+09KpVfj+3/KhWTfuWsvYXD2VNqm0FeZ0fSwyGuFzsIhXsmKCTWi+ihq/G1
 9tUDJob5bG+uW92tnUCLyBhaj6srxTiBCrsm05QQZ4e6JLxI22bnmZPEMI/wqBIY9C
 o+FQZCX1hUPkw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VdnbZ1cl6z4wcg;
 Tue, 14 May 2024 17:11:54 +1000 (AEST)
Date: Tue, 14 May 2024 17:11:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Adam Nelson <adnelson@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240514171153.73fed88f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+u=ZZSyRVBxUYE6NB+F+=EG";
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

--Sig_/+u=ZZSyRVBxUYE6NB+F+=EG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:580: warning: Function paramete=
r or struct member 'program_3dlut_size' not described in 'mpc_funcs'

Introduced by commit

  9de99fa8c1ea ("drm/amd/display: Fix 3dlut size for Fastloading on DCN401")

--=20
Cheers,
Stephen Rothwell

--Sig_/+u=ZZSyRVBxUYE6NB+F+=EG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZDDrkACgkQAVBC80lX
0GyqCgf/VFfLdp98m5K+WU7fJxZcASt+J6wP+15TofuJCL18DX0Xc+j/OP3VpJF8
qYIYl0Y1GrUl4CHkU5QiZdeewp1ySblDNZ9xWr2glb9K+B1LghtAA3uJ9Wddsm5D
OTB+l0uCXJWalJEa1BxhCwbQ0TARo+tegwLMX70PiyTff84D1OaB2jlp1w7V9Xgt
YUGCw2+uVIv52gcYb4Q2m35PUErlzEXAuhr745ucoZhc8fPbX3Oas97xSTYKWdaJ
fvZxlE8A4sMRx3Rr8fal4QyQxBfOjm4TKygsHUsDefX8rMbTnUimFznQeeIKTXed
iGEQ1DG0JLhaDdixBwWOoKurPQJKjA==
=BWnx
-----END PGP SIGNATURE-----

--Sig_/+u=ZZSyRVBxUYE6NB+F+=EG--
