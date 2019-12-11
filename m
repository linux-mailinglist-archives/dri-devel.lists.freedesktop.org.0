Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C8211A6CC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49136EAB6;
	Wed, 11 Dec 2019 09:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E66B6E9C6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 06:19:54 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id d199so1248328pfd.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5SzZg/Any9b15PYJNx4TC/3Ha5cPQwIvnngJiL/O6D4=;
 b=F9nIloV3mkfv1BWp4npou4P6BtwgDkiffAbTsdiUkTmBcHM/KBFN58cVt+AMC4V8xS
 EAtttKKXOtsz9hji7eGv+2L61RmSt+L/GOvR0AmDuMjRiqHdL24NpwSqf5AKFEBLj9mL
 j/glY6I+kVN+ezQ23A2VtUe6jlGtYhFQjGA+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5SzZg/Any9b15PYJNx4TC/3Ha5cPQwIvnngJiL/O6D4=;
 b=KwIiOkGbN8aonXTyHoDH2Oc9/nyuewFT5k8YawMXnkd4OA0q2fFJbMU+pt/bEZXixj
 7a1EmOIwPw5+WxB5b3RQh2azuq9AeCz0+INOdW96NgBhx0+6rYaDfBKluf4Cz3kEEs9h
 eMzVG/ARDGL7hG5/K+iHtiAejjkZa5ELbUw2ZxayhZaWEJSD0JI6iGZ/c83A6DO0oxlH
 9cs/LXs6hjlhfZnKhX76S4r+JOeZYcp6WfCdKHt7hrOFEXEH3NIUtHj7QDXbyoOLaD1Z
 cEq3nSP7TQWpU9paT9Eapt9iDzifJz4v17jKFWLHF6NWQCUKMCRzgitwKpZ5taRLcY2M
 BMkQ==
X-Gm-Message-State: APjAAAV3muFsRQxix30HSgPk0Gs04oYybO0cy8NQ8gat8DGcLIpXSSbz
 XvFVkUqkTjhPeYZvE/Do44PNnA3WSvL84w==
X-Google-Smtp-Source: APXvYqwq5ql9gkBVGJtQCkgVSEUeNJ/97XFaS3CTKAxAX61qj+67JfQL5hpgXLD4RlP2wt4YbE8eUQ==
X-Received: by 2002:a63:220b:: with SMTP id i11mr2311164pgi.50.1576045193287; 
 Tue, 10 Dec 2019 22:19:53 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id h5sm1225579pfk.30.2019.12.10.22.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 22:19:52 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 3/4] dt-bindings: drm/bridge: Add GPIO display mux
 binding
Date: Wed, 11 Dec 2019 14:19:10 +0800
Message-Id: <20191211061911.238393-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
In-Reply-To: <20191211061911.238393-1-hsinyi@chromium.org>
References: <20191211061911.238393-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicolas Boichat <drinkcat@chromium.org>

Add bindings for Generic GPIO mux driver.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Change from RFC to v1:
- txt to yaml
---
 .../bindings/display/bridge/gpio-mux.yaml     | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
new file mode 100644
index 000000000000..cef098749066
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/gpio-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic display mux (1 input, 2 outputs)
+
+maintainers:
+  - Nicolas Boichat <drinkcat@chromium.org>
+
+description: |
+  This bindings describes a simple display (e.g. HDMI) mux, that has 1
+  input, and 2 outputs. The mux status is controlled by hardware, and
+  its status is read back using a GPIO.
+
+properties:
+  compatible:
+    const: gpio-display-mux
+
+  detect-gpios:
+    maxItems: 1
+    description: GPIO that indicates the active output
+
+  ports:
+    type: object
+
+    properties:
+      port@0:
+        type: object
+        description: |
+          Video port for input.
+
+      port@1:
+        type: object
+        description: |
+          2 video ports for output.
+          The reg value in the endpoints matches the GPIO status: when
+          GPIO is asserted, endpoint with reg value <1> is selected.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - detect-gpios
+  - ports
+
+examples:
+  - |
+    hdmi_mux: hdmi_mux {
+      compatible = "gpio-display-mux";
+      status = "okay";
+      detect-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&hdmi_mux_pins>;
+      ddc-i2c-bus = <&hdmiddc0>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 { /* input */
+          reg = <0>;
+
+          hdmi_mux_in: endpoint {
+            remote-endpoint = <&hdmi0_out>;
+          };
+        };
+
+        port@1 { /* output */
+          reg = <1>;
+
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          hdmi_mux_out_anx: endpoint@0 {
+            reg = <0>;
+            remote-endpoint = <&anx7688_in>;
+          };
+
+          hdmi_mux_out_hdmi: endpoint@1 {
+            reg = <1>;
+            remote-endpoint = <&hdmi_connector_in>;
+          };
+        };
+      };
+    };
-- 
2.24.0.525.g8f36a354ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
