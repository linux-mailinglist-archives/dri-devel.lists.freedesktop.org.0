Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A7221FF3B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC3B6E9D3;
	Tue, 14 Jul 2020 20:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D826E6E974;
 Tue, 14 Jul 2020 20:58:41 +0000 (UTC)
IronPort-SDR: XHPY92Rve3ZjMgN/Cc649Hd5pfyqeGbnEU1vdcdppZE/l/DRAi3hu+UZmkK92CmXOv4pqsUX45
 ovwnbmzpFxWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444606"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444606"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:41 -0700
IronPort-SDR: sBOBHivJmVE4uz1G+qgGUiCODSrilTNZ81Pt744fmEIRgQ18Wy/rUNumsF6gBu1eztLUQaYGfq
 uAO0QLmgHxdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504249"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:41 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 43/59] drm/kmb: Changed name of driver to kmb-drm
Date: Tue, 14 Jul 2020 13:57:29 -0700
Message-Id: <1594760265-11618-44-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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
index 039dd21..bbf3e649 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -447,7 +447,7 @@ static struct drm_driver kmb_driver = {
 	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
 	.gem_prime_mmap = drm_gem_cma_prime_mmap,
 	.fops = &fops,
-	.name = "kmb_display",
+	.name = "kmb-drm",
 	.desc = "KEEMBAY DISPLAY DRIVER ",
 	.date = "20190122",
 	.major = 1,
@@ -630,7 +630,7 @@ static struct platform_driver kmb_platform_driver = {
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
