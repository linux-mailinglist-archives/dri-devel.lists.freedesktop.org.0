Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A45B3E4C5E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 20:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACF289D53;
	Mon,  9 Aug 2021 18:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C7D89CE3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 18:47:32 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id m18so13781538ljo.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 11:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XZ7wnRewIwdMbAhi6z99aJQ8I92BR91L6EtQWC5lXLk=;
 b=QYmhbNeklYsTQNZNZ4xmRjXFSBl2e/AslyltQrPzSxXrISl5MG2cRFdalf7DZboO98
 0fVxNfnWIuFQch+bJdtbYV7E2pqZhjK42hTZeXLrlhMjiRWfc9JOKRirUvbokHk0r+Jv
 I0FoakPlNVEiEkgA1Yd8mVdwoS5lE8iTSfyW7g13dek6iwZj8bmv6OWG9RFA43l/zGRi
 yBCMnefnAO50s39Bsb0pXGzblujuX69TCU3KGmfUUW/1LDRAv4ggDMasmE6CT/8CfW0Q
 CBrYE8Jm6eBTSBL4YSw+q1bkHOJb/NiqXBlmxe5jQpezIvgE4nxKtV0QwpQhiWoEiSna
 070g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XZ7wnRewIwdMbAhi6z99aJQ8I92BR91L6EtQWC5lXLk=;
 b=OJfMsIT9On+F0ullb9SmaQ9x9G7dJNn6GvSOt5xtYVrfoWXZPfBCOcnECHA5RLnRe3
 rcrvXiJsnvDjmrtxAXPLMgbdaLLALNJPg+Ys3rWtZdpFLo28MGTUUNfjMd2ILDdapu3x
 6xKPPc+7f3fY/ccmmBChfS5GfJrET98VdjXqeyEPTwrd4FiLSzT1JA2Ftwp9B8+WNv9Z
 864p3bIcywmoDxpXeyM3IzFuh3t2fhPTNV6iqxp24d0usU7e3+Oafqp7dUcl2+bRjBNG
 fgkBOPcjNyCYf+fDXr6QHMIjc2Q3YGdDthy8m+VjJChDW1MEg+2vBbC7IDyRBzt0W60+
 k2+g==
X-Gm-Message-State: AOAM5328Z6yqmol8NXoFuDPD9IXCUrDvF3l8IatE0pi/vM7npx/kUtIB
 5jWhQM6i6u5cGiqBv+It+2NqaA==
X-Google-Smtp-Source: ABdhPJz/V7rTl2AffWzwR22OpmuG8lB69f2RXqXmtlUIko33wPoasjUUXyrvmz3BI4xpGOEJSk1PQg==
X-Received: by 2002:a2e:85cc:: with SMTP id h12mr10194756ljj.55.1628534851303; 
 Mon, 09 Aug 2021 11:47:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u22sm1216128lff.270.2021.08.09.11.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 11:47:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: add bindings for the Sharp LS060T1SX01
 panel
Date: Mon,  9 Aug 2021 21:47:11 +0300
Message-Id: <20210809184712.203791-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210809184712.203791-1-dmitry.baryshkov@linaro.org>
References: <20210809184712.203791-1-dmitry.baryshkov@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add devicetree bindings for the Sharp LS060T1SX01 6.0" FullHD panel
using NT35695 driver. This panel can be found i.e. in the Dragonboard
Display Adapter bundle.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../display/panel/sharp,ls060t1sx01.yaml      | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
new file mode 100644
index 000000000000..c4af5e7f6f39
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,ls060t1sx01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Microelectronics 6.0" FullHD TFT LCD panel
+
+maintainers:
+  - Dmitry Baryskov <dmitry.baryshkov@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,ls060t1sx01
+
+  reg: true
+  backlight: true
+  reset-gpios: true
+  port: true
+
+  avdd-supply:
+    description: handle of the regulator that provides the supply voltage
+
+required:
+  - compatible
+  - reg
+  - avdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "sharp,ls060t1sx01";
+            reg = <0>;
+            avdd-supply = <&pm8941_l22>;
+            backlight = <&backlight>;
+            reset-gpios = <&pm8916_gpios 25 GPIO_ACTIVE_LOW>;
+        };
+    };
+
+...
-- 
2.30.2

