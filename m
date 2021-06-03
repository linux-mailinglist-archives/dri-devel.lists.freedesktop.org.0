Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79A5399DDC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 11:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9112C6E0DC;
	Thu,  3 Jun 2021 09:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0F66E0DC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 09:32:46 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Fwgfg3bPVz9sPf;
 Thu,  3 Jun 2021 19:32:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1622712765;
 bh=O+KtTbQf+6wyiQAN9S+ojq8+vfTh0V/4wgvl1In0Auk=;
 h=Date:From:To:Cc:Subject:From;
 b=Zwv/UCWmaj5l9RvqEEpiR+TlcPcXtSsSTpEyU/WVHcwwypWkftK7CrbfGztIaEcFJ
 fUTCsMeDgohvqH0p0F/gpufk4dO7wPaaR+yUb/3g2USt8KGB/9aSspU9s3ajT2gwFd
 l8IrbiRC0NjEl+m9m5Blr/MTrauZoT0GxGK4OggDcnjijoXSdfxA8vNNZcHdfev+Fj
 DH21adlx0tgdCnPJIeT9IVrU+AgNM/CPwPYgL0HfZqeIWZeE6ptewgxWs8LUqu1uUq
 Z2xmFTEVGRn3Z5GqWWDI2RyRaclLXTbKHhKMV8MpBUgvoFcCqab5BuXgRRbQ9vk5zx
 3U4P7lE90ek3Q==
Date: Thu, 3 Jun 2021 19:32:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warnings after merge of the drm tree
Message-ID: <20210603193242.1ce99344@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X=z7ep.m8R.YqP5_zcYmvjT";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/X=z7ep.m8R.YqP5_zcYmvjT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
these warnings:

Documentation/gpu/driver-uapi.rst:2412: WARNING: Duplicate C declaration, a=
lso defined at gpu/rfc/i915_gem_lmem:1393.
Declaration is '.. c:enum:: drm_i915_gem_memory_class'.
Documentation/gpu/driver-uapi.rst:2484: WARNING: Duplicate C declaration, a=
lso defined at gpu/rfc/i915_gem_lmem:2484.
Declaration is '.. c:struct:: drm_i915_gem_memory_class_instance'.
Documentation/gpu/driver-uapi.rst:7: WARNING: Duplicate C declaration, also=
 defined at gpu/rfc/i915_gem_lmem:7.
Declaration is '.. c:struct:: drm_i915_memory_region_info'.
Documentation/gpu/driver-uapi.rst:2531: WARNING: Duplicate C declaration, a=
lso defined at gpu/rfc/i915_gem_lmem:2531.
Declaration is '.. c:struct:: drm_i915_query_memory_regions'.
Documentation/gpu/driver-uapi.rst:2595: WARNING: Duplicate C declaration, a=
lso defined at gpu/rfc/i915_gem_lmem:1393.
Declaration is '.. c:struct:: drm_i915_gem_create_ext'.
Documentation/gpu/driver-uapi.rst:2615: WARNING: Duplicate C declaration, a=
lso defined at gpu/rfc/i915_gem_lmem:1393.
Declaration is '.. c:struct:: drm_i915_gem_create_ext_memory_regions'.

Introduced by (one or more of) commits

  0c1a77cbdafb ("drm/doc: add section for driver uAPI")
  2bc9c04ea702 ("drm/doc/rfc: i915 DG1 uAPI")
  727ecd99a4c9 ("drm/doc/rfc: drop the i915_gem_lmem.h header")

--=20
Cheers,
Stephen Rothwell

--Sig_/X=z7ep.m8R.YqP5_zcYmvjT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC4oboACgkQAVBC80lX
0GyAIwgAlnugat8uTrMp3uyPGuQQYyGtaz4KuUlZm3b30TPz3bvCpyXUHNmho5B5
LvgpqfOtGZv9DxDzS9OCTZFZNt2MpNRRz3drBvxtkP0E6nnRuSKQLc60LdWmp1SQ
6tX7wtb5MDk3UXDXc2ui6hlf0/B3pxdyeWYWGxFlBCAnFbUQc4Cfl5H5roFvwXW+
WcSIasiR/cyR8AWrhIQOW3X5X4JJtGMmB4UyAkLqLiwrAHkmtKp5SKdqi0BxlUPQ
HJXboTW38wzgVnMKSIhZ8DflHDU9F2mvSLkmNYk3OQbs9wgAw6pUajR+X4NfncsK
pt5WP8DoQgTM0KUWNYldhXWvimCb3g==
=io8C
-----END PGP SIGNATURE-----

--Sig_/X=z7ep.m8R.YqP5_zcYmvjT--
