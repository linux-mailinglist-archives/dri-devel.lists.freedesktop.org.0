Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B169348778D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 13:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AFC10FD6A;
	Fri,  7 Jan 2022 12:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0156810FD6A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 12:22:20 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so6298110pji.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 04:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=j2hVMlNtYj5VEZ4Y0Jxi4coXu71w03xKJ5OC/uICxbM=;
 b=NmATg7It3Il/fTwBYVReR2qL0539xNHXqwhaC0Io36c1Hse/4RmuJk8p3V1iAoEAHz
 Id310GNdgnitLhaWeAwpIxqQ8Ama2awsWR2hUiMGlGzHeNrgWx1VCzgQg7aWjweGPpaz
 hhmcdLVcHmdpxgOnIkNAAQNNE75nHl7Jxo0WPKuySplURCkS5PG3f3qM757JjNtUPezY
 61YiywVtRFfCcCREn5xMi8kKQID6rH3ngw4+WcW4QOXG169tGnQ2vXGEzA9hcqnutGn3
 tVxOuucpCztEO18Skvsnulo0/WBkM1lVzfxAFkqszmGcO/0v260EcPG7RZpHYTIXOczv
 nDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=j2hVMlNtYj5VEZ4Y0Jxi4coXu71w03xKJ5OC/uICxbM=;
 b=qGH8TkWG5IfuJQl3ANN+q0SasbheTflDBx27eP2a1CpDia1d95p3cIjxEuVwNl/vIS
 7Ypv0AY0h60O+5l77Hy1FzBG8QA9AZkZb7jXdzvXEe5hcEvW02qBn0Vfc6MhUAkxGQIa
 XSnbcCjWibliNxYAlCqwDlRWvQSsjpE2sIXKCtfHHR9LgtC6xUb1xh6UZEEngDv9iq+o
 49si8WwngOSgKRLkE0OmJ+oPBW+j+IEnspgfeZg8kSrjyq12/gkfvK6fRlPBFyz6hOZ3
 44VrJMlFN2Nbgx1AyexicWPrQPxP0rvS6n32cbiRoUBs5zP71prZ5R+66xPADVadnv2l
 irQA==
X-Gm-Message-State: AOAM533C5bk5qYgxpXqIYRnOSr3c3w3TrHpuOEBq6MlpYWK7GOlX5xdq
 Gy/PwnOlMSP5GvJV6sN7LRRpHA==
X-Google-Smtp-Source: ABdhPJxYPhYn/uXSncnYHL8SnUZXPEHJiyYRnFKZgWswA7zlt3cluhf9z1TPTccC6ncbn0MdMB9u5w==
X-Received: by 2002:a17:90b:3848:: with SMTP id
 nl8mr15322592pjb.167.1641558140626; 
 Fri, 07 Jan 2022 04:22:20 -0800 (PST)
Received: from ubuntu.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id o11sm6013071pfu.150.2022.01.07.04.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 04:22:20 -0800 (PST)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: display: Add STARRY 2081101QFH032011-53G
Date: Fri,  7 Jan 2022 20:22:08 +0800
Message-Id: <20220107122208.3893-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220107122208.3893-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20220107122208.3893-1-xiazhengqiao@huaqin.corp-partner.google.com>
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 hsinyi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dt-bindings for 10.1" TFT LCD module called STARRY 2081101
QFH032011-53G.

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
---
 .../display/panel/innolux,himax8279d.yaml     | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml b/Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml
new file mode 100644
index 000000000000..fdcea3870dfb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,himax8279d.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/innolux,himax8279d.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: INNOLUX HIMAX8279D DSI Display Panel
+
+maintainers:
+  - xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+        # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
+      - starry,2081101qfh032011-53g
+
+  reg:
+    description: the virtual channel number of a DSI peripheral
+
+  enable-gpios:
+    description: a GPIO spec for the enable pin
+
+  pp1800-supply:
+    description: core voltage supply
+
+  avdd-supply:
+    description: phandle of the regulator that provides positive voltage
+
+  avee-supply:
+    description: phandle of the regulator that provides negative voltage
+
+  backlight:
+    description: phandle of the backlight device attached to the panel
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - pp1800-supply
+  - avdd-supply
+  - avee-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "starry,2081101qfh032011-53g";
+            reg = <0>;
+            enable-gpios = <&pio 45 0>;
+            avdd-supply = <&ppvarn_lcd>;
+            avee-supply = <&ppvarp_lcd>;
+            pp1800-supply = <&pp1800_lcd>;
+            backlight = <&backlight_lcd0>;
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.17.1

