Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D853734D84
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 10:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F099010E1AD;
	Mon, 19 Jun 2023 08:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE8B10E1AF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 08:23:40 +0000 (UTC)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA909800;
 Mon, 19 Jun 2023 10:23:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687162984;
 bh=YwgyUNLKModIpQ/Mz7nAbItfENwBjSygXWSBPz0fiek=;
 h=From:To:Cc:Subject:Date:From;
 b=QtvsPnddxHxezVpntY/npZovZZn0IpUse6U07/FzRIZv6xE3YlFCDPyfqKXTbUiB8
 f78bSvZu7DYBODNSqw5W9QpABTVn01d+Wrf57chmWa0qnJ48sPMTsYDsdtSsJD5zrP
 8r8yixOq8rKz6IrYIuOsDAENH11wHFRgY5Z9ED/g=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>
Subject: [PATCH] MAINTAINERS: Update info for TI display drivers
Date: Mon, 19 Jun 2023 11:23:23 +0300
Message-Id: <20230619082323.20575-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add drm-misc as the git tree for tilcdc and omapdrm. Change Tomi's email
to point to ideasonboard.com instead of kernel.org.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 MAINTAINERS | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa0aa6c31772..29f242734eee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7014,7 +7014,7 @@ F:	drivers/gpu/drm/stm
 
 DRM DRIVERS FOR TI KEYSTONE
 M:	Jyri Sarha <jyri.sarha@iki.fi>
-M:	Tomi Valkeinen <tomba@kernel.org>
+M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
@@ -7025,16 +7025,18 @@ F:	drivers/gpu/drm/tidss/
 
 DRM DRIVERS FOR TI LCDC
 M:	Jyri Sarha <jyri.sarha@iki.fi>
-R:	Tomi Valkeinen <tomba@kernel.org>
+M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/tilcdc/
 F:	drivers/gpu/drm/tilcdc/
 
 DRM DRIVERS FOR TI OMAP
-M:	Tomi Valkeinen <tomba@kernel.org>
+M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/ti/
 F:	drivers/gpu/drm/omapdrm/
 
-- 
2.34.1

