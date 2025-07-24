Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E7EB103D6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 10:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BE710E8E4;
	Thu, 24 Jul 2025 08:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AZP0rKQE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F30A10E8DC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753346399;
 bh=QX1FQ2dQ3CDRcwAseOl4+lBWXKhUPzCWrrc3PxSdZb4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AZP0rKQEsd8gKWsnWrNx5jYZI+QwjSgLO3Ra9NwcCWUuOP8Gw0/5LCtyQPe/kX8Ey
 QfgUv8gJ1MfDSPBc0fJcENbXWAV0r58Z4il5SfG7vjVTGnfMbpeTDF8vFvEUw0pBNe
 p5Ne4UAFRp75hFM0dPNHFAi9zH3SpOoXhP7TGfnL7e+IRp6ER4KV1IYnJ7mYDLNcJ7
 d1a/hkv9XZH95W/p2R92uSmtaTSy1NlxfiDSh8+/h9IRspptBEg9SB5GvAsY+kFpiG
 eJWjiv1xoSl/WnZej+zmI3zoQ70PzyveyIEvyVhOfE5OOEiK+lPIJ27rh10jYrAdJ4
 XHvuXt/wDhp8w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7239617E0FC2;
 Thu, 24 Jul 2025 10:39:57 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, atenart@kernel.org,
 jitao.shi@mediatek.com, ck.hu@mediatek.com, houlong.wei@mediatek.com,
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com,
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: [PATCH 13/38] dt-bindings: remoteproc: mediatek: Remove l1tcm MMIO
 from MT8188 dual
Date: Thu, 24 Jul 2025 10:38:49 +0200
Message-ID: <20250724083914.61351-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
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

Even though the MT8188 SoC's Dual-Core SCP IP is practically the
same as the one found on MT8195, it doesn't have a dedicated L1
TCM and relies only on SRAM.

Set reg/reg-names minItems to 1 globally and override it in all of
the conditionals for the SoCs that require more, and then split
the mt8195/8188 conditionals to allow specifying only the cfg MMIO
on MT8188.

Fixes: 91e0d560b9fd ("dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/remoteproc/mtk,scp.yaml          | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index adc6b3f36fde..6818a6052be0 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -28,11 +28,11 @@ properties:
     description:
       Should contain the address ranges for memory regions SRAM, CFG, and,
       on some platforms, L1TCM.
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   reg-names:
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   clocks:
@@ -171,8 +171,10 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 2
           maxItems: 2
         reg-names:
+          minItems: 2
           items:
             - const: sram
             - const: cfg
@@ -185,8 +187,10 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 2
           maxItems: 3
         reg-names:
+          minItems: 2
           items:
             - const: sram
             - const: cfg
@@ -196,12 +200,25 @@ allOf:
         compatible:
           enum:
             - mediatek,mt8188-scp-dual
+    then:
+      properties:
+        reg:
+          minItems: 1
+        reg-names:
+          minItems: 1
+          items:
+            - const: cfg
+  - if:
+      properties:
+        compatible:
+          enum:
             - mediatek,mt8195-scp-dual
     then:
       properties:
         reg:
-          maxItems: 2
+          minItems: 2
         reg-names:
+          minItems: 2
           items:
             - const: cfg
             - const: l1tcm
-- 
2.50.1

