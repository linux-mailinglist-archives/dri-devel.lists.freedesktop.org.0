Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B5C6008CB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 10:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B258110E85F;
	Mon, 17 Oct 2022 08:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 306 seconds by postgrey-1.36 at gabe;
 Mon, 17 Oct 2022 08:34:38 UTC
Received: from out199-16.us.a.mail.aliyun.com (out199-16.us.a.mail.aliyun.com
 [47.90.199.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C6310E85F;
 Mon, 17 Oct 2022 08:34:38 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VSLGo6w_1665995358; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VSLGo6w_1665995358) by smtp.aliyun-inc.com;
 Mon, 17 Oct 2022 16:29:27 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Remove the unused function
 get_umc_v6_7_channel_index()
Date: Mon, 17 Oct 2022 16:27:28 +0800
Message-Id: <20221017082728.73154-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function get_umc_v6_7_channel_index() is defined in the umc_v6_7.c
file, but not called elsewhere, so delete this unused function.

drivers/gpu/drm/amd/amdgpu/umc_v6_7.c:60:24: warning: unused function 'get_umc_v6_7_channel_index'.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2413
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/umc_v6_7.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v6_7.c b/drivers/gpu/drm/amd/amdgpu/umc_v6_7.c
index 5d5d031c9e7d..6837fc89ba8f 100644
--- a/drivers/gpu/drm/amd/amdgpu/umc_v6_7.c
+++ b/drivers/gpu/drm/amd/amdgpu/umc_v6_7.c
@@ -57,13 +57,6 @@ static inline uint32_t get_umc_v6_7_reg_offset(struct amdgpu_device *adev,
 	return adev->umc.channel_offs * ch_inst + UMC_V6_7_INST_DIST * umc_inst;
 }
 
-static inline uint32_t get_umc_v6_7_channel_index(struct amdgpu_device *adev,
-					      uint32_t umc_inst,
-					      uint32_t ch_inst)
-{
-	return adev->umc.channel_idx_tbl[umc_inst * adev->umc.channel_inst_num + ch_inst];
-}
-
 static void umc_v6_7_query_error_status_helper(struct amdgpu_device *adev,
 						  uint64_t mc_umc_status, uint32_t umc_reg_offset)
 {
-- 
2.20.1.7.g153144c

