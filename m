Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AE16C9650
	for <lists+dri-devel@lfdr.de>; Sun, 26 Mar 2023 17:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7925A10E212;
	Sun, 26 Mar 2023 15:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4116710E1DE
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 15:54:35 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id i5so26403262eda.0
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679846073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vHf8Iv0NI1emcO/z/ewyqHnQEFOXmu7+0ljc1Q4ZcJI=;
 b=tE+yQdG1T2SqxcmRUDC4jgRpO3h7Oj3NGFQfvFEK8Rta9B5C16LDC0qSp7CL3kczar
 bl39yE1ZDZ9p3qAwBysPv7OZjSex/W12Yy4uNYL7k3aDmVQJZl/yAE672BmWGLl4Rz/k
 7xywNh3tkJCtL/5D0E787Sxg7zaxdLRghGEfN/a+dOkqPg0lXfRv0Hzu2oAHurJCcS6y
 Hps9EoPrUrAZHrJJ4L1yNpdRn5hTOYk18r/3mrClj6p7PEWAtQUxWUXk05CnBuB4qJmY
 mCt4dKIQX5nr/RdOBnLYFdW3YLEYxUKBE2DuZcU7+jmn3FLHm0gXTtNT05XCdjzcl3Vx
 hh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679846073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vHf8Iv0NI1emcO/z/ewyqHnQEFOXmu7+0ljc1Q4ZcJI=;
 b=rM6Vc1v7hORaDNu9NO3gKtgtTigiK4Ye0xMHsunBlFGrN0PUpa0XwqxY3x1KLcajsV
 xbCU8Goa5yQ2PFzDYZAgOHmYq3akor6R3eNuxn8Vq6P92wbI/O/HbIO0xdo1LcFTOO7m
 rMCxMpmkbRPdbxnfRpimZ2diHQgUiTJkvhsZ6lIwy5YefI6Nmluse5nRys6apjf8lRrI
 +idJr+0t3joWwEG/0LPWGVnUucgA5ILNflZEEB+BXJErAEy8rPOF0VQadEqAUzxh52/a
 vNF4mPgRirABSndFyjbxSPgJKigr8n95E+rXhRnQetG6M2yI9qeKnUPHApVVAEiD9ytj
 kM4Q==
X-Gm-Message-State: AAQBX9dcgAYjNyeffpRUfwGQrCGTxLFJb9CkzP7yci4TBiKJ/d0SwLFA
 fL1EXPmiD4uby5Qm9d3mOHSxxA==
X-Google-Smtp-Source: AKy350Z9yW9do38i5Qti2/g6ZEwstDQ0vYhgJqnw6UnOMq56bflHZ5rivUZlOZlnskR73Qd+s7j7pg==
X-Received: by 2002:aa7:cc07:0:b0:4a2:5652:d8ba with SMTP id
 q7-20020aa7cc07000000b004a25652d8bamr8542357edt.18.1679846073737; 
 Sun, 26 Mar 2023 08:54:33 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a50d6c6000000b004af62273b66sm13506742edj.18.2023.03.26.08.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 08:54:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Srba <Michael.Srba@seznam.cz>,
 Harigovindan P <harigovi@codeaurora.org>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] dt-bindings: display: visionox,rm69299: document reg
Date: Sun, 26 Mar 2023 17:54:24 +0200
Message-Id: <20230326155425.91181-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230326155425.91181-1-krzysztof.kozlowski@linaro.org>
References: <20230326155425.91181-1-krzysztof.kozlowski@linaro.org>
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

Panels are supposed to have one reg.  This fixes dtbs_check warnings
like:

  sc7180-idp.dtb: panel@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/panel/visionox,rm69299.yaml       | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
index 481ef051df1e..444ac2a4772d 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
@@ -19,6 +19,8 @@ properties:
   compatible:
     const: visionox,rm69299-1080p-display
 
+  reg: true
+
   vdda-supply:
     description: |
       Phandle of the regulator that provides the vdda supply voltage.
@@ -34,6 +36,7 @@ additionalProperties: false
 
 required:
   - compatible
+  - reg
   - vdda-supply
   - vdd3p3-supply
   - reset-gpios
@@ -41,16 +44,22 @@ required:
 
 examples:
   - |
-    panel {
-        compatible = "visionox,rm69299-1080p-display";
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "visionox,rm69299-1080p-display";
+            reg = <0>;
 
-        vdda-supply = <&src_pp1800_l8c>;
-        vdd3p3-supply = <&src_pp2800_l18a>;
+            vdda-supply = <&src_pp1800_l8c>;
+            vdd3p3-supply = <&src_pp2800_l18a>;
 
-        reset-gpios = <&pm6150l_gpio 3 0>;
-        port {
-            panel0_in: endpoint {
-                remote-endpoint = <&dsi0_out>;
+            reset-gpios = <&pm6150l_gpio 3 0>;
+            port {
+                panel0_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
             };
         };
     };
-- 
2.34.1

