Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F0FC437F3
	for <lists+dri-devel@lfdr.de>; Sun, 09 Nov 2025 04:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8352710E068;
	Sun,  9 Nov 2025 03:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S0HxSk+R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585F410E068
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Nov 2025 03:22:57 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id
 d9443c01a7336-297eca3d0a3so8355825ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Nov 2025 19:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762658577; x=1763263377; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y6/p/VFD5rODc41UaByBAjykLqoESbzOCT7V1sUMyAw=;
 b=S0HxSk+RTdmKWnGtTlXSdvB6D+gGD5+TxRY9AWnnQ3bQ4XXpem0NY7CCqnnaoiLBNj
 v9H9gOKRII+EEQexcLa9RJKBKWQscfd9cU+Eyju7x9VsZC9iPzm+qp9fRU6agk+sRXBh
 Os0hZ0vLcA5c1ClecfKQTXxY/432nV0+ACUOie3HoDFMX5asmM/ep61V4Gf+W5ICuuDB
 pJApUTkvUEYcDYwR0ts7KqBnOOYBupVLrUd6mo1zvH4gZXgElSn/bdgD0Xkfol6cFjLa
 k/uRTDfQPcllWccYYlT50w/ImnYtxpWp1gPrcHlu76au+YfiSnil376IfRXSB6iTpbXz
 m/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762658577; x=1763263377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y6/p/VFD5rODc41UaByBAjykLqoESbzOCT7V1sUMyAw=;
 b=gKCX/TavoO9pt6dx5cd0WHZiqn49hjxuQlQzjMnJUGuHwmVKfSsf1mEs5am3IOiPsI
 0Qv+tdH7kFGirVzK7Jsebz+sZPCGImdG9exzb7cvtX00SfDCZuoBK3b9DsEv+6zr3YdD
 an9abuHJpsxeCGhIy7nOfeHOM0SEDHXRCeo03E9TDsBUllYOlN0iJDxlcjn8Er3xmMWN
 YVg3E88uPhLkm9i2LjWOnKw6gL87ySeaU9ePs4n7dWnmzX8JdETcFFVjdG/R47BUc8Gk
 L8WHFFk8NVz/RN5DIFC0qSNELKFmtBXIc4k4vZHklwrxKI5p39uXNnrrG1fW00Yl9lPm
 fkfQ==
X-Gm-Message-State: AOJu0YwM+R8SgRjknvmq2ScPmawY2hQ/XB7hErpZFanOth2r+PSN+iC6
 sPdyIW/YIZtRlh8mprXG+wilm+ATmst82DYwEXpz3RJk6hwgjyWDYJtS
X-Gm-Gg: ASbGncvmEtQijMD2fDLRaTG/qqgzSiVUk+6OHLBlpQBJQM5vTzZtnixI4yaYrLfCNsr
 CUgj+nppd0OkETtuGY3cMCbjhFDezyA1WalTWHTqMt3DfX5G8f0Qf01CWi+kEn/gncw15fGYqXn
 w1PWrkmG0RThmzcadIMDkVIL12nFeKneRVVn9iG55Vetb4SNYF0gtnGfUnLfFiCUbx6JpMDZOMN
 5g5iLz3SsH1bx4CSnpF1zs+g0lIeSZ+aOLYxrqluEbBdAtaAj6sTdieXlHEpk1nM+qOsJOLBWVg
 KdmYNOj2Lf0rny24jWZIWR3wAKR9MyXBAY1itLGE2Kg+yFIpmudQD7oRdYkx1MqnOuRccLAUISW
 63KRe/kvfRqDMTPcArpivqFj0Nu3UjXFYi7BQ7IB5GumiQYE8DCY8tZDaTefALV02OTurJuODmW
 1GbsiCBzE=
