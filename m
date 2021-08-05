Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F23713E1346
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1A56E7D7;
	Thu,  5 Aug 2021 10:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BE06E7D7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 10:53:12 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6425E51D;
 Thu,  5 Aug 2021 12:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628160790;
 bh=D6L9mOgk5qzChQ79zcoB5p8OW9cewqtNcuOf+NbmHYk=;
 h=From:To:Cc:Subject:Date:From;
 b=flhYAJ6BPEtsYG5TBJcMpa8+T1WmU+IwVFwwcyZyz7AEjgweuUFcx+K7+p7mTMNad
 oG1URnshDzZrd9lHvNaDXgGkZH1IL/jST4DtjhOIfQtzX5qJYPLrRWdUX0LAD9cdeM
 4EMsttIpNz6iKM2RlFwRsWk43z/4hM1R9Y1ihark=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Tomi Valkeinen <tomba@kernel.org>
Subject: [PATCH] drm/omap: Depend on CONFIG_OF
Date: Thu,  5 Aug 2021 13:52:54 +0300
Message-Id: <20210805105254.11834-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
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

The driver accesses the drm_bridge.of_node field, which is present only
if CONFIG_OF is enabled. As all platforms using omapdrm are OF-based, we
can simply depend on CONFIG_OF.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index e7281da5bc6a..999f1ca42849 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_OMAP
 	tristate "OMAP DRM"
-	depends on DRM
+	depends on DRM && OF
 	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
 	select OMAP2_DSS
 	select DRM_KMS_HELPER
-- 
Regards,

Laurent Pinchart

