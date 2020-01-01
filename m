Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1121C12DEB0
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 12:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C39899D4;
	Wed,  1 Jan 2020 11:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BE4899D4
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 11:25:28 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id t101so2115485pjb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2020 03:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uOT/TkO2nnC7kJ3ZhTvZjXZpoEskkRgkFAB8b45lofE=;
 b=auDcUmhg4vlldekHTaQDyr7XuUDsHbVYAoGMfWRlGGSsfEv5e2rcUajNy+n+E22vxO
 TvQ3K/Bpf0JWXK1PRJsNwIluXIcIjsWU2WqD5CL/pnHgGQzmmwY9KiaPGLZznCVDhdW3
 YPi4oE5/tU25aR8/zDNqLyUng7kdaivsSSKKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uOT/TkO2nnC7kJ3ZhTvZjXZpoEskkRgkFAB8b45lofE=;
 b=tIDGqGjL9ysHxAKDJ33YUFx2LWHg1WIkuNqQcf3zzldE3f7pveLH3IHCIrUItNMOhm
 5Mk5yTIYiwfKSFhGplBXWiNniFYBV8OCaatVAUSNQTGap2gFohp81FogFfer5RhXnzyy
 4Aj9SOuBhYMw13wnxrB5qFV5ULtLzGIthuJpRgjHH/SVYi+UgM3Bjs5tMWiNyTi7h8x0
 +gs2lt3fnnsZYDTcfYmElbS9C4uoE8ytEhkhsSNvb0WoAfcGmBg3zStuZJxzyrVcuIgP
 hvkdfPr1bczN2+NB2a8MBvoFnB6EGfCQ3W822PMo5wz5zdwEQcJAgFbeBYmilsx3AL+j
 DRBg==
X-Gm-Message-State: APjAAAWP8aqrlf2SmSmNFsJ5FY3CsFXcIIt5L7fsZc2i3HjUzPwzFOTD
 tumcHgCYBSwTRN/GixTsRTix9w==
X-Google-Smtp-Source: APXvYqw+QbH5vO3Ge5bKFurNuVGs9RF8kk81/+Grun+c37oR1I8wTfEAsM7OfMbCE0x8S1J/FwiNag==
X-Received: by 2002:a17:902:a5c2:: with SMTP id
 t2mr79230619plq.86.1577877928529; 
 Wed, 01 Jan 2020 03:25:28 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:d0fe:8978:1b04:ff94])
 by smtp.gmail.com with ESMTPSA id y7sm51945439pfb.139.2020.01.01.03.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 03:25:28 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 5/6] dt-bindings: display: panel: Convert rocktech,
 rk070er9427 to DT schema
Date: Wed,  1 Jan 2020 16:54:43 +0530
Message-Id: <20200101112444.16250-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20200101112444.16250-1-jagan@amarulasolutions.com>
References: <20200101112444.16250-1-jagan@amarulasolutions.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the rocktech,rk070er9427 panel bindings to DT schema.

Also, drop the description from legacy .txt since the yaml DT schema
of panel-common.yaml already have that information.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../display/panel/rocktech,rk070er9427.txt    | 25 -------------
 .../display/panel/rocktech,rk070er9427.yaml   | 37 +++++++++++++++++++
 2 files changed, 37 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.txt b/Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.txt
deleted file mode 100644
index eb1fb9f8d1f4..000000000000
--- a/Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
-
-Required properties:
-- compatible: should be "rocktech,rk070er9427"
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Optional nodes:
-- Video port for LCD panel input.
-
-Example:
-	panel {
-		compatible = "rocktech,rk070er9427";
-		backlight = <&backlight_lcd>;
-
-		port {
-			lcd_panel_in: endpoint {
-				remote-endpoint = <&lcd_display_out>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.yaml
new file mode 100644
index 000000000000..ac5aebfa4adc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,rk070er9427.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR X11)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/rocktech,rk070er9427.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rocktech Display Ltd. RK070ER9427 800(RGB)x480 TFT LCD panel
+
+maintainers:
+  - Jagan Teki <jagan@amarulasolutions.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Sam Ravnborg <sam@ravnborg.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: rocktech,rk070er9427
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    panel {
+            compatible = "rocktech,rk070er9427";
+            backlight = <&backlight_lcd>;
+
+            port {
+                    lcd_panel_in: endpoint {
+                            remote-endpoint = <&lcd_display_out>;
+                    };
+            };
+    };
-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
