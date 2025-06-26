Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D649CAE9A1C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 11:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CFD10E888;
	Thu, 26 Jun 2025 09:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="cpcdJzxk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E06910E842
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 09:34:02 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250626093358euoutp023a9a990c32f89b2e40f507ab0a223766~MjfUPv-nk0334803348euoutp02y
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 09:33:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250626093358euoutp023a9a990c32f89b2e40f507ab0a223766~MjfUPv-nk0334803348euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750930438;
 bh=0cxYq6ecVQYEouUOPludphXkFkj0eDSu98gp3EjBQ5g=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=cpcdJzxkzYfTBJ8g3eTivV+VFcqLIo4A5TGF44U7he6ORcviZKuvIOmmfQ8fcwJ3a
 7JfYJ49Ix94GvCThF5LjCCefm5AUu2ouBlO1tTFhfDvCDOQ9aMvL2VxWfbim5ZUYJH
 f/flD2h9GknJWjEqCoYkM0Xz1sNQB8cMsKidX5sM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250626093358eucas1p1e5d763dc86dccb0ed9fa725182ea59e6~MjfTpEyTP0080700807eucas1p1T;
 Thu, 26 Jun 2025 09:33:58 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250626093356eusmtip219bc257793110e2073fe16714d5ec177~MjfSjBKcC1062510625eusmtip2O;
 Thu, 26 Jun 2025 09:33:56 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 26 Jun 2025 11:33:47 +0200
Subject: [PATCH v7 2/5] dt-bindings: gpu: img,powervr-rogue: Add TH1520 GPU
 compatible
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-apr_14_for_sending-v7-2-6593722e0217@samsung.com>
In-Reply-To: <20250626-apr_14_for_sending-v7-0-6593722e0217@samsung.com>
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
 <krzysztof.kozlowski@linaro.org>,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250626093358eucas1p1e5d763dc86dccb0ed9fa725182ea59e6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250626093358eucas1p1e5d763dc86dccb0ed9fa725182ea59e6
X-EPHeader: CA
X-CMS-RootMailID: 20250626093358eucas1p1e5d763dc86dccb0ed9fa725182ea59e6
References: <20250626-apr_14_for_sending-v7-0-6593722e0217@samsung.com>
 <CGME20250626093358eucas1p1e5d763dc86dccb0ed9fa725182ea59e6@eucas1p1.samsung.com>
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

To model this reality correctly while keeping the binding accurate for
other devices, add conditional constraints to the `allOf` section:
 - If the compatible is "thead,th1520-gpu", enforce a maximum of one
   power domain.
 - For other "img,img-bxm-4-64" and "img,img-bxs-4-64" devices,
   enforce a minimum of two power domains, using a 'not:' clause to
   exclude the TH1520.

This makes the binding strict and correct for both the specific TH1520
implementation and for other SoCs that use the B-series Rogue GPUs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..263c40c8438e26efcf1613b5e2af54f2d6599871 100644
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
@@ -89,6 +94,18 @@ allOf:
         - power-domains
         - power-domain-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: thead,th1520-gpu
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+        power-domain-names:
+          maxItems: 1
+
   - if:
       properties:
         compatible:
@@ -105,7 +122,14 @@ allOf:
       properties:
         compatible:
           contains:
-            const: img,img-bxs-4-64
+            enum:
+              - img,img-bxs-4-64
+              - img,img-bxm-4-64
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

