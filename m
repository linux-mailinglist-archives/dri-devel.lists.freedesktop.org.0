Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AFF77DF2C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 12:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C78E10E33A;
	Wed, 16 Aug 2023 10:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A65A10E32E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 10:44:42 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.187.55])
 by baptiste.telenet-ops.be with bizsmtp
 id aAki2A00Q1C8whw01Akiki; Wed, 16 Aug 2023 12:44:42 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qWE0y-000otO-2C;
 Wed, 16 Aug 2023 12:44:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qWDAw-00674A-BT;
 Wed, 16 Aug 2023 11:50:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 01/41] MAINTAINER: Create entry for Renesas SH-Mobile DRM
 drivers
Date: Wed, 16 Aug 2023 11:50:08 +0200
Message-Id: <52e8883c340e354e2a928998146709420bdb3d52.1692178020.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692178020.git.geert+renesas@glider.be>
References: <cover.1692178020.git.geert+renesas@glider.be>
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

v3:
  - No changes,

v2:
  - New.
---
 MAINTAINERS | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9cf561aca347709..c454b0186fd669dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7007,7 +7007,7 @@ F:	drivers/gpu/host1x/
 F:	include/linux/host1x.h
 F:	include/uapi/drm/tegra_drm.h
 
-DRM DRIVERS FOR RENESAS
+DRM DRIVERS FOR RENESAS R-CAR
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
@@ -7018,7 +7018,15 @@ F:	Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
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

