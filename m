Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469FFBF4FB9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 09:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C1E10E578;
	Tue, 21 Oct 2025 07:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="szKPQfOV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF06A10E577
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:34:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0FAE3C0B886;
 Tue, 21 Oct 2025 07:34:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AAA00606DC;
 Tue, 21 Oct 2025 07:34:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C2AF5102F23E1; 
 Tue, 21 Oct 2025 09:34:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761032068; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=SK5U992WcNiHhzxd6gYrUFb9wH/LgMgdeebB8EqGaB8=;
 b=szKPQfOVCfCay7Q/JMT/iu4hqIFBDUTVPlI4caPMUUmRE9XDUluENSysZPN2hpcgaTdZTo
 ZVv7W250LD3BZATANzQJJDb7VWsZg//uKug65D1wW2+TOp1iQVGQB1bPUq7FKrLC11rcbA
 B4HzQTx3BectcgV/SB8YwOwwN3sS1SDW7kcAarhNdKpdQ49+0PfJZJphnRr+Er+2fPV6oI
 j7PZ5Dtu/D5Yvof58EWZ1a766HgYugAAZ5gtsqyei0z5TiCQqFY5HE5q7FFnLEO5wzi0MV
 wTGClqLCTHRt0+H/zQkqO16DHyxkoa2ZRbprVd9pOZ16KlvomdExnQl65RV1hA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 1/3] dt-bindings: display: panel: Add the Leadtek LTK08QV25BYL
 panel
Date: Tue, 21 Oct 2025 09:34:03 +0200
Message-ID: <20251021073408.195959-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021073408.195959-1-herve.codina@bootlin.com>
References: <20251021073408.195959-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

The Leadtek LTK08QV25BYL is a 2.8" 240x320 DSI display.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../display/panel/leadtek,ltk028qv25byl.yaml  | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk028qv25byl.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk028qv25byl.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk028qv25byl.yaml
new file mode 100644
index 000000000000..c10365984057
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk028qv25byl.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/leadtek,ltk028qv25byl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Leadtek LTK028QV25BYL 2.8in 240x320 DSI panel
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: leadtek,ltk028qv25byl
+
+  reg:
+    maxItems: 1
+
+  backlight: true
+  port: true
+  reset-gpios: true
+
+  iovcc-supply:
+    description: regulator that supplies the IOVCC voltage
+
+  vci-supply:
+    description: regulator that supplies the VCI voltage
+
+required:
+  - compatible
+  - reg
+  - backlight
+  - iovcc-supply
+  - vci-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "leadtek,ltk028qv25byl";
+            reg = <0>;
+            backlight = <&backlight>;
+            iovcc-supply = <&vcc_1v8>;
+            vci-supply = <&vcc3v3_lcd>;
+        };
+    };
+
+...
-- 
2.51.0

