Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B78734C8F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 09:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA77010E0DC;
	Mon, 19 Jun 2023 07:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D268F10E08E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 07:43:52 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1687160630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=N+AZBD5Sf/0h8WaVwiEe9j7DpVzPOO6Hvd7gosZu7QY=;
 b=WQxY9a/1Jdcrb6GT6sOP3EB9yPgnHN/PywxbW7XkW3MFyYKJKhP3dxszTzOGDcM3/M4q1b
 5HAjXvgPBf0CccTa5CRbVdy6IG9Mhc00kyONWY2nInFb9VLtSIukB2u8UadcT+KRV9bswO
 XOuhQBCDKdlm7hSEu2m5txxgXM6q63JY2oEYUlHyZwZErPiPUXdunlKX2psycXghRB0qLQ
 YB5gYuxO4YLVuASWKvRB8BpuZxRS+bADsrFCLBhScgCB0nQ4iSZqFZDKPLGSjj+MhaVDh/
 fmTTf2FommjHMgmkZoPOFlpzY/u6NfNsEqzp6DXxGJAuQOp3OkaPjULRVBhsKA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28C771C0002;
 Mon, 19 Jun 2023 07:43:49 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] dt-bindings: display: simple: Add Mitsubishi AA084XE01
 panel
Date: Mon, 19 Jun 2023 09:43:47 +0200
Message-Id: <20230619074348.2893701-1-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Mitsubishi AA084XE01 8.4" XGA TFT LCD panel compatible string.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

