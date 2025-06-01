Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58232ACA176
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 01:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD55D10E39E;
	Sun,  1 Jun 2025 23:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GYjN0vkr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E873010E39D;
 Sun,  1 Jun 2025 23:27:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7E3665C184E;
 Sun,  1 Jun 2025 23:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDFAC4CEE7;
 Sun,  1 Jun 2025 23:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748820447;
 bh=teZ66iDlo8eFvBLlCsLct0azjVmbG8Hghmp7vSoiMig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GYjN0vkrGJ2lSPOs2AEynKjf/NcX1Sd4IoXr3lMrAGocxGuRId7lIBowjGKJWqb3n
 GdwnKqJmdldXtRduZh2eZ2ilrLLv0FqFSnPg2FYX8rlFefUgdNRolLpYF6Qes+qUX3
 89Q9J188RkMyPTSakNj20DrBabm8W/G2drv7Nqr27LFuYPObDx1LF9hiQ3rUf/qZKV
 Jb4UCmtCsaF9i3o9pUp2321UjDeJSzlp5nxjjiG8gYBhOgdqXxpK3rloIyMYMrYNyM
 MNk293bxm75N8xnVXrU5OSLRSoEwOa+eSgsG/5FsD6ahsXo05SxGhFlMDrmn8MnIcx
 6/EatpEIKx84A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Samson Tam <Samson.Tam@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Ray Wu <ray.wu@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, jun.lei@amd.com,
 Navid.Assadian@amd.com, alex.hung@amd.com, wenjing.liu@amd.com,
 Relja.Vojvodic@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 060/110] drm/amd/display: disable EASF narrow
 filter sharpening
Date: Sun,  1 Jun 2025 19:23:42 -0400
Message-Id: <20250601232435.3507697-60-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Samson Tam <Samson.Tam@amd.com>

[ Upstream commit c8d7e0be8183f4375a5cf5c3efd0c678129ea4de ]

[Why & How]
Default should be 1 to disable EASF narrow filter sharpening.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Samson Tam <Samson.Tam@amd.com>
Signed-off-by: Ray Wu <ray.wu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Now I have a complete picture. Based on my analysis, I can provide the
final backporting recommendation: ## **BACKPORTING ANALYSIS:
drm/amd/display: disable EASF narrow filter sharpening** ###
**RECOMMENDATION: YES** ### **Analysis Summary:** **Commit Details:** -
**Commit ID:** c8d7e0be8183f4375a5cf5c3efd0c678129ea4de - **Author:**
Samson Tam <Samson.Tam@amd.com> - **Date:** Thu May 1 15:59:47 2025
-0400 - **Subject:** drm/amd/display: disable EASF narrow filter
sharpening - **Files Changed:**
`drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c` (2 lines) **Technical
Changes:** The commit makes a simple but important change: - **Line
1302:** `easf_v_sharp_factor = 0` → `easf_v_sharp_factor = 1` - **Line
1466:** `easf_h_sharp_factor = 0` → `easf_h_sharp_factor = 1` **Why This
Is A Bug Fix:** 1. **Intent vs Implementation Mismatch:** The commit
message clearly states "Default should be 1 to disable EASF narrow
filter sharpening" 2. **Hardware Behavior:** These sharp_factor
variables control AMD display hardware's 2-tap sharp filtering: - Value
0001-Fix-Clippy-warnings.patch 0002-Enhance-inference-prompt-to-utilize-
CVEKERNELDIR-whe.patch 0003-Update-to-latest-version-of-clap.patch
drm_amd_display_vertical_interrupt_dcn32_dcn401_backport_analysis.md =
sharpening **enabled** - Value 0001-Fix-Clippy-warnings.patch
drm_amd_display_vertical_interrupt_dcn32_dcn401_backport_analysis.md
gfx_v12_userq_eop_interrupt_handling_backport_analysis.md
verisilicon_av1_4k_analysis.md = sharpening **disabled** 3.
**Consistency Fix:** Prior to this fix, the code was unintentionally
enabling sharpening when it should have been disabled by default
**Stability and Risk Assessment:** - **LOW RISK:** Disables a feature
rather than enabling new functionality - **IMPROVES STABILITY:**
Prevents potential display artifacts from unwanted sharpening -
**MINIMAL SCOPE:** Only affects EASF (Edge Adaptive Scaler Filter)
narrow filter functionality - **WELL-TESTED:** Has proper review chain
(Reviewed-by: Alvin Lee, Tested-by: Daniel Wheeler) **Backporting
Criteria Analysis:** ✅ **Fixes Important Bug:** Corrects unintended
feature activation that could cause display issues ✅ **Minimal Risk:**
Simple value change, disables rather than enables functionality ✅ **No
New Features:** Pure bug fix, no new architectural changes ✅ **Well-
Contained:** Limited to AMD display driver's scaling/filtering subsystem
✅ **Stable Tree Appropriate:** Improves hardware behavior consistency
**Comparison to Historical Similar Commits:** Looking at the provided
historical commits that were marked "NO" for backporting: - Those were
typically **feature additions** or **complex policy changes** - This
commit is fundamentally different: it's a **simple bug fix** that
corrects default behavior - Unlike feature commits, this **improves
stability** by disabling problematic functionality **Conclusion:** This
commit should be backported to stable kernels. It fixes a bug where EASF
narrow filter sharpening was unintentionally enabled by default when
AMD's design intent was to have it disabled. The fix is low-risk, well-
tested, and improves display subsystem stability by preventing potential
artifacts from unwanted sharpening algorithms. **Final Answer: YES** -
This commit meets all criteria for stable kernel backporting.

 drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c b/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c
index 28348734d900c..124aaff890d21 100644
--- a/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c
+++ b/drivers/gpu/drm/amd/display/dc/sspl/dc_spl.c
@@ -1297,7 +1297,7 @@ static void spl_set_easf_data(struct spl_scratch *spl_scratch, struct spl_out *s
 	if (enable_easf_v) {
 		dscl_prog_data->easf_v_en = true;
 		dscl_prog_data->easf_v_ring = 0;
-		dscl_prog_data->easf_v_sharp_factor = 0;
+		dscl_prog_data->easf_v_sharp_factor = 1;
 		dscl_prog_data->easf_v_bf1_en = 1;	// 1-bit, BF1 calculation enable, 0=disable, 1=enable
 		dscl_prog_data->easf_v_bf2_mode = 0xF;	// 4-bit, BF2 calculation mode
 		/* 2-bit, BF3 chroma mode correction calculation mode */
@@ -1461,7 +1461,7 @@ static void spl_set_easf_data(struct spl_scratch *spl_scratch, struct spl_out *s
 	if (enable_easf_h) {
 		dscl_prog_data->easf_h_en = true;
 		dscl_prog_data->easf_h_ring = 0;
-		dscl_prog_data->easf_h_sharp_factor = 0;
+		dscl_prog_data->easf_h_sharp_factor = 1;
 		dscl_prog_data->easf_h_bf1_en =
 			1;	// 1-bit, BF1 calculation enable, 0=disable, 1=enable
 		dscl_prog_data->easf_h_bf2_mode =
-- 
2.39.5

