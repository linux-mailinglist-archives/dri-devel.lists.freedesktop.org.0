Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 971033D84AF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 02:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67E36EA5C;
	Wed, 28 Jul 2021 00:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0886EA5C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 00:32:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="209441962"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="209441962"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="634583323"
Received: from mamarti1-mobl.amr.corp.intel.com (HELO
 achrisan-desk3.intel.com) ([10.212.71.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:00 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com
Subject: [PATCH 02/14] drm/kmb: Define driver date and major/minor version
Date: Tue, 27 Jul 2021 17:31:14 -0700
Message-Id: <20210728003126.1425028-2-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
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

From: Edmund Dea <edmund.j.dea@intel.com>

Added macros for date and version

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 8 ++++----
 drivers/gpu/drm/kmb/kmb_drv.h | 5 +++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index c0b1c6f99249..f54392ec4fab 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -425,10 +425,10 @@ static const struct drm_driver kmb_driver = {
 	.fops = &fops,
 	DRM_GEM_CMA_DRIVER_OPS_VMAP,
 	.name = "kmb-drm",
-	.desc = "KEEMBAY DISPLAY DRIVER ",
-	.date = "20201008",
-	.major = 1,
-	.minor = 0,
+	.desc = "KEEMBAY DISPLAY DRIVER",
+	.date = DRIVER_DATE,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
 };
 
 static int kmb_remove(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 02e806712a64..ebbaa5f422d5 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -15,6 +15,11 @@
 #define KMB_MAX_HEIGHT			1080 /*Max height in pixels */
 #define KMB_MIN_WIDTH                   1920 /*Max width in pixels */
 #define KMB_MIN_HEIGHT                  1080 /*Max height in pixels */
+
+#define DRIVER_DATE			"20210223"
+#define DRIVER_MAJOR			1
+#define DRIVER_MINOR			1
+
 #define KMB_LCD_DEFAULT_CLK		200000000
 #define KMB_SYS_CLK_MHZ			500
 
-- 
2.25.1

