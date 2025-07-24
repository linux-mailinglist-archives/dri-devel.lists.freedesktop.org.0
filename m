Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23FAB103CF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 10:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5646010E8D5;
	Thu, 24 Jul 2025 08:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FQufsu60";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E304710E8D2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753346386;
 bh=jjLUE5HdPRZzn/E9l0Gx0a05LnILHnJ7+pTe/jrPRJk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FQufsu6051wTm6fdYu0USqifJaXEeaojrxuyjpx9ESnaHdZ9dxjUDJ5fDPs7dra8H
 Q11J84GLCUpHk1LR3Qi/ctJTsqKIVmH3Msnra34UCBMopNVkuTov9XlwhddeRiJm5U
 eC7Wgag89tzveIoL+kUo1GL8URd+uIhC4UhMBcPMlRWMiZgy67lMgXzahxQfNCTA6T
 hNBd2UIP6iF6/UuFMpD5th209wioY40Ly6guT99csiRQ0kv2Cl5Al81FBD2Ea9apy/
 b7p0+hNCKpQSGxA7BQTbTIEqxTeYki6DJKYitFgbTZpTZhzK2rP13nVKw3Rnmuxrm3
 l4VibTq/R4Big==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 399A317E0FC2;
 Thu, 24 Jul 2025 10:39:44 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, atenart@kernel.org,
 jitao.shi@mediatek.com, ck.hu@mediatek.com, houlong.wei@mediatek.com,
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com,
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: [PATCH 08/38] dt-bindings: pinctrl: mediatek,
 mt7622-pinctrl: Add missing base reg
Date: Thu, 24 Jul 2025 10:38:44 +0200
Message-ID: <20250724083914.61351-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pin controller for both MT7622 and MT7629 need both a "base"
and an "eint" MMIO like the ones found on other MediaTek SoCs:
while devicetrees have always been correct, the binding is not,
as it only allows an "eint" reg.

Add "base" to reg-names and increment maxItems for reg to two.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index 57b19031925d..a6a1d321bb26 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -19,10 +19,11 @@ properties:
       - mediatek,mt7629-pinctrl
 
   reg:
-    maxItems: 1
+    maxItems: 2
 
   reg-names:
     items:
+      - const: base
       - const: eint
 
   gpio-controller: true
-- 
2.50.1

