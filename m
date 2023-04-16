Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947666E40A9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCA510E386;
	Mon, 17 Apr 2023 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A539110E0F3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 13:08:07 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id q23so47899545ejz.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 06:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681650486; x=1684242486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/HOJNcL7jdKqwCHI8Ml1ezJfov1pJyurOhORPKyJms=;
 b=fEX+/66QON1CimKQ44axbXAR1jljjeY8kP4tpF8xW4+ZHCVK/yIstCDRUlL4+/ru2F
 FsXHUEikFbGCkK4q52xoiMAmEACpD8G0sBwkwm2Vg/N+D7g6VMgKSNGywxpoLdC2ZjDN
 wx1f3PTDcxRRt9ZpTSr0cjVofbrha6NqnvzQOABCmr5oI6SiTgtBLyrOLuO04lkoDvSI
 ZJzIbtuEiBStgiWTkUcU+WfORGoyxEsbaRAIzBb895Nen5SN8YHTBXBlUAIcTLgov0ID
 ao4bQQTLoPifrKgqUlAm4zUXTY5q8Xxw6b+Q9siBvtjkXgio8vRKSAAtr4GILLfvIT/b
 11aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681650486; x=1684242486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R/HOJNcL7jdKqwCHI8Ml1ezJfov1pJyurOhORPKyJms=;
 b=WyuQGhZwptDrRoNtr14Yo7Tmg/+BpUlIjnoXE7WzHoSDRe6E/VBfXWBsq/b+6g2AFn
 +aWzCIeczNkWASeQt8Idx6I1BQz2PiO+TxiQVq4VgBzJa3j4mxj08/6Rti3+c7B5aa2I
 wbndH2d3pX/IA2wKw29FSkVdvJITzaOmX8HrGW11FFCMZNUhFOXO6yTTvrJxa19Pzktz
 GA3+ZIz81JIjwh7yHOdHmUeCuLkW+7/89CM2s2/zxQwPTavuLbskO9jMcl+QZia6a8H4
 46Syc5H25AnsPN1ZtOnFaHHFZq6I8WH2/FDxvwVH3Z4uvdqx3RMi/hkGVkFSIhLOguI5
 dqeg==
X-Gm-Message-State: AAQBX9dYCl5ot6jdi31kVXOQ5JBicSKEZCSjEc481Ge9PgGnauHEHQgs
 mbWHQC14ShrwyNP1WEIF+Hk=
X-Google-Smtp-Source: AKy350YWln8BLpm78SWWGr3v55H/L+uHy3iZw/ZKD7WsYnM01aPKEm4birBmq2/3rBDGsvsgoohbDw==
X-Received: by 2002:a17:906:6c9:b0:94a:959f:6d58 with SMTP id
 v9-20020a17090606c900b0094a959f6d58mr5045680ejb.18.1681650485785; 
 Sun, 16 Apr 2023 06:08:05 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl.
 [83.8.121.70]) by smtp.gmail.com with ESMTPSA id
 l12-20020a056402344c00b00504803f4071sm4511609edc.44.2023.04.16.06.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 06:08:05 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH v2 1/3] dt-bindings: display: panel: Add Samsung S6D7AA0 LCD
 panel controller
Date: Sun, 16 Apr 2023 15:07:33 +0200
Message-Id: <20230416130735.30965-2-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416130735.30965-1-aweber.kernel@gmail.com>
References: <20230416130735.30965-1-aweber.kernel@gmail.com>
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

Add bindings for the S6D7AA0 LCD panel controller, including the
S6D7AA0-LSL080AL02 panel used in the Samsung Galaxy Tab 3 8.0 family
of tablets.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changed in v2:
  - Updated commit message
  - Applied suggestions from Krzysztof Kozlowski
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

