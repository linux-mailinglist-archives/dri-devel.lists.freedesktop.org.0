Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FC125DF8D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 18:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039A66EC85;
	Fri,  4 Sep 2020 16:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889516EC85
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 16:15:16 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m6so7330684wrn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 09:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ksfc1mO30cLXViBtYtZb85XN30sTC3Vit9JBymnzNwE=;
 b=Y056GuRHCxq6e0BBzqF948ztntuwIOz8bO5EXHZVceS8Jg0CfqOhBKqJlvVGpMwE4h
 iBh4LOB63DMx1RosXGJCf3erVS+BHoXJDPqtMJO7SIyyr05UVzhbEkh58RtK6t2KGkQq
 +Hy7UxD+sn6UhDGkxFCBUqtVQRBk48a+rzjkV6EVsnySbNQp2bAUVRuMQXxMJXA4J2cI
 L2hgvAP9NpXeUxdYoj7tslaf5AaEAl7u23kYEPbxTdtDBONu9Vi2bnZhz0KJQ3OZ+uAt
 vnu0Kqe0eMNoIac9xzecQ+BAnumczCrprQ4SqaeCKAcbcUtfAE+Lg5OeI0HaKwYzCfcA
 EYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ksfc1mO30cLXViBtYtZb85XN30sTC3Vit9JBymnzNwE=;
 b=TVXnOt87jwroi75hTlDdfcu7/Arg/y8aqwCcR7jdz8zCc/14XJjQKnaws5MdPIOg41
 pLZ3BFes4p5yQMIycFTcpxUVkaFwfX4tJdI3EUt0I4+PWIru+FaZxc7ZmMULpdJ6Tjxw
 PxURyccHnFCymVOxI7XKSnJzPbbksbvdY8WQqssCV9WlDX9iL3kkaBVoyOOPJ650rol/
 K7qHfnicKOyDUS869Epqfr9Nr7JXr0HATuYeXp3OY0Fz1RFs+X5kgb4W5ZtIbk85CQiJ
 nNqhanVcNGUcx045znLtZeNfRn6XQN6GeEkzNkKwamxADGLgmEEU8+HtY6mSrmlNDhU2
 /82A==
X-Gm-Message-State: AOAM531/MR/JuOJz5djR7usSu0lYmu0FXKN8zIBhsPT7moCFUV1H3zHi
 E13TMg+ydfztgcUcBSlTgKDhhA==
X-Google-Smtp-Source: ABdhPJyny9jilxsNRKY1nnZVgili+ToZTQVRduxfJ01Z1nxjj81l/gIbx4yQO5JFHzDk5dUnx3wprg==
X-Received: by 2002:adf:f149:: with SMTP id y9mr8153667wro.93.1599236115028;
 Fri, 04 Sep 2020 09:15:15 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id d18sm12238160wrm.10.2020.09.04.09.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:15:14 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: panel: add TDO tl070wsh30 DSI panel
 bindings
Date: Fri,  4 Sep 2020 18:15:03 +0200
Message-Id: <20200904161504.23915-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200904161504.23915-1-narmstrong@baylibre.com>
References: <20200904161504.23915-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This add the bindings for the 1024*600 tl070wsh30 DSI panel.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../display/panel/tdo,tl070wsh30.yaml         | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml b/Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml
new file mode 100644
index 000000000000..20f4fdedfcb0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/tdo,tl070wsh30.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
+# Copyright 2020 BayLibre, SAS
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/tdo,tl070wsh30.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TDO TL070WSH30 DSI panel
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+
+  compatible:
+    enum:
+      - tdo,tl070wsh30
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  backlight: true
+  reset-gpios: true
+  port: true
+  power-supply: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - power-supply
+  - reset-gpios
+  - port
+  - reg
+
+examples:
+  - |
+    dsi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      panel@0 {
+        compatible = "tdo,tl070wsh30";
+        reg = <0>;
+        power-supply = <&vcc_lcd_reg>;
+        backlight = <&panel_backlight>;
+        reset-gpios = <&gpio_reset>;
+
+        port {
+          panel: endpoint {
+            remote-endpoint = <&mipi_dsi_out>;
+          };
+        };
+      };
+    };
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
