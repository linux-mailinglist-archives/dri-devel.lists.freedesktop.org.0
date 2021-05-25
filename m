Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43E038FBFE
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 09:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E998C6E9B4;
	Tue, 25 May 2021 07:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE586E9B4;
 Tue, 25 May 2021 07:51:54 +0000 (UTC)
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fq5mG4tsyzQsJl;
 Tue, 25 May 2021 15:48:14 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 15:51:50 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 15:51:50 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/radeon: remove the repeated declaration
Date: Tue, 25 May 2021 15:51:41 +0800
Message-ID: <1621929101-24607-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
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
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Function 'r300_mc_wait_for_idle' and 'r600_mc_wait_for_idle'
are declared twice, remove the repeated declaration.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 drivers/gpu/drm/radeon/radeon_asic.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_asic.h b/drivers/gpu/drm/radeon/radeon_asic.h
index 1cf2a5e0d91d..1e00f6b99f94 100644
--- a/drivers/gpu/drm/radeon/radeon_asic.h
+++ b/drivers/gpu/drm/radeon/radeon_asic.h
@@ -187,7 +187,6 @@ extern int rv370_pcie_gart_init(struct radeon_device *rdev);
 extern void rv370_pcie_gart_fini(struct radeon_device *rdev);
 extern int rv370_pcie_gart_enable(struct radeon_device *rdev);
 extern void rv370_pcie_gart_disable(struct radeon_device *rdev);
-extern int r300_mc_wait_for_idle(struct radeon_device *rdev);
 
 /*
  * r420,r423,rv410
@@ -404,7 +403,6 @@ void r600_hdmi_update_ACR(struct drm_encoder *encoder, uint32_t clock);
 void r600_hdmi_audio_workaround(struct drm_encoder *encoder);
 int r600_hdmi_buffer_status_changed(struct drm_encoder *encoder);
 void r600_hdmi_update_audio_settings(struct drm_encoder *encoder);
-int r600_mc_wait_for_idle(struct radeon_device *rdev);
 u32 r600_get_xclk(struct radeon_device *rdev);
 uint64_t r600_get_gpu_clock_counter(struct radeon_device *rdev);
 int rv6xx_get_temp(struct radeon_device *rdev);
-- 
2.7.4

