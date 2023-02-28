Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4CE6A56A9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 11:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D3110E67B;
	Tue, 28 Feb 2023 10:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD0B10E677
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 10:27:14 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C18B06602FDB;
 Tue, 28 Feb 2023 10:27:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677580033;
 bh=DycugKaR5mUM4/B5jFI1O5Chf+Iz4ZY0tMtXPBou2pk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TciQedvWltIU9GlfNDq1yjwAWt4XET1fgMhl0b6ZCnY+lY0vdzRTnVQPCOaA5LNBA
 tG33T24975UVz71zgw8/NZVKYtYc3CGnkr095mNYN67WrLecErMKuGYEmjI6rXHu2i
 Z+Qqc+KjsW9mHmrJj65YRImlICLoEANfaAXB37L0ubbEbB9swHQ1IpndwbmF4RurdK
 kGoXOFGBQMg9FRRmhhAxJ3BpQVIjbBKoP3ujR+RsO6Ws4O7H0VgNYq7HK4aYp3Pt1M
 eUWnuoCv7eGQsEnLZnkQsXkEqP9OCrfKNobQSrVg8QLYSY7nNSlsnh1pmMnOg01cwi
 FsELsq2vFknFw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v4 05/12] dt-bindings: gpu: mali-bifrost: Add new MT8183
 compatible
Date: Tue, 28 Feb 2023 11:26:57 +0100
Message-Id: <20230228102704.708150-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
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

Since new platform data was required in Panfrost for getting GPU DVFS
finally working on MediaTek SoCs, add a new "mediatek,mt8183b-mali"
compatible.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---

Since the changes are small, I kept the Reviewed-by tags that were
released on the previous version of this patch.
If that was wrong, please advertise so.

 .../bindings/gpu/arm,mali-bifrost.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index c5bef872114d..cf24aaba70f2 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - amlogic,meson-g12a-mali
               - mediatek,mt8183-mali
+              - mediatek,mt8183b-mali
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
@@ -177,6 +178,24 @@ allOf:
     else:
       properties:
         sram-supply: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8183b-mali
+    then:
+      properties:
+        power-domains:
+          minItems: 3
+          maxItems: 3
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+      required:
+        - power-domains
+        - power-domain-names
   - if:
       properties:
         compatible:
-- 
2.39.2

