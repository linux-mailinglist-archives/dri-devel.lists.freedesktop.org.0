Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA86FFC6A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 01:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E5389DA7;
	Mon, 18 Nov 2019 00:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD0F89D57
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 00:17:53 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47GV0D4LwYz9s4Y;
 Mon, 18 Nov 2019 11:17:47 +1100 (AEDT)
Date: Mon, 18 Nov 2019 11:17:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: linux-next: manual merge of the drm tree with the kbuild tree
Message-ID: <20191118111744.2beeb816@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1574036270;
 bh=er8aQvti1hb8NEWJoT8OPqKSmOaCUydcAzCHa+4TfB0=;
 h=Date:From:To:Cc:Subject:From;
 b=Ofs0oW5RVGKlEy4kP4u7bfwchbS8T3x7a2ZK8nBhZUyR+W2u9RbOGNrLk8/VIGwH4
 uiLxZZk2EwZ6Qz6SZpaZx/3UT6ckvmfhmOX0W5c3gUbZIrbygUqj5MU4iUQts6XS7I
 4kDFMRfMHrA1leluadOoTnOy+KG3t7RxOlqM42CHUBPR3uDJELa4u6diEgKQ6j23Zi
 XKj9G9nOcdsvOBsrH1jjXjeHAgTNUvzZXe9Znw4ZO+pP5HhgG6OPJHYrLPbaYzyAfd
 /KCeAvxoakn+y80gk13iD8kvbDOHJ/HF/rvx9yzqBGH1AJU/2VyfO+JaeTVSzzEnfM
 jFQyYsyZu9j+g==
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: multipart/mixed; boundary="===============0407829867=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0407829867==
Content-Type: multipart/signed; boundary="Sig_/USf9csr6sW8/Z5gDG3oHV/U";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/USf9csr6sW8/Z5gDG3oHV/U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/Kconfig.debug

between commit:

  fcbb8461fd23 ("kbuild: remove header compile test")

from the kbuild tree and commit:

  d30213e533fa ("drm/i915: Fix Kconfig indentation")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/Kconfig.debug
index 41c8e39a73ba,eea79125b3ea..000000000000
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@@ -1,33 -1,34 +1,33 @@@
  # SPDX-License-Identifier: GPL-2.0-only
  config DRM_I915_WERROR
-         bool "Force GCC to throw an error instead of a warning when compi=
ling"
-         # As this may inadvertently break the build, only allow the user
-         # to shoot oneself in the foot iff they aim really hard
-         depends on EXPERT
-         # We use the dependency on !COMPILE_TEST to not be enabled in
-         # allmodconfig or allyesconfig configurations
-         depends on !COMPILE_TEST
-         default n
-         help
-           Add -Werror to the build flags for (and only for) i915.ko.
-           Do not enable this unless you are writing code for the i915.ko =
module.
-=20
-           Recommended for driver developers only.
-=20
-           If in doubt, say "N".
+ 	bool "Force GCC to throw an error instead of a warning when compiling"
+ 	# As this may inadvertently break the build, only allow the user
+ 	# to shoot oneself in the foot iff they aim really hard
+ 	depends on EXPERT
+ 	# We use the dependency on !COMPILE_TEST to not be enabled in
+ 	# allmodconfig or allyesconfig configurations
+ 	depends on !COMPILE_TEST
 -	select HEADER_TEST
+ 	default n
+ 	help
+ 	  Add -Werror to the build flags for (and only for) i915.ko.
+ 	  Do not enable this unless you are writing code for the i915.ko module.
+=20
+ 	  Recommended for driver developers only.
+=20
+ 	  If in doubt, say "N".
 =20
  config DRM_I915_DEBUG
-         bool "Enable additional driver debugging"
-         depends on DRM_I915
-         select DEBUG_FS
-         select PREEMPT_COUNT
-         select REFCOUNT_FULL
-         select I2C_CHARDEV
-         select STACKDEPOT
-         select DRM_DP_AUX_CHARDEV
-         select X86_MSR # used by igt/pm_rpm
-         select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
-         select DRM_DEBUG_MM if DRM=3Dy
+ 	bool "Enable additional driver debugging"
+ 	depends on DRM_I915
+ 	select DEBUG_FS
+ 	select PREEMPT_COUNT
+ 	select REFCOUNT_FULL
+ 	select I2C_CHARDEV
+ 	select STACKDEPOT
+ 	select DRM_DP_AUX_CHARDEV
+ 	select X86_MSR # used by igt/pm_rpm
+ 	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
+ 	select DRM_DEBUG_MM if DRM=3Dy
  	select DRM_DEBUG_SELFTEST
  	select DMABUF_SELFTESTS
  	select SW_SYNC # signaling validation framework (igt/syncobj*)

--Sig_/USf9csr6sW8/Z5gDG3oHV/U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3R4ygACgkQAVBC80lX
0GxOxAf9H6jZ6ZSXV0i9podvVHiAjJFeotvG2AUiBoYF6mS0hNJY6OcEYVbUrDeY
Y0tw1VaB/pYzZW82K4lHA2NHoM8K6M75YvTI2Pxcn63mTZVQNTQUgy3mkxdx8qvP
dJykv2KBy7UbtHc6hatqrExixGNQR5/t2TPN9qfp86pbS/qccbmhFQWVkMp7lQjL
vVhnrBQ9msIq8NqDmxm5vpa+aO8fFad3fB7F/tcECRcRdW0x0wVq1CogiXzJdZwi
z291AQxk/YwHdkbq7ZU1DsVTJ5zJv8ezXBYFvvSnJgzhGmkjc3A37ha52HGr96Y3
u/rkrtO4NVWbSrh9+0mPhIYv8n1+9Q==
=gNCg
-----END PGP SIGNATURE-----

--Sig_/USf9csr6sW8/Z5gDG3oHV/U--

--===============0407829867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0407829867==--
