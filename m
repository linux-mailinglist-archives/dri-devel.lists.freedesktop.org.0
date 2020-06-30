Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F69F20FF11
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932746E45F;
	Tue, 30 Jun 2020 21:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE79A6E417;
 Tue, 30 Jun 2020 21:28:52 +0000 (UTC)
IronPort-SDR: bGejs4gspygfCszqj9xEKV8GSJO7OOD3onXq3IUMjjfvSaTJJtBEZdke6u7RCDzsiZvflAERUS
 69CmIidR1QVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="133846920"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="133846920"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:52 -0700
IronPort-SDR: B2WGOFIGXclKWf95u6BtotBtWHGZY9ubJImet22+gbflsIkxMHAnBWLfoI8wxZZSN4aodVCtoA
 l7kqelFhiwZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066798"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:51 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 43/59] drm/kmb: Changed name of driver to kmb-drm
Date: Tue, 30 Jun 2020 14:27:55 -0700
Message-Id: <1593552491-23698-44-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

name change

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/Makefile  | 4 ++--
 drivers/gpu/drm/kmb/kmb_drv.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/kmb/Makefile b/drivers/gpu/drm/kmb/Makefile
index 8102bc9..527d737 100644
--- a/drivers/gpu/drm/kmb/Makefile
+++ b/drivers/gpu/drm/kmb/Makefile
@@ -1,2 +1,2 @@
-kmb-display-y := kmb_crtc.o kmb_drv.o kmb_plane.o kmb_dsi.o
-obj-$(CONFIG_DRM_KMB_DISPLAY)	+= kmb-display.o
+kmb-drm-y := kmb_crtc.o kmb_drv.o kmb_plane.o kmb_dsi.o
+obj-$(CONFIG_DRM_KMB_DISPLAY)	+= kmb-drm.o
diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 3b4b7a1..64e45e7 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -466,7 +466,7 @@ static struct drm_driver kmb_driver = {
 	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
 	.gem_prime_mmap = drm_gem_cma_prime_mmap,
 	.fops = &fops,
-	.name = "kmb_display",
+	.name = "kmb-drm",
 	.desc = "KEEMBAY DISPLAY DRIVER ",
 	.date = "20190122",
 	.major = 1,
@@ -644,7 +644,7 @@ static struct platform_driver kmb_platform_driver = {
 	.probe		= kmb_probe,
 	.remove		= kmb_remove,
 	.driver	= {
-		.name = "kmb_display",
+		.name = "kmb-drm",
 		.pm = &kmb_pm_ops,
 		.of_match_table	= kmb_of_match,
 	},
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
