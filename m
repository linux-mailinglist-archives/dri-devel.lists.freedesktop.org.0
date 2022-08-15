Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0108592B18
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 11:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043D0B063F;
	Mon, 15 Aug 2022 09:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C7E112CB5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 09:02:18 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id 17so5850209plj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=jAsfJ+1Mj231OgXM143U7NPHPGk8lg/9nj5rbtDQosU=;
 b=WZ7JCEDfOCy3EQc5zn+wa2S43ThV6A5Z+pXUm6y6i/JVlAKwcpmswgci9bKG6Tto0s
 R1ATcrJysD9d/BYkcsdmTjMU5H9nBlu9VxBkly86fZF+5sJpeCDliZcdf+4+iWYDlXkM
 aUCwf7twuGPYRbkgqG0cHysxXNgC1ytMhfnlCGVzgcNgClELvHpR1w6ZBchctvbmu+jS
 6g+SuWzKgvUyNZ/klrYsx6R+BYTuSnvKMuIeQYRs+h2aIU1KA3unKUNEBJ/v5fRDIJ5s
 O8qXrbCZ9RiEUqx485ArryjaPy7bDd+4mQOQDsDQRAicC5W9Tljyw/aKLA6v9wkpTH12
 s9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=jAsfJ+1Mj231OgXM143U7NPHPGk8lg/9nj5rbtDQosU=;
 b=m/9IZ1Sp3xlg9v8ZO0UzFDq4wfTngsnPuCTdNg3CgJEoERNdZR1t6gayfwgPk5P68o
 DPBQR+F/uVSJp5GDcfTsaJEW0RDCZU8BjQxA+pc09KsEGw7lQzx6l9J0FHTuqnWNAK9W
 VHreeFbQVzo0InjHmh4PbW+XXC40/6Fg3CRuBPCFPNDncuseEQ2Ru5AYLv4qLxfWHqeA
 Ji8x/yhTSIx2Jmz2UZ+EbXKY3lD/Pjh0EsonSKdYiMEfPCK4n4pduiInZksgZ6pRrVYD
 /TNSsY7fmGIsRQW5jb1mTyeXYw7znppEKNbGEc751zY2q5njbQNLGZO7JtIQcyxl4EbQ
 OmVw==
X-Gm-Message-State: ACgBeo0LEqtTJl61DZQLKbaWtC4Bj5mWucaXBIdTzw85S8Yyv3PjpJZ4
 GHdWqk6X+7NdzHkWGu8FZL4=
X-Google-Smtp-Source: AA6agR5dIpLJZek/MOUWkP2ReJX+eAO+AT8j8pByvCyU/tbsfvLHdxFvGlojO+1yfFH1nCHoON9fTQ==
X-Received: by 2002:a17:903:264f:b0:16f:8435:d9a8 with SMTP id
 je15-20020a170903264f00b0016f8435d9a8mr16300638plb.112.1660554138279; 
 Mon, 15 Aug 2022 02:02:18 -0700 (PDT)
Received: from DESKTOP-IBN2BAQ.localdomain ([123.110.155.185])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a656411000000b00412a708f38asm5491612pgv.35.2022.08.15.02.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 02:02:18 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com, deller@gmx.de,
 broonie@kernel.org, mazziesaccount@gmail.com, lgirdwood@gmail.com,
 andriy.shevchenko@linux.intel.com
Subject: [RESEND v8 04/12] dt-bindings: leds: Add MediaTek MT6370 flashlight
Date: Mon, 15 Aug 2022 17:01:17 +0800
Message-Id: <20220815090125.27705-5-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090125.27705-1-peterwu.pub@gmail.com>
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 chiaen_wu@richtek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alice Chen <alice_chen@richtek.com>

Add MediaTek MT6370 flashlight binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alice Chen <alice_chen@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../leds/mediatek,mt6370-flashlight.yaml      | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
new file mode 100644
index 000000000000..e9d02ed6a590
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-flashlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 flash LED driver include 2-channel flash LED support Torch/Strobe Mode.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-flashlight
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1]
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.34.1

