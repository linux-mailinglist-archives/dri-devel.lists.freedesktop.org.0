Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85F92E78CF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Dec 2020 14:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A8E89654;
	Wed, 30 Dec 2020 13:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B237589654;
 Wed, 30 Dec 2020 13:03:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DF1E224B0;
 Wed, 30 Dec 2020 13:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609333426;
 bh=7ig1rKJIVwtSJ8LzofyjMuBDe2lGk1Ll4z/G22TAaMI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rS2GMLPbFWUTp7Bzs9cVEJMAox7ew/QZ7fIKyue6V8VNbpRRefNWmLE4ouSkAhOWp
 gxdFU6h68h8+SD7nddDyefI5E7167+eX8DsDPOeAez6Mfd8ehD3rB9eRLY/WUNGVef
 yD74xeVeFlol6Ert/rQMRwiXirztoWZMmuCsjrVbrgP7WUS5rkat/N3l6DruKOdHA0
 33Mxd0kxLuuFRsFXi2/DOWcxDi118kpnf+s2VHmCvJV7R+90VDp7eMEseIsCUnXimF
 tQ+ac3uab2loGTfTfO1Hky2ryxBT6bVFRcIlysZSMxRR14/x+xdmBeXs0HZuvwThBT
 DUB0PrCuoA67A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 23/31] drm/amd/display: updated wm table for
 Renoir
Date: Wed, 30 Dec 2020 08:03:05 -0500
Message-Id: <20201230130314.3636961-23-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201230130314.3636961-1-sashal@kernel.org>
References: <20201230130314.3636961-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Jake Wang <haonan.wang2@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, amd-gfx@lists.freedesktop.org,
 Yongqiang Sun <yongqiang.sun@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jake Wang <haonan.wang2@amd.com>

[ Upstream commit 410066d24cfc1071be25e402510367aca9db5cb6 ]

[Why]
For certain timings, Renoir may underflow due to sr exit
latency being too slow.

[How]
Updated wm table for renoir.

Signed-off-by: Jake Wang <haonan.wang2@amd.com>
Reviewed-by: Yongqiang Sun <yongqiang.sun@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
index 6b431db146cd9..1c6e401dd4cce 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
@@ -704,24 +704,24 @@ static struct wm_table ddr4_wm_table_rn = {
 			.wm_inst = WM_B,
 			.wm_type = WM_TYPE_PSTATE_CHG,
 			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 10.12,
-			.sr_enter_plus_exit_time_us = 11.48,
+			.sr_exit_time_us = 11.12,
+			.sr_enter_plus_exit_time_us = 12.48,
 			.valid = true,
 		},
 		{
 			.wm_inst = WM_C,
 			.wm_type = WM_TYPE_PSTATE_CHG,
 			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 10.12,
-			.sr_enter_plus_exit_time_us = 11.48,
+			.sr_exit_time_us = 11.12,
+			.sr_enter_plus_exit_time_us = 12.48,
 			.valid = true,
 		},
 		{
 			.wm_inst = WM_D,
 			.wm_type = WM_TYPE_PSTATE_CHG,
 			.pstate_latency_us = 11.72,
-			.sr_exit_time_us = 10.12,
-			.sr_enter_plus_exit_time_us = 11.48,
+			.sr_exit_time_us = 11.12,
+			.sr_enter_plus_exit_time_us = 12.48,
 			.valid = true,
 		},
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
