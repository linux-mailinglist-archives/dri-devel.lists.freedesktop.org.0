Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61289E544A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 12:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04BF10EE40;
	Thu,  5 Dec 2024 11:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QgeUTXt3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0D810EE39
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733399137;
 bh=nqNrX/533sU5V6zHe8xW3RLPoA1ipAtEcOiVjJO1rGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QgeUTXt3ErYC8FxeXMvefl8hFZop4SD0WXzDoBX51ImV1vZXl232QIwwr0bLb0xCK
 SRJdHAPPNkdjGC3DfjcrGyvG0Ori7dhuu5Ly6XpiT329NODgs+LbbeeHT0K4yxFpso
 oXuMX6pUvYQfSnYe+yEbWtPUMsg4JjMJU49Go0BTS8vLP/YA0I7k+c5MRUPRJK2vFJ
 mP46NZ/LR0pDdLQYZi9KYamhqutyecD2PnJEct54CFNY2e38PCgLLKR/lrsZVECcmw
 sjeAcVzatTx5EuuH1yiPcmC0qx92vqSvwA9lOG5uBXgV31Uk5lkXM8IZUvbeJv3vv3
 zDRvwuejaYQlg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 439F517E3635;
 Thu,  5 Dec 2024 12:45:36 +0100 (CET)
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
 kernel@collabora.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 01/15] dt-bindings: display: mediatek: dpi: Add MT8195 and
 MT8188 compat
Date: Thu,  5 Dec 2024 12:45:03 +0100
Message-ID: <20241205114518.53527-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
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

Add compatibles for the Digital Parallel Interface (DPI) block
found in the MT8195 and MT8188 SoCs: inside of the chip, this one
is directly connected to the HDMI block.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 0f1e556dc8ef..5670715efa5c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8188-dp-intf
           - mediatek,mt8192-dpi
           - mediatek,mt8195-dp-intf
+          - mediatek,mt8195-dpi
       - items:
           - enum:
               - mediatek,mt6795-dpi
@@ -35,6 +36,10 @@ properties:
           - enum:
               - mediatek,mt8365-dpi
           - const: mediatek,mt8192-dpi
+      - items:
+          - enum:
+              - mediatek,mt8188-dpi
+          - const: mediatek,mt8195-dpi
 
   reg:
     maxItems: 1
-- 
2.47.0

