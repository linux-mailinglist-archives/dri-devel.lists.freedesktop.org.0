Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7BE54CFB2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 19:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0075D1126FC;
	Wed, 15 Jun 2022 17:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308F21126FC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 17:25:26 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id u37so3623504pfg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n+O4l98CKUL7yv4rRVYlrIx5OvopY+8TSKj5Ikkq3GM=;
 b=gghcg5nU3xACsIsovR9FpypGdUvez5exCrXgZBOdo7LpwjPJv4H/xILX5Hh5GSy5Vr
 l8kPxW9GmVc8Ue3y7TtcIORtJWI+zjA9PJn1NSCuqpbQulo3RUP2z0+bPiSRi3JDw73y
 nnGGTMuH1knVYujxOboX7OYG0H0m+9TaUpjcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n+O4l98CKUL7yv4rRVYlrIx5OvopY+8TSKj5Ikkq3GM=;
 b=O53iAY09D/C2AMkARRlzAK0G9xtIaznWXuEUM4L+nWcUdD3jSZtG9Jul84b6MlIAFj
 gI5VSKU4YHgdX/FE+puA3z4Cvb1zPJMSbYQ9Zlo78dlt+byM7dJdLKUzfOhZq7L4Fy46
 bM3EKB6bTu8AmK0/4X1QEoupcOxQxtx8IcTIButKEPj8TpNF3aS7fdvbK++gxqqrm/Dq
 FHsNfcRfHSRf4TqVYmfIInDdxwKJN/KiTNKBW/x59zBV0oo1hF1+d/jaO/GVWCJq08fd
 M5jUWhY+d8ryBgh+3+uIQIBHYhPYA0RnT5HFcyjZESxFVh5wYJ5adzNGirqOK9VRGf/5
 vDhQ==
X-Gm-Message-State: AJIora+DPv4BwrQ3YyhGH2z2bbkualtC+IkkBD6uetz8xBfNE/96Y4is
 UI24vlDHYRAmypeBO/J7RsPD6Q==
X-Google-Smtp-Source: AGRyM1tGCvTtzArk3W0yqf67r0nmmu/yAlWJ8zSXcnyuv01jrd8kkfDlmi9jTJeyYPFVjrKXkwE8LA==
X-Received: by 2002:a63:ff19:0:b0:403:7c60:ae96 with SMTP id
 k25-20020a63ff19000000b004037c60ae96mr725428pgi.466.1655313925709; 
 Wed, 15 Jun 2022 10:25:25 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7814a000000b005103abd2fdbsm10147433pfn.206.2022.06.15.10.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 10:25:24 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 3/7] dt-bindings: usb: Add Type-C switch binding
Date: Wed, 15 Jun 2022 17:20:19 +0000
Message-Id: <20220615172129.1314056-4-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220615172129.1314056-1-pmalani@chromium.org>
References: <20220615172129.1314056-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 swboyd@chromium.org, Pin-Yen Lin <treapking@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>, Prashant Malani <pmalani@chromium.org>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce a binding which represents a component that can control the
routing of USB Type-C data lines as well as address data line
orientation (based on CC lines' orientation).

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v3:
- No changes.

Changes since v2:
- Added Reviewed-by and Tested-by tags.

Changes since v1:
- Removed "items" from compatible.
- Fixed indentation in example.

 .../devicetree/bindings/usb/typec-switch.yaml | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.yaml

diff --git a/Documentation/devicetree/bindings/usb/typec-switch.yaml b/Documentation/devicetree/bindings/usb/typec-switch.yaml
new file mode 100644
index 000000000000..78b0190c8543
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/typec-switch.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/typec-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: USB Type-C Switch
+
+maintainers:
+  - Prashant Malani <pmalani@chromium.org>
+
+description:
+  A USB Type-C switch represents a component which routes USB Type-C data
+  lines to various protocol host controllers (e.g USB, VESA DisplayPort,
+  Thunderbolt etc.) depending on which mode the Type-C port, port partner
+  and cable are operating in. It can also modify lane routing based on
+  the orientation of a connected Type-C peripheral.
+
+properties:
+  compatible:
+    const: typec-switch
+
+  mode-switch:
+    type: boolean
+    description: Specify that this switch can handle alternate mode switching.
+
+  orientation-switch:
+    type: boolean
+    description: Specify that this switch can handle orientation switching.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: OF graph binding modelling data lines to the Type-C switch.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Link between the switch and a Type-C connector.
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - ports
+
+anyOf:
+  - required:
+      - mode-switch
+  - required:
+      - orientation-switch
+
+additionalProperties: true
+
+examples:
+  - |
+    drm-bridge {
+        usb-switch {
+            compatible = "typec-switch";
+            mode-switch;
+            orientation-switch;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    anx_ep: endpoint {
+                        remote-endpoint = <&typec_controller>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.36.1.476.g0c4daa206d-goog

