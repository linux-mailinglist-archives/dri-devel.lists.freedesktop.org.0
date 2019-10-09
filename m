Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E4FD04CD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 02:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F6E6E8C2;
	Wed,  9 Oct 2019 00:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096366E8C2;
 Wed,  9 Oct 2019 00:36:01 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46nwHf173jz9sDB;
 Wed,  9 Oct 2019 11:35:58 +1100 (AEDT)
Date: Wed, 9 Oct 2019 11:35:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexdeucher@gmail.com>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20191009113557.41ced49e@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1570581359;
 bh=hjJjL/ozQrg33SwOSe/5cE0JrIJlL2UK7Xv7UiyjKvU=;
 h=Date:From:To:Cc:Subject:From;
 b=Q5c1fMRcW2DjlwospuJTfTmx6lD90/9vQLamOPSg49xJbmdptqXpRhjYu4jVllD36
 8zE0swWHmMB688MmGmzrACzpEA8CZXJ1nJZX9b0wfCUxt4qYEvRKAro2TIVQkKV3GR
 L1Y418l2N7+ABK/4SjHuJJYX4vxzSlC6tztgI6ep6oHuA4/Y+Yf4DfEbZ35QyiF+0t
 RNHPcgZkGr3RL0uCpxSWul8wZXFtPSa0uGTYQ5Ul7JB4UrVU4Qn/7Guf7VXjHNMJvT
 i5dZFv0l5JqlHyG7qimG9xWJs2qQ41K4VI5v7tk5fKG56dsyYxwNO+6Tmv47pbIfCu
 +Hk9hQknr/p3w==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0370689799=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0370689799==
Content-Type: multipart/signed; boundary="Sig_/fCeB9E99v+6r5u9dD0w7vTz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fCeB9E99v+6r5u9dD0w7vTz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_module.c:25:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_priv.h:40:10: fatal error: drm/drm=
P.h: No such file or directory
   40 | #include <drm/drmP.h>
      |          ^~~~~~~~~~~~
In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:38:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_priv.h:40:10: fatal error: drm/drm=
P.h: No such file or directory
   40 | #include <drm/drmP.h>
      |          ^~~~~~~~~~~~
In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_device.c:26:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_priv.h:40:10: fatal error: drm/drm=
P.h: No such file or directory
   40 | #include <drm/drmP.h>
      |          ^~~~~~~~~~~~
In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:3=
4:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_priv.h:40:10: fatal error: drm/drm=
P.h: No such file or directory
   40 | #include <drm/drmP.h>
      |          ^~~~~~~~~~~~


Caused by commit

  4e98f871bcff ("drm: delete drmP.h + drm_os_linux.h")

interacting with commit

  6b855f7b83d2 ("drm/amdkfd: Check against device cgroup")

from the amdgpu tree.

I added the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 9 Oct 2019 11:24:38 +1100
Subject: [PATCH] drm/amdkfd: update for drmP.h removal

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/am=
dkfd/kfd_priv.h
index b8b4485c8f74..41bc0428bfc0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -37,7 +37,9 @@
 #include <linux/kref.h>
 #include <linux/sysfs.h>
 #include <linux/device_cgroup.h>
-#include <drm/drmP.h>
+#include <drm/drm_file.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_device.h>
 #include <kgd_kfd_interface.h>
=20
 #include "amd_shared.h"
@@ -49,8 +51,6 @@
 /* GPU ID hash width in bits */
 #define KFD_GPU_ID_HASH_WIDTH 16
=20
-struct drm_device;
-
 /* Use upper bits of mmap offset to store KFD driver specific information.
  * BITS[63:62] - Encode MMAP type
  * BITS[61:46] - Encode gpu_id. To identify to which GPU the offset belong=
s to
--=20
2.23.0

--=20
Cheers,
Stephen Rothwell

--Sig_/fCeB9E99v+6r5u9dD0w7vTz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2dK20ACgkQAVBC80lX
0Gxn3gf+IeA2Y+XMWHNmZjY3J/ZSjXHuL2Fk4IL8EYqsPnnO3a7bgqa06ZbtfepV
ai4XV/7ox+aTGpSXiR5nDAxW9iJSavwGWDT+25V60542eBSijPOkCqSeKza27yL0
HSpjg+1ZKfY/pbN2oyBKoSbvO22NQGA0hy4K6hUuzYA00KzFLd6b/7LiX2461qeW
0uA7DpyHc+Fw3D8kprrYnmI+0xPpM/ZyVtvDtMPVpoAPobQJB6DNYjroxsdiRPqb
jp4dBlxBVMHCOSqbMIe6KnyF6/+NwSxsHvw6fiTDCvwMBkszFZwTWaNiW5tyvpLi
GgTYESuyuDaEIXT64VFFz0wjhNdmJg==
=mmD0
-----END PGP SIGNATURE-----

--Sig_/fCeB9E99v+6r5u9dD0w7vTz--

--===============0370689799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0370689799==--
