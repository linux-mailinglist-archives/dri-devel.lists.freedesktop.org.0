Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7AEA825AB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 15:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0B210E896;
	Wed,  9 Apr 2025 13:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bhCn2K5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523CE10E890
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744204402;
 bh=DATJrZaH9JfWeAmD0tPnwt88xNWYRlg12xEesQvyvlQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bhCn2K5lLSQjDFCIVlZkErThvTIcoRMNCnEIB5S19nppa/+WzfTJB7C8899lgyuI5
 p8FNkIuD0hMLLWff4SqugEZpAR8g35TsC/qcWBfRKmIuzkTHbeqmFIqRZyok0Eu3Tu
 YBeshRkBoXhVxcIg+y3fdM0g0S+WYUb1J2AD9V3OVUYPTzAwQs8hrn3Glk2F1o07md
 rmCgmr0+sqyBuZ2TneKrvW8V6UYmt1sULckWYZBDfrASWxmAIEY3RDSWgK1Bf2bTrO
 /eGCfm37KiOAZRy+Kf90o07it3Z3DWIHEwvA1xjYzElxAzANMm88VUAu08Kzmz/dEg
 zJ89W38eqxQJw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6AC3817E07F2;
 Wed,  9 Apr 2025 15:13:21 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
Subject: [PATCH v8 01/23] dt-bindings: display: mediatek: Add binding for
 HDMIv2 DDC
Date: Wed,  9 Apr 2025 15:12:56 +0200
Message-ID: <20250409131318.108690-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
References: <20250409131318.108690-1-angelogioacchino.delregno@collabora.com>
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

Add a binding for the Display Data Channel (DDC) IP in MediaTek
SoCs with version 2 HDMI TX IP.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
new file mode 100644
index 000000000000..bde4dc556d4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek HDMI MT8195 series HDMI Display Data Channel (DDC)
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - CK Hu <ck.hu@mediatek.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt8195-hdmi-ddc
+      - items:
+          - const: mediatek,mt8188-hdmi-ddc
+          - const: mediatek,mt8195-hdmi-ddc
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi {
+        hdmi_ddc: i2c {
+            compatible = "mediatek,mt8195-hdmi-ddc";
+            clocks = <&clk26m>;
+        };
+    };
+...
-- 
2.49.0

