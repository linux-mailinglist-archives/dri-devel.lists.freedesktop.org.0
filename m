Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5BB5453EF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 20:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB5D12B654;
	Thu,  9 Jun 2022 18:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A86B12B654
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 18:17:48 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id e11so21755546pfj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 11:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hU6Im3vb1keVHVlY7TcHchEc2Qgf7bjh4PzS2LAsp0g=;
 b=UptN1Jr96I8pLOyRcmzeta9p2WveOwoPhhXgeRA7kM9cI69tEGxnQCJAtBRXxvWhlo
 Rn+Zv7iVzfdyTpBslG9yo/0iXXDJuo5vIHo5/6V0jyzg5tKmcFOEjk9i67KRqMQfc6wx
 mKFigbgfsH0ZXEoxgFBmfHafg8B4ipYc1phjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hU6Im3vb1keVHVlY7TcHchEc2Qgf7bjh4PzS2LAsp0g=;
 b=6uRJM8zkFjh3knnSwZVBCR2yRpLcrpNrUmfddhvUGc3RsA98Pse1pNtaMV66x2dFxI
 SoEnQbj+BvkChu3g+ervlkMbXF2HgRHtivmKZSS1yJndSh9yzLZVCnkOR42CJD5adqdD
 8wL4nCvnXIPUvbJa2ppMrFrGEyI0T29P7G5AevVOmj0wPFfd1bFqjXeY/lS0vqGmJgkK
 Sh0MydorQga9WXbmlNIR44usQCbp0Qkz0oLIDIdY1YbFUPjci8CQg0Q2SRtVWUJYoIVF
 04iq4UamohYZeTfN2HVbv/H9vBjD4kamV0qmBRoe1MuQveIu48k66zvIJMw1vdX2y7QF
 S04A==
X-Gm-Message-State: AOAM533nFxbcZB2oEb7mUFtspYXtoxXTg26h8vNm5XPkuqbjDx02i+y+
 RyL9/bHUVW46pbCfSrknkQ78tg==
X-Google-Smtp-Source: ABdhPJz2vJgUxsLAZYPstcdskHIS7FJzu4/qiYfO60Xj6S8dALbWGNZF34CISl4QlQBx7EQS+mZUBg==
X-Received: by 2002:a05:6a00:10cc:b0:506:e0:d6c3 with SMTP id
 d12-20020a056a0010cc00b0050600e0d6c3mr41488331pfu.33.1654798668551; 
 Thu, 09 Jun 2022 11:17:48 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a63ec4e000000b003fb0354c43asm17728049pgj.32.2022.06.09.11.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 11:17:48 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
 support
Date: Thu,  9 Jun 2022 18:09:43 +0000
Message-Id: <20220609181106.3695103-5-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220609181106.3695103-1-pmalani@chromium.org>
References: <20220609181106.3695103-1-pmalani@chromium.org>
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
 Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 swboyd@chromium.org, Pin-Yen Lin <treapking@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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

