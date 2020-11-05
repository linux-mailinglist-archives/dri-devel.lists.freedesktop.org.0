Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5412A7E34
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 13:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9826EB6E;
	Thu,  5 Nov 2020 12:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73F16EB70
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 12:06:00 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C5rZg057224;
 Thu, 5 Nov 2020 06:05:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604577953;
 bh=I5gYD9DyE3fUJusaVOvw4nvsHQAOXsIAcU4ZZCh/qq8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Yhb3tEDRCWbk5c0a03DuSfBc/dNeG8J1FxNymp205LCNYpriaq22vShaVV0GAA/eU
 m9wE9pHRLv9k4mk5iJccYSnRTg1kmWVoT7oADx5E84XhdI2IrTVEZ5HwpCK7mwEqia
 zMRQIPgexxR0QMCvzDteY98LxccIOg9QOC4P++JA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5C5r83044076
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Nov 2020 06:05:53 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:05:53 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:05:53 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5C3rfk039111;
 Thu, 5 Nov 2020 06:05:51 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 48/56] drm/omap: drop dssdev display field
Date: Thu, 5 Nov 2020 14:03:25 +0200
Message-ID: <20201105120333.947408-49-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105120333.947408-1-tomi.valkeinen@ti.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, "H .
 Nikolaus Schaller" <hns@goldelico.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Reichel <sebastian.reichel@collabora.com>

All displays are using drm_panel instead off dssdev
now, so this field is always 0 and can be dropped.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/base.c    | 2 +-
 drivers/gpu/drm/omapdrm/dss/omapdss.h | 6 ------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index d62713b241d2..d9a5e7b9d401 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -198,7 +198,7 @@ void omapdss_device_disconnect(struct omap_dss_device *src,
 	}
 
 	if (!dst->id && !omapdss_device_is_connected(dst)) {
-		WARN_ON(!dst->display);
+		WARN_ON(1);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 916c55101629..c2199c4946ec 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -298,12 +298,6 @@ struct omap_dss_device {
 	 */
 	enum omap_display_type type;
 
-	/*
-	 * True if the device is a display (panel or connector) at the end of
-	 * the pipeline, false otherwise.
-	 */
-	bool display;
-
 	const char *name;
 
 	const struct omap_dss_device_ops *ops;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
