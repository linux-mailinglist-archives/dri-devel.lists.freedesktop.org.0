Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78D619EE8A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 01:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6016E210;
	Sun,  5 Apr 2020 23:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9D66E210
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 23:23:35 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DE3455B;
 Mon,  6 Apr 2020 01:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586129014;
 bh=+/XaYCs9W6yUiUL7Vpo5+kMlD9YLeRrKjQGhH8YMopY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DinIXq9fjU/1yBUKwPZxzWNl7Q3uDXS+nkKbVuV0L77+cWZidtUOzvNPtbkFtfYLv
 h8qJlQB6Rwoe+Z1zPWCVc+Qsta+ShxLTyFLBkiz35cQFSNOmtxVYehHEme8L0CpLJQ
 sTfgNBVHnJAOdH+bjMaoyKjwtD58VO6S8b82FP/Q=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: display: bridge: Reject additional
 properties in ports node
Date: Mon,  6 Apr 2020 02:23:15 +0300
Message-Id: <20200405232318.26833-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
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
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the #address-cells and #size-cells properties of the ports node
in the schemas of the bridge DT bindings, and set additionalProperties
to false to reject additional properties.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../devicetree/bindings/display/bridge/anx6345.yaml       | 8 ++++++++
 .../devicetree/bindings/display/bridge/lvds-codec.yaml    | 8 ++++++++
 .../devicetree/bindings/display/bridge/ps8640.yaml        | 8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/anx6345.yaml b/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
index c21103869923..8c0e4f285fbc 100644
--- a/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/anx6345.yaml
@@ -37,6 +37,12 @@ properties:
     type: object
 
     properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
       port@0:
         type: object
         description: |
@@ -51,6 +57,8 @@ properties:
     required:
       - port@0
 
+    additionalProperties: false
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 8f373029f5d2..800c63764e71 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -50,6 +50,12 @@ properties:
       This device has two video ports. Their connections are modeled using the
       OF graph bindings specified in Documentation/devicetree/bindings/graph.txt
     properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
       port@0:
         type: object
         description: |
@@ -66,6 +72,8 @@ properties:
       - port@0
       - port@1
 
+    additionalProperties: false
+
   powerdown-gpios:
     description:
       The GPIO used to control the power down line of this device.
diff --git a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
index 5dff93641bea..7e27cfcf770d 100644
--- a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
@@ -50,6 +50,12 @@ properties:
       Documentation/devicetree/bindings/media/video-interfaces.txt
       Documentation/devicetree/bindings/graph.txt
     properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
       port@0:
         type: object
         description: |
@@ -63,6 +69,8 @@ properties:
     required:
       - port@0
 
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
