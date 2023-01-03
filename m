Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA0D65C6F2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 20:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CC910E4BD;
	Tue,  3 Jan 2023 19:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711C410E4BD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 19:07:14 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1322d768ba7so37873254fac.5
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 11:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5MuYdw/TKmmfACRBxYwGpprkKtsguH2MTUAVNosMrsw=;
 b=kCw1vFAqU0vOuAxLd6aONFgPfYzmkCnXAWMT+lfy4TFXsBwNUTQJ1jYj1bIrUnyn2Y
 1aY1fpLXO74CXwF+7MkLee3dpJHfFxg+x5EKCrVJ9iICb1jpdzf0QCPIQNLoBZTlMKSX
 Tbc90nZFV2Uazha8Iw9dH2GDJ5oT3VOuOtO5+Vd8iXdCaDiFKt56NomcyuHtsZmX98Ts
 DB5X3b3QepmSUOpL+co467we//ClPMgSpRWwEskeHpN1cSdaEHrgwYgiGeBvz69BLOR5
 8/g0E5Sq5rU3WdgKf0hnBEu+9tTGuxryPOdzE89rn16ZYBYVcTsiafCdXOIkhD4dIGtt
 OOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5MuYdw/TKmmfACRBxYwGpprkKtsguH2MTUAVNosMrsw=;
 b=SJp2eLq4mQL5kArJft+NEHuOXTDvbULxkEp+W2Tmt3j5apF7vx0KgsenzeqSH3sIXb
 1Dr7lzKsBEGguvJOG3JXbm43LLVYs8vFHcsZGmGTMM+EIx+OEve4dovx0jdDXPvMs/kP
 yg0JlQDz8E+qcpyN3GLeSCgHxCsKD2USmdl2TpwvUQAq9MdPRE7XieJPgQY7H5CpzD27
 KEeZ5Dv72VN0M+v4R749Wez8KQmzJx871EC6Kfj2KPq6CstIXaeyT1fiTJwNyqLFefob
 mT/Xxk6FXd2+QAlqqEmFlwZyWbNo+YcLwYJ/k6isaA22kcmLIlVNXSx8OGnEQAa3ITUn
 Mz/g==
X-Gm-Message-State: AFqh2kqFhzUHijn8zfimCcKdnq+n65UwytC89Zn5onVfsDU1EwxQLBXF
 tAln1tBf3+m7uJshPFLn3lJiL9LRrqY=
X-Google-Smtp-Source: AMrXdXvoonL3R80H8i+/5RbEGmxtPYYCMHqfwWOtt9cFbwYpUqfQV7IVBHwhJz7jTfGfEKFkdFfm9Q==
X-Received: by 2002:a05:6870:889b:b0:143:e0d7:7427 with SMTP id
 m27-20020a056870889b00b00143e0d77427mr24294519oam.17.1672772833500; 
 Tue, 03 Jan 2023 11:07:13 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 s24-20020a056870ea9800b0014c7958c55bsm14752207oap.42.2023.01.03.11.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 11:07:13 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V7 2/4] dt-bindings: display: panel: Add Samsung AMS495QA01
Date: Tue,  3 Jan 2023 13:07:05 -0600
Message-Id: <20230103190707.104595-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103190707.104595-1-macroalpha82@gmail.com>
References: <20230103190707.104595-1-macroalpha82@gmail.com>
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

