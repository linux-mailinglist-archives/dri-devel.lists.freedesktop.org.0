Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE7E386D1E
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 00:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D0D6E52C;
	Mon, 17 May 2021 22:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FCE6E52C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 22:43:54 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A4A4E8047F;
 Tue, 18 May 2021 00:43:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1621291433;
 bh=yGKE+8AB9tFQWV6h47Yj8Gn/yuNMlBin89Uo6YsPfqQ=;
 h=From:To:Cc:Subject:Date:From;
 b=JQynP8By8ZkkViJLFnQFqyZpcgAY6hj27B8mheqm64vbLfzsywBCtQnvPw5y49J0S
 vVK83l9727J1OJGNAT2ep7MhFSUM7toctPZUguXwuFMvlQ08BIcfebMzag4YWwNteM
 L+OA0+9WsL8NWEoyfCygLpKTU333pMKLlzG6aJOXeU1+lZEidD6SNw9nRyI1zsSNI7
 wNdmQUdfWlrKJVJcArl6u1BxQ/eUc0wsQiskdWiRs5krC9b0cD8BLa+aXLppPl2NBL
 3E8Z60EzRV7rrxM4dmTKjy0lNHjGjuix+hLebLmY7v+IvyLSjFLF4ZNl7kNaKHF6ip
 buqM/RThPoqKw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2] dt-bindings: display: Fix spacing in lvds.yaml
Date: Tue, 18 May 2021 00:43:36 +0200
Message-Id: <20210517224336.409301-1-marex@denx.de>
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
V2: Replace all the other tabs too
---
 .../bindings/display/panel/lvds.yaml          | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
index 31164608ba1d..49460c9dceea 100644
--- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
@@ -51,37 +51,37 @@ properties:
       - "jeida-18" - 18-bit data mapping compatible with the [JEIDA], [LDI] and
         [VESA] specifications. Data are transferred as follows on 3 LVDS lanes.
 
-      Slot	    0       1       2       3       4       5       6
-            ________________                         _________________
-      Clock	                \_______________________/
-              ______  ______  ______  ______  ______  ______  ______
-      DATA0	><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
-      DATA1	><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
-      DATA2	><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
+      Slot          0       1       2       3       4       5       6
+                ________________                         _________________
+      Clock                     \_______________________/
+                  ______  ______  ______  ______  ______  ______  ______
+      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
+      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
+      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
 
       - "jeida-24" - 24-bit data mapping compatible with the [DSIM] and [LDI]
         specifications. Data are transferred as follows on 4 LVDS lanes.
 
-      Slot	    0       1       2       3       4       5       6
-            ________________                         _________________
-      Clock	                \_______________________/
-              ______  ______  ______  ______  ______  ______  ______
-      DATA0	><__G2__><__R7__><__R6__><__R5__><__R4__><__R3__><__R2__><
-      DATA1	><__B3__><__B2__><__G7__><__G6__><__G5__><__G4__><__G3__><
-      DATA2	><_CTL2_><_CTL1_><_CTL0_><__B7__><__B6__><__B5__><__B4__><
-      DATA3	><_CTL3_><__B1__><__B0__><__G1__><__G0__><__R1__><__R0__><
+      Slot          0       1       2       3       4       5       6
+                ________________                         _________________
+      Clock                     \_______________________/
+                  ______  ______  ______  ______  ______  ______  ______
+      DATA0     ><__G2__><__R7__><__R6__><__R5__><__R4__><__R3__><__R2__><
+      DATA1     ><__B3__><__B2__><__G7__><__G6__><__G5__><__G4__><__G3__><
+      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B7__><__B6__><__B5__><__B4__><
+      DATA3     ><_CTL3_><__B1__><__B0__><__G1__><__G0__><__R1__><__R0__><
 
       - "vesa-24" - 24-bit data mapping compatible with the [VESA] specification.
         Data are transferred as follows on 4 LVDS lanes.
 
-      Slot	    0       1       2       3       4       5       6
-            ________________                         _________________
-      Clock	                \_______________________/
-              ______  ______  ______  ______  ______  ______  ______
-      DATA0	><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
-      DATA1	><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
-      DATA2	><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
-      DATA3	><_CTL3_><__B7__><__B6__><__G7__><__G6__><__R7__><__R6__><
+      Slot          0       1       2       3       4       5       6
+                ________________                         _________________
+      Clock                     \_______________________/
+                  ______  ______  ______  ______  ______  ______  ______
+      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
+      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
+      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
+      DATA3     ><_CTL3_><__B7__><__B6__><__G7__><__G6__><__R7__><__R6__><
 
       Control signals are mapped as follows.
 
-- 
2.30.2

