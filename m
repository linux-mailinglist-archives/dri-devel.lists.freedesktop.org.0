Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 138851448FE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 01:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9196D6EB6B;
	Wed, 22 Jan 2020 00:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BA36EAD5;
 Wed, 22 Jan 2020 00:37:44 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 482RM46tSvz9sRG;
 Wed, 22 Jan 2020 11:37:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1579653461;
 bh=PJKoeTUvZRzpyMSjdbuqjPU1o/xVBju6xZV9Su82U4I=;
 h=Date:From:To:Cc:Subject:From;
 b=DDz18igmUVSn515Aej90Gx/ujacrBQr1pEcvCH05DJCJwjmhp7HfRi2cgwMV5HHCv
 EQRM6C9dMOEkQf70YVIArOilurLNRcPk2SrxjrrcjGcGQHU+z4rkvhvv8kNs6z4Eur
 fvueZ3ogcWcW6nzl/9KZDhSCWWy+19hOwy2zftvpbsLnYfkxBCKxRKGCzKwLV9s6aP
 DGW3pG1tVVRLtaleJ9oDc9cXqpJmqVBqNLbMb45/Bd6BS1u1nbrc36OgYAqmYEsYGe
 zRXHDAG2nKcSAo418EjsbJfdYZoH7Z9U8o9kGhDI+Bmh+IwYWMS83Wc68Tdwx41c53
 att7JtWEr8CNw==
Date: Wed, 22 Jan 2020 11:37:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes tree
Message-ID: <20200122113731.4566ffda@canb.auug.org.au>
MIME-Version: 1.0
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: multipart/mixed; boundary="===============1816041697=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1816041697==
Content-Type: multipart/signed; boundary="Sig_/Y+gwNNIz3WOk7KKp./fX9p.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Y+gwNNIz3WOk7KKp./fX9p.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/i915_gem_gtt.c

between commit:

  ecc4d2a52df6 ("drm/i915/userptr: fix size calculation")

from the drm-intel-fixes tree and commit:

  2c86e55d2ab5 ("drm/i915/gtt: split up i915_gem_gtt")

from the drm tree.

I fixed it up (I used the latter version of the file and applied teh
following merge fix patch) and can carry the fix as necessary. This is
now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your
tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 22 Jan 2020 11:33:32 +1100
Subject: [PATCH] fix up for "drm/i915/userptr: fix size calculation"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c | 1 +
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c b/drivers/gpu/drm/i915/gt=
/gen6_ppgtt.c
index f10b2c41571c..f4fec7eb4064 100644
--- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
@@ -131,6 +131,7 @@ static void gen6_ppgtt_insert_entries(struct i915_addre=
ss_space *vm,
=20
 	vaddr =3D kmap_atomic_px(i915_pt_entry(pd, act_pt));
 	do {
+		GEM_BUG_ON(iter.sg->length < I915_GTT_PAGE_SIZE);
 		vaddr[act_pte] =3D pte_encode | GEN6_PTE_ADDR_ENCODE(iter.dma);
=20
 		iter.dma +=3D I915_GTT_PAGE_SIZE;
diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt=
/gen8_ppgtt.c
index 077b8f7cf6cb..4d1de2d97d5c 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -379,6 +379,7 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
 	pd =3D i915_pd_entry(pdp, gen8_pd_index(idx, 2));
 	vaddr =3D kmap_atomic_px(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
 	do {
+		GEM_BUG_ON(iter->sg->length < I915_GTT_PAGE_SIZE);
 		vaddr[gen8_pd_index(idx, 0)] =3D pte_encode | iter->dma;
=20
 		iter->dma +=3D I915_GTT_PAGE_SIZE;
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/Y+gwNNIz3WOk7KKp./fX9p.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4nmUsACgkQAVBC80lX
0GyF+AgAntdfWyi+nWURGuUwXk/YgnDc0blPdAG4t5WCRt1+nMpn6MbILg3Tj3hX
crgqIf/d0wuINZOzejwOF1ITIRDVfefqy2WzCAPfhnp3xEhcQViZy7dzjj7ywEYD
LL27MO4rFnXObNpm/a1ShFZBPaU4Rzapug32308BQQlLLwX1X6fWaq4UiQJd3OK2
sJrbqfbgBVRWsPhWi4MlfqVsKFQXOCTTN5To69sPHtggtWVTdLT7ezT6NZ+aulLz
rm3mhaf7bX6dpyRp7lpwg8yJ2As4BqbKm7lKg1P+91qCeja+Z/41E44AmUWgTZVg
MF54Hk2pkeMNc1wgSl4UwOvmUZ8x0g==
=jspa
-----END PGP SIGNATURE-----

--Sig_/Y+gwNNIz3WOk7KKp./fX9p.--

--===============1816041697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1816041697==--
