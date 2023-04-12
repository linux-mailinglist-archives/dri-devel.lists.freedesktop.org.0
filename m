Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457F36DF34E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F65310E781;
	Wed, 12 Apr 2023 11:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F398410E770
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:27:54 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 826DF6603215;
 Wed, 12 Apr 2023 12:27:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681298873;
 bh=j/AmnqcUgZwbS3Y0n+C2WF0SZPlM1NGbL/O9iXx8hnw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HlN3auaDUklNJexPh4RU+RZt4NmSau6riHAu2X9cJ0vHgdkteMsTLQkCd9wLUgkdB
 QFZDMVNF/yPletXBBn4J2hNmk1LIsQ4RGXDxEGeR3SoogP1yWD3MbEbyyW1ZPA5CwL
 88C4fziaBdzDAaGiZBTJ628cYGM6x+znf4+erLt8jx4XDCENYYdY1XzVBDc8+Pxy0c
 K/D9UJMsdVL367+q7WJS6v/ezb2Y6ZJKwa6NQa1TbkCtAB7njQQ+/9WCho8l/J5yQw
 CUTWqbhHv2mTTNixtpQ/TtbXh2cRez6F23yv6CPpw8NU8vB2AnOFzIf9h6rhf+tJLB
 ZZtVelP8+L7Wg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Subject: [PATCH 06/27] dt-bindings: display: mediatek: ovl: Add compatible for
 MediaTek MT6795
Date: Wed, 12 Apr 2023 13:27:18 +0200
Message-Id: <20230412112739.160376-7-angelogioacchino.delregno@collabora.com>
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

Add a compatible string for MediaTek Helio X10 MT6795's OVL block: this
is the same as MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 065e526f950e..7671c01dabdd 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -34,6 +34,10 @@ properties:
               - mediatek,mt7623-disp-ovl
               - mediatek,mt2712-disp-ovl
           - const: mediatek,mt2701-disp-ovl
+      - items:
+          - enum:
+              - mediatek,mt6795-disp-ovl
+          - const: mediatek,mt8173-disp-ovl
       - items:
           - enum:
               - mediatek,mt8188-disp-ovl
-- 
2.40.0

