Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC9BB3090B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 00:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2991610EA33;
	Thu, 21 Aug 2025 22:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="hAbhCwgF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B98610EA29
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 22:20:24 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250821222023euoutp0291abe98c619b32cf173aad93be61e691~d6EdlSExP2845828458euoutp02L
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 22:20:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250821222023euoutp0291abe98c619b32cf173aad93be61e691~d6EdlSExP2845828458euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1755814823;
 bh=SoNkZnB/ZDH4173ojh3m2tOndFgBpgzx3po9ZkmxTE8=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=hAbhCwgFIrltaMqBAPehYQys9VjBS97uOB5k5fJWh/NBrCaPRMqspRWb+4CeQeqoy
 mXH+mx6FgVmTosN6cWIjoDLRa3qSwzqRPfUKuX+06oHBxNJclDu/VBfFsJVeXPhGm+
 jvaQGM40zWkEPtiQ1T4L67t4hFlS/2R7SgYWdBuc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250821222022eucas1p16a85eedbb11598fb0d9403fc41e24da9~d6EcoxKFM2014520145eucas1p1M;
 Thu, 21 Aug 2025 22:20:22 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250821222020eusmtip119b9c25fcb841bb6cbacefcd2f0fa7e3~d6EboXLIj1697316973eusmtip1V;
 Thu, 21 Aug 2025 22:20:20 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 22 Aug 2025 00:20:16 +0200
Subject: [PATCH v13 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520 GPU
 support
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-apr_14_for_sending-v13-2-af656f7cc6c3@samsung.com>
In-Reply-To: <20250822-apr_14_for_sending-v13-0-af656f7cc6c3@samsung.com>
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
 dri-devel@lists.freedesktop.org,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250821222022eucas1p16a85eedbb11598fb0d9403fc41e24da9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250821222022eucas1p16a85eedbb11598fb0d9403fc41e24da9
X-EPHeader: CA
X-CMS-RootMailID: 20250821222022eucas1p16a85eedbb11598fb0d9403fc41e24da9
References: <20250822-apr_14_for_sending-v13-0-af656f7cc6c3@samsung.com>
 <CGME20250821222022eucas1p16a85eedbb11598fb0d9403fc41e24da9@eucas1p1.samsung.com>
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
style for defining power domain properties and add support for the
T-HEAD TH1520 SoC's GPU.

To improve clarity and precision, the binding is refactored so that
power domain items are listed explicitly for each variant [1]. The
previous method relied on an implicit, positional mapping between the
`power-domains` and `power-domain-names` properties. This change
replaces the generic rules with self contained if/then blocks for each
GPU variant, making the relationship between power domains and their
names explicit and unambiguous.

The generic if block for img,img-rogue, which previously required
power-domains and power-domain-names for all variants, is removed.
Instead, each specific GPU variant now defines its own power domain
requirements within a self-contained if/then block, making the schema
more explicit.

This new structure is then used to add support for the
`thead,th1520-gpu`. While its BXM-4-64 IP has two conceptual power
domains, the TH1520 SoC integrates them behind a single power gate. The
new binding models this with a specific rule that enforces a single
`power-domains` entry and disallows the `power-domain-names` property.

Link: https://lore.kernel.org/all/4d79c8dd-c5fb-442c-ac65-37e7176b0cdd@linaro.org/ [1]

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Matt Coster <matt.coster@imgtec.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 37 +++++++++++++++++-----
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..c87d7bece0ecd6331fc7d1a479bbdaf68bac6e6d 100644
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
@@ -77,14 +82,18 @@ required:
 additionalProperties: false
 
 allOf:
-  # Constraints added alongside the new compatible strings that would otherwise
-  # create an ABI break.
   - if:
       properties:
         compatible:
           contains:
-            const: img,img-rogue
+            const: img,img-axe-1-16m
     then:
+      properties:
+        power-domains:
+          items:
+            - description: Power domain A
+        power-domain-names:
+          maxItems: 1
       required:
         - power-domains
         - power-domain-names
@@ -93,13 +102,20 @@ allOf:
       properties:
         compatible:
           contains:
-            const: img,img-axe-1-16m
+            const: thead,th1520-gpu
     then:
       properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
         power-domains:
-          maxItems: 1
-        power-domain-names:
-          maxItems: 1
+          items:
+            - description: The single, unified power domain for the GPU on the
+                TH1520 SoC, integrating all internal IP power domains.
+        power-domain-names: false
+      required:
+        - power-domains
 
   - if:
       properties:
@@ -109,9 +125,14 @@ allOf:
     then:
       properties:
         power-domains:
-          minItems: 2
+          items:
+            - description: Power domain A
+            - description: Power domain B
         power-domain-names:
           minItems: 2
+      required:
+        - power-domains
+        - power-domain-names
 
   - if:
       properties:

-- 
2.34.1

