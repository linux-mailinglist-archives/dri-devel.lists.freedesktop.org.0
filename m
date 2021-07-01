Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE6D3B983F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 23:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DCE6EC0C;
	Thu,  1 Jul 2021 21:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70F06EC0C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 21:38:22 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id w11so10560229ljh.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jul 2021 14:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QiNn8WEhtCBIq1rsfM6PoISeVVaGraw5Z7kWHh+wx5o=;
 b=JqmwLN2M2erNRkHR+GXtJfvqyKLZCwbSMepixBsR2CIDgF8LoS6jgUdesNvivpmlmq
 HkhlQCEarlKUijpESJEUmIvl0MYHstzrIDlJ63kIb230fuohVlE//5H2osICvaNprZTA
 D0XC/c9ako4ddjeCiyqk3BJ88SY529kbayITCcbhDIC/BQBLjWznrtF+5XIIRpfC150n
 fSvl75+pomMtvRMAsk5y1dYmKYb9UDGpNBptVkYCBigxqWkrejI7kZFWBtgwwm8IgBq3
 wE5x8dKGaO8R4S6sPbVTj6s/D4vS4CIbjMOphhpLq3UjPJ6Xypem7H08cGz3SxCfLSjf
 4ArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QiNn8WEhtCBIq1rsfM6PoISeVVaGraw5Z7kWHh+wx5o=;
 b=EJbaSpJjaKwJJC1qLfAkpN0LpqX3RZe2H53RAK5jGO8aFCq0/3nfAN7qTmLePxcbJj
 zK0DXgRWGB79n/JVEfhk50zPgHS4ZaCeJLifv7knE8WN5cWKS49eKvK4hiMkewCjBLYF
 1JMfxwSNYTj2OYGp3gVu3TpYgpmf5u4ki/wiJBkd5CedZEUskGAFt80F2sXvJsvQZU60
 rHPdcNiqDQP5xJDte2pSFin2T7Ml0poI9XRVZ1zeFfsY5ekEohAfTVFYyaAEMpXQRVVL
 VjyVgYTm1fIa5mmgvLuPBFvJP2TnXavlGGUClg6F7H+LYcjCHCo0+EutC15580gKf+Y5
 Gu1g==
X-Gm-Message-State: AOAM530rhqMIKg2qYGr+w1qnK9Lf06WZphRic9fwUCgDTMwFJ4fqbie1
 yVHZ6WJCO2Si9cpFLdUxm2sarw==
X-Google-Smtp-Source: ABdhPJxKSdwxg0SzbXr+B8xUxCSKmlJMTm1pbvTFWn5twYlTEE9rwrRIT9RFDou0o0sZwpudYNqmew==
X-Received: by 2002:a2e:a276:: with SMTP id k22mr1148638ljm.465.1625175501296; 
 Thu, 01 Jul 2021 14:38:21 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id b5sm81131lfv.3.2021.07.01.14.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 14:38:20 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: Fix up DT bindings for Samsung lms397kf04
Date: Thu,  1 Jul 2021 23:36:18 +0200
Message-Id: <20210701213618.3818821-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Improve the bindings and make them more usable:

- Pick in spi-cpha and spi-cpol from the SPI node parent,
  this will specify that we are "type 3" in the device tree
  rather than hardcoding it in the operating system.
- Drop the u32 ref from the SPI frequency: comes in from
  the SPI host bindings.
- Make spi-cpha, spi-cpol and port compulsory.
- Update the example with a real-world SPI controller,
  spi-gpio.

Cc: Douglas Anderson <dianders@chromium.org>
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../display/panel/samsung,lms397kf04.yaml      | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml b/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
index 4cb75a5f2e3a..cd62968426fb 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml
@@ -33,8 +33,11 @@ properties:
 
   backlight: true
 
+  spi-cpha: true
+
+  spi-cpol: true
+
   spi-max-frequency:
-    $ref: /schemas/types.yaml#/definitions/uint32
     description: inherited as a SPI client node, the datasheet specifies
       maximum 300 ns minimum cycle which gives around 3 MHz max frequency
     maximum: 3000000
@@ -44,6 +47,9 @@ properties:
 required:
   - compatible
   - reg
+  - spi-cpha
+  - spi-cpol
+  - port
 
 additionalProperties: false
 
@@ -52,15 +58,23 @@ examples:
     #include <dt-bindings/gpio/gpio.h>
 
     spi {
+      compatible = "spi-gpio";
+      sck-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+      miso-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+      mosi-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
+      cs-gpios = <&gpio 3 GPIO_ACTIVE_HIGH>;
+      num-chipselects = <1>;
       #address-cells = <1>;
       #size-cells = <0>;
       panel@0 {
         compatible = "samsung,lms397kf04";
         spi-max-frequency = <3000000>;
+        spi-cpha;
+        spi-cpol;
         reg = <0>;
         vci-supply = <&lcd_3v0_reg>;
         vccio-supply = <&lcd_1v8_reg>;
-        reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
+        reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
         backlight = <&ktd259>;
 
         port {
-- 
2.31.1

