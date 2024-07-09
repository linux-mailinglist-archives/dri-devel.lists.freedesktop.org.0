Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70DD92BA7B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 15:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3052A10E541;
	Tue,  9 Jul 2024 13:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nirX/5id";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C8710E541
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 13:05:55 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2eea8ea8bb0so35609181fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720530354; x=1721135154; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jbNayVJr9rOaf+AdR4qLuePlMRMX+Lq4+sIWrvY2Hh8=;
 b=nirX/5idSgqWU1k7Io0jTLORcAJ/7Wjt9ne1XSzbvvnwUj3o4VbSj9kfCVahs8WViJ
 LvfmZSt/vW3WSNJInqlC8y1h95Pm+cRGj63V9ZrMlZnjWARiDzrezBw3bWlkW4ObRdV7
 68CnV5Eq7b0keGkPkYdjajS6sB9sz/I9BfkKLPAxb1yQz/nDFjy9SqxtzCoL1H54V6uU
 iZpBphjthe3TlBWQn+4sfzHq3RUP2JcVriF6ROKkQTe1hlgmeu55LNuKhlLczWmCsx33
 5mRjNbqYoPfYiR9pJGb1CeO1GL/kP0/6Y1S6QTPIVd/Bel0vToj9fezW49haEdAkxX+m
 djdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720530354; x=1721135154;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbNayVJr9rOaf+AdR4qLuePlMRMX+Lq4+sIWrvY2Hh8=;
 b=PI+g/JatFNYxjvNAFITo2NbduYDCvsY3h3en6ib6BusyepyUqQ8IXL4O90GAuAa9Mp
 NjUfKGsVZOs0JQdDrDvybA91OW3AOhHV6L6Iwwg0lYJNsXchxFoL1luIUtAdBsHf0crP
 SQn1JtWtfy8w1ADQgZcIExkw3fBo8pVN7RKQPaJcLphQXRlBd1TtbGnu46+J3jXBd6AW
 0ed6gZ4RLaJl+YAQ8zV39AKQlIXl7/kY2tx6p+3dxGmlC32FTyu6hKh3Onvk+lTcQEIW
 hH2rNq3DYE9lD3bnacRqPMcISJTFia93yQPmFk33i6ppsEDbKzwygZCGKV4oVvCOGaqz
 tEzQ==
X-Gm-Message-State: AOJu0Yz56nFqzhKD2r9pmWcL6yQBh2IhSd1p2ToxBrMCMovS9ZBzpPvD
 m2zp4ToPUn+10OtHf3hFRurZxNeIB9NFJ1OW0BLxJInMaRIOh2DOm/JYTKJoK6k=
X-Google-Smtp-Source: AGHT+IGl2YCvaMbWLiEcR1rhNPaQEVPyNfHiJ7ATMAjObGvX7mk/AYzSbc81HlfG8hyWR4Sowl7AFA==
X-Received: by 2002:a2e:9695:0:b0:2ee:8817:422d with SMTP id
 38308e7fff4ca-2eeb30bae90mr22063991fa.5.1720530353700; 
 Tue, 09 Jul 2024 06:05:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:e487:133f:fb1b:7fc5:f63a:ac6f:62c6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f736939sm40812395e9.37.2024.07.09.06.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 06:05:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 09 Jul 2024 15:05:44 +0200
Subject: [PATCH 1/2] dt-bindings: display: panel: document BOE TV101WUM-LL2
 DSI Display Panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-topic-sdm450-upstream-tbx605f-panel-v1-1-af473397835d@linaro.org>
References: <20240709-topic-sdm450-upstream-tbx605f-panel-v1-0-af473397835d@linaro.org>
In-Reply-To: <20240709-topic-sdm450-upstream-tbx605f-panel-v1-0-af473397835d@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1959;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mlSpbyM8SVEH5mQ9NXQsLdRRwy/Rr3F4/HZMYlmQL4g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmjTWtERwPm9umBBymSswYDO0ZU3Se2jjiICMwZ
 oBmDJPp+QOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZo01rQAKCRB33NvayMhJ
 0VbiD/wL4P7XuyhVC555StSDLegTWEcPYp1foJY/0cbug6grY8ebtV69kBkENU6e5m5Aag0KsWZ
 sTIjD/25SyEnnIXxz8G3wvrdDouvaICgGdM7A00BXrA9tC39u/1Z2LBYsyY+x2JlG3/uxZK8hPs
 QTaWxgpoILJKvUNaswtKMgDnCrIDPuE8zirH9C8j1FmbsA8E5204T6WjyYHCNYuEkQ1PV9CjxMO
 Ge6ifcWVHDEsliLXaBf/394ue6yMZZVkkqMf3rXCz6emFJVYrkqGuhdKpMhWIFh9F4RPNoTBCGU
 hiRLYOspoMCRhEilJyag3M0KCFHztnR4A0Y362GAnZw1H79Dp/xJl6rtLAb/AmgYEthLiS4VY2k
 DX09yqhO7Wr6D1ecIiT6339I76IONN2fmXbPsb/ol3LxbA0qOWZxgZv25CkZjLoE99PeqeqbH3A
 RlNDN8q9oWUZWzith7Hu4Dn/OsJ5LJmbb1kDixiGcsox1Wunlrbva2MoOo2fW62lZHI91T3a8/d
 SCjXMH9kC9B7nO+DQgRVkzdd60acTSY4d6PuW9dUXmvP/FYsTwFzrVvCklUsmt1zOCteXtSsrIa
 hkdYidmXQpZlm7fA1B7RBrwv5HibyjMhKA+8PgHv6xsPLTMsMPMogZO9barw2R0EcWiM15R/NhZ
 LZmI7p2gtml3M2w==
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

