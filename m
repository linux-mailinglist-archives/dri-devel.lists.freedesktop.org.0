Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FDF565B5D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BB010EBDD;
	Mon,  4 Jul 2022 16:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A5A10E00A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 05:39:53 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id d17so7989571pfq.9
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 22:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZBFds6olkH7qZWoO3BcF5jnp49SAncP60CSiK32nvCU=;
 b=ghNOEPKfW/M7m5HM4dYGeASvfcvcu8tR3I9lSRY/mX2exs/qAsP7+hQu8z0Jq2sH+g
 PevP2yOfgvyAoRpCblNCliFPwxd3Q9GNxuK7ZFQjUSFDA21mWoXzgrUntgBPAfN6rb9z
 tA4ST2OpyzlVrguhxGijOhgZbKrTfC7nTyb50T41oeU2ugCxKrNj73JnoWnssIDSLkL4
 5OH8BZILuCS5slgVW8rQNv2RGNazxPKs172ETLIOuXr4hPqFMz+JMBwe7LAao3IaNVo6
 6pOEVj+V4yHLVv5WWbwqjIURYYhfBJ6s4+vLOO96roMtrpuLOoVPCTAOt2ajZDwKIawC
 TvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZBFds6olkH7qZWoO3BcF5jnp49SAncP60CSiK32nvCU=;
 b=1/axCOCRm8SMoODUjIWk6UJWw3RnpluwBoLZGaXQB1rJJvuMX5qypifmQwWfLi2p/s
 4OgTo1yWQfXNfxG55PlQODbzmfFySc+b14juy82De3gnlNRZesyJR84Y2aAODjWs4W8m
 KCF8cDzUAWqQn5aTHM4wpAgO9BJe4Jm84WP7DK0/38CslMXDobAKYsRfix9U6Kvws0l6
 VRhK/Q5pRDeniXx9hwzJyuEC6QMzkbK8ecMH6MzLy/+PgKAb03DSx3mstpf0Gdm83ZPV
 dBA044bGsaXjHAEXvLFPkgas0w+L33S3REk/sP9wp8JepaiAVMICc9SOQLzyISSGxKO6
 dTUA==
X-Gm-Message-State: AJIora9tWCBgMI2cdugLijB5hwbIgV4yCdxs3ixn59+X2TiJBwOisDRf
 Nn4gsWh5jlPJ0p2sMmhKY3Y=
X-Google-Smtp-Source: AGRyM1vZ/A+Vp7yMvTtkW1G5gpiZdY17tzZRcpC8TGWh/YaaI0JZwzDLX2rNEOcvJ6ZApE0NroUE6w==
X-Received: by 2002:a05:6a00:140a:b0:4e0:54d5:d01 with SMTP id
 l10-20020a056a00140a00b004e054d50d01mr34348533pfu.20.1656913192917; 
 Sun, 03 Jul 2022 22:39:52 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-4-255.emome-ip.hinet.net.
 [42.72.4.255]) by smtp.gmail.com with ESMTPSA id
 h24-20020a635318000000b0040dffa7e3d7sm13904507pgb.16.2022.07.03.22.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 22:39:52 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [PATCH v4 04/13] dt-bindings: leds: Add Mediatek MT6370 flashlight
Date: Mon,  4 Jul 2022 13:38:52 +0800
Message-Id: <20220704053901.728-5-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704053901.728-1-peterwu.pub@gmail.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
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

Add Mediatek MT6370 flashlight binding documentation.

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

