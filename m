Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA4656CA59
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 17:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AA610FC21;
	Sat,  9 Jul 2022 15:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72A1113DD4
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 14:05:19 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id b2so1019300plx.7
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Jul 2022 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KllOWvu7e5SrcZMDE7g9T24hEywTIkk+v5p3DscJSVk=;
 b=JsA5x/iG8WfSdh0tZ4dxUU7FBSlqz7y9N+fyrUGvUx1PBpFtSnrEp4ERs6Jaoa66S/
 hUIz8pj5tFx8yO/37gDbwdggYTyQ5tFV9Do27iGNssX/cH4aTnns1acqDloV30TZmVJL
 6QaeC6PvgTvfBCO4YCi0Cqt/rF0TVlUkoM9w/+dwgKMTLQrbEbI5sI85CwZbJbvFVFRn
 TbsnCoizLml9geh0H2VCtLar2IYNEID6BdEZTQCxb/0mMRIJfaiRxsfG480bCaN2iMBm
 W4HvAAR/r3yv+FsCX1IIoCqTgDUYtvHs9/4+p8GqI43OtkyEeaVDs5Bkrza/zL6Ag0VL
 HMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KllOWvu7e5SrcZMDE7g9T24hEywTIkk+v5p3DscJSVk=;
 b=wt0XIPWXR07tTFqpdy8MwkkZlCmolxLAxnFroVQ9hWbo5B0tWa07jVnZ5/B/wxpxh7
 sAdaQvBhNi08+DMee3PIj8UJ/Dy4WkdAmQXdLnubRaMDlHQLhO3crU3EU6QN9nvWWiq+
 9qheSSfJmbl7eWo/VD8KcQDLLUN5d5qCtuJhw6WSf76NoX2CRsZciy371VxDtb4VwUSX
 1f0zDteCfLax6zGmg0YsFyynd7EK1AWOrutj1mVm7mQ3GryXEffrsX4c0DWiNoZ3ijKN
 m2NiM1KYSFHJY3mwB0pE/Qd8A5m7gA+soTF4WCRvH2hjwxePl7gg0p31wUpsHziF6bHi
 RLxQ==
X-Gm-Message-State: AJIora86FhIX/5VcnITg/soMw7+61uhBytFtRGh2b3ZstpzUGctI14Me
 +cTRghWHmuLmbIOC+89wxbw=
X-Google-Smtp-Source: AGRyM1t3NFjlPMMPhXryFmJ501+/qhG0UUibtr/WTQTP0ZMNGP5yM8uq3vKteLhBZfDmJf5cX7/JGQ==
X-Received: by 2002:a17:90b:1c07:b0:1f0:2077:6a9 with SMTP id
 oc7-20020a17090b1c0700b001f0207706a9mr1014621pjb.90.1657375519336; 
 Sat, 09 Jul 2022 07:05:19 -0700 (PDT)
Received: from localhost.localdomain ([112.0.189.16])
 by smtp.gmail.com with ESMTPSA id
 x16-20020aa79a50000000b00528baea5dacsm1496163pfj.201.2022.07.09.07.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jul 2022 07:05:18 -0700 (PDT)
From: MollySophia <mollysophia379@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Molly Sophia <mollysophia379@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Novatek NT35596S panel
 bindings
Date: Sat,  9 Jul 2022 22:04:22 +0800
Message-Id: <20220709140422.56851-1-mollysophia379@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 09 Jul 2022 15:28:41 +0000
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
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for "novatek,nt35596s" panel.

Signed-off-by: MollySophia <mollysophia379@gmail.com>
---
 .../display/panel/novatek,nt35596s.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
new file mode 100644
index 000000000000..f724f101a6fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35596s.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt35596s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT35596S based DSI display Panels
+
+maintainers:
+  - Molly Sophia <mollysophia379@gmail.com>
+
+description: |
+  The nt35596s IC from Novatek is a generic DSI Panel IC used to drive dsi
+  panels.
+  Right now, support is added only for a JDI FHD+ LCD display panel with a
+  resolution of 1080x2160. It is a video mode DSI panel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - jdi,fhd-nt35596s
+      - const: novatek,nt35596s
+    description: This indicates the panel manufacturer of the panel that is
+      in turn using the NT35596S panel driver. This compatible string
+      determines how the NT35596S panel driver is configured for the indicated
+      panel. The novatek,nt35596s compatible shall always be provided as a fallback.
+
+  vddi0-supply:
+    description: regulator that provides the supply voltage
+      Power IC supply
+
+  vddpos-supply:
+    description: positive boost supply regulator
+
+  vddneg-supply:
+    description: negative boost supply regulator
+
+  reg: true
+  port: true
+  backlight: true
+
+required:
+  - compatible
+  - reg
+  - vddi0-supply
+  - vddpos-supply
+  - vddneg-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "jdi,fhd-nt35596s", "novatek,nt35596s";
+            reg = <0>;
+            vddi0-supply = <&vreg_l14a_1p88>;
+            vddpos-supply = <&lab>;
+            vddneg-supply = <&ibb>;
+
+            backlight = <&pmi8998_wled>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+
+            port {
+                jdi_nt35596s_in_0: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.37.0

