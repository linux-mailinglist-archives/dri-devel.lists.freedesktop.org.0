Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 712BC69E39C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 16:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054F710E835;
	Tue, 21 Feb 2023 15:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED0110E0CC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 15:37:46 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EA54066021CD;
 Tue, 21 Feb 2023 15:37:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676993865;
 bh=DZyb8vw6qbtsYIBlP4pzm++AodTcvCv6AvAETopyIuw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IVEXs0YCZUHyAapvJaL7aVXlMFv/vsVn5oMxuyZIvMl/T5zqxgfCYeHhYmO2zTn4P
 x4O/Ligz1ltjjWbtSD3MfYn5s31rg+XjE7bPD7MLuUfU9k8O13YchbjQq45jh21ZTa
 LztdlXygiNltijjIgzXHYdvOKIqU4J3+ZDe9zG5MHj6IG9T8YkD133VVKBabn3XU1l
 hyukQs3LB4LsL5x/o2e0YoZs7FZcnA8w0Pa3VvR0uv1jMx2E3viudreCGS26pvRoxw
 /JKxEK5nWPMf4Pz/k+y9uqFXsjOtNbmHoAA4cxN9SHYaLddrBDO9o6btnNztpvt/me
 CqXQtOjT+NW2Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v2 01/10] dt-bindings: gpu: mali-bifrost: Add
 power-domain-names to base schema
Date: Tue, 21 Feb 2023 16:37:31 +0100
Message-Id: <20230221153740.1620529-2-angelogioacchino.delregno@collabora.com>
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

From: Chen-Yu Tsai <wenst@chromium.org>

In commit a7a596cd3115 ("dt-bindings: gpu: mali-bifrost: Add Mediatek
MT8183"), "power-domain-names" was added to the mt8183-mali sub-schema,
but was not added to the base mali-bifrost schema. Because validation
happens for the base schema and any sub-schemas separately, this causes
errors to be emitted when validating the MT8183 device trees.

Add power-domain-names to the base schema to silence the error.

Fixes: a7a596cd3115 ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 78964c140b46..02699d389be1 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -65,6 +65,8 @@ properties:
     minItems: 1
     maxItems: 3
 
+  power-domain-names: true
+
   resets:
     minItems: 1
     maxItems: 3
@@ -166,6 +168,7 @@ allOf:
       properties:
         power-domains:
           maxItems: 1
+        power-domain-names: false
         sram-supply: false
   - if:
       properties:
-- 
2.39.2

