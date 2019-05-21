Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD82524536
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 02:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A0F891FA;
	Tue, 21 May 2019 00:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 45364 seconds by postgrey-1.36 at gabe;
 Tue, 21 May 2019 00:51:55 UTC
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC2C891FA;
 Tue, 21 May 2019 00:51:55 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 457HK35YNjz9s9T;
 Tue, 21 May 2019 10:51:51 +1000 (AEST)
Date: Tue, 21 May 2019 10:51:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20190521105151.51ffa942@canb.auug.org.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1558399913;
 bh=mrT1NhYLTGm56w+283Q/Y/Bq4w6pdDYqc2RQ0JCklGU=;
 h=Date:From:To:Cc:Subject:From;
 b=bScaIWcjdzoAWs5HQl4+uIfctMX2CdWm3FrdE2Qa7dJ5FIWE+06ez5290MiCTI3EA
 b7KPVQADb9D3Ua5D7AmlB5Hy3+u3RfsgoKXaS/zBHO3vESkg2TAe3lZ6Cu7AAxW//S
 uWd9s5j7gg68GRInZLSm4zLWdvIRVX2eMGXG/TM4vLsAawzJWazyiMQZ+8pZTyd0UE
 PNd+rjTIcOZK9tGoTo1JbzPSdX+PvLHbuds72M+55X16EhiyuE4oj9ypK4r5U4lAQp
 VjYkKaBtuzGZ9xcO3kBXAxHjMGqfY2QceFEbhRbufDnqbPcDXI6+jhkMbGCHZVB4Oe
 wkmhByWTJeU6A==
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jyri Sarha <jsarha@ti.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thierry Reding <treding@nvidia.com>
Content-Type: multipart/mixed; boundary="===============1890317147=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1890317147==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/G6L+=B.XzszjFbhvzmL2hFN"; protocol="application/pgp-signature"

--Sig_/G6L+=B.XzszjFbhvzmL2hFN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.txt

between commit:

  8122de54602e ("dt-bindings: Convert vendor prefixes to json-schema")

from Linus' tree and commits:

  b4a2c0055a4f ("dt-bindings: Add vendor prefix for VXT Ltd")
  b1b0d36bdb15 ("dt-bindings: drm/panel: simple: Add binding for TFC S9700R=
TWV43TR-01B")
  fbd8b69ab616 ("dt-bindings: Add vendor prefix for Evervision Electronics")

from the drm-misc tree.

I fixed it up (I deleted the file and added the patch below) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 21 May 2019 10:48:36 +1000
Subject: [PATCH] dt-bindings: fix up for vendor prefixes file conversion

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Docum=
entation/devicetree/bindings/vendor-prefixes.yaml
index 83ca4816a78b..749e3c3843d0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -287,6 +287,8 @@ patternProperties:
     description: Everest Semiconductor Co. Ltd.
   "^everspin,.*":
     description: Everspin Technologies, Inc.
+  "^evervision,.*":
+    description: Evervision Electronics Co. Ltd.
   "^exar,.*":
     description: Exar Corporation
   "^excito,.*":
@@ -851,6 +853,8 @@ patternProperties:
     description: Shenzhen Techstar Electronics Co., Ltd.
   "^terasic,.*":
     description: Terasic Inc.
+  "^tfc,.*":
+    description: Three Five Corp
   "^thine,.*":
     description: THine Electronics, Inc.
   "^ti,.*":
@@ -925,6 +929,8 @@ patternProperties:
     description: Voipac Technologies s.r.o.
   "^vot,.*":
     description: Vision Optical Technology Co., Ltd.
+  "^vxt,.*"
+    description: VXT Ltd
   "^wd,.*":
     description: Western Digital Corp.
   "^wetek,.*":
--=20
2.20.1

--Sig_/G6L+=B.XzszjFbhvzmL2hFN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzjS6cACgkQAVBC80lX
0GxxWAf/U1Bd2c5IorrbBJ3GkYu19Jh6K5qnUcxJYTTKlhemqW0P9KsDtQe2fvsH
EUIsYjeHhlAUsohXmD7LMada75LSwqESAWY2nO9hCyOk4Mf6VU68oiEOGg+PI1s5
Ex8sCpW5SmJj4NUnOBVCFuQLde/8baqC/l7PN6NQ/aetKRSXvw51OK2JzbWrmqFQ
f9/sGKu2HUBbsbkZhbs2FZt+ZfMQlA3RtKn8Kt4R/h0joo1gkVvztAO+PsOYhZL0
HIMpwg4o972YQYhLdUjqX088+mFQ2ck4d9iazQxcycIhVRgQl6EcAuWr3AzA5UcW
Ii58xvlIbU1Uqb2AtEAocPkXyup2lQ==
=C1+W
-----END PGP SIGNATURE-----

--Sig_/G6L+=B.XzszjFbhvzmL2hFN--

--===============1890317147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1890317147==--
