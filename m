Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1956B6DF351
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4020910E782;
	Wed, 12 Apr 2023 11:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5144B10E779
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:27:56 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F2C786603236;
 Wed, 12 Apr 2023 12:27:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681298875;
 bh=x/at//afCB0j0N1gb1tTAezuut76wMigos38TLiuLr8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d76OL4b4GBYmBtFLGa9qb42sqADv1D7L1HaBnbteGBcDmhmFUDAs4Iw+ANveie0o7
 EgVkW4ygwL5AM/quWGLZWh5SGotmbz2etEJ87MeZRfNnNCOpgyA2nbVjyk82ruHq7W
 +e83r2LiWZKmlp9ucXvq1n7JyY+hUEzDgRU3Hsw4/Ws01AnXZzAR90xymFHGLFJX5O
 Y6lETcTYKTIrAaFuJR7a1172uyev0QyKJepzNEhP3mHfuacyv8mhFY2uy42fkNq3fx
 HXeEFj6Xv6yarb06T4l99Ml4k9oa3tT2/yNlBpDcMSXY8uLBbpKA62Te36sD6EHaVW
 cXZ7Q1EMgAMyQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Subject: [PATCH 07/27] dt-bindings: display: mediatek: rdma: Add compatible
 for MediaTek MT6795
Date: Wed, 12 Apr 2023 13:27:19 +0200
Message-Id: <20230412112739.160376-8-angelogioacchino.delregno@collabora.com>
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

Add a compatible string for MediaTek Helio X10 MT6795's RDMA block: this
is the same as MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 3ade2ece3fed..2eb99d2dfbdc 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -40,6 +40,10 @@ properties:
               - mediatek,mt7623-disp-rdma
               - mediatek,mt2712-disp-rdma
           - const: mediatek,mt2701-disp-rdma
+      - items:
+          - enum:
+              - mediatek,mt6795-disp-rdma
+          - const: mediatek,mt8173-disp-rdma
       - items:
           - enum:
               - mediatek,mt8186-disp-rdma
-- 
2.40.0

