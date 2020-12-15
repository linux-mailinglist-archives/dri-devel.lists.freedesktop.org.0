Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24F22DAB59
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828566E231;
	Tue, 15 Dec 2020 10:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471F46E215
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:47:57 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAluBf124233
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029276;
 bh=L22cKkaK1ALai6zL8dHBBAgMbS82do8yq6yM1MAf7uQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=qvOCQWe0JQd4HU2jsUFrhFhulCR3h6NSo418zr1r0YVC/EF3TY7YLKH2M4pGr7GIM
 6Sm3rkC/j9XDgA2DyXCrkJVygPHjaxabQxsM4M4AWDZAh4iMrl6ZJKB8twVV/Ibsm5
 ScIPOEHw0CA4m76JTWKdZyEJDOZvLqjXXAPsR9ww=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAluRQ023555
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:56 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:56 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:56 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwaf046467;
 Tue, 15 Dec 2020 04:47:55 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 55/84] drm/panel: panel-dsi-cm: use
 MIPI_DCS_GET_ERROR_COUNT_ON_DSI
Date: Tue, 15 Dec 2020 12:46:28 +0200
Message-ID: <20201215104657.802264-56-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215104657.802264-1-tomi.valkeinen@ti.com>
References: <20201215104657.802264-1-tomi.valkeinen@ti.com>
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
Cc: tomi.valkeinen@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the common MIPI_DCS_GET_ERROR_COUNT_ON_DSI define instead of
driver's own.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index 21df1997e7d1..5c28f08b2288 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -26,7 +26,6 @@
 #include <video/of_display_timing.h>
 #include <video/videomode.h>
 
-#define DCS_READ_NUM_ERRORS	0x05
 #define DCS_GET_ID1		0xda
 #define DCS_GET_ID2		0xdb
 #define DCS_GET_ID3		0xdc
@@ -224,7 +223,7 @@ static ssize_t num_dsi_errors_show(struct device *dev,
 	mutex_lock(&ddata->lock);
 
 	if (ddata->enabled)
-		r = dsicm_dcs_read_1(ddata, DCS_READ_NUM_ERRORS, &errors);
+		r = dsicm_dcs_read_1(ddata, MIPI_DCS_GET_ERROR_COUNT_ON_DSI, &errors);
 
 	mutex_unlock(&ddata->lock);
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
