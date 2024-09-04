Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FFE96B8AC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 12:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B20C10E74A;
	Wed,  4 Sep 2024 10:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DO1YRL5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192E710E74A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 10:40:38 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2d8818337a5so443042a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 03:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725446437; x=1726051237; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UZwrkyVGnSHmjN5+64G38o2zgp8nHkbeWENAxN2xZa0=;
 b=DO1YRL5no8qyjY/mL4s0lLNxz9sNTxiETc5L24S6pvTkdYQeSsb8EUggtqjPzqmj/I
 GQHR2lDojYeL640zMc34cIY33+6I9JINmDXTcY1XzvBh2bjhvFuXxsM5pafrU5OmfQbE
 g4FdGCaf2xPuixuIdL7nkPibT670dg+sKqAsteruT5pbJZY202kkvGJsdLkm8OVNTNz5
 oTWH+pBm3GenvKnvCsXrsVFlrlv0FxSpdUWwG2G/OgP69hVCnGysqoIe7uqJyE7BFVdD
 ZLXXQdXXY9/CooathXlMw1l62huS85767g8oC4fBhVL4K6uYBKwC13NfLANg2qyoxXzw
 jRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725446437; x=1726051237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UZwrkyVGnSHmjN5+64G38o2zgp8nHkbeWENAxN2xZa0=;
 b=txwWxSa/9b9xBLf0Srm2kd70z7KTTV/QPw0ztaz3Tbkz4IQGVAHtgAJffAzq6zLzbi
 sFtJSXx6KPi+IqoKX6ivhtAiJnXdERNSHOqGClLIFJTjxRmLdEsBsbrEB6sUTyA+JRs0
 WO7nRYy/EAyo24Zz/6P7iVrzy+sB0N6OlkLVkGLZslIR3cM8y9BUORmuWQe5RYWaXW2B
 VxfYdutYN4+8XL+u1WuMR62CC+WLSXxsSS+3NpE8zdJbgLnEdgpGmkOSogIfBnyI40aS
 DFuRijFOwvd4emrs35Z3g1Wj4cvdF9CHyxSAl8pfup73MF2/TNMADduWeyN5IW9jcBJN
 H0yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmBkUgV5ntON26yPpdRXdolxeaFzv0YDRXKX0MkrwF3xJDCLjNvH1phgoiJAbKuMQVaAE9KmuqNPk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKeiwLJAVaDlCjQhGyHgigsrmF5lrZcktVHr/5ooZnn2wXefXd
 WNfNexoX8KgyxhnhSbiV+VuJaZyJ6iK6uosNmmOJZJ9wmerNq7pV
X-Google-Smtp-Source: AGHT+IFaOTINhvFNl8FNK9LUH8YpH8X8+trhWoz1ujIDZSX9XWFRJqJPSEmIBCegsSVx9lskcKahbQ==
X-Received: by 2002:a17:90b:4b4a:b0:2cf:f860:f13b with SMTP id
 98e67ed59e1d1-2da8f1f0a38mr2645014a91.17.1725446437377; 
 Wed, 04 Sep 2024 03:40:37 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b37a:332a:2373:a683])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2da8f2f1ba0sm1194752a91.25.2024.09.04.03.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 03:40:36 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: mripard@kernel.org
Cc: marex@denx.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: lcdif: Document the dmas/dma-names properties
Date: Wed,  4 Sep 2024 07:40:27 -0300
Message-Id: <20240904104027.2065621-1-festevam@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

i.MX28 has an RX DMA channel associated with the LCDIF controller.

Document the 'dmas' and 'dma-names' properties to fix the following
dt-schema warnings:

lcdif@80030000: 'dma-names', 'dmas' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
- Add a blank line before the examples. (Krzysztof)

 .../bindings/display/fsl,lcdif.yaml           | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 0681fc49aa1b..8e3a98aeec32 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -50,6 +50,14 @@ properties:
       - const: disp_axi
     minItems: 1
 
+  dmas:
+    items:
+      - description: DMA specifier for the RX DMA channel.
+
+  dma-names:
+    items:
+      - const: rx
+
   interrupts:
     items:
       - description: LCDIF DMA interrupt
@@ -156,6 +164,18 @@ allOf:
         interrupts:
           maxItems: 1
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - fsl,imx28-lcdif
+    then:
+      properties:
+        dmas: false
+        dma-names: false
+
 examples:
   - |
     #include <dt-bindings/clock/imx6sx-clock.h>
-- 
2.34.1

