Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBDFB103D2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 10:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA89010E8D4;
	Thu, 24 Jul 2025 08:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EOQHw5dW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BB310E8D2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753346394;
 bh=v0flDi7EoltDZidtFDgX25K3EX5eZ39OLHBODZmt3jI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EOQHw5dWvWRsLrb/IHJ+axQp+71IdF4KUnDviAaWdBxnRKpGGEbDOCcCrSSG1eeZ8
 gZrYo8iwKvcJvRqGDKk/YQrXncNCKyvnUARhbZg19p4bcISm8EN/sDC7a1ouPyH9QZ
 KROUGsCGr7HS/s5k8pALlHVoQTFAbDCoHCJQcnxZA6Fx4reWBwXxh35M6eQWOImh7W
 hUAvXDMOszay6N5G2TNGEbrXStV/Xvn4RpuzNo1AdhXMGGruHKLlJ9s4jS6IaBlKbS
 Uo+creRPiKwGClnw+2u6A5BWd6fP98m4u+j3JWnhLPL8egE3MK85L+AIGLT/pWURKg
 OW6B6zxpyaWlw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2A20917E128C;
 Thu, 24 Jul 2025 10:39:52 +0200 (CEST)
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
Subject: [PATCH 11/38] dt-bindings: regulator: mediatek,
 mt6331: Fix various regulator names
Date: Thu, 24 Jul 2025 10:38:47 +0200
Message-ID: <20250724083914.61351-12-angelogioacchino.delregno@collabora.com>
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

This binding was never applied to anything because it misses the
compatible, hence any mistake in it got unnoticed.

Before adding the compatible to let it apply, fix the names and
the node names of various regulators.

Fixes: 6385e21692bb ("regulator: Add bindings for MT6331 regulator")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6331-regulator.yaml         | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml
index 79e5198e1c73..6006a973b865 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml
@@ -26,23 +26,23 @@ patternProperties:
 
     unevaluatedProperties: false
 
-  "^ldo-v(avdd32aud|auxa32)$":
+  "^ldo-(avdd32aud|vauxa32)$":
     type: object
     $ref: regulator.yaml#
 
     properties:
       regulator-name:
-        pattern: "^v(avdd32aud|auxa32)$"
+        pattern: "^(avdd32_aud|vauxa32)$"
 
     unevaluatedProperties: false
 
-  "^ldo-v(dig18|emc33|ibr|mc|mch|mipi|rtc|sram|usb10)$":
+  "^ldo-v(dig18|emc33|ibr|mc|mch|mipi|rtc|sim1|sim2|sram|usb10)$":
     type: object
     $ref: regulator.yaml#
 
     properties:
       regulator-name:
-        pattern: "^v(dig18|emc33|ibr|mc|mch|mipi|rtc|sram|usb10)$"
+        pattern: "^v(dig18|emc33|ibr|mc|mch|mipi|rtc|sim1|sim2|sram|usb)$"
 
     unevaluatedProperties: false
 
@@ -52,7 +52,7 @@ patternProperties:
 
     properties:
       regulator-name:
-        pattern: "^vcam(a|af|d|io)$"
+        pattern: "^vcam(a|_af|d|io)$"
 
     unevaluatedProperties: false
 
@@ -75,7 +75,7 @@ patternProperties:
 
     properties:
       regulator-name:
-        pattern: "^vgp[12]$"
+        pattern: "^vgp[1234]$"
 
     required:
       - regulator-name
-- 
2.50.1

