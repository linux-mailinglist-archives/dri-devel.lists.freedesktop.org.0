Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FEE69AA56
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 12:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEEA10EF7C;
	Fri, 17 Feb 2023 11:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AAD10EF6F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 11:29:12 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id y14so730117ljq.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 03:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zNs2vQo3lLrcKzglv5bVhib1E0B0JYWJk13Jcuaahds=;
 b=OqrocxrwWYfL5lGbp6Ljezuz+33eJkd89GCGdKsCCuMzqRWPC5EJ2rKhvsiddg56cY
 9VoBuMeO0i0uKqBtzl4snMImuVNFe3l2C2uhc9lY5qiCnETQrbHA9H5RU+6kQdexLVhs
 to8ajaKBXJjaFtzLCUMgjnBhUK9csj/DPF1/sP2RV+RaITnWUxWptlorrJj8SU85fdn1
 oRuFbTuoi+e2gJGyBBY13kuC0MzyOgSh0LsKpbC2kuY9jrkF2f3j++8k3ZzE/NAob6at
 xM7m75h1lov/BQy4TaaGNpEkMsftlzkEuj4w4V8U1kYEHlu3fHrNblvycCkC4QNn2JkO
 NjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zNs2vQo3lLrcKzglv5bVhib1E0B0JYWJk13Jcuaahds=;
 b=pnHCE6H7Q0PcMAV8DoQm46+3/Y1pi4keXS7GmxmHIjA52qQiwMdTXnxpdTYJNw4Zfk
 RwPzLwLq98h4QlrQVt/mbmvUXJVRpcwK31ohtXDRARMtlBJVTLqPt5B6hnbDdw8l/gfg
 Jxajqo+ihZd8hhsH1gvdoZIZuNcXokkzvI2IRfewtZNmYVlR2wmlDyT7STnbzpVyZATF
 cGn4xayjiVTJmZatPxiu4I/20tBrwqitzK/gesSunUYQRZTbZMAKXyRKE8ts56JTQqhn
 sPy8ABQ6ikVDbLDu/qcRNaRh7hQREzwDj2ukOcIhUE31uIzoNg2ezdzK/Hm2iEwPib9D
 tvRA==
X-Gm-Message-State: AO0yUKWaCCOKTHNxRy8Jpir3MXcvgbIlzvCKWdsWsuEoq6qr842pHcQW
 t6IMjLfMow5DJbT+w8+IxvDODA==
X-Google-Smtp-Source: AK7set81u41zfJQV9AdDmWw/82fi4vi52yOxCBdmhRt3iTC5jNu9cUlmqnAtWSTEC82S0qVxqMh6cg==
X-Received: by 2002:a2e:b5d9:0:b0:290:77e9:9bbd with SMTP id
 g25-20020a2eb5d9000000b0029077e99bbdmr2274283ljn.9.1676633351215; 
 Fri, 17 Feb 2023 03:29:11 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a2e9546000000b00267232d0652sm564505ljh.46.2023.02.17.03.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 03:29:10 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 17 Feb 2023 12:29:07 +0100
Subject: [PATCH 1/2] dt-bindings: display/panel: Add Lenovo NT36523W BOE panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230217-topic-lenovo-panel-v1-1-9d7ee1602089@linaro.org>
References: <20230217-topic-lenovo-panel-v1-0-9d7ee1602089@linaro.org>
In-Reply-To: <20230217-topic-lenovo-panel-v1-0-9d7ee1602089@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676633349; l=1927;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9RfuxhpRFz2/QmkCIpkPslVFnzg6JhJYl/h6DFFCsbE=;
 b=Q3iNOeETVlZOsQu8rH9tZfomlp4EESrQCCX5l11srlq88Bdmd8/XCtd+SK0wZf8bvZmgceCXR7NC
 VanJlPBqC1tQHu9ivaS+kb975TUDPfFWNRmGTnMZEIIMGTbynDsI
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
2.39.1

