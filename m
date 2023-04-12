Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABE26DF357
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C5610E789;
	Wed, 12 Apr 2023 11:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C5B10E77F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:28:02 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9942C660323A;
 Wed, 12 Apr 2023 12:27:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681298880;
 bh=PAEIMzwoCtkdbqGv4A8L/iPGet0PclfpZuqMQPM2HcY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J9Ppv5/sBFmqMx+rakSqPF3CVQOMG6s1dku5Gwthks6GTOKqI5N0oq+Kry+gZ07m6
 S+a8w5uHwRjrz+B0rokshjSpr/KSyXkOxcPTtm5pw6bRYlYxhuAFkRLhP+/k27OVyZ
 W0T7g4ABXRDy0biYk0Sfncyl2dYnCSG92G3wAmuHFqZjyeXHNxl9/ZVtKF0tE0gwR/
 sW8ZocQE3Hh1VGAuJbZMi5dQfAcOJfcS27itNqI7D2z/j7Tx8NFj7NlyZB8wK5sRlG
 d1mMeyhn/4LryWoPj+/g7kv/wExgm1rjo7PnnGFZL+c4VFb2/2LVWP12rp1Rd9mhPE
 WQaNaDdgT7Lbw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Subject: [PATCH 11/27] dt-bindings: display: mediatek: merge: Add compatible
 for MediaTek MT6795
Date: Wed, 12 Apr 2023 13:27:23 +0200
Message-Id: <20230412112739.160376-12-angelogioacchino.delregno@collabora.com>
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

Add a compatible string for MediaTek Helio X10 MT6795's MERGE block: this
is the same as MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,merge.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index 69ba75777dac..be330be1399a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -25,6 +25,9 @@ properties:
           - const: mediatek,mt8173-disp-merge
       - items:
           - const: mediatek,mt8195-disp-merge
+      - items:
+          - const: mediatek,mt6795-disp-merge
+          - const: mediatek,mt8173-disp-merge
 
   reg:
     maxItems: 1
-- 
2.40.0

