Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DC45B6758
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 07:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3779310E60E;
	Tue, 13 Sep 2022 05:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 940 seconds by postgrey-1.36 at gabe;
 Tue, 13 Sep 2022 03:04:32 UTC
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C467310E103;
 Tue, 13 Sep 2022 03:04:32 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MRSXq12JyzHntV;
 Tue, 13 Sep 2022 10:46:51 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 10:48:50 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <evan.quan@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <patrik.r.jakobsson@gmail.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
 <zackr@vmware.com>, <linux-graphics-maintainer@vmware.com>,
 <lijo.lazar@amd.com>, <matthew.brost@intel.com>, <John.C.Harrison@Intel.com>, 
 <daniele.ceraolospurio@intel.com>, <cuigaosheng1@huawei.com>
Subject: [PATCH 4/6] drm/gma500: remove unused declarations in psb_intel_drv.h
Date: Tue, 13 Sep 2022 10:48:45 +0800
Message-ID: <20220913024847.552254-5-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913024847.552254-1-cuigaosheng1@huawei.com>
References: <20220913024847.552254-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 13 Sep 2022 05:27:54 +0000
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

psb_intel_sdvo_supports_hotplug(), psb_intel_sdvo_set_hotplug()
and psb_intel_sdvo_find() have been removed since
commit 871c60156dbe ("drm/gma500: Remove dead code"),
so remove them.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/gpu/drm/gma500/psb_intel_drv.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
index 8ccba116821b..8a1111fe714b 100644
--- a/drivers/gpu/drm/gma500/psb_intel_drv.h
+++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
@@ -197,8 +197,6 @@ extern void psb_intel_lvds_set_brightness(struct drm_device *dev, int level);
 extern void oaktrail_lvds_init(struct drm_device *dev,
 			   struct psb_intel_mode_device *mode_dev);
 extern void oaktrail_wait_for_INTR_PKT_SENT(struct drm_device *dev);
-extern void oaktrail_dsi_init(struct drm_device *dev,
-			   struct psb_intel_mode_device *mode_dev);
 struct gma_i2c_chan *oaktrail_lvds_i2c_init(struct drm_device *dev);
 extern void mid_dsi_init(struct drm_device *dev,
 		    struct psb_intel_mode_device *mode_dev, int dsi_num);
@@ -219,9 +217,6 @@ extern struct drm_crtc *psb_intel_get_crtc_from_pipe(struct drm_device *dev,
 						 int pipe);
 extern struct drm_connector *psb_intel_sdvo_find(struct drm_device *dev,
 					     int sdvoB);
-extern int psb_intel_sdvo_supports_hotplug(struct drm_connector *connector);
-extern void psb_intel_sdvo_set_hotplug(struct drm_connector *connector,
-				   int enable);
 extern int intelfb_probe(struct drm_device *dev);
 extern int intelfb_remove(struct drm_device *dev,
 			  struct drm_framebuffer *fb);
-- 
2.25.1

