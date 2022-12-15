Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29E964E15D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 19:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59A110E549;
	Thu, 15 Dec 2022 18:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FEA10E4D3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 18:52:20 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-143ffc8c2b2so451680fac.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 10:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5MuYdw/TKmmfACRBxYwGpprkKtsguH2MTUAVNosMrsw=;
 b=EsXC1CFRIu5XE3KansyZwbZb7jE1sCuVK85dRB5EUL/tBP5HPxbRWXZSKC1Ch6b4H7
 AKfuIu7VNsaEX+ipmv5asB2xobhntEe/QpPaoEHiOW5byJqg6tb9d6eJE++SmuT7+lHH
 qSLNUX92iDTRWoexVLVCDimOKGDQFNhYlXb79X9gs+m6NRfxJIHvBz0oV1z66vOvrHJq
 A+aadhNsjfGHhWA3DgC3bA38GrnK5REZzvr6ObeU8nB85scdaNEANb2pHrnkcubTs1dj
 9sblbJcqdMF57hQ6UrKC05VfCzjb+G6hBE6me/HGVVEu/0tfxdWst4YA37gVN92M1T3P
 bCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5MuYdw/TKmmfACRBxYwGpprkKtsguH2MTUAVNosMrsw=;
 b=DXHkKSZO77pQOnDXa87WSTMDG3XhOiszYMrGgsiF/GikiWZ8xHBbaTpERifd3ny94o
 bQbuwOe1XyFeLziHeXo7xQpANw8XS4DMjmLe6rFU+ikfWUS83qrvBkg53ayoLeHSQ2p/
 EHAf7OkLeJv2sIqcQHFuEtgHZYmR0ID6ZZJxP46quamsuJoSoTqeTuSHcxewZadbyxLF
 V1zxJKmrbUrvUn3RQr7wBJmJJR65wf4/MlFVUyoMs8Piu4oScw7zNbHfH1FD/GnahCe6
 3nnbUSacqKaj7MwVm/jNF6nm7jP0YPsrES6JDxcA2S/CQhDVjadvNoAdWnRsi4ZN25Gk
 zevw==
X-Gm-Message-State: ANoB5pm3iNRsxoaistEikHSq0/jbTkuR1rZlGmPEChZ4Z9bW7n2I1Wr2
 0x+LWwFTC+Fp7a3DBcxUdPXWng/rpsc=
X-Google-Smtp-Source: AA0mqf4wcE/8fIZDMVCDOkQEMIihhUoRExOpVnSoMrmfKqR9LU03LgjASXuXaTwuSizCrfnVMpeUyQ==
X-Received: by 2002:a05:6870:f229:b0:141:e1f5:7194 with SMTP id
 t41-20020a056870f22900b00141e1f57194mr16740332oao.53.1671130339785; 
 Thu, 15 Dec 2022 10:52:19 -0800 (PST)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a4ad84b000000b004a09df5a1dbsm72264oov.8.2022.12.15.10.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 10:52:19 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V6 2/4] dt-bindings: display: panel: Add Samsung AMS495QA01
Date: Thu, 15 Dec 2022 12:52:09 -0600
Message-Id: <20221215185211.1560736-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221215185211.1560736-1-macroalpha82@gmail.com>
References: <20221215185211.1560736-1-macroalpha82@gmail.com>
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
 thierry.reding@gmail.com, tzimmermann@suse.de, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add documentation for Samsung AMS495QA01 panel (with Magnachip
D53E6EA8966 controller IC).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
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

