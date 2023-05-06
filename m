Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F766F9076
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 10:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF38810E1EC;
	Sat,  6 May 2023 08:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-100.freemail.mail.aliyun.com
 (out30-100.freemail.mail.aliyun.com [115.124.30.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9579410E1E0;
 Sat,  6 May 2023 08:10:56 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0Vhsn6o0_1683360647; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0Vhsn6o0_1683360647) by smtp.aliyun-inc.com;
 Sat, 06 May 2023 16:10:49 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Remove the unused variable
 golden_settings_gc_9_4_3
Date: Sat,  6 May 2023 16:10:43 +0800
Message-Id: <20230506081043.73456-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Variable golden_settings_gc_9_4_3 is not effectively used, so delete it.

drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:48:38: warning: ‘golden_settings_gc_9_4_3’ defined but not used.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4877
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index 312491455382..74be46d382f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -45,10 +45,6 @@ MODULE_FIRMWARE("amdgpu/gc_9_4_3_rlc.bin");
 #define GFX9_MEC_HPD_SIZE 4096
 #define RLCG_UCODE_LOADING_START_ADDRESS 0x00002000L
 
-static const struct soc15_reg_golden golden_settings_gc_9_4_3[] = {
-
-};
-
 static void gfx_v9_4_3_set_ring_funcs(struct amdgpu_device *adev);
 static void gfx_v9_4_3_set_irq_funcs(struct amdgpu_device *adev);
 static void gfx_v9_4_3_set_gds_init(struct amdgpu_device *adev);
-- 
2.20.1.7.g153144c

