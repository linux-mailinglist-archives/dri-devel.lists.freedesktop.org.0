Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4095C962B0F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388D010E563;
	Wed, 28 Aug 2024 15:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q3uIOBCc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5983110E561
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:04:28 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5343e75c642so6411261e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724857466; x=1725462266; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EfpPLPQgSBuRiuoslnQqHCmedaNEg3K6zxnI4WC0qco=;
 b=Q3uIOBCccsAubultbSDD1NSAeelDuf94PLTRjCohzClx97pkWJKWUyZ8C9G/TVAhvo
 YWG/KAf3YXZZeAFSS9Y82jrWipWjC96YRTihvuwAbJ29yRRDQMo7rnl0ikH7KqnTff2k
 eae1+JbBsfAa96bncFE6jbs7pAxJa6XisCeexDPXnDL1coD6hLFRAwLKN2T7lLH7SRI+
 wOeVIio4N6LvPeTglnVI+1eXOOxVj3J8FKIU2L/2KxHv4dIfwNIVqiW2+Vxse3Jwr592
 WjIA6/3TXlCaSDTDAffJifuvq6l0SIsB/iWh8YMcMZpHgXSprSb2gKhkXbAtd6fv68Io
 2KRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724857466; x=1725462266;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EfpPLPQgSBuRiuoslnQqHCmedaNEg3K6zxnI4WC0qco=;
 b=GZV0qYRCOfnSxwSwUBPVhfEaXE1/tSyFAdtJ19OOPh+X8qiOuQKEFZPf7kjmukvA5w
 Q5gak6PjJJxgeMbCnJM+3uYgmaKup7KZXHYtdcMvFYvjlOe1+/5yHuwnmWabOQyFjGg5
 HwXdil4efJ1QjZ4IMb3b9h+iyuSm7LFkC2L64JSqXH8QNZUUKO2ZgEtTP4/pHftMkPrU
 hOe1HPHFe+PjkBS8TwMM1FDfm53FdCx/9N3q/NWw+JDQcurivYZy9ZaHn3Ng2KRryF+v
 nYlGZooDwfL3m+ir6qeqLWud2UlYDzFtlfYHGqA2nXCUqXFEWcJ0vjsJst7qvqpoedcw
 RXMA==
X-Gm-Message-State: AOJu0Yyq8F3Scpm84c0oOlfaM3dDah42XshrrnLTmhMGwXgBmJlv5R2M
 jZfpSJie9HMMbbZ/KNNEzBqcgg/kkI+GAmQME97IwWDvRGKqmKfv/XuPCVDmx4Y=
X-Google-Smtp-Source: AGHT+IGbPKvefAd/rmqqZn5znOWggMmO35KcR8F3WxLf5Haqx1urGA+XGWsekKFxEP5y+38P4N/XBQ==
X-Received: by 2002:a05:6512:39ca:b0:530:aeea:27e1 with SMTP id
 2adb3069b0e04-5343886c181mr13320083e87.50.1724857465546; 
 Wed, 28 Aug 2024 08:04:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba63acd66sm24079315e9.23.2024.08.28.08.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 08:04:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 28 Aug 2024 17:04:19 +0200
Subject: [PATCH v3 1/2] dt-bindings: display: panel: document BOE
 TV101WUM-LL2 DSI Display Panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-sdm450-upstream-tbx605f-panel-v3-1-b792f93e1d6b@linaro.org>
References: <20240828-topic-sdm450-upstream-tbx605f-panel-v3-0-b792f93e1d6b@linaro.org>
In-Reply-To: <20240828-topic-sdm450-upstream-tbx605f-panel-v3-0-b792f93e1d6b@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Doug Anderson <dianders@chromium.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2015;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Zo7rD7LhsqXVWI1DlfMsF/Q1UaOY4RkLnQpyLGe4S4Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmzzx2e+rGJcY9aA20YsXF2siW6akjbc73Kqn1Tmhi
 Kmp1SoeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZs88dgAKCRB33NvayMhJ0aaBD/
 4iXjIOlveRa6jF3JZdEq5okV2hJqVKi93AU82I45MdmKsZ/MDVAy/SGO7sTfYOqWy/LauFfr3dyklo
 ioA7eKXwxf56enMTbyPftTAw7y/jB5wXHouMaxy8EDxm6StkGtgryC8donIUtYwM+ObgtLZgj7+1mf
 uJTtbrOeNYRVhmEFLjkCWkyFrX3MXlnZQtFrxu+Ky1gAyrYc6XAz8wpiQYL+2XKFm994BVq4Iz8k54
 a7t1bXvN3IF2fW3HDFRz8ToBZE40/1YLW+1v797Fpn7HPUGZuVVWMrReYhh6iDyGVn6G3yKZh8DarN
 WKi6x8hP1t4/X2qlmjgcPcN2zswdqksCWf6GV8DQMekWO45fYHxHxt8nw9mDqMTFXmfCsNqFv6RbGb
 4nw9M8iOouhMtZsMxG5M2pNZqy1fIt3+jrp2Dv17huEk8CNQrCna7ToLOWrLzyLtlOjq6bnM20lIRa
 tnDWFZfBUcc3BQbhyIOq2wa6INvyjbH7ERC1Qw4WxF0UIYLOpPsugJQnDU58Af7L4JJJNI4S3ZUTnN
 W5z6Mm3ywQuQqNN6JAvQx6C1ATiXPpy/OjnZoGC0WPv6EbVJ3cISWFKobVw2FXo9MOP4xS6e4q1tNj
 sYc8FSjB5sFYr90whLpg/aOJqUUvREmiLjY7DWQKsV41oCxaq8szbY+SGWxQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Document the 1200x1920 BOE TV101WUM-LL2 DSI Display Panel found
in the Lenovo Smart Tab M10 tablet. The controller is unknown.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/panel/boe,tv101wum-ll2.yaml   | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml
new file mode 100644
index 000000000000..dced98e1c69a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-ll2.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/boe,tv101wum-ll2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BOE TV101WUM-LL2 DSI Display Panel
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: boe,tv101wum-ll2
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  backlight: true
+  reset-gpios: true
+  vsp-supply: true
+  vsn-supply: true
+  port: true
+  rotation: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vsp-supply
+  - vsn-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "boe,tv101wum-ll2";
+            reg = <0>;
+
+            vsn-supply = <&vsn_lcd>;
+            vsp-supply = <&vsp_lcd>;
+
+            reset-gpios = <&pio 45 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.34.1

