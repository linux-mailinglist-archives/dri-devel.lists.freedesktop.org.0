Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E082A57B13
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 15:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FFC10E231;
	Sat,  8 Mar 2025 14:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cYcQFwWW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BE110E231
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Mar 2025 14:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UjRZWbLEME+WuQHUi6XOzLrc6/fGINrz8TDoRoVZM84=; b=cYcQFwWWPkCWTfWbHJ4BVYzzon
 a0knsqMYdondMPOAEiMFLl6o5gm/5NbFJhmXPA6mQZygC1CxOWLUOR4MQb8QEEtNRuxikiwyw8HAq
 fTaQsHJgDNoVuTQNLZqOAHWYp68U4sytzrWyJPbAcG65yYx/mfMYUOgIXumQrmeyTzqtQwnheECoY
 KQak5oIQiLj9s/XrQIwfc5XC3VM9ga283f96KUGANDe1IP/fItqdStXFE7EdXNWKZ5+NQdyiIEugV
 ldpEz5qomvI9bIPWRXT2LaQt8O12D4MNmGSVU43UockRo9kKlUQqB0jdzpOd/00mX4dI097W+Cmj0
 lEZF/rWQ==;
Received: from [189.7.87.170]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tqvFt-005pPS-Rh; Sat, 08 Mar 2025 15:34:27 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 08 Mar 2025 11:33:43 -0300
Subject: [PATCH v2 4/6] dt-bindings: gpu: v3d: Add SMS to the registers' list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250308-v3d-gpu-reset-fixes-v2-4-2939c30f0cc4@igalia.com>
References: <20250308-v3d-gpu-reset-fixes-v2-0-2939c30f0cc4@igalia.com>
In-Reply-To: <20250308-v3d-gpu-reset-fixes-v2-0-2939c30f0cc4@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, devicetree@vger.kernel.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2985; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=mjJ8aBksw1UwkCYqGMcU6WAF4b3rkyrnGleWp560Vb8=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBnzFVitKBWN01vstWvf6hCiuKtukaUDcQL7W3Nd
 UodbjWaSPCJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ8xVYgAKCRA/8w6Kdoj6
 qvjUB/4gRMiWRJGPEm1E44Kuis6jlXba6P8PXGAIBM50qJVc5ilEwxcNQUgbqqgGQIAJL3hQZEv
 EcE3uLx01142inO8hBUjz9Hf3c4j6MeAB+yu8oqi0a0CtA2rciFBTS/KvtL8UD/83XUuTFXfAU2
 HZsI0OP08onUtu2sbWy8S3xcAdBFbKz6WGztLnJTkjDWLF1HwtD45jJ7rM6r+SA/8sAL4Y2q1Ug
 4N+HqVLW+YQNj/k1rIgIiX/z4hlYBiEOpggsEodqZPnY7WPkQql1bihQtew2V3ZisdlkeuBf/YG
 0/pL7Xczzl3yyMSTjlpex3G/U8gAiIETSFkErHFlX/8KvPyo
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

V3D 7.1 exposes a new register block, called V3D_SMS. As BCM2712 has a
V3D 7.1 core, add a new register item to the list. Similar to the GCA
and bridge register, SMS is optional and should only be added for V3D
7.1 variants.

In order to enforce per-SoC register rules, add per-compatible
restrictions. The restrictions will assure that GCA will only be added
in BCM7268 (V3D 3.3) and SMS will only be added in BCM2712 (V3D 7.1).

Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 60 ++++++++++++++++++++--
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
index dc078ceeca9ac3447ba54a7c8830821f0b2a7f9f..c0caee055e8c18dbcac0e51aa192951996545695 100644
--- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
+++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
@@ -27,15 +27,12 @@ properties:
       - description: core0 register (required)
       - description: GCA cache controller register (if GCA controller present)
       - description: bridge register (if no external reset controller)
+      - description: SMS register (if SMS controller present)
     minItems: 2
 
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
@@ -60,6 +57,59 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - brcm,2711-v3d
+              - brcm,7278-v3d
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 3
+        reg-names:
+          items:
+            - const: hub
+            - const: core0
+            - const: bridge
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,2712-v3d
+    then:
+      properties:
+        reg:
+          minItems: 3
+          maxItems: 4
+        reg-names:
+          items:
+            - const: hub
+            - const: core0
+            - enum: [ bridge, sms ]
+            - enum: [ bridge, sms ]
+          minItems: 3
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: brcm,7268-v3d
+    then:
+      properties:
+        reg:
+          minItems: 3
+          maxItems: 4
+        reg-names:
+          items:
+            - const: hub
+            - const: core0
+            - enum: [ bridge, gca ]
+            - enum: [ bridge, gca ]
+          minItems: 3
+
 examples:
   - |
     gpu@f1200000 {

-- 
Git-154)

