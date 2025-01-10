Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3663A08D68
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 11:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B60910F048;
	Fri, 10 Jan 2025 10:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="FMALCc8X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id F38F410F046
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 10:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=PbSDL
 sC+cEYKXDiQgjynyzRYF1jUFFvQxKH7fmjyQig=; b=FMALCc8XrYq7fgwTm/Ozc
 5qzjGNkMaeFWGTT0HLZ7O/s+xIAnq4uWNYpe+Wck7fN0/7U86No2lShM4XLJK1wA
 pS6C/qQxm0fwz/CTa/GZMXic50mKfoTwyEu2GvZ9JX9wPfvXKnTdTgIEospZj+2z
 JeSHAd320/bDWbDNFnenR0=
Received: from ProDesk.. (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgBHPRKh8YBn2sBEEQ--.4640S12;
 Fri, 10 Jan 2025 18:08:47 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v10 10/11] dt-bindings: display: vop2: Add rk3576 support
Date: Fri, 10 Jan 2025 18:08:25 +0800
Message-ID: <20250110100832.27551-11-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110100832.27551-1-andyshrk@163.com>
References: <20250110100832.27551-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgBHPRKh8YBn2sBEEQ--.4640S12
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr1kWFW7tFW7JF18AF1rtFb_yoWrAFyrpa
 93CFyDX3y8Gr1UWw4ktFn5Cws5tFn5Aw4akrn7ta17Kws0qF4kGw4agr1DJr13Wr42vaya
 9FsYk347G3sIvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0FALUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g3QXmeA8KYWwAAAs2
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

Changes in v10:
- Move interrupt-names back to top level
- Add constraint of interrupts for all platform
- Add constraint for all grf phandles
- Reorder some properties

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

 .../display/rockchip/rockchip-vop2.yaml       | 101 +++++++++++++++---
 1 file changed, 87 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
index 2531726af306..3bae71142018 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop2.yaml
@@ -14,12 +14,14 @@ description:
 maintainers:
   - Sandy Huang <hjc@rock-chips.com>
   - Heiko Stuebner <heiko@sntech.de>
+  - Andy Yan <andyshrk@163.com>
 
 properties:
   compatible:
     enum:
       - rockchip,rk3566-vop
       - rockchip,rk3568-vop
+      - rockchip,rk3576-vop
       - rockchip,rk3588-vop
 
   reg:
@@ -37,10 +39,21 @@ properties:
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
+    items:
+      - const: sys
+      - const: vp0
+      - const: vp1
+      - const: vp2
 
   # See compatible-specific constraints below.
   clocks:
@@ -120,43 +133,102 @@ allOf:
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
+
+        interrupts:
+          minItems: 1
+          maxItems: 1
+
+        interrupt-names: false
 
         ports:
           required:
             - port@0
             - port@1
             - port@2
-            - port@3
+
+        rockchip,vo1-grf: false
+        rockchip,vop-grf: false
+        rockchip,pmu: false
 
       required:
         - rockchip,grf
-        - rockchip,vo1-grf
-        - rockchip,vop-grf
-        - rockchip,pmu
 
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-vop
+    then:
       properties:
+        clocks:
+          minItems: 5
+
+        clock-names:
+          minItems: 5
+
+        interrupts:
+          minItems: 4
+          maxItems: 4
+
+        interrupt-names:
+          minItems: 4
+          maxItems: 4
+
+        ports:
+          required:
+            - port@0
+            - port@1
+            - port@2
+
         rockchip,vo1-grf: false
         rockchip,vop-grf: false
-        rockchip,pmu: false
 
+      required:
+        - rockchip,grf
+        - rockchip,pmu
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-vop
+    then:
+      properties:
         clocks:
-          maxItems: 5
+          minItems: 7
+
         clock-names:
-          maxItems: 5
+          minItems: 7
+
+        interrupts:
+          minItems: 1
+          maxItems: 1
+
+        interrupt-names: false
 
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
 
@@ -184,6 +256,7 @@ examples:
                               "dclk_vp1",
                               "dclk_vp2";
                 power-domains = <&power RK3568_PD_VO>;
+                rockchip,grf = <&grf>;
                 iommus = <&vop_mmu>;
                 vop_out: ports {
                     #address-cells = <1>;
-- 
2.34.1

