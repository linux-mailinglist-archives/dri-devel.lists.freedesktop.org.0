Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FAF8BE7E8
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 17:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49D711225D;
	Tue,  7 May 2024 15:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="GUuBXZ27";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621161121A5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:55:30 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-6204c4f4240so43091277b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 08:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715097329; x=1715702129;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=4Zg5aDDMOyqW00delol8Ca3GL2MBNFcyQ9gNrBCTWcU=;
 b=GUuBXZ27iOcZN56J5kWwo7h3DHPYZzQp1otwfr3IDd5eqavC6f8398LpVuF1qKMk+4
 MBTFUTRlru0MijCFbsD8Bt50PNqCK0QPWJL0HJxbUGNiWuCtQdXpHtEPpfCYq71x4o5O
 WzPGyeW18Q6Kpx6bcbqJSvvxoLkC9HpSeuheS06u1tMp7cyZZ6i9ZnrVAgHT5AjxnMsP
 nE1FfDOrCXXYaM+saWEtBjnhKjaHux0ZeD1kBtkJ/wXL5cvhmRkit/5u18LFPSapTKUn
 LQZDNELkgV9M6U0RKnqyWLpfWN11y6s9NMA1WOJ5CG5uHnJWzVOFXGwTyua0JwcZVBpK
 /IKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715097329; x=1715702129;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4Zg5aDDMOyqW00delol8Ca3GL2MBNFcyQ9gNrBCTWcU=;
 b=mh3SV7xX+LjgZVsKvIiXGPJ2+CLLlsPasVatUiNDG2S8GLDC7FVYK5GvbCxnJUNOQm
 aDRl5TZ29S/nIrGLyMcngP4Cxt0Nhpo0DHHyGnu4BLHUEaLaMXTZ9YdSo5uo8Zc6R/3s
 VOM7KqFwNDVU4XUnq/CX4nFy25A0R7P7SfeHvYWoi0XWL2qvUK3dSRfBZU2U2dxPSF5K
 //6VPIxHqglZrbhYdTmnTqTYHnjP0YZkxZKv4yFYabolHNS2MkKd2MBQWhynTGfuH1mR
 NO4HYeXWU+4/AwanH75pN6oWx6xnzEIbImGynts899QI6WWjKltL0a0NflS77YgAin4d
 RFVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqF4ZX9liwjqt6AtBJMEBGJey/JnkU43z0z8crN0kk++7u8NA//SYGvCZWOujZ8Vm9wIX34Jhh9VTUwnYH6Ba+gryd383401bUDC7XLjeP
X-Gm-Message-State: AOJu0YwJW7sEAM5sxOUovXoF2Be1qxpHE6nsOYIybS5ckBG7GtLNJkiG
 EK0vlE+CkV+/xwsKoLXHVnUm4Bk7SQkEZPMLbwRmiISU3h3yUyQIu3DB5hDKa5K+6ZA84bcAFz/
 YBXq+T3GHSA==
X-Google-Smtp-Source: AGHT+IFl69D5om/H+B54ETJ2PMG3nixPpLSKdXlaMOhDwBY7IXqpN0xGnNqZTl237/xQEoI2pJqnIU8A60Nk+w==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6902:1007:b0:dd1:38ec:905d with SMTP
 id 3f1490d57ef6-debb9e0bdeemr176276.11.1715097329468; Tue, 07 May 2024
 08:55:29 -0700 (PDT)
Date: Tue,  7 May 2024 15:54:12 +0000
In-Reply-To: <20240507155413.266057-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507155413.266057-10-panikiel@google.com>
Subject: [PATCH v3 09/10] media: dt-bindings: Add Intel Displayport RX IP
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com, 
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

Add dt binding for the Intel Displayport receiver FPGA IP.
It is a part of the DisplayPort Intel FPGA IP Core, and supports
DisplayPort 1.4, HBR3 video capture and Multi-Stream Transport.

The user guide can be found here:
https://www.intel.com/programmable/technical-pdfs/683273.pdf

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 .../devicetree/bindings/media/intel,dprx.yaml | 172 ++++++++++++++++++
 1 file changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.yaml

diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yaml b/Docu=
mentation/devicetree/bindings/media/intel,dprx.yaml
new file mode 100644
index 000000000000..01bed858f746
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
@@ -0,0 +1,172 @@
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
+  The following parameters have to be set in the devicetree:
+    - RX maximum link rate (using link-frequencies)
+    - Maximum lane count (using data-lanes)
+    - Support MST (using multi-stream-support)
+    - Max stream count (inferred from the number of ports)
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
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: MST virtual channel 0 or SST main link
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+
+            properties:
+              link-frequencies: true
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              multi-stream-support: true
+
+            required:
+              - data-lanes
+              - link-frequencies
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 0 or SST main link
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 1
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 2
+
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MST virtual channel 3
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ports
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
+
+        ports {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+
+            port@0 {
+                reg =3D <0>;
+                dprx_mst_in: endpoint {
+                    remote-endpoint =3D <&dp_input_mst_0>;
+                    data-lanes =3D <0 1 2 3>;
+                    link-frequencies =3D /bits/ 64 <1620000000 2700000000
+                                                  5400000000 8100000000>;
+                    multi-stream-support;
+                };
+            };
+
+            port@1 {
+                reg =3D <1>;
+                dprx_mst_0: endpoint {
+                    remote-endpoint =3D <&video_mst0_0>;
+                };
+            };
+
+            port@2 {
+                reg =3D <2>;
+                dprx_mst_1: endpoint {
+                    remote-endpoint =3D <&video_mst1_0>;
+                };
+            };
+
+            port@3 {
+                reg =3D <3>;
+                dprx_mst_2: endpoint {
+                    remote-endpoint =3D <&video_mst2_0>;
+                };
+            };
+
+            port@4 {
+                reg =3D <4>;
+                dprx_mst_3: endpoint {
+                    remote-endpoint =3D <&video_mst3_0>;
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
+
+        ports {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+
+            port@0 {
+                reg =3D <0>;
+                dprx_sst_in: endpoint {
+                    remote-endpoint =3D <&dp_input_sst_0>;
+                    data-lanes =3D <0 1 2 3>;
+                    link-frequencies =3D /bits/ 64 <1620000000 2700000000
+                                                  5400000000 8100000000>;
+                };
+            };
+
+            port@1 {
+                reg =3D <1>;
+                dprx_sst_0: endpoint {
+                    remote-endpoint =3D <&video_sst_0>;
+                };
+            };
+        };
+    };
--=20
2.45.0.rc1.225.g2a3ae87e7f-goog

