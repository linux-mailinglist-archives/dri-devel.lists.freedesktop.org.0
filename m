Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B8F5395BA
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 19:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDF4112837;
	Tue, 31 May 2022 17:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x41.google.com (mail-oa1-x41.google.com
 [IPv6:2001:4860:4864:20::41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D6F112C89
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 13:01:21 +0000 (UTC)
Received: by mail-oa1-x41.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so18171944fac.12
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 06:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WjL5ChPbIi7K/V0MdTfM2rPQhvrdOuYsXgOFgMyivaI=;
 b=WmEqihZdq4LKwV2jTDPCqYBvw9n0DRGIq4RQ7wYrno4HYN5lt3eH4qZDaQTWUHqXVE
 b8kC+BH6VHErKiVz4/M6PdWldjxCdPMXwoZaJy5mcfAaj/61IzPllr2pjGhtE226tIKp
 3g8DyvJ2eSUv9HqWtrJMauqYG7IRTb03st1dgUtoPD8MzdXIFGv9FjbNd8b9aa6G6Qvk
 CK73YGmE24rmOzbwEGXdqwYi3bosJbRJzTuJMuQuk7e87+QK7CNxrvTT/vOoZC3o3/JQ
 ZA8x5trG+NpI0u9i2JaTtnqB+LA6Kd5J8Ld5nyp41nUyuudbZrk6OWs3brs1crItb4FY
 1SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WjL5ChPbIi7K/V0MdTfM2rPQhvrdOuYsXgOFgMyivaI=;
 b=Ivks14lA0JsYBrlXTCrN+HMnUaoiGPL3vPQDha00PoNcAtwGwVduRpdfspAjXZSReA
 HnYJaZhhKJxUtTPIxXW0wq8NZEaOMUxkCiA2MioDrNmZ2qsVbMiN47DrCmRsp+Vd9doc
 O2dbh1jxn36zkd1bAinXMggC5VtdnIDdCVXjrnhShUncihgEe/+MyHcg/TUNdiHW1Vcx
 8rNgGNe7F4BhlZoVkiPCGWVmOOLbE5PYl8dbJR8XL7TIPHwjHJtg4Me4D9xIsDhsO9HH
 5y3Lai2E1qwPAJ98y/XTTD7DGuyWiwD5s7Ni1xuqKfsxhvCywrErCv1FjrS45PllfsQP
 QL2A==
X-Gm-Message-State: AOAM530e93ZhL7xYa7zv1A2vPPyeJxmzSfZwMjAGt95jiZ8Wzey8byMI
 NMgbZMedHCIy+9z4As5632AXz4OzCAI=
X-Google-Smtp-Source: ABdhPJwQQg/OzLXNx/Hq3Xv0QAqdEOXRvSI1uqk1PNeKMu66slAGcZdztnBeofE6iyRo6FC0bhehIw==
X-Received: by 2002:a17:90a:8914:b0:1dc:20c0:40f4 with SMTP id
 u20-20020a17090a891400b001dc20c040f4mr28485260pjn.11.1653995954965; 
 Tue, 31 May 2022 04:19:14 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net.
 [42.72.220.172]) by smtp.gmail.com with ESMTPSA id
 cm24-20020a056a00339800b00518142f8c37sm10751608pfb.171.2022.05.31.04.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 04:19:14 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [RESEND 01/14] dt-bindings: usb: Add Mediatek MT6370 TCPC binding
Date: Tue, 31 May 2022 19:18:47 +0800
Message-Id: <20220531111900.19422-2-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531111900.19422-1-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 May 2022 17:57:56 +0000
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
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 peterwu.pub@gmail.com, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add Mediatek MT6370 TCPC binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../bindings/usb/mediatek,mt6370-tcpc.yaml    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
new file mode 100644
index 000000000000..49316633f92f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/mediatek,mt6370-tcpc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek MT6370 Type-C Port Switch and Power Delivery controller DT bindings
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  Mediatek MT6370 is a multi-functional device. It integrates charger, ADC, flash, RGB indicators,
+  regulators (DSV/VIBLDO), and TypeC Port Switch with Power Delivery controller.
+  This document only describes MT6370 Type-C Port Switch and Power Delivery controller.
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
+    description:
+      Properties for usb c connector.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts
-- 
2.25.1

