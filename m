Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7DA78527A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 10:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33F710E3E9;
	Wed, 23 Aug 2023 08:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B549B10E3E8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 08:15:14 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-52a3aa99bcdso402426a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 01:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692778513; x=1693383313;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XmrY7GQ2ZmU1Y6/4QT60GHEf7jmYt1E4LHJ/Pbf7whQ=;
 b=EpMLVcOTGZqveKGbAuLVEPgbej8ivmGXuWFDLivjS26RkUHKt2nLP4Przg6x+uNdYN
 IY/ZpXeZsLVtTvG9u/xiIRzy8VEf7dTFijbBeWMp3TK0X6D8v2y1S5zjUQRuTN6FfuA7
 9rx09NaC0yI3T+jzzYAk4heEbH8lqw4FUByOFZMQAlcD0qI0BfCiOm57xxDe8mQzhcEe
 xfFyB9+Hid+Tpzr7BBPocy2GEvwLgQQKYS87tltK4rtYWf+KXnTg4Ctmg0cgU9dwOqUw
 QdOgEFO92DEA8wOrincf5WHJ3mzEqHJmxYMe7O9DiGaZithpdmeqhCTfKNhNh64Uzu+c
 xslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692778513; x=1693383313;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XmrY7GQ2ZmU1Y6/4QT60GHEf7jmYt1E4LHJ/Pbf7whQ=;
 b=bbz9DBLHf6L814TJdhvl5m7do6Vf5Qu/ocJeWj/SvYBkd7hMiNR9eefqjB/f1KlHvD
 t4d5i7SmJFRnBGznMoqBv/zCAefxPlrrFG42/k6LTQdIfEvwS+Jp37zHPw6jIhcnfeol
 D5V7HXlrtNQKHUwxOCSShVFfKhnrYDV+LeLC8wObxgkgR9f5pVpTIOpGGr0H5CkHPtgE
 a/p8cyykRteiydE8Fcfb3dkOKB6QrUEIo9R+hA0bEmb6q7M1LNpfkDPSLOYNfRoAhkc4
 1xby1LdZ6oTgPxemBh+2WHyNCKuWu8+cQerHG4usgV9oG+v3MWZ3SUuaApDlTyKCf1mu
 haPQ==
X-Gm-Message-State: AOJu0YwVLhRFfxjPCuMRy80H3dXqUB+/N3FxpjUxXBtbff0ejMGlgIVr
 5QKY1szf4hA0iafV5/ZVbf05hg==
X-Google-Smtp-Source: AGHT+IFTIG0ewo2lFsWWkU4AVFpjs9a7khJlWa2e43Ubalk/rJaATZ5e92WLTd1q2ikXfONtAWwMCw==
X-Received: by 2002:a17:907:20f0:b0:99e:1201:48bc with SMTP id
 rh16-20020a17090720f000b0099e120148bcmr9325335ejb.64.1692778512801; 
 Wed, 23 Aug 2023 01:15:12 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198]) by smtp.gmail.com with ESMTPSA id
 v18-20020a170906b01200b0098e78ff1a87sm9539730ejy.120.2023.08.23.01.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 01:15:12 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: display: panel: add common dual-display
 schema
Date: Wed, 23 Aug 2023 10:14:58 +0200
Message-Id: <20230823081500.84005-1-krzysztof.kozlowski@linaro.org>
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

Add schema with common properties shared among dual display panel ICs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

v2: https://lore.kernel.org/all/20230502120036.47165-1-krzysztof.kozlowski@linaro.org/
v1: https://lore.kernel.org/all/20230416153929.356330-1-krzysztof.kozlowski@linaro.org/

Changes since v2:
1. New Patch
---
 .../display/panel/panel-common-dual.yaml      | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml b/Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml
new file mode 100644
index 000000000000..83fcd643b5f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/panel-common-dual.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/panel-common-dual.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for Dual-Display Panels
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description:
+  Properties common for Panel IC supporting dual display panels.
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
+        description: First display panel
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Second display panel
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

