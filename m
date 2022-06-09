Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA395453E6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 20:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9748711BBD6;
	Thu,  9 Jun 2022 18:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A3F11AF4F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 18:16:31 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id n18so20883826plg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 11:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sovrs+mq8Q/Ap++aH+MjECZ+lkKpfvFBf2CG7NL+qc0=;
 b=ljGcCwBNKuZfCUmbieLH3JlrAHhYdwCrb3aqMfe+5IIZtxQfN9jCdjc0NtdfUhLwkG
 g4jThX8SzgLeCTdj/6FSiaxG7Zr2SjdYxJN7xzQSjkaK8P+iO3EZ2TDbyQ0UOgZYKQLW
 HrSCybyHiKNV1Iezy+bJuKEBFqYZAWykJrvoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sovrs+mq8Q/Ap++aH+MjECZ+lkKpfvFBf2CG7NL+qc0=;
 b=G5DkbbkHQ4IGMCNqvp/7/KChbPC066JtEPdzysUptPih3Xf8ELtdj6Ee6bfHe1rY+V
 AzlQWGjiZX8bhMNxpaieOqea+clKt8yqxqNFkqCXDl7JHmTDY1ID2mJzMxcBexiogi29
 v9vwp4BI1lj6LQQcxR73g9vbQJWNctFjsIZ3NWIAslMAcyPVFNA4GwIEn0PamMMcudi5
 tsyNKFQUIFJpP5vhIR39mw3wQqLyTGg3NO4vK/eplANjEjjOjzwAqMpa2JoYQXypom0w
 0ipNCFGg71llVSCbOVQzqSPO8aj7qrS1rmpK7hC0E94uoJW/c1sBHsJM1ws5NnVgRc4e
 vssw==
X-Gm-Message-State: AOAM533yvxmGSAl5NtCUDoe3W4hMCaI/XJL9G/uTAFs38swdHc313Sbh
 nAGAqwPPL9vK/T2F0TT/03RcWg==
X-Google-Smtp-Source: ABdhPJxawWaDeR4dAEkaF6ko7UcSdYYyuB7X9Fr3Dw7YujettIghdwLeRH6ETRXZsafTAXCc4rdvxg==
X-Received: by 2002:a17:902:8c93:b0:167:879d:6670 with SMTP id
 t19-20020a1709028c9300b00167879d6670mr18912302plo.31.1654798591093; 
 Thu, 09 Jun 2022 11:16:31 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a63ec4e000000b003fb0354c43asm17728049pgj.32.2022.06.09.11.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 11:16:30 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 3/7] dt-bindings: usb: Add Type-C switch binding
Date: Thu,  9 Jun 2022 18:09:42 +0000
Message-Id: <20220609181106.3695103-4-pmalani@chromium.org>
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

Introduce a binding which represents a component that can control the
routing of USB Type-C data lines as well as address data line
orientation (based on CC lines' orientation).

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

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

