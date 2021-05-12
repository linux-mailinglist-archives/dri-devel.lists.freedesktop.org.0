Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D537C3B5
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 17:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4EF6EC38;
	Wed, 12 May 2021 15:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590EC6EC38
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 15:21:53 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id c13so5326500pfv.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 08:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=c+foEbP8Ys0eNzGlzMVThZeYcnahn6T/Ka4KBWcvRdQ=;
 b=lsGoymjiuS8L1lqR1iF+HwlhNFwKfefBsVn5YYo4Ajpr5LNOpOQecnoI6X/UmpoSPN
 ryQ7BaDlF/YV7tR6x+8dddCNmG19qGAbm6fyFd1CVFAWNI5Otxkrl7X5bW3FfD9XWTu/
 gppA3716+TvDZGW3TGbRl6FDsrzMZmwIFxFOwwZhB++mRR+K1pD0//bCdq7TkfiLCCVs
 D15i/yHywgOW3IKqTS0rh5AfMTZ/5bm8wDhLexxa0gtsh+XAxmKFucweRW5zg2oHBQQ9
 EitiBMJEhcUG5hlwWYslgIeILK8EPO8KtN+XftNTAMwgp907Az18o2UloRCaLsQYgFx9
 XNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=c+foEbP8Ys0eNzGlzMVThZeYcnahn6T/Ka4KBWcvRdQ=;
 b=sMn2yT90pg7fRign9iHQXe3fTbuBg/33SqaPgCAw0gnSwJX62INkz+x4psldbpBWdd
 oYK0CJ0lx0U5eNKvs7AjfMiaIaJp61MGQg+WdSvV5NePZix5jpQoCphNw78EaO4yzP3r
 CDTWCnG4Fr/F1otmEGjrgwui/j1j8fkyTihqiWeivZsVJ0uCLKnDn0D5lboXBAudnjTL
 lc41kUf47U1DZHnbNPb+AwfAMpyuJCLHWynZsznd6h0YlxH71zSWuQ6g3YDF0FLpk1xm
 EjltCs5vz5xEZnlV1WKQMt9fNjdIRBrwqjG+S1JzMPHcqqQFSZYHT5K+Snr4Wb6W2vlq
 OK+A==
X-Gm-Message-State: AOAM5329/xC9oclVgPO5ljKhRleFyApwWbxsir6gqsE12qtkECzsOxqw
 NvjRFdyQLm30KPpzByLgoiI=
X-Google-Smtp-Source: ABdhPJwDM/0Ps4RrzDCgoAHI13EfSPQv6Gm/TNn1RsA5CmIs2+S9UMN/Dli8avYcOmXuHBEur9/K5Q==
X-Received: by 2002:a62:4e96:0:b029:2c5:3067:90ab with SMTP id
 c144-20020a624e960000b02902c5306790abmr13036928pfb.38.1620832912885; 
 Wed, 12 May 2021 08:21:52 -0700 (PDT)
Received: from localhost.localdomain (1-171-3-209.dynamic-ip.hinet.net.
 [1.171.3.209])
 by smtp.gmail.com with ESMTPSA id t133sm228633pgb.0.2021.05.12.08.21.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 08:21:52 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, b.zolnierkie@samsung.com,
 pavel@ucw.cz, robh+dt@kernel.org
Subject: [PATCH v7 2/4] backlight: rt4831: Adds DT binding document for
 Richtek RT4831 backlight
Date: Wed, 12 May 2021 23:21:38 +0800
Message-Id: <1620832900-8347-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620832900-8347-1-git-send-email-u0084500@gmail.com>
References: <1620832900-8347-1-git-send-email-u0084500@gmail.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Adds DT binding document for Richtek RT4831 backlight.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
since v7
- Add allOf property refer to common.yaml.
- Remove default-brightness/max-brightness description and refer string.
---
 .../leds/backlight/richtek,rt4831-backlight.yaml   | 62 ++++++++++++++++++++++
 include/dt-bindings/leds/rt4831-backlight.h        | 23 ++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
 create mode 100644 include/dt-bindings/leds/rt4831-backlight.h

diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
new file mode 100644
index 00000000..e0ac686
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/richtek,rt4831-backlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RT4831 Backlight
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  RT4831 is a mutifunctional device that can provide power to the LCD display
+  and LCD backlight.
+
+  For the LCD backlight, it can provide four channel WLED driving capability.
+  Each channel driving current is up to 30mA
+
+  Datasheet is available at
+  https://www.richtek.com/assets/product_file/RT4831A/DS4831A-05.pdf
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: richtek,rt4831-backlight
+
+  default-brightness:
+    minimum: 0
+    maximum: 2048
+
+  max-brightness:
+    minimum: 0
+    maximum: 2048
+
+  richtek,pwm-enable:
+    description: |
+      Specify the backlight dimming following by PWM duty or by SW control.
+    type: boolean
+
+  richtek,bled-ovp-sel:
+    description: |
+      Backlight OVP level selection, currently support 17V/21V/25V/29V.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    default: 1
+    minimum: 0
+    maximum: 3
+
+  richtek,channel-use:
+    description: |
+      Backlight LED channel to be used.
+      BIT 0/1/2/3 is used to indicate led channel 1/2/3/4 enable or disable.
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 1
+    maximum: 15
+
+required:
+  - compatible
+  - richtek,channel-use
+
+additionalProperties: false
diff --git a/include/dt-bindings/leds/rt4831-backlight.h b/include/dt-bindings/leds/rt4831-backlight.h
new file mode 100644
index 00000000..125c635
--- /dev/null
+++ b/include/dt-bindings/leds/rt4831-backlight.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for rt4831 backlight bindings.
+ *
+ * Copyright (C) 2020, Richtek Technology Corp.
+ * Author: ChiYuan Huang <cy_huang@richtek.com>
+ */
+
+#ifndef _DT_BINDINGS_RT4831_BACKLIGHT_H
+#define _DT_BINDINGS_RT4831_BACKLIGHT_H
+
+#define RT4831_BLOVPLVL_17V	0
+#define RT4831_BLOVPLVL_21V	1
+#define RT4831_BLOVPLVL_25V	2
+#define RT4831_BLOVPLVL_29V	3
+
+#define RT4831_BLED_CH1EN	(1 << 0)
+#define RT4831_BLED_CH2EN	(1 << 1)
+#define RT4831_BLED_CH3EN	(1 << 2)
+#define RT4831_BLED_CH4EN	(1 << 3)
+#define RT4831_BLED_ALLCHEN	((1 << 4) - 1)
+
+#endif /* _DT_BINDINGS_RT4831_BACKLIGHT_H */
-- 
2.7.4

