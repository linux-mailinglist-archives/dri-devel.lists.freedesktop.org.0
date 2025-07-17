Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BCAB08E9D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 15:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A4610E80F;
	Thu, 17 Jul 2025 13:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k3xRyy0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF2C10E80F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 13:58:10 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-32f1df5703aso7449201fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 06:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752760689; x=1753365489; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MsTpbv6UhxKMuPPt8c1WeoKOTOwLNGZvIDwyOaQY4Z8=;
 b=k3xRyy0CRolntIU1E0x4c7EMmiT+hKrKyzQjRYs9Q7I5cZrMrwsSHm6nsQq3I1vFMC
 GNQOsZCAq6+A2kT9KR60S+nc/liBhtkWeT+kabPHvioR9uip1TCkZfdwwy8RTeQf+hvu
 BOAbH0UbL847mGrMyftBtBV4n+b8IFnc5BnNBwZdg13A1rJYluRV3/u06P9UCZBxTbba
 3ecpeOSe+bJiyajRh6Y4c+8dLIF5v6QlBGTHHntyJF0SnsN/rbOdLNwtOZSetMqn6tPV
 zzBGLRsprNRXOMaEZng9Bhy7XwvKxUeH9+TH11i0VwbD0rce8hfbcvQIckyULKo3Iu/3
 BmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752760689; x=1753365489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MsTpbv6UhxKMuPPt8c1WeoKOTOwLNGZvIDwyOaQY4Z8=;
 b=R/t9pAM/dz08Peu4MWI6EL6AyzUjI+rsuZo2fI+TMppbsR2O84bvLdnlKNYhVBONt6
 WIXzb1RUMVhPU9b/cOoBtsNuaLkruAGt4+Y9rk7nxmMKe65VehPK+5yz04ev/eo4/z09
 IpzB+M2smSGp9FzK5gbvFDVekyhPXvchJ+rcva8wdIi1ENtODrxEM8r9iJcbWysvcgjZ
 ld+DI5FbEWHUeZWAsjgY9Mf9XxEjDZSvfDY6tdypfddN64YnamkELdm6OeO0EUFvgHzU
 mh1XbzCFZy9HZSXb22uEkyTR+PNL29vovCakwAVk6WhlneB25kZc3kUqosnwYEBUW9TA
 Zc3w==
X-Gm-Message-State: AOJu0YygG6G+v01wZtPG2Xha8dD/eW+VcjAnk9RrwfqwPhRdfbQRffPS
 wpHZndWnf4mAqinawvpApWVnspO7RRl4hoPPezDbjOR4OFhUfBX92Nck
X-Gm-Gg: ASbGnctAU+KwBM59eEO5ae5Wmbp9XDsl/maOiuNDnhMFofHE5HbWjzqBHog45Fzf0GA
 vp46k3Vr4IPfsZkh8OoSEo5qzMEecJDG1LwLIKNlpYadTP2P6Br50nWGeeuejLU3zyN0lPjfR+o
 spKaHTxyMBivkYR3naH1oJkqUAfPAduCm8NhRvggiMDWOzujbdkPdMr/lBEtjibnvo2Wy8llTou
 L+NsHeDcyfbr1au7b9YsT/AoYULEsLsnhssbnOvqw5c2Gd24bH1dT3ncnnxVd3hxYZ6RN2pAS18
 nIvBblcc6rXsyaigXJsF4Ut/nTl9QV+ZltRz3KeirfKJlvMkFI+zhYuTdvT+zko0tvzEzEDvxQi
 kw3y6PIvmXDtKeg==
X-Google-Smtp-Source: AGHT+IHAHj2Dcw3e+LQI2BqY4QKo+tAAD3E6vOJyIWJ4OF4EwozF86/heR+YHoVNMqhicve7nqlGZw==
X-Received: by 2002:a2e:bc1c:0:b0:32b:541c:eae1 with SMTP id
 38308e7fff4ca-3308e546e8cmr25168671fa.25.1752760688748; 
 Thu, 17 Jul 2025 06:58:08 -0700 (PDT)
Received: from xeon.. ([188.163.112.60]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32fa29134fcsm23794421fa.15.2025.07.17.06.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 06:58:08 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: display: panel: Document Hydis HV101HD1
 DSI panel
Date: Thu, 17 Jul 2025 16:57:51 +0300
Message-ID: <20250717135752.55958-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250717135752.55958-1-clamor95@gmail.com>
References: <20250717135752.55958-1-clamor95@gmail.com>
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

Hydis HV101HD1 is a 2-lane 1366x768 MIPI DSI panel found in ASUS VivoTab RT
TF600T tablet.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/hydis,hv101hd1.yaml         | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hydis,hv101hd1.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/hydis,hv101hd1.yaml b/Documentation/devicetree/bindings/display/panel/hydis,hv101hd1.yaml
new file mode 100644
index 000000000000..f429e84ee65d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hydis,hv101hd1.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/hydis,hv101hd1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hydis HV101HD1 DSI Display Panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: hydis,hv101hd1
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+  vio-supply: true
+
+  backlight: true
+  port: true
+
+required:
+  - compatible
+  - vdd-supply
+  - vio-supply
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
+        panel@0 {
+            compatible = "hydis,hv101hd1";
+            reg = <0>;
+
+            vdd-supply = <&vdd_lcd>;
+            vio-supply = <&vddio_lcd>;
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
+...
-- 
2.48.1

