Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC144E8AA0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 00:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04ED10E57D;
	Sun, 27 Mar 2022 22:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CB510E562
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 22:41:03 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a1so17889316wrh.10
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 15:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eywd7FmH0eN0jrnWKgGdeR6AnFImC306XiX8oFPZwAs=;
 b=0r7A+Lg3dNKCPPbFiM+r2Qb3aWcF/p0TOhmyZ6fCihniTMpFEzKZY5YjYdsNTSAWqN
 PbIOYJQJQGdEkdV8sp8l3JBhwGeBtqFwUpJ+1QeYuCz1b1wRy4SiIbO3Emgxg/KnDiSk
 CiBOc5wGNfUwm6kxi3rSlwPV9GLoA6LojVJ8C5DoDvdw16bG4t+phKcX8xJGA5nh8o3p
 gA/Mc8yiLl633Fcxtld3vxHXvEhzxQVlb8rSLMYG4QWMhvCZwJMR1dkzQr2M0tvIcm6u
 DdQKBHdBDHeYvCXLr+mE3qAVoJ/8zWnxQEcQT9AOhtvxeW8nibWa2VC1ygUqee3lqp9q
 cvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eywd7FmH0eN0jrnWKgGdeR6AnFImC306XiX8oFPZwAs=;
 b=7EvZ4OEVMkcS8WtrteITB8coXfjpqzqlbwYLqMr9jCvrf1KmeuKZpWiLVfLbqOhHPZ
 MJg0KBGxh2gHQegF+f01ixi+9uc2boVmUoEqbwRurV/qFvaB4UPDU5pT7o9M8QuISbSC
 6/Kfc2wVbrfubsJH1gfAHp1OYYqhKT28TQzTXbUDTGSE0s3zLDTE0jhyG0XG7gXrL2Hb
 RMYBXJV2xkVABkemkfwh155OuOdRr+tkTAvok5XKItrIyHXxX0Lsf8JPbPuHYbNdfJd9
 NNzcgHGUF75sb6kbryeRBabXcftcsqyeP7ep+H5DfDgYr79m13g/LVpOdwSmEsf8dZI8
 mZdg==
X-Gm-Message-State: AOAM531tVpv2VJqvyfhiCS+mYBEind35AGvQ1BUeYxwMzpnBTE5FMNLm
 pkpttq4PPtQd9vGeABPRiyxvMA==
X-Google-Smtp-Source: ABdhPJwVdJKuEHZkpHZx/kesrNtcrmsj08nZDeDz/JbXf7iTCc+i8rplDDOSSsSGAP4YKrlt21K5og==
X-Received: by 2002:adf:e987:0:b0:203:d6f6:71f3 with SMTP id
 h7-20020adfe987000000b00203d6f671f3mr20128642wrm.82.1648420862352; 
 Sun, 27 Mar 2022 15:41:02 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:01 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Subject: [PATCH v9 03/22] dt-bindings: mediatek,
 dp_phy: Add Display Port PHY binding
Date: Mon, 28 Mar 2022 00:39:08 +0200
Message-Id: <20220327223927.20848-4-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This phy controller is embedded in the Display Port Controller on mt8195 SoCs.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 .../bindings/phy/mediatek,dp-phy.yaml         | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
new file mode 100644
index 000000000000..1f5ffca4e140
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,dp-phy.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2022 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Display Port PHY
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  Device tree bindings for the Mediatek (embedded) Display Port PHY
+  present on some Mediatek SoCs.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-dp-phy
+
+  mediatek,dp-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Display Port node.
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - mediatek,dp-syscon
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    dp_phy: dp-phy {
+      compatible = "mediatek,mt8195-dp-phy";
+      mediatek,dp-syscon = <&dp_tx>;
+      #phy-cells = <0>;
+    };
-- 
2.34.1

