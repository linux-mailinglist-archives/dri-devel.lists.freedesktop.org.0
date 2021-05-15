Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33264381B07
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 22:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B6F6E43A;
	Sat, 15 May 2021 20:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDF86E43A
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 20:39:53 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8EAA781CD1;
 Sat, 15 May 2021 22:39:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1621111190;
 bh=djzY4tmJ8xS65obV3JnFAexto6vglwPAZBqoPNyM52s=;
 h=From:To:Cc:Subject:Date:From;
 b=L5qr5F0xRb6w18zuJtLf9es4bH6I6fnWHId4E9dzAs8nAR+3e12cWgOJ0bNRRxDqf
 Nit+Vl6MesKIcPjQxKXR1JgT95pbH1bP93FhLTOzB74LapAUX4HOV6FRnFne/NkoFn
 a1J0tKfBl2yDjiTL7oa5mLDIiB1Q/nkFLMR3uhJKEm6iSR7z5C+oBfMVinKMA54VAt
 ma37/nrIzh/9nhSaf3iEc7vuzPoAwoSV16hkngnMDO7fGM6TuMo2Dmn0EpfcpR/M7N
 WM4QHsD9eo3YsiB7M+LGzERzAMtnhZXS9OYvJPvk53eWBsD+kKazqGTDzePgaae4oU
 keMZG7MgopNYg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dt-bindings: display: bridge: lvds-codec: Fix spacing
Date: Sat, 15 May 2021 22:39:32 +0200
Message-Id: <20210515203932.366799-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, ch@denx.de,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing spaces to make the diagrams readable, no functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
 .../devicetree/bindings/display/panel/lvds.yaml      | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
index 31164608ba1d..06d7ca692d0d 100644
--- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
@@ -52,9 +52,9 @@ properties:
         [VESA] specifications. Data are transferred as follows on 3 LVDS lanes.
 
       Slot	    0       1       2       3       4       5       6
-            ________________                         _________________
+                ________________                         _________________
       Clock	                \_______________________/
-              ______  ______  ______  ______  ______  ______  ______
+                  ______  ______  ______  ______  ______  ______  ______
       DATA0	><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
       DATA1	><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
       DATA2	><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
@@ -63,9 +63,9 @@ properties:
         specifications. Data are transferred as follows on 4 LVDS lanes.
 
       Slot	    0       1       2       3       4       5       6
-            ________________                         _________________
+                ________________                         _________________
       Clock	                \_______________________/
-              ______  ______  ______  ______  ______  ______  ______
+                  ______  ______  ______  ______  ______  ______  ______
       DATA0	><__G2__><__R7__><__R6__><__R5__><__R4__><__R3__><__R2__><
       DATA1	><__B3__><__B2__><__G7__><__G6__><__G5__><__G4__><__G3__><
       DATA2	><_CTL2_><_CTL1_><_CTL0_><__B7__><__B6__><__B5__><__B4__><
@@ -75,9 +75,9 @@ properties:
         Data are transferred as follows on 4 LVDS lanes.
 
       Slot	    0       1       2       3       4       5       6
-            ________________                         _________________
+                ________________                         _________________
       Clock	                \_______________________/
-              ______  ______  ______  ______  ______  ______  ______
+                  ______  ______  ______  ______  ______  ______  ______
       DATA0	><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
       DATA1	><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
       DATA2	><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
-- 
2.30.2

