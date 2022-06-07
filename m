Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7696E540F42
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 21:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496AF10F03C;
	Tue,  7 Jun 2022 19:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F55610F034
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:06:50 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id q140so1688657pgq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 12:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Am5aGfsC1axZlOULyuACem/6+XgiQ9wXJ5AxdoUZZyw=;
 b=BGOwhJTnVdp3I5vsGAiMaSPty5yVDLkvo0iFxUWaRbLO48HZDG2m2g31IRd/i61RJD
 cplVpC/n6+a9WUpARLyGuyHaIrbjXSGdtTeLPzgvpeOYyuGy2atgUBjtc6b4N1vAcdt6
 wabuMv7xZ2cpk1nStoT2ujhjkI+PBH8IM/Bvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Am5aGfsC1axZlOULyuACem/6+XgiQ9wXJ5AxdoUZZyw=;
 b=iN0KgF1Gd1u9Gnj2ovn1Vk4UaN+082zWyx490plV7HYvsHIKa4Uf3xI45fRPDBmEqR
 1/M+LXJFkbOgEWNMOfUNOdK5exmjMgZLRpEiOTK2UbFUETiyP8cFNA8eCTeB8ehq8Cx6
 ZNluc8rTpOWl8AM6+J3nnfRIDoHRLSuVyoWVSfDHK+oPcyD3zTKoq4BkRsEE5y4G5CaG
 y3Qh5KcGhw6ZDZLD7Kai49K5ITbx008Mhd7l4RbP07YmM/g/npaR0BR+ttmD4BozmmKL
 yq+khBmUBiJJoVVlIrU1j2RfyOdEG3rpQj9iniVNGiXNzzde/Ag8k20XrATu/Ke+erY/
 QONA==
X-Gm-Message-State: AOAM532tpZue3tf/xGQ4MkZvcexPQdDnqZnDztBbT235cT+lIVYS++TK
 ykkDocMIXF/asEMjnTqTMmwkSQ==
X-Google-Smtp-Source: ABdhPJwK88zzGqSUFlf6HNcaHNY6NeEJA3B8fT0RLY7q7mLsnknl0nXD4wTz+3eWL0ef64qxs1Ro+w==
X-Received: by 2002:a63:2c89:0:b0:3fe:1c0a:75d2 with SMTP id
 s131-20020a632c89000000b003fe1c0a75d2mr2077597pgs.310.1654628809959; 
 Tue, 07 Jun 2022 12:06:49 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 g29-20020aa79ddd000000b0050dc762819esm13236084pfq.120.2022.06.07.12.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 12:06:49 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 3/7] dt-bindings: usb: Add Type-C switch binding
Date: Tue,  7 Jun 2022 19:00:21 +0000
Message-Id: <20220607190131.1647511-4-pmalani@chromium.org>
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
 .../devicetree/bindings/usb/typec-switch.yaml | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/typec-switch.yaml

diff --git a/Documentation/devicetree/bindings/usb/typec-switch.yaml b/Documentation/devicetree/bindings/usb/typec-switch.yaml
new file mode 100644
index 000000000000..60a600a63fef
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/typec-switch.yaml
@@ -0,0 +1,76 @@
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
+    items:
+      - enum:
+          - typec-switch
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
+    anx7625 {
+      typecswitch {
+        compatible = "typec-switch";
+        mode-switch;
+        orientation-switch;
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            anx_ep: endpoint {
+              remote-endpoint = <&typec_controller>;
+            };
+          };
+        };
+      };
+    };
-- 
2.36.1.255.ge46751e96f-goog

