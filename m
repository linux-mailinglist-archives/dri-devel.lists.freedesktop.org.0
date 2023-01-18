Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADF1672CA3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 00:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20C610E201;
	Wed, 18 Jan 2023 23:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DDD10E050
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 23:31:46 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id r132so340736oif.10
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 15:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dgMx+QidzWwZB9d8EFxiQBvCTRSPbMX2JTxiBtWNFyk=;
 b=X6JBlJU/7tvkFPCMBD9PeXuiqWarnqBo/0icQo82UJM0vocSX4rHcq6S1QJHgYpV4S
 DVcispan4eaNtC1tRGvtn8crCZhQ7SwzEhGbPWRBdnrEr43QdN9UjicqydKQA9zSyA/q
 Hlerj6Lkfzop3hnRXzXuoYxHji7DzOWMskhB2WaZGyJUYl+7Weio2JOIfTxL+whBGsd6
 UgcZuOSisdXwJ3oYg3HnRqBT4Tfn5lMTqhCg7e1pzSQZ+ea5XGDeyWYGndH7X0B2UoJj
 hizTQEVsvZ+JrQQfZ2KtGqQWHQxFSmEAxHEtjOETkUxs4WZHZx3QQLHI0lUrEvWPQlra
 eI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dgMx+QidzWwZB9d8EFxiQBvCTRSPbMX2JTxiBtWNFyk=;
 b=SD5rBYJQhyhkmdFXF3i/hfh87qXlWvRkxXTJYpn32vBKU1GgsR4/eBlBbgQwAg4Y9E
 U8NIHH34iRtAIlDzMkexReLzvW8KCVv54DlcW6IiMjJkIUHxPV/ZWNl/csCcxudmMJm4
 Z5P5eapZveMEAzb5U6sY5h7sJb30cb1SHkCQn0paPMnuFIj2kW7yTZrrA0oiqsaUGWS9
 rvk5ngZCUB/NAtAQufEuq90ABbEdWEIOLGHNh92QK8L9kuVmOx3axmKnt0RGILHG5jQ4
 Ndb1PJB1EhefvITsls/LW+4/oq8PlENTeR5zpEJD8KkR8oXdDjHufzB2EN3W6gBTqFgI
 jXHA==
X-Gm-Message-State: AFqh2kpPKXl9+zaAzBWQFgUBuexBBIYnMkjXfc63X9SNVI41YSi7stnZ
 /4ENy8wl0j4qMaG+XZ3h9pKXCXyhQ/0=
X-Google-Smtp-Source: AMrXdXuj78srkvIFpMzKbCHNr28A9yO08G7rFmLRL2jCPRXug5HUzDh20lc/mwGJf5WtomBjD0LFuQ==
X-Received: by 2002:a05:6808:3082:b0:364:46ae:5aa5 with SMTP id
 bl2-20020a056808308200b0036446ae5aa5mr5985054oib.0.1674084705776; 
 Wed, 18 Jan 2023 15:31:45 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 q10-20020acad90a000000b00354932bae03sm16966933oig.10.2023.01.18.15.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 15:31:45 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V11 2/4] dt-bindings: display: panel: Add Samsung AMS495QA01
Date: Wed, 18 Jan 2023 17:31:33 -0600
Message-Id: <20230118233135.1174859-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118233135.1174859-1-macroalpha82@gmail.com>
References: <20230118233135.1174859-1-macroalpha82@gmail.com>
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

