Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 282255484B3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 13:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A1C10E3FA;
	Mon, 13 Jun 2022 11:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB2510E3FA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 11:12:49 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id 123so5239883pgb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 04:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oqTkyZ/R9/aOjKZlhpbfjvDgfGSkULBZvX8wxg4YxyU=;
 b=EkfouFuwigzPeP3CaHjbjOBiWlhMunkQOLCaHKE2YU6uwGayAsPnUiKSAXGdXu18cJ
 v4gsLlJJlItr1BUXfBsqy4n/SJ3JfrJozMKwoYPdCNYzW3nIjUOr8xTpW2pnpdzMS6N3
 fU1tUtmrLaNU1SbFzyXbBnxLXiGR5p8MfWcLVM8ZECExJE9azVAatV/AqH5t25q8zpX3
 hhfuJLTyojZTZyemTeos0TFjLPWsXyMrWe7iM56nTK6jVjsQpTeVehX8WVnWFMOzDINC
 A/K/lWvB8Z/L9aRwVHBilttnT0nQc9JF1fuhIfPB9oUg8Paw8u8WsrP8Dvt6YEOmRlZP
 C7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oqTkyZ/R9/aOjKZlhpbfjvDgfGSkULBZvX8wxg4YxyU=;
 b=ttpnhOqW4SmgbPaHlA715yHrgvTUb+BW2htQ+w4v/pDwdssdscn7uXxYQsIuNTlfrT
 1diSI8jQszOF2wTf38iL99ufvVqk+vJPMcYw0L6nnNKmFBBDffDU2A/0lZ+Ocyh6+bxS
 cmEgwpXyVKkcXm3bN0uC7WtL2yqrCgOIK3Lfgjdy/zrZgIfqgT3RuVdYBF9dpEn+6+uD
 UIGyXSb2qnOLLjllu1dkCWoCIsf8HnfwcgJH9UVjHhAzK9yF28u/a4Xqom2xlzPbkgus
 WkoB35k7YGgInBV9OscNROht/QDlA81IyJTYexANLzY6QDEnuvxNhKr5andoRvlWhAW/
 F69Q==
X-Gm-Message-State: AOAM532WfEYu17SYkfDTPZpqgUORde6T093k7P3/nGHVWCUYA6Hyi1UH
 FL+3P1DGguh1FWC6tPlRAJc=
X-Google-Smtp-Source: ABdhPJykU5u3d/PSqbUfSBIHCI7wMOPjK0kTGhhrXnoTs+pr7YZi4FLWyDRwJrY+TNdVd5Qu1JUYlg==
X-Received: by 2002:a65:67c1:0:b0:3fd:ebd6:5dab with SMTP id
 b1-20020a6567c1000000b003fdebd65dabmr30448557pgs.75.1655118769299; 
 Mon, 13 Jun 2022 04:12:49 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-115-109.emome-ip.hinet.net.
 [42.72.115.109]) by smtp.gmail.com with ESMTPSA id
 g17-20020a056a000b9100b0051b4e53c487sm5199989pfj.45.2022.06.13.04.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 04:12:49 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 01/15] dt-bindings: usb: Add Mediatek MT6370 TCPC
Date: Mon, 13 Jun 2022 19:11:32 +0800
Message-Id: <20220613111146.25221-2-peterwu.pub@gmail.com>
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
 dri-devel@lists.freedesktop.org, ChiYuan Huang <cy_huang@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add Mediatek MT6370 TCPC binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../bindings/usb/mediatek,mt6370-tcpc.yaml    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
new file mode 100644
index 000000000000..aa083e92bbba
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/mediatek,mt6370-tcpc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek MT6370 Type-C Port Switch and Power Delivery controller
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  Mediatek MT6370 is a multi-functional device.
+  It integrates charger, ADC, flash, RGB indicators,
+  regulators (DSV/VIBLDO), and TypeC Port Switch with Power Delivery controller.
+  This document only describes MT6370 Type-C Port Switch and
+  Power Delivery controller.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6370-tcpc
+
+  interrupts:
+    maxItems: 1
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts
-- 
2.25.1

