Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4D3664CEB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 21:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1295210E48D;
	Tue, 10 Jan 2023 20:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EAF10E131
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 20:03:06 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 x15-20020a4ab90f000000b004e64a0a967fso3509113ooo.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 12:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dgMx+QidzWwZB9d8EFxiQBvCTRSPbMX2JTxiBtWNFyk=;
 b=lyuDrX+JUiUXvd41LuqumERhjN0RSpIxWin21vu+wf1V0YRZkVgID+091W5ug1Vi/q
 Qa7TPma391EC7LZEDf/LYaocyRLjZayXOMlI+VuuhPk+8ovZ56ZsXrSjA6F8KWmJavxp
 y5gcfNraHjo9bUcEZuhWviC6v2LmKNa9dEBeBnHDeLuAj25e7k0oJYsmjiJtrgB7YPc2
 xvKS52Io0b0TlbXjf+wXmPTzVCY4CDIWejtsn1ZcVNynKRVJKChsyLKOA/mzJ1E/cl/5
 +SyNmOs5yS5gAbtEzq6SUE4Dq+hTOdpZ/TytODXlaIwoob1ItgiQq8FL5nROvdHeQx5U
 tufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dgMx+QidzWwZB9d8EFxiQBvCTRSPbMX2JTxiBtWNFyk=;
 b=Ts5upI3/31UqL6hSlJLJKDlxoF2gexjBvNegy48iCuXiujmnkCKB0NNsVbfWDr8SQY
 Vx/cQl8hiaX3NAu7CBVq7e77jj/okEm+03c+jfOWNrJp4E6erNv/Aw1KBviS49ESrExk
 /tBYg9uoo0xkkjGcaryV3tCTfEKrIWqcZ5cSr4z8Kc+u0m/hB39g2mRd8ZpehPXe4tlk
 +g93tE/LeQtFBIU9DmWC3HeBHpAwm2rbqaMmGxh9vDCEAyqc7Yz2MneiHbnQPgRlI4v4
 9U/IXCHAHgmekrJQtmwy3AhzaCliwq2vXdGy6J4+OEa7MWaA7QW9Gne+RypSOdhCI8vx
 SEgQ==
X-Gm-Message-State: AFqh2koAd67JiR3k6liSPBLlCX3iHQaYRdbGtom0m5jE7JFd/TiBrIcn
 eyepwS5dIBboObLWu740xWRuv/3eois=
X-Google-Smtp-Source: AMrXdXttj8wh0ymNl53Hrx8x6W1dqMYoQv3OPum00In+oTXiJ/NIMK/j/iDobxR7iiXYnxWjf+3yDQ==
X-Received: by 2002:a4a:97b1:0:b0:49f:dba7:5e65 with SMTP id
 w46-20020a4a97b1000000b0049fdba75e65mr28394714ooi.3.1673380985493; 
 Tue, 10 Jan 2023 12:03:05 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a4aad04000000b004a394578e14sm6089779oon.32.2023.01.10.12.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 12:03:05 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 2/4] dt-bindings: display: panel: Add Samsung AMS495QA01
Date: Tue, 10 Jan 2023 14:02:53 -0600
Message-Id: <20230110200255.1218738-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110200255.1218738-1-macroalpha82@gmail.com>
References: <20230110200255.1218738-1-macroalpha82@gmail.com>
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

