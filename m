Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9880A0AE86
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 05:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846BB10E3FA;
	Mon, 13 Jan 2025 04:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D82L6QuV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1CE10E3E2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 04:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1736743793;
 bh=fQr+58xnM3oJy/HYq042b8flRj12HzL2Ipg6OlCRmkY=;
 h=Date:From:To:Cc:Subject:From;
 b=D82L6QuVpPrOmpYlkVMbql/UCzimdTU1vPoGUYaW4Q2N4UGuGnTGabEZdoLChP76h
 wNvqHGV3ZdL0664DVkQArXhXLJsBjeM47r68fy9wFNlhz3KVdYfbncIvpZlvkw6qaK
 QoyI5y+bGwUUI8B+ITqpAL9/bGlgSLm/IY9GzHS3U+LGsxOWdQjxN7T9AJxotCBBTW
 4pAzCKFvPFUeAPAa4nTFSkw2DCohj2bs640X+S29ObTgXjpSMafF7NlL2lUlQW75CX
 jPEyxPIokBfvBOuYjdqAN1ejmi8JQ6Zdn35lJCezpuXtS/taWmgI6ejQpUWeyguSNW
 MDGBx0ntSQVwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWfv55DHXz4wdF;
 Mon, 13 Jan 2025 15:49:53 +1100 (AEDT)
Date: Mon, 13 Jan 2025 15:50:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, Maarten Lankhorst
 <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20250113155000.4a99e7b0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jPZdqc6wwK3jDdABfZRnDx7";
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

--Sig_/jPZdqc6wwK3jDdABfZRnDx7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/gpu/drm-compute.rst: WARNING: document isn't included in any =
toctree

Introduced by commit

  b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")

--=20
Cheers,
Stephen Rothwell

--Sig_/jPZdqc6wwK3jDdABfZRnDx7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEm3gACgkQAVBC80lX
0Gw7WAf9G3VI2OIiny6CEEKf5PU0q3Pi7VyTnPdw+1Zq0xUVpHy6rANZDow3P1Ki
o/Dm48IktlZKdkhlz+VKf+k375M+3HTzyDhEp+Yx0FCPpGG2fWTAAgi9QWx9ailO
IG24CDUCK5ldiUPVyCIfyuIBopuXmpo1w4JVGJnfvQh6LziJoDha/2f0oBRR3527
OyCCK/mZR0bmEInwig5tFNLavGdrvpAe0LCskKd2XZ4FcLbux1L6vbAR3pWNvqIr
UhQGQv/7IdSAvDSE6+X5GVjjR3bk6NR1VA4uI0EJ6rYCiq94xWYcEjr7xvJxKiBX
F0QGMCNwN3E40queVClNK07YaTaxUw==
=l76E
-----END PGP SIGNATURE-----

--Sig_/jPZdqc6wwK3jDdABfZRnDx7--
