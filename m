Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3459A5AF3F6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 20:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC6010E185;
	Tue,  6 Sep 2022 18:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02C910E11D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 18:52:13 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-127a0d798bdso9982313fac.4
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 11:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=MidhS3igYoUpLnAxSJdLelh/Ov0WSVkJewFCKlWvPtM=;
 b=Azs+faEsfXk3//86XNbsAdPMreNFiOcqhTuB4uMpN5PPZ4wClgRTo+oMDFPk8o1M5H
 /ELKD7c62CPYnMaQYa3jZcJgJwE6ZyNYC2N5GfOcLXbyl4zCWJ5zGIdVfPRTMewIS8Ha
 0Y2HeK3XeVg1TJF7eKAIs+DCEQrfm0a+kHQhiWxrZLpzGRr4BCJV9xF26N35tHTrhcR3
 8e9KF0mJn+Xoj0Dcn/YXU89ghZz4jWU4EQyP3cFg1dcEdCnjTil5/yVWB384sbmM39Ea
 0wPLAk8RUeYFqbidFTRD0m0CESO+4usuWAb0z+XI+Qk3TDzbDpSkg3z+vClGVx6TlkNe
 e6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=MidhS3igYoUpLnAxSJdLelh/Ov0WSVkJewFCKlWvPtM=;
 b=fN6RqXkjNniZkdNYoHVQasvLQa//bAzy5QLsD1HyTKSALfKx46muUjE3lVtrHmt7gU
 Ea0u5wnSSJlqEUAk1ebRMyyjtrKbdBTvC0PkLczVEm8UsRo5uXxr57oqP/ZhMS2fSJXk
 maRQyW+zABAdSbnlY4WYL22RY4UzT/mhfS7J/wXLkTwQTPcia/GkPqUPTp9dIvQNVsCA
 EbYm9q66fV4/SzHxx0HTRfCOoyQ3eUUIlYtYbXMSr7hDQdJIb/FDVJuu05GB4YC98D8i
 /pG/GjhnYom+r38g7K1N/FS1KYFM/378DUkLAD0peGoX8RxZVXaq3SJpEecoc+n5DV+i
 XZvg==
X-Gm-Message-State: ACgBeo12RsTQsayasFn2jMkLGbHAJQe14w7zUXWKv7KdxzCQuadVuWOM
 SwoM+wpvCUmktId0j4jtgAZI0eS5c+o=
X-Google-Smtp-Source: AA6agR4BYZZ1kZJXckhyO4mbuTaJAsiCAB6z0uGN28nhIcyOGFqx4mExeJ8uyakOA9d9+pxgkO/dkA==
X-Received: by 2002:a05:6808:190f:b0:343:ba2:7d4d with SMTP id
 bf15-20020a056808190f00b003430ba27d4dmr9902396oib.227.1662490333007; 
 Tue, 06 Sep 2022 11:52:13 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 f205-20020aca38d6000000b003449ff2299esm5666177oia.4.2022.09.06.11.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 11:52:12 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: display: panel: Add NewVision NV3051D panel
 bindings
Date: Tue,  6 Sep 2022 13:52:07 -0500
Message-Id: <20220906185208.13395-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906185208.13395-1-macroalpha82@gmail.com>
References: <20220906185208.13395-1-macroalpha82@gmail.com>
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

Add documentation for the NewVision NV3051D panel bindings.
Note that for the two expected consumers of this panel binding
the underlying LCD model is unknown.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../display/panel/newvision,nv3051d.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
new file mode 100644
index 000000000000..016168d8d7b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/newvision,nv3051d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NewVision NV3051D based DSI panel driver
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - anbernic,rg353p-panel
+      - anbernic,rg353v-panel
+  reg: true
+  backlight: true
+  port: true
+  reset-gpios: true
+  vdd-supply:
+    description: regulator that supplies the vdd voltage
+
+required:
+  - compatible
+  - reg
+  - backlight
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "anbernic,rg353p-panel";
+            reg = <0>;
+            backlight = <&backlight>;
+            vdd-supply = <&vcc3v3_lcd>;
+        };
+    };
+
+...
-- 
2.25.1

