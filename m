Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDA525F90D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 13:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EA06E424;
	Mon,  7 Sep 2020 11:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AE86E422
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 11:10:34 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a17so15350449wrn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 04:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ksfc1mO30cLXViBtYtZb85XN30sTC3Vit9JBymnzNwE=;
 b=L5LV3TmznwxKFMrjSInEz1r5fPbaLK01lzlEqVLfKgITk1M38tBh9QdrNF27X1ewbv
 ZJ5CYAaFOyCM5/1/HyhDBqiQXHF6QC2ItV03Crj1+DuptshphgdT2guRFJ5ogbztJ21e
 nvAhIRwVurv8gJ8aFWF4v9KZRPjSTHWTaSScPxm4r0ze38QLlYUZnuMGJ8UKmW3v0B62
 IIkezs/Q4LnnltkCxjhi1sThjVoXoneJF6QmZN9uvifez/woOa1yqSPTzWhWG6TPWjJN
 MlYdOSX6EKBwHjnkcguFebmW+tXjWHhBQJGqJHVCl9JguyHb7a/U/jDftkyHo8J8a37u
 fV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ksfc1mO30cLXViBtYtZb85XN30sTC3Vit9JBymnzNwE=;
 b=RcIVadJ1wr6cUiWBZvYpIDNDcOhjI3LoCqonTouk9bPm5vf3G+ORPMg/P1rS0LB4HS
 u2z7nxfnqcoEvy/QfZSowYhvu0EWY6OygzQQ+9e2Ndnrn6TfkOI52rzAOORgRo9al5PA
 ooDXyKiCnl3+03xy/R7Pv4dHWFvyJYgh/prS/Mbi3yOlf47hV1KpftUxbaJM1OEfC1QV
 4oxMPL8YS/uFxqi+7Akv3WSAV7ROM9I5Kx8K1ULWaJgQj0aKXr4eG2Kxdr8fIAs8fX1B
 PWu/U9cUowKhoWc16JB6abLgeec3Gi0wNiyIul6Y/eNRa0aIPRVgCY8+JLMPo+Yrz0J1
 4J8Q==
X-Gm-Message-State: AOAM53169HhvLdP5y6ucGgjd+iqB5G8Y7M/I6Hf450BzgONJJeBn8sCc
 yull90iEQin0JlHNJomupQl6+A==
X-Google-Smtp-Source: ABdhPJxEekX2hSCryqMffGe1N5PtVtj5Lqq1CMosFkbr9M9VKGuytxsv/T6GZvG6eFxNQ24VGYt2Lw==
X-Received: by 2002:adf:9ed4:: with SMTP id b20mr21235068wrf.206.1599477033135; 
 Mon, 07 Sep 2020 04:10:33 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id u13sm19922111wrm.77.2020.09.07.04.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 04:10:32 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: display: panel: add TDO tl070wsh30 DSI
 panel bindings
Date: Mon,  7 Sep 2020 13:10:26 +0200
Message-Id: <20200907111027.21933-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907111027.21933-1-narmstrong@baylibre.com>
References: <20200907111027.21933-1-narmstrong@baylibre.com>
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
