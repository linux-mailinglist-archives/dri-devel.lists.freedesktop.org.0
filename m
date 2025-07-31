Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B926B17259
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 15:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF4310E276;
	Thu, 31 Jul 2025 13:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="PlcXZZgb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D31210E276
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:50:22 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250731135021euoutp029e6e716c3eb55c2132d74f40e4d76108~XWkJnSI1c1416814168euoutp02C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:50:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250731135021euoutp029e6e716c3eb55c2132d74f40e4d76108~XWkJnSI1c1416814168euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1753969821;
 bh=6W87Q1x1CQJtR6NEM1xR9BS/avezudE94uTfUvbF1vw=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=PlcXZZgbl9fevamWWHBq2+To55Ns+nxcG+AFIi5AIo9OeUsQECPbYUzyG1uM1lRC1
 27ezTwycyDDVo35Rq/wb6OYQ0/Eok92SlkHfUdlJxVkD5MOtG1W0rlSrf34Ur3+7zb
 E+VpTV24obp9ZAIhq/d034mwkbg4+VJIDW+qfOkc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250731135020eucas1p1e8f286222a03ec9b63a7409ff66c3238~XWkI6kFKx1671816718eucas1p1R;
 Thu, 31 Jul 2025 13:50:20 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250731135019eusmtip2d9c31dd3d47bb7debe5fd189ea191589~XWkH8uhaX3049130491eusmtip2R;
 Thu, 31 Jul 2025 13:50:19 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 31 Jul 2025 15:50:13 +0200
Subject: [PATCH v9 3/5] dt-bindings: gpu: img,powervr-rogue: Add TH1520 GPU
 compatible
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-apr_14_for_sending-v9-3-c242dc1ffc14@samsung.com>
In-Reply-To: <20250731-apr_14_for_sending-v9-0-c242dc1ffc14@samsung.com>
To: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250731135020eucas1p1e8f286222a03ec9b63a7409ff66c3238
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250731135020eucas1p1e8f286222a03ec9b63a7409ff66c3238
X-EPHeader: CA
X-CMS-RootMailID: 20250731135020eucas1p1e8f286222a03ec9b63a7409ff66c3238
References: <20250731-apr_14_for_sending-v9-0-c242dc1ffc14@samsung.com>
 <CGME20250731135020eucas1p1e8f286222a03ec9b63a7409ff66c3238@eucas1p1.samsung.com>
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

Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 SoC's
specific GPU compatible string.

The thead,th1520-gpu compatible, along with its full chain
img,img-bxm-4-64, and img,img-rogue, is added to the
list of recognized GPU types.

While the BXM-4-64 GPU IP is designed with two distinct power domains,
the TH1520 SoC integrates it with only a single, unified power gate that
is controllable by the kernel.

The binding enforces this with a specific if block for the
thead,th1520-gpu compatible that requires a single power-domains entry
and disallows power-domain-names.

The B-series GPU rule is also updated to include img,img-bxm-4-64
and to explicitly exclude the TH1520.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 29 +++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 24ce46ba0b7015fca799f045ee2ccdd258088068..e47e0f3d1b5078b3050e26f6c1ac175edec528ec 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -21,6 +21,11 @@ properties:
           # work with newer dts.
           - const: img,img-axe
           - const: img,img-rogue
+      - items:
+          - enum:
+              - thead,th1520-gpu
+          - const: img,img-bxm-4-64
+          - const: img,img-rogue
       - items:
           - enum:
               - ti,j721s2-gpu
@@ -96,7 +101,29 @@ allOf:
       properties:
         compatible:
           contains:
-            const: img,img-bxs-4-64
+            const: thead,th1520-gpu
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: The single, unified power domain for the GPU on the
+                TH1520 SoC, integrating all internal IP power domains.
+        power-domain-names: false
+      required:
+        - power-domains
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - img,img-bxm-4-64
+              - img,img-bxs-4-64
+      not:
+        properties:
+          compatible:
+            contains:
+              const: thead,th1520-gpu
     then:
       properties:
         power-domains:

-- 
2.34.1

