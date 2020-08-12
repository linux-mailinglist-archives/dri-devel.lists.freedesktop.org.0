Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 060812430AD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 00:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AF86E1A8;
	Wed, 12 Aug 2020 22:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA296E1A8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 22:03:09 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 799AC9E7;
 Thu, 13 Aug 2020 00:03:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597269785;
 bh=cTtWiT1oWG7EAcWzYIblyFceNh9TuZfl/LwJoHdvLIc=;
 h=From:To:Cc:Subject:Date:From;
 b=MyFCbRxTu8KuY2K/C76Yhc0bM4HEJC1hsdrnusJZbDMeiiUUiMgzjXqf8JaQXXhH0
 qF7or8gfY6/WWUccWic2Urd9SD5WDNRLSk+9ZbHxl9rErHCfI+8glMBm5WIEiUdk4F
 GlP9Y8xQP0uFPrgWfS2ePsbvS/9YD7pS+sMe0QX4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: panel: Fix bus format for OrtusTech COM43H4M85ULC panel
Date: Thu, 13 Aug 2020 01:02:44 +0300
Message-Id: <20200812220244.24500-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OrtusTech COM43H4M85ULC panel is a 18-bit RGB panel, set the bus
format to MEDIA_BUS_FMT_RGB666_1X18.

Fixes: 725c9d40f3fe ("drm/panel: Add support for OrtusTech COM43H4M85ULC panel")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index ef8df838fe14..ef04fd75babd 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3018,7 +3018,7 @@ static const struct panel_desc ortustech_com43h4m85ulc = {
 		.width = 56,
 		.height = 93,
 	},
-	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
