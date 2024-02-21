Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C7F85E26F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 17:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D1510E7E2;
	Wed, 21 Feb 2024 16:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="xf/Nr+/M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8EF10E7E0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 16:02:49 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-41276894e76so3479125e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 08:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708531368; x=1709136168;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=QG+lYn+WRJAXK2sPNs+WXBXseOQ/XIK++bgwEo6870E=;
 b=xf/Nr+/MpIA9DQ6UQS7tQfI9Tr6f4/glbyeEEekRDNpYG02+CQZ+NZEX9WhPD318ho
 IjksuyxwnIgVnt3Trx2KDPd5SF/C+N7vLQLLh7pG21Q8tbeDR3YEuFTYHeXH9xG9sBQK
 mZ3ngvPlkF24WMz1dsCyORYunQMK67LaY2V7tbCrkAJfCWCFCsdfD8+fS6xDvtq+KGho
 NG4LLartdfZ2PrLn+1Z5+wQsncUvzMcM7oVXZtiW3QsDskD5CWHtHn99Dpy8SBOECFrY
 kQaoQBdtC/IVHq5xp2sgd7+M5Q2qZZCtyMS+9LpKKsv6t04Xq2pvDlWPf9PSMzS2fBMz
 3SoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708531368; x=1709136168;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QG+lYn+WRJAXK2sPNs+WXBXseOQ/XIK++bgwEo6870E=;
 b=eJG1wITIDHE1FB1bkTPrNlR1LDdW2WB2ihqLnbPbim8CBWyyTEF55dwIf9j+m6ozRI
 NuHETqy/mRxp5/k1sdGxDTk99co98RGQREjnE9ihKXPfeewdeCg2F/MD2G93XDBTzcY4
 yMB4ChRi7W9QBQlrpWf9ExfDalHN7t943TXRys5ZWfCMosuiUdSm7Wqv99kO3d6lwfFG
 yI69f1l3AYE9tiJH7fyYJDgVajS5CjZNNVQHYFHDXU8hHGzdk+r7L4fiTH0T95CkIEMl
 bNBertWXTQofe1Ky6D2yyGJcFKFWaahPq2+Z1/5tVDMZlt5a1cDZv1aXBU+NfVrdQT+u
 5HUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXxKKTuzu334Scb183CI/596WRXdw7LujQZsOz1FupcymmG6yk8qSZzYEWeWEbTLBGk5JKjaMDc85Fqb/0IdMhvyYSopuLBf8kODAmcG7G
X-Gm-Message-State: AOJu0Yx+oIOI4fBa/A0opzglEEGPcevXgjnNoxmTtmQbgD2BkfO5R+Ag
 +knZxEXhFrOM4ca5QUGA+0WP46fIfVvMTKVdW8Ex40XiN4ZiB2z4x0+1Clvz/sStJDwfGL2Ru9a
 88gaPzlXiwA==
X-Google-Smtp-Source: AGHT+IGzSlaHNh9nuHPSE1pDBQcoTa92tjLdirc6li9igPKl4C8OqbVJ3yIPAunVVJRd0ILLSPNzPIMzj7eA3Q==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:600c:a383:b0:412:1500:beb4 with SMTP
 id hn3-20020a05600ca38300b004121500beb4mr159646wmb.7.1708531367605; Wed, 21
 Feb 2024 08:02:47 -0800 (PST)
Date: Wed, 21 Feb 2024 16:02:14 +0000
In-Reply-To: <20240221160215.484151-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221160215.484151-9-panikiel@google.com>
Subject: [PATCH v2 8/9] media: dt-bindings: Add Intel Displayport RX IP
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com, ribalda@chromium.org, 
 "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
capture and Multi-Stream Transport. The user guide can be found here:

https://www.intel.com/programmable/technical-pdfs/683273.pdf

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 .../devicetree/bindings/media/intel,dprx.yaml | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.yaml

diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yaml b/Docu=
mentation/devicetree/bindings/media/intel,dprx.yaml
new file mode 100644
index 000000000000..31025f2d5dcd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
@@ -0,0 +1,160 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/intel,dprx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel DisplayPort RX IP
+
+maintainers:
+  - Pawe=C5=82 Anikiel <panikiel@google.com>
+
+description: |
+  The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
+  Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
+  capture and Multi-Stream Transport.
+
+  The IP features a large number of configuration parameters, found at:
+  https://www.intel.com/content/www/us/en/docs/programmable/683273/23-3-20=
-0-1/sink-parameters.html
+
+  The following parameters have to be enabled:
+    - Support DisplayPort sink
+    - Enable GPU control
+  The following parameters' values have to be set in the devicetree:
+    - RX maximum link rate
+    - Maximum lane count
+    - Support MST
+    - Max stream count (only if Support MST is enabled)
+
+properties:
+  compatible:
+    const: intel,dprx-20.0.1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  intel,max-link-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Max link rate configuration parameter
+
+  intel,max-lane-count:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Max lane count configuration parameter
+
+  intel,multi-stream-support:
+    type: boolean
+    description: Multi-Stream Transport support configuration parameter
+
+  intel,max-stream-count:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Max stream count configuration parameter
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: SST main link
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 0 or SST main link
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 1
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 2
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 3
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - if:
+      required:
+        - intel,multi-stream-support
+    then:
+      required:
+        - intel,max-stream-count
+        - ports
+    else:
+      required:
+        - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    dp-receiver@c0062000 {
+        compatible =3D "intel,dprx-20.0.1";
+        reg =3D <0xc0062000 0x800>;
+        interrupt-parent =3D <&dprx_mst_irq>;
+        interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
+        intel,max-link-rate =3D <0x1e>;
+        intel,max-lane-count =3D <4>;
+        intel,multi-stream-support;
+        intel,max-stream-count =3D <4>;
+
+        ports {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+
+            port@0 {
+                reg =3D <0>;
+                dprx_mst_0: endpoint {
+                    remote-endpoint =3D <&fb_mst0_0>;
+                };
+            };
+
+            port@1 {
+                reg =3D <1>;
+                dprx_mst_1: endpoint {
+                    remote-endpoint =3D <&fb_mst1_0>;
+                };
+            };
+
+            port@2 {
+                reg =3D <2>;
+                dprx_mst_2: endpoint {
+                    remote-endpoint =3D <&fb_mst2_0>;
+                };
+            };
+
+            port@3 {
+                reg =3D <3>;
+                dprx_mst_3: endpoint {
+                    remote-endpoint =3D <&fb_mst3_0>;
+                };
+            };
+        };
+    };
+
+  - |
+    dp-receiver@c0064000 {
+        compatible =3D "intel,dprx-20.0.1";
+        reg =3D <0xc0064000 0x800>;
+        interrupt-parent =3D <&dprx_sst_irq>;
+        interrupts =3D <0 IRQ_TYPE_EDGE_RISING>;
+        intel,max-link-rate =3D <0x1e>;
+        intel,max-lane-count =3D <4>;
+
+        port {
+            dprx_sst_0: endpoint {
+                remote-endpoint =3D <&fb_sst_0>;
+            };
+        };
+    };
--=20
2.44.0.rc0.258.g7320e95886-goog

