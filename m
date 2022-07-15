Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A603576010
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168D514BFCA;
	Fri, 15 Jul 2022 11:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E5A14BFCA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:26:48 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id g17so2982464plh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 04:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SxGKLw/sS7fdJZuE8bLGBTMKV4RyLr0/hVQFdtvG6hY=;
 b=WboNAeOE8zUIByDWEwnyde87CtzBmrbdti4AKCsZfCWV2qiSc8kOZu41SxPIZj8GET
 c13f4iEKQtbYsCgkl25EFNQeJqBoxRhrmcEORQKISJjJXA1C4SG8M7mgZJdk9JLAk1Nx
 gS4IDfySupoxdTro7OH0R34aAROWLE2Wg4Ll6D3MUVmEFM4H9miJcsDxTPL5+SEFmdFO
 GYz3l37CyNfTwziEu3yBr+JiwWx5NR06sGtTakqH682gRLtstaxj7jN/lk06dNqf6Da+
 wMMp90zBsAGb7CgnJG6GcxBnh2dnmWDpzR2ycGXP2eh1lUZ3pbQ7oPmAFk9azTRatLzm
 Gtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SxGKLw/sS7fdJZuE8bLGBTMKV4RyLr0/hVQFdtvG6hY=;
 b=gfKDB0CRHBXCa9SXqsSFRccUutJ0BdoH/pZNIlc6PSIdpVvfR9PfUh4euZD3OkuF5+
 tFu4Pl8Q0Q/wD6Ym7sv0U24F6hyFnGsV/ZBUaCM5ikcVD5Q6QNl3Hrqx6Jzp/Sj3mkV8
 0hvSuV13zuAOMxQ6OM+nXFej+gNsJSX1z3G1iYpCYZUzg2/35CPtqdXasnw7INRx2QAV
 xalr/q4hY750VWAWW4JPqKYxr4/7gWhrhyVHtFHZASUIID38HMJAw4+hvPGhgtSCEIHk
 9ALzOYc6+KqYA+XlM2tHSZTxE8vNJlrr4XPpDgkbCEuM/JSFGY2gMcmSwheJDx6Y3YeF
 mikA==
X-Gm-Message-State: AJIora+CKDMBpwMPlNHsyGREl5+wqOuFW1jtJZNp1g6lFtSATGCLj6oK
 Te1pgurMu2ncHzFAv9eDKrM=
X-Google-Smtp-Source: AGRyM1sZltUw/1JpGkrrx6xlT+Z5GjpcQ3KIeIf35T9nrHUA2Cz4hQ1u/67IaF4MBUiOqAfgRZNPTA==
X-Received: by 2002:a17:90b:1bc7:b0:1f0:34e2:5c86 with SMTP id
 oa7-20020a17090b1bc700b001f034e25c86mr14843981pjb.136.1657884406842; 
 Fri, 15 Jul 2022 04:26:46 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-159-86.emome-ip.hinet.net.
 [42.72.159.86]) by smtp.gmail.com with ESMTPSA id
 a5-20020aa78e85000000b00525b61f4792sm3550604pfr.109.2022.07.15.04.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 04:26:46 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v5 04/13] dt-bindings: leds: Add MediaTek MT6370 flashlight
Date: Fri, 15 Jul 2022 19:25:58 +0800
Message-Id: <20220715112607.591-5-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715112607.591-1-peterwu.pub@gmail.com>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
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
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 chiaen_wu@richtek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alice Chen <alice_chen@richtek.com>

Add MediaTek MT6370 flashlight binding documentation.

Signed-off-by: Alice Chen <alice_chen@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/leds/mediatek,mt6370-flashlight.yaml  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
new file mode 100644
index 0000000..e9d02ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-flashlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 flash LED driver include 2-channel flash LED support Torch/Strobe Mode.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-flashlight
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1]
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.7.4

