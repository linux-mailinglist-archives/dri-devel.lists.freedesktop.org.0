Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C87C54BAC9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 21:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2613F112C9C;
	Tue, 14 Jun 2022 19:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2086112C9C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 19:42:38 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 y13-20020a17090a154d00b001eaaa3b9b8dso7149469pja.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 12:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ZJFZpaUYvLKyNF9q+LY72zbgzs/nGyR/EwoxYaYQ1M=;
 b=NmuP2Skdd5n3bGLCNoER1Bcoij3SJxX/7ftaF2q12rYMoal3MZgBSsHGVLdGjuEQAk
 /TXsLNHVehRshc+JIy8NXlnK8wctd8uYo7/eup1XrczVTQbbRb6QVPbYOX1Gp+TIZrp7
 U5GlS7NtpdzLWTESA9UQ/RiHnsYC9gCeJiXis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ZJFZpaUYvLKyNF9q+LY72zbgzs/nGyR/EwoxYaYQ1M=;
 b=y4MciyaNh8ErFVq0oTrc6EnMAGF9MnN6QOfLnQQXgrg4xqBnoANyvJocgCy6RFBUn7
 sBFpHcLB9vPi1hkiRvj8xajY6vvlRSmBbLtFsrpsMqqtxtuu5hayB1uaTmtSzit5XcN5
 hMEjSFRFl51TTM3pUKUMw9KGFJRgvbxzqlWce9BtWnhVMNw/5Nc9iFzi4RrgiPMcDot/
 TAChTi4EZpqIQNou+VFuD1cKVBh/oQYQkY0A25eSg701w1sxOvYAUHboRMMpAkPlJfMr
 fEzDnb1BvYxXldbTGsqMRfe94LLLb59WkIk2VwN8oGURw8ddImDvbM/fRp+gLVjPYecP
 6L3Q==
X-Gm-Message-State: AJIora/gFyetsamT6AvPEIEiRyJEnmwzQc10ZdOkFulZabj6KnA3GcZm
 VBeoTlVArOj3EIrByD60Z41geg==
X-Google-Smtp-Source: AGRyM1t/o/wb2VbxM3MoZhym1+ZRjJ5p6nx1fVnXuS2wmx6yNAHsevoLdCilrD9eNpTSPGjijydqVA==
X-Received: by 2002:a17:90b:4a92:b0:1e8:2ba1:64bf with SMTP id
 lp18-20020a17090b4a9200b001e82ba164bfmr6118811pjb.41.1655235758368; 
 Tue, 14 Jun 2022 12:42:38 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a17090a409500b001df3a251cc2sm10014426pjg.4.2022.06.14.12.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 12:42:37 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
 support
Date: Tue, 14 Jun 2022 19:34:38 +0000
Message-Id: <20220614193558.1163205-5-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220614193558.1163205-1-pmalani@chromium.org>
References: <20220614193558.1163205-1-pmalani@chromium.org>
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

Analogix 7625 can be used in systems to switch USB Type-C DisplayPort
alternate mode lane traffic between 2 Type-C ports.

Update the binding to accommodate this usage by introducing a switch
property.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v2:
- Added Reviewed-by and Tested-by tags.

Changes since v1:
- Introduced patternProperties for "switch" children (suggested by Krzysztof Kozlowski).
- Added unevaluatedProperties descriptor (suggested by Krzysztof Kozlowski).
- Added "address-cells" and "size-cells" properties to "switches".

 .../display/bridge/analogix,anx7625.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 35a48515836e..cb4a23391244 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -105,6 +105,33 @@ properties:
       - port@0
       - port@1
 
+  switches:
+    type: object
+    description: Set of switches controlling DisplayPort traffic on
+      outgoing RX/TX lanes to Type C ports.
+    unevaluatedProperties: false
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      'switch@[01]':
+        $ref: /schemas/usb/typec-switch.yaml#
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
   - reg
@@ -167,5 +194,41 @@ examples:
                     };
                 };
             };
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
+                            anx_typec0: endpoint {
+                                remote-endpoint = <&typec_port0>;
+                            };
+                        };
+                    };
+                };
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
+                            anx_typec1: endpoint {
+                                remote-endpoint = <&typec_port1>;
+                            };
+                        };
+                    };
+                };
+            };
         };
     };
-- 
2.36.1.476.g0c4daa206d-goog

