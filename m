Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 061046DF339
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFABA10E0ED;
	Wed, 12 Apr 2023 11:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1767B10E77D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:27:50 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F7C06603214;
 Wed, 12 Apr 2023 12:27:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681298869;
 bh=6Azvcn4i0Hycg0xDnvRheRJ+soYYO+v1kBon9Mg6Dyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DrLbBoxkdz6ThJrt/c0Qxsir2AKyllHvXERWqJregc/3Ce0deMgfYXYzn62NK5ABR
 JzwrpTqb0fsOT2izOuJPyv600oPn6JzxZ/OERDoL1n1kByF5T0Tb2uRWQiFIp/vsi8
 rmJc00mOMM351G2ENBwfjk8VzYJl6YJ/BIVMY+2BO8ucRR6o/cu7XLQA93DlW9rtQ4
 JY4zZ/gXADUViX46yeHWNFn7DyZBn6/c4okYDoSWfvxW+5TY5c7VRgGVdEJ2gvodIq
 dL+i1U6iTPV0vxz8nhPmo8AxSMRJlehg0mRtWxfuvj5RlEgcfllulJxsdVeKaK8qy0
 MpDkSw2kIjE2Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Subject: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add compatible for
 MediaTek MT6795
Date: Wed, 12 Apr 2023 13:27:15 +0200
Message-Id: <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, kishon@kernel.org,
 phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 houlong.wei@mediatek.com, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
the same parameters as MT8183.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../display/mediatek/mediatek,dpi.yaml        | 23 +++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index d976380801e3..803c00f26206 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -17,15 +17,20 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt2701-dpi
-      - mediatek,mt7623-dpi
-      - mediatek,mt8173-dpi
-      - mediatek,mt8183-dpi
-      - mediatek,mt8186-dpi
-      - mediatek,mt8188-dp-intf
-      - mediatek,mt8192-dpi
-      - mediatek,mt8195-dp-intf
+    oneOf:
+      - enum:
+          - mediatek,mt2701-dpi
+          - mediatek,mt7623-dpi
+          - mediatek,mt8173-dpi
+          - mediatek,mt8183-dpi
+          - mediatek,mt8186-dpi
+          - mediatek,mt8188-dp-intf
+          - mediatek,mt8192-dpi
+          - mediatek,mt8195-dp-intf
+      - items:
+          - enum:
+              - mediatek,mt6795-dpi
+          - const: mediatek,mt8183-dpi
 
   reg:
     maxItems: 1
-- 
2.40.0

