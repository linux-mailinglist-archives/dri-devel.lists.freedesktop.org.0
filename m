Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E5CA01F5A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 07:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA9810E1C8;
	Mon,  6 Jan 2025 06:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pdYtUJs7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4833910E1C8;
 Mon,  6 Jan 2025 06:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1736146000;
 bh=eE+tC5jg4RI8fC+gH7BkdGjyyfYVRoLtqaworXk3mi0=;
 h=Date:From:To:Cc:Subject:From;
 b=pdYtUJs7dfbpgwgICNJYyZeKHLiJuWkf5asE9bV+tgtCCxfYwxxDBDd/i4CKifsxd
 KFq8DY/nni3mRCG+tDNq80njSSW2SLUSaSWX9MwtCro1DOUjGj3GVPSO6HtNLMatYM
 pIg/HJVKrgUI433Gk0Xj0N+WrCcMpBNbMyO6O02AJz03Kz4HlXaTFnamdinSYR0ljy
 fFCHU6jBEcQ+jwgYz3wN2Zh/p7JKa7Cu0NGm+b5XURG9J/VeddKUFl1YsajQ0GFVMm
 qEybMYHlRETo7x07zpmGYDGzKogqv9LSbQJ3YC2ZeD3ojRHd/PTkiQak4TkC2trO6C
 y9dZ0lrSHgUvg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRPq40ltHz4wvb;
 Mon,  6 Jan 2025 17:46:39 +1100 (AEDT)
Date: Mon, 6 Jan 2025 17:46:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250106174645.463927e0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bSDe6BhN8wSbD=71InrCSQ5";
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

--Sig_/bSDe6BhN8wSbD=71InrCSQ5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

include/drm/drm_bridge.h:738: warning: Function parameter or struct member =
'hdmi_audio_prepare' not described in 'drm_bridge_funcs'
include/drm/drm_bridge.h:738: warning: Excess struct member 'prepare' descr=
iption in 'drm_bridge_funcs'

Introduced by commit

  0beba3f9d366 ("drm/bridge: connector: add support for HDMI codec framewor=
k")

--=20
Cheers,
Stephen Rothwell

--Sig_/bSDe6BhN8wSbD=71InrCSQ5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7fFUACgkQAVBC80lX
0GyYUwf/c1e5GaHKMJ31ODBJQJ7nMt64tgnVuhxd+oEhEw3fMWpqfsPy3F/LeZIO
ap4lxU3Bu6lVG2HeYsEBaP+lJDWjZeEarnR+IwnJPRchfDs2VcYkmp2qzAlQ4QR6
EjKnR2T42GazqCwE/55fB64bor4WG46bcvfvb7VlIKbJxbm6xa5zfjbEYk7KUg8V
yTIZ6fBZecmATy9IU45NJDK31y8Tow4rumMRAwyKzffY+Pv3gB3ncLw9ftCSB+vv
0n1ep5sUwnZpPKgHwKyX7LdFmGBzFvfGgX3K2NKcnzjL5thJngTaSI9R8WaveWWf
xWJOKrPeCAnX9UuChXHYmJexNcsmbA==
=L2xM
-----END PGP SIGNATURE-----

--Sig_/bSDe6BhN8wSbD=71InrCSQ5--
