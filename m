Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A3E6D27B8
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 20:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3A410E26B;
	Fri, 31 Mar 2023 18:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B6F10E3C4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 18:22:25 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id bx42so1770882oib.6
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 11:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680286944;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f9UhKBRFdSgZY4m5Cd2DHq4T/UdvqVuy09n+C4WToZs=;
 b=ExdKw6vuZjME2AFpVrjUafaXK6XWZTs9Z3ZSnY8xjk4YcbJ4QFFjkCq8IJXC4qDFa9
 JESRlbPQEzWtDItuxOJroTLDtDTt+S8UbPpqDGFnhNfmECuSNV3Fpz3InTkWGeP3GJxa
 1Y/7bQm7CHQUkeIja+c0ofSazAap9kQkgQq6osxb9a9JEqIN0N40/tFumKLXzvRS+v0D
 CMVqQZWkXviH4u54Lqa+Gt7bypXyqy/KBkukuYxOq0/0rDUkYx/pRSQwVUDoxf12q42g
 jDXZDTB6GUEy/Al4VGFdY51PjI0ol4taHvrYySX+vuQI4cUj3uDJepidGqMwT76RhmWs
 hFiA==
X-Gm-Message-State: AO0yUKXX/6u0lO7Ua8QmHECIVyGveZxc4zi7sLYuhOGGWku94Ulo6l2t
 07KmDLsATOlYmiVox3Jr8A==
X-Google-Smtp-Source: AK7set/MjJxdPOwhbnT0as9wkVA7qitTRNGhdShXi4Ohvymt2oXKN1QtMgqIHyEoftvZkk8LVBvXkQ==
X-Received: by 2002:a05:6808:ab8:b0:387:cfb5:98f1 with SMTP id
 r24-20020a0568080ab800b00387cfb598f1mr11176985oij.27.1680286944194; 
 Fri, 31 Mar 2023 11:22:24 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q189-20020acad9c6000000b0038756901d1esm1243952oig.35.2023.03.31.11.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 11:22:23 -0700 (PDT)
Received: (nullmailer pid 1901110 invoked by uid 1000);
 Fri, 31 Mar 2023 18:22:23 -0000
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] dt-bindings: arm: nvidia: Drop unneeded quotes
Date: Fri, 31 Mar 2023 13:21:59 -0500
Message-Id: <20230331182159.1900674-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml   | 6 +++---
 .../bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml   | 6 +++---
 .../bindings/arm/tegra/nvidia,tegra194-axi2apb.yaml       | 4 ++--
 .../bindings/arm/tegra/nvidia,tegra194-cbb.yaml           | 8 ++++----
 .../bindings/arm/tegra/nvidia,tegra234-cbb.yaml           | 4 ++--
 .../bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml        | 4 ++--
 .../bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml        | 4 ++--
 .../bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml        | 4 ++--
 .../bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml        | 4 ++--
 9 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml b/Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml
index b6f57d79a753..84dc6b7512af 100644
--- a/Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml
+++ b/Documentation/devicetree/bindings/arm/nvidia,tegra194-ccplex.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/nvidia,tegra194-ccplex.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/nvidia,tegra194-ccplex.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NVIDIA Tegra194 CPU Complex
 
@@ -25,7 +25,7 @@ properties:
       - nvidia,tegra194-ccplex
 
   nvidia,bpmp:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: |
       Specifies the bpmp node that needs to be queried to get
       operating point data for all CPUs.
diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml
index 6089a96eae4f..36dbd0838f2d 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/tegra/nvidia,tegra-ccplex-cluster.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra-ccplex-cluster.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NVIDIA Tegra CPU COMPLEX CLUSTER area
 
@@ -29,7 +29,7 @@ properties:
     maxItems: 1
 
   nvidia,bpmp:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: |
       Specifies the BPMP node that needs to be queried to get
       operating point data for all CPUs.
diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-axi2apb.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-axi2apb.yaml
index 788a13f8aa93..5e0f1dc542b0 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-axi2apb.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-axi2apb.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/tegra/nvidia,tegra194-axi2apb.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra194-axi2apb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NVIDIA Tegra194 AXI2APB bridge
 
diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-cbb.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-cbb.yaml
index dd3a4770c6a1..d9c54c32c6b9 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-cbb.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-cbb.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/tegra/nvidia,tegra194-cbb.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra194-cbb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NVIDIA Tegra194 CBB 1.0
 
@@ -64,13 +64,13 @@ properties:
       - description: secure interrupt
 
   nvidia,axi2apb:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
+    $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Specifies the node having all axi2apb bridges which need to be checked
       for any error logged in their status register.
 
   nvidia,apbmisc:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
+    $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Specifies the apbmisc node which need to be used for reading the ERD
       register.
diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
index 44184ee01449..fcdf03131323 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra234-cbb.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/tegra/nvidia,tegra234-cbb.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra234-cbb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NVIDIA Tegra CBB 2.0
 
diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
index ed9554c837ef..ba4c6473ff92 100644
--- a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NVIDIA Tegra NVDEC
 
diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
index 8199e5fa8211..c23dae713eb8 100644
--- a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvenc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvenc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NVIDIA Tegra NVENC
 
diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml
index 895fb346ac72..99a33a5eac3f 100644
--- a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvjpg.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvjpg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NVIDIA Tegra NVJPG
 
diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
index 4bdc19a2bccf..0b7561c8b9bb 100644
--- a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/gpu/host1x/nvidia,tegra234-nvdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NVIDIA Tegra234 NVDEC
 
-- 
2.39.2

