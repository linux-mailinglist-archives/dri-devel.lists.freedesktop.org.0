Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD2B8FB266
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 14:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837BE10E27D;
	Tue,  4 Jun 2024 12:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="sDL1xvTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8188A10E463
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 12:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717504767;
 bh=CpQdxsV8bHr08qgSs4fiUyuci8075LtVplEkoA/kEzk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sDL1xvTeZR1ICVuDrYO4MuN3eVtUzy8Eq5zWP4h1GQQYEjvPxtV8NZflQIk3Rx60E
 uZaKFEtuD6jMadkj+xgcqTdOekT4qvC/RbXNsk75XFOAbZbYzS9mxaHuXAQ4QjSyW5
 7EIQI5zJ2HuzqaXW9iJqQCJ/VIdRpkwl198E7NfN6FrBo5QM76237nsPsR/lf0jIVb
 p5R/c50axFNY6jXt4TPaQAHt4Yrfo1mbMOdoxIbi3Rkjd9tII+9Tmeb9zrTOJzsKIi
 B1dRBNCVclTbyO73mJCD5qVCIHDbvtPc6OpSjvvFB42QKp5aegWFCGLuwKFzcp2na4
 uTuIQgEFuUq1A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3054837821F2;
 Tue,  4 Jun 2024 12:39:26 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, steven.price@arm.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8188 SoC
Date: Tue,  4 Jun 2024 14:39:21 +0200
Message-ID: <20240604123922.331469-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604123922.331469-1-angelogioacchino.delregno@collabora.com>
References: <20240604123922.331469-1-angelogioacchino.delregno@collabora.com>
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

Add a compatible for the MediaTek MT8188 SoC, with an integrated
ARM Mali G57 MC3 (Valhall-JM) GPU.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index e796a1ff8c82..8acb46adabe2 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -34,6 +34,7 @@ properties:
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
       - items:
           - enum:
+              - mediatek,mt8188-mali
               - mediatek,mt8192-mali
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
 
@@ -195,7 +196,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: mediatek,mt8183b-mali
+            enum:
+              - mediatek,mt8183b-mali
+              - mediatek,mt8188-mali
     then:
       properties:
         power-domains:
-- 
2.45.1

