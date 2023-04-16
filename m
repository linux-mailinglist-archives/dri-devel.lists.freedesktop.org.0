Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA6B6E40AD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658F810E396;
	Mon, 17 Apr 2023 07:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B6710E101
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 13:16:41 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-504e232fe47so4178057a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 06:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681650999; x=1684242999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WfDIW5rjyoFm2k6hd0M174LyRPZ8573uTfgcRgpaEoQ=;
 b=OfV9N5LHXN6YUT8ieqA//I9kn/scefHuy/SXb2SfukWCz5UQ4YuXYeOx8e+cD8hE6S
 cgkNXO9bn1tSot+Ybujk8IkZrzGvZDJQNgg2DeOK8p++7pclg6Nhaueb9Hzz/IRk9Vsm
 rfbMrFCzC9LJu0lHxyvmkeOJdyEb9v8HV7hPHv2oKxowEYztkcVz94BxV9QlkzKJgAaV
 b50Lt1K6hhRIL6q8CWMo7W4UMdLxfRNJ0zCX2GchpfrwjKzeq67fvVaOsz7krOfC1/KQ
 VXh3p+zJ7Qt1ip4QA4LjdfrYGx00K5AUM8hlJoRTv/TdS3IgXuOJKygu2BHKJTFDB6y4
 XgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681650999; x=1684242999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WfDIW5rjyoFm2k6hd0M174LyRPZ8573uTfgcRgpaEoQ=;
 b=YRSJJEfur+asQUtThvm6FG2On3bTssa0ZLCW3pU+euCLwKDhPRR6ewQFcp+Kfnz9rJ
 nzUA707GolwDIRUZFkR0qyvZPVKEFLv4lIBU+xNCKEfgcmXyPwrgEsKhu+0Bxtsru032
 XQzma6KM6ipbc3I2fx9OzBiPkUIBwxrScFGi3OETPzN6SurZOJztusYkYAAqboNXiYSr
 6eIEEpRHrMJ2kTqydbGvFWBpVc8nsn0Tg1hK1NscGHv0lVniE5fq3ZcUQloBI4YZCKGj
 zoCUjcGOQmnY4ZkfT2lHqx1Ah2oKsN4JiGI/oR3/TVaE0ACePel06nE6GGJXS73Fi/zn
 a5Ng==
X-Gm-Message-State: AAQBX9cvkl7oAfGfIOIZ02gqzA32MBFhtq6Kn7t3MwsEzQVBimpAVG97
 2Qc53A/Ut6MwUFDrtBpAXbA=
X-Google-Smtp-Source: AKy350ZenHNVl/GG+d/h/VzSnnnqzGWK4qxf6AG9RITW6+Se/4FyHYe91VRpPyB6eRmsPraV18WRXA==
X-Received: by 2002:aa7:d88e:0:b0:504:b325:bd4d with SMTP id
 u14-20020aa7d88e000000b00504b325bd4dmr10619788edq.12.1681650999143; 
 Sun, 16 Apr 2023 06:16:39 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl.
 [83.8.121.70]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05640204c900b005068d7ccfb0sm2396594edw.83.2023.04.16.06.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 06:16:38 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH v3 1/3] dt-bindings: display: panel: Add Samsung S6D7AA0 LCD
 panel controller
Date: Sun, 16 Apr 2023 15:16:30 +0200
Message-Id: <20230416131632.31673-2-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416131632.31673-1-aweber.kernel@gmail.com>
References: <20230416131632.31673-1-aweber.kernel@gmail.com>
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
Changed in v3:
 - Correctly applied suggestions
---
 .../display/panel/samsung,s6d7aa0.yaml        | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
new file mode 100644
index 000000000000..079e2b3a9eaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
@@ -0,0 +1,52 @@
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
+  - reg
+  - reset-gpios
+  - backlight
+  - enable-supply
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
+            reset-gpios = <&gpf0 4 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+            enable-supply = <&lcd_enable_supply>;
+        };
+    };
+
+...
-- 
2.40.0

