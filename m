Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F0125F4D2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 10:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D18D6E372;
	Mon,  7 Sep 2020 08:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0C26E2D5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:18:33 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s13so13452923wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=miWW6H6jXaFE/FyCEk5bY4nk7z7nkaDQEzvoX6DPlkA=;
 b=jgO6nuaRnlo0R2OYFX2vcDkqIExJA3JJthDEk7bvwcmzptmlrdmL9LVBaBYN+tgFno
 3Xy+PA6367n1pTE12o5y1KJC0pJan5XYQdAxgLIvpfe0/eYP3DeMjz+ck5qtw8SYM9qo
 J0AaFTHJ0hi2U58MsHU8vsIOh8yMo6JhUTSVtPjedZCyBClJAtST6EI2aUNnERV67TZa
 YxodpFCjL3Zli9Wgpg53hQ9fkU0GKZpETAQypmWG5MaFv9H51Mv0klk23hVicKOVW4iG
 3DaIltmO1vFQnyrBIMtX5/Sg2ECwSDcurrC2TGyBfPUxu9o94hsBvBuknTsJsT/RjFZT
 ZI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=miWW6H6jXaFE/FyCEk5bY4nk7z7nkaDQEzvoX6DPlkA=;
 b=XePy0rTo4yqGa0a2BLFIUIjehCJ4zGcbf6fqnsSkcU/oKy4ujnpUsHG+hsqaddFGWh
 w7WS5UvNNREyKIJAumcfdykj4cC386RmV7wYChIWBZMIOm55x51Dq4yGYy6pgD69tg81
 GNZRokTsq6fBE33JrDBofDBTr3kHLmF3CKRq7GWsdJPv43hmLpqUAGZvoPZrnthrK6A5
 nRxDIeuTExwkZzPyUz1bKPiwdvZ35ye4VvqMqYbekBP4S55z8VsGuOCsbzuvHCd+xABh
 xDX9C0cSTOE3dA2xwVR7+etN90FRTpYbO5+b1zJhRyia7mjuDa4JrNjneRGyR9RmA0eh
 nORg==
X-Gm-Message-State: AOAM5307rWU5+5mUCbQVY0qnznTdbfs3yU/QURfnxRZEraJRWhql4hie
 y4OFLZgQouoEyi5k61n7F9d+3w==
X-Google-Smtp-Source: ABdhPJzt7+ODbEr1nL9IMe4B5idhevglKUu034LrO7TAnTPbUIolpz1hDb42Mq+Viw7CjTrnT2KwwQ==
X-Received: by 2002:a1c:5605:: with SMTP id k5mr14600574wmb.142.1599466711691; 
 Mon, 07 Sep 2020 01:18:31 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id q186sm28032205wma.45.2020.09.07.01.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:18:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	devicetree@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: display: amlogic,
 meson-vpu: add bindings for VPU found in AXG SoCs
Date: Mon,  7 Sep 2020 10:18:20 +0200
Message-Id: <20200907081825.1654-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907081825.1654-1-narmstrong@baylibre.com>
References: <20200907081825.1654-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Amlogic AXG SoC family has a downgraded VPU supporting only MIPI-DSI output
after it's ENCL DPI encoder output.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/display/amlogic,meson-vpu.yaml   | 36 +++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index a8d202c9d004..e2e7d99d8ace 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -31,8 +31,10 @@ description: |
 
   The Video Input Unit is in charge of the pixel scanout from the DDR memory.
   It fetches the frames addresses, stride and parameters from the "Canvas" memory.
+  On the AXG family, the Video Input Unit direclty reads from DDR memory.
   This part is also in charge of the CSC (Colorspace Conversion).
   It can handle 2 OSD Planes and 2 Video Planes.
+  On the AXG family, only a single OSD plane without scalins is supported.
 
   VPP: Video Post Processing
   --------------------------
@@ -49,11 +51,13 @@ description: |
   The VENC is composed of the multiple pixel encoders
    - ENCI : Interlace Video encoder for CVBS and Interlace HDMI
    - ENCP : Progressive Video Encoder for HDMI
-   - ENCL : LCD LVDS Encoder
+   - ENCL : LCD DPI Encoder
   The VENC Unit gets a Pixel Clocks (VCLK) from a dedicated HDMI PLL and clock
   tree and provides the scanout clock to the VPP and VIU.
   The ENCI is connected to a single VDAC for Composite Output.
   The ENCI and ENCP are connected to an on-chip HDMI Transceiver.
+  On the AXG and G12A family, the ENCL is connected to a DPI-to-DSI
+  transceiver.
 
 properties:
   compatible:
@@ -65,6 +69,7 @@ properties:
               - amlogic,meson-gxm-vpu # GXM (S912)
           - const: amlogic,meson-gx-vpu
       - enum:
+          - amlogic,meson-axg-vpu # AXG (A113D, A113X)
           - amlogic,meson-g12a-vpu # G12A (S905X2, S905Y2, S905D2)
 
   reg:
@@ -92,6 +97,11 @@ properties:
     description:
       A port node pointing to the HDMI-TX port node.
 
+  port@2:
+    type: object
+    description:
+      A port node pointing to the DPI port node.
+
   "#address-cells":
     const: 1
 
@@ -102,11 +112,31 @@ required:
   - compatible
   - reg
   - interrupts
-  - port@0
-  - port@1
   - "#address-cells"
   - "#size-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-gx-vpu
+            - amlogic,meson-g12a-vpu
+
+    then:
+      required:
+        - port@0
+        - port@1
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-axg-vpu
+
+    then:
+      required:
+        - port@2
+
 additionalProperties: false
 
 examples:
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
