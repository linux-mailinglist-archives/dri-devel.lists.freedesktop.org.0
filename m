Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2507E211CCE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321516EA67;
	Thu,  2 Jul 2020 07:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EE26E0E6;
 Thu,  2 Jul 2020 01:51:19 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C942361FB4DC5C89F11F;
 Thu,  2 Jul 2020 09:51:15 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 2 Jul 2020 09:51:07 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: Alex Deucher <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <sumit.semwal@linaro.org>,
 <tianci.yin@amd.com>, <kraxel@redhat.com>, <Likun.Gao@amd.com>,
 <Felix.Kuehling@amd.com>, <jgg@ziepe.ca>, <Hawking.Zhang@amd.com>
Subject: [PATCH -next] drm/amdgpu: remove set but not used variable 'adev'
Date: Thu, 2 Jul 2020 01:55:52 +0000
Message-ID: <20200702015552.42377-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: In function 'amdgpu_init_mem_type':
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:81:24: warning:
 variable 'adev' set but not used [-Wunused-but-set-variable]
  struct amdgpu_device *adev;
                        ^

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index bb95627ad2cc..8199702d3354 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -78,10 +78,6 @@
 static int amdgpu_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 				struct ttm_mem_type_manager *man)
 {
-	struct amdgpu_device *adev;
-
-	adev = amdgpu_ttm_adev(bdev);
-
 	switch (type) {
 	case TTM_PL_SYSTEM:
 		/* System memory */





_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
