Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B31F7B052B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 15:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3737210E50E;
	Wed, 27 Sep 2023 13:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B315710E50E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 13:19:10 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9ae7383b7ecso2157616666b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 06:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695820749; x=1696425549; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Huk11R8abuio8R+T/LI4XP/yxkr/XotUa5HlDC5r0jQ=;
 b=a5w5cE4BoWjPZoIekiqGLAK9CsLSH9SIc0rWnNEElXFvb00HqD4sCVMxH0J1V/FBko
 QJUs0pKb7kuVK3BvOQX3imm+ng+jDNxOhV2JlFTFY0unPiuYgoL69sCyh4pbnIc81cBs
 Ypz02oeMliHrkpm8AipI+rB4wutGeAgmbqGhjDuJRN2okBPZOQtzLlnwe7u0N/bsi68n
 3hdLVo4W80x4BKXq6i3dxHD6Lb8VZX6ErJEGsJOudlPTrdSftSwbkOMvlqwlruRmu8Xm
 tAmAHabQnR0pqwd0/ckvH39GqGj3VQQN7o16QXTnlIEvJW7ZIGGRgvFmudUQu5xU7r9t
 KR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695820749; x=1696425549;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Huk11R8abuio8R+T/LI4XP/yxkr/XotUa5HlDC5r0jQ=;
 b=jJfNQ72SYQa+Ra2JFBeW6cJwKBpViraRsvzO3k1sz5QAFPrKkTmkbOh1293zQ3HvVm
 M6sP/KBzyz9j06mkecLxI0oiOFdSROQL1EcfSgrr9AsQScq/LULuG41LeLfl5pJol9OS
 NUQHBLoQ8YfOrPuBEW72AF1GP9EMBYavlqo779USpyQsmCwYX2AWDDN5TkQ1Dx0U215D
 7iIPHVx1DQzos6q8c0+LahEhNrW2FPBpPhzch7+h4GwSqS8lQxY8zq4r/Kk3NwQ6Ycpa
 ErcebVC8qb8f0bvV+M1eXSULRxclhDbE738Hf02A9n4qmVzBYX8RD2j4wZF2whimj70C
 pUrg==
X-Gm-Message-State: AOJu0Yy2YfoSDUZ3LuvR8YAviktgA3643/dLJMnhlOlWJUONxORr6OlL
 LH2l4eSL3R9ZdFzS1Nzye0/ygA==
X-Google-Smtp-Source: AGHT+IGHvTZVdi2yGYaB4aqyYEh9nb5/nrgESVIgMaKwBIGJi+yY4hRI/oM/Erhu0Hl5I0uEq/0brg==
X-Received: by 2002:a17:907:7793:b0:9b2:b742:d1d3 with SMTP id
 ky19-20020a170907779300b009b2b742d1d3mr1546607ejc.5.1695820749038; 
 Wed, 27 Sep 2023 06:19:09 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 md1-20020a170906ae8100b009ad8acac02asm9369335ejb.172.2023.09.27.06.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 06:19:08 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Sep 2023 15:19:01 +0200
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Raydium RM692E5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230927-topic-fp5_disp-v1-1-a6aabd68199f@linaro.org>
References: <20230927-topic-fp5_disp-v1-0-a6aabd68199f@linaro.org>
In-Reply-To: <20230927-topic-fp5_disp-v1-0-a6aabd68199f@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695820745; l=2205;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mQ6RVBqfnjkn7k7aw7JAtC6ys5lPho9IhAiB1YQIk6E=;
 b=P4qdwJsc/KL+8ZdQDXzOqavmia7ll3W6F+OJdDtWHAA5HfWnWtzK6DjXPgWYNLrwtvR2bgqea
 wUZSOt56u7jBGRX97M8h0hv9/gVhP2s2sODl655ohBXY/dhtHJoqQxf
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Raydium RM692E5 is a display driver IC used to drive AMOLED DSI panels.
Describe it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/display/panel/raydium,rm692e5.yaml    | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
new file mode 100644
index 000000000000..423a85616c1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm692e5.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/raydium,rm692e5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raydium RM692E5 based DSI display Panels
+
+maintainers:
+  - Konrad Dybcio <konradybcio@kernel.org>
+
+description: |
+  The Raydium RM692E5 is a generic DSI Panel IC used to control
+  AMOLED panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: fairphone,fp5-rm692e5-boe
+      - const: raydium,rm692e5
+
+  dvdd-supply:
+    description: Digital voltage rail
+
+  vci-supply:
+    description: Analog voltage rail
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  reg: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - dvdd-supply
+  - vci-supply
+  - vddio-supply
+  - port
+
+unevaluatedProperties: false
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
+            compatible = "fairphone,fp5-rm692e5-boe", "raydium,rm692e5";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 44 GPIO_ACTIVE_LOW>;
+            dvdd-supply = <&vreg_oled_vci>;
+            vci-supply = <&vreg_l12c>;
+            vddio-supply = <&vreg_oled_dvdd>;
+
+            port {
+                panel_in_0: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.42.0

