Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F162F69E3AD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 16:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520EF10E84B;
	Tue, 21 Feb 2023 15:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3833F10E835
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 15:37:51 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 61588660219C;
 Tue, 21 Feb 2023 15:37:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676993870;
 bh=XZzIf5WhWGCw6ZUak5aUno/dS29XlqQ4V6b5lAMNRT4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H+Othc8jly/UlZ/H/DYKYH2UsRajWJP5aw6CzokeJLVJtdEBoZthynoP83iLZjADP
 Vq9CEae9R1VtMisaalqSoYE0IvUcRUFRBQFBJVJEmhrhQ4eNWTJqeeuUWuH27UBNwU
 4I/QgzW1qoOVHRfCrVXmB0IMd5+vOIZCCqVmeld4+LNPTjNAjqmQN/gmnIW31qcNgP
 iOvpAWaRT9jEATqXvjZ+/02fhU/Ik7SW9kk9FBy4Th2+SWqmXlK1wmk24yPDCSUXwo
 mHfIF1LJ3agbpB9T1IuXi8ESMSXkBjbiQodLq1XmhDr0mOYRyT/uA3UpA+X5ce42v5
 yRgIO9n6bKObw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v2 06/10] dt-bindings: gpu: mali-bifrost: Add a compatible for
 MediaTek MT8186
Date: Tue, 21 Feb 2023 16:37:36 +0100
Message-Id: <20230221153740.1620529-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get GPU support on MT8186 by adding its compatible.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index be18b161959b..43a841d4e94d 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -15,6 +15,11 @@ properties:
 
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - mediatek,mt8186-mali
+          - const: mediatek,mt8183b-mali
+          - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
       - items:
           - enum:
               - amlogic,meson-g12a-mali
-- 
2.39.2

