Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1B31F82B8
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1036E421;
	Sat, 13 Jun 2020 10:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665F76E16B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 12:42:31 +0000 (UTC)
IronPort-SDR: psf8eA06QA73cVgDhKf1qN31JERE9W4cEVl9fRg+WGHuclzohHqlixpO1TAGj6XEmznSWRBm6s
 xZupZCVqEVb85x9X6UYBSmiGo6G2c2u4qsJTIeWuOc+G/9Yy5o5ICv6q+IwCEAsWNPtiOiPbXM
 AqGoeibeDCW4oqpAo3fjJmsjhZZzcjFUfoupSPiZaMPW0mm4rSWoRaG3TlT5sFTA/HXyvAnUfA
 IPfkbSn5q2lyiAMREMx6xWWWtp1d4vReUMc/OOHgC95IbSmyv6RnPlaolI4wkINPJJ/pivGV7G
 +Mw=
X-IronPort-AV: E=Sophos;i="5.73,499,1583190000"; d="scan'208";a="12649667"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 11 Jun 2020 14:42:26 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 11 Jun 2020 14:42:27 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 11 Jun 2020 14:42:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1591879347; x=1623415347;
 h=from:to:cc:subject:date:message-id;
 bh=w92AlLWT7nwDfbklnB9I+khUvogaeBHHV8tKD4NSxZk=;
 b=RQQpzgmDedERRzPKaIo5YlWkWEQCx0G7gMnpGsnGibw83tShXc1k79ad
 EVbJFgb1OENZrP3CClgbdDQ0MPAuJ8EciXOyZdC6yjSNkMR9sMa2p9bdx
 NKrU+m2/S3pec2flzJKfLTQUjL5uufcfjUwmcsD+EM4PJz/oOyhq/suzg
 /MuA+aTg9NB2E0Cv2l7t28jy142IOM69QgTc24GcP+h5INoDFxvVQHzXL
 iF/ZRk+Qcu584qn32bT0ZyQnExhLqK0OgGcf683B2DpjPxYB6+tdfpvHM
 /eDgrrb+KW7KUIf1uSiwZ5zs0n6HliVgHDvXl+fpjWSU/seuSeioaT8CL A==;
IronPort-SDR: EOnhYcJnjdJM6Gu+to8dm9odHIz97Z0LlsfClzwJV3AgkixJ4698sdcafFpKqcs2a84ffqci8L
 bpJI60Yeg42B1shkVVhoRac81DT7R1t2ppXYjuubeBs2hRLStqpFJbkW1h+E00xl5NdYLiF+XX
 aZLdCQzJs3ItforRLgmqa/BYf4wphedC76B+Ly0rV+fGJiku3V/1KQEHvVtsFsURHuMmnpUzE4
 1xiSDbfgmSWScCBIYizpZOzH6ISdXRHtQgHmLCIs4MLY030kICzj3FWp1pxMmTdTXovj06C45Z
 WBw=
X-IronPort-AV: E=Sophos;i="5.73,499,1583190000"; d="scan'208";a="12649666"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 11 Jun 2020 14:42:26 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 2CE9F280065;
 Thu, 11 Jun 2020 14:42:28 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/4] drm/panel: simple: add CDTech S070PWS19HP-FC21 and
 S070SWV29HG-DC44
Date: Thu, 11 Jun 2020 14:42:08 +0200
Message-Id: <20200611124209.25028-3-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611124209.25028-1-matthias.schiffer@ew.tq-group.com>
References: <20200611124209.25028-1-matthias.schiffer@ew.tq-group.com>
In-Reply-To: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
References: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: devicetree@vger.kernel.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Krummsdorf <michael.krummsdorf@tq-group.com>

Add support for the CDTech Electronics displays S070PWS19HP-FC21
(7.0" WSVGA) and S070SWV29HG-DC44 (7.0" WVGA) to panel-simple.

Signed-off-by: Michael Krummsdorf <michael.krummsdorf@tq-group.com>
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2:
- removed vrefresh
- added connector_type

 drivers/gpu/drm/panel/panel-simple.c | 60 ++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 6764ac630e22..ee9815e5eee8 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1296,6 +1296,60 @@ static const struct panel_desc cdtech_s043wq26h_ct7 = {
 	.bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 };
 
+/* S070PWS19HP-FC21 2017/04/22 */
+static const struct drm_display_mode cdtech_s070pws19hp_fc21_mode = {
+	.clock = 51200,
+	.hdisplay = 1024,
+	.hsync_start = 1024 + 160,
+	.hsync_end = 1024 + 160 + 20,
+	.htotal = 1024 + 160 + 20 + 140,
+	.vdisplay = 600,
+	.vsync_start = 600 + 12,
+	.vsync_end = 600 + 12 + 3,
+	.vtotal = 600 + 12 + 3 + 20,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc cdtech_s070pws19hp_fc21 = {
+	.modes = &cdtech_s070pws19hp_fc21_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
+/* S070SWV29HG-DC44 2017/09/21 */
+static const struct drm_display_mode cdtech_s070swv29hg_dc44_mode = {
+	.clock = 33300,
+	.hdisplay = 800,
+	.hsync_start = 800 + 210,
+	.hsync_end = 800 + 210 + 2,
+	.htotal = 800 + 210 + 2 + 44,
+	.vdisplay = 480,
+	.vsync_start = 480 + 22,
+	.vsync_end = 480 + 22 + 2,
+	.vtotal = 480 + 22 + 2 + 21,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc cdtech_s070swv29hg_dc44 = {
+	.modes = &cdtech_s070swv29hg_dc44_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode cdtech_s070wv95_ct16_mode = {
 	.clock = 35000,
 	.hdisplay = 800,
@@ -3674,6 +3728,12 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "cdtech,s043wq26h-ct7",
 		.data = &cdtech_s043wq26h_ct7,
+	}, {
+		.compatible = "cdtech,s070pws19hp-fc21",
+		.data = &cdtech_s070pws19hp_fc21,
+	}, {
+		.compatible = "cdtech,s070swv29hg-dc44",
+		.data = &cdtech_s070swv29hg_dc44,
 	}, {
 		.compatible = "cdtech,s070wv95-ct16",
 		.data = &cdtech_s070wv95_ct16,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
