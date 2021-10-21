Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACB84362D7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 15:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593C66EC61;
	Thu, 21 Oct 2021 13:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0628D6EC61
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 13:24:54 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2c41:c2bf:5c8f:53c5])
 by andre.telenet-ops.be with bizsmtp
 id 8dKr2600E1Z5S4H01dKrfC; Thu, 21 Oct 2021 15:19:51 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mdXz5-006ZBW-0m; Thu, 21 Oct 2021 15:19:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mdXz4-00GQCf-2v; Thu, 21 Oct 2021 15:19:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomba@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: display: tilcd: Fix endpoint adressing in example
Date: Thu, 21 Oct 2021 15:19:49 +0200
Message-Id: <c58b9cdcd09cf669bb63cd9465d0f75dd66e742c.1634822358.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Remove the bogus unit addresses from the endpoints in the example.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
index 3e64075ac7ece2a1..3b3d0bbfcfff443c 100644
--- a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
+++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.txt
@@ -60,7 +60,7 @@ Example:
 		blue-and-red-wiring = "crossed";
 
 		port {
-			lcdc_0: endpoint@0 {
+			lcdc_0: endpoint {
 				remote-endpoint = <&hdmi_0>;
 			};
 		};
@@ -75,7 +75,7 @@ Example:
 		pinctrl-1 = <&nxp_hdmi_bonelt_off_pins>;
 
 		port {
-			hdmi_0: endpoint@0 {
+			hdmi_0: endpoint {
 				remote-endpoint = <&lcdc_0>;
 			};
 		};
-- 
2.25.1

