Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C90AEEC93
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 04:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1539410E4D7;
	Tue,  1 Jul 2025 02:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FpuHPM3r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A6710E4D6;
 Tue,  1 Jul 2025 02:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1751338485;
 bh=8H83yHfRrbf5zi697ri7SFzbYByjJS69qvdoGlr+Nq0=;
 h=Date:From:To:Cc:Subject:From;
 b=FpuHPM3rvYswBkPOfqFlopaAvtSTld3Ek60bbB2fy9MT5jYzX47k1XtTD/tsKNg1L
 nnxcFoEcqdWXGwU5IX+PzCYscxKSFAd7XXvNVCC0PLE3jnaj4EGWOcuYgH8KS/k3jy
 ADRatq8um6T6vNh6XHO5UdvuxqzCLxn6517XnI0CEwv0DvKPSsIiisaxKhrSu5vLZJ
 i0D5uowaiYPH/bjRoMPz+rFZ/oP/nlgNOHN7YDX7T72jXJK8aJmnaqCS/oajeC2OJR
 zSFL4vpQ2qerodtrR43IsrBxGtI6fiLO0rfAYCXgixEVJPcDk++Q4XTDV2fbXt7nNq
 lmsa5HozSV0rw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWSLD5blTz4xQW;
 Tue,  1 Jul 2025 12:54:44 +1000 (AEST)
Date: Tue, 1 Jul 2025 12:54:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20250701125443.5ba945e2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yktaNDk/jMXm7v/uSa6bko+";
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

--Sig_/yktaNDk/jMXm7v/uSa6bko+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c

between commit:

  ebe43542702c ("drm/amdgpu: switch job hw_fence to amdgpu_fence")

from Linus' tree and commit:

  d0c35c84dcfa ("drm/amdgpu: remove job parameter from amdgpu_fence_emit()")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/yktaNDk/jMXm7v/uSa6bko+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjTfMACgkQAVBC80lX
0GyIhgf6AkxBodfHE5vqHrdf1UpY3jtfgk1lGuFf3BnmSSMP7yIUT+zGAcDrl1L3
DBr2pJiI8IaTwXY+pn3FWWXiWHVn69p3zClg5Ul211R/r7BJiLVRB/E9zeqVrC8x
sSeGb/4RNAa9PkeoX2/NpZgcNzD4WMI2vk01pJFV4NFcmqA/qKIrUCK/GvCLZUmm
oadi9e80ZnP9i8myjKmLbTRfaFAOArrVrVwSatb96snQsp7SimsKlLg3EMPg+Ev8
1UP5AcJWJqITcGubf1JhebrlB18QkfjKzbgPx0Lqz9+/6DpKLw7inYoF/PB4uIhM
BiHgxlVnhAWQs/tBGQqdjTUxM7UrMw==
=pSo5
-----END PGP SIGNATURE-----

--Sig_/yktaNDk/jMXm7v/uSa6bko+--
