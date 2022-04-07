Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 456544F8841
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 22:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31DB10EEA0;
	Thu,  7 Apr 2022 20:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BAE10EE9F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 20:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649361782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ujVDZk4U6RzShQ/rIDRVpIv+f7MFQZhzBrH2NX9HlA=;
 b=a4a4l2ebCwkBUg3kDCMazV7h9MjfDXikQsZNeDgx9v1SgNmyXVfDg8lHOPFCSLALHhOdaP
 iNxzlGeHUa/NtFHZP+QKfmZqx64Em+rytiPT3yyAN6nHusDlkJLsJvL+TSFAY5RYorIIj4
 69Ga7Wv4afEV7Efwx5Lg5qrygSVxudA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-jkGJ7QdzMdWrLnsS3_E_tw-1; Thu, 07 Apr 2022 16:03:01 -0400
X-MC-Unique: jkGJ7QdzMdWrLnsS3_E_tw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r6-20020a05600c35c600b0038e6db5da9cso1763386wmq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 13:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ujVDZk4U6RzShQ/rIDRVpIv+f7MFQZhzBrH2NX9HlA=;
 b=8BE1oa4Nlgq4qR7k+Mg2L4JPQKHN/pr3GDyowTijLOOjqW3auJ8eBS3ebh9CKbjvol
 ALCzKIK4G+jr0E6BXVfpeO3cWdt4dMxIEui+Br1AeUHoVnXMRWsKe7JpsuybZQ3ngVYF
 HDV2qr8xVNoJdKkBjPzg2/UAV5Bsg/PlFXRQKmT5+S2KCAfqdQGQzMH0HenLv+KATlV+
 guLm7t8uUyXUDT8cpTEm8J/TJyfiVrulxhelt3lYHQtaqFYc7pf0FH5ODRhce3vcfCl3
 znZTCrfXx4s6i3tpP1vK44EM6L/+9eETQ9jV1ZdnWvjvoD/ezMsSBjtMa/Z07mEr2ALv
 fHWA==
X-Gm-Message-State: AOAM5316XnjaSSAdRl4ofgWUzUiEEOKVIDOCsxzgBSIiAV2FufmlCTkM
 C/84EnSXiqTZN/MwcZEPhsyDHd0s43WvcwQTS5nM5cgiC4HrEOqAYWnbynfGPL7EjEE40v0/GNy
 K/CeCWcTcpJIHrYz2uCIlUVUGWF5r
X-Received: by 2002:a7b:cd1a:0:b0:38c:720a:a123 with SMTP id
 f26-20020a7bcd1a000000b0038c720aa123mr13899246wmj.5.1649361779740; 
 Thu, 07 Apr 2022 13:02:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVyONRQEvtL645zP8TFrYruvkYYBDs16vpp3BQmLOliyy4X90HgJIz+51Rgv9qnGmJHkP1ig==
X-Received: by 2002:a7b:cd1a:0:b0:38c:720a:a123 with SMTP id
 f26-20020a7bcd1a000000b0038c720aa123mr13899228wmj.5.1649361779545; 
 Thu, 07 Apr 2022 13:02:59 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a0560001a8f00b002078f74ccd2sm1048712wry.36.2022.04.07.13.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 13:02:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: display: ssd1307fb: Deprecate fbdev
 compatible strings
Date: Thu,  7 Apr 2022 22:02:00 +0200
Message-Id: <20220407200205.28838-2-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407200205.28838-1-javierm@redhat.com>
References: <20220407200205.28838-1-javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>,
 David Airlie <airlied@linux.ie>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current compatible strings for SSD130x I2C controllers contain an -fb
suffix, this seems to indicate that are for a fbdev driver. But the DT is
supposed to describe the hardware and not Linux implementation details.

Let's deprecate those compatible strings and add a new enum that contains
compatible strings that don't have a -fb suffix. These will be matched by
the ssd130x-i2c DRM driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../bindings/display/solomon,ssd1307fb.yaml   | 36 ++++++++++++-------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index ade61d502edd..46207f2c12b8 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -12,12 +12,24 @@ maintainers:
 
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
+
+      # SSD130x I2C controllers
+      - items:
+          - enum:
+              - sinowealth,sh1106-i2c
+              - solomon,ssd1305-i2c
+              - solomon,ssd1306-i2c
+              - solomon,ssd1307-i2c
+              - solomon,ssd1309-i2c
 
   reg:
     maxItems: 1
@@ -148,7 +160,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: solomon,ssd1305fb-i2c
+            const: solomon,ssd1305-i2c
     then:
       properties:
         solomon,dclk-div:
@@ -160,7 +172,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: solomon,ssd1306fb-i2c
+            const: solomon,ssd1306-i2c
     then:
       properties:
         solomon,dclk-div:
@@ -172,7 +184,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: solomon,ssd1307fb-i2c
+            const: solomon,ssd1307-i2c
     then:
       properties:
         solomon,dclk-div:
@@ -186,7 +198,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: solomon,ssd1309fb-i2c
+            const: solomon,ssd1309-i2c
     then:
       properties:
         solomon,dclk-div:
@@ -203,14 +215,14 @@ examples:
             #size-cells = <0>;
 
             ssd1307: oled@3c {
-                    compatible = "solomon,ssd1307fb-i2c";
+                    compatible = "solomon,ssd1307-i2c";
                     reg = <0x3c>;
                     pwms = <&pwm 4 3000>;
                     reset-gpios = <&gpio2 7>;
             };
 
             ssd1306: oled@3d {
-                    compatible = "solomon,ssd1306fb-i2c";
+                    compatible = "solomon,ssd1306-i2c";
                     reg = <0x3c>;
                     pwms = <&pwm 4 3000>;
                     reset-gpios = <&gpio2 7>;
-- 
2.35.1

