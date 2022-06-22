Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFDC5552B3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 19:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7950810E03D;
	Wed, 22 Jun 2022 17:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9370410E03D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 17:44:23 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id o18so8940641plg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 10:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OYDYAsce/lvf/QfGm3jCkG+AP6MQ1L8nhfe2kq87L58=;
 b=RaJ3sON5zAZxk49VCqlnWjZ6D/CiNIfYanugUfOUgXy47wCRqi8FawzM30EIoAuqQr
 Trnk685D9hf5f1zQVJSkepSnxFReFzXW7Rhj72iUpjjAwpYWLeuKvohYlKrK9PfXj8pP
 f/22wwHIgwY2IfA9Iw6qFGZMoj3u7M+NaI6/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OYDYAsce/lvf/QfGm3jCkG+AP6MQ1L8nhfe2kq87L58=;
 b=zfANdqosXYWrM2q3RD39z8qDXrbl38VU+/WD1ofRMcX2BXXhD2wo25zelzpFVbeIol
 vBR+oNrY6KL8svryclf6HUHbKN3nixq2nyMAM6vi+6YE8OYeefhROt3IYmb/BhY7iOut
 69kwBj9NMg6OnLxfxl90tQqrbcOBkHd+QQXjQK1pDG9wToFUHhoJApYhimyhj6lEI4g4
 FV49iyzvMIJe6xxqVlha92RUg6E0o3vVeHCSJ48WGCWk2O0rnMflGY9cOYdms2W5yCDg
 txfzGy4Va6bWlqKcTg1PUfWIm6IziArsCnIn/DcuKdHTDqY6q8X6bK7XokLrUxrEgFp7
 +xUQ==
X-Gm-Message-State: AJIora8uc7NkG50KLhaDFQwBNm4SB0NgaoJ9BvYOfxqPu3G+YAlxwcdf
 Qe0S85HHO5hqtxdG7rCtFvsJCA==
X-Google-Smtp-Source: AGRyM1ty31aam1ZaSwmYgBtv3dtTfaMuAS4USae3mq7FEmOSNketiQDrk6OZDlI6edoaR+3QgyKZww==
X-Received: by 2002:a17:90b:314b:b0:1e3:1033:f555 with SMTP id
 ip11-20020a17090b314b00b001e31033f555mr50517081pjb.245.1655919863147; 
 Wed, 22 Jun 2022 10:44:23 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a17090b079100b001ece55aec38sm35470pjz.30.2022.06.22.10.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 10:44:22 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 6/9] dt/bindings: drm/bridge: it6505: Add mode-switch
 support
Date: Wed, 22 Jun 2022 17:34:35 +0000
Message-Id: <20220622173605.1168416-7-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
In-Reply-To: <20220622173605.1168416-1-pmalani@chromium.org>
References: <20220622173605.1168416-1-pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 Allen Chen <allen.chen@ite.com.tw>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>, Prashant Malani <pmalani@chromium.org>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pin-Yen Lin <treapking@chromium.org>

ITE IT6505 can be used in systems to switch USB Type-C DisplayPort
alternate mode lane traffic between 2 Type-C ports.

Update the binding to accommodate this usage by introducing a switch
property.

Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

v5 is the first version for this patch.

 .../bindings/display/bridge/ite,it6505.yaml   | 97 ++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
index 833d11b2303a..86bb6dc5ae6f 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
@@ -56,13 +56,46 @@ properties:
     $ref: /schemas/graph.yaml#/properties/port
     description: A port node pointing to DPI host port node
 
+  switches:
+    type: object
+    description: Set of switches controlling DisplayPort traffic on
+      outgoing RX/TX lanes to Type C ports.
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^switch@[01]$':
+        $ref: /schemas/usb/typec-switch.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            maxItems: 1
+
+        required:
+          - reg
+
+    required:
+      - switch@0
+
 required:
   - compatible
   - ovdd-supply
   - pwr18-supply
   - interrupts
   - reset-gpios
-  - extcon
+
+oneOf:
+  - required:
+      - extcon
+  - required:
+      - switches
 
 additionalProperties: false
 
@@ -92,3 +125,65 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c3 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        it6505dptx: it6505dptx@5c {
+            compatible = "ite,it6505";
+            interrupts = <8 IRQ_TYPE_LEVEL_LOW 8 0>;
+            reg = <0x5c>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&it6505_pins>;
+            ovdd-supply = <&mt6366_vsim2_reg>;
+            pwr18-supply = <&pp1800_dpbrdg_dx>;
+            reset-gpios = <&pio 177 0>;
+
+            port {
+                it6505_dp_in: endpoint {
+                    remote-endpoint = <&dpi_out>;
+                };
+            };
+
+            switches {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                switch@0 {
+                    compatible = "typec-switch";
+                    reg = <0>;
+                    mode-switch;
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+                        port@0 {
+                            reg = <0>;
+                            ite_typec0: endpoint {
+                                remote-endpoint = <&typec_port0>;
+                            };
+                        };
+                    };
+                };
+
+                switch@1 {
+                    compatible = "typec-switch";
+                    reg = <1>;
+                    mode-switch;
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+                        port@0 {
+                            reg = <0>;
+                            ite_typec1: endpoint {
+                                remote-endpoint = <&typec_port1>;
+                            };
+                        };
+                    };
+                };
+            };
+        };
+    };
-- 
2.37.0.rc0.104.g0611611a94-goog

