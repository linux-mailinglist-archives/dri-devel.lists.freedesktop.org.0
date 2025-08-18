Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1B5B29717
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 04:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604E610E192;
	Mon, 18 Aug 2025 02:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CzSJpoG/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F51B10E077;
 Mon, 18 Aug 2025 02:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1755484735;
 bh=/EDNXDGvVfSLRGFAXKGz2eTcc7Spw0fcXsFzzN/5iQU=;
 h=Date:From:To:Cc:Subject:From;
 b=CzSJpoG/GgfU3PY9O6GYZQTK4BTk3TntijldJ+X3foNUkaFWj1OoaxpTOugdQTBio
 7VE+p4y4hrFksFU1MfM6mF2n5CLsovO0BcdjlPJP+Kz4O+oYf9r6k/U33pDv2HlNMP
 GG7/G6JBa7hcFI9MY+tOb6MQtRyr4RTvnZBROFmD0c925zljg2NCjJ1hFQ0eNl8djf
 GFSUigrfKwvjzQSKbDMKPHip4XTQvz7kc29uGOER0Ts+xWxdqxPay0LjE306/tcyg4
 LsniPvgflACICgUa4+z0iAbM7odf75g18BjctdVoHSaodvD3AZqKDVNic2xwNxqbNM
 QOjO5LxuwW2yw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4c4xjp279Lz4wbn;
 Mon, 18 Aug 2025 12:38:54 +1000 (AEST)
Date: Mon, 18 Aug 2025 12:38:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Danilo Krummrich <dakr@kernel.org>, Javier
 Garcia <rampxxxx@gmail.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc-fixes tree
Message-ID: <20250818123853.51aa3bc4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7yr2msOT_t5hQ/B_590u7Cu";
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

--Sig_/7yr2msOT_t5hQ/B_590u7Cu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc-fixes tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2446: ERROR: Unex=
pected indentation. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2448: WARNING: Bl=
ock quote ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2452: WARNING: De=
finition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2453: WARNING: De=
finition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2457: ERROR: Unex=
pected indentation. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2458: WARNING: De=
finition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2459: WARNING: De=
finition list ends without a blank line; unexpected unindent. [docutils]
Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2460: WARNING: De=
finition list ends without a blank line; unexpected unindent. [docutils]

Introduced by commit

  6cc44e9618f0 ("drm: Add directive to format code in comment")

interacting with commit

  bb324f85f722 ("drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected usag=
e in literal code block")

from the drm-msm-fixes tree.  Both get applied.

The drm-misc-fixes commit is unneeded.

--=20
Cheers,
Stephen Rothwell

--Sig_/7yr2msOT_t5hQ/B_590u7Cu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiikj0ACgkQAVBC80lX
0Gz1tAgAgAhVdDzeptXMLx88AmQAPNlAy0Xzi9slrZrZ1hwwDh6oyS41qYbLy9/J
9flRTMeEFCjFYu04qzmk3Eb8L0tdy2O3CTpXY47upNERgWuXhjU25TCLRvQ0Pqms
CtTixVhqEDLaV8C53UMj4R/a1aImOvS0OfwGnNKk1QQqfObErG0Qi0WF5sUfPI2S
5kHDIjJ6WAX2Pr0HARYzhKHIMPreQxq3LdScTWwovdedE4XNZ1rAvFTr3qHRzke2
JLBdjQaTswwDfxwDLHs3XaEn4LnUWjb1o0wATNCfljJeJ4jBTvfY6htEWjKv/0Wt
HVf3FtpWq23lzX9dgALG99VBdZC4hw==
=TljA
-----END PGP SIGNATURE-----

--Sig_/7yr2msOT_t5hQ/B_590u7Cu--
