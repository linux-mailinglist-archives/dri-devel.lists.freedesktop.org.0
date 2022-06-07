Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24598540F67
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 21:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F162210F490;
	Tue,  7 Jun 2022 19:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598DC10F481
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:08:03 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id q18so15577988pln.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 12:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sFse0rFSlJ0YYavNaa4y03OPGbaMuJtoNAgCQ6a6W8c=;
 b=egqwCoKZqBXVLuKBc5pBZJMLx1Er/E5gqJBY0WIV+gpES8qbQTYV1aLLMoL19SXphc
 lK8Gh8uUsJd8XfsnR+jIcEghA1Fey7gwOw5VGvdRT3NcD8yrHBZpl106Q8KajEC6vdqb
 v4+28bPMXQbxefQML/1CAGdjIvco9R8BEzTQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sFse0rFSlJ0YYavNaa4y03OPGbaMuJtoNAgCQ6a6W8c=;
 b=uHQJTWUtoRQMvKjxNEGgjHCKF6SyAmaQ0/xla0G8EG8SN2qBMd4neNADbp5Co8jJHL
 p82AyBHvtVCjm7E1vjoYr24YrzXPomwrmHMFoGCW247UE/CLovBHuc2SOa+x2mHmPIL7
 29xjRTD/fZ5SPzXNRnt0KadxQocpSXNYH/1dLUpt++0Ze+yXO8JjIANwONDQZvgVtQPJ
 2QqoUHlHl6KhJiVgUV4XTv4BC8kglwyqWtdsDau8JeNyeEdGkPX6eTdY+ADIp5NHn8Qi
 0nTZkhex2tlomoDUWgNtrEx+0eF84T6U07jyQJCwU7PyV3YcRthgeZ8zI7yWLNT0ARyP
 E5TQ==
X-Gm-Message-State: AOAM533qLYeDTU70vaHfpSmpSHg8DlnRrEFWFmkqeI0mEv76wUEoHr6C
 mcKfsx6v6pmgFdMIYqsyGMWA7Q==
X-Google-Smtp-Source: ABdhPJxRnlpJtnHj8QUvVU0+Lwk4T4sd6PIecvJFEsj9C43AuOQ/lHFYgRv7vIv5lWTUWerChJvSkw==
X-Received: by 2002:a17:90b:224e:b0:1e6:8ae1:8e1a with SMTP id
 hk14-20020a17090b224e00b001e68ae18e1amr30682456pjb.59.1654628882986; 
 Tue, 07 Jun 2022 12:08:02 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 g29-20020aa79ddd000000b0050dc762819esm13236084pfq.120.2022.06.07.12.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 12:08:02 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch support
Date: Tue,  7 Jun 2022 19:00:22 +0000
Message-Id: <20220607190131.1647511-5-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607190131.1647511-1-pmalani@chromium.org>
References: <20220607190131.1647511-1-pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
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

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 .../display/bridge/analogix,anx7625.yaml      | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 35a48515836e..7e1f655ddfcc 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -105,6 +105,26 @@ properties:
       - port@0
       - port@1
 
+  switches:
+    type: object
+    description: Set of switches controlling DisplayPort traffic on
+      outgoing RX/TX lanes to Type C ports.
+
+    properties:
+      switch:
+        $ref: /schemas/usb/typec-switch.yaml#
+        maxItems: 2
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
@@ -167,5 +187,41 @@ examples:
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
+                              remote-endpoint = <&typec_port0>;
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
+                              remote-endpoint = <&typec_port1>;
+                            };
+                        };
+                    };
+                };
+            };
         };
     };
-- 
2.36.1.255.ge46751e96f-goog

