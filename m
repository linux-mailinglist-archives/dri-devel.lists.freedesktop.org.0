Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163CABDF6DE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 17:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE8E10E845;
	Wed, 15 Oct 2025 15:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="GyCp40ut";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VneQcRni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CC610E849
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 15:40:27 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cmwJn6tv6z9tV5;
 Wed, 15 Oct 2025 17:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760542826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6+5qS86AUVC6bRT92KLIuo619twokSRObf676Q+SPc4=;
 b=GyCp40utFwUbHBAVYke6cLZ61zeBsVmhxHvoFg5duEMXrn/hPHwZL5xBQZY311g863Plyn
 lWXbuOv152dvPCgBsnFw/XDXeje7A8e4Y6dg01y+pcvLsrEISUxx6uP09e9khmn7SVlews
 zzMhA/xZUASVaP+MIaREwB16QzyNccxIfbSqMVFP82lQUZaAPaYU76KlMHKorFZqFC8Hnz
 /I7rR0XsvsOD3nQ/C9Pt6aQ32Pf+pv+5HoEoV7THSL6HVHIQVwQCeU8x0P1pxxId4QS/kW
 3m+k1hrDmnk4VXjFQe4XRJv0YTVdz5EGD3Lzk0Q6t3j1Nchwnvl+fJunYXxO1w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760542823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6+5qS86AUVC6bRT92KLIuo619twokSRObf676Q+SPc4=;
 b=VneQcRnidwu6dWaWawE0KZHkFrbklqqyPsGeRb3M/tE4NMnszWN8PYPp89NL6UNe0kkYlf
 5eKWm2qFf6BLrLo62V/RU/SdvCQD+URDLe773U5rX1XPPwAwzGVVCjF9yB6iMauOc76M16
 vq9ESPGPSHbVVMhbtn4HG1So3iDpVXi75vfO9jLZ2PR5jEBjU/Rwc0kduYNJZisVN3ZJ8I
 URo9GJK374E8hjgQJdkhNi7n886pMnhINythYZBLUMQGJZDfIT53fT/aT0nLUfNsF6vqsg
 GCwl9s+V4/6TzTy78Jk1eAr/pPKbPS8vdDTPxDLNdUJvydWy0ObjyrHO8rCe7Q==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor.dooley@microchip.com>, Adam Ford <aford173@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: gpu: img,
 powervr-rogue: Document GX6250 GPU in Renesas R-Car M3-W/M3-W+
Date: Wed, 15 Oct 2025 17:38:56 +0200
Message-ID: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8c8d6cd9cc18a31f2bb
X-MBO-RS-META: x36nn1ic78som3741bjni5gpngooa4eh
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

Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
See https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/13
for related userspace bits.
---
V2: - Add RB from Conor
    - Fill in allOf section for Renesas GPU, set fixed clock/clock-names
      maxItems count to 3 and power-domains/power-domain-names count to 2.
    - Use renesas,r8a7796-gpu for R8A77960 compatible string
---
 .../bindings/gpu/img,powervr-rogue.yaml       | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index c87d7bece0ecd..05fe9498dfa09 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -13,6 +13,12 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - renesas,r8a7796-gpu
+              - renesas,r8a77961-gpu
+          - const: img,img-gx6250
+          - const: img,img-rogue
       - items:
           - enum:
               - ti,am62-gpu
@@ -146,6 +152,29 @@ allOf:
         clocks:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r8a7796-gpu
+              - renesas,r8a77961-gpu
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+        power-domains:
+          items:
+            - description: Power domain A
+            - description: Power domain B
+        power-domain-names:
+          minItems: 2
+      required:
+        - power-domains
+        - power-domain-names
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
-- 
2.51.0

