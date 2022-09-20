Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DD75BE978
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 16:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8612E10E6E9;
	Tue, 20 Sep 2022 14:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0BF10E6E6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 14:59:11 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id o64so3990926oib.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 07:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=NZC+2ExHC+wGOFhEmV0ISK1oyhctVGyiZ2MQueQNbW8=;
 b=BjTkhAG9wMi2bfo6tFRRYDuKbJU0BhInbItZU66ifvZOohSQ6vhrWBbYNufng8JU3I
 Al4s6GrWUYd0ebNb4pdw3CTAOAJaxY7MB+PwDf/ljczwwgV5SAFY8M2NRNPfihn2GJyb
 cxJEBZR5DVZr1wfZxO2qrAMNSxSwW8FkTiGaqYanfnNPx6KIpV/CWU8C7tRJLkvculay
 ucxam/R+3pDkuWL5EBZOiD3D0SEiHjbEkX0zl3+9ZFApX7lHGaw9ztDqOxjjRSTHSIYf
 hvvpBjJGbRp7GZ841onaKE8v9FyIx9LF7U87+jckCYLXUUCdSXIH6Xqytf0s0IKudqb3
 3uVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NZC+2ExHC+wGOFhEmV0ISK1oyhctVGyiZ2MQueQNbW8=;
 b=Hdb8+3WR6+9bLXvXcvXKuOaFBHAH1fD76pL47Y6tS9p6EoLsmq4h2LodmPs9hqEC+F
 gDBkK/qIrrCGKZAKEn8bCTsZkIMZTq2PG8IZXoRrKjqXKxrXFudaVgvtH4+ufjJHU6K/
 eL5STqOtR8hQz2h2qNb1uK5CWkiKavJYpl7+1D+7JiPGuTnFNgkt+Pxh1ZPi9DazKumO
 FlvrZCkUdTdaszenZlFTH/nKUInjGABhoWjSknB8uuT0wvbTnR0HgoXH8mumD8ra385x
 9q/2oz74SQBGIsxrKdYj51fHJoB4PSECf6Nd5lJkMFQz36t4cdp7rZajfuYQYpmn5Lyh
 9EmQ==
X-Gm-Message-State: ACrzQf2roC15lVhl1v7zx7uoOIqEDf1oXXmlDcU7LRoSZgElHjR/3UkL
 2w172ZDgq+6muME82Pp+0jkpDlk3M5M=
X-Google-Smtp-Source: AMsMyM4kqhlRB2TP6+RyTJGwJEqtNNoKYTG2leFstt5PhmSqLHWJZCBIof1QnaG+ZLIGpRRMxqlDfQ==
X-Received: by 2002:a05:6808:1aac:b0:34d:8fe6:bada with SMTP id
 bm44-20020a0568081aac00b0034d8fe6badamr1783207oib.193.1663685949838; 
 Tue, 20 Sep 2022 07:59:09 -0700 (PDT)
Received: from wintermute.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a05680803c400b0033e8629b323sm203156oie.35.2022.09.20.07.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 07:59:09 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 2/3] dt-bindings: display: panel: Add NewVision NV3051D
 bindings
Date: Tue, 20 Sep 2022 09:59:04 -0500
Message-Id: <20220920145905.20595-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920145905.20595-1-macroalpha82@gmail.com>
References: <20220920145905.20595-1-macroalpha82@gmail.com>
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
the underlying LCD model is unknown. Name "anbernic,rg353p-panel"
is used because the hardware itself is known as "anbernic,rg353p".

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../display/panel/newvision,nv3051d.yaml      | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
new file mode 100644
index 000000000000..d90bca4171c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/newvision,nv3051d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NewVision NV3051D based LCD panel
+
+description: |
+  The NewVision NV3051D is a driver chip used to drive DSI panels. For now,
+  this driver only supports the 640x480 panels found in the Anbernic RG353
+  based devices.
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - anbernic,rg353p-panel
+          - anbernic,rg353v-panel
+      - const: newvision,nv3051d
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

