Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F246382ABB5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 11:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF3110E8DC;
	Thu, 11 Jan 2024 10:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992E310E8DC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 10:15:14 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e490c2115so23830765e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 02:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1704968113; x=1705572913;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/hW0eMP0R26bZoJ7D3kVMQU+mn9+CNKwNbl/G0tADY=;
 b=TJOZqo+rnXKghx4uzJEkab+pxM3ZGATvDjcoX+DdnjQttrbolbSEwpb/jhfGrOgPEP
 NneEOIz89J9z9OTVYgdZKAHvRQ6GTSpF1faedBUPkkg6QPbgCxennaJ7eZ9lXT3qBgip
 f73rxPlg1KtPCBbnYaOfpDfhuZkMef8nVNL6SVzOdjtUhCkZTPYwvDSYFYBICEPfMlbS
 YRkaKXJcyxPhCrhtoIx5F3zJhmglLL90zwn5wXrCvbGt1UHLa+1DCEoGxSjMRw5xL3aK
 h8x+EUjYoF7y1kAXL+uJx4d7fR4DSnJXhyQZeHniLdcY+15BD4u++foo8AXHeBJc59WK
 gT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704968113; x=1705572913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/hW0eMP0R26bZoJ7D3kVMQU+mn9+CNKwNbl/G0tADY=;
 b=riGfefVDSc+o9xFRv5yzFiArAYt0kaRc51iZi9VCwP6gzsGR5vhV+EseoFL48tfPTI
 jeS0JjI41HB4zHnpL1xES2oce5Ujo8RlogXhWk0/j77aBmVIG5W4ww9fSnCUzdpGQR4A
 Hz/hW1FFtI1tbsbMFBEmKuOxInnibx94W9pJSads9decbhFfJYlABr2zTTiBZjbDVtNx
 qGc7Fp5MAgiZ8lK0y0PLx2XZOgRQ4TnriNKgUpfFU4EsA2B/t0iMEofhJJ2YxmjQpn4O
 W7BA7KchDZh0yzJlvp5cDgoTTGEeyKYynfhuuSditZwQfz/rvT+UoW5IHaGabJu2EUDE
 BfbA==
X-Gm-Message-State: AOJu0Yy3poBFnE6uADDS1NurMrwWV/XyWXPndqoyrluEE7ixgLrqeISf
 jAStDBjcFeBKD3yOUNjOthwqXVe9ja7DTQ==
X-Google-Smtp-Source: AGHT+IFyvfnJPRwTsXpGb2dr4GW0LFIBK0jrx5pf/pI5bprzOQBwjVWroWaZz6UXvbjD6JidFSNScQ==
X-Received: by 2002:a05:600c:3ba0:b0:40e:5b66:f4d9 with SMTP id
 n32-20020a05600c3ba000b0040e5b66f4d9mr300477wms.79.1704968112988; 
 Thu, 11 Jan 2024 02:15:12 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b0040e52cac976sm5157758wmq.29.2024.01.11.02.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 02:15:12 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Subject: [PATCH v5 1/2] dt-bindings: phy: add mediatek MIPI CD-PHY module v0.5
Date: Thu, 11 Jan 2024 11:14:50 +0100
Message-ID: <20240111101504.468169-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111101504.468169-1-jstephan@baylibre.com>
References: <20240111101504.468169-1-jstephan@baylibre.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 Julien Stephan <jstephan@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Florian Sylvestre <fsylvestre@baylibre.com>

This adds the bindings, for the MIPI CD-PHY module v0.5 embedded in
some Mediatek soc, such as the mt8365

Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/phy/mediatek,mt8365-csi-rx.yaml  | 79 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
new file mode 100644
index 000000000000..2127a5732f73
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek, BayLibre
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,mt8365-csi-rx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Sensor Interface MIPI CSI CD-PHY
+
+maintainers:
+  - Julien Stephan <jstephan@baylibre.com>
+  - Andy Hsieh <andy.hsieh@mediatek.com>
+
+description:
+  The SENINF CD-PHY is a set of CD-PHY connected to the SENINF CSI-2
+  receivers. The number of PHYs depends on the SoC model.
+  Depending on the SoC model, each PHYs can be either CD-PHY or D-PHY only
+  capable.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8365-csi-rx
+
+  reg:
+    maxItems: 1
+
+  num-lanes:
+    enum: [2, 3, 4]
+
+  '#phy-cells':
+    enum: [0, 1]
+    description: |
+      If the PHY doesn't support mode selection then #phy-cells must be 0 and
+      PHY mode is described using phy-type property.
+      If the PHY supports mode selection, then #phy-cells must be 1 and mode
+      is set in the PHY cells. Supported modes are:
+        - PHY_TYPE_DPHY
+        - PHY_TYPE_CPHY
+      See include/dt-bindings/phy/phy.h for constants.
+
+  phy-type:
+    description:
+      If the PHY doesn't support mode selection then this set the operating mode.
+      See include/dt-bindings/phy/phy.h for constants.
+    const: 10
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - num-lanes
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/phy.h>
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      csi0_rx: phy@11c10000 {
+        compatible = "mediatek,mt8365-csi-rx";
+        reg = <0 0x11c10000 0 0x2000>;
+        num-lanes = <2>;
+        #phy-cells = <1>;
+      };
+
+      csi1_rx: phy@11c12000 {
+        compatible = "mediatek,mt8365-csi-rx";
+        reg = <0 0x11c12000 0 0x2000>;
+        phy-type = <PHY_TYPE_DPHY>;
+        num-lanes = <2>;
+        #phy-cells = <0>;
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index cc92b10a4cad..37dfa99b0eb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13569,6 +13569,12 @@ F:	Documentation/devicetree/bindings/media/mediatek-vpu.txt
 F:	drivers/media/platform/mediatek/vcodec/
 F:	drivers/media/platform/mediatek/vpu/
 
+MEDIATEK MIPI-CSI CDPHY DRIVER
+M:	Julien Stephan <jstephan@baylibre.com>
+M:	Andy Hsieh <andy.hsieh@mediatek.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
+
 MEDIATEK MMC/SD/SDIO DRIVER
 M:	Chaotian Jing <chaotian.jing@mediatek.com>
 S:	Maintained
-- 
2.43.0

