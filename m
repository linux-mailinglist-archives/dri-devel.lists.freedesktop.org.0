Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7D4499E3E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 00:07:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9965410E278;
	Mon, 24 Jan 2022 23:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1703 seconds by postgrey-1.36 at gabe;
 Mon, 24 Jan 2022 23:07:52 UTC
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE0910E278;
 Mon, 24 Jan 2022 23:07:52 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JjQck0KgCz4yNv;
 Tue, 25 Jan 2022 10:07:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1643065671;
 bh=gSrXkPNnk0YehCYf9GLjrCcWKdM0QjZqaSwXfjinxuQ=;
 h=Date:From:To:Cc:Subject:From;
 b=ZYc85MqQ96gQk3kYj6ZEspKNyK/7PIOCFRicMYvonFlRKxhdsCsU56HOTlm329JrF
 Wkn6wCbztF3IVE/6iDZZ5dIBNg3jXf0FrBys6phv4kYGEvO63fRx+7TBRhCGCQvyoh
 P4ESGWSPR1nmpJFEJYrpWTgAb3tzkF8e9I4LCbJpU86HaumPYWw96VAopReZUq3KG5
 ht+TJYXOC4TmH4s3fCuSqBAXTYG7kApeinbuzlac7XD9m9elvcU1Hte+DX2AIUcrY8
 t+MQyc/s+cp4/r/0e4kcH0hhgq8ECBMNwgu4vzo0CJWdE7L9byr4xfPSoR7epuq+vr
 iy7jq7Dg75n2g==
Date: Tue, 25 Jan 2022 10:07:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-intel-gt tree with the
 drm-intel tree
Message-ID: <20220125100748.16b29ea9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.X3blEqMQKfAGNPOMCSmikx";
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/.X3blEqMQKfAGNPOMCSmikx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel-gt tree got a conflict in:

  drivers/gpu/drm/i915/i915_drv.h

between commit:

  2ef97818d3aa ("drm/i915: split out i915_gem_evict.h from i915_drv.h")

from the drm-intel tree and commit:

  7e00897be8bf ("drm/i915: Add object locking to i915_gem_evict_for_node an=
d i915_gem_evict_something, v2.")

from the drm-intel-gt tree.

I fixed it up (I used the former and adde the following merge fix patch)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 25 Jan 2022 09:44:44 +1100
Subject: [PATCH] merge fix for "drm/i915: split out i915_gem_evict.h from i=
915_drv.h"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/i915_gem_evict.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_gem_evict.h b/drivers/gpu/drm/i915/i=
915_gem_evict.h
index d4478b6ad11b..bd6e78abd530 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.h
+++ b/drivers/gpu/drm/i915/i915_gem_evict.h
@@ -12,11 +12,13 @@ struct drm_mm_node;
 struct i915_address_space;
=20
 int __must_check i915_gem_evict_something(struct i915_address_space *vm,
+					  struct i915_gem_ww_ctx *ww,
 					  u64 min_size, u64 alignment,
 					  unsigned long color,
 					  u64 start, u64 end,
 					  unsigned flags);
 int __must_check i915_gem_evict_for_node(struct i915_address_space *vm,
+					 struct i915_gem_ww_ctx *ww,
 					 struct drm_mm_node *node,
 					 unsigned int flags);
 int i915_gem_evict_vm(struct i915_address_space *vm);
--=20
2.34.1

But then I also needed due to commit:

  6945c53bc712 ("drm/i915: Add locking to i915_gem_evict_vm(), v3.")

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 25 Jan 2022 09:51:55 +1100
Subject: [PATCH] extra merge fix for "drm/i915: split out i915_gem_evict.h =
from i915_drv.h"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/i915_gem_evict.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_evict.h b/drivers/gpu/drm/i915/i=
915_gem_evict.h
index bd6e78abd530..b7f8e9435b2c 100644
--- a/drivers/gpu/drm/i915/i915_gem_evict.h
+++ b/drivers/gpu/drm/i915/i915_gem_evict.h
@@ -21,6 +21,7 @@ int __must_check i915_gem_evict_for_node(struct i915_addr=
ess_space *vm,
 					 struct i915_gem_ww_ctx *ww,
 					 struct drm_mm_node *node,
 					 unsigned int flags);
-int i915_gem_evict_vm(struct i915_address_space *vm);
+int i915_gem_evict_vm(struct i915_address_space *vm,
+		      struct i915_gem_ww_ctx *ww);
=20
 #endif /* __I915_GEM_EVICT_H__ */
--=20
2.34.1

And then this due to commit

  e849f7e70860 ("drm/i915: Call i915_gem_evict_vm in vm_fault_gtt to preven=
t new ENOSPC errors, v2.")
(and the above commit)

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 25 Jan 2022 10:02:16 +1100
Subject: [PATCH] extra 2 merge fix for "drm/i915: split out i915_gem_evict.=
h from i915_drv.h"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i91=
5/gem/i915_gem_mman.c
index 4afad1604a6a..a69787999d09 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -21,6 +21,7 @@
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
 #include "i915_gem_ttm.h"
+#include "i915_gem_evict.h"
 #include "i915_vma.h"
=20
 static inline bool
--=20
2.34.1

--=20
Cheers,
Stephen Rothwell

--Sig_/.X3blEqMQKfAGNPOMCSmikx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmHvMUQACgkQAVBC80lX
0GzvCwf9FWUy7E0d12GF/oput5FtDHOwD+gXZobQ3fZiMEP6KSAwbhZiIYqS5xtu
fDqJoA+h0FWMW9A4yjXAiTLvNkT4eUT5Hie7UAXo736MXifY6G/zNlugPCq+fklj
eL8rInbENMk2CA+AgqwatbI31JY8Y1oDb+V2X3Han88r81yBj9RzYhIoDg3EwzIG
TOsYs4ZGuVH77h+l6CHnw0o2rGRpvkHHRgrEbdHqtgauQtgZ4dpL0d5WznTxV8HF
Zm2lygZeUTfzu4gSnrrmyY3VRtCKEXeD3w04TYAtDdzPa11h3e3mdeabiXWJlxYT
o4AV8NP8DYlgih9PY+U77QaQdfaG4w==
=Y/b3
-----END PGP SIGNATURE-----

--Sig_/.X3blEqMQKfAGNPOMCSmikx--
