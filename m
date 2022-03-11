Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD694D6129
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 13:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371BF10E945;
	Fri, 11 Mar 2022 12:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B6E10E942
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 12:05:08 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i8so12622321wrr.8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 04:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pYOH+D47s+nPvs6dVoBRspa7x8lAvKDpmLjt6UBzJDU=;
 b=AuKnyw0EnGIqZUppIffzfnzL+YN6QaezGTe6yGSfh/NDTX886ag6hFNQH9hMsjYMOy
 vrKvoVIG+qFEpN1d55zp99Zm+HUAdTO24Wp5t5dgAglhXQJ1WzRaAlnB5LaILbYrrt4c
 ZCIv1biM/+6eL0nt2tEWZGi5q0fyeQkoXBHWwtUO6wV2Znuart0Zp/vZlIY/2Hu4fbCB
 Ks2sJlBsPZRk9uTJ1Q8C64gGSgV3z2nj2rMd3kwAPLVbxPQbu5aNR8LMaujPZtdHiY6a
 xQzczXmGELqukqsmKW+uqVyuBQG7LkUKPZH7kFZCuqGdoJgtK7KO/mAL0MqSc7PX2RLQ
 mOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pYOH+D47s+nPvs6dVoBRspa7x8lAvKDpmLjt6UBzJDU=;
 b=Lv8Qvi0Ozxx8UNA0RP9fweXA3RaVKSHBPFO0BvBPsZ9Fb9UrsSkKABozK+iyQBc2hm
 Faiyzx9llT/jpwWedIxa7GdMXL9BwWkU6ARCZ+moZnMGgCLV+sqJNFpjHKfZKpA9DgTh
 T4JPPWgyqGFlQeyYmNCianiIQRcHBI6unPDjTvbohTxlNf8x6Z2AHvMx2da6V9NNv2HI
 4BQfK3Y/f3cRa8lOxKNp4WL1+mFLzXCVo+4BvP5PCRNrG4790x3BFAQlP/s9P0emJxIM
 00GUeMqHkzXsZ9lwWJZxiyoWjwRhS8uXeov+j/i4Lxdo/DRRC8ViO7YeVqNyYsxTMrm/
 aExw==
X-Gm-Message-State: AOAM531yAVH9N2jaS8Gp7Xl4DUbN9mjlP8qBe8+QE8K2YT+FFM2O4GzN
 9v0DG5pNABC1Mk+tSlFInL4=
X-Google-Smtp-Source: ABdhPJzPnjYD1zLgfIdrULQgUSle81YQ66OZvmi43Udp/O9Tniin/9iunU/jOKH1zntKpuZLoaZq0g==
X-Received: by 2002:a5d:6405:0:b0:1f1:faf1:a48f with SMTP id
 z5-20020a5d6405000000b001f1faf1a48fmr7067835wru.684.1647000307260; 
 Fri, 11 Mar 2022 04:05:07 -0800 (PST)
Received: from monk.home ([2a01:cb10:430:ec00:4737:d56e:186b:af1])
 by smtp.gmail.com with ESMTPSA id
 r20-20020adfa154000000b001f0326a23e1sm6595223wrr.88.2022.03.11.04.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 04:05:06 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 4/4] dt-bindings: display/panel: Add Leadtek ltk035c5444t
Date: Fri, 11 Mar 2022 13:04:53 +0100
Message-Id: <20220311120453.163297-5-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311120453.163297-1-cbranchereau@gmail.com>
References: <20220311120453.163297-1-cbranchereau@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add binding for the leadtek ltk035c5444t, which is a 640x480
mipi-dbi over spi / 24-bit RGB panel based on the newvision
NV03052C chipset.

It is found in the Anbernic RG350M mips handheld.

Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
---
 .../display/panel/leadtek,ltk035c5444t.yaml   | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
new file mode 100644
index 000000000000..9e728f8ce0cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/leadtek,ltk035c5444t.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Leadtek ltk035c5444t 3.5" (640x480 pixels) 24-bit IPS LCD panel
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+  - Christophe Branchereau <cbranchereau@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: leadtek,ltk035c5444t
+
+  backlight: true
+  port: true
+  power-supply: true
+  reg: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - power-supply
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "leadtek,ltk035c5444t";
+            reg = <0>;
+
+            spi-3wire;
+            spi-max-frequency = <3125000>;
+
+            reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
+
+            backlight = <&backlight>;
+            power-supply = <&vcc>;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&panel_output>;
+                };
+            };
+        };
+    };
-- 
2.35.1

