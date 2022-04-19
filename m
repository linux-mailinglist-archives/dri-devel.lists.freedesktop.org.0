Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25FF507C1B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 23:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDC089D4D;
	Tue, 19 Apr 2022 21:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DCA89D4D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 21:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650404915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tOWD5uHxwjIw4P4KTgLk1c7Fc4yJRbBCDK06WY08/Ts=;
 b=XPXvOcao8ddqjDu7RFQp8BUJSLv3F8jqzUp8NXzanMb+sW+meve3J7JCxMc8jY/k+6PBfr
 p0w5BBuzC2k1FojAR2Rl+PzSCP/yHzT5/T5bJs95Ie0ZIcOoGWHIhki4KkAHFiNOLBKz0C
 zwDwQZo+/J7MWct+1Oz4ELl3p3EMRDI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-ApnAtYP8MVO_l3SuMV1c7g-1; Tue, 19 Apr 2022 17:48:34 -0400
X-MC-Unique: ApnAtYP8MVO_l3SuMV1c7g-1
Received: by mail-wm1-f71.google.com with SMTP id
 y11-20020a7bc18b000000b0038eac019fc0so6503wmi.9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 14:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tOWD5uHxwjIw4P4KTgLk1c7Fc4yJRbBCDK06WY08/Ts=;
 b=N0N+bgyubplVDWvcU+UUAS2PTjHkT8zJ9xZCNYl5NYvDjBi27u8XunmHD2EMKxFwXR
 EF4rPR7JE7vflq/ME7Ovpyd9dqQS0nWvhjtfJsMi+SvXiKDOW2WzW4j0uagaAB1BrYGn
 ahMWq2yxT4VPUow6+TcngYHzMvIsuSwzktPJxyhwXSDk87W7SxDXB3LOaME73Ezk0rx3
 nSYH9MZJHNCd7haWIshUxJxclIo4+fKq8aSl/otm64nqr3r7FSK3eo84RnDQO6RdoXzq
 m6l4Iywkp4mD3ZsljjUer4hZX/lGCeFs/oIItXmyKFKhoF1JWuKxxtY0AwRripObQHk6
 mRHQ==
X-Gm-Message-State: AOAM530bs1qqgATCKXLwjoT/O9X1d7KR8tdqUsLGG3QcyGvwub1aocLd
 wQRvab+A3gF+vtWUu37Ph5xjWpDWOFcmu93l3zlM4gC1yE8v39x0SVLHXhu7ZDVsZMKuesgRHAC
 85rnxoz3F/3yhZwwFyCj1PVZeMAdf
X-Received: by 2002:a5d:4e4c:0:b0:207:a883:cf3a with SMTP id
 r12-20020a5d4e4c000000b00207a883cf3amr13440363wrt.534.1650404912799; 
 Tue, 19 Apr 2022 14:48:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtK/nKbkXvYZOyVAfoxwqPAU4d5VNvQn2+OPjUudoKqzOB3izC+Q3htlXoreIBc6gm8H2luw==
X-Received: by 2002:a5d:4e4c:0:b0:207:a883:cf3a with SMTP id
 r12-20020a5d4e4c000000b00207a883cf3amr13440351wrt.534.1650404912596; 
 Tue, 19 Apr 2022 14:48:32 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a5d5587000000b00207a8cde900sm13333699wrv.19.2022.04.19.14.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 14:48:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/5] dt-bindings: display: ssd1307fb: Extend schema for SPI
 controllers
Date: Tue, 19 Apr 2022 23:48:20 +0200
Message-Id: <20220419214824.335075-3-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419214824.335075-1-javierm@redhat.com>
References: <20220419214824.335075-1-javierm@redhat.com>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Solomon SSD130x OLED displays can either have an I2C or SPI interface,
add to the schema the properties and examples for OLED devices under SPI.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

(no changes since v4)

Changes in v4:
- Add a description for the dc-gpios property for SPI (Geert Uytterhoeven)

Changes in v3:
- Add a comment to the properties required for SPI (Geert Uytterhoeven)

Changes in v2:
- Don't add compatible strings with an "-spi" suffix (Geert Uytterhoeven)

 .../bindings/display/solomon,ssd1307fb.yaml   | 42 ++++++++++++++++++-
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index 7653b6c3fcb6..3fbd87c2c120 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -38,9 +38,20 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  # Only required for SPI
+  dc-gpios:
+    description:
+      GPIO connected to the controller's D/C# (Data/Command) pin,
+      that is needed for 4-wire SPI to tell the controller if the
+      data sent is for a command register or the display data RAM
+    maxItems: 1
+
   vbat-supply:
     description: The supply for VBAT
 
+  # Only required for SPI
+  spi-max-frequency: true
+
   solomon,height:
     $ref: /schemas/types.yaml#/definitions/uint32
     default: 16
@@ -220,14 +231,14 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-            ssd1307: oled@3c {
+            ssd1307_i2c: oled@3c {
                     compatible = "solomon,ssd1307";
                     reg = <0x3c>;
                     pwms = <&pwm 4 3000>;
                     reset-gpios = <&gpio2 7>;
             };
 
-            ssd1306: oled@3d {
+            ssd1306_i2c: oled@3d {
                     compatible = "solomon,ssd1306";
                     reg = <0x3c>;
                     pwms = <&pwm 4 3000>;
@@ -238,3 +249,30 @@ examples:
                     solomon,lookup-table = /bits/ 8 <0x3f 0x3f 0x3f 0x3f>;
             };
     };
+  - |
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ssd1307_spi: oled@0 {
+                    compatible = "solomon,ssd1307";
+                    reg = <0x0>;
+                    pwms = <&pwm 4 3000>;
+                    reset-gpios = <&gpio2 7>;
+                    dc-gpios = <&gpio2 8>;
+                    spi-max-frequency = <10000000>;
+            };
+
+            ssd1306_spi: oled@1 {
+                    compatible = "solomon,ssd1306";
+                    reg = <0x1>;
+                    pwms = <&pwm 4 3000>;
+                    reset-gpios = <&gpio2 7>;
+                    dc-gpios = <&gpio2 8>;
+                    spi-max-frequency = <10000000>;
+                    solomon,com-lrremap;
+                    solomon,com-invdir;
+                    solomon,com-offset = <32>;
+                    solomon,lookup-table = /bits/ 8 <0x3f 0x3f 0x3f 0x3f>;
+            };
+    };
-- 
2.35.1

