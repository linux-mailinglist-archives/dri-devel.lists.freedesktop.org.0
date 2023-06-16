Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B66C733641
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 18:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC33D10E665;
	Fri, 16 Jun 2023 16:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F5F10E665
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 16:39:24 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686933562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ehsX10vN6CN1iIZKVvyjSeBf/rmbAD2xcR4hgZBNJYA=;
 b=D9wc8xmg9jGqY32GzqSOx83xV+X5Xi/IxsPWd5gPX6w1ph2Mkpn5Kp15uIIW7ZG53T1tzK
 oqr01KYZbT49zM/LtS7gASKL8xQbKaD8jfC/DsYe4k9GraWSQDc6UJlZiwH/Y3Xw4UvKql
 6qfy1h6fJJB8pNIMw/hN3nTN5fuIWX9ui2sZI7nr5YoI39jn8NXA8PUWwWNnhX6J/1Rut9
 ear/bi/SqRmLOSPRfttZvwJC1DzP+x5m7adFfbXWNADmb08/1ZQ/s2tFdJ/QX2/k23CuJZ
 xf7IZHzVes1Kjp5z6Xm6mEbQKUiaCDJwHE8b4C16u+WyQekz35RpmUnocBYZqA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40EB060004;
 Fri, 16 Jun 2023 16:39:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: simple: Add Mitsubishi AA084XE01
 panel
Date: Fri, 16 Jun 2023 18:39:19 +0200
Message-Id: <20230616163919.2805694-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
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
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Mitsubishi AA084XE01 8.4" XGA TFT LCD panel compatible string.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 18241f4051d2..cc841cf96fae 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -232,6 +232,8 @@ properties:
       - logictechno,lttd800480070-l6wh-rt
         # Mitsubishi "AA070MC01 7.0" WVGA TFT LCD panel
       - mitsubishi,aa070mc01-ca1
+        # Mitsubishi AA084XE01 8.4" XGA TFT LCD panel
+      - mitsubishi,aa084xe01
         # Multi-Inno Technology Co.,Ltd MI0700S4T-6 7" 800x480 TFT Resistive Touch Module
       - multi-inno,mi0700s4t-6
         # Multi-Inno Technology Co.,Ltd MI0800FT-9 8" 800x600 TFT Resistive Touch Module
-- 
2.34.1

