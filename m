Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFBD5395B3
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 19:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7126111282B;
	Tue, 31 May 2022 17:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFC8112D61
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 13:25:36 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id
 nn3-20020a17090b38c300b001e0e091cf03so1674968pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 06:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U7ahqBydDZnP+CjyjsQFK3suIZ5X/7W6Ul5AL8gL7a4=;
 b=gY4IDX6Of6Gq9PA3f1jZGTS5g7DSpVEowE1SjgpLLb07Ek5O3bUa1AT3+cfdS6UCd8
 8Xt+NMoxOJuIk1S99ITLMNeJSVAIWnxd9ngnf4E663cBpINBrMmGDXNRpdw8PQO9ESN0
 731JEaDVv5f30evjoU7f4yAGsARRqv7GDBqzFnJF0rzOI9cPUCcO5ApJXoM2duaDE0f5
 fj8i3/Kpt7FIQOYfCSd45IYis8XPGGX3uAMe2IUBvzNCFMPsb0Au7CuvCnnQPXwZzS+b
 0RWSns/CRrkU8x5/UqEZiAzlBoLt3ZRjybQHALkf6vqASoClAAn6hcUxRm+1zZAddYJi
 ZVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U7ahqBydDZnP+CjyjsQFK3suIZ5X/7W6Ul5AL8gL7a4=;
 b=merp13yuF4rJXzmTZ/YkPQif0V2Ya1u7DJtKbadEyPwMTjSufqKNjCLiATRZPpt1gT
 nYigTER6+oYXQjHcfYBjk0XlGt0r6LPxzmu0B7vGJ5pcKSL++6CVZJf1hFJaqa1tgnZT
 Epe/uwvI1hveWlICUwycBHQdX2YqifaWg+A0/1ZMS9KsSEHQKpytZqtclokm+7e3jVgv
 6PSCCeS1CyfhfEMpNrto2zIW275Cra1RGEcJOoeK3R1d1LH92I3+sBBYmM3BF5cgUTV2
 nGTJ3xKvb2QuIA5gzwF+FN6Sxpt+zoNaw+U8HAZS4yYfdU9a8ZqBuNi/0Qf/My8KFh3X
 xsxA==
X-Gm-Message-State: AOAM532wz2djNwmu5j5QvT7bgzaaBqmE++oR37ajKTu+7sCI2hHi+Z1x
 C2RFOSMcRGflJ0fEwNJzLqVGMUCUgjA=
X-Google-Smtp-Source: ABdhPJwXXdpvzfH0OHWambVU4ULlh4L9pgITiSW26L4OAZncDI72140qTyXM7wFe+JzlcNO/h+5R7w==
X-Received: by 2002:a05:6a00:a04:b0:51b:6ea0:43ca with SMTP id
 p4-20020a056a000a0400b0051b6ea043camr3778065pfh.78.1653995972975; 
 Tue, 31 May 2022 04:19:32 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net.
 [42.72.220.172]) by smtp.gmail.com with ESMTPSA id
 cm24-20020a056a00339800b00518142f8c37sm10751608pfb.171.2022.05.31.04.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 04:19:32 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Subject: [RESEND 04/14] dt-bindings: leds: Add Mediatek MT6370 flashlight
 binding
Date: Tue, 31 May 2022 19:18:50 +0800
Message-Id: <20220531111900.19422-5-peterwu.pub@gmail.com>
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

From: Alice Chen <alice_chen@richtek.com>

Add Mediatek MT6370 flashlight binding documentation

Signed-off-by: Alice Chen <alice_chen@richtek.com>
---
 .../leds/mediatek,mt6370-flashlight.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
new file mode 100644
index 000000000000..b1b11bd3d410
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-mt6370-flashlight.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Flash LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  see Documentation/devicetree/bindings/mfd/mt6370.yaml
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
+    description:
+      Properties for a single flash LED.
+
+    properties:
+      reg:
+        description: Index of the flash LED.
+        enum:
+          - 0 #Address of LED1
+          - 1 #Address of LED2
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.25.1

