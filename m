Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F7712FC9A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2020 19:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EF96E320;
	Fri,  3 Jan 2020 18:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD19F6E320
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 18:32:42 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id x184so23887615pfb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 10:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WICDo2yLVbawePfe3ygrB2v/7fHzbgU3dR2J9o17Eio=;
 b=LWyzuVPk/Tl3xG5lk+yqRkzMQ3QrWvfrlb1/Why5YnYfiNnL3r+OPJMIitIrADl1QX
 NAEGHGw6ZP8yedOCzBxqToLPFXAdxbUZr1lANZYjDpkcUY1T1i4mOe7BNXcmLgkhQXhn
 861CsEjz/GiyBwISX8f9W4pZAY8r2p3Us6IP6n86nEZ6iqolQHKwTBbTTQz4x6iF1l+A
 Jl9t1NFb7tBkwRi5a1nk3RnpqZbtBcUnwPCl8XRNYC/bENlQP5YAdH4r0VZjrLaRI16W
 DKISds2yaZgPJtn/ZKCSsE0k6CVt+KLujxlOMwBm4Btsw2pk15T/kOgJ2IcDS9TpDzoz
 P8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WICDo2yLVbawePfe3ygrB2v/7fHzbgU3dR2J9o17Eio=;
 b=dBmenBk7n1g1fMvLEX5t47ftlGSwUt5MnaUzFolmGI977t+/yjy+Di3AqMzR3xJ9/6
 s5N8bYm35Cxug7UyUtTPG+lHcqKRbDkHADvZPTLzYbWZOiGaPIuMsV/62hZc+JGI3s2v
 b0EhXCe7Rykmn3m+mpxA5fYDKrOIuj14kYezHG/4Z/uVvlWD6CXe7mOg1zM0QTu0DVG8
 nzVrSPyxUgCyG4Rh/+UkfVLgnef0fJhPWbghR/z0f5Mvf0hobUrj4mHei2KN1EfHzz/W
 5AD+NDIV2hC9NBFNgs+TjFsz47asNQU6Am//4s/77WIqgHghA9VqZM8OiE/uXr5zDrZX
 qjwQ==
X-Gm-Message-State: APjAAAVhyFOSb7Zpyh5nsN9FwA/4Af/GdT1tyxnkqqoknft8NKdVZYLu
 +akNWLG6B+zNAoqXyesUva7txB2IQk0=
X-Google-Smtp-Source: APXvYqyRZRtK5dOUg2fH7/BI27kEXbjxzAGcfihQbA6hlrebKhbLBvHLy1v4GvKfnsltfdXhyecewA==
X-Received: by 2002:a65:578e:: with SMTP id b14mr97955738pgr.444.1578076361952; 
 Fri, 03 Jan 2020 10:32:41 -0800 (PST)
Received: from localhost ([100.118.89.215])
 by smtp.gmail.com with ESMTPSA id s130sm62693732pgc.82.2020.01.03.10.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 10:32:41 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: display: panel: Add AUO B116XAK01 panel
 bindings
Date: Fri,  3 Jan 2020 10:30:23 -0800
Message-Id: <20200103183025.569201-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Rob Clark <robdclark@chromium.org>, Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 .../bindings/display/panel/auo,b116xa01.yaml  | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,b116xa01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/auo,b116xa01.yaml b/Documentation/devicetree/bindings/display/panel/auo,b116xa01.yaml
new file mode 100644
index 000000000000..6cb8ed9b2c0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/auo,b116xa01.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/auo,b116xa01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AUO B116XAK01 eDP TFT LCD Panel
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - auo,b116xa01
+  port: true
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    panel {
+        compatible = "auo,b116xa01";
+        port {
+            panel_in: endpoint {
+                remote-endpoint = <&edp_out>;
+            };
+        };
+    };
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
