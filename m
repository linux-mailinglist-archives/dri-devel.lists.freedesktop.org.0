Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD885233E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 01:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BEF10E509;
	Tue, 13 Feb 2024 00:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tCzvuuO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142A110E4EA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 00:21:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5D84DCE1877;
 Tue, 13 Feb 2024 00:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB41C433F1;
 Tue, 13 Feb 2024 00:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707783713;
 bh=kcc+u4KbzlVoh42OFnpyRdLSr+gaYAJJhrBWSqfzEzc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tCzvuuO0vRQ1zy/FMT8mFTmEwcH5i+5GSp1wq9xk8YKaledffqjymlSrQv6h+A6Z8
 U+whXiaJstnbrHE9BkziOWB1uef7LN03ZTfuI7d1PxBU59hvyprLsIt3oQRvlhb5WZ
 CwL8S5pnU93DiTjJU0vwM+5OKL9SevWqakR7LaCZiBhvGrfBXo4eJUPB+wdGHVpdUl
 XMC4X0CW3QNM6hco8AFquWIHlh47ICAggZQjHNyduh46XF5gTX9D9IebnWGeH4MQcs
 tu7oUvBfW454f6zvLeR5PHZ1/MICQIPLz9QZmHgwyqpQgnkafcEg6yVit47ysryrFq
 tKkgtcSCujZlA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krystian Pradzynski <krystian.pradzynski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Sasha Levin <sashal@kernel.org>,
 stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 39/51] accel/ivpu/40xx: Stop passing SKU boot
 parameters to FW
Date: Mon, 12 Feb 2024 19:20:16 -0500
Message-ID: <20240213002052.670571-39-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213002052.670571-1-sashal@kernel.org>
References: <20240213002052.670571-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.16
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
index 65c6a82bb13f..ae6be0d5aacc 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -697,7 +697,6 @@ static int ivpu_hw_40xx_info_init(struct ivpu_device *vdev)
 {
 	struct ivpu_hw_info *hw = vdev->hw;
 	u32 tile_disable;
-	u32 tile_enable;
 	u32 fuse;
 
 	fuse = REGB_RD32(VPU_40XX_BUTTRESS_TILE_FUSE);
@@ -718,10 +717,6 @@ static int ivpu_hw_40xx_info_init(struct ivpu_device *vdev)
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

