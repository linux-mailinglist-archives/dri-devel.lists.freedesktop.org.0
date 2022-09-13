Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71CB5B6756
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 07:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5574710E60C;
	Tue, 13 Sep 2022 05:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE2A10E4EF;
 Tue, 13 Sep 2022 02:48:52 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MRSX21NWZznVH2;
 Tue, 13 Sep 2022 10:46:10 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 10:48:49 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <evan.quan@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <patrik.r.jakobsson@gmail.com>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
 <zackr@vmware.com>, <linux-graphics-maintainer@vmware.com>,
 <lijo.lazar@amd.com>, <matthew.brost@intel.com>, <John.C.Harrison@Intel.com>, 
 <daniele.ceraolospurio@intel.com>, <cuigaosheng1@huawei.com>
Subject: [PATCH 2/6] drm/radeon/r600_cs: remove
 r600_cs_legacy_get_tiling_conf() declaration
Date: Tue, 13 Sep 2022 10:48:43 +0800
Message-ID: <20220913024847.552254-3-cuigaosheng1@huawei.com>
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

r600_cs_legacy_get_tiling_conf() has been removed since
commit 8333f607a631 ("drm/radeon: remove UMS support"),
so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/gpu/drm/radeon/r600_cs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
index 8be4799a98ef..638f861af80f 100644
--- a/drivers/gpu/drm/radeon/r600_cs.c
+++ b/drivers/gpu/drm/radeon/r600_cs.c
@@ -34,8 +34,6 @@
 #include "r600_reg_safe.h"
 
 static int r600_nomm;
-extern void r600_cs_legacy_get_tiling_conf(struct drm_device *dev, u32 *npipes, u32 *nbanks, u32 *group_size);
-
 
 struct r600_cs_track {
 	/* configuration we mirror so that we use same code btw kms/ums */
-- 
2.25.1

