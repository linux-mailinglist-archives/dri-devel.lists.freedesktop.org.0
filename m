Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8098943EC7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 03:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26A210E2C3;
	Thu,  1 Aug 2024 01:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sa8qnex8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970F110E2C3;
 Thu,  1 Aug 2024 01:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1722475612;
 bh=3+b6rMgl+NJQI1+PnuBqTbcxPeciIVa3QXZNYf8AnZ0=;
 h=Date:From:To:Cc:Subject:From;
 b=sa8qnex8b4os+/wv/WnaY6ccwkRy0JeS+wUuVvDsw2i0iZaNoUhNUBnFCjqOHy/5T
 jW8tFLw0/sm2PHjT94Q5dWyH9E26u1FT60FxnIZKt+9njvD6IO10PuSBEgnWThxad7
 e9qrfr31h3en0lH8yqjFYvoHoW650ZojNyM+uDwHQvTO6Yq+L8JV0DeC/L3Lq8SyLT
 FBFOJCuW7zBXU7+dOOJzjixfJF7/v1hGtof2gHk5ELo2D5Ya3KUij5n/cAMmEv+zs8
 oRRI/kLcCcZw8lb5a+I+cEJVWJE0WsIC+t+QJJS/CjB6k1KEaFwB/eWi2sCu8e8zBd
 aWjGTwu4665eg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZBBz2Hh6z4x0C;
 Thu,  1 Aug 2024 11:26:51 +1000 (AEST)
Date: Thu, 1 Aug 2024 11:26:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-misc tree
Message-ID: <20240801112650.30b8d53d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vNhWEgUKXHB297s8XXMWJXk";
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

--Sig_/vNhWEgUKXHB297s8XXMWJXk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_vm.c

between commit:

  4c44f89c5dae ("drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within b=
ulk sublist moves")

from the drm-misc tree and commit:

  a2387e69493d ("drm/xe: Take a ref to xe file when user creates a VM")

from the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/xe_vm.c
index c3bdb6362fe9,f225107bdd65..000000000000
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@@ -1604,7 -1670,10 +1673,11 @@@ static void vm_destroy_work_func(struc
  		XE_WARN_ON(vm->pt_root[id]);
 =20
  	trace_xe_vm_free(vm);
 +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
+=20
+ 	if (vm->xef)
+ 		xe_file_put(vm->xef);
+=20
  	kfree(vm);
  }
 =20

--Sig_/vNhWEgUKXHB297s8XXMWJXk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaq5FoACgkQAVBC80lX
0Gw7+Af/a263s5qrAfruejH6cvM7gSin/ndV6J8n0743hIUeZVlD7jHXySuhyg3b
4VjsiOhWqa9yjZUX9oqIyTKulPGJoUO3BUlcHahP+kflJTbaLfQ1G4wf0/tJ7a1R
AiLmLY/8QAOB0Wimml3/+KDzQiUfirkWC8QeaaaV/cg2kVNN5EqI8MYln/tWJuhI
IaxNGQkxZiDQQHzMGQYX7xMnk9sLN71xYlKv25U4KVQY4TTm2loBnheWAsHDemVx
SUJYb2P5FZZq3wJI7xNdCYn4eO29zxi+6/foLGqKqIxjqDidl3LcPIpk4hKe2DFf
OVGxbtFQg/rjybSBuz+5rKnGIRw2wQ==
=5M9J
-----END PGP SIGNATURE-----

--Sig_/vNhWEgUKXHB297s8XXMWJXk--
