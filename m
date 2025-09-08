Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BB4B483C4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 07:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446A010E1F0;
	Mon,  8 Sep 2025 05:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P/OTpD7K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266ED10E1F0;
 Mon,  8 Sep 2025 05:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1757310555;
 bh=u02UJ6ZXh3NmyEBtqPxpp2cMxmC0q9X+OV3aGctYjEg=;
 h=Date:From:To:Cc:Subject:From;
 b=P/OTpD7KrgvJ9gk0JlMAt2qEjr21n22+Kv1HHal1xqpa4utamE6CdEWtsn4+/O7KH
 cICZK3ZzFU/Kj+O1i6RGQ62Jf432YCYY84up3p15aQm+R75SUBWy53B5B1sCT0fklj
 WazGohXOCm9+jTSSw//vjxghUMlod/TVQl1zWW6RFNAoJ/eecrfiGI3esM5HCreNkM
 xHt/VFPSq8Wjs4I5niewlDSOtDHYFM0M+dr1GS8540hemrWSn5jG10zyNu3Gb6ZG+g
 +jSRFVp+TgdmoEtifZcxZVZkGVv6Wy5RVLEulF4H0ZtYBMns50VmUjmd10S6QOylke
 HW63AAJrQMyFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4cKwxk3gTrz4w2S;
 Mon,  8 Sep 2025 15:49:14 +1000 (AEST)
Date: Mon, 8 Sep 2025 15:49:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nick Li <nick.li@foursemi.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Wig Cheng <onlywig@gmail.com>
Subject: linux-next: manual merge of the devicetree tree with the sound-asoc
 and drm-misc trees
Message-ID: <20250908154913.5fb9ae9c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OX4/p=OXFtBgv3h7kG9jnVV";
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

--Sig_/OX4/p=OXFtBgv3h7kG9jnVV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.yaml

between commits:

  243167e96939 ("dt-bindings: vendor-prefixes: Add Shanghai FourSemi Semico=
nductor Co.,Ltd")
  09b26dce32f0 ("dt-bindings: vendor-prefixes: Add Mayqueen name")

from the sound-asoc and drm-misc trees and commit:

  4ed46073274a ("dt-bindings: vendor-prefixes: Add undocumented vendor pref=
ixes")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/vendor-prefixes.yaml
index dcf82d972037,0f5273123650..000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@@ -560,8 -568,8 +576,10 @@@ patternProperties
      description: FocalTech Systems Co.,Ltd
    "^forlinx,.*":
      description: Baoding Forlinx Embedded Technology Co., Ltd.
 +  "^foursemi,.*":
 +    description: Shanghai FourSemi Semiconductor Co.,Ltd.
+   "^foxlink,.*":
+     description: Foxlink Group
    "^freebox,.*":
      description: Freebox SAS
    "^freecom,.*":
@@@ -943,8 -955,8 +967,10 @@@
      description: Maxim Integrated Products
    "^maxlinear,.*":
      description: MaxLinear Inc.
+   "^maxtor,.*":
+     description: Maxtor Corporation
 +  "^mayqueen,.*":
 +    description: Mayqueen Technologies Ltd.
    "^mbvl,.*":
      description: Mobiveil Inc.
    "^mcube,.*":

--Sig_/OX4/p=OXFtBgv3h7kG9jnVV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+blkACgkQAVBC80lX
0Gy9eQf/WAaQO4uhlb73zuSy+mJ47ng+u3d0GTkf3d4rXfReg1sNQnjrAbXf101b
/FwKmQe9Z/4a+/zjSxUj/Vmb/ns4V74C7++d0Wnw5f+FptyqW5Fwdcbpml3tJc3W
lK9UZCJFAKGSCCUhRayO/plqTaalUeWiLr5NQe9YrfAA6+KpxdrUvMWfCjJR5Alm
OPJRoo5n1Sy+Y/cFZ/Iluc2MUF9ARAaH49A6xPoBK+f2tAuOxJSnCBI+05eXEc2G
Jv2lo9gTA2Zlm+/O6I5NIpCIz9afEVgOTBlQvrHVTktU5C/XLtBcB2d6BCi7t6mB
ZbKUws7+hTkxIPhpqx+J+JX/5oU7+g==
=zHgE
-----END PGP SIGNATURE-----

--Sig_/OX4/p=OXFtBgv3h7kG9jnVV--
