Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 272286A56A1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 11:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE10310E677;
	Tue, 28 Feb 2023 10:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394D210E674
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 10:27:12 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 19EDA6602FD8;
 Tue, 28 Feb 2023 10:27:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677580030;
 bh=07ttYEO0iBLHOrhXOFTPyKzhESTahMlFIiXlO4bGx5g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HwanA9e8mQdP3F3nehvW+iHlvEKe5WR1w7Ik64jb67REBrVYaOGHmeCnb/cBWmP+3
 O0eqLn0o54Vtl2zQIJvaoTCJkmxc1IJTDGM44j2cpFV0SQ80Hb7sqzgFXHNuDSvCUF
 6A8nwA2xhX+22Q2aFA2Ckbg3gdo8bsL/CuDxdXJLaB2H0nFXGDQQ5phS42jz2Le6cq
 UAniRBIPAO0lVda2L67lVGR2ut/B/j/oi7s1bhuBLvCOdJSpEPdmlRYXgYTTHSDlET
 kU9+dLtg0YnJiLIKrnvEmr2nlQ9+enUFdK7QH50b1vHb5+hTU5C3fCAmOmPlczawXt
 yS9fsVl5VaL9Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v4 02/12] dt-bindings: gpu: mali-bifrost: Set power-domains
 maxItems to 5
Date: Tue, 28 Feb 2023 11:26:54 +0100
Message-Id: <20230228102704.708150-2-angelogioacchino.delregno@collabora.com>
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

In preparation for adding (and fixing) power-domain-names and MediaTek
MT8192 bindings, allow up to five items for power-domains.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 7e110751353e..5b7f1c9d2b30 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -63,7 +63,7 @@ properties:
 
   power-domains:
     minItems: 1
-    maxItems: 3
+    maxItems: 5
 
   resets:
     minItems: 1
@@ -157,6 +157,7 @@ allOf:
       properties:
         power-domains:
           minItems: 3
+          maxItems: 3
         power-domain-names:
           items:
             - const: core0
-- 
2.39.2

