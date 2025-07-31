Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E820B17262
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 15:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4A710E797;
	Thu, 31 Jul 2025 13:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="CQT61DjK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0507810E78A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:50:21 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250731135019euoutp022e2dca22f7b7e82474061a783218ef11~XWkIWXauX1417014170euoutp02M
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:50:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250731135019euoutp022e2dca22f7b7e82474061a783218ef11~XWkIWXauX1417014170euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1753969819;
 bh=GqjP+sqWnHbA9FEjGQX5W1M8XprOwuwRbOKks19Q5zo=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=CQT61DjKDH9WRSh8myB97dE1/g8DAVsU9D9+ai5yjHRtsAdr/rb+D+ifmps7fwzuy
 h2Sms18vutJSLZU4zTZaibzZonCKchHN9fa647kzAaPoR4DJhLhXBbXEib6jvhX5k9
 f5YnfLF96qpbX3Fx9OiHw1bE1IDe0ikXMrCzT6DE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250731135019eucas1p1239902cf5a5a8fa40ea35722e6feb965~XWkH4ziN20233102331eucas1p1O;
 Thu, 31 Jul 2025 13:50:19 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250731135018eusmtip23c074c65c850d0ecb3aa1102bd2a0903~XWkG7Qs0A2644626446eusmtip2L;
 Thu, 31 Jul 2025 13:50:18 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 31 Jul 2025 15:50:12 +0200
Subject: [PATCH v9 2/5] dt-bindings: gpu: img,powervr-rogue: Define power
 domains per variant
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-apr_14_for_sending-v9-2-c242dc1ffc14@samsung.com>
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
X-CMS-MailID: 20250731135019eucas1p1239902cf5a5a8fa40ea35722e6feb965
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250731135019eucas1p1239902cf5a5a8fa40ea35722e6feb965
X-EPHeader: CA
X-CMS-RootMailID: 20250731135019eucas1p1239902cf5a5a8fa40ea35722e6feb965
References: <20250731-apr_14_for_sending-v9-0-c242dc1ffc14@samsung.com>
 <CGME20250731135019eucas1p1239902cf5a5a8fa40ea35722e6feb965@eucas1p1.samsung.com>
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

Rework the PowerVR Rogue GPU binding to use an explicit, per variant
style for defining power domain properties.

The generic `if` block for `img,img-rogue`, is removed. It is replaced
with self-contained `if/then` blocks for each existing GPU variant. Each
block now explicitly defines power domain properties and requirements
for that specific variant, making the rules easier to read and
maintain.

This addresses feedback from the maintainer to explicitly list items
for each variant [1].

Link: https://lore.kernel.org/all/4d79c8dd-c5fb-442c-ac65-37e7176b0cdd@linaro.org/ [1]

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 36 ++++++++++------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..24ce46ba0b7015fca799f045ee2ccdd258088068 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -57,10 +57,8 @@ properties:
     maxItems: 2
 
   power-domain-names:
-    items:
-      - const: a
-      - const: b
     minItems: 1
+    maxItems: 2
 
   dma-coherent: true
 
@@ -77,18 +75,6 @@ required:
 additionalProperties: false
 
 allOf:
-  # Constraints added alongside the new compatible strings that would otherwise
-  # create an ABI break.
-  - if:
-      properties:
-        compatible:
-          contains:
-            const: img,img-rogue
-    then:
-      required:
-        - power-domains
-        - power-domain-names
-
   - if:
       properties:
         compatible:
@@ -97,9 +83,14 @@ allOf:
     then:
       properties:
         power-domains:
-          maxItems: 1
+          items:
+            - description: Power domain A
         power-domain-names:
-          maxItems: 1
+          items:
+            - const: a
+      required:
+        - power-domains
+        - power-domain-names
 
   - if:
       properties:
@@ -109,9 +100,16 @@ allOf:
     then:
       properties:
         power-domains:
-          minItems: 2
+          items:
+            - description: Power domain A
+            - description: Power domain B
         power-domain-names:
-          minItems: 2
+          items:
+            - const: a
+            - const: b
+      required:
+        - power-domains
+        - power-domain-names
 
   - if:
       properties:

-- 
2.34.1

