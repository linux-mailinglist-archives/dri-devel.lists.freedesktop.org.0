Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CC6313BCE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 18:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F6F6E982;
	Mon,  8 Feb 2021 17:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E136E982;
 Mon,  8 Feb 2021 17:58:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A6BC64EB1;
 Mon,  8 Feb 2021 17:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612807115;
 bh=EBpvZxpRURzDPzWXZ1DQiaM8j4w4EjhTdJ0SgzLhDzA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WXeWiJej4x1RgTj7BiY/g+rLb4ww3L+GrMac/b3ynL6qPAzWqxTTKW1ka2W3axX5Z
 JiYNQ/UD7RIwCAlVFy7mQUrAFoNcM0MoTziG6dUvyNTxguTRuNFMMBI4rhvGSo4ASl
 5GATTKIEAH3OgcYsxK7qMBaa37EFOmiF0D7DEa3HhGIEP9m06ZWQD0lxh4QIEKDgb+
 X5LMH6dmuyfQjg4gTWUnEaOLX8iyrg1pbqW2dA0BO93i1ku6IdJSCtNqXdNwVFA7uC
 AUGMVofRR5LcAfJ6+XSbWW3SrbVfdNPtYrntT1aUdYN0gYaa+DKuLRrV/V2Zin6Jsw
 pxJNwYrMA+O3A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 21/36] drm/amd/display: Add more Clock Sources to
 DCN2.1
Date: Mon,  8 Feb 2021 12:57:51 -0500
Message-Id: <20210208175806.2091668-21-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210208175806.2091668-1-sashal@kernel.org>
References: <20210208175806.2091668-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Sung Lee <sung.lee@amd.com>,
 Anson Jacob <Anson.Jacob@amd.com>, amd-gfx@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sung Lee <sung.lee@amd.com>

[ Upstream commit 1622711beebe887e4f0f8237fea1f09bb48e9a51 ]

[WHY]
When enabling HDMI on ComboPHY, there are not
enough clock sources to complete display detection.

[HOW]
Initialize more clock sources.

Signed-off-by: Sung Lee <sung.lee@amd.com>
Reviewed-by: Tony Cheng <Tony.Cheng@amd.com>
Acked-by: Anson Jacob <Anson.Jacob@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index 20441127783ba..c993854404124 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -902,6 +902,8 @@ enum dcn20_clk_src_array_id {
 	DCN20_CLK_SRC_PLL0,
 	DCN20_CLK_SRC_PLL1,
 	DCN20_CLK_SRC_PLL2,
+	DCN20_CLK_SRC_PLL3,
+	DCN20_CLK_SRC_PLL4,
 	DCN20_CLK_SRC_TOTAL_DCN21
 };
 
@@ -1880,6 +1882,14 @@ static bool dcn21_resource_construct(
 			dcn21_clock_source_create(ctx, ctx->dc_bios,
 				CLOCK_SOURCE_COMBO_PHY_PLL2,
 				&clk_src_regs[2], false);
+	pool->base.clock_sources[DCN20_CLK_SRC_PLL3] =
+			dcn21_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL3,
+				&clk_src_regs[3], false);
+	pool->base.clock_sources[DCN20_CLK_SRC_PLL4] =
+			dcn21_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL4,
+				&clk_src_regs[4], false);
 
 	pool->base.clk_src_count = DCN20_CLK_SRC_TOTAL_DCN21;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
