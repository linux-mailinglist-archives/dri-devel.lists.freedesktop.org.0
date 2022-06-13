Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6694F5484B5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 13:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E50B10E401;
	Mon, 13 Jun 2022 11:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EF710E3FB
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 11:12:54 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d13so4786140plh.13
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 04:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5PhEd/hCsm+H0s/MYgcNh9Jcss9lmcQSw7vjFLzWUag=;
 b=Suc6iBHRFwzduJcDko660RQDxH8yM9viwXxb8kLirMiKU3L4sZb2X0B5lKMBVXKi5m
 C9x103BsKW1QIXl69OQHktmu0sQ3TRjuqgfyotPqL/6uHnOybIy+Nxkse1c0ISdmSoiF
 PMKWMq5mJY9d5yWnR/OsT/YTfccwN04V8IEw6u0XkdipUSHnBDYPmDC5o3Bcig2Rl2Mt
 H+xeFH/SA2v1DMTus00eyR3bLPHDR3rMPAjogql5vp2kyoddKeIIfYwgwNwhp0+iY7C7
 5UybtJdfXvabI83NctAt+Y1VE+5sSULv89R2w2dsvoy1D9tHlASeb57h1nIkXoD1B1In
 omug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5PhEd/hCsm+H0s/MYgcNh9Jcss9lmcQSw7vjFLzWUag=;
 b=jfOKmb3sHcKPz0+sw0nAdPkufM1g5BJc+BTbxZq6h21HFrtxEKeYjTLq7oIJrpZjVV
 IiyIOc2OJNfOapAar36VHh/0sSbJ+BnDAXiDFPhA0QILkh+IuRAqiLPXxW+NhNCBwKbX
 CpWis8qz+KH8xLeRAmqhjl1FPMiBXmrW7Hn79DBXXU8zUWajy01n8b3tOFZc37Zfew89
 z3ly1W/s8knnzhBOL34ddFqfqO2hbaV43DIamV52kSXwYP/dFJJ7urSMfD/3xes/oHnE
 Wi6SXEb35P2hzgP68Z300swxWrJYHyJTu75vzdYRgSK6+swOuFbAKwwXFlrYQJc8HOiC
 TNCQ==
X-Gm-Message-State: AOAM532KTsWZ1eSJmDMv8J3mFDE+kdQHHzPluMES1dPDmKJqttv5zszM
 tQKOMLoB3p1EKMb502w/WIk=
X-Google-Smtp-Source: ABdhPJwg+KdzNhzT/AjwhzSIUVFwI7i5f/6BugmkfhPT6mWaHcgxcAdsTgruwXA2gFhNBmT+m6N0DQ==
X-Received: by 2002:a17:902:b68c:b0:167:95e2:f822 with SMTP id
 c12-20020a170902b68c00b0016795e2f822mr30806898pls.128.1655118774234; 
 Mon, 13 Jun 2022 04:12:54 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-115-109.emome-ip.hinet.net.
 [42.72.115.109]) by smtp.gmail.com with ESMTPSA id
 g17-20020a056a000b9100b0051b4e53c487sm5199989pfj.45.2022.06.13.04.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 04:12:53 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 02/15] dt-bindings: power: supply: Add Mediatek MT6370
 Charger
Date: Mon, 13 Jun 2022 19:11:33 +0800
Message-Id: <20220613111146.25221-3-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613111146.25221-1-peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ChiaEn Wu <chiaen_wu@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add Mediatek MT6370 Charger binding documentation.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../power/supply/mediatek,mt6370-charger.yaml | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
new file mode 100644
index 000000000000..b63553ebb15b
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6370 Battery Charger
+
+maintainers:
+  - ChiaEn Wu <chiaen_wu@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-charger
+
+  interrupts:
+    description: |
+      Specify what irqs are needed to be handled by MT6370 Charger driver. IRQ
+      "MT6370_IRQ_CHG_MIVR", "MT6370_IRQ_ATTACH" and "MT6370_IRQ_OVPCTRL_UVP_D"
+      are required.
+    items:
+      - description: BC1.2 done irq
+      - description: usb plug in irq
+      - description: mivr irq
+
+  interrupt-names:
+    items:
+      - const: attach_i
+      - const: uvp_d_evt
+      - const: mivr
+
+  io-channels:
+    description: |
+      Use ADC channel to read vbus, ibus, ibat, etc., info. Ibus ADC channel
+      is required.
+    minItems: 1
+    maxItems: 9
+
+  usb-otg-vbus-regulator:
+    type: object
+    description: OTG boost regulator.
+    $ref: /schemas/regulator/regulator.yaml#
+
+    properties:
+      enable-gpio:
+        maxItems: 1
+
+required:
+  - compatible
+  - interrupts
+  - interrupt-names
+  - io-channels
+
+additionalProperties: false
+
+...
-- 
2.25.1

