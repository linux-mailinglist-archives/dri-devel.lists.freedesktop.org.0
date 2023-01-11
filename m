Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F8B66607B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 17:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A534A10E790;
	Wed, 11 Jan 2023 16:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833C310E2C0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 16:30:23 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-15eaa587226so1389961fac.8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 08:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dgMx+QidzWwZB9d8EFxiQBvCTRSPbMX2JTxiBtWNFyk=;
 b=WT0lrls/1NRvzGaMWgki+Kf06c74litRYkqgkhusilCgueQRjinCNzh+VaMj0tlaSl
 nLNp24cq5/pqSwub4Lwy5Mnth0Tuy9fGHZQeUGGgSHs2ac9p9+hPTF1iQWAMgC7Z6tJc
 8CkjUDNQHT5dO5FYBKUD3p5GovXwRJGOfYwhNRGLdq7cdrgyAKawkZ0iT33u07fvLEhP
 UFVeFTtkjf70xZKeki0jpFAYDvuhWCxGioGCEINVZz7yyKqjj30dUuMs87/d6CqnFD+1
 QbGjwcnNdbUbn1rt3uxO2HNebrLLThPAxbSfGf6LPeb3+rYMvmWh0MHxOdroDVDKc3qh
 f12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dgMx+QidzWwZB9d8EFxiQBvCTRSPbMX2JTxiBtWNFyk=;
 b=yagcVuHgN+YHhXA9NqlO8Q0A+ybp8iokACRQZKzbDQJUPIKkintJMcFHDvf4m3DZ9h
 ErYloc4fIBKVuLApm9CcWixI6a5k1Nt+yqKFAEZXfzjifVSwKtN1iFuSxxauFGNclq8X
 xxz80aUHwbOCIQbba1BfRj7RNAsCjGv9ceDrzsw72pgbXZMiqzO8Ytx3CrO3hVo2m27f
 jc72eDKWeE/owtSHHaF9dfl7nEJqeO725ImmxlkxKThR5khzibOd1u5zQZ9iGkt5sdV1
 9mdW1uXLou5mBtxrmgJankzTuH2mEdj6r2B4wBRxEQY1+mDM83G7UU090ihM40T8za1j
 Frsg==
X-Gm-Message-State: AFqh2kqS07G8GW+qpv/CVvD5RKghA+y9K383I8co/ihFwO8a855DWBpp
 Km0H/05lfXEBdrPdTAUL6wGMSvF8fBM=
X-Google-Smtp-Source: AMrXdXvi7ggD51qa2JEi1p6UAGFPT4BlIR6rfPAnoDpSqqMNavNojmnZTQG9Z8I+WChJtPs68HdNDQ==
X-Received: by 2002:a05:6871:4e93:b0:144:c5e3:643a with SMTP id
 uk19-20020a0568714e9300b00144c5e3643amr1594353oab.4.1673454623056; 
 Wed, 11 Jan 2023 08:30:23 -0800 (PST)
Received: from localhost.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a056870738d00b0013ae39d0575sm7629003oam.15.2023.01.11.08.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 08:30:22 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 2/4] dt-bindings: display: panel: Add Samsung AMS495QA01
Date: Wed, 11 Jan 2023 10:30:10 -0600
Message-Id: <20230111163012.310945-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230111163012.310945-1-macroalpha82@gmail.com>
References: <20230111163012.310945-1-macroalpha82@gmail.com>
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

