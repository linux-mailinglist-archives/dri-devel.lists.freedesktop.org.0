Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 006224D18B0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 14:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451B410E70A;
	Tue,  8 Mar 2022 13:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8E510E6D9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 13:07:01 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t11so28460466wrm.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 05:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oUsYE5vCqqM379ucx1WaZIZjicJ83WEckesSTynIV2A=;
 b=qiRyr34qJ6m+4Yy3vZMQExJWg/MRLN16JXTN3fqxV8Lx8l1YEfqDpdcyrXdbzdtcoG
 2oToyyqPloznqkgNw3Og8cDFXdYwwrC9EHk59DHCYFku+nzMEZzFY9nVWKYxT+dlJ3zl
 q9V6gsLr+WcawSRT/dSq/u2TM1kACKQ94hQLmxNNTmI01ojX4zou7OL69Qq6pWGcy1Ho
 afSFdx5+huHS5kDlwYgN/k5pGySPsOLsjRfXi2HxGBWij9y8UuNvBigDTjTchtOUSvGg
 oN2EGjKVfe9zDFpErahU3KFbmBptLyp8ssO61enVZDw+VTKsFWTOooroHDyqkC7ETbhV
 KxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oUsYE5vCqqM379ucx1WaZIZjicJ83WEckesSTynIV2A=;
 b=0CpiIHeVrOKUv/ryMTgDbY8HN00z2dCkbuWEpOurN4bCZAlRLt44v1OI/YT7XUAiqU
 3ZB319ldd5evPg2FDNSkavFRXpOEMXTGaQPIP978fNjBcUTSQOyen65Hb51kWdlKetNq
 JdxA/Bp/64PB9O0bxQUaKG6DpZ3f7p+OHODn5foux15WJuqVt2tGKlql61B/LvpS4+9W
 mByrLA+H+pXxq0RcxO6204FOsM3iqWrdDE16MruiFKnjkjCoIrImuXV8dHHNhxF5zLlF
 /6OybpM1D+hs0XG9SbBYtq8qi5Jlx6BytYbVPsicNUy6PqHAsFf9/0a+QKOGu3dPGOZU
 nwXw==
X-Gm-Message-State: AOAM5310acm62bJGhbTQ/Z2tY6a4p2iDTMRkNcKugN+opxQsxNY4MjDS
 /x0QPZOb4daeOau7WSqZGB8=
X-Google-Smtp-Source: ABdhPJytf6G5YVGNcujtGVSueQv0J+ZS4ATCYKKO0s2bnfxvp/0LDu0ZRMkZKecWr+wmyLkV14b7Pg==
X-Received: by 2002:adf:f006:0:b0:203:723d:a2e5 with SMTP id
 j6-20020adff006000000b00203723da2e5mr1353663wro.188.1646744820378; 
 Tue, 08 Mar 2022 05:07:00 -0800 (PST)
Received: from monk.home ([2a01:cb10:430:ec00:4737:d56e:186b:af1])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b003899d50f01csm2129159wms.6.2022.03.08.05.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:06:59 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 4/4] dt-bindings: display/panel: Add Leadtek ltk035c5444t
Date: Tue,  8 Mar 2022 14:06:43 +0100
Message-Id: <20220308130643.260683-5-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308130643.260683-1-cbranchereau@gmail.com>
References: <20220308130643.260683-1-cbranchereau@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add binding for the leadtek ltk035c5444t, which is a 640x480
mipi-dbi over spi / 24-bit RGB panel based on the newvision
NV03052C chipset.

It is found in the Anbernic RG350M mips handheld.

Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
---
 .../panel/leadtek,ltk035c5444t-spi.yaml       | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t-spi.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t-spi.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t-spi.yaml
new file mode 100644
index 000000000000..9b6f1810adab
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t-spi.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/leadtek,ltk035c5444t-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Leadtek ltk035c5444t 3.5" (640x480 pixels) 24-bit IPS LCD panel
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+  - Christophe Branchereau <cbranchereau@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: leadtek,ltk035c5444t-spi
+
+  backlight: true
+  port: true
+  power-supply: true
+  reg: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - power-supply
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "leadtek,ltk035c5444t-spi";
+            reg = <0>;
+
+            spi-3wire;
+            spi-max-frequency = <3125000>;
+
+            reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
+
+            backlight = <&backlight>;
+            power-supply = <&vcc>;
+
+            port {
+                panel_input: endpoint {
+                    remote-endpoint = <&panel_output>;
+                };
+            };
+        };
+    };
-- 
2.34.1

