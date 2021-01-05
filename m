Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E92EBB56
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 09:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA0D89D4A;
	Wed,  6 Jan 2021 08:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2796E104
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 13:46:25 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id s15so16378273plr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 05:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zHfnNx0J3r3BjI2ETPq9kmvQWmw+pKoPMGoXArL8lcQ=;
 b=I1/5c9FKHoAjrf+5PqehvC/HSKYNkE7sAkdo7sz7TNmLP5hbCBQZJ9E8Dav+Glou5w
 Ynjc+9K2JwpOTOHftifYppyYWvuJDe6YGZZXl0aje+qB5V3n7P7r7PgKAUZD7Dltpzo8
 f//k/PBy/HdHVqUSP4iairbTIUjbojbqpgtnhGvoqjr9sjUJzP2w0aY1zSqrlLLCTJ41
 8Et27tjY+5YyVX+PhU53hTl1/qaLJPYmB90dKHQZOQfaEhJScVp73Imbxqf//fu16chM
 JYAeXwGNNC7gERJ07hbN0D4rclkuGhsemAXOSLgmvM6ooRyK9bNeiu2rFfvH7YeuWH+u
 suuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zHfnNx0J3r3BjI2ETPq9kmvQWmw+pKoPMGoXArL8lcQ=;
 b=GDu5K9q1m3TBe1HEZdeZFht9ZGD+BT6iCURXAOOc0wTWZc0/ZF7POzIOsO6n5KNliW
 Jvd0zx5jeShh/5KATCON7aNrh/2oT/fx54zI/dascL8FYzQNCfbi4z5LE7mjXSP5/AgD
 /OOzb2AnDAndtYWsMG3/yPnE+eWUhsZF5LNl6Qbyz3kHQ7xHMA0SNBoau76SaqlGJ3ji
 DyMzxVmAKANKocqS4GOc5aT170QCAAhsrzo3rD1h4CZc3auRHdpLVlb+23H3jmgOo2LL
 XDRZ0wjld4PDO7FkN9pqX+h1FBlVsGoAS3LM6SRS2Hzx497BXGlndKUafchvEPwJKovS
 rG+w==
X-Gm-Message-State: AOAM530BPLqPvSXuL0IvU+pVLyUWPtb7cdnLlMdkA1eiYDplzpyMz54e
 usNwvl9E5i74PuxtXfTE3Nw=
X-Google-Smtp-Source: ABdhPJyP4cHof0BEv5VIopYvsOWM1sFoMETO0LpHexGY1RBUIVD1pe2G4kV/wKnyxYyBobhqaMP/YQ==
X-Received: by 2002:a17:90a:fcc:: with SMTP id
 70mr4062558pjz.168.1609854385451; 
 Tue, 05 Jan 2021 05:46:25 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id w63sm57582284pfc.20.2021.01.05.05.46.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Jan 2021 05:46:24 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH v3 1/6] dt-bindings: display: add Unisoc's drm master bindings
Date: Tue,  5 Jan 2021 21:46:02 +0800
Message-Id: <1609854367-2720-2-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609854367-2720-1-git-send-email-kevin3.tang@gmail.com>
References: <1609854367-2720-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Wed, 06 Jan 2021 08:52:53 +0000
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
Cc: orsonzhai@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhang.lyra@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

The Unisoc DRM master device is a virtual device needed to list all
DPU devices or other display interface nodes that comprise the
graphics subsystem

Unisoc's display pipeline have several components as below
description, multi display controllers and corresponding physical interfaces.
For different display scenarios, dpu0 and dpu1 maybe binding to
different encoder.

E.g:
  dpu0 and dpu1 both binding to DSI for dual mipi-dsi display;
  dpu0 binding to DSI for primary display, and dpu1 binding to DP for external display;

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/sprd/sprd,display-subsystem.yaml       | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
new file mode 100644
index 0000000..3d107e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/sprd,display-subsystem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc DRM master device
+
+maintainers:
+  - Kevin Tang <kevin.tang@unisoc.com>
+
+description: |
+  The Unisoc DRM master device is a virtual device needed to list all
+  DPU devices or other display interface nodes that comprise the
+  graphics subsystem.
+
+  Unisoc's display pipeline have several components as below description,
+  multi display controllers and corresponding physical interfaces.
+  For different display scenarios, dpu0 and dpu1 maybe binding to different
+  encoder.
+
+  E.g:
+  dpu0 and dpu1 both binding to DSI for dual mipi-dsi display;
+  dpu0 binding to DSI for primary display, and dpu1 binding to DP for external display;
+
+          +-----------------------------------------+
+          |                                         |
+          |                            +---------+  |
+  +----+  |   +----+    +---------+    |DPHY/CPHY|  |   +------+
+  |    +----->+dpu0+--->+MIPI|DSI +--->+Combo    +----->+Panel0|
+  |AXI |  |   +----+    +---------+    +---------+  |   +------+
+  |    |  |                  ^                      |
+  |    |  |                  |                      |
+  |    |  |      +-----------+                      |
+  |    |  |      |                                  |
+  |APB |  |   +--+-+    +-----------+    +---+      |   +------+
+  |    +----->+dpu1+--->+DisplayPort+--->+PHY+--------->+Panel1|
+  |    |  |   +----+    +-----------+    +---+      |   +------+
+  +----+  |                                         |
+          +-----------------------------------------+
+
+properties:
+  compatible:
+    const: sprd,display-subsystem
+
+  ports:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Should contain a list of phandles pointing to display interface port
+      of DPU devices.
+
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
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
