Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7ADADE89A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 12:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B61C10E0D4;
	Wed, 18 Jun 2025 10:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="VO0BF2Bn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F78410E7F4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 10:22:32 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250618102231euoutp01e49f3216b050ca24f13a521d97467481~KG-agJfj71794717947euoutp01Q
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 10:22:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250618102231euoutp01e49f3216b050ca24f13a521d97467481~KG-agJfj71794717947euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750242151;
 bh=4SD9BrnW26vlYTv5xxgtljWZoRvQzpufshnL3EiSwm8=;
 h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
 b=VO0BF2BnvZ6uKfjXzvjt5cjA01QcqVHTCEYqmHPHfB1VWytIKBci7OAdR8W3Bqdc2
 ABIowxMHjmZ5o2QHYpE9RE1p3IxhNrHb59C1KTXrSOEXasbuRdKuyCcQ/w0K9jxAvc
 IkQx78D56Fy5IT0U0KOX/3GazEd+7sbW9ilW7K8o=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250618102230eucas1p2573610db9d4a9f3543d0048c30b2df9e~KG-aEi6uN1803418034eucas1p24;
 Wed, 18 Jun 2025 10:22:30 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250618102229eusmtip132bf2e8d5ca6d3dcb5878ee5cd672b4c~KG-ZDGa291490514905eusmtip1I;
 Wed, 18 Jun 2025 10:22:29 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 18 Jun 2025 12:22:11 +0200
Subject: [PATCH v5 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520 GPU
 compatible
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-apr_14_for_sending-v5-5-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michal
 Wilczynski <m.wilczynski@samsung.com>,  Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,  Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250618102230eucas1p2573610db9d4a9f3543d0048c30b2df9e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618102230eucas1p2573610db9d4a9f3543d0048c30b2df9e
X-EPHeader: CA
X-CMS-RootMailID: 20250618102230eucas1p2573610db9d4a9f3543d0048c30b2df9e
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <CGME20250618102230eucas1p2573610db9d4a9f3543d0048c30b2df9e@eucas1p2.samsung.com>
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

The power-domains property requirement for img,img-bxm-4-64 is also
ensured by adding it to the relevant allOf condition.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..9b241a0c1f5941dc58a1e23970f6d3773d427c22 100644
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
@@ -93,7 +98,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: img,img-axe-1-16m
+            enum:
+              - img,img-axe-1-16m
+              - img,img-bxm-4-64
     then:
       properties:
         power-domains:

-- 
2.34.1

