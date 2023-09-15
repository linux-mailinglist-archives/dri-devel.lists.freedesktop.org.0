Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B87FB7A19C4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 10:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3767B10E260;
	Fri, 15 Sep 2023 08:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E94110E5DE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 08:54:17 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7135:da8b:ba1d:1a7c])
 by albert.telenet-ops.be with bizsmtp
 id m8uE2A00K3q21w7068uEY6; Fri, 15 Sep 2023 10:54:14 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4aJ-003lFt-3P;
 Fri, 15 Sep 2023 10:54:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4ac-00Gdaj-4I;
 Fri, 15 Sep 2023 10:54:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 01/41] MAINTAINER: Create entry for Renesas SH-Mobile DRM
 drivers
Date: Fri, 15 Sep 2023 10:53:16 +0200
Message-Id: <7cbcec72214886b67afa8d724a9245661d8cd675.1694767208.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694767208.git.geert+renesas@glider.be>
References: <cover.1694767208.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split off DRM drivers for Renesas SH-Mobile into its own entry, and add
Geert Uytterhoeven as a maintainer.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Kieran: do you want to join the club, too? ;-)

v4:
  - No changes,

v3:
  - No changes,

v2:
  - New.
---
 MAINTAINERS | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ceab03332d749fc..70535048b6a96d55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7015,7 +7015,7 @@ F:	drivers/gpu/host1x/
 F:	include/linux/host1x.h
 F:	include/uapi/drm/tegra_drm.h
 
-DRM DRIVERS FOR RENESAS
+DRM DRIVERS FOR RENESAS R-CAR
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
@@ -7026,7 +7026,15 @@ F:	Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
 F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
 F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
 F:	Documentation/devicetree/bindings/display/renesas,du.yaml
-F:	drivers/gpu/drm/renesas/
+F:	drivers/gpu/drm/renesas/rcar-du/
+
+DRM DRIVERS FOR RENESAS SHMOBILE
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+M:	Geert Uytterhoeven <geert+renesas@glider.be>
+L:	dri-devel@lists.freedesktop.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	drivers/gpu/drm/renesas/shmobile/
 F:	include/linux/platform_data/shmob_drm.h
 
 DRM DRIVERS FOR ROCKCHIP
-- 
2.34.1

