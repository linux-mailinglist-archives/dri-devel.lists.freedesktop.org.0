Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CA55B6751
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 07:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C81810E609;
	Tue, 13 Sep 2022 05:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526B410E15E;
 Tue, 13 Sep 2022 02:48:55 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MRSVq4MRbzmVNS;
 Tue, 13 Sep 2022 10:45:07 +0800 (CST)
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
Subject: [PATCH 3/6] drm/radeon: remove unused declarations for radeon
Date: Tue, 13 Sep 2022 10:48:44 +0800
Message-ID: <20220913024847.552254-4-cuigaosheng1@huawei.com>
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

radeon_combios_get_ext_tmds_info() has been removed since
commit fcec570b27a4 ("drm/radeon/kms: add support for
external tmds on legacy boards").

radeon_mst has been removed since
commit 01ad1d9c2888 ("drm/radeon: Drop legacy MST support").

r600_hdmi_acr() has been removed since
commit 64424d6e45ae ("radeon/audio: consolidate update_acr()
functions (v2)").

So remove the declarations for them from header file.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/gpu/drm/radeon/radeon.h      | 3 ---
 drivers/gpu/drm/radeon/radeon_mode.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 08f83bf2c330..166c18d62f6d 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -116,7 +116,6 @@ extern int radeon_use_pflipirq;
 extern int radeon_bapm;
 extern int radeon_backlight;
 extern int radeon_auxch;
-extern int radeon_mst;
 extern int radeon_uvd;
 extern int radeon_vce;
 extern int radeon_si_support;
@@ -2950,8 +2949,6 @@ struct radeon_hdmi_acr {
 
 };
 
-extern struct radeon_hdmi_acr r600_hdmi_acr(uint32_t clock);
-
 extern u32 r6xx_remap_render_backend(struct radeon_device *rdev,
 				     u32 tiling_pipe_num,
 				     u32 max_rb_num,
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 6a6a73204226..9f5be416454f 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -874,7 +874,6 @@ extern struct radeon_encoder_tv_dac *
 radeon_atombios_get_tv_dac_info(struct radeon_encoder *encoder);
 extern struct radeon_encoder_lvds *
 radeon_combios_get_lvds_info(struct radeon_encoder *encoder);
-extern void radeon_combios_get_ext_tmds_info(struct radeon_encoder *encoder);
 extern struct radeon_encoder_tv_dac *
 radeon_combios_get_tv_dac_info(struct radeon_encoder *encoder);
 extern struct radeon_encoder_primary_dac *
-- 
2.25.1

