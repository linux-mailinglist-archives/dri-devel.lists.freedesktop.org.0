Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC71E2312AD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEF76E3B2;
	Tue, 28 Jul 2020 19:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F986E22C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 10:08:09 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y206so364894pfb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Zjj/ZeDz/jw+vTXOY4hvHXse1jncYmPhmvnsKqVknJ8=;
 b=QvYwRU0lt/Na4sLAvRuuhIUVECA0amQyooQJpmVAzOqVnn2eMUhXePXNhvHNilIkXn
 WHSGvjx+6lKqwSjCxJflh77f50Gl9o/uvHjlSctuL2bfS/ylXfE/Pbk6A2Ou2fP/zLx2
 AkkZ48ECyHTiPZ4GiJ1vrQfc3FPrdcUcTVKGLzgMPUtOg8L3i9TeFBoGbEv6OMzYETdg
 ExBZeVpTdCrUi1ec68wPmXgRoGbNH9Q6h0PTo+/fmNyqmZwEZ8tK/ul8QCQk/ZWZf0nu
 mWvuQw//BuJV4qfto10RqoDuLKvEghZJdX9eMl4L7ws15ArxgRYdPFPxpsnBoWnE1HND
 zzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Zjj/ZeDz/jw+vTXOY4hvHXse1jncYmPhmvnsKqVknJ8=;
 b=AhzZUxaGBj1yKxSUa7ZJRJsrvt70SPydYUd9L4SMM33v1hKWr4WSBt/nq/3K215R+5
 hurMQwA0+NxWmktCAjU/MOHDq6gUSo5qRi8whlv6pJnsiJyHGGOiq4PGc++vOGSQCjBd
 WcKqQ6rx/pHSdV3BXLWqm1xHuwkJVDdzyuHYn0s7BJs8KojdubZJ3SktYew0T7cWFpEc
 Cw/JVDiYb33z588Mu2/ML8dXxcf4MUF8R4aoETcyDSWKAueFy2lDHgzFXIyNhxb1UtGD
 1EuG5Cjx5yDHGmztaY0/0ukSXBrwhlKv2U0UOliZjUc903a8w8N72Osz4ybq2obO1KuO
 QO1g==
X-Gm-Message-State: AOAM531JLSklBToh8aq2CzH8G7WhEe7bY6bLrPSZD531onfS0VZD9q0u
 tvIVsDCGvQ3ymvWsJDfA3/I=
X-Google-Smtp-Source: ABdhPJwjfEDyNm2mxgsk4s1CeMrOdYb48jXr9vv3UKMmlRT4apon39t1dz5OlLuc5+BZErOWtVCMTw==
X-Received: by 2002:a63:2146:: with SMTP id s6mr23551943pgm.411.1595930889173; 
 Tue, 28 Jul 2020 03:08:09 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id e76sm1704593pfh.108.2020.07.28.03.08.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jul 2020 03:08:08 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v6 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
Date: Tue, 28 Jul 2020 18:07:54 +0800
Message-Id: <1595930879-2478-2-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
References: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: orsonzhai@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhang.lyra@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

The Unisoc DRM master device is a virtual device needed to list all
DPU devices or other display interface nodes that comprise the
graphics subsystem

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../devicetree/bindings/display/sprd/drm.yaml      | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/drm.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/drm.yaml b/Documentation/devicetree/bindings/display/sprd/drm.yaml
new file mode 100644
index 0000000..b5792c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/drm.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/drm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc DRM master device
+
+maintainers:
+  - Mark Rutland <mark.rutland@arm.com>
+
+description: |
+  The Unisoc DRM master device is a virtual device needed to list all
+  DPU devices or other display interface nodes that comprise the
+  graphics subsystem.
+
+properties:
+  compatible:
+    const: sprd,display-subsystem
+
+  ports:
+    description:
+      Should contain a list of phandles pointing to display interface port
+      of DPU devices.
+
+required:
+  - compatible
+  - ports
+
+examples:
+  - |
+    display-subsystem {
+        compatible = "sprd,display-subsystem";
+        ports = <&dpu_out>;
+    };
+
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
