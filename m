Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF116E40AE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D06B10E390;
	Mon, 17 Apr 2023 07:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D7710E31C
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 10:01:46 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-504ecbfddd5so3202596a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681639305; x=1684231305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ifmHqQmj9ZpKE5qeUf2zOsOombCp0CdZ4s2CBALGYW8=;
 b=SgHTx1h8KHwCv9z+bn5VGDN8r6XKvNFuH2jqNCFw37FqJUt9kfEMNhpTapioXdMzru
 XIOjC3hLT7VtaE2umtbsVd1xzM5YNFch+5fjtOq6ehrPujIYDABTHwxBB1c8NO8yhINU
 qH6nLWdMW4lSzPaQkw88PY5Z3stZk4Pcs99cdQle2hhXw1t21JAGJ94O29fPa6PZsNMT
 fO2mgHvyJocDORRX01IIxn3JJCn/PM285UtO3IEMy+3pYCFM0rpU8aiwRQUuwRTFJzd9
 noSLqZd4n57u395S2rtXQxHnULWcS+ke2Nv/AkPtDmoWcLtx6MKVJODpR764J47r75FL
 p64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681639305; x=1684231305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ifmHqQmj9ZpKE5qeUf2zOsOombCp0CdZ4s2CBALGYW8=;
 b=iRXKtIrg/ybDEDg9UFlsPJ3Ljzw+un2SXivcGucpvepxCWdzFm8/WlU/9yeIjlwVtN
 jJfV2ClTMXZZ7zR+iqzaPADuHA24sVw+XJipxAPkogZXso91BZZu/G6ddvj3Ls/BYKpg
 S8BVJdl52b4fXNuLT2cHfO37ldVowi5L0Ih7yXnIPlp6FTtnj/R40B4S1e87sVeXws3M
 Kq+kfzMQbG8R35yxjumfuzklng97utLThRq/LxxbU8pBAyKXrsrgQ4PbTRj3131IfiZJ
 XjRdTaycBz3ApJ3OE79kL3l2aoD3FOdh/25cEGrYboiVu/pEmElK5aJnHzY7JO9IPqaL
 TMgQ==
X-Gm-Message-State: AAQBX9d75ojjjBjYous0SoEZbJz95xl09sbpYCwyhJ2wqX28hJCk4IpA
 2qVIuwA6FowdQrw9EUi/kHM=
X-Google-Smtp-Source: AKy350YvjEqcVlLEalKOluRbrTlxGidK5ID3dL5VEztZsyzq+4AHgYCg68FJCeW/2AnEIa1ucNy0lQ==
X-Received: by 2002:a05:6402:216:b0:4fd:23c9:11ed with SMTP id
 t22-20020a056402021600b004fd23c911edmr9586434edv.17.1681639304618; 
 Sun, 16 Apr 2023 03:01:44 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl.
 [83.8.121.70]) by smtp.gmail.com with ESMTPSA id
 lh22-20020a170906f8d600b0094f6bf5ac9asm145232ejb.22.2023.04.16.03.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 03:01:44 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH 1/3] dt-bindings: panel: Add Samsung S6D7AA0 LCD controller
 bindings
Date: Sun, 16 Apr 2023 12:01:37 +0200
Message-Id: <20230416100139.13741-2-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416100139.13741-1-aweber.kernel@gmail.com>
References: <20230416100139.13741-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Apr 2023 07:21:51 +0000
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, krzysztof.kozlowski+dt@linaro.org,
 Artur Weber <aweber.kernel@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 .../display/panel/samsung,s6d7aa0.yaml        | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
new file mode 100644
index 000000000000..969cef7738b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6d7aa0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6D7AA0 MIPI-DSI LCD panel controller
+
+maintainers:
+  - Artur Weber <aweber.kernel@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6d7aa0-lsl080al02
+
+  reg: true
+  reset-gpios: true
+  backlight: true
+
+  enable-supply:
+    description: Enable supply
+
+required:
+  - compatible
+  - reset-gpios
+  - enable-supply
+  - backlight
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
+            compatible = "samsung,s6d7aa0-lsl080al02";
+            reg = <0>;
+            enable-supply = <&lcd_enable_supply>;
+            reset-gpios = <&gpf0 4 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+        };
+    };
+
+...
-- 
2.40.0

