Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B8D6DF344
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6392B10E77D;
	Wed, 12 Apr 2023 11:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3AE10E782
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:27:51 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 608366603201;
 Wed, 12 Apr 2023 12:27:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681298866;
 bh=YDQxHn4LMGevVfKU87Wwqa+i9ANnJ1wpzX3mspDDOrs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZODHobO8ZVk/h3S1ggRA+uwI4dbmv2vb89bvbQ+WbellxMWsbILYmGigTUdDwkHbN
 7OY8QOUDa4mARCVa2U9MdT9QzW8eOslKE26gYmmCj9NJZ4/hN8k6xHb+ivU3oOFoXp
 RPiV8ROFdOdUCcWq6BTqsJZV/bP4mOaQOKb7QOl1HOoyRPGDp1fmydKM/4QzoeBiqB
 iOae4a55AZ3NcZZQA+brruli98t1bc9OhE4aqcRhTyamaHOoDyWWRpN2R9KR8rKYHJ
 2H7S/+BPsis44nTeSGB/0n0r4WdBCEbG1fgzBXQOaAjpP/mvvTrgiCGaSEx79acUEN
 2AnXTAN3eGfaA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Subject: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 13:27:13 +0200
Message-Id: <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, kishon@kernel.org,
 phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 houlong.wei@mediatek.com, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a compatible string for MediaTek Helio X10 MT6795's display PWM
block: this is the same as MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index 0088bc8e7c54..153e146df7d4 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -22,7 +22,9 @@ properties:
           - mediatek,mt8173-disp-pwm
           - mediatek,mt8183-disp-pwm
       - items:
-          - const: mediatek,mt8167-disp-pwm
+          - enum:
+              - mediatek,mt6795-disp-pwm
+              - mediatek,mt8167-disp-pwm
           - const: mediatek,mt8173-disp-pwm
       - items:
           - enum:
-- 
2.40.0

