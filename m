Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8446A997C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF3310E623;
	Fri,  3 Mar 2023 14:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C7310E622
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 14:34:22 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id z2so2805818plf.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 06:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1677854062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PNqMvcSR7fV+nG4ZpLQQUo4Z8GgUt8riFBleH8/sH1g=;
 b=nWCY+/r+PntjVztOGkJni/Ez3spDswwLiOFy1qRlJrK83UNi106FOIFCL1li20iWty
 sa1izZWEFHMZvo8002X0asfckemO5ECxdEfk9nNP4WMyneD1BTHUw6X9Yol7M4gZsJyb
 EPAGGlg8Mj1ZICR8ALvx2fyf4FL33lMcdrMYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677854062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PNqMvcSR7fV+nG4ZpLQQUo4Z8GgUt8riFBleH8/sH1g=;
 b=wOH4z/P/fPh8xjAG5QdR3P7i0iBaOjchedHiyfhrZUqk4uqSSjscTqnZW25LJ4ucJt
 EtISG/5wdxT4/3DuFagBChQbwfQw2iee89+nUzzjS7lj1+GKMX8X/OLX1zBmLMA1KZqh
 MQm+vQFYl/3E6WUzbD9yhSm3X3/x3TBa47astXB6yYZ8pXtndZ6fVLTwLHzSwnCBxFaU
 2E8jm9lWk2xkxbsyYhIkbTPOIdWLiSkxKi37MZ4dm86bHgESgkKyaQ3O3Vd6X7WluDZI
 70tnhYswej0Mha6Jk0gkHxCVJdNSY+NzClogewaBoOoS4i16pjOVOrEVxA3yh+l5fcsk
 Buww==
X-Gm-Message-State: AO0yUKWsaR57++63pNLuGiy31GWN5qkAqKxf0v4bdrQ3RMKl/Me0xQZC
 /8BVqXiDeDk4FW7D2PVkaDBj7A==
X-Google-Smtp-Source: AK7set9oFzLH3hNjbl5lfcSdc9akwuwCWoaFqmzxW4YbUPSiVYr94sjMS2KS1hXyfXLc/Uk/s24Rnw==
X-Received: by 2002:a05:6a20:918a:b0:c7:249:cd8c with SMTP id
 v10-20020a056a20918a00b000c70249cd8cmr2040436pzd.5.1677854062290; 
 Fri, 03 Mar 2023 06:34:22 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:55e5:8423:31ee:83dd])
 by smtp.gmail.com with ESMTPSA id
 c18-20020aa781d2000000b005a8b4dcd21asm1767214pfn.15.2023.03.03.06.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 06:34:22 -0800 (PST)
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
Subject: [PATCH v13 04/10] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
Date: Fri,  3 Mar 2023 22:33:44 +0800
Message-Id: <20230303143350.815623-5-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
In-Reply-To: <20230303143350.815623-1-treapking@chromium.org>
References: <20230303143350.815623-1-treapking@chromium.org>
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
 linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, devicetree@vger.kernel.org,
 Allen Chen <allen.chen@ite.com.tw>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Pin-yen Lin <treapking@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Analogix 7625 can be used in systems to switch the DP traffic between
two downstreams, which can be USB Type-C DisplayPort alternate mode
lane or regular DisplayPort output ports.

Update the binding to accommodate this usage by introducing a
data-lanes and a mode-switch property on endpoints.

Also include the link to the product brief in the bindings.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---

(no changes since v12)

Changes in v12:
- Removed the 4-lane binding in analogix,anx7625.yaml
- Reworded the description for the mode-switch property

Changes in v11:
- Updated the description of the endpoints
- Referenced video-interfaces.yaml instead for the endpoints

Changes in v10:
- Collected Reviewed-by and Tested-by tags

Changes in v9:
- Collected Reviewed-by tag

Changes in v8:
- Updated anx7625 bindings for data-lane property
- Fixed the subject prefix

Changes in v7:
- Fixed issues reported by dt_binding_check
- Updated the schema and the example dts for data-lanes.
- Changed to generic naming for the example dts node.

Changes in v6:
- Remove switches node and use endpoints and data-lanes property to
  describe the connections.

 .../display/bridge/analogix,anx7625.yaml      | 88 ++++++++++++++++++-
 1 file changed, 85 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 4590186c4a0b..a50de536cffd 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -12,7 +12,8 @@ maintainers:
 
 description: |
   The ANX7625 is an ultra-low power 4K Mobile HD Transmitter
-  designed for portable devices.
+  designed for portable devices. Product brief is available at
+  https://www.analogix.com/en/system/files/AA-002291-PB-6-ANX7625_ProductBrief.pdf
 
 properties:
   compatible:
@@ -112,9 +113,40 @@ properties:
               data-lanes: true
 
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
         description:
-          Video port for panel or connector.
+          Video port for panel or connector. Each endpoint connects to a video
+          output downstream, and the "data-lanes" property is used to describe
+          the pin connections. 0, 1, 2, 3 in "data-lanes" maps to SSRX1, SSTX1,
+          SSRX2, SSTX2, respectively.
+
+        patternProperties:
+          "^endpoint@[01]$":
+            $ref: /schemas/media/video-interfaces.yaml#
+            properties:
+              reg: true
+
+              remote-endpoint: true
+
+              data-lanes:
+                oneOf:
+                  - items:
+                      - enum: [0, 1, 2, 3]
+
+                  - items:
+                      - const: 0
+                      - const: 1
+
+                  - items:
+                      - const: 2
+                      - const: 3
+
+              mode-switch:
+                type: boolean
+                description: Serves as Type-C mode switch if present.
+
+            required:
+              - remote-endpoint
 
     required:
       - port@0
@@ -186,3 +218,53 @@ examples:
             };
         };
     };
+  - |
+    i2c3 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        encoder@58 {
+            compatible = "analogix,anx7625";
+            reg = <0x58>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&anx7625_dp_pins>;
+            enable-gpios = <&pio 176 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 177 GPIO_ACTIVE_HIGH>;
+            vdd10-supply = <&pp1100_dpbrdg>;
+            vdd18-supply = <&pp1800_dpbrdg_dx>;
+            vdd33-supply = <&pp3300_dpbrdg_dx>;
+            analogix,audio-enable;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    anx7625_dp_in: endpoint {
+                        bus-type = <7>;
+                        remote-endpoint = <&dpi_out>;
+                    };
+                };
+
+                port@1 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    reg = <1>;
+                    anx_typec0: endpoint@0 {
+                        reg = <0>;
+                        mode-switch;
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&typec_port0>;
+                    };
+                    anx_typec1: endpoint@1 {
+                        reg = <1>;
+                        mode-switch;
+                        data-lanes = <2 3>;
+                        remote-endpoint = <&typec_port1>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

