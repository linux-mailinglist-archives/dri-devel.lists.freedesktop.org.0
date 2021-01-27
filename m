Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC918307123
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5366E955;
	Thu, 28 Jan 2021 08:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA216E039
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 11:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by comms.puri.sm (Postfix) with ESMTP id 3729DE01AC;
 Wed, 27 Jan 2021 03:49:17 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
 by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XSckDmWLb-WQ; Wed, 27 Jan 2021 03:49:16 -0800 (PST)
From: Martin Kepplinger <martin.kepplinger@puri.sm>
To: laurent.pinchart@ideasonboard.com, robh@kernel.org,
 daniel@ffwll.ch, airlied@linux.ie, stefan@agner.ch
Subject: [PATCH] dt-bindings: mxsfb: Add interconnect bindings for LCDIF path
Date: Wed, 27 Jan 2021 12:49:01 +0100
Message-Id: <20210127114901.26259-1-martin.kepplinger@puri.sm>
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: devicetree@vger.kernel.org, kernel@puri.sm,
 Martin Kepplinger <martin.kepplinger@puri.sm>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@pengutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add optional interconnect properties for the dram path requests.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index a4c3064c778c..44d744800a7c 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -50,6 +50,14 @@ properties:
   interrupts:
     maxItems: 1
 
+  interconnects:
+    items:
+      - description: Interconnect path between LCDIF and main memory
+
+  interconnect-names:
+    items:
+      - const: dram
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description: The LCDIF output port
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