X-Google-Smtp-Source: AGHT+IGjUSrbW6m1DH+9XkPyVh7AhctSYExE5kfh2YwM8eVJ3y2QK60XKY2TAgRvk2wScpvMqkmDcw==
X-Received: by 2002:a17:903:3ba4:b0:295:70bd:b04b with SMTP id
 d9443c01a7336-297e5708ef8mr48929025ad.55.1762658576771; 
 Sat, 08 Nov 2025 19:22:56 -0800 (PST)
Received: from VM-0-14-ubuntu.. ([43.134.26.72])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-296509682casm101941215ad.22.2025.11.08.19.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 19:22:56 -0800 (PST)
From: Junjie Cao <caojunjie650@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Junjie Cao <caojunjie650@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: leds: backlight: Add Awinic AW99706
 backlight
Date: Sun,  9 Nov 2025 11:22:39 +0800
Message-ID: <20251109032240.3422503-2-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251109032240.3422503-1-caojunjie650@gmail.com>
References: <20251109032240.3422503-1-caojunjie650@gmail.com>
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

Add Awinic AW99706 backlight binding documentation.

Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
Changes in v3:
- breaking a long line (Krzysztof)
- rename backlight node (Krzysztof)
- Link to v2: https://lore.kernel.org/linux-leds/20251103110648.878325-2-caojunjie650@gmail.com

Changes in v2:
- use proper units for properties (Krzysztof)
- drop non-fixed properties (Krzysztof)
- add properties(max-brightness, default-brightness) (Krzysztof)
- Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727-2-caojunjie650@gmail.com

 .../leds/backlight/awinic,aw99706.yaml        | 101 ++++++++++++++++++
 1 file changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
new file mode 100644
index 000000000..f48ce7a34
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/awinic,aw99706.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic AW99706 6-channel WLED Backlight Driver
+
+maintainers:
+  - Junjie Cao <caojunjie650@gmail.com>
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    const: awinic,aw99706
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO to use to enable/disable the backlight (HWEN pin).
+    maxItems: 1
+
+  awinic,dim-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      Select dimming mode of the device.
+        0 = Bypass mode.
+        1 = DC mode.
+        2 = MIX mode(PWM at low brightness and DC at high brightness).
+        3 = MIX-26k mode(MIX mode with different PWM frequency).
+    enum: [ 0, 1, 2, 3 ]
+    default: 1
+
+  awinic,sw-freq-hz:
+    description: Boost switching frequency in Hz.
+    enum: [ 300000, 400000, 500000, 600000, 660000, 750000, 850000, 1000000,
+            1200000, 1330000, 1500000, 1700000 ]
+    default: 750000
+
+  awinic,sw-ilmt-microamp:
+    description: Switching current limitation in uA.
+    enum: [ 1500000, 2000000, 2500000, 3000000 ]
+    default: 3000000
+
+  awinic,iled-max-microamp:
+    description: Maximum LED current setting in uA.
+    minimum: 5000
+    maximum: 50000
+    multipleOf: 500
+    default: 20000
+
+  awinic,uvlo-thres-microvolt:
+    description: UVLO(Under Voltage Lock Out) in uV.
+    enum: [ 2200000, 5000000 ]
+    default: 2200000
+
+  awinic,ramp-ctl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      Select ramp control and filter of the device.
+        0 = Fade in/fade out.
+        1 = Light filter.
+        2 = Medium filter.
+        3 = Heavy filter.
+    enum: [ 0, 1, 2, 3 ]
+    default: 2
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@76 {
+            compatible = "awinic,aw99706";
+            reg = <0x76>;
+            enable-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+            default-brightness = <2047>;
+            max-brightness = <4095>;
+            awinic,dim-mode = <1>;
+            awinic,sw-freq-hz = <750000>;
+            awinic,sw-ilmt-microamp = <3000000>;
+            awinic,uvlo-thres-microvolt = <2200000>;
+            awinic,iled-max-microamp = <20000>;
+            awinic,ramp-ctl = <2>;
+        };
+    };
+
+...
-- 
2.51.1.dirty

