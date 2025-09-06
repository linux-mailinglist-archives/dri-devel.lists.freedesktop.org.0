Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21120B46F5A
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C1B10E38E;
	Sat,  6 Sep 2025 13:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="julrTInV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5226610E383
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:37 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-55f6507bd53so3063395e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166876; x=1757771676; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qL0JUmWTkyFBMGydq+NFB1T+OALFnyaDwilHrorgTbk=;
 b=julrTInVgzKtBbraxhAspRl2o9itpJks4ZEp9WmDGjNZvt9oebEarfOMZDY8gJYN3J
 Uyecs9BQJdHp6yz0CAFWGWZmNE0q2O8V2ERLkhZRxwtC9NG1j6w+6E+Qzs4mVmlFOfla
 krbj3uECxZBMM+rZPX09GSMcvimCgMBrTkFYIzS+1DqNBUndnouZDukVZZS9RWW29fb3
 EuoWfoUKGs8wtT5VBhAPfxZHi9TMPuKue92a5BbMLPGEiyR7ppw64iRBQqWPzDS8KzKs
 /kHKPesy1rsYwH4jMXfanpsKwnyHcpikvhHlZVSgIi9D5qEAgbcXGC6pW7O0YM2tUs0R
 pSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166876; x=1757771676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qL0JUmWTkyFBMGydq+NFB1T+OALFnyaDwilHrorgTbk=;
 b=dAMceCubky86fOq0kUSrT/rYY0VZGSNiaZx8GuWKLOt4TRm9RIS2LRm6gfz5HHcKiz
 kf4JCp6ZwiaPVnnm/lFdUEuiSriqzYHGBP7GDF6DFADL9jh5I5RDok6C7eBinK9QzoT+
 SrIEWsKkH107HWOWCj8lxCeAAC7JNPwBsgzVPxiYZC5A8lFshxZCG4eizGT7fC8i7zAe
 NyEC//xSHyvFlb+cdWXarUUCsdBUk0pIMutltFl4o5hz74sY7vF9xFjJmd6TnvGMonzL
 ehkvD/lvs4Aw2I15yT/sDmOf3mCKpQe4h/lhOSA+A4jPo3EpwKvmnz81VDz90856D2y6
 Rl1A==
X-Gm-Message-State: AOJu0YwyCsnU0lnO49ng4dyrg/gc3dQ5wEMDdkablq6A9GXKchf28pXg
 fzugqEH5r56JLniPFSqKxDmtDFarpGLgJSVvE7GBEv6ANpecH8FAT+rJ
X-Gm-Gg: ASbGncuEI5J5tE78vXd6WN3qn0Sp5rv0Amr8DJ5COCWV5LBosROUzVbGS+plUHpNO+o
 HhTL7ZopGyM2MUI6wgkWZ0GpbS2rhdtmm4OYXxX/8kdvB/6usZSIm8vZisjorARmyufp2luyjbn
 4nAhZ9OvrfNK6a1Xynii3btmnIcM5d0bVVZa60jBkWxKa3ehl9iJov5pV0WFp3tZccL+aglANhw
 Ku1Jvl5Vt9HhwwrNsYP1Z25VssNLKpHR8R+joCRWkgzBLCnbQoiaUd0qKBfsfLLucKcMERnKQKa
 vQ/A6ivGq3jkvAnl1FvDjWg/qBfSr3sZIrP4QK8TWj9K0iewsJAo/USW/Fh7FEQpOKmaYU+NO6D
 faU5G4X+QysqREJzZpRTRfExI
X-Google-Smtp-Source: AGHT+IEsBVYNgu9fx/P23umpxwqcCjAFXjv8bzOpOxv6Igr/LBYo56Zn4CLcBlm7uEi8JgMOACJ+Ig==
X-Received: by 2002:a05:6512:6404:b0:55f:6902:c9f0 with SMTP id
 2adb3069b0e04-5626310bdccmr579165e87.43.1757166875448; 
 Sat, 06 Sep 2025 06:54:35 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v2 21/23] dt-bindings: display: tegra: document Tegra20 and
 Tegra30 CSI
Date: Sat,  6 Sep 2025 16:53:42 +0300
Message-ID: <20250906135345.241229-22-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-csi.yaml     | 104 ++++++++++++++++
 .../display/tegra/nvidia,tegra30-csi.yaml     | 115 ++++++++++++++++++
 2 files changed, 219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
new file mode 100644
index 000000000000..1a2858a5893c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -0,0 +1,104 @@
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
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-dsi-csi-supply:
+    description: DSI/CSI power supply. Must supply 1.2 V.
+
+  power-domains:
+    maxItems: 1
+
+  "#nvidia,mipi-calibrate-cells":
+    description: The number of cells in a MIPI calibration specifier.
+      Should be 1. The single cell specifies an id of the pads that
+      need to be calibrated for a given device.
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
+        maxItems: 1
+
+      nvidia,mipi-calibrate:
+        description: Should contain a phandle and a specifier specifying
+          which pads are used by this DSI output and need to be
+          calibrated. 0 is for CSI-A, 1 is for CSI-B, 2 is for DSI.
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
+            properties:
+              data-lanes: true
+
+            required:
+              - data-lanes
+
+        required:
+          - endpoint
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
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml
new file mode 100644
index 000000000000..ea5ebd2f3c65
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-csi.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra30-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra30 CSI controller
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra30-csi
+
+  reg:
+    maxItems: 1
+
+  clocks:
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
+    description: The number of cells in a MIPI calibration specifier.
+      Should be 1. The single cell specifies an id of the pads that
+      need to be calibrated for a given device.
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
+        maxItems: 1
+
+      nvidia,mipi-calibrate:
+        description: Should contain a phandle and a specifier specifying
+          which pads are used by this DSI output and need to be
+          calibrated. 0 is for CSI-A, 1 is for CSI-B, 2 is for DSI-A and
+          3 is for DSI-B
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
+            properties:
+              data-lanes: true
+
+            required:
+              - data-lanes
+
+        required:
+          - endpoint
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
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+
+# see nvidia,tegra20-vi.yaml for an example
-- 
2.48.1

