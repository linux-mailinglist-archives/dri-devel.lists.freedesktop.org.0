Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 379226A56B2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 11:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAEF10E683;
	Tue, 28 Feb 2023 10:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FD610E677
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 10:27:16 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8F45B6602FD8;
 Tue, 28 Feb 2023 10:27:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677580035;
 bh=58UmcWTMjp3ueAg+ubm3lZFiBe9/6S/M696EiXUjy5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZpHJ2RwvYuZTLDri18Sv6a1Pq1wOCNfK2lT5RYzhakbjg9a0VouYr4F9Nm11VQNEn
 ocqF+A59d6T52VzBOnnqG7RIT1Wk8jz4AOtxUdUMZbFyel6AjAaDtTOO/GfArsvx1f
 TduSHPIFDGt4J7wFu1F7J4bnhj8sBFq7ZKDkJq58LDIV+/mvJ9kSQAm9mwattgSIfb
 WCOLN334v+ngVFS0W/FFW48qRXDwU5LhwvVvU7cdLzYqp/vjAaRz45PzEbJoeetP8q
 zMwfmr+iBD8r+4NnVtHA03bjiIH3YXYRIN/+STUU+UkHzwnCK9awLooMfig1+g27iJ
 IQhL62jOQTn6g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v4 07/12] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8195 SoC
Date: Tue, 28 Feb 2023 11:26:59 +0100
Message-Id: <20230228102704.708150-7-angelogioacchino.delregno@collabora.com>
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

The MediaTek MT8195 SoC has a Mali G57 MC5 (Valhall-JM) and has the
same number of power domains and requirements as MT8192 in terms of
bindings.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 9f3991b6deae..8a0083800810 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -27,6 +27,11 @@ properties:
               - rockchip,px30-mali
               - rockchip,rk3568-mali
           - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
+      - items:
+          - enum:
+              - mediatek,mt8195-mali
+          - const: mediatek,mt8192-mali
+          - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
       - items:
           - enum:
               - mediatek,mt8192-mali
-- 
2.39.2

