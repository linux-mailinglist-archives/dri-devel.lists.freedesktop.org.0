Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BB2A89390
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 07:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0B710E2B0;
	Tue, 15 Apr 2025 05:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DqbbwJeS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27A910E2B0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 05:59:26 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30bee278c2aso63878191fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 22:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744696765; x=1745301565; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kLdEzSuylgtZwcH9L3QftHbXB4fESiVriulAmrXqI3w=;
 b=DqbbwJeS3w/NmdZBCU3c5gIM1dIXlwuLkxJacWEP9C0mHHjkLAoPNq7oh+IYC+Ut28
 dpb8kQQEl28pkwyRdTzcGrylOcPAGtvI82fZTJk8Y6mClyCOpumXkllEiPchHRYiyy5L
 jbkpgvRVvc9IOQKIpNvVZwqEXSTdQJJzqL06MoC3J3uweZ8QcuSQg5PcXPdZk1uCJrlk
 niO8PDXWq6rp0M/kc6/UXflSq4MDHnC9sWIWeLIiFYwGe7ENcjBrj4CRXE3e4pVPOuMa
 xgiB/R1qb30x2G1uhCjMRsQRPh63jO1Wp7i4XgCFKgW0k5Hm2xKkcGnNIbX7E/OGiK2V
 Ml6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744696765; x=1745301565;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kLdEzSuylgtZwcH9L3QftHbXB4fESiVriulAmrXqI3w=;
 b=TQtQ3AnFZNg384lhNu/DlcbghOBJKQuhDqw79iWzJR4EGAPeAGUYitNOeQ19HgJizj
 nHmeGvu/p+yhvtkDE6cmd5igJtcFctkgqjnEyPXAz0knitpDw0LdbGmcz32QgJrGA19N
 nNbJMgMaeiH2xUeDBoolQeOjgfVf7JSptSOUs3y2Euz9gOnfRVxRdkoEivrEXjfznkRz
 2vBmgk6UvW7pY+Vp2H9kWw16IWrtszwbl3sxGYkmUeCBOEVVDN/hZeIuxmkpOQBgrHW6
 FpxIJI2j4e1brdgVjXpl5Acr3c9DDvHefjxRmREBZtETfkwtNBOK4iA3/ZgWnyPc0O0k
 Fx0Q==
X-Gm-Message-State: AOJu0Yx64hV0ZkZisKsPrs3Hh0ib4hn+21QJ+jxBFpo9S/DiPBquCRjX
 SQLa6isdPl5XpNEOT8faQAzKGVzMySqMnsymSHmXjWl0YHtMG/au
X-Gm-Gg: ASbGncs4p9OuxVCQhH9tK6dlyH9oiH09ByO9r7chXj+cpS3MQiTIHgrdjxpkMSehfwD
 STwod4+IWJVuDgCSFMi2ErOYHJpmtLLbFri7ImQozppGH8e8Ad0tR581fF71HhYbA3MdGbY4nJW
 iA2ccpH/JJrzA+LLD2r5UYm4pB+LuTu8Hwn3c6dzHOJOQ6bpwiSY05ErYaRD74GInh0g6DAkvYk
 7ONA9YZu0htJK3axbYzJm+v5sFg+/oHVVMxruLuBheSqKbDJoKeR0GAifv4i1RpR9U4RE4pkm2k
 V8X3mRF2lsDDZrunzF6x257zjVAUAUHPR06PE8G9othozI+X5FOWHojjJ2uAfozEXebqKgxh65u
 TwgRyDkAr
X-Google-Smtp-Source: AGHT+IET5zzLesZUrEu33lPL8P5dBAg/QVS4Jpe1rh2nr0Rn9Qty18Ked3yqaWsZ8qqK/asO1pUQdw==
X-Received: by 2002:a05:6512:2149:b0:549:903d:b8d8 with SMTP id
 2adb3069b0e04-54d5965bf73mr532479e87.8.1744696764802; 
 Mon, 14 Apr 2025 22:59:24 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d238820sm1325471e87.80.2025.04.14.22.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 22:59:23 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 15 Apr 2025 07:58:58 +0200
Subject: [PATCH v4 1/3] dt-bindings: display: Add Sitronix ST7571 LCD
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-st7571-v4-1-8b5c9be8bae7@gmail.com>
References: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
In-Reply-To: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2260;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=ErAJptKe6TjqvTV7sbXPcZTT3k+iErgPyt0n2TpvVKQ=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn/fWo0zd25bxNICZsEqGnaKpkxFttyKHkD+lWq
 BFLvieFhgmJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ/31qAAKCRCIgE5vWV1S
 MhVyD/wPRR1pC3Uih9CKvymXMl51XJr6AUsF8qCTwS7srgLpRjrVa+DTNTnhsNOZIYv6grdL9qE
 pHDnF5CdwkygG4ppbiXIF46jWOLPQKv4pV29gkIMezHZcSQ5IYSlIOPMu73EgQQ2coRjFzpiI3+
 pGv1UQD/a1vMJETYPetDDdRgXGc8BxQzcPiopigxd7f81XQyYvDp3gMGXz6qMxDGN/UlS2qNgtb
 JrLFhK0lWHS6Mm0kgq+7gT0Jv25SXENfkcSUOgbfk9+ntovHDIkqmKwa3U0RDsF+eh7+TYE8jzz
 Czs2t+cmBZeEfqjSeP40XC/Ldv7pqFXpxihEMDStnc0xO7CfW6GemZMGGhBVH9pIlZ4qywiVGim
 7d6JbR3VKvp/uG+HUcs6MTTcOFTXZ1pnwGlDtvad9L2+9opiFzeTxYB8vOh4YXJu7Lsxc/MQnLw
 fXW2WD/TuQ74sUY586UCiGO0eEcox53Vi5VuzMqRzX7vp/WvN8ddTe/pt+RSTZjhbiky5E53bTa
 o+LfBNUcBAPmPzFrlwtjWaGfSSS9XaQLOewieizjBShkQfiFCCp+2TFKlFC3o8VQFp3PrPJNJSm
 Z0D3JIsrDsmtNZZm2d/kX8PqenqkllBtfX0WY1sYSAT9Mx1B9Z5zhGgFUd4DBayrmreEWKCY089
 VxjTrrNmMbMcDeg==
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

Sitronix ST7571 is a dot matrix LCD controller supporting
both 4bit grayscale and monochrome LCDs.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 .../bindings/display/sitronix,st7571.yaml          | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7571.yaml b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4fea782fccd701f5095a08290c13722a12a58b52
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7571.yaml
@@ -0,0 +1,73 @@
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
+  Sitronix ST7571 is a driver and controller for 4-level gray
+  scale and monochrome dot matrix LCD panels.
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
+  sitronix,grayscale:
+    type: boolean
+    description:
+      Display supports 4-level grayscale.
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

