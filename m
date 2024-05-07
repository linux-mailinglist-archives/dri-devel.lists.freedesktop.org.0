Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 820458BE7E6
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 17:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972DB112149;
	Tue,  7 May 2024 15:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dwAWFrBV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com
 [209.85.128.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4635611218B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:55:28 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-61e0c1f7169so67669187b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715097327; x=1715702127;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=YyhwXzsTi3iuS9VxYlKBJB4yY1r1RWRn/sVpGYW4xm0=;
 b=dwAWFrBVsl4cUqHQifBWXUIInxNs9SoCocWeieD8fRTGFPyBe60pebI9AY+OGPVRWQ
 HZb6r8Bt9wgLp0136AQPfYjygSYCa2U5kQgo5ezBPzIr9qEjdAnxqhgumQeSvtCTLsUt
 CG4u8V2U54aGsJgUd5uMwj2FIoWNdkuSAm+sqaIuTotMlJKOJKpZ8pSofxVwCGsTWTAs
 +9b+qgxUru3CY4ADiFLzLj66LPhzjX5pSoFnBhJaYsOLOOY8Heks9DkU0gLLdS+t6EKy
 IW5ER5+HtYVjZm7vPU0Z+QatOK6zRlk4YD+Yw/2vTVMpn3wr7A4fMqUK0jxXiIr9maZH
 hw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715097327; x=1715702127;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YyhwXzsTi3iuS9VxYlKBJB4yY1r1RWRn/sVpGYW4xm0=;
 b=ZTf+XAitQQ02P2CvU6uJZAdzjUo0El6/oA21FwB1NMSR38bgKvHUSQIXZ78whNbZ/f
 +mj5iswXvnXtgCtrobsUddsggBphDFqPq5pOz3jI+sfijzMGJvKMPjAOPjcc/3cdHuSp
 nTCkHM2pD6CSl7K3Y4Gd5uDTDG7g+2z1Zz0P7wGG0RKXHxJDfP7xyNGylnewuMpZLPmQ
 6fi5y2ZOUdsRPDtceJMuDL6gyzHC7hNq+X6KKk30+2nXRmmUxi609MwxKRh8p7Xko+lD
 gJ5zO6DDGyhU2d6FsGvY7GBLekiYvciDtwaW++ycxLm5wZ8+vHkE3Q3VcgqeCIn6KdMq
 V4wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvZSj+Z3H0y5GoTHhC/znuNjGbr65HsdMSRGaC9ippX2sZ9gPrIlx5AFoNJMmC/dUh8urYhhAztawL/vkopIL7bxrJ6cxeUk3+VxRPQ5i2
X-Gm-Message-State: AOJu0YyMpSYXwbZ4SB/aRtbbSpWj5X4Qgbq/UtzsN7l+ebqhNDEZ1cqk
 PAS+2rvDpT0L/SR8DLlGGkjtObm+xA6aZLIRFuLbT0YBoAFPzEG6nDG9dzOWKgmG9cFaoZAREgu
 ydQXDapsZ8w==
X-Google-Smtp-Source: AGHT+IFXr71F6VzIV2IWcHBSYr3WsXCqqHZWMEiC5DuDYmkkVHWrNMTCKBa7KJNHIvxEbrt1NsffE8mdi7jzMQ==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a25:ed0d:0:b0:de5:a77e:f9bd with SMTP id
 3f1490d57ef6-deba36c73bamr692217276.6.1715097327282; Tue, 07 May 2024
 08:55:27 -0700 (PDT)
Date: Tue,  7 May 2024 15:54:11 +0000
In-Reply-To: <20240507155413.266057-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240507155413.266057-1-panikiel@google.com>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507155413.266057-9-panikiel@google.com>
Subject: [PATCH v3 08/10] media: dt-bindings: Add Chameleon v3 video interface
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

Add dt binding for the video interface present on the Google
Chameleon v3. The Chameleon v3 uses the video interface to capture
a single video source from a given HDMI or DP connector and write
the resulting frames to memory.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 .../bindings/media/google,chv3-video.yaml     | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/google,chv3-vid=
eo.yaml

diff --git a/Documentation/devicetree/bindings/media/google,chv3-video.yaml=
 b/Documentation/devicetree/bindings/media/google,chv3-video.yaml
new file mode 100644
index 000000000000..b8380021cd23
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/google,chv3-video.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/google,chv3-video.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Chameleon v3 video interface
+
+maintainers:
+  - Pawe=C5=82 Anikiel <panikiel@google.com>
+
+properties:
+  compatible:
+    enum:
+      - google,chv3-video-it-1.0
+      - google,chv3-video-dp-1.0
+
+  reg:
+    items:
+      - description: core registers
+      - description: irq registers
+
+  interrupts:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Connection to the video receiver - optional. If this isn't present,
+      the video interface still works on its own, but EDID control is
+      unavailable and DV timing information only reports the active
+      video width/height.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    video@c0060500 {
+        compatible =3D "google,chv3-video-it-1.0";
+        reg =3D <0xc0060500 0x100>,
+              <0xc0060f20 0x10>;
+        interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+  - |
+    video@c0060600 {
+        compatible =3D "google,chv3-video-dp-1.0";
+        reg =3D <0xc0060600 0x100>,
+              <0xc0060f30 0x10>;
+        interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+
+        port {
+            video_mst0_0: endpoint {
+                remote-endpoint =3D <&dprx_mst_0>;
+            };
+        };
+    };
--=20
2.45.0.rc1.225.g2a3ae87e7f-goog

