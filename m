Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 712D1889ACF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 11:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7DF10E737;
	Mon, 25 Mar 2024 10:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wltc1km5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C7610E737
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:36:16 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-56bf63af770so824168a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711362974; x=1711967774; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9sOPezhldmxSnr8OT7bAHjF4t98n/YFRx58g6GLuW1s=;
 b=wltc1km5firqulSdILGPquXBYvELyPkRwyG6zOjabwsb+eMUPalThAXWMdnqzugItV
 0nFQGDBuUrhOmpVppA++7GpTm4uukgqHOiu9v1rRbHSlzYRvQmBB7VrLRKQfEKMKmNK8
 vc08sJSQ3FdOA0dQOEj+5g4gmRchWkQLZhNYpeLI+sdFhmsW5igSg2792H375jp+BzJZ
 W5/NNEqltSqHbD8ktVoT13tWxp21R6c51BARJpNnZ64WrBkH1+7l/HNGMEj+LWFk7BM4
 aBKYU5zcwS13eS1rygkbFZyFzBBipA3NpXNYZulltu92bFK00To+U5516s4znpVzLuDb
 uhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711362974; x=1711967774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9sOPezhldmxSnr8OT7bAHjF4t98n/YFRx58g6GLuW1s=;
 b=ImoQJDehGUk6oIs+jxPvLF46qL27EVHlTJMirMM/zch5vfFHFbw59IUNbL0nAeh2Tz
 YLbmSvVY0XrwoLjGsdPL8Sx3kGWuewMsXj1wyAnp3A7iErdADs88emAEdBct3kr0ZYsY
 OlnTOt5Ht2oRElLMJYVzB7GZi/0Yda7ZvEBMwICFmCk1RpJQTECTcH+nG+DVPxcuR6eC
 5db2Js9tdZ7JqjEz6bDGt3eDy+HWVhJsdsw9hPn95m47KpxuZfnPgsLoHGydSH4T6g9t
 wiyMFtVprpRkzrEkq1euqQoLcwKz4G7/sTLDTFz9VBbnUMYxSSR8/JVJm/mg2Pmb87im
 2/jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJcGSig3jpWgvSM/u45PPO19nPz0WdCw81hJSzbZy6ZjzbRfYDCWSoVfJt7gtuVnd/rVFJbW62kXg0F6A10ZDdYWbjuf0ZLiuhBT6NmFR0
X-Gm-Message-State: AOJu0Yw9q7YRoAw6koAjPZJ5kkfF00IbgQWKIVBWMYMNufmrMIq5GHyc
 buXLiwiVFA2kh3i/nInRDfz3vYiEln5+m/+6cMWT+AxfkKd4tiKQ4zn8yJaYDP4=
X-Google-Smtp-Source: AGHT+IGxM8s228b1XWbE+SeGTrM1fDdyMya66yBrGFVuE7WBvD2ok2jlRcn2B1rUDQ1HBTx/Bvze3Q==
X-Received: by 2002:a50:9e44:0:b0:568:d19e:7ab0 with SMTP id
 z62-20020a509e44000000b00568d19e7ab0mr5606866ede.36.1711362974289; 
 Mon, 25 Mar 2024 03:36:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.44]) by smtp.gmail.com with ESMTPSA id
 dm28-20020a05640222dc00b0056b7ed75a46sm2827319edb.27.2024.03.25.03.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 03:36:13 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v4 1/3] dt-bindings: display: panel: add common
 dual-link schema
Date: Mon, 25 Mar 2024 11:36:09 +0100
Message-Id: <20240325103611.28240-1-krzysztof.kozlowski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add schema with common properties shared among dual-link panel ICs.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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

