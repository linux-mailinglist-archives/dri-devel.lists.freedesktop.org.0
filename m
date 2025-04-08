Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20929A7F588
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 09:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F071C10E5D2;
	Tue,  8 Apr 2025 07:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Elw4gTAx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EB710E5D2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 07:05:00 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30eef9ce7feso52885111fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 00:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744095899; x=1744700699; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=q29XRV8jow8lez0T1Keu8H56xuoR4eRfKdNnJPNuVxs=;
 b=Elw4gTAxaoWF1s9UoF7WlpazLrn1dNvdxyJhDUTG2WxPjgH0CRzFoKLrrQEz+HFL9/
 ZjIF1a9BThUPXT0zpQ5tvAj4u0kfqPbzmzSEzKeqW3kVArOAaMrVoXNctZdgkvR50sZq
 1NcQzu4nScyexgfs4hYeDUmxw3tAKrVkvXbscWHeNosNe6fFXkfFccj36KzaiG7BALZl
 ty6awJyGIvA5/3vV/PRZT6RpFZGruiF3Z/BSoW+iFC2bS4010kD1S49Z3UxrZ+OV53/w
 57C+cdXhLf3l7uGv3Mnr5GPlTdmOXOQt7AaOy7zPYtYGyW0f10FleMLSOs8xpmJqqSMC
 dWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744095899; x=1744700699;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q29XRV8jow8lez0T1Keu8H56xuoR4eRfKdNnJPNuVxs=;
 b=iPXiAxCShcVawbse9y1WxYq/M3TPUaDkZ0oYBz/jkB9BZu0Abve1cUvX2M8xAB5+K5
 DbXyz5GyEdHbPq+SIWKHpeSQMxi2ThreqK5pUEehHpMoMNfF3LtZGqP3VhmZ8Cka6izW
 pO8A2FsYyKaPDfHhABrgV28Xm/HbVbQJZpJ8ZCUBADko4KphG/UYWdeYLsRkLP3mbZ8m
 mB4JUmoHUkRF7Hv2AaiGZ9f/q7llrZ8dm8924BkBSY6Q4ndShQIPmN2Q+GATNS9Fz2Yj
 b+pH+9v1qVJoNBmf9HzvTR6o92iTtZtxA7iW8JdVOYJMsfPkf0a92NXIDYwxjYBejvDC
 WCxA==
X-Gm-Message-State: AOJu0YyKLq1tTSMq5gWMwvQdAIpDzXd5xoziY3cw7CAgR3AEDPciueA3
 ++5qVVdoyJ1pd4PlYKXD+pwIxnLBV1DophjKXZAfJQewxf/fF1D6
X-Gm-Gg: ASbGncvQXyjI5YTFtLrMVcCa/1ggfTdB+0zw+ab6/oHoK4oLk6Nvb/zcsIAcLXEH8zy
 XPm8K04z/+n9JsinA7M0EhJuaWAXkhDCoODGHvU7sczf+R67/i0jpdskFX8Qh3ihWpJNLHVcrfq
 +a+U+WG4kM1YkDWnDYgSd5Mqfk8cqcJi3rUtJH5tIxZGLOZ4raAvgYMxlAyLLd5eD9++LwMzoOA
 LnMNKjPkk6MrvI0lE22btPL1KYFnuZbCiFih9twIFys6qmh1LZ9Z2qqOFKNZwvFZG1NBNc8GmOe
 +1xUlbbNHz6skAtc4HBhFU1HcHf36uxDCo1wEedF0/ujEXkThzQSEF3yyAQ5XX2e+aC5JBfnhyL
 IVZZN8P0aLtRtQnzTkMbYeqM=
