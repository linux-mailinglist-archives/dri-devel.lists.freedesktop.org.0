Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C1A144D2D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641B76F3D1;
	Wed, 22 Jan 2020 08:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804946EC76
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 11:27:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id CBB7F29255D
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: convert rockchip-drm.txt to rockchip-drm.yaml
Date: Tue, 21 Jan 2020 12:27:18 +0100
Message-Id: <20200121112718.18466-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 dafna.hirschfeld@collabora.com, airlied@linux.ie, dafna3@gmail.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, helen.koike@collabora.com,
 robh+dt@kernel.org, kernel@collabora.com, ezequiel@collabora.com,
 Dafna Hirschfeld <dafna.hirschfeld@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dafna.hirschfeld@gmail.com>

convert the binding file rockchip-drm.txt to yaml format.
This was tested and verified with:
make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@gmail.com>
---
 .../display/rockchip/rockchip-drm.txt         | 19 ----------
 .../display/rockchip/rockchip-drm.yaml        | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
deleted file mode 100644
index 5707af89319d..000000000000
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-Rockchip DRM master device
-================================
-
-The Rockchip DRM master device is a virtual device needed to list all
-vop devices or other display interface nodes that comprise the
-graphics subsystem.
-
-Required properties:
-- compatible: Should be "rockchip,display-subsystem"
-- ports: Should contain a list of phandles pointing to display interface port
-  of vop devices. vop definitions as defined in
-  Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
-
-example:
-
-display-subsystem {
-	compatible = "rockchip,display-subsystem";
-	ports = <&vopl_out>, <&vopb_out>;
-};
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
new file mode 100644
index 000000000000..e4ef1a02196d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rockchip-drm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip DRM master device
+
+maintainers:
+  - Sandy Huang <hjc@rock-chips.com
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |
+  The Rockchip DRM master device is a virtual device needed to list all
+  vop devices or other display interface nodes that comprise the
+  graphics subsystem.
+
+properties:
+  compatible:
+    const: rockchip,display-subsystem
+
+  ports:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      Should contain a list of phandles pointing to display interface port
+      of vop devices. vop definitions as defined in
+      Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
+
+required:
+  - compatible
+  - ports
+
+examples:
+  - |
+    display-subsystem {
+        compatible = "rockchip,display-subsystem";
+        ports = <&vopl_out>, <&vopb_out>;
+    };
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
