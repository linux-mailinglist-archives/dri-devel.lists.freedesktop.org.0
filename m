Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A366FFE0E
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 02:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C163810E608;
	Fri, 12 May 2023 00:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C1410E608
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 00:38:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QHVHX1Dn9z4x4k;
 Fri, 12 May 2023 10:38:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1683851914;
 bh=My2tDJ8+k3Zx2VnVNOEnNcWKiimgFTnpNXvSNUsAFzk=;
 h=Date:From:To:Cc:Subject:From;
 b=b07awEOvIwNjEgI8mYHtiYB07uNIcIQlQv/Kk5QuiYgB0pbJC6u7cNi8jbWoDg6NK
 NuUNN6fEDwmd01Kvbbv9TrowtHP5tbSUURHjIFDHzS1hrSVfRibl/Y4P1/uRY60y+c
 FSb0yOZ4b4Zq+tCAyyqgFwyI6ZL3JkNmFlb+1d5DFp6xYMKlEC4+HIC8W9QlsTg89s
 kR6edLTjnMMWU0TYwVe78Xmam8SP9x7ZYtQE8n1y8MnfCqtRDSDkwS4OkakQJA37fe
 T7sN14bZfb3Io+7/9LWzOmSek+eFycrLGVuYNSXGl6tFkEE3gWQ92epgQA8XTuBUmz
 uwv2fLDXPJRpg==
Date: Fri, 12 May 2023 10:38:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20230512103829.4136c741@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7aoyIV5=co.LNCbJp15662H";
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
Cc: Michael Ellerman <mpe@ellerman.id.au>, Huacai Chen <chenhuacai@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 WANG Xuerui <kernel@xen0n.name>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/7aoyIV5=co.LNCbJp15662H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/Kconfig

between commits:

  78f0929884d4 ("powerpc/64: Always build with 128-bit long double")
  70cc1b5307e8 ("Merge tag 'powerpc-6.4-1' of git://git.kernel.org/pub/scm/=
linux/kernel/git/powerpc/linux")

from Linus' tree and commit:

  d3295311e589 ("drm/amdgpu/display: Enable DC_FP for LoongArch")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/display/Kconfig
index 2d8e55e29637,b015c7d19531..000000000000
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@@ -8,7 -8,7 +8,7 @@@ config DRM_AMD_D
  	depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
  	select SND_HDA_COMPONENT if SND_HDA_CORE
  	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
- 	select DRM_AMD_DC_FP if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_M=
ODE_NEON && !CC_IS_CLANG))
 -	select DRM_AMD_DC_FP if (X86 || LOONGARCH || PPC64 || (ARM64 && KERNEL_M=
ODE_NEON && !CC_IS_CLANG))
++	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM6=
4 && KERNEL_MODE_NEON && !CC_IS_CLANG))
  	help
  	  Choose this option if you want to use the new display engine
  	  support for AMDGPU. This adds required support for Vega and

--Sig_/7aoyIV5=co.LNCbJp15662H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmRdioUACgkQAVBC80lX
0Gw9UQf+Mh+RtHJTlV+ldpdC9D86sraukz0JrSnxLzz7iKO9K4IxD6078JYTYLFk
2RoTTI8Yo5qXhdTZoMQmkoCrFXUVtU4CqqWDtrEtzTEPN1BEJ++SccWSGdXM1l9+
LIqandQQ94qSRHhrBXlsa5Fa5Cp7SamKd/OLk4y/OqnlR/IhXipllvg4notliwpR
vPfMfEiSpaaeJWNFCJyOc2ZpD0hOMVhbDP6sTf7KOxdB68wNCFMEMl+/wLLknx1d
UGogaDbKUx+Zj3CUUEgNsRfOylHtM/etEclegQZ/KTydP/YA09SNkzgOle9iRTZ0
ZHEsjutAaykA64e0NsrYOoMoucV0Mw==
=VxGd
-----END PGP SIGNATURE-----

--Sig_/7aoyIV5=co.LNCbJp15662H--
