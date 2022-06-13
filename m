Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1725484B7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 13:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB47B10E419;
	Mon, 13 Jun 2022 11:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4548710E416
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 11:13:03 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so8545131pjo.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 04:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T2LOWa0LYPNbUOdZwXstN4Fj+e3Z/fV8r2vTbFyL+u4=;
 b=QWJkRnN2FsU0KWBpmQ0dClhx2X/Q4DMK9O2gzJeroxqmrEQxh9/Ce9w7uvOzjztTN9
 Cps7cjw2oA4cGlShBG+N3BaSCMmpzIcFqLITmOuYndkT5OOSpCYLbuZm6AYod79wiHOz
 xVxQdPM8KLhnmlyQPfmbbArC9EVKNCBtEWDpROJSIXStwGne0OEcce/wdz+9jeElhpw0
 KJj0XehQz+yipHnUvS6ka77cD9f4kLFkQWFhFNSZ5goan0N+XNhgPZ4LmSmiN7yOvxTm
 fSGhTRr5HnsKQa/cJWfTTvvC3Ou015Bb0VpJqhpcbUKXT6NXvuCMtFolGUcHOy2Si1gm
 lzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T2LOWa0LYPNbUOdZwXstN4Fj+e3Z/fV8r2vTbFyL+u4=;
 b=S1KcU4iaCSBVOSGteAUjQPZXZfSJOF5NzlsNuzgsTJy/TwhVAWaBfe13jVYwgyqhXB
 p8653o2HHZ+dNlUm4gY361WRwcrLSS7zqXFxvEils/Q+fP/DbUoxEEI29VIRDHtQPP+c
 Wk4aJrIru/GtN7rqWvqis9vMz3kaDGUXoS+nTNT3quy19wv7xsBbh1eiwqaTVN5fbF4R
 C7iOdoLHeMg5P43mEz7aqXItWPzYnIYq21b/+2L3Y4e6AtHqqEJIgyXcd9j1icJolXaU
 K96jKvcbRGebx906fu8mYTr2JzOZGICNExnsI5BHdvfUf8JmkB4wSOewVqqNJObTiSXd
 PJZA==
X-Gm-Message-State: AOAM530mBvazs0mXQGHQcYgaJ7xRYIRWz1s+L8CyOTY3xOkX4wHkQJim
 69PFyPvTciQYQcWikGbROCY=
X-Google-Smtp-Source: ABdhPJziskZ5VakXCRbxfIE9XDHG2+SOluNMJVEggkCCLainBKLWkbDKcCDtwc49dmgiEPsQomfjZQ==
X-Received: by 2002:a17:902:bc84:b0:167:80c6:aedd with SMTP id
 bb4-20020a170902bc8400b0016780c6aeddmr38752631plb.97.1655118782858; 
 Mon, 13 Jun 2022 04:13:02 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-115-109.emome-ip.hinet.net.
 [42.72.115.109]) by smtp.gmail.com with ESMTPSA id
 g17-20020a056a000b9100b0051b4e53c487sm5199989pfj.45.2022.06.13.04.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 04:13:02 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 04/15] dt-bindings: leds: Add Mediatek MT6370 flashlight
Date: Mon, 13 Jun 2022 19:11:35 +0800
Message-Id: <20220613111146.25221-5-peterwu.pub@gmail.com>
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
 szunichen@gmail.com, Alice Chen <alice_chen@richtek.com>,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alice Chen <alice_chen@richtek.com>

Add Mediatek MT6370 flashlight binding documentation.

Signed-off-by: Alice Chen <alice_chen@richtek.com>
---
 .../leds/mediatek,mt6370-flashlight.yaml      | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
new file mode 100644
index 000000000000..13610bc23d0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-flashlight.yaml
@@ -0,0 +1,44 @@
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
+
+    properties:
+      reg:
+        enum:
+          - 0 # Address of LED1
+          - 1 # Address of LED2
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

