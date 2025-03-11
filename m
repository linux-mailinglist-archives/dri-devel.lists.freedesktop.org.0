Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7701A5CD86
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 19:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3550310E664;
	Tue, 11 Mar 2025 18:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="O6RjmMh0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB9610E664
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 18:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ajacH/5tpV7Kup0244QZuNY5yBxLr83dWQ4c5DKHADI=; b=O6RjmMh0uA3tUShaDPVlSE8zOG
 hdWA5BU6WTlgoi8i/ac3IU3fYV8DYwn3PxbpYl+YNxOI3PiHmxNQQjrQ9BF1PoaKb6YhpLVjR8Wh/
 Dp3Avffqf1ZpCF9eVD2oFjcV1cZx97cmyxYvZBo9a93wTfJL36JJfCu++sDvXYuLwObgfB7/cC954
 r8CBGQtjqt76CeE7NAc1CYSWITW3Y8A74aFFIjoHP7/3yfpphjmU/Dbz2y5E9dpJhuITJgpAttjA2
 8uCBp3KfTTptSPC6qFBeyR906XMcI3C9UdY0lGymr3KLG/jdgBf9c7zkR/2oU/FWVFwE2I50nssWS
 cwYy62iw==;
Received: from [189.7.87.170] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ts47X-007Dal-FV; Tue, 11 Mar 2025 19:14:33 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 11 Mar 2025 15:13:46 -0300
Subject: [PATCH v3 4/7] dt-bindings: gpu: v3d: Add per-compatible register
 restrictions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250311-v3d-gpu-reset-fixes-v3-4-64f7a4247ec0@igalia.com>
References: <20250311-v3d-gpu-reset-fixes-v3-0-64f7a4247ec0@igalia.com>
In-Reply-To: <20250311-v3d-gpu-reset-fixes-v3-0-64f7a4247ec0@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, kernel-dev@igalia.com, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2902; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=JdgqvNtflpyoyBlk5wlUALSmD1sKQ5OFdVDxI+f36aI=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBn0H113io2C0Sra1qQBDb0Ch+rOlj1JgbHC/0D/
 a5Nz8ICE5SJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ9B9dQAKCRA/8w6Kdoj6
 qqxQB/9LIQguOlcXnPMDcZVgxhQGr+58zDNLs2XfMJvKzyqDp2DfJ2k/FBFLVFJAy5LxVauuZtC
 crOE3gm0Jh81uUiuAXuYJmja9+XANYnQbWeeQ9m4M1jfwD/3hj81OniILUdfP8SXRWlIcpsifUt
 ScV1cckfF2nHQQCkUuZeysNg7b8vGOfrp+agz+AHO7Hd/iPG1CsxqVWd+B5Pvedbl40+bJCudDt
 IEsgp/BRaHhp8Jv67DfI389d3coutgy8MQfqKT6t+r/kPol+JWp+z1r5BcTq28w1If2MwBytdR5
 i4qpUbeZKx3g74RlcnEkUshw1qWgnsQDWgy7FEHLJiPjAMeg
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

In order to enforce per-SoC register rules, add per-compatible
restrictions. V3D 3.3 (represented by brcm,7268-v3d) has a cache
controller (GCA), which is not present in other V3D generations.
Declaring these differences helps ensure the DTB accurately reflect
the hardware design.

While not ideal, this commit keeps the register order flexible for
brcm,7268-v3d with the goal to keep the ABI backwards compatible.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 55 ++++++++++++++++++----
 1 file changed, 45 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
index dc078ceeca9ac3447ba54a7c8830821f0b2a7f9f..141f2ed540bb4ddb85a933d7d44a4078c386ba39 100644
--- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
+++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
@@ -22,20 +22,12 @@ properties:
       - brcm,7278-v3d
 
   reg:
-    items:
-      - description: hub register (required)
-      - description: core0 register (required)
-      - description: GCA cache controller register (if GCA controller present)
-      - description: bridge register (if no external reset controller)
     minItems: 2
+    maxItems: 4
 
   reg-names:
-    items:
-      - const: hub
-      - const: core0
-      - enum: [ bridge, gca ]
-      - enum: [ bridge, gca ]
     minItems: 2
+    maxItems: 4
 
   interrupts:
     items:
@@ -58,6 +50,49 @@ required:
   - reg-names
   - interrupts
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,2711-v3d
+              - brcm,2712-v3d
+              - brcm,7278-v3d
+    then:
+      properties:
+        reg:
+          items:
+            - description: hub register (required)
+            - description: core0 register (required)
+            - description: bridge register (if no external reset controller)
+        reg-names:
+          items:
+            - const: hub
+            - const: core0
+            - const: bridge
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,7268-v3d
+    then:
+      properties:
+        reg:
+          items:
+            - description: hub register (required)
+            - description: core0 register (required)
+            - description: GCA cache controller register (required)
+            - description: bridge register (if no external reset controller)
+          minItems: 3
+        reg-names:
+          items:
+            - const: hub
+            - const: core0
+            - enum: [ bridge, gca ]
+            - enum: [ bridge, gca ]
+          minItems: 3
+
 additionalProperties: false
 
 examples:

-- 
Git-154)

