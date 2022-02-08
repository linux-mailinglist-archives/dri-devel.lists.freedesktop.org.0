Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 056E84ADF2F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 18:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222E810E84D;
	Tue,  8 Feb 2022 17:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AD410E86D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:16 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0F8D54004F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 17:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644340755;
 bh=lAYCF0oFl9nGAtjZLrRDfxUB8PgsnopuWgeZlWJgjg4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=pWhoAI4BEKfG6myvGiVvW3y8BEpvFPmJat5Fg4Mku0TJIWY4fmENfuTrsj1Ux7jqg
 NpKBbtGOlaeI5kM0xyzyyAFRLuvtfmK5nz5mnPJ0CMCQ1fOa0DOlgefwyF1Xfg4qb0
 1hMEdoUzbgo2XFVj+IARzdSlC9S50jf8PKAt719saUNdXJmGFuvwgAMrx8K6wLGPyb
 8Pd2P9D/t24jEXS0ojh8OzFE+QWiogWlNXO+VKct/JkFMZ9fDWkEk7GXdF5/cmMQPg
 7M8kb63lcDnv6dB0DIN0iq5SKlJjnjNSxx9t3WPRdgS3Nwu/ZDolf6we/J4PomX+qt
 9X6h2OW5oQHIQ==
Received: by mail-ed1-f71.google.com with SMTP id
 30-20020a508e5e000000b0040f6642e814so4061330edx.19
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 09:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lAYCF0oFl9nGAtjZLrRDfxUB8PgsnopuWgeZlWJgjg4=;
 b=KrLU83mXvP3wNn2WR1Be/Jt/d3UzZ/lcEX88clWIJG5ikGeQMtnMfP9IU97IsLrwQ0
 IxTJ5JxMFs1VoX8QxCKTPf1TQLmbhnoDvNR+UV5mw0/dajD9WY7uOEIdV9AR/HNW/GlM
 G7nfTmv1DZ64WFB83bpEteAu6PaIbn2J+N+FJn7CZ251NEg7ridI76l0YT43enSbaFut
 3mg/uuzDjSLvwrJmNg3BEA5JosArWQ0AsFIiQ/6E/5YWnBjsvr6SChpkgk2e3JpxZaRN
 pd8G9pej64kGkwtqedCFhCPPtALmKNnsarySYVhUaGXP7nMILjuXmjtO6T/bSlxYkqR8
 Pvtw==
X-Gm-Message-State: AOAM531sB3SMvLSL0CipyaI0HQyKF5U8dGMesfYVvYtMx1JcZfzOj8Ak
 pYNiRLBJ5IBtUhRUsUnnr6+3qwGFXrMM+1JwT7/x8wtMahFaEjECVhpF5+IYjOcScQPOw3wUome
 EYrol6yt6er8VY/5310Nti641nyXVxlCtckkzI2vYcqNkxw==
X-Received: by 2002:a05:6402:26c8:: with SMTP id
 x8mr5675181edd.80.1644340754542; 
 Tue, 08 Feb 2022 09:19:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGbFLwRrBY5BwHpSgBbXGOoRElSE/B0TmO0zX/pZeqJzCVowi5xXNxxbrl6PdvIGlV9Er9gw==
X-Received: by 2002:a05:6402:26c8:: with SMTP id
 x8mr5675152edd.80.1644340754363; 
 Tue, 08 Feb 2022 09:19:14 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id r10sm5125550ejy.148.2022.02.08.09.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 09:19:13 -0800 (PST)
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
Subject: [PATCH 03/10] dt-bindings: phy: samsung,
 exynos-hdmi-phy: convert to dtschema
Date: Tue,  8 Feb 2022 18:18:16 +0100
Message-Id: <20220208171823.226211-4-krzysztof.kozlowski@canonical.com>
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

Convert the Exynos HDMI PHY bindings to DT schema format and put them
next to other PHYs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../display/exynos/exynos_hdmiphy.txt         | 15 -------
 .../bindings/phy/samsung,exynos-hdmi-phy.yaml | 44 +++++++++++++++++++
 2 files changed, 44 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_hdmiphy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_hdmiphy.txt b/Documentation/devicetree/bindings/display/exynos/exynos_hdmiphy.txt
deleted file mode 100644
index 162f641f7639..000000000000
--- a/Documentation/devicetree/bindings/display/exynos/exynos_hdmiphy.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-Device-Tree bindings for hdmiphy driver
-
-Required properties:
-- compatible: value should be one of the following:
-	1) "samsung,exynos5-hdmiphy" <DEPRECATED>
-	2) "samsung,exynos4210-hdmiphy".
-	3) "samsung,exynos4212-hdmiphy".
-- reg: I2C address of the hdmiphy device.
-
-Example:
-
-	hdmiphy {
-		compatible = "samsung,exynos4210-hdmiphy";
-		reg = <0x38>;
-	};
diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos-hdmi-phy.yaml
new file mode 100644
index 000000000000..c61574e10b2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/samsung,exynos-hdmi-phy.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/samsung,exynos-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC HDMI PHY
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
+      - enum:
+          - samsung,exynos4210-hdmiphy
+          - samsung,exynos4212-hdmiphy
+      - const: samsung,exynos5-hdmiphy
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
+        hdmi-phy@38 {
+            compatible = "samsung,exynos4210-hdmiphy";
+            reg = <0x38>;
+        };
+    };
-- 
2.32.0

