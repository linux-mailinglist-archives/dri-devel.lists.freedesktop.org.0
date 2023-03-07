Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36C66AE06D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 14:26:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F2210E49E;
	Tue,  7 Mar 2023 13:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0F210E1BB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 13:26:35 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id h3so13095990lja.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 05:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678195593;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/83GeW+k79u272pQGTACZ8P8QoN5s3z+qgGSys7KadQ=;
 b=eLHscYxdeTg0PAfjF3EYyc6US60bNrQVoEaNdN8SHJaMy1dQ0sqIuUtn57/gpd9Huc
 iQLE9HNHssAD6k/mFF9oyzToCvJomuxsC9vFPhJ1z7vQ369Tc8Pz+nV69MIma51mT1Hm
 TExMJ8qOU3KDTCEahwWQJrSK4grIYmOAy6Obld5y9SN66pc+IltBVl4ikHUia+HW4z/z
 bWQb8V50oGLxdbRYOKKoshDFuDg6q0HCYczARapfFurQn9ZbJFXzGKOPc6xJlH2kaJVL
 u4xlNvW5v2Owuxd/cCrck9s6bqEFOHhkPWxdYKOPV06Wzhp5Yhf/N0lwLqf5XWwGgQux
 1mZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678195593;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/83GeW+k79u272pQGTACZ8P8QoN5s3z+qgGSys7KadQ=;
 b=MXK1lre0JMPRfrbKJLIVAuhJXJrN6JDUPAhAQKcBXQO3RYqcveR0S4qJS/CDJBG3IQ
 nbpmwyN5kzzdGjwTK9cfItfY4O5RVd7C9JbkInLhEt+U4mCb5BjKyuJhkMX2OHw8bxRo
 TQpKNVi6t8UKCv5L2NY3IzAP+ga1MRhb+kIHLbV/zUzomoG0fpYNgWp6wGA0wZLhMUNO
 v676JUCu57mrLg2Ho79UZwIha4ht95hXPgD84CrphETQd1n+4IM2f1NLIYyJBqTXB0ow
 EzvjqxjGX+4EUQrONhNnJX6elWnlbI6n2avkrIJLFW47ziddzrRT9rkohwVcy3JDYodn
 J8zQ==
X-Gm-Message-State: AO0yUKVD8894666V0RUvTQ37q8D3zxVoJHuK0CcLfurWJSlPH9TBgTOZ
 fGvt8qyd2ktrL11oPaqwZDnS+A==
X-Google-Smtp-Source: AK7set+m4xPGkwvcjxrsa0xqJiCBCyDCtSpTuDesw6kI58ORRZqHfRWaqwjvJMMJC9W1NNYa9+Momg==
X-Received: by 2002:a05:651c:112:b0:290:8289:8cba with SMTP id
 a18-20020a05651c011200b0029082898cbamr4799799ljb.8.1678195593555; 
 Tue, 07 Mar 2023 05:26:33 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 m22-20020ac24256000000b004dc53353d15sm2016169lfl.281.2023.03.07.05.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 05:26:33 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 07 Mar 2023 14:26:27 +0100
Subject: [PATCH v2 1/2] dt-bindings: display/panel: Add Lenovo NT36523W BOE
 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230217-topic-lenovo-panel-v2-1-2e2c64729330@linaro.org>
References: <20230217-topic-lenovo-panel-v2-0-2e2c64729330@linaro.org>
In-Reply-To: <20230217-topic-lenovo-panel-v2-0-2e2c64729330@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678195591; l=1971;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=BL6PgSWTw3k5Fir1Htah32UMjqvFC7StjU4GIG0OqbM=;
 b=rJQlwZtqp7lJNd9CtmzwgYa0SBSj0oonaAuJF9ITro8esekS7gxHnLDRqJ+Ou/NdexWOeXwAppaX
 q0NtCAiFDrC0eTEGaxL9o8xmirics2OUrimDr8L4geKq2E+krbVl
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for the 2000x1200px IPS panel found on Lenovo Tab P11/
XiaoXin Pad devices.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../display/panel/lenovo,nt36523w-boe-j606.yaml    | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/lenovo,nt36523w-boe-j606.yaml b/Documentation/devicetree/bindings/display/panel/lenovo,nt36523w-boe-j606.yaml
new file mode 100644
index 000000000000..43dcbe3f9f30
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lenovo,nt36523w-boe-j606.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lenovo,nt36523w-boe-j606.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NT36523W BOE panel found on Lenovo J606 devices
+
+maintainers:
+  - Konrad Dybcio <konrad.dybcio@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lenovo,nt36523w-boe-j606
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  vddio-supply: true
+  reset-gpios: true
+  rotation: true
+  port: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - reset-gpios
+  - port
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "lenovo,nt36523w-boe-j606";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
+            vddio-supply = <&pm6125_l9>;
+
+            rotation = <180>;
+
+            port {
+                panel0_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...

-- 
2.39.2

