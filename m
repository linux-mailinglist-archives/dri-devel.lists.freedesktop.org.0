Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A16522E11FC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D76B6E8BB;
	Wed, 23 Dec 2020 02:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974286E8B8;
 Wed, 23 Dec 2020 02:20:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6241422AAF;
 Wed, 23 Dec 2020 02:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608690018;
 bh=1Ak0DNfpo2bDXa6xfS4gXunyiBMMc+ttsGorulc+4hM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s3Xjnx+gbnFrk1XHGyi3ANCh9plPZZdDIpyoctZDePaF5liDCNY2U90I7XJTzISZu
 P+I8NRUVCzI30qLx8Tbov1tEVpSUwNBlAmx4MuJC/ishTXGvPfBHSy+oztwDTGoL9O
 e//2B4vYd0bKh4A+1Aq+ZIfYJ9KSddBfuN8m/ukyZ3EX5bF5hFA/jEwd/To5gxA17d
 nGLYr8DD8p5HUz6dUtQfyers+y/P6FlEYVpmORgccCSLafCo4nB73eTXW2FPpq0m+1
 m+kRcTXHllbTc/ccYM6uTHKyVGxIDlCuRD2ezS3AHuEQwI8JNNQIYP/LHeA2GGWVoL
 TYmeawN2LMsDg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 096/130] drm/amd/display: Revert DCN2.1
 dram_clock_change_latency update
Date: Tue, 22 Dec 2020 21:17:39 -0500
Message-Id: <20201223021813.2791612-96-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021813.2791612-1-sashal@kernel.org>
References: <20201223021813.2791612-1-sashal@kernel.org>
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
 Eryk Brol <eryk.brol@amd.com>, amd-gfx@lists.freedesktop.org,
 Yongqiang Sun <yongqiang.sun@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Strauss <michael.strauss@amd.com>

[ Upstream commit 3abad347c432b9f5904cfad40f417d5cff90300c ]

[Why]
New value breaks VSR on high refresh panels, reverting until a fix is developed

Signed-off-by: Michael Strauss <michael.strauss@amd.com>
Signed-off-by: Sung Lee <sung.lee@amd.com>
Reviewed-by: Yongqiang Sun <yongqiang.sun@amd.com>
Acked-by: Eryk Brol <eryk.brol@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index a6d5beada6634..bb7add5ea2273 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -257,7 +257,7 @@ struct _vcs_dpi_soc_bounding_box_st dcn2_1_soc = {
 	.num_banks = 8,
 	.num_chans = 4,
 	.vmm_page_size_bytes = 4096,
-	.dram_clock_change_latency_us = 11.72,
+	.dram_clock_change_latency_us = 23.84,
 	.return_bus_width_bytes = 64,
 	.dispclk_dppclk_vco_speed_mhz = 3600,
 	.xfc_bus_transport_time_us = 4,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
