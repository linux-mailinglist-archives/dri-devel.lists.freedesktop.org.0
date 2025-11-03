Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 859D9C2B3DD
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 12:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAE810E240;
	Mon,  3 Nov 2025 11:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SkPmGgRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7132510E240
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 11:07:02 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id
 d9443c01a7336-294df925292so37397615ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 03:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762168022; x=1762772822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vwqxs3pFPgUNdzREwICsv/UCTbRI0baMAHgNVcVWKho=;
 b=SkPmGgRcez1GUGmCv8E7kEpjqXMafal0/minJPhRD4M4bQGbQvvGoaOnYYmXIxStQN
 +QyPBs+jvJjOYn7XpbNjl2IPZgTYMzx2qIrQXYoTsWQpfEB6Swvarh96a9v71jQILMUZ
 G2SaD0ZORTJ3YRJlzF7nG77WVcQCBqO/353ur/+cSP8wlTs+f4SgkUrS+ssduoVZKHl5
 v9JpKxMO+cMfRLmcz2i0hgtu2igSwlXwAFT1QTtytJoQ0JUkmU70/6Y85SpcfuIu6unR
 3O0nbPCHBXPJRNjrNgd6n/ou/WBfPQv5E7/eFHm/7q0IPnBQM/Fy4pmMGrBsRPBXStGd
 84/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762168022; x=1762772822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vwqxs3pFPgUNdzREwICsv/UCTbRI0baMAHgNVcVWKho=;
 b=SBr32XSAvsxyLAxD/ZobeMjXWwTymtoO41jG+zRn7v97LsS5+L5U7aT7VmS/EboY55
 6EdIPoMskY83m3b2AhJ8aeWyUV+XcVfOaon5FAXIarkOuLCSpB1p2INE8HSeiDqQyals
 iI+Yrdhl6PrqTJgoXl6du8DSCWJ7Rn4CRAzLGL3M+y2TX/seMnSX3JEZBLeMsx+gOD10
 vJQEaTXNVM4izN29yGPlUKBX2+ttPnrrjwi5ehNMRvEFDpZQ18rTfqdDXn5G+JCsp1zA
 3tTcL6jRiyIIUnWz/DqizMS9UTEk9pN4EkeLBQPDRjuLBI8iYsBSjo077aAc9JVsvBI+
 cafQ==
X-Gm-Message-State: AOJu0YyhJGKZP8gh7+JjLwpchHwmb+DGcujpt6Eyz8fbXfxP/Sj8kj37
 XvRQGkLmFV7gu5WMQyn0yC91m2p1ar9tkfzqYQEbFxmFRlAzNmdqYqEJ
X-Gm-Gg: ASbGncvbua4/RCMOqnbXVFXqy4AxuL2fYSL5Q7tpMo60fBt9dnbfMYezesLbhlOgVXx
 G5Nhjer016MsBksqSniqJ9gv7Zxxk0/7+11w1QHGCcDpDx05HwGgthSEJkXbQ8Ht/c87v5ZjjUV
 RY61C4JMlFPsZzxHETa+yiP6Af5HQkWVO1tACSSMMznqml3xSnTWPKL2S3+3BIvZcTeisk07Ipr
 ltCADzgWVXs1Fh4cv9kPEjHzcQzrwBZH+aJpwov4IpBB5Utf3BTxeSEuQaIkMh3m4nZL8R/jm1/
 uIAx/Pji0LJdeWrN186+nNwBbBaFwGN6q1yuTg1EHlm5cOOUuMWnbmeiN8h5+Hl+5+8x5YncQcS
 BDO/JAJ3n7Au7DVLVUlU+APYcXIS2FtxW7S69GpKOjDXF1/XAy0S3q/H1aD/GqtfdW3nV8FAMzb
 yg7YSw/IAWcPFkqLewRw==
X-Google-Smtp-Source: AGHT+IED1NK8Nun74yVDxcwX2L2vPElvPQSyImAaJGU2myF3ZiOioVg5mqtofEuE0gFzFHfeDCXjwQ==
X-Received: by 2002:a17:902:f682:b0:295:8db9:305f with SMTP id
 d9443c01a7336-2958db93392mr64853685ad.34.1762168021882; 
 Mon, 03 Nov 2025 03:07:01 -0800 (PST)
Received: from VM-0-14-ubuntu.. ([43.134.26.72])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2955615d720sm84025575ad.65.2025.11.03.03.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 03:07:01 -0800 (PST)
From: Junjie Cao <caojunjie650@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>,
 Junjie Cao <caojunjie650@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: leds: backlight: Add Awinic AW99706
 backlight
Date: Mon,  3 Nov 2025 19:06:47 +0800
Message-ID: <20251103110648.878325-2-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251103110648.878325-1-caojunjie650@gmail.com>
References: <20251103110648.878325-1-caojunjie650@gmail.com>
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

From: Pengyu Luo <mitltlatltl@gmail.com>

Add Awinic AW99706 backlight binding documentation.

Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
Changes in v2:
- use proper units for properties (Krzysztof)
- drop non-fixed properties (Krzysztof)
- add properties(max-brightness, default-brightness) (Krzysztof)
- Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727-2-caojunjie650@gmail.com

 .../leds/backlight/awinic,aw99706.yaml        | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
new file mode 100644
index 000000000..9b7266e61
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/awinic,aw99706.yaml
@@ -0,0 +1,100 @@
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
+    enum: [ 300000, 400000, 500000, 600000, 660000, 750000, 850000, 1000000, 1200000, 1330000, 1500000, 1700000 ]
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
+        aw99706@76 {
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

