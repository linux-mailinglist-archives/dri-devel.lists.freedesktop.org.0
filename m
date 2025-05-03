Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01216AA7FB4
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 11:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25A510E384;
	Sat,  3 May 2025 09:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZD/+Q3dN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403A210E0B1
 for <dri-devel@lists.freedesktop.org>; Sat,  3 May 2025 09:42:11 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ac289147833so515893866b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 May 2025 02:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746265330; x=1746870130; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GQIWia6L0Jg178d0XFCtM6bTApJzcTaWvyUuVorr3lk=;
 b=ZD/+Q3dN04nVhGztYFJlCeDB0YJsmY3iAe4mMJlntjCA8ompqIV8iJlTEeUFt0v8/r
 vQX2QnfkCr7qkPiiqSBOaD/R3qEXa95JyVQiFz3wAU4YFoZMaqFfoxagBsNHFUY9aXwf
 6xueqIYxVF6CUPQ6NgFp0Ff1b/0L5fLPwwBNPgLIYE3uwygTTkuiNTdSnE0fpK0siBoc
 PxWGtOWzPQlrALD+F6k/CRnJvkYsof5XHatCQrXtH4HX/NbN80HV+UpWUoPAhQhLC+t4
 /XjgpNxVpFfg5q1PZ501GjIl9IVAzgI0xjCP0iee0oMUDDIrgrdfNAHYl+jyGUDZu2Sa
 +wzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746265330; x=1746870130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GQIWia6L0Jg178d0XFCtM6bTApJzcTaWvyUuVorr3lk=;
 b=ufHJst2SBCmN/oVMTvQC8zGpVL69Jt2JiXdpJIzuiMMlHcwnv8zTwSdtM2btu/CpVz
 DLWA9TsVLhkZr2RRDECrervT+sbftj6pgvwdLGtEoXAQnH6o2EYV1/WQQd1ZDwU24lDN
 kLiE0s9PrYtenapSsHjOHut9exU+dffPtOHhnXdsVG6yjhoNk8tHN+lAGBQGLMZSxwK2
 KjWZl+DL3okiVQrG0ckWBcbRZl/NZhM0TOuiett7f1IqcnZeO8z6xKSJsFp/Doftkx0V
 1MuYDtwkOwjaMV1mBsrpeLxgr0+QWl1VfpiCKmcOqAjEn1Gv+ogEX1vDJejJzFfxIHmy
 1KKA==
X-Gm-Message-State: AOJu0Yzbf4qzSdv4XJEpCv+nhZGENGXY/jAFAi3SLN7sQYMxf/6da+eb
 GTJEoZ30WOaSHTYEyNuuGuunoIPrGQN5taNvk49i37fgVzPim/zE
X-Gm-Gg: ASbGnctOjKWkj0B/3N2R6MBg176VgXz1MmB9A7uyPZStaT0YFM5ukZoXJFpuCWns+/8
 OvGcfQDg9MT2p/nPEFAWaJN3W6DfkS2snwghx++LabcE5MvRiY55WUIzLFqH66tOjY32Qq+HjW/
 MSyxzkk0g+v2dpIXf3MEbjijEr/qHuvsuLWDLjlGJ14WpLJubu5odeNCHnKjSQwKP7i7XVrJztd
 8X6bN0cVKbp1K9XZK4EXFQ1KFTX2PZxNlxAgGoiwr7jY6guLb8vxd9dDre/GeDMNBJ+05V6b0iC
 XrufSjLQqLCYiQg5bU2YhCjufExyjCKq
X-Google-Smtp-Source: AGHT+IEWVZdeRIEcQe/WQcAQSf3Fxjah27t1YDOGSRy6oh5d/Kd4cFjWpAzj/YQqTbYJYVpYyudOnQ==
X-Received: by 2002:a17:906:c144:b0:ac2:7f28:684e with SMTP id
 a640c23a62f3a-ad1a4896e37mr42380366b.6.1746265330130; 
 Sat, 03 May 2025 02:42:10 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad18950e3ecsm169103966b.160.2025.05.03.02.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 02:42:09 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: display: panel: Document Renesas R69328
 based DSI panel
Date: Sat,  3 May 2025 12:41:48 +0300
Message-ID: <20250503094149.29201-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250503094149.29201-1-clamor95@gmail.com>
References: <20250503094149.29201-1-clamor95@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R69328 is liquid crystal driver for high-definition amorphous silicon
(a-Si) panels and is ideal for tablets and smartphones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/renesas,r69328.yaml         | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
new file mode 100644
index 000000000000..e062619e71f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/renesas,r69328.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R69328 based DSI Display Panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  The Renesas R69328 is a generic DSI Panel IC used to control LCD panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+            # JDI DX12D100VM0EAA 4.7" WXGA TFT LCD panel
+          - jdi,dx12d100vm0eaa
+      - const: renesas,r69328
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator for main power supply.
+
+  vddio-supply:
+    description: Regulator for 1.8V IO power supply.
+
+  backlight: true
+
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - port
+  - backlight
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
+        panel@1 {
+            compatible = "jdi,dx12d100vm0eaa", "renesas,r69328";
+            reg = <1>;
+
+            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_3v0_lcd>;
+            vddio-supply = <&vdd_1v8_io>;
+
+            backlight = <&backlight>;
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
2.48.1

