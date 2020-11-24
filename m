Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 347172C267D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529C16E444;
	Tue, 24 Nov 2020 12:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781836E436
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:48:42 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCmbs1123915;
 Tue, 24 Nov 2020 06:48:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222117;
 bh=9GKXdExOX8jhEF/s17rhuyqpQSVdCIYnoEG8JBmh0/o=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=TunnFJRwCy9EYbrw0G0cSFZ+GfOelloRQ7LIQxyzBvWdtioAHjeAjbZxnixzkptsJ
 ZdogpQFtlKTkDtlB89XoKHsh1mrq6JKjpKf/BwNcnn/8Umg+SEF2YfYIhKTzBiOOcA
 RpVj0tg+yVQIIaNpOKE5pIUDH6ZJRgreXf36DIns=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCmbGq044920
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:48:37 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:48:36 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:48:36 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpv040922;
 Tue, 24 Nov 2020 06:48:34 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 68/80] drm/panel: panel-dsi-cm: remove extra 'if'
Date: Tue, 24 Nov 2020 14:45:26 +0200
Message-ID: <20201124124538.660710-69-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124124538.660710-1-tomi.valkeinen@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have a useless 'if' in the dsicm_bl_update_status(), a left over from
the conversion to DRM model. Drop the if.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index 1e7f73340736..c17ed728c695 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -194,7 +194,7 @@ static int dsicm_set_update_window(struct panel_drv_data *ddata)
 static int dsicm_bl_update_status(struct backlight_device *dev)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
-	int r = 0;
+	int r;
 	int level;
 
 	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
@@ -207,11 +207,9 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
 
 	mutex_lock(&ddata->lock);
 
-	if (ddata->enabled) {
-		if (!r)
-			r = dsicm_dcs_write_1(
-				ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, level);
-	}
+	if (ddata->enabled)
+		r = dsicm_dcs_write_1(ddata, MIPI_DCS_SET_DISPLAY_BRIGHTNESS,
+				      level);
 
 	mutex_unlock(&ddata->lock);
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
