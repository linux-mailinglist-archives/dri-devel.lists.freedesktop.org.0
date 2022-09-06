Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5BC5AF3B6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 20:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8EB10E0EA;
	Tue,  6 Sep 2022 18:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D8310E0EA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 18:36:47 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-12243fcaa67so30322710fac.8
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 11:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=VeAkYJr5cV7UOdIxHXK8x7A3sYToMzAJATkPDcxd6fI=;
 b=bCQ70kUcHUTtt9rFVZ5Od8WUAFgESMI/to12CwbZLkow3rucb6JtwGAQ1Nj+5LAH6g
 27Ugslizd7++BDUk5czC9l2EQw2/ZII0WELNgprkopvuljx7OwDD5vj8wZYUuLkCBkto
 UCzXRbZ75vQW1cPd5nL+SElSY/c+YHCA078CpWB8sCIfjGHX8QnpNodlHsMKGHssDU48
 OOELE19z32HfpHZ+i6iuPQ+TusZYGcq5WDBiLoxZG6mLRL5oIZ0/sDiUoryFi451vuJ4
 L+QTRvuesYOSKGdH3zps/6uxIBJ9v6zlCy0GvPQ9nvhXYs3fox7OMA49+/dY9UhbN6zG
 WoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VeAkYJr5cV7UOdIxHXK8x7A3sYToMzAJATkPDcxd6fI=;
 b=uOatYp8Q62fXtWDYV64DGvfsOULWGPP0ojqHJCuUVlzJs7Eo/Yq3cR+Jo8VCDsFEHy
 U7HfzCB7N2CkVMfe6o4aP59ct9UUrmIOqLW1LgN7VybJTLkmfqn5HNeLafQxbIuP9KzV
 HqEV1/S/wLFYRc0kHcJzlPp+esXtXgm0r2hgBGKcjiOyFzJFtPR+bOLpi4GS5a8J4TYW
 P/M5OV40etTFzW4MXuKEtdMxIRizbBXLuYm4wSJDkshUaqSq5j19zo+f+dZPidAWtmSh
 ko0HDo8Svy+sX2Up6VrOqkwWYoKvS2oxO7J4ZQm/ThhdBZbVNEMK+YUyj3MLJgAsHa1M
 WDrA==
X-Gm-Message-State: ACgBeo011dQNI+aq31lhXlTMAF9URFfDXwduaouUqQEuJC0Eo12c3Vew
 eTWwV2Mp/l5A13Wbt+4EIGSLVjgZ818=
X-Google-Smtp-Source: AA6agR5WocPFsE3jYbjBJ9QILHNVCwf5Jv70R9n2QdLurAWCvwsdRgs51KteWK07As+QWPUt/vJq2Q==
X-Received: by 2002:a05:6870:3449:b0:11d:1e78:266c with SMTP id
 i9-20020a056870344900b0011d1e78266cmr13232094oah.122.1662489406869; 
 Tue, 06 Sep 2022 11:36:46 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 j22-20020a9d7f16000000b00638ef9bb847sm6158887otq.79.2022.09.06.11.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 11:36:46 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Samsung AMS495QA01 panel
 bindings
Date: Tue,  6 Sep 2022 13:36:41 -0500
Message-Id: <20220906183642.12505-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906183642.12505-1-macroalpha82@gmail.com>
References: <20220906183642.12505-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add documentation for the Samsung AMS495QA01 panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../display/panel/samsung,ams495qa01.yaml     | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
new file mode 100644
index 000000000000..e7373846e7d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,ams495qa01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMS495QA01 4.95in 960x544 DSI/SPI panel
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,ams495qa01
+  reg: true
+  reset-gpios: true
+  elvdd-supply:
+    description: regulator that supplies voltage to the panel
+  enable-gpios: true
+  port: true
+  vdd-supply:
+    description: regulator that supplies voltage to panel logic
+
+required:
+  - compatible
+  - reg
+  - elvdd-supply
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "samsung,ams495qa01";
+            reg = <0>;
+            backlight = <&backlight>;
+            elvdd-supply = <&vcc_sys>;
+            vdd-supply = <&vcc3v3_lcd0_n>;
+        };
+    };
+
+...
-- 
2.25.1

