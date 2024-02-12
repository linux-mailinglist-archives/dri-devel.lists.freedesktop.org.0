Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A381851472
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6DF10ED45;
	Mon, 12 Feb 2024 13:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ZABjeSSt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A55D10ED50
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:14:37 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-33b28f50eadso1436271f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 05:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707743675; x=1708348475;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=weAbudB3k3wPqp+4oDt/WoN+euSYJ/f5cRIeaqwfqjk=;
 b=ZABjeSStpZte7eaHmbDXqg8JbNLM1iOobxsaT/DjhUysXQtxw4iF6LSWm6DoTQQoS0
 qzSmTznrOMAUqwepMktGS4sj3hpzG+Sti9UfJidTVnNpvHqpI0T5W6Q85H2UjZ9tSLj+
 Rq3tjmCCp3Wa3208ysl64fXmMIldvBxhMZQj6LNEwji6TxxREtTgFyj37YXfpExP4RWY
 16duu9t4HVxAA0Bxafi69gFSxPwYvg3VAd23Lc9aZGjpXETpsiGUla7dZs83m0H2wlEt
 jqjTTyukJ7Dpd7NCmZ0/ByvL0dzl9IEfZlAT/lXOIadMnjs4QlYjbabAuaCJcm3DtmfW
 tjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707743675; x=1708348475;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=weAbudB3k3wPqp+4oDt/WoN+euSYJ/f5cRIeaqwfqjk=;
 b=ieIOAr8HNLLtlb8r0AtADzD4TOJ3EunLDP0szmWkl6gNT4l/61epbPh6IeFOsI28QP
 +/zoXhiFdsr3yndTGBIlPWbJ8YCM8XR+ka6gnB2V0+fU3FPV8MSacZlwpIk1WQSBUHn2
 MFqSCkiOqIJRsnViKmNhVxbMoyk+sWz2OVfT0hIqea8a6mEPMhoAjO7BMZmmAyBPDsWI
 gWrea2NFSwa8/CkynD1r6DNG770mSrgGHd3eJu+nVYIsSWVyIO3iY5+cGHFGf3ZFUq7t
 hr+/vrY8PsRq8xg4UWqWJxv757K9YQ+bVfBTG+XpTntTMQSA3bNONxwrplH1y2RZcj2X
 KH5g==
X-Gm-Message-State: AOJu0Yyc0rSLa488/bGK86K2poHvX/NH5Cr/KM2TIqHgwPOVHpsE4lf5
 j66CZtIgKvl7C+U6fEzDqm4FvlOXf/uLK4A3bHczF/iwkbOnnwa8p79pDMPaGrTPWP2KZi0CjEv
 IYVmVMdlQeA==
X-Google-Smtp-Source: AGHT+IFZySJWx+sJiH1D/tqRLGTEXs/l+QZVWepQz6m1RRZuOBSja+jh8SjmiG4dW0L1Nwzda60ddfO2GObytg==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6000:a16:b0:33b:6489:a97d with SMTP
 id co22-20020a0560000a1600b0033b6489a97dmr13629wrb.14.1707743675651; Mon, 12
 Feb 2024 05:14:35 -0800 (PST)
Date: Mon, 12 Feb 2024 13:13:22 +0000
In-Reply-To: <20240212131323.2162161-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240212131323.2162161-1-panikiel@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240212131323.2162161-9-panikiel@google.com>
Subject: [PATCH 8/9] media: dt-bindings: Add Intel Displayport RX IP
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
 .../devicetree/bindings/media/intel,dprx.yaml | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.yaml

diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yaml b/Docu=
mentation/devicetree/bindings/media/intel,dprx.yaml
new file mode 100644
index 000000000000..3ed37e0a4a94
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
@@ -0,0 +1,125 @@
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
+properties:
+  compatible:
+    const: intel,dprx
+
+  reg:
+    items:
+      - description: core registers
+      - description: irq registers
+
+  interrupts:
+    maxItems: 1
+
+  intel,has-mst:
+    type: boolean
+    description: The device supports Multi-Stream Transport
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
+        - intel,has-mst
+    then:
+      required:
+        - ports
+    else:
+      required:
+        - port
+
+additionalProperties: false
+
+examples:
+  - |
+    dprx@c0062000 {
+        compatible =3D "intel,dprx";
+        reg =3D <0xc0062000 0x800>,
+              <0xc0060f80 0x10>;
+        interrupts =3D <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+        intel,has-mst;
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
+    dprx@c0064000 {
+        compatible =3D "intel,dprx";
+        reg =3D <0xc0064000 0x800>,
+              <0xc0060fe0 0x10>;
+        interrupts =3D <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+
+        port {
+            dprx_sst_0: endpoint {
+                remote-endpoint =3D <&fb_sst_0>;
+            };
+        };
+    };
--=20
2.43.0.687.g38aa6559b0-goog

