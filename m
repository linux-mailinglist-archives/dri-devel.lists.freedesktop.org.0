Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF1DBFCA73
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4949D10E174;
	Wed, 22 Oct 2025 14:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MBJpPxSV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F71410E174
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:49:40 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47109187c32so32681705e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761144579; x=1761749379; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OeVW7KIs34xjHHALn+sD+JnpOfHDngShiO+k3xh4Ufc=;
 b=MBJpPxSVP/BqQCYaB4FtI66Z5VZspnDu3kxUUvydPO35n9BiLYouF93OZm3ZqIf8Xv
 0ELpdmpr795bnX1H2ILZ/g72QkRZefMdVm3DpcyNs1qvtrdRo3dj/+06krZsz1dFW6yF
 t9OqPk4iyXV/bWNHYPiDdopqwbO+//Ecn1rad2AAEW8rOpadVWzCjdHjoTjnyZhJh3gY
 NYsCInE+kyMjo05Z4CXefIs1IU6oiTCCXXmzA8afGhUaiVJeyk8tfGTNG0/Bn9bev+dK
 MFsX/xMBQh83Nyk4J5irjwT715j9pMqoW9rlhJDOeIDsAgAcRBHKmHrOI33vMXnTFZBj
 X4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761144579; x=1761749379;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OeVW7KIs34xjHHALn+sD+JnpOfHDngShiO+k3xh4Ufc=;
 b=WAoR6W8NKYioQrZy7KwOioSrfvVIPDQknWXSXgEVUa3+Wb/2WBsvOZO0jr49of28a/
 pB7znlkK59NxLLPg4WGftjUxRg8Bw0yUv3b0E4JbEQwPOcIvukR59K3/kDlRmVBcpZ83
 BQHGUznzJp37bFKmMlX+ek7xGU1HclYoN05AoWVveE1dq0mT22oFQhWpgCq6a9Ipm+my
 4NRAKC3Kf5gD8evNZLaUlfYT+NXoZ8HCKrFxpyF7RGgSJgdDN544aCGPvcnKFKGy1QDZ
 KOKCtyFWu3Syer+w/QjxwuyB5sYxxXgmtbqPyfXo0Vb7TX8Gk3z3RN5YAKYAcGd61YfM
 XdAg==
X-Gm-Message-State: AOJu0YyQBk2UkBnG+UptcDvi0dDvQXQ7kQijMitjHJru7zQnvmie4z2v
 jIJS4/MzQnktVNu4qxtf3Tq0yUfBGPnAOqAGWEr0WA3XL9vmGU08levV
X-Gm-Gg: ASbGncuYzM5tpAoGDt4qMfCwOivhaH3PxsR6kZL2AInyis7HADiHQY8fSw34DJuJ4A2
 eWW/oO5SmjW3Q9T4dC/cjJ33o6Bkpf8sayGv2Ff76t62Cy9cenvOqvflipAIEPDFSnMO0UgOziS
 1N0CNSQKLu645nhj4hauW/m2LUmmoHgzaNnMtg12N90W/s+fplnJ70CJ6rXFYH6eFYsPPQ33jVw
 Y9B3VGRwkO4YW9LXBOHDt0tOnxelmOzxF+y0y7StU8e5SYiZQAGuOKPIRe/mYnOQnZ1HIi45GTA
 hwb7ULO4WbvzwRoaX+xcKjGZUlMW/CYfqejMYtdhhQI+7/SLx3rq5we8NRtoM9aLJhOKFKbpNDo
 /FTaf6/O56bQxQsBV7dUdEvpEHAfydGJcwmUWk/dIrRMMJGFUCSQprOsAtmnb98aSOy8PaQzuPM
 tisg==
X-Google-Smtp-Source: AGHT+IHr6Ob93t9v00uJwuP7yAAMfu4kGsf18j4jl3QNK0VUxssU6icvlb5KeKOe4fTOZz3h10i/+g==
X-Received: by 2002:a05:600c:3e0b:b0:459:db7b:988e with SMTP id
 5b1f17b1804b1-471178a3faamr101708965e9.13.1761144578447; 
 Wed, 22 Oct 2025 07:49:38 -0700 (PDT)
Received: from xeon.. ([188.163.112.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c427f77bsm49956525e9.3.2025.10.22.07.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 07:49:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v5 21/23] dt-bindings: display: tegra: document Tegra20 and
 Tegra30 CSI
Date: Wed, 22 Oct 2025 17:49:28 +0300
Message-ID: <20251022144930.73272-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document CSI HW block found in Tegra20 and Tegra30 SoC.

The #nvidia,mipi-calibrate-cells is not an introduction of property, such
property already exists in nvidia,tegra114-mipi.yaml and is used in
multiple device trees. In case of Tegra30 and Tegra20 CSI block combines
mipi calibration function and CSI function, in Tegra114+ mipi calibration
got a dedicated hardware block which is already supported. This property
here is used to align with mipi-calibration logic used by Tegra114+.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
new file mode 100644
index 000000000000..a1aea9590769
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 CSI controller
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra20-csi
+      - nvidia,tegra30-csi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: module clock
+      - description: PAD A clock
+      - description: PAD B clock
+
+  clock-names:
+    items:
+      - const: csi
+      - const: csia-pad
+      - const: csib-pad
+
+  avdd-dsi-csi-supply:
+    description: DSI/CSI power supply. Must supply 1.2 V.
+
+  power-domains:
+    maxItems: 1
+
+  "#nvidia,mipi-calibrate-cells":
+    description:
+      The number of cells in a MIPI calibration specifier. Should be 1.
+      The single cell specifies an id of the pad that need to be
+      calibrated for a given device. Valid pad ids for receiver would be
+      0 for CSI-A; 1 for CSI-B; 2 for DSI-A and 3 for DSI-B.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^channel@[0-1]$":
+    type: object
+    description: channel 0 represents CSI-A and 1 represents CSI-B
+    additionalProperties: false
+
+    properties:
+      reg:
+        maximum: 1
+
+      nvidia,mipi-calibrate:
+        description: Should contain a phandle and a specifier specifying
+          which pad is used by this CSI channel and needs to be calibrated.
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: port receiving the video stream from the sensor
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: port sending the video stream to the VI
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+      - port@0
+      - port@1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-csi
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra30-csi
+    then:
+      properties:
+        clocks:
+          minItems: 3
+
+        clock-names:
+          minItems: 3
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+
+# see nvidia,tegra20-vi.yaml for an example
-- 
2.48.1

