Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF28BBF9D99
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 05:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C3010E12C;
	Wed, 22 Oct 2025 03:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="HVjSZzdB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pZTg+7RC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D86410E12C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 03:39:16 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4crvzP59zGz9tZ9;
 Wed, 22 Oct 2025 05:39:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761104353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=39rT+XhokNO2NN3dlFbS1lzXeQziRCXFI7W5KY5YjA4=;
 b=HVjSZzdB4B/SuznWkpy4c9URFolCuiRo9GuA21uuifCQa5qLv2sJ77UAnPnSyhIDoktJ7/
 N/Kt4DGWQLtZNHIc6RntfKGaAWl7JQ2Ltf6ur3pDI7oBhe54ldbd7h6qPEVeAYchmUEwe5
 tXIg4uxM9eXOglpE6F+UCHAwpi+ziyS9n5yCrRTSL0ULlNYhhd44EiG6ZTzWaJr3Gg94F5
 xre/In049qqh1/yxSWuxtICMOv8ZCEStKJr3tiZr1zYxELrLbSLkbyDifskcXu+HKH1uQG
 MOgO0K9ux5uWpMytYI891YbZ3UkKy+qSzKfvoijOzoTGzuVTvu5+al6yBwvc8w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761104351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=39rT+XhokNO2NN3dlFbS1lzXeQziRCXFI7W5KY5YjA4=;
 b=pZTg+7RC7tElUd5AKiWxIPGEIMio4ZSjWoDzC6Eudxr3yBEsnNRw2a4BWQv/ww3IsjSrHY
 aOMXiFAjvFdi9ZMCYbRpN2YOgaewe4N2Z+HD3ZMbhTTarWx2u8fZJ3g+Xa/eVwP6HjNNPH
 r+l6WeiycNM3h7xqf4m+BAoZ+7cq4pEFZ6YpAvln118JKqOzzpQLpNkKzYgDRaZq3SN0Ex
 pj8oVoCtyULWxg8TtcomVMhTmYBhVlIIL/R77ExY7LKSobB9l+U2HYRlXfvEKV9NLW1Tej
 OIdkSCfsqM3CGyTwHlGaqnKTdrzkrSLTJoM1tgmKCbwJ3oamSwvKLsoF005Lww==
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
Subject: [PATCH v3 1/3] dt-bindings: gpu: img,
 powervr-rogue: Document GX6250 GPU in Renesas R-Car M3-W/M3-W+
Date: Wed, 22 Oct 2025 05:37:55 +0200
Message-ID: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 276ab661eaf958c0013
X-MBO-RS-META: 36ubt5r5k9o8qy3jpzdijb8ruxmt9tyy
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
V3: Split up the allOf section addition
---
 .../bindings/gpu/img,powervr-rogue.yaml           | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 829febd8e0f40..aa8b2069cc24b 100644
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
@@ -94,11 +100,14 @@ allOf:
         clocks:
           maxItems: 1
 
+
   - if:
       properties:
         compatible:
           contains:
-            const: thead,th1520-gpu
+            enum:
+              - img,img-gx6250
+              - thead,th1520-gpu
     then:
       properties:
         clocks:
@@ -125,7 +134,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: img,img-bxs-4-64
+            enum:
+              - img,img-gx6250
+              - img,img-bxs-4-64
     then:
       properties:
         power-domains:
-- 
2.51.0

