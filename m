Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC97BA0353
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F250310E978;
	Thu, 25 Sep 2025 15:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jT2TfzIq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4498010E967
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:17:48 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5797c8612b4so1479310e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758813467; x=1759418267; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UluGas5X2LWmQB7iVdb5z5eOB2ccnl2sNvVSp9MKYIw=;
 b=jT2TfzIqbhIEAi1LexJ9V6toLkHYfDDKF4MR8rHIYOyrrX0HrU7b1pVf/zuIfKJr48
 VzgmD/eBT4cmpVGq+pS5pIPTL4b+JPa7YfUxWfKnYYUt9wdZzIcZI5vVO+aY1LgVYYT1
 2AkVr1KRN3neuszXJK14Zcm8r0lJHEDWmaYg8/5RL63fXYP2GYTTKBuJPv1qoTlhrOPQ
 LfeTpR7mRbBbzaOb5kHxrKMlhoqCYna5XwU7hOc6n0oF/L1XKPtDkyWwIYU3YwledCWv
 FXgx0ayxObNo07wiWzw7V7xFle8BB27bjVENdH2eSP+FErAw4OAXXD0DyoEVdhT8kwGf
 pYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813467; x=1759418267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UluGas5X2LWmQB7iVdb5z5eOB2ccnl2sNvVSp9MKYIw=;
 b=Mq6Jq9fO/mVuob/hXnZyioD8WRmoUGKrzRVEZJ9NkncUXnisHVkiVyd5oI1kx65eiH
 suJ3blpq3oLiLl5VygqaFE9j5VJ86XeCf6C1T+Ga1Ztg1+JrKqkz2wgLDbqfljqWE6HT
 asxGhVpQVqttSiQw10/ShP2BL3zlnqodIFzjUXALFSLQjxht6rzIxBIvXW/lvwnxWXv9
 Ql6xcPVPlNbN1GbD7XaooBzrxnCJ8Fpb9mXVi/s/mPsLkc3shYfnpbDARdrV3pta9Rnt
 2iNMERtQKOGzKuK6SLplGDG3SW1QZq4/t1hlnmSDN0AoqDcC+zMyjVVpMWejypT2L1+1
 GeQg==
X-Gm-Message-State: AOJu0YxAEYbIW6mQNsAtR1rS1V97QNsR1RnD1R9Fk1DJ+0S1zt5lSMNU
 nuhugk3NOQzD4Uq/fgC04Y34ek7TEzmoUtaJoGM8pMt7RmR5aE1aP7tk
X-Gm-Gg: ASbGncvy6yqZhVEpsezrWEG66U1JKM2FfqekBG+qH/rc2WmzP4pXY1BNiyZ3bL0cIlt
 9FxAQsmXXu8IPIw/Y5Uo9g6NTqqz+FxGXJwp5ascqiYgw4frcaMDY+Zpa80deHnyZvpBCGYljpT
 24nH1tBmFdCFzIvQhea2UU4d/MU4OQkuHpJBI1kyS35nqnAcGK0Kt43n5ijZdpL+5o7AP4vCFX2
 Ijd5wu9NwNQ4B175uluFCpNf7S4g/S/iZ3MBW8Sa8+1QjslBvSHAcUeog731ZOmlF3R/F6YY5R6
 vZFJo3aus12NrtcvVnfTcotG+X67YIElivhBOsaAtXyWZ5AxK7+4fthATQe46+HmaNNm97B+vzi
 OGA6ZyGU2L8SnPw==
X-Google-Smtp-Source: AGHT+IGed0vIRa+md+egWvWqgYYl4XwnX/bKqIftOs7kK/BC39V/DrV+l1FBmmZSDKHaohVTfkYJWQ==
X-Received: by 2002:ac2:51c8:0:b0:576:fbdc:e3d9 with SMTP id
 2adb3069b0e04-582d0c2a3e0mr1199445e87.14.1758813466370; 
 Thu, 25 Sep 2025 08:17:46 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 08:17:46 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
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
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v3 20/22] dt-bindings: display: tegra: document Tegra20 and
 Tegra30 CSI
Date: Thu, 25 Sep 2025 18:16:46 +0300
Message-ID: <20250925151648.79510-21-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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
 .../display/tegra/nvidia,tegra20-csi.yaml     | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
new file mode 100644
index 000000000000..817b3097846b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
@@ -0,0 +1,135 @@
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
+  clocks: true
+  clock-names: true
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
+          items:
+            - description: module clock
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
+          items:
+            - description: module clock
+            - description: PAD A clock
+            - description: PAD B clock
+
+        clock-names:
+          items:
+            - const: csi
+            - const: csia-pad
+            - const: csib-pad
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

