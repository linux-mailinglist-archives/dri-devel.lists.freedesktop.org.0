Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B94B98CBFC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 06:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296D010E66C;
	Wed,  2 Oct 2024 04:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e4usjVyV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212BC10E66B;
 Wed,  2 Oct 2024 04:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1727842972;
 bh=BMQmW6lMUealt37gmqPQsqVMi6fyJxn/Ot2NQu0S/U0=;
 h=Date:From:To:Cc:Subject:From;
 b=e4usjVyVA1YzcbWvc3YyCsXGCgegGel4xmtxuODMszE+MuzzCbWTROoGM97zTP/m1
 03xj5OT3EQwS+IAqLm27A4JbK9EwK+wAtpF2mrP1Youqj/YkLHzXZbkCIdzk0pxr7n
 S8tIs5lp6jeZzfQt89bvTfIRIsIktHm0RyNayfboqEHUEpz5koxzW7LxOPL/T4haTd
 ZcCAjb3STgdOPfiGrPU0eWDjBParGTSEt/yrYY5plD3fov6/mqyVV4l0H+nBmR+MRG
 tpAGLsnxqiiXw7jFsltnypTQ46zMdeVe3lM2/Ude7E5H+Cr82J8o3wBX8+8iZZ4j1J
 uMgJSqO/VJ8qg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJM9R2R3Dz4wbv;
 Wed,  2 Oct 2024 14:22:51 +1000 (AEST)
Date: Wed, 2 Oct 2024 14:22:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241002142250.07e1c46c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/04yiSVdHGPCbNUj7+Nr/8v3";
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

--Sig_/04yiSVdHGPCbNUj7+Nr/8v3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/drm_fbdev_dma.c:1: warning: no structured comments found

Introduced by commit

  731fddf4302e ("drm/fbdev-dma: Remove obsolete setup function")

$ git grep -l -w drivers/gpu/drm/drm_fbdev_dma.c
Documentation/gpu/drm-kms-helpers.rst

--=20
Cheers,
Stephen Rothwell

--Sig_/04yiSVdHGPCbNUj7+Nr/8v3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb8ypoACgkQAVBC80lX
0GyB4Qf+PTo6LD2subdaCpdEwsXMvVMoP7SP7B+1IiEYgNLUAJYM5qvZxLTToJCk
bykB71DAXuzhvZS7vdjg4atNKBkylo57iWezS+M2MyAO8i0+nJ7OuVS0NiNTfkkI
/tvf73r09VoUOFANggZfSR3d18ktUze1aG27kn+HEfu4V1BJUvT5TBr1cAA++idl
7bpsqY01fu7kkXrgwTj6FZ8vPZFtIRtEG2ai85KtrSnsbJJgo5UF5+WAzshCkg2E
4CrsB7maa8xivbBZs8wDCLAUbRdeyXrDORIWjmAkxxl89xXl2nvxyx3uSnUVTLBt
G66GqAL2pBehmmKz39FZ2CmTHwXyRQ==
=mX+O
-----END PGP SIGNATURE-----

--Sig_/04yiSVdHGPCbNUj7+Nr/8v3--
