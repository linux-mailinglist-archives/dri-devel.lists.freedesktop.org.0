Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D175B657B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 04:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BCA10E0F2;
	Tue, 13 Sep 2022 02:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777BD10E0AA;
 Tue, 13 Sep 2022 02:19:14 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MRRwq6NR6z4xG5;
 Tue, 13 Sep 2022 12:19:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1663035549;
 bh=ZFeRv4uohfft5yDXXYHuLheoVuQh1dk5n5AYQovmPgc=;
 h=Date:From:To:Cc:Subject:From;
 b=p8vZKymkgoGz94/kvkLY+AN/Xp2a/IguS288Ef1gYWYYDYzKnAXAUjeI1exozZBd4
 m3vf7Gxyouv9Fja24tdf8fV6wFzmuZlPVpfJlW1mrljSfwEXMl4TzhGkvqYf56PbQf
 w0eONaPwnSmmr0/m81JVbHN108c6Y9WMODLn/82ftav458W1NWdVmat9NAgI71X58d
 Mj/rZhXauUA0B+1ZVClHeDJhrDj9mSV0zpJ/h7O0R1P/RVn9SdXoCjCLM36pq0InRJ
 YbmffbjiAJZjq2mQHhf159VTjarpqSLQkEjAE1FkyG0Jd4l9GmpXqMyjuTFJPBn0+x
 nhsse+c20JIvA==
Date: Tue, 13 Sep 2022 12:19:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Subject: linux-next: manual merge of the drm-intel tree with the drm tree
Message-ID: <20220913121904.66236a74@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M00zIyhhRei7cfbawuHO/w4";
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/M00zIyhhRei7cfbawuHO/w4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_drv.h

between commit:

  3bb6a44251b4 ("drm/i915: Rename ggtt_view as gtt_view")

from the drm tree and commit:

  5fd5cc73e449 ("drm/i915: split out i915_gem.c declarations to i915_gem.h")

from the drm-intel tree.

I fixed it up (I used the latter version of this file and applied the
merge fix below) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 13 Sep 2022 12:06:57 +1000
Subject: [PATCH] drm/i915: fix up for "drm/i915: Rename ggtt_view as gtt_vi=
ew"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/i915_gem.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.h b/drivers/gpu/drm/i915/i915_ge=
m.h
index 2fccb19ed9f7..a5cdf6662d01 100644
--- a/drivers/gpu/drm/i915/i915_gem.h
+++ b/drivers/gpu/drm/i915/i915_gem.h
@@ -36,7 +36,7 @@ struct drm_file;
 struct drm_i915_gem_object;
 struct drm_i915_private;
 struct i915_gem_ww_ctx;
-struct i915_ggtt_view;
+struct i915_gtt_view;
 struct i915_vma;
=20
 void i915_gem_init_early(struct drm_i915_private *i915);
@@ -48,12 +48,12 @@ void i915_gem_drain_workqueue(struct drm_i915_private *=
i915);
 struct i915_vma * __must_check
 i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
 			    struct i915_gem_ww_ctx *ww,
-			    const struct i915_ggtt_view *view,
+			    const struct i915_gtt_view *view,
 			    u64 size, u64 alignment, u64 flags);
=20
 struct i915_vma * __must_check
 i915_gem_object_ggtt_pin(struct drm_i915_gem_object *obj,
-			 const struct i915_ggtt_view *view,
+			 const struct i915_gtt_view *view,
 			 u64 size, u64 alignment, u64 flags);
=20
 int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
--=20
2.35.1

--=20
Cheers,
Stephen Rothwell

--Sig_/M00zIyhhRei7cfbawuHO/w4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmMf6JgACgkQAVBC80lX
0Gxw4AgAlN/tUsNDMRHg9TPs2ma8VC+kQQn2cBMfcZX30gMl78vj/KRgGD23SZPY
UuzW2o4q/NaL5jaoHLHJPAHidyFhsBYlkOI90h+kZZs3uh5QXhJaLt5DHNYrsZvG
ZivYdMs9DtdQ1A46Yii9quvj8zDljW3Z6ooau8FunwWJjBWeUlltoReHab+PPgMB
WtQtvamyUMeMFvhW/SzqYQMTAa33NliIpPI5M0QMo99v1yR9OpiYH5oCXj7jj05p
OQ7F7pSCyLmNHCIj7D1zZIJcU+iJ52z5INWhDcBrVzMNx72aoLyGKGP4SiwbZSXk
Ue+GW4zfhBDJNzlePQYod1eRCC9JFA==
=pQrj
-----END PGP SIGNATURE-----

--Sig_/M00zIyhhRei7cfbawuHO/w4--
