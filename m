Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A665356730
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 10:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48096E05D;
	Wed,  7 Apr 2021 08:48:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E8C6E05D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 08:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1617785287; x=1620377287;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yMB2ODN8seHHMS1hiT11jE+iTAN5PqK567VDQ1P89rw=;
 b=liMC3Mk4do6bW2hgJkGCnK5T+OVthlPpGgAYV7hWpYk9KhtpmeAMwA2VxVlRAuzV
 6akc3kTwlnqWTpoJQ3EUL4xjFvC6gIHG+uV66V4zq8BBVTVw7aQWLN+BChvxXrRv
 FQyzsD6fdcSsl5cmMpPuGtqp7lTbZH5Dc09S8+2e1D4=;
X-AuditID: c39127d2-85cb770000001c91-d8-606d71c63e6c
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 34.73.07313.6C17D606;
 Wed,  7 Apr 2021 10:48:06 +0200 (CEST)
Received: from lws-ybas.phytec.de ([172.16.21.122])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021040710480689-34177 ;
 Wed, 7 Apr 2021 10:48:06 +0200 
From: Yunus Bas <y.bas@phytec.de>
To: thierry.reding@gmail.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/panel: simple: Add support for EDT ETMV570G2DHU
 panel
Date: Wed, 7 Apr 2021 10:48:33 +0200
Message-Id: <20210407084834.2198198-1-y.bas@phytec.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 07.04.2021 10:48:06,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 07.04.2021 10:48:06
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJLMWRmVeSWpSXmKPExsWyRoCBS/dYYW6Cwf/5Nha9504yWfzfNpHZ
 4srX92wWrXuPsFus+LmV0eLnrnksDmwee78tYPHYOesuu8emVZ1sHtu/PWD1uN99nMljybSr
 bAFsUVw2Kak5mWWpRfp2CVwZVz//ZiroFKh4MuM0UwPjZt4uRk4OCQETibNb2lm7GLk4hAS2
 MUoc657PBOGcZZToXtPBAlLFJqAocf72W1YQW0TAX+LpvB1gNrOApcT/A4vYQGxhgUCJT5fO
 M4PYLAIqEose3GMEsXkFzCSebOlihdgmL3Fy7WEmiLigxMmZT1hAlkkIXGGUeHHpCgtEkZDE
 6cVnmSEWaEssW/iaeQIj3ywkPbOQpBYwMq1iFMrNTM5OLcrM1ivIqCxJTdZLSd3ECAzOwxPV
 L+1g7JvjcYiRiYPxEKMEB7OSCO+O3uwEId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwbeEvChATS
 E0tSs1NTC1KLYLJMHJxSDYwpdYzeEibr9j4+t82ro3Si22O3M8a8HjEKb8SvRGiuebtli6DA
 9F+nPqb++nZ8TdFGngP75iRHhL322dZ/RFHpU1z0ssXVBq06C8957oxZvf5dAWuA5JMIZ+WV
 3+UfXpj9rP7q6QMfbz1jU7M8xL8tdemrS0/DjlcbpNoun2zkeWKv3ptD24WVlFiKMxINtZiL
 ihMBqKzooDwCAAA=
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
Cc: airlied@linux.ie, robh+dt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stefan Riedmueller <s.riedmueller@phytec.de>

This patch adds support for the EDT ETMV570G2DHU 5.7" (640x480) lcd panel
to DRM simple panel driver.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Signed-off-by: Yunus Bas <y.bas@phytec.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4e2dad314c79..283c17a75376 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1926,6 +1926,32 @@ static const struct panel_desc edt_et057090dhu = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct drm_display_mode edt_etmv570g2dhu_mode = {
+	.clock = 25175,
+	.hdisplay = 640,
+	.hsync_start = 640,
+	.hsync_end = 640 + 16,
+	.htotal = 640 + 16 + 30 + 114,
+	.vdisplay = 480,
+	.vsync_start = 480 + 10,
+	.vsync_end = 480 + 10 + 3,
+	.vtotal = 480 + 10 + 3 + 35,
+	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
+};
+
+static const struct panel_desc edt_etmv570g2dhu = {
+	.modes = &edt_etmv570g2dhu_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 115,
+		.height = 86,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode edt_etm0700g0dh6_mode = {
 	.clock = 33260,
 	.hdisplay = 800,
@@ -4226,6 +4252,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "edt,et057090dhu",
 		.data = &edt_et057090dhu,
+	}, {
+		.compatible = "edt,etmv570g2dhu",
+		.data = &edt_etmv570g2dhu,
 	}, {
 		.compatible = "edt,et070080dh6",
 		.data = &edt_etm0700g0dh6,
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
