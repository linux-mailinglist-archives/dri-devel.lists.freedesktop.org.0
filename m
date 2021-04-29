Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD0E36EAE5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F89A6EE99;
	Thu, 29 Apr 2021 12:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FA06EE99
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:52:59 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
 by albert.telenet-ops.be with bizsmtp
 id ycny2400J4p6Y3806cnyRw; Thu, 29 Apr 2021 14:47:58 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lc65F-001FCA-V3; Thu, 29 Apr 2021 14:47:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lc65F-009Vyy-5n; Thu, 29 Apr 2021 14:47:57 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] dt-bindings: display: renesas,
 du: Add missing power-domains property
Date: Thu, 29 Apr 2021 14:47:56 +0200
Message-Id: <600d42256515f180bc84b72e8bdb5c5d9126ab62.1619700459.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"make dtbs_check" complains:

    arch/arm/boot/dts/r8a7779-marzen.dt.yaml: display@fff80000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
    arch/arm64/boot/dts/renesas/r8a77970-v3msk.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
    arch/arm64/boot/dts/renesas/r8a77970-eagle.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
    arch/arm64/boot/dts/renesas/r8a77980-condor.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
    arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'

Fix this by documenting the power-domains property.

Fixes: 99d66127fad25ebb ("dt-bindings: display: renesas,du: Convert binding to YAML")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/display/renesas,du.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index e955034da53b86e2..0dad87cdd8735542 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -51,6 +51,9 @@ properties:
   resets: true
   reset-names: true
 
+  power-domains:
+    maxItems: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/port
     description: |
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
