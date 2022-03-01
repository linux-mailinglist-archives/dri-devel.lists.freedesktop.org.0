Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A337D4C804D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 02:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFF710E1F9;
	Tue,  1 Mar 2022 01:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF5A10E1F9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 01:20:32 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K6zvY1KjMz4xmt;
 Tue,  1 Mar 2022 12:20:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1646097628;
 bh=3zkLK1DB9BDVoMqb7VGAMm8+RO0CcJeGkkYb0Ikb7kk=;
 h=Date:From:To:Cc:Subject:From;
 b=s77EHbKhJfzKsstKlwIv2fOafWWWngyVWHgRG6i6WkG7leBBahasA2udb8fuoLOUU
 U+YikW/M55pbD+xNrb4UR3hyZA9B+aWe4APiA6X3Amzw/py48Nhx6IbAmOiJ9TMe53
 L0mLOvi/UCxa667hA99229cHle4fw/Gv9X+pfKSuSbQ8bGNgd92tOzLwkhj16tfcDx
 Z8wJoruJCiqJsD/WTxYAn+xURudLpC8MdgDgv1zKXkvhkh7+qR6ISuf5O1snEOIZXC
 ipTzDp1Lj7PYxiMAFjSL4MKy9n3rhgWzlo1uysDOZI14ZSIrn/f86Y01EFh8CF8+oF
 i50KwzwO6hF6A==
Date: Tue, 1 Mar 2022 12:20:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: linux-next: manual merge of the drm tree with the v4l-dvb tree
Message-ID: <20220301122024.47cb2dcf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/svc=vizdYk0mCEN9obg/1F+";
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/svc=vizdYk0mCEN9obg/1F+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt

between commit:

  6d0990e6e844 ("media: dt-binding: mediatek: Get rid of mediatek,larb for =
multimedia HW")

from the v4l-dvb tree and commit:

  4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to =
individual yaml")

from the drm tree.

I fixed it up (I deleted the file and added the following merge fix patch)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 1 Mar 2022 12:17:12 +1100
Subject: [PATCH] fix up for "media: dt-binding: mediatek: Get rid of
 mediatek,larb for multimedia HW"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml     | 10 ----------
 .../bindings/display/mediatek/mediatek,ovl.yaml        | 10 ----------
 .../bindings/display/mediatek/mediatek,rdma.yaml       | 10 ----------
 .../bindings/display/mediatek/mediatek,wdma.yaml       | 10 ----------
 4 files changed, 40 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ov=
l-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl=
-2l.yaml
index 611a2dbdefa4..e3cef99d0f98 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.ya=
ml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.ya=
ml
@@ -46,15 +46,6 @@ properties:
       This property should point to the respective IOMMU block with master=
 port as argument,
       see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for =
details.
=20
-  mediatek,larb:
-    description:
-      This property should contain a phandle pointing to the local arbiter=
 devices defined in
-      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-la=
rb.yaml.
-      It must sort according to the local arbiter index, like larb0, larb1=
, larb2...
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    minItems: 1
-    maxItems: 32
-
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce wi=
th
       4 arguments defined in this property, such as phandle of gce, subsys=
 id,
@@ -83,6 +74,5 @@ examples:
         power-domains =3D <&spm MT8183_POWER_DOMAIN_DISP>;
         clocks =3D <&mmsys CLK_MM_DISP_OVL0_2L>;
         iommus =3D <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
-        mediatek,larb =3D <&larb0>;
         mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ov=
l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.ya=
ml
index e71f79bc2dee..93d5c68a2dbd 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -61,15 +61,6 @@ properties:
       This property should point to the respective IOMMU block with master=
 port as argument,
       see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for =
details.
=20
-  mediatek,larb:
-    description:
-      This property should contain a phandle pointing to the local arbiter=
 devices defined in
-      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-la=
rb.yaml.
-      It must sort according to the local arbiter index, like larb0, larb1=
, larb2...
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    minItems: 1
-    maxItems: 32
-
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce wi=
th
       4 arguments defined in this property, such as phandle of gce, subsys=
 id,
@@ -98,6 +89,5 @@ examples:
         power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
         clocks =3D <&mmsys CLK_MM_DISP_OVL0>;
         iommus =3D <&iommu M4U_PORT_DISP_OVL0>;
-        mediatek,larb =3D <&larb0>;
         mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rd=
ma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.=
yaml
index 8ef821641672..b56e22fbcd52 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -63,15 +63,6 @@ properties:
       This property should point to the respective IOMMU block with master=
 port as argument,
       see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for =
details.
=20
-  mediatek,larb:
-    description:
-      This property should contain a phandle pointing to the local arbiter=
 devices defined in
-      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-la=
rb.yaml.
-      It must sort according to the local arbiter index, like larb0, larb1=
, larb2...
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    minItems: 1
-    maxItems: 32
-
   mediatek,rdma-fifo-size:
     description:
       rdma fifo size may be different even in same SOC, add this property =
to the
@@ -111,7 +102,6 @@ examples:
         power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
         clocks =3D <&mmsys CLK_MM_DISP_RDMA0>;
         iommus =3D <&iommu M4U_PORT_DISP_RDMA0>;
-        mediatek,larb =3D <&larb0>;
         mediatek,rdma-fifosize =3D <8192>;
         mediatek,gce-client-reg =3D <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
     };
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wd=
ma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.=
yaml
index aaf5649b6413..f9f00a518edf 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -44,15 +44,6 @@ properties:
       This property should point to the respective IOMMU block with master=
 port as argument,
       see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for =
details.
=20
-  mediatek,larb:
-    description:
-      This property should contain a phandle pointing to the local arbiter=
 devices defined in
-      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-la=
rb.yaml.
-      It must sort according to the local arbiter index, like larb0, larb1=
, larb2...
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    minItems: 1
-    maxItems: 32
-
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce wi=
th
       4 arguments defined in this property, such as phandle of gce, subsys=
 id,
@@ -81,6 +72,5 @@ examples:
         power-domains =3D <&scpsys MT8173_POWER_DOMAIN_MM>;
         clocks =3D <&mmsys CLK_MM_DISP_WDMA0>;
         iommus =3D <&iommu M4U_PORT_DISP_WDMA0>;
-        mediatek,larb =3D <&larb0>;
         mediatek,gce-client-reg =3D <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
     };
--=20
2.34.1

--=20
Cheers,
Stephen Rothwell

--Sig_/svc=vizdYk0mCEN9obg/1F+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIddNgACgkQAVBC80lX
0Gwiwwf8DpqdHFaP3vENUgrQThEzwRgxUcRkx0dsVFNRK5UBHxsVfLd/lvEJelUW
xi31Q7vT+tJNI6mN7Ax46IOdxY8VPPwEV8WmVwws0daDJNHuqOkc1cjqVxJyvITG
iuBgFAx9huilX7S2FuW/vOrfp5QJGYnrKuWG2lPd3uGGyrTCBAMkjxIowiJsqvXd
cYLm0iJJLJNlhKqMDNqTWRrYefAx7+lEFNkbbJDoKVjy4cHJ6W6UdCpVZdkQEbzq
p9mIw571yJbCl6xQ1zM2ybOauYZQIaJpxz/9z/IsyXr0Qi+XL8PrArw0NXecsvGh
j2oNEKo5TGwfasy4eCNwpO8xie3bJg==
=dNK2
-----END PGP SIGNATURE-----

--Sig_/svc=vizdYk0mCEN9obg/1F+--
