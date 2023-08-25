Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC9D7886AF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EFC910E65C;
	Fri, 25 Aug 2023 12:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A828F10E65C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:11:54 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5007c8308c3so1314828e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 05:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692965513; x=1693570313;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qhIkzsyTKm670j6OXVUadyYcO048MWKmieMFi0kdsqU=;
 b=oZ2Ey6AHeynFNLLoCwmcpV/iHUNu/GVg4qpIbNpwiA7oe1toexTbxTXhSQQD7/zQ98
 5MIGiFL1oH/UueBNsNFT/tSN4BR06ivWpe0xbrVCjctcGYbzzlWnWW9pNxjZY/WLY4lV
 AQFykQ78Qh0+ZsM6slzxVKSDWkm0Ht/v6+C8r2U3Qu0LTb6B5SNHymM90EK4PUbnXOkA
 yl1ZP2Tc64Iy9EebcB0I4Ih6gzuG3fqtoX3N2gfYi8ni/JPawTPxuxfi1UWX45qQ01Ue
 qZMvc5K/174DINLVkmoI62PtCDyU+xD6jl5GX/WiJxmqFCVfIuA+nhaBwV55ICa/9rLs
 D2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692965513; x=1693570313;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qhIkzsyTKm670j6OXVUadyYcO048MWKmieMFi0kdsqU=;
 b=BSue+rXWPfDauZoTGL8GR2EsrfGUkkxih5Hz5vMl8rBFYbh3ipTU6kTcmloe8sFGy6
 UOpd5VKVifwDYU5/ejb+DUK5H89pOzXyuK4d7Ehj4e9CAqq2cRZ2uWH57TCWG8ySiWjV
 8vcLLX4TGJJskkuMFiwgmUNDr1SY/7i1rwVbjQEiSG36Tdhq8juZAiMSyU5PoYeHfqe8
 n0N6cwSme46Svf6dmET4AAa3h+Y3k+wNT6JjPpjyG8TZVaJ3B1EWfdDjNzfGjtXxBBL7
 Yid6zMYWc14LpOuEHCzSUIxOPQ+Xyz/0tKlZlqHmuAoICqVh+OkTrykIMAAfz7tfq3+w
 +wTg==
X-Gm-Message-State: AOJu0YypSJ7AFrzBhPZmHDuGd72s2hPIV/WqTx2yJ9U18Ln26xsI+6Lw
 ky5/7xthC/QQXYcibrTzG9RjKA==
X-Google-Smtp-Source: AGHT+IELNGy+ZJX03ObKjQP+MzDwqRIy5Q5gtBaOdGmbJfuToQbeiU29jbARS+FjeuGm36A8/pxAhw==
X-Received: by 2002:a05:6512:36d2:b0:500:9524:f733 with SMTP id
 e18-20020a05651236d200b005009524f733mr5221093lfs.20.1692965512717; 
 Fri, 25 Aug 2023 05:11:52 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198]) by smtp.gmail.com with ESMTPSA id
 l5-20020a056402124500b005222c6fb512sm952311edw.1.2023.08.25.05.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 05:11:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jianhua Lu <lujianhua000@gmail.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: display: panel: add common dual-link
 schema
Date: Fri, 25 Aug 2023 14:11:40 +0200
Message-Id: <20230825121142.101759-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add schema with common properties shared among dual-link panel ICs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v3:
1. Re-phrase description of binding and ports (Laurent)
v3: https://lore.kernel.org/all/20230823081500.84005-1-krzysztof.kozlowski@linaro.org/

Changes since v2:
1. New Patch
v2: https://lore.kernel.org/all/20230502120036.47165-1-krzysztof.kozlowski@linaro.org/
v1: https://lore.kernel.org/all/20230416153929.356330-1-krzysztof.kozlowski@linaro.org/
---
 .../display/panel/panel-common-dual.yaml      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml b/Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml
new file mode 100644
index 000000000000..cc7ea3c35c77
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-common-dual.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for Dual-Link Display Panels
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description:
+  Properties common for Panel IC supporting dual link panels.  Devices might
+  support also single link.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: First link
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Second link
+
+      "#address-cells": true
+      "#size-cells": true
+
+    required:
+      - port@0
+
+# Single-panel setups are still allowed.
+oneOf:
+  - required:
+      - ports
+  - required:
+      - port
+
+additionalProperties: true
-- 
2.34.1

