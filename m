Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D92BB103D1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 10:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFC710E8D2;
	Thu, 24 Jul 2025 08:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="A0xSFSrw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3526D10E8D4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753346392;
 bh=HaevetnnFKHRcc+1X06S28eq0CnYSBndrM5Inix6OWk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A0xSFSrwXmhFdEpFiRIOiNyey3TgbknRE5XDUw1F5tUVQsL5f3WK/l2eKQoWsNmRo
 yH8XaCq0zkGZRPW0Qgi9g5jVNN3j1g7JR6PJlOCxt4ruz0mWBJHOnyRy6d4XxDyqf0
 UQobqYC9ol5z4zOej529l1Qe/7xQbkJrMikUfRAXGUlnIM3wcHdbWcfzzjCPLEF50z
 CGAwS4lSyM6+9V3UFJKb0Utew0gYeNpbHXhNhTQIEuPEJ6c/uCBh8SehctDl/Faqy5
 OcQu8iPCfO1jKE/q7cjVlaxxRtDcPl8qvYVc67mm4HXEsdsNdl8WYHzRWlYtMBnqX/
 9TwJmccLNoygw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8073D17E1298;
 Thu, 24 Jul 2025 10:39:49 +0200 (CEST)
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
Subject: [PATCH 10/38] dt-bindings: regulator: mediatek,
 mt6332-regulator: Add missing compatible
Date: Thu, 24 Jul 2025 10:38:46 +0200
Message-ID: <20250724083914.61351-11-angelogioacchino.delregno@collabora.com>
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

This binding had no compatible and for this reason would not be
applied to anything: add the missing "mediatek,mt6332-regulator"
compatible.

Fixes: e22943e32e1f regulator: ("Add bindings for MT6332 regulator")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/regulator/mediatek,mt6332-regulator.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6332-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6332-regulator.yaml
index 2eb512c29a0d..475f18d4f261 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6332-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6332-regulator.yaml
@@ -15,6 +15,10 @@ description: |
   buck-<name> and ldo-<name>.
   MT6332 regulators node should be sub node of the MT6397 MFD node.
 
+properties:
+  compatible:
+    const: mediatek,mt6332-regulator
+
 patternProperties:
   "^buck-v(dram|dvfs2|pa|rf18a|rf18b|sbst)$":
     type: object
@@ -36,6 +40,9 @@ patternProperties:
 
     unevaluatedProperties: false
 
+required:
+  - compatible
+
 additionalProperties: false
 
 examples:
-- 
2.50.1

