Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF5DA22CF5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 13:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CD710E947;
	Thu, 30 Jan 2025 12:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="p4TRrDDe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE8410E950
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 12:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738240281;
 bh=7SBQfrRI2oth98VXFTxo4EgRQoJmwkt7eFh7tw9GTeQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=p4TRrDDeMdpBKdhXbEUc+/V4mBPsRUYHbMNlD6FHSbP+TGkXRM1YLi12N/hffmhMS
 7PBLTaIsDPoFxJWKrE8vnyx7XuZ3kdH/jkRHwxO7EwGgiSBLCRBlE3niw3XfuIay8Y
 ibTC65HgB9Fks64c8mYsV2AU+slMLVk1//U0bVZklhUkpDeRP4/vBe8RvsKF+niZA7
 8c3DcpGujGukbmzpgYfuAw7ulJk/vwYFJbHcUyYhvdj12LbVtWno8VM7Jtc3rcCkJn
 7YH+R4vVyjeRu6ZvUDbKgCHf3zqlDSKU75GJ6/ZyEVfA+/CgZslqLLJ8ap52G99NKH
 t4f6TMbJJPAPg==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr
 [90.76.208.231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 120C117E10C2;
 Thu, 30 Jan 2025 13:31:20 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 30 Jan 2025 13:30:59 +0100
Subject: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8370 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250130-mt8370-enable-gpu-v2-1-c154d0815db5@collabora.com>
References: <20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com>
In-Reply-To: <20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738240278; l=1442;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=7SBQfrRI2oth98VXFTxo4EgRQoJmwkt7eFh7tw9GTeQ=;
 b=hW27eiliAuhLJ3bX0TZxDlJAjNOQ3m9sjFDp5etbbNB2TQuNIoz+VdYFqr6/zFYNwyD1nmLS9
 82XZOVKIPdnDZ28vclIYMp4N+2V2SA0LuF4ZGkHNmbacKv3oPNvmtC0
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
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

Adds a compatible for the MediaTek MT8370 SoC, with an
integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core).
This new compatible is needed for this SoC support, as the other
existing compatibles for the same architecture (MT8188, MT8192) do not
match the required power domain number.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 735c7f06c24e632ab738d062f15378f754c8adaf..6f6211950bb495fa6bfcdfe8d1e27e5ce7aeeae0 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - mediatek,mt8188-mali
               - mediatek,mt8192-mali
+              - mediatek,mt8370-mali
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
 
   reg:
@@ -217,7 +218,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: mediatek,mt8186-mali
+            enum:
+              - mediatek,mt8186-mali
+              - mediatek,mt8370-mali
     then:
       properties:
         power-domains:

-- 
2.48.1

