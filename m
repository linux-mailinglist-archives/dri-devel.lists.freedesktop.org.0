Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F328D36EAE4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192866E24D;
	Thu, 29 Apr 2021 12:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Thu, 29 Apr 2021 12:52:36 UTC
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4012C6E24D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:52:36 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
 by albert.telenet-ops.be with bizsmtp
 id ycnY2400y4p6Y3806cnYMf; Thu, 29 Apr 2021 14:47:33 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lc64q-001FC4-Bg; Thu, 29 Apr 2021 14:47:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lc64p-009Vw9-Ud; Thu, 29 Apr 2021 14:47:31 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] dt-bindings: display: renesas,
 du: Make resets optional on R-Car H1
Date: Thu, 29 Apr 2021 14:47:31 +0200
Message-Id: <2da75fd2e971dfab8dd05a2a28bb1d6d9cbe5adb.1619700420.git.geert+renesas@glider.be>
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

The "resets" property is not present on R-Car Gen1 SoCs.
Supporting it would require migrating from renesas,cpg-clocks to
renesas,cpg-mssr.

Reflect this in the DT bindings by removing the global "required:
resets".  All SoCs that do have "resets" properties already have
SoC-specific rules making it required.

Fixes: 99d66127fad25ebb ("dt-bindings: display: renesas,du: Convert binding to YAML")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/display/renesas,du.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index 552a99ce4f1280d7..e955034da53b86e2 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -89,7 +89,6 @@ required:
   - reg
   - clocks
   - interrupts
-  - resets
   - ports
 
 allOf:
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
