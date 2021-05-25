Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCA039010A
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 14:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227D66E059;
	Tue, 25 May 2021 12:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E03D6E059;
 Tue, 25 May 2021 12:32:55 +0000 (UTC)
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FqD0W5PZzzQs3D;
 Tue, 25 May 2021 20:29:15 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 20:32:31 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 20:32:31 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/radeon/evergreen: Remove the repeated declaration
Date: Tue, 25 May 2021 20:32:24 +0800
Message-ID: <1621945944-52797-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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

Function 'evergreen_print_gpu_status_regs' is declared twice, remove
the repeated declaration.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 drivers/gpu/drm/radeon/evergreen.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/evergreen.h b/drivers/gpu/drm/radeon/evergreen.h
index 4025a4e474d1..b07befe14458 100644
--- a/drivers/gpu/drm/radeon/evergreen.h
+++ b/drivers/gpu/drm/radeon/evergreen.h
@@ -45,7 +45,6 @@ void sumo_rlc_fini(struct radeon_device *rdev);
 int sumo_rlc_init(struct radeon_device *rdev);
 void evergreen_gpu_pci_config_reset(struct radeon_device *rdev);
 u32 evergreen_get_number_of_dram_channels(struct radeon_device *rdev);
-void evergreen_print_gpu_status_regs(struct radeon_device *rdev);
 u32 evergreen_gpu_check_soft_reset(struct radeon_device *rdev);
 int evergreen_rlc_resume(struct radeon_device *rdev);
 struct evergreen_power_info *evergreen_get_pi(struct radeon_device *rdev);
-- 
2.7.4

