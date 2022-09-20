Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B795BEB9F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 19:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296A010E72D;
	Tue, 20 Sep 2022 17:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E5110E1FE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 17:09:46 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id o64so4506895oib.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 10:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=xLE/KMkN6oWOgP71Pba5WPZGD9ngcwIQDqZNkJgFhWY=;
 b=gUGVPWLKHVWqdBHBLmTHQzwRCfadaeEArwQWsGTjd50Iehet6tbWH17xZ2WlXB8Ao/
 cwsRo5pwuptXH4v944Z0miy2vWura7Una2z6oH9WQ4PwW0ZvCZSE3HwEIQw3qYsZVfHY
 Vc+zECP+79n8lXNc/rIdddjkNEe8xpLkGKlbTpUihVvIKqew0RzZ5Xu6kxL+ApTt/ksI
 5W+8/mZvCRCNcCBCpKspI9ehFiDHz1qgS+ASGE/A88pNy8Ubf41yffP9y5Fcyk6gxQ9M
 K8CX1YQLVyzFQe5FMX4PoLx+0UhwSkLnvhdBPhLswPSf9UOcZmkmdGNSlziVouM2/wKp
 zhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xLE/KMkN6oWOgP71Pba5WPZGD9ngcwIQDqZNkJgFhWY=;
 b=VH2+ScdhdJ+o5hX0WCe8FxGVKwVBBa3ePx1YdMViikLxf6jZuLcaCSmhgpmxEVbTPl
 QfU+Ds07lNhbnKadAynCq8WCCWxkdw3hoocyaDIJt+ov2iKgqCzQ3KJqKHE8Z/nVdw6x
 m5NHKTKk+by+BepJDF+ZQ2Y9cClBlWrOEomcFkIDetxaIWXjDCv7fkKn6DPHy/VOg4NY
 9luEEq/lsIC+SjziUh5GJ1gGKb2ub3nSr4YwttM1SLA8Q9irRRx8j4ZAQqgRgbF8u6qC
 dU8qPsf8cofPobnYp5PkH53nOXEGY+DGnw7aP/FzsczXO3v2laSgF7YV96NgSKz+vvkW
 DAiQ==
X-Gm-Message-State: ACrzQf2a0/EMu8X1n/yYAN1p45yWMN15c0oR5h9CaJcafUGXfFuFWc2M
 Y9PaS/dAuJNm7rUhVQ5AU3MooZYlmCM=
X-Google-Smtp-Source: AMsMyM4Gb5RoR8uwoNErq5clxV2eINJIk9PZtaEqYIUzg3OBloriaHFSAUKyJ0CeH///dNewpwCbig==
X-Received: by 2002:a05:6808:140a:b0:350:cf96:8294 with SMTP id
 w10-20020a056808140a00b00350cf968294mr1960948oiv.169.1663693785305; 
 Tue, 20 Sep 2022 10:09:45 -0700 (PDT)
Received: from wintermute.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a9d69cd000000b00636956b3080sm121468oto.43.2022.09.20.10.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:09:44 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 1/2] dt-bindings: display: panel: Add Samsung AMS495QA01
 bindings
Date: Tue, 20 Sep 2022 12:09:36 -0500
Message-Id: <20220920170937.14486-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920170937.14486-1-macroalpha82@gmail.com>
References: <20220920170937.14486-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add documentation for the Samsung AMS495QA01 panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../display/panel/samsung,ams495qa01.yaml     | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
new file mode 100644
index 000000000000..08358cdad19c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ams495qa01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMS495QA01 4.95in 960x544 DSI/SPI panel
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
+  reg: true
+  reset-gpios: true
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
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "samsung,ams495qa01";
+            reg = <0>;
+            vdd-supply = <&vcc3v3_lcd0_n>;
+        };
+    };
+
+...
-- 
2.25.1

