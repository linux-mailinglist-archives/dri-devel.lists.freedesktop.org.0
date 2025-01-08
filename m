Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BF8A05A80
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 12:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B6C10E88D;
	Wed,  8 Jan 2025 11:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="GWy3ZByF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8745010E887
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 11:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=Fb7Vt
 HZp4ZP+khwQrNOo4zrrHvRLsqIV0ZgKIF4ub3s=; b=GWy3ZByFEH468GsVN76MH
 PUsRkmkL6I+oD5D/nNHzsTc1E2WvBSLgx1CJIz0V+NPImfzR4assJ51wQ2dX3JA2
 oS+Yu9Bf+uWFZPzmsfKeBrp+S6Capfzj24XvEqGL+S+I63QQh8jwqmCebCecvFpO
 3Uq9wpmTVWG7Z3JBC4fb2I=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wDHpyUCZ35n8Xn7EQ--.26804S12; 
 Wed, 08 Jan 2025 19:52:50 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v9 10/11] dt-bindings: display: vop2: Add rk3576 support
Date: Wed,  8 Jan 2025 19:52:27 +0800
Message-ID: <20250108115233.17729-11-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250108115233.17729-1-andyshrk@163.com>
References: <20250108115233.17729-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHpyUCZ35n8Xn7EQ--.26804S12
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr1kWFW5XryrGr4xJrWDurg_yoWrJry7pa
 93Ca4DXrW8Gr1UWw1ktF1rCwn5tFn5Ar4Ykrn7ta17KrsIqr4UWw4agrn8Xr13Wry7Zaya
 9FsYk343G392vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UXa9fUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h7OXmd+YSuOwAAAsB
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

From: Andy Yan <andy.yan@rock-chips.com>

Add vop found on rk3576, the main difference between rk3576 and the
previous vop is that each VP has its own interrupt line.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v9:
- Drop 'vop-' prefix of interrupt-names.
- Add blank line between DT properties
- Remove list interrupt-names in top level

Changes in v8:
- Fix dt_binding_check errors
- ordered by soc name
- Link to the previous version:
  https://lore.kernel.org/linux-rockchip/6pn3qjxotdtpzucpul24yro7ppddezwuizneovqvmgdwyv2j7p@ztg4mqyiqmjf/T/#u

Changes in v4:
- describe constraint SOC by SOC, as interrupts of rk3576 is very
  different from others
- Drop Krzysztof's Reviewed-by, as this version changed a lot.

Changes in v3:
- ordered by soc name
- Add description for newly added interrupt

Changes in v2:
- Add dt bindings

 .../display/rockchip/rockchip-vop2.yaml       | 83 +++++++++++++++----
 1 file changed, 67 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 2531726af306..44256cdcb877 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - rockchip,rk3566-vop
       - rockchip,rk3568-vop
+      - rockchip,rk3576-vop
       - rockchip,rk3588-vop
 
   reg:
@@ -37,10 +38,17 @@ properties:
       - const: gamma-lut
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
     description:
-      The VOP interrupt is shared by several interrupt sources, such as
-      frame start (VSYNC), line flag and other status interrupts.
+      For VOP version under rk3576, the interrupt is shared by several interrupt
+      sources, such as frame start (VSYNC), line flag and other interrupt status.
+      For VOP version from rk3576 there is a system interrupt for bus error, and
+      every video port has it's independent interrupts for vsync and other video
+      port related error interrupts.
+
+  interrupt-names:
+    maxItems: 4
 
   # See compatible-specific constraints below.
   clocks:
@@ -120,43 +128,86 @@ allOf:
       properties:
         compatible:
           contains:
-            const: rockchip,rk3588-vop
+            enum:
+              - rockchip,rk3566-vop
+              - rockchip,rk3568-vop
     then:
       properties:
         clocks:
-          minItems: 7
+          minItems: 5
+
         clock-names:
-          minItems: 7
+          minItems: 5
 
         ports:
           required:
             - port@0
             - port@1
             - port@2
-            - port@3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-vop
+    then:
+      properties:
+        clocks:
+          minItems: 5
+
+        clock-names:
+          minItems: 5
+
+        ports:
+          required:
+            - port@0
+            - port@1
+            - port@2
+
+        interrupts:
+          items:
+            - description: vop system interrupt, such as axi bus error
+            - description: interrupts for video port0, such as vsync, dsp_hold.
+            - description: interrupts for video port1, such as vsync, dsp_hold.
+            - description: interrupts for video port2, such as vsync, dsp_hold.
+
+        interrupt-names:
+          items:
+            - const: sys
+            - const: vp0
+            - const: vp1
+            - const: vp2
 
       required:
         - rockchip,grf
-        - rockchip,vo1-grf
-        - rockchip,vop-grf
         - rockchip,pmu
 
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-vop
+    then:
       properties:
-        rockchip,vo1-grf: false
-        rockchip,vop-grf: false
-        rockchip,pmu: false
-
         clocks:
-          maxItems: 5
+          minItems: 7
+
         clock-names:
-          maxItems: 5
+          minItems: 7
 
         ports:
           required:
             - port@0
             - port@1
             - port@2
+            - port@3
+
+      required:
+        - rockchip,grf
+        - rockchip,vo1-grf
+        - rockchip,vop-grf
+        - rockchip,pmu
 
 additionalProperties: false
 
-- 
2.34.1

