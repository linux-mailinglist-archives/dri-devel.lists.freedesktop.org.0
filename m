Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF329F63DE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEA110EB67;
	Wed, 18 Dec 2024 10:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="coKAnevm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [IPv6:2a01:4f8:201:9162::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389F410EB67
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734519213;
 bh=QpoknfKuudyK6edNwVC6DZEAxrWbOP4UYlhcZ//BMsc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=coKAnevmlfnOHxiuU49wiymP39eElkIr9zvrHO7CzFjXhSP57hZvKngGJprdDs9KG
 yQmFQlzOHKfz2dHtxBdiwAe9759FMa8Hu+iEGmW8EO55j9k/sLkz2ZVtFFZTSB7j/d
 bjEHoAtr1D4DnMSah90zJPLCzJOXWo0/2LqE1nRGGMNgj6VMWd40z5X/pxCj0bZ6mY
 A1aMkCWoDnF6BAh4iTotVx3qgt+czGGLiLCHCZBm3N7LaaX0ko6maCUPPbwVr7bWwM
 xHgcLw7RQ03QZGlv1VRHWSOQwAYlqpxRgXjiEgq7tb0m2c+kVc4B++U1I0tldOT/9F
 COIOFav+64kMA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 92E5117E3615;
 Wed, 18 Dec 2024 11:53:32 +0100 (CET)
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
Subject: [PATCH v1 2/3] dt-bindings: media: mediatek: mdp3: Add compatibles
 for MT8188 MDP3
Date: Wed, 18 Dec 2024 11:53:19 +0100
Message-ID: <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
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

Add compatible strings for the FG, HDR, RSZ, STITCH, TCC, TDSHP
and WROT hardware components found in MediaTek's MT8188 SoC.

This hardware is compatible with MT8195.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/media/mediatek,mdp3-fg.yaml       | 8 ++++++--
 .../devicetree/bindings/media/mediatek,mdp3-hdr.yaml      | 8 ++++++--
 .../devicetree/bindings/media/mediatek,mdp3-rsz.yaml      | 1 +
 .../devicetree/bindings/media/mediatek,mdp3-stitch.yaml   | 8 ++++++--
 .../devicetree/bindings/media/mediatek,mdp3-tcc.yaml      | 8 ++++++--
 .../devicetree/bindings/media/mediatek,mdp3-tdshp.yaml    | 8 ++++++--
 .../devicetree/bindings/media/mediatek,mdp3-wrot.yaml     | 1 +
 7 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
index 03f31b009085..40fda59fa8a8 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-mdp3-fg
+    oneOf:
+      - enum:
+          - mediatek,mt8195-mdp3-fg
+      - items:
+          - const: mediatek,mt8188-mdp3-fg
+          - const: mediatek,mt8195-mdp3-fg
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
index d4609bba6578..d9f926c20220 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-mdp3-hdr
+    oneOf:
+      - enum:
+          - mediatek,mt8195-mdp3-hdr
+      - items:
+          - const: mediatek,mt8188-mdp3-hdr
+          - const: mediatek,mt8195-mdp3-hdr
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
index f5676bec4326..8124c39d73e9 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
@@ -20,6 +20,7 @@ properties:
           - mediatek,mt8183-mdp3-rsz
       - items:
           - enum:
+              - mediatek,mt8188-mdp3-rsz
               - mediatek,mt8195-mdp3-rsz
           - const: mediatek,mt8183-mdp3-rsz
 
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
index d815bea29154..1d8e7e202c42 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-mdp3-stitch
+    oneOf:
+      - enum:
+          - mediatek,mt8195-mdp3-stitch
+      - items:
+          - const: mediatek,mt8188-mdp3-stitch
+          - const: mediatek,mt8195-mdp3-stitch
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
index 14ea556d4f82..6cff7c073ce4 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
@@ -17,8 +17,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-mdp3-tcc
+    oneOf:
+      - enum:
+          - mediatek,mt8195-mdp3-tcc
+      - items:
+          - const: mediatek,mt8188-mdp3-tcc
+          - const: mediatek,mt8195-mdp3-tcc
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
index 8ab7f2d8e148..cdfa27324738 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8195-mdp3-tdshp
+    oneOf:
+      - enum:
+          - mediatek,mt8195-mdp3-tdshp
+      - items:
+          - const: mediatek,mt8188-mdp3-tdshp
+          - const: mediatek,mt8195-mdp3-tdshp
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
index 53a679338402..b6269f4f9fd6 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
@@ -20,6 +20,7 @@ properties:
           - mediatek,mt8183-mdp3-wrot
       - items:
           - enum:
+              - mediatek,mt8188-mdp3-wrot
               - mediatek,mt8195-mdp3-wrot
           - const: mediatek,mt8183-mdp3-wrot
 
-- 
2.46.1

