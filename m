Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E501E82A9B6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280F910E85D;
	Thu, 11 Jan 2024 08:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id C896710E85D;
 Thu, 11 Jan 2024 08:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=3mOu7B5TwCh/UrgYIi
 3ICtQsQIqk+hEu+An0A0r7hSw=; b=AW1ay7qqTvcGT6WUmCA0QvWg8WY6fVXao4
 bclxgHc13473aBhFimqN4S6KxS1rfxa4ancI5KDC4sl10ro1xuzA9ZP0dMufZZca
 uvI2DcDmY7LMXB+DBiH6dqkSqmvHM+IA676JeLqb5RhqSgAnTQNGhFipKxYQas05
 rSxiCcGng=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wC3R+YvrJ9lZyuXAA--.19791S2;
 Thu, 11 Jan 2024 16:52:00 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in evergreen.c
Date: Thu, 11 Jan 2024 08:51:58 +0000
Message-Id: <20240111085158.12719-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wC3R+YvrJ9lZyuXAA--.19791S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF4DGryxZF4xtr4rury3urg_yoWrXr15pr
 Z7XFyfKrsYy3Z0y3yxAF9rXFWUK3s3Za4IkF43Gw4xua45WryaqFyxu347Aa4UXrW2qa42
 y3Z8try7XrWFya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UwFxUUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEBBi1mVOBlBgeAAAsR
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
Cc: GuoHua Chen <chenguohua_716@163.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: that open brace { should be on the previous line
ERROR: spaces required around that '&=' (ctx:WxO)
ERROR: space required before that '~' (ctx:OxV)
ERROR: space prohibited before that close parenthesis ')'
ERROR: space required after that ',' (ctx:WxO)
ERROR: space required before that '&' (ctx:OxV)
ERROR: need consistent spacing around '*' (ctx:VxW)

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/evergreen.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
index a424b86008b8..c634dc28e6c3 100644
--- a/drivers/gpu/drm/radeon/evergreen.c
+++ b/drivers/gpu/drm/radeon/evergreen.c
@@ -2514,8 +2514,7 @@ static void evergreen_agp_enable(struct radeon_device *rdev)
 	WREG32(VM_CONTEXT1_CNTL, 0);
 }
 
-static const unsigned ni_dig_offsets[] =
-{
+static const unsigned ni_dig_offsets[] = {
 	NI_DIG0_REGISTER_OFFSET,
 	NI_DIG1_REGISTER_OFFSET,
 	NI_DIG2_REGISTER_OFFSET,
@@ -2524,8 +2523,7 @@ static const unsigned ni_dig_offsets[] =
 	NI_DIG5_REGISTER_OFFSET
 };
 
-static const unsigned ni_tx_offsets[] =
-{
+static const unsigned ni_tx_offsets[] = {
 	NI_DCIO_UNIPHY0_UNIPHY_TX_CONTROL1,
 	NI_DCIO_UNIPHY1_UNIPHY_TX_CONTROL1,
 	NI_DCIO_UNIPHY2_UNIPHY_TX_CONTROL1,
@@ -2534,8 +2532,7 @@ static const unsigned ni_tx_offsets[] =
 	NI_DCIO_UNIPHY5_UNIPHY_TX_CONTROL1
 };
 
-static const unsigned evergreen_dp_offsets[] =
-{
+static const unsigned evergreen_dp_offsets[] = {
 	EVERGREEN_DP0_REGISTER_OFFSET,
 	EVERGREEN_DP1_REGISTER_OFFSET,
 	EVERGREEN_DP2_REGISTER_OFFSET,
@@ -2544,8 +2541,7 @@ static const unsigned evergreen_dp_offsets[] =
 	EVERGREEN_DP5_REGISTER_OFFSET
 };
 
-static const unsigned evergreen_disp_int_status[] =
-{
+static const unsigned evergreen_disp_int_status[] = {
 	DISP_INTERRUPT_STATUS,
 	DISP_INTERRUPT_STATUS_CONTINUE,
 	DISP_INTERRUPT_STATUS_CONTINUE2,
@@ -2643,7 +2639,7 @@ static void evergreen_blank_dp_output(struct radeon_device *rdev,
 		return;
 	}
 
-	stream_ctrl &=~EVERGREEN_DP_VID_STREAM_CNTL_ENABLE;
+	stream_ctrl &= ~EVERGREEN_DP_VID_STREAM_CNTL_ENABLE;
 	WREG32(EVERGREEN_DP_VID_STREAM_CNTL +
 	       evergreen_dp_offsets[dig_fe], stream_ctrl);
 
@@ -2655,7 +2651,7 @@ static void evergreen_blank_dp_output(struct radeon_device *rdev,
 		stream_ctrl = RREG32(EVERGREEN_DP_VID_STREAM_CNTL +
 				     evergreen_dp_offsets[dig_fe]);
 	}
-	if (counter >= 32 )
+	if (counter >= 32)
 		DRM_ERROR("counter exceeds %d\n", counter);
 
 	fifo_ctrl = RREG32(EVERGREEN_DP_STEER_FIFO + evergreen_dp_offsets[dig_fe]);
@@ -2716,7 +2712,7 @@ void evergreen_mc_stop(struct radeon_device *rdev, struct evergreen_mc_save *sav
 			/*for now we do it this manually*/
 			/**/
 			if (ASIC_IS_DCE5(rdev) &&
-			    evergreen_is_dp_sst_stream_enabled(rdev, i ,&dig_fe))
+			    evergreen_is_dp_sst_stream_enabled(rdev, i, &dig_fe))
 				evergreen_blank_dp_output(rdev, dig_fe);
 			/*we could remove 6 lines below*/
 			/* XXX this is a hack to avoid strange behavior with EFI on certain systems */
@@ -3597,7 +3593,7 @@ static void evergreen_gpu_init(struct radeon_device *rdev)
 
 	sq_lds_resource_mgmt = RREG32(SQ_LDS_RESOURCE_MGMT);
 
-	sq_gpr_resource_mgmt_1 = NUM_PS_GPRS((rdev->config.evergreen.max_gprs - (4 * 2))* 12 / 32);
+	sq_gpr_resource_mgmt_1 = NUM_PS_GPRS((rdev->config.evergreen.max_gprs - (4 * 2)) * 12 / 32);
 	sq_gpr_resource_mgmt_1 |= NUM_VS_GPRS((rdev->config.evergreen.max_gprs - (4 * 2)) * 6 / 32);
 	sq_gpr_resource_mgmt_1 |= NUM_CLAUSE_TEMP_GPRS(4);
 	sq_gpr_resource_mgmt_2 = NUM_GS_GPRS((rdev->config.evergreen.max_gprs - (4 * 2)) * 4 / 32);
-- 
2.17.1

