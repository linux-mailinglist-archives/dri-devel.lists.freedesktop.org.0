Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A3AA9983F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 21:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DD610E23D;
	Wed, 23 Apr 2025 19:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K2uq/gS4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CF610E23D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 19:03:47 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30eef9ce7feso2917361fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 12:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745435026; x=1746039826; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Wp1eUvMBdcnYqPsD1ECvMkcidMJ054ioPzyghi4FuDQ=;
 b=K2uq/gS4/o+LZIr1od/9tmp7ulVCuyIxXK4WK0ZOVFmxwvZZBpdP8E3qSyERqP089H
 IU27IWNbfSsvbyZhE55yqpkEh/kPYlVg54izAyDVa9NJidnpbhqohDMBnJUrpYT6lZst
 6xp+lSBlMovQvPY58y2KFQUgpqF+AqHwdLpA2VC4fvbzf+dyki7Y1LyEcjhtZVO/UET8
 b9QuJhNbTvijFsJkRAku/mFui2YXjZB1qavlgj6Shgl3cxuDaEgMa9LKRd2KTeJrMC4Y
 jElEfnq12EZWZU6JGs6JCyvRfiFbvIMBZaw/hPCOVWGraztwfljapAVlg1rCl+gP6sEq
 C57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745435026; x=1746039826;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wp1eUvMBdcnYqPsD1ECvMkcidMJ054ioPzyghi4FuDQ=;
 b=RA7/lc86PYqXPxI7oXpMMx2g8ujprnxrCy9MqZv/f7qiCY4I67nlooNn/KTLReD7C+
 qqaa9JsKJq+NQV0wkrEG064RH5ZEjby8q4vq0S4W5xwLERZTlcrOxQqn7MqepbYIylbu
 hzAoV/cV3f7EXuI27O1L1NfU/M6K5gNeT4xvaUupfDfWX2nxlvDffZ9j8ibLUHCSanBB
 fTx5MrQ3REL95OAK/qmeJrEqK21VAc//qVnglmgzYojo9VhRVTYOz1Ck0CpRBJDf+5SD
 tAs4ELK/+s3wL8AnefwtT/SU1W2SXpsATcIp2zWNVgZ5Loi2lQ5nDkDqxT8C/UfI0Lhp
 XacA==
X-Gm-Message-State: AOJu0YyfqM7tg+GFb/oW4wApP8Z7OoqTQOxP9pKLd0eP1g7J0NbpbBK1
 Uxusx+ImmWyf5Eh+ePvcfzwNao3WVNY7xBtkYD5P0RrJJxjoeY6i
X-Gm-Gg: ASbGncveFXkMtAKmp/XfusC81RSLKPrUHnIfWHRx640ru/TTtp7edbpQfQ/xeZVvOkO
 zi/EQuM5OP49IEyd4rYuED+xJVTiUaSB93t+n0bPd1MNRIejQ+/hdWxC7uQ0+zBF+ZrF12w//ax
 xYPDmCFTG2lfYmchYBE0rOv7NVcq2RpNXgI/3pcA1hSoyRnwOb2LjwNviPo1LJUe+gWu57WnijN
 O96rPGNmYeVpGTeHQD8cSSAIoLRlIZcB45Zo0LghgceAvaB7vzXiVITO1bU6p+uKzJedhCBzimA
 Wig+3Qc3gXKdojqf44j5jU7w+e2AwPgSXsPSBsisgDxmCsQUaOOQnKoZWbqDXB5ptz3G0hJZJcN
 IIzud6xT4
X-Google-Smtp-Source: AGHT+IFVUqnkPxzVU0dxRxKgF4bR1zHN4w3Z5gy5sPUltUjF68ONNzb05hHfxxkeTf8Ty235gE5MgA==
X-Received: by 2002:a2e:bc18:0:b0:30b:be23:3ad with SMTP id
 38308e7fff4ca-3179e5ea616mr387011fa.10.1745435025414; 
 Wed, 23 Apr 2025 12:03:45 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3109084d9d0sm19475141fa.97.2025.04.23.12.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 12:03:44 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 23 Apr 2025 21:03:20 +0200
Subject: [PATCH v6 1/3] dt-bindings: display: Add Sitronix ST7571 LCD
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-st7571-v6-1-e9519e3c4ec4@gmail.com>
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
In-Reply-To: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
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
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBoCTl/qZH/tsu2jjI4XQEggmBnixfzIpp8xX6gc
 2vkbdn4cWOJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaAk5fwAKCRCIgE5vWV1S
 MmpFD/4uqUYIyR02el2J/y9lrf96YQJlG22nGZUYBU+0dzQExzz+s2HD97/k1jxnlLA5jYHq3VX
 1NGEWQSIfx9iFNlcApMkYpQd20qorhWdK/lYHJbyJ7mRO/4lnlthVaDYHdFKuxSMwl6hstl3MjF
 jmU/rr1WYwIqLf77SjOkTQlMp59LeXgR35JW1buHGCMzObgcZfV6JzQ3IhJidy3e2ZXHoM+hhlA
 GX7G8dgRSBDkslab61I1mx5Wp6yeVmGcqBTT8Vg+dyrXlOpyVzrF3wJPMGg9g8g0M+Ma3C7P+cP
 3UTs7iHUzbxcYL4twXz3ag0L5q0z2C67wK48oL5fZPFMG/qZtGroAbGCZ7xLE8FMEvf34a6oeSr
 Umvr2pRQhwK3u0A2Sf/F6M49zM3XGatAPItW2CDRY0CwjzQGwvPjrRqukkkc+amKo2CvDxK0hy1
 D+jd2cnKUIWfYJxqCrkSoS5O7XgUki4yYzD2rNN07R9cvT4ntWI0CDd93PI9yawOizKI9ebmJCa
 JqbFtBYLqvvKc0KH/CGNGH0utqHl62pPtayw47WoRcnqOdxhZD9dt+ghE81GRI14xi7Aw98NR1b
 coqbu+tTfRy/1p890wanPI9toDUffw0taFi3iavhvX6Zrtzn6EFaW+jrkbz04xKvWmpXgAebRit
 gIAz+eydJtAZxhw==
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

