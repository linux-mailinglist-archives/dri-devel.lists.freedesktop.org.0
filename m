Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8B4B2E323
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 19:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886F310E79B;
	Wed, 20 Aug 2025 17:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="MeEwTWBj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D64B10E79B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 17:15:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755710115; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DW1P2yGNKe6qXJoKXXfFz5jUZSgrriqhPb+s3ETw9zNw7hhBBDXWEDwveJsO1mIjnL/wzeqyMmdMe7osAIGcdKxF9AworKXwhNAP/rxLbFwuglY2eWMYBPX5n/0cm3jjU1bo4bKCRTD8mXD/HVGrcHvO3GbsnFiS1uKt0r2OB2s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755710115;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=3clLzDqiAjd9muEt1mhFe8RslCpeKQ/erZdnmWFEp58=; 
 b=A3KJezBLkFPw4/Ek8ae8+DOkFWU7csmSlTtOAeRRPf6vKWQwZrzJE8RgdTd1/xC1qxKr8XQlCD365dIfG3zJaYbzVBFbSKv+q47nM5RAAOG/Qig8AfyEvUTkJf5WbZ6Km2ZVMmhTZPDueOAp4DnEVaBCCXPHXNpxCGjHKhYmRxE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710115; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=3clLzDqiAjd9muEt1mhFe8RslCpeKQ/erZdnmWFEp58=;
 b=MeEwTWBjXIQNQvw79Cg7wjQvjxyWMwB8FA58UCPuRQY6g/CQvXvBHzWiOWbVCn4Z
 qyBMtuJagwMwbjnRRMZ2KYB/e2d2/feokesLV2tMCNWODTJn54S0G5DC4+DsCCXHI0+
 t72GdcuPPc8T7QWEdp1N5IGL1lEj1qBr8mndVyKc=
Received: by mx.zohomail.com with SMTPS id 1755710113355559.3878365147298;
 Wed, 20 Aug 2025 10:15:13 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 ariel.dalessandro@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
 jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
 kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v1 05/14] sound: dt-bindings: Convert MediaTek RT5650 codecs
 bindings to YAML
Date: Wed, 20 Aug 2025 14:12:53 -0300
Message-ID: <20250820171302.324142-6-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Convert the existing text-based DT bindings for Mediatek MT8173 RT5650
codecs to a YAML schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../sound/mediatek,mt8173-rt5650.yaml         | 73 +++++++++++++++++++
 .../bindings/sound/mt8173-rt5650.txt          | 31 --------
 2 files changed, 73 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
new file mode 100644
index 0000000000000..36e4f9c4c3d62
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8173-rt5650.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8173 with RT5650 codecs and HDMI via I2S
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+properties:
+  compatible:
+    const: "mediatek,mt8173-rt5650"
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  mediatek,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The phandles of rt5650 codecs and of the HDMI encoder node.
+    minItems: 2
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of MT8173 ASoC platform.
+
+  mediatek,mclk:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The MCLK source.
+      0: external oscillator, MCLK = 12.288M
+      1: internal source from mt8173, MCLK = sampling rate * 256
+
+  codec-capture:
+    description: Subnode of rt5650 codec capture.
+    type: object
+
+    properties:
+      sound-dai:
+        maxItems: 1
+        description: phandle of the CPU DAI
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,audio-codec
+  - mediatek,platform
+
+additionalProperties: false
+
+examples:
+  - |
+    sound: sound {
+        compatible = "mediatek,mt8173-rt5650";
+        mediatek,audio-codec = <&rt5650 &hdmi0>;
+        mediatek,platform = <&afe>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&aud_i2s2>;
+
+        mediatek,mclk = <1>;
+        codec-capture {
+            sound-dai = <&rt5650 1>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt b/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
deleted file mode 100644
index 29dce2ac8773a..0000000000000
--- a/Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-MT8173 with RT5650 CODECS and HDMI via I2S
-
-Required properties:
-- compatible : "mediatek,mt8173-rt5650"
-- mediatek,audio-codec: the phandles of rt5650 codecs
-                        and of the hdmi encoder node
-- mediatek,platform: the phandle of MT8173 ASoC platform
-
-Optional subnodes:
-- codec-capture : the subnode of rt5650 codec capture
-Required codec-capture subnode properties:
-- sound-dai: audio codec dai name on capture path
-  <&rt5650 0> : Default setting. Connect rt5650 I2S1 for capture. (dai_name = rt5645-aif1)
-  <&rt5650 1> : Connect rt5650 I2S2 for capture. (dai_name = rt5645-aif2)
-
-- mediatek,mclk: the MCLK source
-  0 : external oscillator, MCLK = 12.288M
-  1 : internal source from mt8173, MCLK = sampling rate*256
-
-Example:
-
-	sound {
-		compatible = "mediatek,mt8173-rt5650";
-		mediatek,audio-codec = <&rt5650 &hdmi0>;
-		mediatek,platform = <&afe>;
-		mediatek,mclk = <0>;
-		codec-capture {
-			sound-dai = <&rt5650 1>;
-		};
-	};
-
-- 
2.50.1

