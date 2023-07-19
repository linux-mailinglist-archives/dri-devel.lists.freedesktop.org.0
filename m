Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 236C9759977
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 17:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F68910E4C8;
	Wed, 19 Jul 2023 15:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5E810E4C8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 15:22:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 537981C000B;
 Wed, 19 Jul 2023 15:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1689780119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=z7LeJpkpUdhoFv0e9eqWbQ9CWTKgq+xXZByhqOo66tA=;
 b=bAexir4VCi2pGfTcj5tOmnZu6VIjuODeLgGTSBy2VUTxxTDAf+urTgSkc7PNv121vRpzSy
 AfvLGVlGOWnN4QwnFGha/P8JRiy/hEnqcw6gs5ihCFv20rVYz027F1plsQV79uzNxdZDOR
 dp/QOIMoUXb3FWzJAsJWeT1CP9LchtejpJ58/ZfzOaxLN0a2GQfKuvi7DlL3Ghq7f2cg91
 uFrwE1Hwhuh9tlSpRCAAFilVkDKXbfvUEWlpKskt/Xb+EjZHyTejI0TRsMiSfqmqkM0Ya8
 c4JFZXe6Tze3bC76bwqrcYOoxP+6vVBV5WcoiUSCB6z1puHE3+jjz2FYbFj3Tg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add ShenZhen New Display Co.
Date: Wed, 19 Jul 2023 17:21:45 +0200
Message-Id: <20230719152147.355486-1-luca.ceresoli@bootlin.com>
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

