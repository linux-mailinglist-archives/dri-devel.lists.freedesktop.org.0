Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A33A4ADF32
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 18:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA6FE10E86D;
	Tue,  8 Feb 2022 17:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5158810E86D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:20 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 042513FFD6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644340759;
 bh=wsWLsYLohqc24CY+DvCwQmjmrJB1cZZyKqkEteo8zKw=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=rFngePbBZXmlj75FzYYUkG45jxZ5ZBcJWogc5fjlmv+5+L5tuK3BwBgqnw9m6tFpr
 EG6IW+sKhOOfVQPxT2zIx7T3N/zBMo1LD0PN19bpwBI0I5JAh7I9eZTlMBnR05WmM5
 ctEq/E6kG0Hh8zUjCq5qsbyaZRnNNAkictGcd3z3qVOpJ1I+oH1VfwhB2TZIUni88A
 /+dd5QPy3GV14YuNO2KuFJ71nopqzc4/bHLHnH0Pv3C5dn9D6XRP8t/SAkp1Ds0xba
 cq2iyaMIBsP3VjGfh7jQ1LAW6Z/N6wjvpINjjJt2MhalasGf/2/6cd9+F9nmN2Mp+7
 d2iSfGRHSUkSA==
Received: by mail-ej1-f72.google.com with SMTP id
 m4-20020a170906160400b006be3f85906eso6043105ejd.23
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 09:19:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wsWLsYLohqc24CY+DvCwQmjmrJB1cZZyKqkEteo8zKw=;
 b=CVj64EhInv1WIOf05FTW7P7k2KQ5z3it/GSHFSSoKYw8SCzNCteb/aBrUZ2pODNEik
 lKOVKzy/v6j3MLTgP/sOVF3eJMCq6Gaz1Y5IPOmtfy6QZ/sWo/bUSKESMa46fiqt6Pum
 7M4s0dtrLyQKlP6VahwEUZGZeSc3NTrDnsxSDQR94rj+gZwzFwormYXpgRWHZNNsf+hY
 IN8YYpMng7TPpVb8UsWQfO6uzyWcd80Gp055LJWnUjtBUPpqej5MlpaTNE03dgS/Rbni
 y1KfmzCdN9jd8/HKRZhHj743S4JPr8PAUyTCs6PXmwmA63h+NGWlu39kM4R1lNWuESSx
 F3bw==
X-Gm-Message-State: AOAM531ar8smSpvjJEcxfmIxnTjeqKgWWV2OzjUf4AitXANRbSKqrK/7
 uoOV9HONPY1TbM5C+Y8WwB6hYHmrT5HmKEFLR7u0LLCYR24RhnjrSFFLSsv6dF/3jwmKK6nBgwA
 8pa1UHaPHfaTn6rWUps7ubp4LkvfwL1gdpHm0SLBuv8w2nw==
X-Received: by 2002:a17:906:9b87:: with SMTP id
 dd7mr4512014ejc.552.1644340758526; 
 Tue, 08 Feb 2022 09:19:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzY0F7r0kLyPgMZZGqkUbCU8KjDhU3RXIohWlNO6hLTLuOou/cnXcs5p5tX1Nu6bOpKpEpjlg==
X-Received: by 2002:a17:906:9b87:: with SMTP id
 dd7mr4511993ejc.552.1644340758311; 
 Tue, 08 Feb 2022 09:19:18 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id r10sm5125550ejy.148.2022.02.08.09.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 09:19:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 06/10] dt-bindings: display: samsung,
 exynos-hdmi-ddc: convert to dtschema
Date: Tue,  8 Feb 2022 18:18:19 +0100
Message-Id: <20220208171823.226211-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the Exynos HDMI DDC bindings to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../display/exynos/exynos_hdmiddc.txt         | 15 -------
 .../samsung/samsung,exynos-hdmi-ddc.yaml      | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt
 create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi-ddc.yaml

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt b/Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt
deleted file mode 100644
index 41eee971562b..000000000000
--- a/Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-Device-Tree bindings for hdmiddc driver
-
-Required properties:
-- compatible: value should be one of the following
-	1) "samsung,exynos5-hdmiddc" <DEPRECATED>
-	2) "samsung,exynos4210-hdmiddc"
-
-- reg: I2C address of the hdmiddc device.
-
-Example:
-
-	hdmiddc {
-		compatible = "samsung,exynos4210-hdmiddc";
-		reg = <0x50>;
-	};
diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi-ddc.yaml
new file mode 100644
index 000000000000..f998a3a5b71f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-hdmi-ddc.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/samsung/samsung,exynos-hdmi-ddc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC HDMI DDC
+
+maintainers:
+  - Inki Dae <inki.dae@samsung.com>
+  - Joonyoung Shim <jy0922.shim@samsung.com>
+  - Seung-Woo Kim <sw0312.kim@samsung.com>
+  - Kyungmin Park <kyungmin.park@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: samsung,exynos4210-hdmiddc
+      - const: samsung,exynos5-hdmiddc
+        deprecated: true
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ddc@50 {
+            compatible = "samsung,exynos4210-hdmiddc";
+            reg = <0x50>;
+        };
+    };
-- 
2.32.0