X-Google-Smtp-Source: AGHT+IEXZr3tAghBsf0ciq11I50CFCGHpuS2+SMnSBhb393VI13306cCOCwdFiGQXaSZdEP8pRZ0Ow==
X-Received: by 2002:a2e:ad90:0:b0:307:dc1f:e465 with SMTP id
 38308e7fff4ca-30f0a133afamr53460981fa.22.1744095898940; 
 Tue, 08 Apr 2025 00:04:58 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f031bcd37sm19252841fa.76.2025.04.08.00.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 00:04:58 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 08 Apr 2025 09:04:28 +0200
Subject: [PATCH v3 1/3] dt-bindings: display: Add Sitronix ST7571 LCD
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-st7571-v3-1-200693efec57@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
In-Reply-To: <20250408-st7571-v3-0-200693efec57@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2216;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=8jsXPoD8/rVl7BQngK3NPkNA5m5l8CicRc1UHvgLl8Q=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn9MqI/6MAlJHkJFAGEAFtgGr3nulYXwgfcprBv
 UZsVFY9NFaJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ/TKiAAKCRCIgE5vWV1S
 MuTCEADWG6b4liMCpVeV5PsvAuNakNCEUFL7uQEazaVoNugFyqXWyvXpsEaWhruzGt7WV0ik7EH
 RcrJiptSDU/0QE7mLKYw7lMdPHGOQBE0P4ARo6gEY1CUPMnTE0RUENvzoA0JQkWbtjPyXiPRHt3
 X40P2JJoe7Yqvom4D6S5PFv2Q+BlR5fna45TO/cP4xy/d0PiKsqJLR4/3GZrDwBW0Z6SRXxac5T
 zdv4f2uc3owp2vIR0tQp2RnpihkmimfOttg4cC4BrTF9tCJirmTLZQt/Whi6yFgu5aONwC5wYMh
 KMRx0NehGGZusaalAwHkWbRkyhAVG3zioY7Pt35q3h3x3M4FmvPKujMAK4jueJRMZRLu2LK4FSU
 FfqzraJSyzchYX4Kh/kNFJDLTOlzPXYdU7lQDfTbqKzrqwOeYpNPOHPrjY6FrwGSmdd5iHi5bSX
 NHuSgrXNLTV+nFyJ8e49V53t7rYtSc8E5l0sG3ViKDulywob/jMfLuCcVdS6Vos+Oc44rXSoFox
 tom9zRA5iinjgmOXzRuaioYKjvsFykGc+L+JX7Y/rvqHMH3ocQg1WsU1oMfMf5eacGP/9w6AdXS
 KJXW/KCEaAmIXYKWSACTNvraVPZiehCXs7/USjKmGRPmrOLU2FIwHZpFpV1R1bJPzj5xI2pPDbg
 WfXOjyIQdnlXLew==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 .../bindings/display/sitronix,st7571.yaml          | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a25d2820be27fe580b6d1aaddd9c610383b73b3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7571.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7571 Display Controller
+
+maintainers:
+  - Marcus Folkesson <marcus.folkesson@gmail.com>
+
+description:
+  Sitronix ST7571 is a driver and controller for up to 4-level gray
+  scale dot matrix LCD panels.
+  The controller is designed for use with LCD panels that have
+  a resolution of up to 128x128 pixels.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    const: sitronix,st7571
+
+  reg:
+    maxItems: 1
+
+  reset-gpios: true
+  width-mm: true
+  height-mm: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - width-mm
+  - height-mm
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      display@3f {
+        compatible = "sitronix,st7571";
+        reg = <0x3f>;
+        reset-gpios = <&gpio0 3 GPIO_ACTIVE_LOW>;
+        width-mm = <37>;
+        height-mm = <27>;
+
+        panel-timing {
+          hactive = <128>;
+          vactive = <96>;
+          hback-porch = <0>;
+          vback-porch = <0>;
+          clock-frequency = <0>;
+          hfront-porch = <0>;
+          hsync-len = <0>;
+          vfront-porch = <0>;
+          vsync-len = <0>;
+        };
+      };
+    };

-- 
2.49.0

