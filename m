Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC5F70F0BD
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 10:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BCF10E5A0;
	Wed, 24 May 2023 08:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB85F10E5A1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 08:30:52 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3078a3f3b5fso481835f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684917051; x=1687509051; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1bgK81zYJJlKzJwC/YpUVSKkmte5LSImvMG9blyHL8w=;
 b=q3rlhiN1dqBA2GKz3Baz0KFqAEsTk9Qe+RSwPRNOe/jjZ3ukXTwBxzpVyKlxqS3oJk
 BikGg2jYUATGzhaIdGoeT/DrFEkG8IDjhW5p65ywpyai0QXsEH/hv9LzF2PVM4/bcUpG
 TTPCH9s57Yp/5jPz1TCf1SW3gnCEo7w06js9iutJCPnpdnSOnHnlFs+313+Apq9cJgtu
 7x8RzeXcP/ArERx4Vg6UdoEjNUjJRmhy7qgCR6GzK4SfoMuE23SG8pbo594k6H1c6JXs
 DCsfmjLYVxHZO73M52cFGNZJDtdjFM3Dh+RRbIpvlR4UfYU5xv0YmViBPjducNXwgp0U
 j8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684917051; x=1687509051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1bgK81zYJJlKzJwC/YpUVSKkmte5LSImvMG9blyHL8w=;
 b=NSa49A54cH6KNVCOCmTtGZnweZzIuC7qgH3soUxr6k4Z/zGPfoy3bOodstNJ5IDQo8
 VQOeQSJdKZ98mtVhnIQsCN8I12xDdGtSgDuU+QOtyd+5wVONc7lmyB/lY4cRrbDCzkbd
 76KgihAH/o9JmxaqBABGwJakw57VccHlpUiv4HE9rO3mbrWWgg0sneMdopmaBeLVr6hA
 FUHZwWnEyZQ8UfcAaUAJ2IC8006AbgkGPwYJLoq7So9bQxXPXt0NcpXkDRJq6/tppMMk
 egJh2FunDsS6+UeTmDdCGrsxtnNCQ0qa0SsmGTDDku8ArXTjSjW33I/8TIwV5+wNeND8
 cZiw==
X-Gm-Message-State: AC+VfDzBOW/0LI7QWjxXk/y5IA9HbSYkWCh4aZszji9aI/gfNqm8S/lZ
 8vhRzx6gNddmQwCgMn0N8WDw2w==
X-Google-Smtp-Source: ACHHUZ4rg9xDTlc33OxE5pi3GZwUh53PWH0eMhBen5R9zYe/bMYwZfbseDecOPk9Jj73PjeMwBppWg==
X-Received: by 2002:adf:ef42:0:b0:301:8551:446a with SMTP id
 c2-20020adfef42000000b003018551446amr12446568wrp.2.1684917050983; 
 Wed, 24 May 2023 01:30:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a5d484b000000b00307c0afc030sm13871832wrs.4.2023.05.24.01.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 01:30:50 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Subject: [PATCH v3 2/3] dt-bindings: phy: add mediatek MIPI CD-PHY module v0.5
Date: Wed, 24 May 2023 10:30:31 +0200
Message-Id: <20230524083033.486490-3-jstephan@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524083033.486490-1-jstephan@baylibre.com>
References: <20230524083033.486490-1-jstephan@baylibre.com>
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
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, khilman@baylibre.com, mkorpershoek@baylibre.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
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
---
 .../bindings/phy/mediatek,mt8365-csi-rx.yaml  | 67 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
new file mode 100644
index 000000000000..a1bd96a98051
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
@@ -0,0 +1,67 @@
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
+  '#phy-cells':
+    const: 0
+
+  mediatek,phy-type:
+    description:
+      Specify the phy type. Supported phy are D-PHY only or CD-PHY capable phys.
+      See include/dt-bindings/phy/phy.h for constants.
+    enum: [10, 13]
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - mediatek,phy-type
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
+        mediatek,phy-type = <PHY_TYPE_CDPHY>;
+        #phy-cells = <0>;
+      };
+
+      csi1_rx: phy@11c12000 {
+        compatible = "mediatek,mt8365-csi-rx";
+        reg = <0 0x11c12000 0 0x2000>;
+        mediatek,phy-type = <PHY_TYPE_DPHY>;
+        #phy-cells = <0>;
+      };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index b81e9fcc66cb..5da594fbb761 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13184,6 +13184,12 @@ F:	Documentation/devicetree/bindings/media/mediatek-vpu.txt
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
2.40.1

