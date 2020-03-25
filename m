Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7655193354
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 23:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95526E842;
	Wed, 25 Mar 2020 22:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAEE6E842
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 22:05:47 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id e8so3452215ilc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 15:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Ulr9pBC4SUbqUU5FsVEbaY1gpVe/0DQ9QLWI1PPgfQ=;
 b=Fn+iUHcF+wuU0+r2j3BFmcJoaUFX+1u4hJM1Ahx7PTlCjnnOgQjDy3BN5guB16Jrul
 D9jANmlzdsuC50zDalJ+CAXXXSd4Ix9aQqD+/hQSEEE14x4wXXJ4ofRmfrAxWZp8CkW+
 JlJnJKfqWKsQ1+xiMViJiUvjzNBGqET/eIWj81fR0ibePRXK2MRmyJyFO7+SF3yKjdKA
 ME7hXY8jlHeMdr43VECDEgCImbq8SUEX8DT4MmSg37y91+jVvvMKWrkxRgvWhny/aYnf
 yCntETil1aIw3aJd90PeAOafzN43zja4S6kvOAMLohFG/sBmF5n/h4b9SJVS1yOyNatA
 HlXQ==
X-Gm-Message-State: ANhLgQ3Ov6EtOecO4nJKXgbLi/sce1RgsCjU5U52w7WgMDa21BpXKRAW
 +w8v71oRh9x5OUXM6w1mCw==
X-Google-Smtp-Source: ADFU+vue8Vxmky7PF9etOIHQcfy9dQqZ6AbqyS9J6TatHClhkfnl2UGT86/bcc6UGlxsmE61Cop/rw==
X-Received: by 2002:a92:6e11:: with SMTP id j17mr5689060ilc.249.1585173946547; 
 Wed, 25 Mar 2020 15:05:46 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.250])
 by smtp.googlemail.com with ESMTPSA id v8sm102390ioh.40.2020.03.25.15.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 15:05:45 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: iio/accel: Drop duplicate adi,
 adxl345/6 from trivial-devices.yaml
Date: Wed, 25 Mar 2020 16:05:38 -0600
Message-Id: <20200325220542.19189-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325220542.19189-1-robh@kernel.org>
References: <20200325220542.19189-1-robh@kernel.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 Michael Hennerich <michael.hennerich@analog.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hartmut Knaack <knaack.h@gmx.de>, linux-media@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 'adi,adxl345' definition is a duplicate as there's a full binding in:
Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml

The trivial-devices binding doesn't capture that 'adi,adxl346' has a
fallback compatible 'adi,adxl345', so let's add it to adi,adxl345.yaml.

Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/iio/accel/adi,adxl345.yaml     | 10 +++++++---
 Documentation/devicetree/bindings/trivial-devices.yaml |  4 ----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
index c602b6fe1c0c..d124eba1ce54 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
@@ -17,9 +17,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - adi,adxl345
-      - adi,adxl375
+    oneOf:
+      - items:
+          - const: adi,adxl346
+          - const: adi,adxl345
+      - enum:
+          - adi,adxl345
+          - adi,adxl375
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 978de7d37c66..51d1f6e43c02 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -42,10 +42,6 @@ properties:
           - adi,adt7476
             # +/-1C TDM Extended Temp Range I.C
           - adi,adt7490
-            # Three-Axis Digital Accelerometer
-          - adi,adxl345
-            # Three-Axis Digital Accelerometer (backward-compatibility value "adi,adxl345" must be listed too)
-          - adi,adxl346
             # AMS iAQ-Core VOC Sensor
           - ams,iaq-core
             # i2c serial eeprom  (24cxx)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
