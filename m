Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF0D6C4818
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 11:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3A210E90E;
	Wed, 22 Mar 2023 10:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312AF10E90B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 10:47:33 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id ix20so18883545plb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 03:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679482053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8yfn2DmllskdKP/oOcQ9B405UmJOgHc+y1qZoocZy8=;
 b=O5uKHQ9H+aO2fBv01xe8xdY7oBrreI5ewWbZElSXkWxkPzP2xScs0UAJKKrtPXCVg6
 ZQ37l5vdd9fC5HuJgYpgMWtf4riT6buEa2xmSPyxgCnQhVMFSFKZpx8FbzokLNjyLWPu
 +BCIGjv6+iRWIL/JaBAHVsuEQ+3TT/bJS6s94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679482053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/8yfn2DmllskdKP/oOcQ9B405UmJOgHc+y1qZoocZy8=;
 b=Jc/RtZqdEabgtsjak8isl+WRcGl1/gFtSmr6VRLQWRb7+wuhFM+ZPD5K4Bvajmx0Na
 4NThaUO3w1EOuMw8FsY77nEYGYJcC/IkRrht5OKvTkspVGFyytms2+1Dw3LbnZ6DcDHU
 DO9jrRwslKAZAjUN5KLcvbRNcKGWMTjUQmFnokKQkfjZxQth8ICkIcSlzbqwvOFWWgvA
 3Uk/9cSW3sf+46aEUvTenT/k94biAws/Mho4RGwpLjcgmDwUAGSbwuG97/9qA0zVMb6r
 OeRmnwH8aLbCmP7qFhYUM4I1agBC9D6E1uteEN6YMbWShDg62OEVsPYsHyCTF7yHA2SZ
 A7Wg==
X-Gm-Message-State: AO0yUKVZ8Ssbfby6Cr1oe281twgkyc1rZq7JmQfhvvKZmJSPXjuQIoDb
 MTUBlbssb/zq9Ft4w7OH1BLCQA==
X-Google-Smtp-Source: AK7set/q0g0SgD5KxrTZbJCzBXxFDUxW3Rn/n92NryRdOtXJ6of3S1G0Y/QuG1AwOgmH0nrMVCMriw==
X-Received: by 2002:a17:90a:bc85:b0:23f:d7ea:6212 with SMTP id
 x5-20020a17090abc8500b0023fd7ea6212mr2746126pjr.38.1679482052774; 
 Wed, 22 Mar 2023 03:47:32 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:343d:79bf:55f9:1da5])
 by smtp.gmail.com with ESMTPSA id
 hg4-20020a17090b300400b002340d317f3esm9508742pjb.52.2023.03.22.03.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 03:47:32 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v14 08/10] dt-bindings: display: bridge: it6505: Add
 mode-switch support
Date: Wed, 22 Mar 2023 18:46:37 +0800
Message-Id: <20230322104639.221402-9-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322104639.221402-1-treapking@chromium.org>
References: <20230322104639.221402-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Pin-yen Lin <treapking@chromium.org>,
 Allen Chen <allen.chen@ite.com.tw>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ITE IT6505 can be used in systems to switch the DP traffic between
two downstreams, which can be USB Type-C DisplayPort alternate mode
lane or regular DisplayPort output ports.

Update the binding to accommodate this usage by introducing a
data-lanes and a mode-switch property on endpoints.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

(no changes since v12)

Changes in v12:
- Fixed the schema of "data-lanes" property for it6505
- Reworded the description of the mode-switch property

Changes in v11:
- Updated the description of the endpoints in the bindings
- Referenced video-interfaces.yaml instead for the endpoints binding
- Removed duplicated definitions from inherited schema

Changes in v9:
- Fixed subject prefix again
- Changed the naming of the example node for it6505

Changes in v8:
- Updated bindings for data-lanes property
- Fixed subject prefix

Changes in v7:
- Fixed issues reported by dt_binding_check.
- Updated the schema and the example dts for data-lanes.
- Changed to generic naming for the example dts node.

Changes in v6:
- Remove switches node and use endpoints and data-lanes property to
  describe the connections.

 .../bindings/display/bridge/ite,it6505.yaml   | 101 +++++++++++++++---
 1 file changed, 88 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
index c9a882ee6d98..348b02f26041 100644
--- a/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
@@ -75,22 +75,49 @@ properties:
       port@1:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: Video port for DP output
+        description:
+          Video port for DP output. Each endpoint connects to a video output
+          downstream, and the "data-lanes" property is used to describe the pin
+          connections. 0, 1, 2, 3 in "data-lanes" maps to TX0, TX1, TX2, TX3,
+          respectively.
 
-        properties:
-          endpoint:
-            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+
+        patternProperties:
+          "^endpoint@[01]$":
+            $ref: /schemas/media/video-interfaces.yaml#
             unevaluatedProperties: false
 
             properties:
+              reg: true
+
+              remote-endpoint: true
+
               data-lanes:
-                minItems: 1
-                uniqueItems: true
-                items:
-                  - enum: [ 0, 1 ]
-                  - const: 1
-                  - const: 2
-                  - const: 3
+                oneOf:
+                  - items:
+                      - enum: [0, 3]
+
+                  - items:
+                      - const: 0
+                      - const: 1
+
+                  - items:
+                      - const: 3
+                      - const: 2
+
+                  - items:
+                      - const: 0
+                      - const: 1
+                      - const: 2
+                      - const: 3
+
+              mode-switch:
+                type: boolean
+                description: Serves as Type-C mode switch if present.
+
+            required:
+              - reg
+              - remote-endpoint
 
     required:
       - port@0
@@ -102,7 +129,6 @@ required:
   - pwr18-supply
   - interrupts
   - reset-gpios
-  - extcon
   - ports
 
 additionalProperties: false
@@ -139,8 +165,11 @@ examples:
                 };
 
                 port@1 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
                     reg = <1>;
-                    it6505_out: endpoint {
+                    it6505_out: endpoint@0 {
+                        reg = <0>;
                         remote-endpoint = <&dp_in>;
                         data-lanes = <0 1>;
                     };
@@ -148,3 +177,49 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dp-bridge@5c {
+            compatible = "ite,it6505";
+            interrupts = <8 IRQ_TYPE_LEVEL_LOW 8 0>;
+            reg = <0x5c>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&it6505_pins>;
+            ovdd-supply = <&mt6366_vsim2_reg>;
+            pwr18-supply = <&pp1800_dpbrdg_dx>;
+            reset-gpios = <&pio 177 0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    it6505_dpi_in: endpoint {
+                        remote-endpoint = <&dpi_out>;
+                    };
+                };
+                port@1 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <1>;
+                    ite_typec0: endpoint@0 {
+                        reg = <0>;
+                        mode-switch;
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&typec_port0>;
+                    };
+                    ite_typec1: endpoint@1 {
+                        reg = <1>;
+                        mode-switch;
+                        data-lanes = <3 2>;
+                        remote-endpoint = <&typec_port1>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.40.0.rc1.284.g88254d51c5-goog

