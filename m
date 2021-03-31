Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E869B3505FA
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 20:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3916E23F;
	Wed, 31 Mar 2021 18:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377C86E23B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 18:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1617214041; x=1619806041;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YZMJqTNp/4LksnzxcND5MXuojD93ibmTGwQRroCdndg=;
 b=a4nl4Hh/aBjXs/rJSrPhY80QeNqTFfV9Fi13MpPJyspyJNiQUedeTji3DtdcYsT9
 J1NpMBIlJfYk2imaREBFFV3E42n42brrmik4QKe936du3NyOGUIv9OpIy1TdyZ5/
 U+PZ92BiMJgKTj/AVokaplqESeZ/5MmWJgUCjSz89PI=;
X-AuditID: c39127d2-868b870000001c91-0c-6064ba59f961
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 8A.26.07313.95AB4606;
 Wed, 31 Mar 2021 20:07:21 +0200 (CEST)
Received: from lws-ybas.phytec.de ([172.16.21.122])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021033120072101-278029 ;
 Wed, 31 Mar 2021 20:07:21 +0200 
From: Yunus Bas <y.bas@phytec.de>
To: dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org
Subject: [PATCH v2 2/2] drm/panel: simple: Add support for EDT ETM0350G0DH6
 panel
Date: Wed, 31 Mar 2021 20:07:57 +0200
Message-Id: <20210331180757.463479-2-y.bas@phytec.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210331180757.463479-1-y.bas@phytec.de>
References: <20210331180757.463479-1-y.bas@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 31.03.2021 20:07:21,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 31.03.2021 20:07:21
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsWyRoCBSzdyV0qCwcUGLovecyeZLP5vm8hs
 ceXrezaLFT+3Mlr83DWPxYHVY++3BSweO2fdZffY/u0Bq8f97uNMHkumXWULYI3isklJzcks
 Sy3St0vgyvhw6BNzwQ+BikW/UxoYJ/J1MXJySAiYSPQ+7WTpYuTiEBLYxihxZd5TKOc8kPPx
 PgtIFZuAosT5229ZQWwRAX+JDbfXsoPYzAKqEi+fTgWrERYIlPh7qYMNxGYBiv9Zv54ZxOYV
 MJV42/uQFWKbvMTJtYeZQGxOATOJjic/weqFgGpebPzLBlEvKHFy5hOwIyQErjBKXP15mQ2i
 WUji9OKzzBCLtSWWLXzNPIFRYBaSnllIUgsYmVYxCuVmJmenFmVm6xVkVJakJuulpG5iBIbt
 4Ynql3Yw9s3xOMTIxMF4iFGCg1lJhFf4QGKCEG9KYmVValF+fFFpTmrxIUZpDhYlcd4NvCVh
 QgLpiSWp2ampBalFMFkmDk6pBsY563jl/et/JE13KJv5qSD89YIz7gc6RN4fE/8gEWjjmrhS
 qO/ypjp/JbPj9yuCwu0qD7g2zYjg+9V6S8S/pD9l23F90VrD+x2pjBd9l0Vd2jX/2KGVpS/K
 qn7HJb/far7TWu5ZHtP7Cb8nrd+0Wd12Remk+/ZTwxuvO8su+x5l0jktex/H32AlluKMREMt
 5qLiRACzpP33SQIAAA==
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
Cc: airlied@linux.ie
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stefan Riedmueller <s.riedmueller@phytec.de>

This patch adds support for the EDT ETM0350G0DH6 3.5" (320x240) lcd
panel to DRM simple panel driver.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Signed-off-by: Yunus Bas <y.bas@phytec.de>
---
Changes in v2:
- Splitted dt-bindings to separate patch
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 283c17a75376..70c25f6e642b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1847,6 +1847,32 @@ static const struct panel_desc edt_et035012dm6 = {
 	.bus_flags = DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
 };
 
+static const struct drm_display_mode edt_etm0350g0dh6_mode = {
+	.clock = 6520,
+	.hdisplay = 320,
+	.hsync_start = 320 + 20,
+	.hsync_end = 320 + 20 + 68,
+	.htotal = 320 + 20 + 68,
+	.vdisplay = 240,
+	.vsync_start = 240 + 4,
+	.vsync_end = 240 + 4 + 18,
+	.vtotal = 240 + 4 + 18,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc edt_etm0350g0dh6 = {
+	.modes = &edt_etm0350g0dh6_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 70,
+		.height = 53,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode edt_etm043080dh6gp_mode = {
 	.clock = 10870,
 	.hdisplay = 480,
@@ -4243,6 +4269,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "edt,et035012dm6",
 		.data = &edt_et035012dm6,
+	}, {
+		.compatible = "edt,etm0350g0dh6",
+		.data = &edt_etm0350g0dh6,
 	}, {
 		.compatible = "edt,etm043080dh6gp",
 		.data = &edt_etm043080dh6gp,
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
