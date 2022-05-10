Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3B1520D8C
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5419110E380;
	Tue, 10 May 2022 06:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397E110E380
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 06:05:07 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VCpD4Yc_1652162694; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VCpD4Yc_1652162694) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 10 May 2022 14:05:03 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: clean up some inconsistent indenting
Date: Tue, 10 May 2022 14:04:40 +0800
Message-Id: <20220510060440.67178-1-jiapeng.chong@linux.alibaba.com>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eliminate the follow smatch warning:

drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c:35 nbio_v7_7_get_rev_id() warn:
inconsistent indenting.

drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c:214 nbio_v7_7_init_registers()
warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c
index e32c874b42b5..cdc0c9779848 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c
@@ -32,8 +32,7 @@ static u32 nbio_v7_7_get_rev_id(struct amdgpu_device *adev)
 {
 	u32 tmp;
 
-		tmp = RREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_DEV0_EPF0_STRAP0);
-
+	tmp = RREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_DEV0_EPF0_STRAP0);
 	tmp &= RCC_STRAP0_RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0_MASK;
 	tmp >>= RCC_STRAP0_RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0__SHIFT;
 
@@ -211,14 +210,14 @@ static void nbio_v7_7_init_registers(struct amdgpu_device *adev)
 {
 	uint32_t def, data;
 
-		def = data = RREG32_SOC15(NBIO, 0, regBIF0_PCIE_MST_CTRL_3);
-		data = REG_SET_FIELD(data, BIF0_PCIE_MST_CTRL_3,
-			CI_SWUS_MAX_READ_REQUEST_SIZE_MODE, 1);
-		data = REG_SET_FIELD(data, BIF0_PCIE_MST_CTRL_3,
-			CI_SWUS_MAX_READ_REQUEST_SIZE_PRIV, 1);
+	def = data = RREG32_SOC15(NBIO, 0, regBIF0_PCIE_MST_CTRL_3);
+	data = REG_SET_FIELD(data, BIF0_PCIE_MST_CTRL_3,
+			     CI_SWUS_MAX_READ_REQUEST_SIZE_MODE, 1);
+	data = REG_SET_FIELD(data, BIF0_PCIE_MST_CTRL_3,
+			     CI_SWUS_MAX_READ_REQUEST_SIZE_PRIV, 1);
 
-		if (def != data)
-			WREG32_SOC15(NBIO, 0, regBIF0_PCIE_MST_CTRL_3, data);
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regBIF0_PCIE_MST_CTRL_3, data);
 
 }
 
-- 
2.20.1.7.g153144c

