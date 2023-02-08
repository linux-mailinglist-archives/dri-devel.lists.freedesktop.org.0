Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD9768ED14
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 11:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F3B10E73B;
	Wed,  8 Feb 2023 10:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E127010E733
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 10:37:30 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 16FD3660209C;
 Wed,  8 Feb 2023 10:37:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675852649;
 bh=NHwI9wz8c2rm9f8C+YQk4IHldiJVGMy9bByas6AgTLs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NPOzPn5DJLfXV7xK7LvRnHr+UPZ1vZHuttiqK7hW4ilQgrER8UKEPM5tuE+ceqxH8
 lWuTDfdPzaALUnr0PwA6ikpN9mIAkoCYBMqkR8TxtG686lsu6sjBG1OB8jcxJJ01rx
 IjpU1IhF/rx1pnvcb1J+kJ8pqzmyRwP17EPybH1CN3nct2hRsPE/25driR3IXo0PNN
 NIVL7vMOnfrafgfguiH1mVeFNRFVjm6JHsmflVuC5Lj8BkfuFz8ph/TWmgAAy8i+X1
 t7ppyaLizEvTOeVubFipnVGZZ6GlrhI9QUp/l+fBfxfU0okzwtAN+Idc3Go1WXDle9
 6dZIfQktps8Ow==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH 5/9] dt-bindings: gpu: mali-bifrost: Add a compatible for
 MediaTek MT8186
Date: Wed,  8 Feb 2023 11:37:05 +0100
Message-Id: <20230208103709.116896-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
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
Cc: tomeu.vizoso@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get GPU support on MT8186 by adding its compatible.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 8c57b89ee866..85111559dfe0 100644
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
2.39.1

