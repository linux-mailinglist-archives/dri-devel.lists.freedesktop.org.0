Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF18851470
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A4510ED41;
	Mon, 12 Feb 2024 13:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="nhkb1S9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85DE10ED53
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:14:34 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-40fd2fe490bso19555815e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 05:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707743673; x=1708348473;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=rRe13GXsBNZ8mkxLlyJ1MfL527/NzLwP4cfZxeK7UxI=;
 b=nhkb1S9WE177Lyq65zzgt4H6Of8ti7AhvTTHoj5gdNstE1zhVZXTjv5IVmT8hj704y
 Q3MBClGpIpMroKEIKPazGy6kTVZhObPjI9PCVOTuWRPsyHMzIJZyg59TbEUC3BApjmTT
 QdOF1XH4BKwp08J+IyICbGRC+pwe4FgxOieFWqyuygQO0myS817SqkOxhi71ztjIoELS
 W9hJeKavAmWUPmSMDsDiGAD2buSaXXDdlXlnZ4YDNgC6W0D9yl0Y7a6VrQQbTEzkU45F
 cN17q8NrJQ6Z9JFCHx1+5R2vk5Pgk350+JVE6mhmTlE7xU9hhdXA7gONsbTXdhNxyioy
 m3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707743673; x=1708348473;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rRe13GXsBNZ8mkxLlyJ1MfL527/NzLwP4cfZxeK7UxI=;
 b=aECfC9h3uCKTqIQ8Z41Ykw7jGfH9DJHrdkUywRu+/LoFGzq4U1WC0A/aTe3keBmkUM
 UHlAYMCHkDyjoN9fyUXTY4H/sU7qrtAD7m4H1G0z1qdkl1ruRi1Tu0N1LfFReArKU/6K
 zz44t4p/dA5BHVkPEcDpK1ry91uhVJC6FkTqargUypSeUpBmBJ88B63DjUBwZa+LH59z
 ZLSv/jiAa8c5X52HUv/FqJRVhXAZIT3B7EEcIGkle9SqJZJNB0Y0tmxcHjxOVdHQZa6d
 4LLo1yLf4HJwYnuj4g2GrDNFMHapGpxigGezDMLvzq25v7yAdE+BARsx4FzCQac3sOZw
 UcAg==
X-Gm-Message-State: AOJu0YyR+3jwaK0bGY6JB/gH/nA2Lq+bZKRQ5NJlpSWjEfbjHWKZHBjP
 ANduF2TG7ApbJxilSJ9RS0sDIJ6DV1rKToJf4xALNgxaTkDmGsLJvD2d9gDq04z9xSaDKluvysI
 skRD2dcepDw==
X-Google-Smtp-Source: AGHT+IHeUQzQJMGFa36yvvo79Gf3XEOqIP1Fw3gP4UC8etm91PZ2z+b4H4rGeV3pFlboBijII39ElfpdFik0Kw==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:600c:4c96:b0:410:bb99:7ea2 with SMTP
 id g22-20020a05600c4c9600b00410bb997ea2mr35246wmp.3.1707743673486; Mon, 12
 Feb 2024 05:14:33 -0800 (PST)
Date: Mon, 12 Feb 2024 13:13:21 +0000
In-Reply-To: <20240212131323.2162161-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240212131323.2162161-1-panikiel@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240212131323.2162161-8-panikiel@google.com>
Subject: [PATCH 7/9] media: dt-bindings: Add Chameleon v3 framebuffer
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

The Chameleon v3 uses the framebuffer IP core to take the video signal
from different sources and directly write frames into memory.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 .../bindings/media/google,chv3-fb.yaml        | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/google,chv3-fb.=
yaml

diff --git a/Documentation/devicetree/bindings/media/google,chv3-fb.yaml b/=
Documentation/devicetree/bindings/media/google,chv3-fb.yaml
new file mode 100644
index 000000000000..ba6643cc7232
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/google,chv3-fb.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/google,chv3-fb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Chameleon v3 video framebuffer
+
+maintainers:
+  - Pawe=C5=82 Anikiel <panikiel@google.com>
+
+properties:
+  compatible:
+    const: google,chv3-fb
+
+  reg:
+    items:
+      - description: core registers
+      - description: irq registers
+
+  interrupts:
+    maxItems: 1
+
+  google,legacy-format:
+    type: boolean
+    description: The incoming video stream is in 32-bit padded mode.
+
+  google,no-endpoint:
+    type: boolean
+    description:
+      The framebuffer isn't connected to a controllable endpoint.
+      The video interface still works, but EDID control is unavailable
+      and DV timing information only reports the active video width/height=
.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - if:
+      not:
+        required:
+          - google,no-endpoint
+    then:
+      required:
+        - port
+
+additionalProperties: false
+
+examples:
+  - |
+    video@c0060500 {
+        compatible =3D "google,chv3-fb";
+        reg =3D <0xc0060500 0x100>,
+              <0xc0060f20 0x10>;
+        interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+        google,legacy-format;
+        google,no-endpoint;
+    };
+
+  - |
+    video@c0060600 {
+        compatible =3D "google,chv3-fb";
+        reg =3D <0xc0060600 0x100>,
+              <0xc0060f30 0x10>;
+        interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+
+        port {
+            fb_mst0_0: endpoint {
+                remote-endpoint =3D <&dprx_mst_0>;
+            };
+        };
+    };
--=20
2.43.0.687.g38aa6559b0-goog

