Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 999A734BCDD
	for <lists+dri-devel@lfdr.de>; Sun, 28 Mar 2021 17:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEA96E0EE;
	Sun, 28 Mar 2021 15:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F92F6E0EE
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 15:24:31 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id ha17so4828175pjb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y34ysGC4dqpDwL3C2uoc3pF479HH3myYLczmtioGSO4=;
 b=jxRWgAmd2WQuYjiyF6I9HCpNZI0Ewy2F0Jgozv2VTZkjEHvQe9nYBVo/sehkKOhTn6
 hsIoNAbvF+gqS5KQ6Ux1Fi2kL4EbXBrVtr07oI+NbCxz5DY0msdpQYX3m4L0TPSqE4Oo
 sR418z6F09TJ4MmLXHBmROmErf5IXHntg7Nc0icTXFQwotqWDC+wcwnJ1vlWHH5xpT55
 211E5xcx2oB950yoURUfix2slpTiXWQ0Fa0N1znOFo01TAoHvxJN8Hg3IVbAslpygcwr
 tehacb8AMzgWznxyfEBLuFAtkePL+3z8S9PFCeGiKNBjnMTCwcy4ipiHPLWa0ukZFxNG
 2Ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y34ysGC4dqpDwL3C2uoc3pF479HH3myYLczmtioGSO4=;
 b=SocXRUVP1RET6ch6oQ2yfxaBh7QQ5hoN1TreRi97CspWkpX0DZPAZEtGOmTZA5SPJ4
 k2iLntDlTXU/yXFzdElcZxEmAcjFnt7o8Ql8DEt8z0vb7jJKS4Rvc/uvytt9VW4l20p3
 RMqorVzcMQ1/o3hHAbnJNyo0w3k/+MoCOmD2nfTY0THHkxSgb4nlQ+Ga6iJ8/oZVGukj
 OgplGBozG1unEnXrC/RepyVzARipzjgAtQiSuokWhr1MdQhpOS9M0CAj3/23KI7rbeib
 o5b3fbrj9fSWBci3QBtdTHUyI7DRzS3pKOC3H7+4lMXfTiBsoheOI3oWyOyBRkfXVnPf
 N/2g==
X-Gm-Message-State: AOAM530NpY10E98s+TPAob0ymGgXuOEyBlidNYGZzzpIMCMwjabHpetz
 eGqxiYKl1S1cuG4Zlfsxr0M=
X-Google-Smtp-Source: ABdhPJxS8H9KkPiHiGPR15lsWzhoPZkg2R5CZ3ztUwkbpS6lfP/TgurDiDb2SEZCLryhpQtJa/RzQg==
X-Received: by 2002:a17:903:1c3:b029:e6:a15:751f with SMTP id
 e3-20020a17090301c3b02900e60a15751fmr25219473plh.44.1616945070723; 
 Sun, 28 Mar 2021 08:24:30 -0700 (PDT)
Received: from localhost.localdomain (1-171-1-114.dynamic-ip.hinet.net.
 [1.171.1.114])
 by smtp.gmail.com with ESMTPSA id j188sm14651174pfd.64.2021.03.28.08.24.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Mar 2021 08:24:30 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, b.zolnierkie@samsung.com
Subject: [PATCH v6 2/4] backlight: rt4831: Adds DT binding document for
 Richtek RT4831 backlight
Date: Sun, 28 Mar 2021 23:24:17 +0800
Message-Id: <1616945059-8718-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
References: <1616945059-8718-1-git-send-email-u0084500@gmail.com>
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
Cc: ChiYuan Huang <cy_huang@richtek.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Adds DT binding document for Richtek RT4831 backlight.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../leds/backlight/richtek,rt4831-backlight.yaml   | 65 ++++++++++++++++++++++
 include/dt-bindings/leds/rt4831-backlight.h        | 23 ++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
 create mode 100644 include/dt-bindings/leds/rt4831-backlight.h

diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
new file mode 100644
index 00000000..4da6a66
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
@@ -0,0 +1,65 @@
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
+properties:
+  compatible:
+    const: richtek,rt4831-backlight
+
+  default-brightness:
+    description: |
+      The default brightness that applied to the system on start-up.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 2048
+
+  max-brightness:
+    description: |
+      The max brightness for the H/W limit
+    $ref: /schemas/types.yaml#/definitions/uint32
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
