Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C15E777AF6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 16:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEA610E53F;
	Thu, 10 Aug 2023 14:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0A810E53F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 14:41:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E806AFF803;
 Thu, 10 Aug 2023 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1691678485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IyUXDREdoK5KpDJLjt4F6V+kTmb3e3jKUO9hAJV9buU=;
 b=ZgLU/UZ/OL7yBVxcfBH1xx7n+TJz4FIl8iltYgWqaAbmmkVE/41YRFMp+FPBkYeIu9k6Ez
 oRsKvAJno8tFLB4ykSuflOaLZf0GB+mpatdZHXl8ztIWkQTkjFHj4c87uUiLNodvy0z8Rn
 syEXlTdUw52bxhIDi35AtwEneFHwNGQXjNa7gK9eeVeLcWGrQEWCgZSZyBsY2y+MQdBF4b
 Y65dPOzdskTjPyJ20YrvGCO/OaKBv8mwyGGEdsEmZIDtwJyUvMdlD086bbz8clRd01LA3b
 B4NvKq25S7CLwBGBssD713B9P9fQ1piNf3KVK6lYJd+yQQx7ngV1XOFBt3Ogjw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add ShenZhen New Display
 Co.
Date: Thu, 10 Aug 2023 16:41:14 +0200
Message-Id: <20230810144116.855951-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ShenZhen New Display Co., Limited is the manufacturer of the
NDS040480800-V3 LCD panel according the datasheet.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2: none
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index af60bf1a6664..f73d6d4eabbe 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -929,6 +929,8 @@ patternProperties:
     description: Netronix, Inc.
   "^netxeon,.*":
     description: Shenzhen Netxeon Technology CO., LTD
+  "^newdisplay,.*":
+    description: ShenZhen New Display Co., Limited
   "^neweast,.*":
     description: Guangdong Neweast Optoelectronics CO., LTD
   "^newhaven,.*":
-- 
2.34.1

