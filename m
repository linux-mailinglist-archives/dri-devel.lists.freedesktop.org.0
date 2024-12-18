Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AA19F63DB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2691C10EB65;
	Wed, 18 Dec 2024 10:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dsqlH2sq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A38A10EB65
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734519212;
 bh=N3yE4+/zUzwrZLGitsLbjb1957m/tWo8jToq6NvN4nw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dsqlH2sqPyC5sMeSdb2HtWuMk8PfpABN0cFtmBSr5jxlJkyu+KbdCvyuLt30cUfBD
 cDpqob/Bq7y000yGqhTzmF1j6B10Wgwo/tZbMt4nVlgeCDGXmVta9t5JqqHlZeKsu6
 9luviBTwwQKo5ArPLUgv/o0KEB8tDavGN4u7jtnwgOhN3Fq6lBn8mjQN6RTUmQ4SEV
 vXH7RyBRYUhIGsKs1yNiMO6ENfEdG06yM2DqVQMOAMZhT3jDZm0BxXSRcGIvYa1oUM
 eEfWQbdECOxhs5JPUB7qvAr6NQjLAOIoCuYBo/GYqtMjpMaSq/E4BltP05fVFCvk5c
 1rRA1If0ACoPA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3752617E3613;
 Wed, 18 Dec 2024 11:53:31 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mchehab@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, moudy.ho@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, sebastian.fricke@collabora.com,
 macpaul.lin@mediatek.com
Subject: [PATCH v1 1/3] dt-bindings: display: mediatek: Add compatibles for
 MT8188 MDP3
Date: Wed, 18 Dec 2024 11:53:18 +0100
Message-ID: <20241218105320.38980-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
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

Add compatible strings for the AAL, COLOR, MERGE and PADDING
hardware components found in MediaTek's MT8188 SoC.

This hardware is compatible with MT8195.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/display/mediatek/mediatek,aal.yaml        |  4 ++++
 .../bindings/display/mediatek/mediatek,color.yaml      |  4 ++++
 .../bindings/display/mediatek/mediatek,merge.yaml      |  4 ++++
 .../bindings/display/mediatek/mediatek,padding.yaml    | 10 +++++++---
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index cf24434854ff..1479035da409 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -25,6 +25,10 @@ properties:
           - mediatek,mt8173-disp-aal
           - mediatek,mt8183-disp-aal
           - mediatek,mt8195-mdp3-aal
+      - items:
+          - enum:
+              - mediatek,mt8188-mdp3-aal
+          - const: mediatek,mt8195-mdp3-aal
       - items:
           - enum:
               - mediatek,mt2712-disp-aal
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 7df786bbad20..799c0b8fc1f9 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -27,6 +27,10 @@ properties:
           - mediatek,mt8167-disp-color
           - mediatek,mt8173-disp-color
           - mediatek,mt8195-mdp3-color
+      - items:
+          - enum:
+              - mediatek,mt8188-mdp3-color
+          - const: mediatek,mt8195-mdp3-color
       - items:
           - enum:
               - mediatek,mt7623-disp-color
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index dae839279950..415a25bc18fa 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -25,6 +25,10 @@ properties:
           - mediatek,mt8173-disp-merge
           - mediatek,mt8195-disp-merge
           - mediatek,mt8195-mdp3-merge
+      - items:
+          - enum:
+              - mediatek,mt8188-mdp3-merge
+          - const: mediatek,mt8195-mdp3-merge
       - items:
           - const: mediatek,mt6795-disp-merge
           - const: mediatek,mt8173-disp-merge
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
index be07bbdc54e3..86787866ced0 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
@@ -20,9 +20,13 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8188-disp-padding
-      - mediatek,mt8195-mdp3-padding
+    oneOf:
+      - enum:
+          - mediatek,mt8188-disp-padding
+          - mediatek,mt8195-mdp3-padding
+      - items:
+          - const: mediatek,mt8188-mdp3-padding
+          - const: mediatek,mt8195-mdp3-padding
 
   reg:
     maxItems: 1
-- 
2.46.1

