Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C5C678050
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B7E10E4DE;
	Mon, 23 Jan 2023 15:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9572E10E4D7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:46:13 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id p185so10719999oif.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nqapi86m5ALZWy/RQhVMucbK8z+wXggnyArRlewaq/U=;
 b=Qwe0skCavY5qRbDu2jiFMgzR4z5C2zb8bV/cJjwhIH8Vq/O2+H0iUxq7vDmWdQrUMg
 DjuacQNgoSwClV416+YOxN+aNzhehoYeQnUy79hFZjMcEKWUFyWtUED8FkT02rkFe2F5
 wMvDGL9BxIasMI+cvksJ3sPSiDJVcYejoV5LbN0uZTsqJwzmxZc5+gk7vL//rAFE2Q1e
 PQ6CQKQ5LxXv0hbad7rBsq8o0cHN8DFeD1uUY8ZZrrVQ2AC3EqAlCmm6uDipPR5RHo/0
 bhD0m2H7QDCQ7MyDk6c7pE6hzRXcjgE4XJOTJxB3ep1mhBLPX9ioVH4nNHfKxcD8vYXr
 qHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nqapi86m5ALZWy/RQhVMucbK8z+wXggnyArRlewaq/U=;
 b=qYhDbsl9VBjh+mTr8OB0JjAHrssd1ONsG6pAPGrZH27xFRhedCqWv5I6iAi1aXT8ga
 Uv0xlFOuVg5nLCEjWq8fkZoeHIkRjnTLj2Mg3F5mlU2nwXxY8rK6zZgukivuuzTjS/qe
 o3tos0eA8t6CnJeOpVqZcYZnmrVSHqincUiV/2x8CtwhXnd13vrMwlQ0chHp9UdTet2W
 EpSjr0cDiJUiwkqtF12vBM7cIwaipYqCoCRSgqsall/5MXfaVGp1J/3mxvSUz4q/6dvX
 ymZPU+OhdZ25i/d+hGqoOM//J2PRD71V0CZoWUx6ugN4spqMADE1reizOgIs38aYn7E4
 40wA==
X-Gm-Message-State: AFqh2krlN7wmhADiVBvlzwBO7ONCh3YS5fTz9Yh/ZO5JqlQkjCGRX1X6
 R+z66K7oIPa0Ebtr5glmX+QWQzi7l+o=
X-Google-Smtp-Source: AMrXdXuuJJhivBWYpkIzc0L3kGnI/JKXyfvnSB76tjIHILIc+VJ/d4YPw9XD+jILhaObH3pkknwayA==
X-Received: by 2002:aca:5c09:0:b0:363:a9b1:54a6 with SMTP id
 q9-20020aca5c09000000b00363a9b154a6mr10104905oib.40.1674488772598; 
 Mon, 23 Jan 2023 07:46:12 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a056808140d00b0035e7ed5daa1sm10040132oiv.26.2023.01.23.07.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:46:12 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V12 2/4] dt-bindings: display: panel: Add Samsung AMS495QA01
Date: Mon, 23 Jan 2023 09:46:01 -0600
Message-Id: <20230123154603.1315112-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123154603.1315112-1-macroalpha82@gmail.com>
References: <20230123154603.1315112-1-macroalpha82@gmail.com>
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
 thierry.reding@gmail.com, tzimmermann@suse.de,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add documentation for Samsung AMS495QA01 panel (with Magnachip
D53E6EA8966 controller IC).

Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
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

