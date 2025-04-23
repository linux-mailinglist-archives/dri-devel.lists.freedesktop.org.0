Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27626A98032
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 09:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4220610E41C;
	Wed, 23 Apr 2025 07:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HwDCAz2W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA5610E401
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:14:02 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54addb5a139so6430457e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 00:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745392441; x=1745997241; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Wp1eUvMBdcnYqPsD1ECvMkcidMJ054ioPzyghi4FuDQ=;
 b=HwDCAz2WtpqcrD48mWqYDaG0bd1f4nG5CTDkm2UwoFk62FS7t24FUXmycElsoLr9EV
 DZbxYUbKFCWj1dMvnKhKBLdQknmhVEKOZb2Q0XROBgIEZz90rkZls3b1CV3UyK2oOMQA
 nu/BBz75ECfDohwrNSP/ZitXSaZpM1s0Qa1KHILtfh379EIdgOiJBTLmbfk+CuzolsVH
 qKJpF6Sd0z7SWq5huwkOHd1DiPheXwvIcBNJlIWu03+YxlQ/h4aOZYR8n3vrg57/IZa+
 WUurFxZ28WVGM3GRfH+KRQXxN8gx2/rIIH/Cc2XREjEi9+x+OEokeyc0h6theqfnENcf
 9YDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745392441; x=1745997241;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wp1eUvMBdcnYqPsD1ECvMkcidMJ054ioPzyghi4FuDQ=;
 b=LXwwbLpGIvs1+Ja3crIEHlbPZBowDVYxBiI4HteVHphjLTgw1Jum+ewW6KGfcYxHVr
 SlHcYDOVrvJeoziGNoBAq3duLh1KCLX61kLk1jBgGNL7cQn0H7giV+LYT5IJSUyDNceI
 yGKKMvYpVoAB6sXpHBdWump+Zvj0AJhd5o0wEMhfPQY1PWm5zJJXuKXiJKItDkeTzeyY
 gvx7+dEWsLbnWVASqMTN1ExYqrdFyARkaJO93iYprIyypd9Fg+S2Day8aEiDGYQHOGkm
 /eSMw5Mr39YQsR6AEvr6Ep9nCTaWVls47bda2dO5qLwxC/yVuovLrINqhAtxi6qr1DQE
 JjZQ==
X-Gm-Message-State: AOJu0YwFFcmbks2zQhZVER2FJu40XT24RjXry7H5GKwypshoe0fTxZ84
 Tb0AFLEv/zGS7+4SRjawcQfhi6jnJX2LJ7xgwtemFzlV7ly0Iuem
X-Gm-Gg: ASbGncsD1ntw9dwpIYkbt2PCplOeRHOJS/OV0uLJ3uux/B1RiQRxGGwzEEW8QXK+NSY
 C4/ySlHsobsl1FvY47AQ0L3bRp3JdXuVIO/HQkPy9kXqO7qqwIJvBgw+e3IN5RzA5XfLornhP3W
 ktanLvZnLh41SAt6mFB1/+NxBs45dXqPVjDQoKKLTML4bRPMzbdnHbmIpx43s5QWb0SrSsmsXzL
 Jtzg1yo1n/fpQ4GQhXGwvTp3sH7OnKSRvUDMI/DGqv/eBmFg7EbiGNgTioEHQWA9z9SG9y7njwm
 zr0xng4Dk5xFraH3d2/Kp4xZpKsU0zXjfb6BOD2h9vSEjS4RhGH+m5HvSZHSomwZW1vJqS4CoZT
 zp9cskH5d
X-Google-Smtp-Source: AGHT+IGvowmu55PG6LtPWhPWoZ5Kg5bAoX9r8U7PcI5/15ZB2sjHiJaCS9lWdbPisTPDmn+Kuh46aQ==
X-Received: by 2002:a05:6512:3b29:b0:54d:676c:ddfa with SMTP id
 2adb3069b0e04-54d6e61609bmr5153223e87.4.1745392440901; 
 Wed, 23 Apr 2025 00:14:00 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d6e524645sm1428793e87.41.2025.04.23.00.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 00:14:00 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 23 Apr 2025 09:13:33 +0200
Subject: [PATCH v5 1/3] dt-bindings: display: Add Sitronix ST7571 LCD
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-st7571-v5-1-a283b752ad39@gmail.com>
References: <20250423-st7571-v5-0-a283b752ad39@gmail.com>
In-Reply-To: <20250423-st7571-v5-0-a283b752ad39@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2443;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=YB3U1vGWiGbGv/SZx3xK3oLfCX1vsYzknR/aXytg8xc=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoCJMnpPP5Uv6KlMXzj7js3h5xWuDgruYzpR5Sd
 WzqEPK5ggKJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaAiTJwAKCRCIgE5vWV1S
 MpSwD/4j7O0k2Ad7fUd2A/3jFfXd8tieImPyatFp/ocYrhFuwHgCNlFMNNBSdvXohr0zsC3nPYL
 7z/Uk+rymGBQSd1HEnR+7rvK5A5mWEw428SZa8BHkVPW8HKL+N3pSjcsOdA/l/+Uug8FuMKi1iK
 puCQ5veEdSvMaC6DAEf+jy0M4OVdsnxq6HezsvCoW8gxR3Bulw6+6NDykonYt9FPU4NlRBxYYGC
 iN47n5dG0VoDyJ0B8+31vg0ffnyRmVRYt/FbEWOqAQiSPCvxKsonsNYbUmjVBKlR0Nj+86EQ3K+
 aoTQAwBIEaDTitJAYHsn+7KgWoAWhl0MVgT0N41pUaf+CReNuR3hbtzd0xSrECdbjroQQ0Iq61T
 hGTbQhwaHqeuo8x6cURqFPqmqS9mUOA1RAVihCALkUoW2kBG7tsfKDrWTV4zFhL9soCYgE8cAGP
 JWJ5wA4+ancz+jU+DrviMEJaSEbVSmgjESQ96YEJpP6Vn4qRsrFiXuw1h2EWs8n2ZHI1QWBKPGo
 q7mSH7NDV9/wtlAC7VEBdUgx3kUquZcT0jxXenZMuJc9rJdWNukKhZCllPiMaaTJBj+Ty7fgUIa
 Mqp4BSkGWi78eqU67xsfuokWdnA4AZb8VFFgimDCOjt+zJpoo04heFW2Sswmofaf/ajNEy5vZA0
 YyHHDD3DeckjZug==
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

