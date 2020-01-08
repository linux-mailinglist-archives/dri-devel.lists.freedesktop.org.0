Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B5B133B89
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 07:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3436E855;
	Wed,  8 Jan 2020 06:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F776E17F;
 Wed,  8 Jan 2020 06:08:10 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47szLr5WMjz9sRf;
 Wed,  8 Jan 2020 17:08:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1578463688;
 bh=yjtgJYNjpLiclzKCjvm2LhAxhBOEzXwYBtw3gLFNUQ0=;
 h=Date:From:To:Cc:Subject:From;
 b=oSrJg21EzaCtDsk137+ZXZD+jbOysqR5DCxGgr8GMlS/99oGDgQEhm16yv7Ie28t3
 0MLHtGaRgnlm3zL81MiTEqsfVaqxLIxe7kV+9VepMYTfl+MfSOZNb+URUwxQAXizJ8
 MtqnTO6G5HS6s6qBSp8FrOXz3gEmDP3pl8AxX3quJbXMsSDjonyiYehELoaujmu5c1
 jaon4HXpzUyJjsPrr2W3kAcH6HJGmzvzE0YFRxoCoTPhY4qHzVLfMy5VygoKCFeXr2
 ChxoPXGY/CLU+FUNkprOMQFTBE1qtq4rBORmQIYGjc26tGxgiTIpLsQQ7Hq3G0zYXD
 s8izXNc24P9nQ==
Date: Wed, 8 Jan 2020 17:08:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoph Hellwig <hch@lst.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the generic-ioremap tree with the
 drm-intel tree
Message-ID: <20200108170803.1c91b20d@canb.auug.org.au>
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
Content-Type: multipart/mixed; boundary="===============0013450656=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0013450656==
Content-Type: multipart/signed; boundary="Sig_/DY3X6u8aQ1_kIqeYq914ZXw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DY3X6u8aQ1_kIqeYq914ZXw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the generic-ioremap tree got a conflict in:

  drivers/gpu/drm/i915/i915_gem_gtt.c

between commit:

  2c86e55d2ab5 ("drm/i915/gtt: split up i915_gem_gtt")

from the drm-intel tree and commit:

  4bdc0d676a64 ("remove ioremap_nocache and devm_ioremap_nocache")

from the generic-ioremap tree.

I fixed it up (I used the file from the former and added the following
merge fix patch) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 8 Jan 2020 17:04:59 +1100
Subject: [PATCH] fix up for "drm/i915/gtt: split up i915_gem_gtt"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt=
/intel_ggtt.c
index 99189cdba8a9..1a2b5dcde960 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -801,7 +801,7 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u6=
4 size)
 	 * readback check when writing GTT PTE entries.
 	 */
 	if (IS_GEN9_LP(i915) || INTEL_GEN(i915) >=3D 10)
-		ggtt->gsm =3D ioremap_nocache(phys_addr, size);
+		ggtt->gsm =3D ioremap(phys_addr, size);
 	else
 		ggtt->gsm =3D ioremap_wc(phys_addr, size);
 	if (!ggtt->gsm) {
--=20
2.24.0

--=20
Cheers,
Stephen Rothwell

--Sig_/DY3X6u8aQ1_kIqeYq914ZXw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4VccMACgkQAVBC80lX
0GzkLAf9GVolluU4K7M7MdQINLQMtBjkyGZqt480dJn7crPAZxq2s0usXsoXMT6x
w066yy0zLuu9SzxoC5ixntHzRHwWFhhzqWji0MCHNNYv/bEQiAHEgYooEX3e2bVJ
1QrnE4Y2VZylpE1DVPY1hHRqY8ybeEzpybU+LGWlu6cyL8X7FsIwPVru08K6DspV
2FmhaxUx3fu0acr4TQ+2WdVxsjAtmZQLO52kq9pqiTmjncXaD7NwqT+l4LDxb52c
Nd/8+V8gUp4lo4rjK4D10QEmBn8a74OKdHRnYuwjVeaTVRGCTw2tEAi/bCWSwuhJ
viaB1+O9Sed9q0eKOmeO1bjm/hvJjA==
=Z6gs
-----END PGP SIGNATURE-----

--Sig_/DY3X6u8aQ1_kIqeYq914ZXw--

--===============0013450656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0013450656==--
