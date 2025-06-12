Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB508AD75AF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372B410E8A0;
	Thu, 12 Jun 2025 15:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="fhg1WqRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8763E10E8A9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 15:20:07 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 43C2626065;
 Thu, 12 Jun 2025 17:20:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZLghuaa8o59; Thu, 12 Jun 2025 17:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1749741603; bh=gTjvfwIft0zOYqMzvPWu+tpH9F/eoLvFl3Vm+gEuo2U=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=fhg1WqRcOltyD8/HdHPYHktTBYw6J0gkI9V3H/p2eCAvYod4AFivQwwiffrBd4DDH
 C7aGs65oLOBfFdrx0sOjQ+hs6AsM53TtAmPa94+oTaDjXHlDPfGoXIa3vJZXGis52L
 o7mCRFM2m+fhdtEEMhbRVDHd3MvD0GKQUlCxDIP4y5+rRhIqZGCLnHQRnROcQisQwC
 96j56gHoKzS4qEaearRb2rdgbgl04qwC9X/6oRTRcSzYJkn8pF9H7hsd8nzOL+OMzF
 C1yc28hdFyVNMGeMy0E9FkghPLmgKz5KgwXxo05Tkqf7f0dtgbsNN2g0MY5crKTOMu
 jYQSCIlmyTT1Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:14 +0530
Subject: [PATCH 10/12] dt-bindings: samsung,mipi-dsim: document exynos7870
 DSIM compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-10-1a330bca89df@disroot.org>
References: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
In-Reply-To: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=1756;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=gTjvfwIft0zOYqMzvPWu+tpH9F/eoLvFl3Vm+gEuo2U=;
 b=ufmNp6zr5Z1H2KmNf5QlVyiVd8w6ILSOscwAY9EKjp0sjOYTzRrZdK2m49hTE8q6hQ22W71p2
 CibhNIBNSNwBKIBFn2dA8afwDoYyoMOe+aELMzc5xZdu+/W/XJNUYtV
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
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

Add compatible string for Exynos7870 DSIM bridge controller. The
devicetree node requires four clock sources, named:
- bus_clk
- phyclk_mipidphy0_bitclkdiv8
- phyclk_mipidphy0_rxclkesc0
- sclk_mipi

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/display/bridge/samsung,mipi-dsim.yaml | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index 1acad99f396527192b6853f0096cfb8ae5669e6b..887f3ba1edd24a177a766b1b523d0c197ff1123a 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -24,6 +24,7 @@ properties:
           - samsung,exynos5410-mipi-dsi
           - samsung,exynos5422-mipi-dsi
           - samsung,exynos5433-mipi-dsi
+          - samsung,exynos7870-mipi-dsi
           - fsl,imx8mm-mipi-dsim
           - fsl,imx8mp-mipi-dsim
       - items:
@@ -144,6 +145,31 @@ required:
 
 allOf:
   - $ref: ../dsi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-mipi-dsi
+
+    then:
+      properties:
+        clocks:
+          minItems: 4
+
+        clock-names:
+          items:
+            - const: bus_clk
+            - const: phyclk_mipidphy0_bitclkdiv8
+            - const: phyclk_mipidphy0_rxclkesc0
+            - const: sclk_mipi
+
+        ports:
+          required:
+            - port@0
+
+      required:
+        - ports
+
   - if:
       properties:
         compatible:

-- 
2.49.0

