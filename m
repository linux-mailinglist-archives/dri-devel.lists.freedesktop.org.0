Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B8D4E79C2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 18:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3B910E583;
	Fri, 25 Mar 2022 17:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FE410E5A0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 17:16:50 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so9385031wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 10:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWuHqcRax2E7zzIXZh7ToC5GlWwIxifW/4CmtpMgB/Q=;
 b=e9fQyZ0WE4Z9h6IyESMybIA7h3EtJ5dTgMV5mf91m3HTYR3d6PR3x3ANzlsJDjJpFX
 xyZXVKaHjuCfMF0lwm2Qu9a7yuhgIE8FNiY3Ra2C5iqjAr38LTWfu0BJ1+fhXSTWmUih
 aM3pvBv9RdHz220XVpBcXT8iiq7aPvagI4hTcp8GseBYMM+pFmDDxSClw8erRNva9gEY
 2imqr9DiFYjUmXQtnWctQLqe2NXNA30qtmtWcNWqvaW0TdlhnfPmu+EdWfkrn8Zm2deG
 A+8Q+xLGHP3uj/hxELbU2uz03u/3WDCI7leUQAxmTATuBJuts6p2eUn35MBM400RFU+U
 mxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JWuHqcRax2E7zzIXZh7ToC5GlWwIxifW/4CmtpMgB/Q=;
 b=44NIi/v662zPaDWq1+C9vF4X6s3dQ1c2YJZ03jBm1fc4xUkDqfa9ZqpIVljmPLY/40
 8QaNuFaR9rf86AcxdrdSOQCvBxU+S8A7vTtC8zSZNt4UCO+OUeX2CHduFxNDQ4Ydl4kT
 Uy9kjxWmH/DfRATh3uNQcl0UBRPvOEGEcoIWWH3oTfXNVz6ZizwL1hGGcn+rsAMh0kS+
 uyhxEofu8RBYlVByHDXOWvPYrTgCVqiFtHl3BGc63X2PVk1Rv/0hhpMM2Cup3lrbppjM
 zUgnVmeX754THxvo61MGB+gHPIQ0KZBNedY3+aWCRKaqvrN9d/Rg/TGgnHK/74O3BOGC
 onqA==
X-Gm-Message-State: AOAM531KzvVoK+bxIfqHnYBK2yibEqqqvlC18RcQD1r3BNo5JCA9CceC
 RKaikwTWw++WFDlN27bxcHXIQQ==
X-Google-Smtp-Source: ABdhPJyseADl0QeZy7YFh7ZKp586b0q8d6AxSePwH+EeyXqFYla8oR9D8vfPuUxPBa3bYk7yPTd2ig==
X-Received: by 2002:a05:600c:4e91:b0:38c:c1ac:c018 with SMTP id
 f17-20020a05600c4e9100b0038cc1acc018mr15761137wmq.189.1648228609419; 
 Fri, 25 Mar 2022 10:16:49 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:16:49 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 03/22] dt-bindings: mediatek,
 dp_phy: Add Display Port PHY binding
Date: Fri, 25 Mar 2022 18:14:52 +0100
Message-Id: <20220325171511.23493-4-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
References: <20220325171511.23493-1-granquet@baylibre.com>
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
index 000000000000..4180d40f4fa7
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
+title: MediaTek Display Port PHY binding
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
+  regmap:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the Display Port node.
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - regmap
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    dp_phy: dp_phy {
+      compatible = "mediatek,mt8195-dp-phy";
+      regmap = <&dp_tx>;
+      #phy-cells = <0>;
+    };
-- 
2.34.1

