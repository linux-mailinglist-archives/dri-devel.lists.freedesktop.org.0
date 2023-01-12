Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDE9667D09
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 18:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6773F10E322;
	Thu, 12 Jan 2023 17:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4823210E31B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 17:54:06 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-150b06cb1aeso19676277fac.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dgMx+QidzWwZB9d8EFxiQBvCTRSPbMX2JTxiBtWNFyk=;
 b=jvSE9f+Bm4PM6i8gp+gG4lmnpImnH3/NoZWA86JpoIpZsIyfAv3iy/IcwO742mXB3u
 /zwAgiKkKw69OmqnlJQwdbOzQXySY40V3rlIB/jwkae/+gsxQSqZCTJQx/gZauR3s428
 EDAxO/BBILo+PDAjVT+iilsVBqYbiQuAmWLcb7/qcuz1ksyDL6fveCJf54EUvW7PcbYx
 +URrq4S29msEGO3LZ0hAgBNFAFIvRYoBY7ycyujotelk4tS86PVtpY0IJhX4TXuRu8f0
 5eBQzT9bl59CeqxMTtCfVOaiMf50aMfIbuFjq7ug/tTKiChesrZSAbda3CKBjt5uKMHo
 icGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dgMx+QidzWwZB9d8EFxiQBvCTRSPbMX2JTxiBtWNFyk=;
 b=gGTqRtBm2wxQWz8XRCvW7zlArc1gjjJ0ITDcfDXYe9Al/e+OCB1yVRbqDWJHJXo9m+
 uGg0GkXWQsiTitGcrLd33zMWv8Ji0p5KS9j9iVq3j98O381dDeR+7qEn6ihucdXbmNj/
 oVGh9h6X3JcetzTb73MTwErBnXFWXjpgIWRcoxz692MQu/FlJa5PZhrZuV7ZXWEbBKGs
 B8/dx1Tv8KyQVuCpIXOZ8jjMQ6a+ZJE+S8LpTHg57iI5yCoNboJPx3tNgo+7gpbzTFp1
 nz9JE+moXnTOvCE2PtgI9uvDTks8LDxoc9hboO1enhJYp+lIa2pirUHDgsUb1YE48sTK
 /tKw==
X-Gm-Message-State: AFqh2kpLssYK150GiN4reJGploghVry1Vc6VuTgG5kdjoxb4Ls16DUWY
 DpWBKTG9+4zA1tEXcIggG5YXO0VMUd8=
X-Google-Smtp-Source: AMrXdXsEeZ++yki3Zow70/z39R4DHq5FMuMU/XBn8Ia0aX+tI4LICosOB8DxRU6z5e6gylKLEcSwzQ==
X-Received: by 2002:a05:6870:3e0e:b0:150:878c:d4c with SMTP id
 lk14-20020a0568703e0e00b00150878c0d4cmr22371019oab.3.1673546045296; 
 Thu, 12 Jan 2023 09:54:05 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05687105d100b0014866eb34cesm9317049oan.48.2023.01.12.09.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 09:54:05 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V10 2/4] dt-bindings: display: panel: Add Samsung AMS495QA01
Date: Thu, 12 Jan 2023 11:53:56 -0600
Message-Id: <20230112175358.421975-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112175358.421975-1-macroalpha82@gmail.com>
References: <20230112175358.421975-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, tzimmermann@suse.de, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add documentation for Samsung AMS495QA01 panel (with Magnachip
D53E6EA8966 controller IC).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/panel/samsung,ams495qa01.yaml     | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
new file mode 100644
index 000000000000..58fa073ce258
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ams495qa01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMS495QA01 panel with Magnachip D53E6EA8966 controller
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,ams495qa01
+
+  reg: true
+  reset-gpios:
+    description: reset gpio, must be GPIO_ACTIVE_LOW
+  elvdd-supply:
+    description: regulator that supplies voltage to the panel display
+  enable-gpios: true
+  port: true
+  vdd-supply:
+    description: regulator that supplies voltage to panel logic
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "samsung,ams495qa01";
+            reg = <0>;
+            reset-gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc_3v3>;
+
+            port {
+                mipi_in_panel: endpoint {
+                  remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.34.1

