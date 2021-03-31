Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3031B3505F9
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 20:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83116E23B;
	Wed, 31 Mar 2021 18:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869456E23B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 18:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1617214040; x=1619806040;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PYSu/k4QRhzoeZkDdqp9/5RLCdUSG54wNq5FfftlHW8=;
 b=BMM5NYNPQmSexXFBY4b8D/VDZ/weGD6jj2zYhqtWXX/d88dq+5N5i098/c0ueAfK
 U294wXfBNN2Af0bIwqEbBoNknVONFd0XStgUPgGAqjj3fviqvRODy3U+TkcYub1Y
 voEAkzCGlBVKLQKoWp904ysusPtCsqhyslJuFwvta9I=;
X-AuditID: c39127d2-85cb770000001c91-0b-6064ba582aa4
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 2A.26.07313.85AB4606;
 Wed, 31 Mar 2021 20:07:20 +0200 (CEST)
Received: from lws-ybas.phytec.de ([172.16.21.122])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021033120072076-278028 ;
 Wed, 31 Mar 2021 20:07:20 +0200 
From: Yunus Bas <y.bas@phytec.de>
To: dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, sam@ravnborg.org
Subject: [PATCH v2 1/2] drm/panel: simple: Add support for EDT ETMV570G2DHU
 panel
Date: Wed, 31 Mar 2021 20:07:56 +0200
Message-Id: <20210331180757.463479-1-y.bas@phytec.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 31.03.2021 20:07:20,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 31.03.2021 20:07:21
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPLMWRmVeSWpSXmKPExsWyRoCBSzdiV0qCwe82c4vecyeZLP5vm8hs
 ceXrezaLFT+3Mlr83DWPxYHVY++3BSweO2fdZffY/u0Bq8f97uNMHkumXWULYI3isklJzcks
 Sy3St0vgynj89T5LwQmBir1f9rA0MD7l7WLk5JAQMJF49v48excjF4eQwDZGiQlbb0E55xkl
 Pl3+zAJSxSagKHH+9ltWEFtEwF9iw+217CA2s4CqxMunU8FqhAUCJT5dOs8MYrMAxdd/mwhW
 zytgKrGzfRYTxDZ5iZNrDzNBxAUlTs58wgKyTELgCqPEg7dPoYqEJE4vPssMsUBbYtnC18wT
 GPlmIemZhSS1gJFpFaNQbmZydmpRZrZeQUZlSWqyXkrqJkZgIB6eqH5pB2PfHI9DjEwcjIcY
 JTiYlUR4hQ8kJgjxpiRWVqUW5ccXleakFh9ilOZgURLn3cBbEiYkkJ5YkpqdmlqQWgSTZeLg
 lGpgdPpRaH0kZKfZ5WML7pj+0tU7qT85YpffmY7XDJHaliFBOQ8OWX0r/rbeISSa8Xf7lMzf
 J00D1E7tW3785IlN65qXq9y6VLuRyfjmkhCVrb5LtrrWW14681/rZni3ruus4LszOnV7lpdP
 lLT3unzliuHUPAFmiQuR5tNZfn0/sT721Qy2Xadq/yqxFGckGmoxFxUnAgD9SLylMgIAAA==
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

This patch adds support for the EDT ETMV570G2DHU 5.7" (640x480) lcd panel
to DRM simple panel driver.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Signed-off-by: Yunus Bas <y.bas@phytec.de>
---
Changes in v2:
- Splitted dt-bindings to separate patch
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
