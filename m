Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7404FFB21
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 18:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326E410E536;
	Wed, 13 Apr 2022 16:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC5C10E536
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 16:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649867062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ao+QLGVykP8whEqJzniS6nnN6H0GlmSyDd2RtpQtg0Q=;
 b=NPCfM5KqNMEXXDxgQ5xdnBdvNddQeGGlOJXkkH5n6HB+SQeH/ToAHY4RzPu21F03XlTVD2
 /59Z555jGxEmTkQF+ZEzYMxWmpt7W/SHw9t0xxVizIMzjUabdbehP1BDNHDURXe3uRcFql
 R1YFDSUtJTx7WSCCIWlb7x9uzozYL1o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-JBP4jXplOMig71-6Ca_pFw-1; Wed, 13 Apr 2022 12:24:21 -0400
X-MC-Unique: JBP4jXplOMig71-6Ca_pFw-1
Received: by mail-wr1-f72.google.com with SMTP id
 s8-20020adfc548000000b00207a28e0583so504903wrf.23
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ao+QLGVykP8whEqJzniS6nnN6H0GlmSyDd2RtpQtg0Q=;
 b=xWhJyoQOal4NMXDwoOlfSY9Y/DUfe2xd7LQRcP5nzFaJGlMb2zrh14tTrRGWvIzSZS
 PiAo0wmvr2BRKkfKoaqgwyutNmkbmYPkQ6NDA83olSz4r//MJgUesaThU9srm5j+oFNv
 71phekYFzThxHZ74eU6Z56ZZdWvO/i4Y7wpzcZ7KhKsLZF4fHMldssQUFBO7ZrKQZhcX
 zd5JFR9TAJsajqRP8oMsc3Jxau5udfEYpgaDWlQejuMRxIGB46JvomTD/g2ojV8Gi8Oh
 hxRxcpp2hz9P1q7U1tsnJe4tXIORuZLsZKCJ7RdVLM9on5fhwkt4At00xnkR/Pgfp6XR
 N3kA==
X-Gm-Message-State: AOAM533dWc3sWnZGbqDFphfURkKh7gt7bg3OPkmh+2UKMoOiGsYRlAQ1
 nDk4zktwHZ4pqI+Mey6zqGtSTjahOC6maTsfQlD3L6GmP8Ub4RCeOF8Q0HDlkcjdkbHBPhFh2Jw
 JGpMRezUyCvQkYBfupYLuSGr4D9F9
X-Received: by 2002:a05:600c:1c1f:b0:38e:c425:5b1a with SMTP id
 j31-20020a05600c1c1f00b0038ec4255b1amr9406089wms.69.1649867060399; 
 Wed, 13 Apr 2022 09:24:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztW50EuLGrFp4OqBMvgmg4aBfvttQJcfps4djZfXBpZPbWUvbcwrvp9RGGBXzqwCY7Wlu6aQ==
X-Received: by 2002:a05:600c:1c1f:b0:38e:c425:5b1a with SMTP id
 j31-20020a05600c1c1f00b0038ec4255b1amr9406070wms.69.1649867060173; 
 Wed, 13 Apr 2022 09:24:20 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfa2c9000000b002061561d4a7sm25446096wra.96.2022.04.13.09.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 09:24:19 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] dt-bindings: display: ssd1307fb: Deprecate "-i2c"
 compatible strings
Date: Wed, 13 Apr 2022 18:23:54 +0200
Message-Id: <20220413162359.325021-2-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413162359.325021-1-javierm@redhat.com>
References: <20220413162359.325021-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Chen-Yu Tsai <wens@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current compatible strings for SSD130x I2C controllers contain both an
"fb" and "-i2c" suffixes. It seems to indicate that are for a fbdev driver
and also that are for devices that can be accessed over an I2C bus.

But a DT is supposed to describe the hardware and not Linux implementation
details. So let's deprecate those compatible strings and add new ones that
only contain the vendor and device name, without any of these suffixes.

These will just describe the device and can be matched by both I2C and SPI
DRM drivers. The required properties should still be enforced for old ones.

While being there, just drop the "sinowealth,sh1106-i2c" compatible string
since that was never present in a released Linux version.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

(no changes since v3)

Changes in v3:
- Drop the "sinowealth,sh1106-i2c", wasn't in a released version (Chen-Yu Tsai)
- Continue enforcing required properties for deprecated strings (Maxime Ripard)

Changes in v2:
- Drop the -i2c suffixes from the compatible strings too (Geert Uytterhoeven)

 .../bindings/display/solomon,ssd1307fb.yaml   | 44 +++++++++++++------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index ade61d502edd..7653b6c3fcb6 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -12,12 +12,22 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - sinowealth,sh1106-i2c
-      - solomon,ssd1305fb-i2c
-      - solomon,ssd1306fb-i2c
-      - solomon,ssd1307fb-i2c
-      - solomon,ssd1309fb-i2c
+    oneOf:
+      # Deprecated compatible strings
+      - items:
+          - enum:
+              - solomon,ssd1305fb-i2c
+              - solomon,ssd1306fb-i2c
+              - solomon,ssd1307fb-i2c
+              - solomon,ssd1309fb-i2c
+        deprecated: true
+      - items:
+          - enum:
+              - sinowealth,sh1106
+              - solomon,ssd1305
+              - solomon,ssd1306
+              - solomon,ssd1307
+              - solomon,ssd1309
 
   reg:
     maxItems: 1
@@ -136,7 +146,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: sinowealth,sh1106-i2c
+            const: sinowealth,sh1106
     then:
       properties:
         solomon,dclk-div:
@@ -148,7 +158,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: solomon,ssd1305fb-i2c
+            enum:
+              - solomon,ssd1305-i2c
+              - solomon,ssd1305
     then:
       properties:
         solomon,dclk-div:
@@ -160,7 +172,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: solomon,ssd1306fb-i2c
+            enum:
+              - solomon,ssd1306-i2c
+              - solomon,ssd1306
     then:
       properties:
         solomon,dclk-div:
@@ -172,7 +186,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: solomon,ssd1307fb-i2c
+            enum:
+              - solomon,ssd1307-i2c
+              - solomon,ssd1307
     then:
       properties:
         solomon,dclk-div:
@@ -186,7 +202,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: solomon,ssd1309fb-i2c
+            enum:
+              - solomon,ssd1309-i2c
+              - solomon,ssd1309
     then:
       properties:
         solomon,dclk-div:
@@ -203,14 +221,14 @@ examples:
             #size-cells = <0>;
 
             ssd1307: oled@3c {
-                    compatible = "solomon,ssd1307fb-i2c";
+                    compatible = "solomon,ssd1307";
                     reg = <0x3c>;
                     pwms = <&pwm 4 3000>;
                     reset-gpios = <&gpio2 7>;
             };
 
             ssd1306: oled@3d {
-                    compatible = "solomon,ssd1306fb-i2c";
+                    compatible = "solomon,ssd1306";
                     reg = <0x3c>;
                     pwms = <&pwm 4 3000>;
                     reset-gpios = <&gpio2 7>;
-- 
2.35.1

