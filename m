Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BC76A0AA8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 14:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3070210EB7E;
	Thu, 23 Feb 2023 13:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB55010E4C9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 13:34:59 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 242906602206;
 Thu, 23 Feb 2023 13:34:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677159298;
 bh=8laopmxtR2OlouaKlRNp419Yf1O5zDNFgjtz+3x6w6g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ELHcbqVZlsGf9F5eWvkeUdUS6r54S6c20urNg8COWvLiOWeQLN+XvJdtF111drNqG
 j88UAdHB5EORMwWIwMyIohA02twGQKeDj7ZETlgdk8i+7kUKvsgdAqKBilxs2I3+fT
 xpq8W+03OxqlTT9zaJHwvHYhm/olqxKQWy2zyaXgvYVVyLtjeYrLxYFiD/0CtTh0Vh
 GokQAcANcL3X+dGcE05wB/n2KO8NzQc9cJgF//kOPUj8iUDBRVLq+rqephLG5oUx20
 r+31XHYb3qsKZU+qoykzHtdlotX6tbGfzwcUtfEqoQWDMRM9JllelqjpF414w2xzzy
 Oih3Cp9+LICgQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v3 06/11] dt-bindings: gpu: mali-bifrost: Add support for
 MediaTek MT8186
Date: Thu, 23 Feb 2023 14:34:35 +0100
Message-Id: <20230223133440.80941-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
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

MT8186 has a Mali-G52 MC2 2EE GPU (two cores): add a binding with
two power domains (one per core) for it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/gpu/arm,mali-bifrost.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index be18b161959b..b9424f3ebd5f 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -20,6 +20,7 @@ properties:
               - amlogic,meson-g12a-mali
               - mediatek,mt8183-mali
               - mediatek,mt8183b-mali
+              - mediatek,mt8186-mali
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
@@ -159,6 +160,7 @@ allOf:
               enum:
                 - mediatek,mt8183-mali
                 - mediatek,mt8183b-mali
+                - mediatek,mt8186-mali
                 - mediatek,mt8192-mali
     then:
       properties:
@@ -204,6 +206,22 @@ allOf:
       required:
         - power-domains
         - power-domain-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8186-mali
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+      required:
+        - power-domains
+        - power-domain-names
   - if:
       properties:
         compatible:
-- 
2.39.2

