Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5A2729D9B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 17:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18C510E6BC;
	Fri,  9 Jun 2023 15:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7075310E6C1
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 15:00:01 +0000 (UTC)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686322800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V5FRfPCwQJ17mhgzs0DzGHbHHXENt7bzJ7+A1d6ujS4=;
 b=QSJquyXAM5UyM4CvGaETzuty2pzzdGY57ot/mY+aBGjTaCDLrPVZPboqViSNs34OMaO6RX
 zbQm71eXlludQuIU3hkn1G8bV1N4xgsDIXkJg3OC05qpEHTFrJ3PTd0b1vdoZmecUIsrp1
 FKuU45XNWx87V2c2pNEpn2uuAF/d0V+k+8ArWEADsdWaS9LQkjMe+Np7kOcg+1JtxD9g7w
 GhIMOdjL45QYEWB6fsmxZaLP4klMl8Ialq2qLyP7qYB55F6PZzCMjkiJEeRj4+Rg13y9XV
 9dt3NeXnhBYubFvhp4Ov5grxQYd8e7z69vdqz39uUvk8ezTWNKi84m7P510/Kg==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E16224000E;
 Fri,  9 Jun 2023 14:59:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] dt-bindings: display: st7789v: Add the edt,
 et028013dma panel compatible
Date: Fri,  9 Jun 2023 16:59:49 +0200
Message-Id: <20230609145951.853533-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609145951.853533-1-miquel.raynal@bootlin.com>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ST7789V LCD controller is also embedded in the ET028013DMA panel. In
fact, "sitronix,st7789v" might not be totally relevant alone as most of
the time -if not all- the LCD controller will always be packaged into a
display with its own physical properties.

Let's keep "sitronix,st7789v" valid alone for backward compatibility,
but we should definitely provide two compatibles to fully describe such
panel, so let's expect to have both when describing a panel such as the
EDT ET028013DMA.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/display/panel/sitronix,st7789v.yaml           | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index d984b59daa4a..d4c8af9a973d 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -15,7 +15,12 @@ allOf:
 
 properties:
   compatible:
-    const: sitronix,st7789v
+    oneOf:
+      - items:
+          - enum:
+              - edt,et028013dma
+          - const: sitronix,st7789v
+      - const: sitronix,st7789v
 
   reg: true
   reset-gpios: true
-- 
2.34.1

