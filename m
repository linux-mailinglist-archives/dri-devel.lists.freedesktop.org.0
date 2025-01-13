Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13B3A0AE7F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 05:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3288410E277;
	Mon, 13 Jan 2025 04:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GI2zniB8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E572010E277
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 04:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1736743567;
 bh=3pv3huB1qHnV0XAyV7HBQPMSKHMrxABmw+6n01G1T4I=;
 h=Date:From:To:Cc:Subject:From;
 b=GI2zniB8iPztifXAGOFPPfvIUmcDqOoo6ETB1sw14lmYv64MLrSchY/y250aEXb5/
 Ckyc6UawOScGnAuVD31o0fJwHaKcD8goGaFy3Nz5v1GWMhqxZPJ3gCOTbky8wSjnOn
 VBB6Koq71UogAsu+Nz7AJ97VoCRCksPmCtjDwsiC+5uadR7Z+gnILXJgnlgl+fIrfo
 sU7p/tETUXKE8OPArgjwLnm5DfmKo5zDX26XH84sBfLOUy7IiQmXiZmfexCekeG+SR
 jPrv43QOMiSrV25jOrtgxsJbFWirYm7wmXvti7krZOuzMU8LbzphJO6XGy5blKSD6s
 w5w+cjtFP3yBA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWfph6x3kz4wdF;
 Mon, 13 Jan 2025 15:46:04 +1100 (AEDT)
Date: Mon, 13 Jan 2025 15:46:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, Maarten Lankhorst
 <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20250113154611.624256bf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_oR5KcnGpAjdzNB0xt+=/kN";
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

--Sig_/_oR5KcnGpAjdzNB0xt+=/kN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/core-api/cgroup.rst:6: WARNING: Title underline too short.

Device Memory Cgroup API (dmemcg)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Introduced by commit

  b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")

--=20
Cheers,
Stephen Rothwell

--Sig_/_oR5KcnGpAjdzNB0xt+=/kN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEmpMACgkQAVBC80lX
0GwCygf/cHx65aVYMtSkwx2xZT9uihOQDMmqVu6iD0PrHuXvJqL5Pnfm0ZyB4B0j
U8Hw3nzpJF/h1pD6nw6VL6aEJL/mqAG1OhONOYE4yrB37RBUHTdOKrrgl3fhXpaT
8ftJmze0S8xl4jMLx6RLD9DxEo7q7h8hOrJ73lH8DJ6NajpColcf/OPMxCms1bFM
kwS5Ji/1ugLyBnkdjUy93BrW/CsKkorSQpVicvM4l7Wqwu6SXX65LCG/pNku9Fk5
0QKIWFfQrWMQuBNQPck6fbh/4bxoMEVRIBNTTGJlLIzb3BBvVWUb9QKR4CItC2kr
PaZPe27b5rrjnzuqh40xVJ2c/RryJw==
=QUZN
-----END PGP SIGNATURE-----

--Sig_/_oR5KcnGpAjdzNB0xt+=/kN--
