Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452B8852322
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 01:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A1010E476;
	Tue, 13 Feb 2024 00:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BjyG5zde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B502110E476
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 00:19:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F965611CA;
 Tue, 13 Feb 2024 00:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D05DDC433B2;
 Tue, 13 Feb 2024 00:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707783592;
 bh=7ynkB4KuekvjZkQ7J+ZoqGj1ObfsvOxomf1rtb8eb44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BjyG5zde0/6FjWz3SggcmWOXSYfzPiNmInBST0SysY7/XiAmrzT84rT/XSiyDOmsF
 XpiIDT5LSa9wrVr3byVW4JpYzCYa/yz2IRK7UBA9rjArTUGeujecrHDoYlOc1of30C
 S9Q++y9uU0dZSThrai54S8mO7IhtycV8FYuyOJMm2HpaRRa9KfQblrYrWFapgu8Dl9
 h0q0BVe+PCrptQlBpbjy2FwIC8u2VZ1qoLMVQQGQ0F9Y0AdTU66oWtgAAYpdOLIL3j
 bp6Qo5dISKvAKneE/7IjWK2/ncaPeWFsHY9V4LbFL93XOfCKFqqs+UcsJiCZ7Tg9Yr
 Yu3yWbV4xfU8Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krystian Pradzynski <krystian.pradzynski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Sasha Levin <sashal@kernel.org>,
 stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.7 45/58] accel/ivpu/40xx: Stop passing SKU boot
 parameters to FW
Date: Mon, 12 Feb 2024 19:17:51 -0500
Message-ID: <20240213001837.668862-45-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213001837.668862-1-sashal@kernel.org>
References: <20240213001837.668862-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.4
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Krystian Pradzynski <krystian.pradzynski@intel.com>

[ Upstream commit 553099da45397914a995dce6307d6c26523c2567 ]

This parameter was never used by the 40xx FW.

Signed-off-by: Krystian Pradzynski <krystian.pradzynski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240126122804.2169129-7-jacek.lawrynowicz@linux.intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/ivpu/ivpu_hw_40xx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index 8a7440bcd6df..a7c976256ed3 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -700,7 +700,6 @@ static int ivpu_hw_40xx_info_init(struct ivpu_device *vdev)
 {
 	struct ivpu_hw_info *hw = vdev->hw;
 	u32 tile_disable;
-	u32 tile_enable;
 	u32 fuse;
 
 	fuse = REGB_RD32(VPU_40XX_BUTTRESS_TILE_FUSE);
@@ -721,10 +720,6 @@ static int ivpu_hw_40xx_info_init(struct ivpu_device *vdev)
 	else
 		ivpu_dbg(vdev, MISC, "Fuse: All %d tiles enabled\n", TILE_MAX_NUM);
 
-	tile_enable = (~tile_disable) & TILE_MAX_MASK;
-
-	hw->sku = REG_SET_FLD_NUM(SKU, HW_ID, LNL_HW_ID, hw->sku);
-	hw->sku = REG_SET_FLD_NUM(SKU, TILE, tile_enable, hw->sku);
 	hw->tile_fuse = tile_disable;
 	hw->pll.profiling_freq = PLL_PROFILING_FREQ_DEFAULT;
 
-- 
2.43.0

