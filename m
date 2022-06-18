Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FD455047D
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 14:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2E010E5D7;
	Sat, 18 Jun 2022 12:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DB510E5D7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 12:32:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e25so4939251wrc.13
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wA+ekkpjde0Zx9cXanks0YsUmdtDvWig/ia7r5xRwsg=;
 b=NLP+j4VvWO4pMdDxz+jP2qakHnxjIhWDW5IcIZ6iTjVuR6PvXGlfRvScvAs6fv4LGC
 tVHzVYgFUHCv1IRJ4Ht4KdNVLD+jSSS5h4H+avCrhP5W5KXZfsniSNzQaIy0Vmjf7cJe
 1JtCXoeodTgNGx3zxBouJNSTU+BRjTFYSAg0N4jBQrfeC5wyTPkZscKwWYLFzG+dbNUH
 VQDUJvWUJkk/fS8UHWuapx2oX/lVLREXGX91trMzLN+PvRD1VA55gaBikAJhJXd6EtNJ
 TXtuW3AI8LcIC7NdxtxNMfIR5WAfMQnhkZScOGuGAVa6FafYwFTfgLXwxWgUJlRmcjG8
 FuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wA+ekkpjde0Zx9cXanks0YsUmdtDvWig/ia7r5xRwsg=;
 b=W8Cw87gfdZeVxBJ3kIR1bUo/unptrVlaL17lL/lNaFj4H0ddoB1LTnrNJHBjU0YBQ8
 gCm5iGiOjBdqMo7jWzLgHpMsDMRYkK/d+aiMKmYPZjCn8uyaaIdxTULSSF0g1te96ldd
 5Z9FmNxN2yByR3B7hu56echq/90kQnCPUIF/OfW+gIfUBAV5hsaocEHIz9BVmVePG4Uw
 /PjaUt+NjnXao1EkqDGB9w+SVICN/bKBkprVqoZAEPd0kePiauePK34Wt6qBvGnynn2C
 2hDnN+VJZFmgbxfvA/iPfq8lOJ3zgJ0aJpQkJavslz7q5lk5k1mW7qvbORh4gYvrg/T0
 Q+Sg==
X-Gm-Message-State: AJIora+ld5gQNNU3L2xanr1pavguZ0V8IkCvDpGLVlZtQW1+fxXJt7MT
 aIwBY7dCRTGgfFmdwOEL0nLAHQ==
X-Google-Smtp-Source: AGRyM1uabX5izdogY/5f2icOXRBDHwfiqcRqU22eeMbzZR7yfphBy2Stjoi6dvehhY38C8EymhY+dA==
X-Received: by 2002:adf:ef52:0:b0:21b:81e8:5d0b with SMTP id
 c18-20020adfef52000000b0021b81e85d0bmr6154762wrp.502.1655555522853; 
 Sat, 18 Jun 2022 05:32:02 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 05:32:02 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 02/14] dt-bindings: display: panel: allow ilitek,
 ili9341 in isolation
Date: Sat, 18 Jun 2022 13:30:24 +0100
Message-Id: <20220618123035.563070-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
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
Cc: linux-riscv@lists.infradead.org, Niklas Cassel <niklas.cassel@wdc.com>,
 alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 dmaengine@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Dillon Min <dillon.minfei@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

The dt-binding for the ilitek,ili9341 does not allow it to be used as a
compatible in isolation. This generates a warning for the Canaan kd233
devicetree:
arch/riscv/boot/dts/canaan/canaan_kd233.dtb: panel@0: compatible:0: 'ilitek,ili9341' is not one of ['st,sf-tc240t-9370-t']
        From schema: Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
arch/riscv/boot/dts/canaan/canaan_kd233.dtb: panel@0: compatible: ['ilitek,ili9341'] is too short
        From schema: Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
Allow ilitek,ili9341 to be selected in isolation.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/display/panel/ilitek,ili9341.yaml     | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
index 94ca92878434..c402bedaa37a 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -19,12 +19,14 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          # ili9341 240*320 Color on stm32f429-disco board
-          - st,sf-tc240t-9370-t
-          - adafruit,yx240qv29
-      - const: ilitek,ili9341
+    oneOf:
+      - items:
+          - const: ilitek,ili9341
+      - items:
+          - enum:
+              - st,sf-tc240t-9370-t
+              - adafruit,yx240qv29
+          - const: ilitek,ili9341
 
   reg: true
 
-- 
2.36.1

